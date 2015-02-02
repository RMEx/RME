#
# Cette partie concerne les scripts expérimentaux
#

=begin 
Implémentation de trucs potentiellement cool pour la future GUI
état tout à fait incumbatif, bien naturellement : c'est dans l'incubator.
=end

#==============================================================================
# ** Viewport
#------------------------------------------------------------------------------
#  Used when displaying sprites on one portion of the screen
#==============================================================================

class Viewport

  #--------------------------------------------------------------------------
  # * Public instances variables
  #--------------------------------------------------------------------------
  attr_accessor :elts
  attr_accessor :children
  attr_accessor :parent
  attr_accessor :disposed
  attr_reader   :def_rect
  #--------------------------------------------------------------------------
  # * alias
  #--------------------------------------------------------------------------
  alias_method :sdk_initialize, :initialize
  alias_method :sdk_dispose, :dispose
  alias_method :sdk_update, :update
  alias_method :disposed?, :disposed
  alias_method :true_ox=, :ox=
  alias_method :true_oy=, :oy=
  alias_method :true_rect, :rect
  alias_method :rect, :def_rect
  [:x, :y, :width, :height].each{|m| delegate :rect, m}
  [
    :in?,
    :hover?,
    :click?, 
    :press?, 
    :trigger?, 
    :repeat?, 
    :release?, 
    :mouse_x,
    :mouse_y
  ].each{|m| delegate :true_rect, m}
  #--------------------------------------------------------------------------
  # * Object initialize
  #--------------------------------------------------------------------------
  def initialize(*args)
    sdk_initialize(*args)
    @disposed = false
    @def_rect = true_rect.clone
    @children = []
    @parent = nil
    @elts = []
  end
  #--------------------------------------------------------------------------
  # * Enterbrain, you forget this
  #--------------------------------------------------------------------------
  def dispose
    @disposed = true
    sdk_dispose
  end
  #--------------------------------------------------------------------------
  # * Sets definition attributes
  #--------------------------------------------------------------------------
  def ox=(v);     @def_ox = v;      update_from_definition; end
  def oy=(v);     @def_oy = v;      update_from_definition; end
  def x=(v);      rect.x = v;       update_from_definition; end
  def y=(v);      rect.y = v;       update_from_definition; end
  def width=(v);  rect.width = v;   update_from_definition; end
  def height=(v); rect.height = v;  update_from_definition; end
  #--------------------------------------------------------------------------
  # * Gets ox, oy
  #--------------------------------------------------------------------------
  def ox; @def_ox ||= 0; end
  def oy; @def_oy ||= 0; end
  #--------------------------------------------------------------------------
  # * Gets coordinates relative to screen
  #--------------------------------------------------------------------------
  def screen_x
     return self.x unless @parent
     @parent.screen_x - @parent.ox + self.x
  end
  def screen_y
    return self.y unless @parent
    @parent.screen_y - @parent.oy + self.y
  end
  #--------------------------------------------------------------------------
  # * Pushes another viewport in self
  #--------------------------------------------------------------------------
  def <<(oth)
    oth.parent = self
    @children << oth
    oth.update_from_definition
    oth
  end
  #--------------------------------------------------------------------------
  # * Pushes self in another viewport
  #--------------------------------------------------------------------------
  def >>(oth)
    @parent = oth
    oth.children << self
    update_from_definition
    oth
  end
  #--------------------------------------------------------------------------
  # * Updates the viewport's visible area from the definition
  #--------------------------------------------------------------------------
  def update_from_definition
    if @parent
      a = @parent.true_rect
      min_x = [self.screen_x, a.x].max
      min_y = [self.screen_y, a.y].max
      max_x = [self.screen_x + self.width,  a.x + a.width ].min
      max_y = [self.screen_y + self.height, a.y + a.height].min
      true_rect.set(min_x, min_y, max_x-min_x, max_y-min_y)
      self.true_ox = self.ox + min_x - self.screen_x
      self.true_oy = self.oy + min_y - self.screen_y
    else
      true_rect.set(rect)
      self.true_ox = self.ox
      self.true_oy = self.oy
    end
    @children.each{|c| c.update_from_definition}
  end
  #--------------------------------------------------------------------------
  # * Append Sprites
  #--------------------------------------------------------------------------
  def append(s)
    @elts << (s)
  end
  #--------------------------------------------------------------------------
  # * Calcul height space
  #--------------------------------------------------------------------------
  def calc_height
    return rect.height if @elts.empty?
    v = @elts.max{|a, b| (a.y + a.rect.height) <=> (b.y + b.rect.height)}
    [(v.y+v.rect.height), rect.height].max
  end
  #--------------------------------------------------------------------------
  # * Calcul height space
  #--------------------------------------------------------------------------
  def calc_width
    return rect.width if @elts.empty?
    v = @elts.max{|a, b| (a.x + a.rect.width) <=> (b.x + b.rect.width)}
    [(v.x+v.rect.width), rect.width].max
  end
end

#==============================================================================
# ** Draggable
#------------------------------------------------------------------------------
#  Any Object responding to ":x, :y, :in?" can be draggable.
#  Simply by pushing itself into the Draggable.objects array.
#==============================================================================

module Draggable
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    attr_accessor :objects, :picked
    Draggable.objects = []
    Draggable.picked  = nil
    #--------------------------------------------------------------------------
    # * Drags the picked Object
    #--------------------------------------------------------------------------
    def <<(*obj)
      obj.each do |o|
        @objects << o
        o.extend(Draggable)
      end
    end
    alias :push :<<
    #--------------------------------------------------------------------------
    # * Finds and pick the first Object clicked
    #--------------------------------------------------------------------------
    def find
      @picked = @objects.find do |o|
        @checked = o
        (o.in?(Mouse.x, Mouse.y) &&
          !(o.respond_to?(:children) &&
            o.children.any? {|c| c.in?(Mouse.x, Mouse.y)}
            )
          )
      end
      return unless @picked
      @x_init = @picked.x
      @y_init = @picked.y
    rescue
      @objects.delete(@checked)
      find
    end
    #--------------------------------------------------------------------------
    # * Drags the picked Object
    #--------------------------------------------------------------------------
    def drag
      return unless @picked
      @picked.drag_viewport_instead ? o = @picked.viewport : o = @picked
      nx, ny = @x_init + Mouse.drag.ox, @y_init + Mouse.drag.oy
      if r = @picked.drag_restriction
        o.x = [[nx, r.x].max, r.x + r.width ].min
        o.y = [[ny, r.y].max, r.y + r.height].min
      else
        o.x, o.y = nx, ny
      end
    end
    #--------------------------------------------------------------------------
    # * Drops the last picked Object
    #--------------------------------------------------------------------------
    def drop
      @picked = nil
    end
  end

  #--------------------------------------------------------------------------
  # * Extend the draggable object's behaviour
  #--------------------------------------------------------------------------
  attr_accessor :drag_viewport_instead
  attr_accessor :drag_restriction

end

#==============================================================================
# ** Bilou
#------------------------------------------------------------------------------
#  Bilou is the best example for anything
#==============================================================================

class Bilou < Viewport
  def initialize(x,y,w,h,c,draggable=false)
    super(x,y,w,h)
    Draggable << self if draggable
    self.color = c
  end
end

=begin 
Implémentation des évènements communs dans le système de combat 
- Solution proposée par <Grim, Nuki>
  - Special thanks to Zeus81
- Etat : Incubé
=end

#==============================================================================
# ** RPG::CommonEvent
#------------------------------------------------------------------------------
#  The data class for common events.
#==============================================================================

class RPG::CommonEvent
  #--------------------------------------------------------------------------
  # * Define battle trigger
  #--------------------------------------------------------------------------
  def def_battle_trigger 
    return false if !@list[0] || @list[0].code != 355
    script = @list[0].parameters[0] + "\n"
    index = 1 
    while @list[index].code == 655
      script += @list[index].parameters[0] + "\n"
      index += 1
    end
    if script =~ /^\s*(in_battle)/
      potential_trigger = eval(script)
      return potential_trigger if potential_trigger.is_a?(Proc)
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * get battle trigger
  #--------------------------------------------------------------------------
  def battle_trigger
    @battle_trigger ||= def_battle_trigger
  end
  #--------------------------------------------------------------------------
  # * Is for battle
  #--------------------------------------------------------------------------
  def for_battle?
    !!battle_trigger
  end
end

#==============================================================================
# ** Game_Map
#------------------------------------------------------------------------------
#  This class handles maps. It includes scrolling and passage determination
# functions. The instance of this class is referenced by $game_map.
#==============================================================================

class Game_Map
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :incubator_pc, :parallel_common_events
  #--------------------------------------------------------------------------
  # * Get Array of Parallel Common Events
  #--------------------------------------------------------------------------
  def parallel_common_events
    incubator_pc.select {|e| e && !e.for_battle?}
  end
end

#==============================================================================
# ** Game_Interpreter
#------------------------------------------------------------------------------
#  An interpreter for executing event commands. This class is used within the
# Game_Map, Game_Troop, and Game_Event classes.
#==============================================================================

class Game_Interpreter
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :incubator_ce, :command_117
  #--------------------------------------------------------------------------
  # * Common Event
  #--------------------------------------------------------------------------
  def command_117
    return if $data_common_events[@params[0]].for_battle?
    incubator_ce
  end
end

#==============================================================================
# ** Game_Temp
#------------------------------------------------------------------------------
#  This class handles temporary data that is not included with save data.
# The instance of this class is referenced by $game_temp.
#==============================================================================

class Game_Temp
  class << self
    attr_accessor :in_battle
    attr_accessor :current_troop
    Game_Temp.in_battle = false
    Game_Temp.current_troop = 0
  end
end

#==============================================================================
# ** BattleManager
#------------------------------------------------------------------------------
#  This module manages battle progress.
#==============================================================================

module BattleManager
  class << self
    alias_method :incubator_setup, :setup 
    alias_method :incubator_end, :battle_end
    #--------------------------------------------------------------------------
    # * Setup
    #--------------------------------------------------------------------------
    def setup(*a)
      Game_Temp.in_battle = true
      Game_Temp.current_troop = a[0]
      incubator_setup(*a)
    end
    #--------------------------------------------------------------------------
    # * End Battle
    #     result : Result (0: Win 1: Escape 2: Lose)
    #--------------------------------------------------------------------------
    def battle_end(result)
      Game_Temp.in_battle = false
      Game_Temp.current_troop = -1
      incubator_end(result)
    end
  end
end

#==============================================================================
# ** Game_CommonEvent
#------------------------------------------------------------------------------
#  This class handles common events. It includes functionality for execution of
# parallel process events. It's used within the Game_Map class ($game_map).
#==============================================================================

class Game_CommonEvent
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :incubator_active?, :active? 
  #--------------------------------------------------------------------------
  # * Determine if Active State
  #--------------------------------------------------------------------------
  def active?
    return incubator_active? if not in_battle?
    @event.for_battle? && @event.battle_trigger.call()
  end
end

#==============================================================================
# ** Game_Troop
#------------------------------------------------------------------------------
#  This class handles enemy groups and battle-related data. Also performs
# battle events. The instance of this class is referenced by $game_troop.
#==============================================================================

class Game_Troop
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :incubator_setup, :setup
  alias_method :incubator_update, :update
  #--------------------------------------------------------------------------
  # * Setup
  #--------------------------------------------------------------------------
  def setup(troop_id)
    incubator_setup(troop_id)
    init_common_events
  end
  #--------------------------------------------------------------------------
  # * Initialize common events
  #--------------------------------------------------------------------------
  def init_common_events
    events = $data_common_events.select {|event| event && event.for_battle? }
    @common_events = events.map {|e| Game_CommonEvent.new(e.id)}
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    incubator_update
    event_update
  end
  #--------------------------------------------------------------------------
  # * Event Update
  #--------------------------------------------------------------------------
  def event_update
    @common_events.each {|e| e.update}
  end
end
