#
# Cette partie concerne les scripts expérimentaux
#

=begin 
Implémentation des évènements communs dans le système de combat 
- Solution proposée par <Grim, Nuki>
  - Special thanks to Zeus81
- Etat : Incubé
=end

#==============================================================================
# ** Viewport
#------------------------------------------------------------------------------
#  Used when displaying sprites on one portion of the screen
#==============================================================================

#==============================================================================
# ** Viewport
#------------------------------------------------------------------------------
#  Used when displaying sprites on one portion of the screen
#==============================================================================

class Viewport
  #--------------------------------------------------------------------------
  # * alias
  #--------------------------------------------------------------------------
  alias_method :sdk_initialize, :initialize
  #--------------------------------------------------------------------------
  # * Public instances variables
  #--------------------------------------------------------------------------
  attr_accessor :elts
  attr_accessor :children
  attr_accessor :parent
  attr_accessor :definition
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
  ].each{|m| delegate :rect, m}
  delegate_accessor :rect, :x 
  delegate_accessor :rect, :y
  delegate_accessor :rect, :width
  delegate_accessor :rect, :height

  #--------------------------------------------------------------------------
  # * Object initialize
  #--------------------------------------------------------------------------
  def initialize(*args)
    sdk_initialize(*args)
    @definition = Rect.new(rect.x,rect.y,rect.width,rect.height)
    @children = []
    @parent = nil
    @elts = []
  end

  #--------------------------------------------------------------------------
  # * append Sprites
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

  #--------------------------------------------------------------------------
  # * pushes another viewport in self
  #--------------------------------------------------------------------------
  def <<(oth)
    oth.parent = self
    @children << oth
    oth.update_from_definition
    oth
  end

  #--------------------------------------------------------------------------
  # * pushes self in another viewport
  #--------------------------------------------------------------------------
  def >>(oth)
    @parent = oth
    oth.children << self
    update_from_definition
    oth
  end

  def x=(v); @definition.x = v; update_from_definition; end
  def y=(v); @definition.y = v; update_from_definition; end
  def width=(v); @definition.width = v; update_from_definition; end
  def height=(v); @definition.height = v; update_from_definition; end

  def screen_x
    return @definition.x + @parent.screen_x + @parent.ox if @parent
    @definition.x
  end
  def screen_y
    return @definition.y + @parent.screen_y + @parent.oy if @parent
    @definition.y
  end
  def screen_x=(v)
    @definition.x = v
    @definition.x -= @parent.x + @parent.ox if @parent
    update_from_definition
  end
  def screen_y=(v)
    @definition.y = v
    @definition.y -= @parent.y + @parent.oy if @parent
    update_from_definition
  end

  def update_from_definition
    if @parent
      new_x = @definition.x + @parent.screen_x + @parent.ox
      new_y = @definition.y + @parent.screen_y + @parent.oy
      rect.x = [new_x, @parent.x].max
      rect.y = [new_y, @parent.y].max
      rect.width = [new_x + @definition.width, @parent.x + @parent.width].min - rect.x
      rect.height = [new_y + @definition.height, @parent.y + @parent.height].min - rect.y
    else
      rect.x = @definition.x
      rect.y = @definition.y
    end
    @children.each{|c| c.update_from_definition}
  end
end

#==============================================================================
# ** Bilou
#------------------------------------------------------------------------------
#  Experimental
#==============================================================================

class Bilou

  attr_accessor :sprite
  attr_accessor :viewport
  attr_accessor :draggable
  attr_accessor :dragging
  attr_accessor :children
  attr_accessor :parent
  attr_accessor :ancestors
  @@dragger = nil

  def initialize(x,y,w,h,c,draggable=false)
    @draggable = draggable
    @viewport = Viewport.new(x,y,w,h)
    @sprite = Sprite.new
    @sprite.bitmap = Bitmap.new(w,h)
    @sprite.bitmap.fill_rect(0,0,w,h,c)
    @sprite.viewport = @viewport
    @children = []
  end

  def update
    return unless @draggable
    if Mouse.dragging?
      if @@dragger == object_id
        @viewport.screen_x = @x_start_drag + Mouse.drag.ox
        @viewport.screen_y = @y_start_drag + Mouse.drag.oy
      elsif @@dragger == nil && @viewport.in?(Mouse.drag.start) &&
          ! @children.any? {|c| c.viewport.in?(Mouse.drag.start)}
        @x_start_drag = @viewport.screen_x
        @y_start_drag = @viewport.screen_y
        @@dragger = object_id
      end
    else
      @@dragger = nil if @@dragger
    end
  end

  def <<(oth)
    @viewport << oth.viewport
    @children << oth
    oth
  end

  def >>(oth)
    @viewport >> oth.viewport
    oth.children << self
    oth
  end

end

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
