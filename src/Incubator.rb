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

class Viewport
  #--------------------------------------------------------------------------
  # * Public instances variables
  #--------------------------------------------------------------------------
  attr_accessor :children
  attr_accessor :parent

  #--------------------------------------------------------------------------
  # * Object initialize
  #--------------------------------------------------------------------------
  def initialize(*args)
    sdk_initialize(*args)
    @elts = []
    @children = []
    @parent = nil
  end

  #--------------------------------------------------------------------------
  # * pushes another viewport in self
  #--------------------------------------------------------------------------
  def push(v)
    @children << (v)
    v.parent = self
  end
  alias :<< :push

  #--------------------------------------------------------------------------
  # * pushes self in another viewport
  #--------------------------------------------------------------------------
  def push_into(v)
    @parent = v
    v.children << self
  end
  alias :>> :push_into

  #--------------------------------------------------------------------------
  # * Update
  #--------------------------------------------------------------------------
  alias :rme_update_viewport :update
  def update
    inclusion if @parent != nil
    rme_update_viewport
  end

  def inclusion
    p "bilou"
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

  def initialize(x,y,w,h,c,draggable=true)
    @draggable = draggable
    @dragging = false
    @viewport = Viewport.new(x,y,w,h)
    @sprite = Sprite.new
    @sprite.bitmap = Bitmap.new(w,h)
    @sprite.bitmap.fill_rect(0,0,w,h,c)
    @sprite.viewport = @viewport
  end

  def update
    return unless @draggable
    if Mouse.dragging?
      if @dragging
        @viewport.x = @x_start_drag + Mouse.drag.ox
        @viewport.y = @y_start_drag + Mouse.drag.oy
      elsif @sprite.in?(Mouse.drag.start)
        @x_start_drag = @viewport.x
        @y_start_drag = @viewport.y
        @dragging = true
      end
    else
      @dragging = false
    end
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
