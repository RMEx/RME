# -*- coding: utf-8 -*-
#==============================================================================
# ** RME Evex
#------------------------------------------------------------------------------
#  With :
# Grim (original project)
# Nuki
# Raho
#  Help :
# Fabien
# Zeus81
# Joke
# Zangther
#------------------------------------------------------------------------------
# An RPGMaker's Event extension
#==============================================================================

#==============================================================================
# ** Cache
#------------------------------------------------------------------------------
#  This module loads graphics, creates bitmap objects, and retains them.
# To speed up load times and conserve memory, this module holds the
# created bitmap object in the internal hash, allowing the program to
# return preexisting objects when the same bitmap is requested again.
#==============================================================================

module Cache
  def self.map(map_id)
    return $game_map.map if $game_map && $game_map.map_id == map_id
    if !Game_Temp.cached_map || Game_Temp.cached_map[0] != map_id
      Game_Temp.cached_map =
        [map_id, load_data(sprintf("Data/Map%03d.rvdata2", map_id))]
    end
    return Game_Temp.cached_map[1]
  end
end


#==============================================================================
# ** L
#------------------------------------------------------------------------------
#  Label handling API
#==============================================================================

module L
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  extend self
  #--------------------------------------------------------------------------
  # * Returns a Game Label
  #--------------------------------------------------------------------------
  def [](key)
    return 0 if $game_labels[key].nil?
    $game_labels[key]
  end

  #--------------------------------------------------------------------------
  # * Modifies a Game Label
  #--------------------------------------------------------------------------
  def []=(key, value)
    $game_labels[key] = value
  end
end

#==============================================================================
# ** Game_Variables
#------------------------------------------------------------------------------
#  This class handles variables. It's a wrapper for the built-in class "Array."
# The instance of this class is referenced by $game_variables.
#==============================================================================

class Game_Variables
  #--------------------------------------------------------------------------
  # * Get Variable
  #--------------------------------------------------------------------------
  def [](variable_id)
    # Hack for retreive false values
    return 0 if @data[variable_id].nil?
    @data[variable_id]
  end
end


#==============================================================================
# ** V (special thanks to Nuki)
#------------------------------------------------------------------------------
#  Variable handling API
#==============================================================================

module V
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  extend self
  #--------------------------------------------------------------------------
  # * Returns a Game Variable
  #--------------------------------------------------------------------------
  def [](key)
    $game_variables[key]
  end

  #--------------------------------------------------------------------------
  # * Modifies a variable
  #--------------------------------------------------------------------------
  def []=(key, value)
    if key.is_a?(Range)
      key.each do |k|
        $game_variables[k] = value
      end
    else
      $game_variables[key] = value
    end
  end
end

#==============================================================================
# ** S (special thanks to Nuki)
#------------------------------------------------------------------------------
# Switch handling API
#==============================================================================

module S
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  extend self
  #--------------------------------------------------------------------------
  # * Returns a Game Switch
  #--------------------------------------------------------------------------
  def [](key)
    $game_switches[key] || false
  end
  #--------------------------------------------------------------------------
  # * Modifies a Game Switch
  #--------------------------------------------------------------------------
  def []=(key, value)
    if key.is_a?(Range)
      key.each do |k|
        $game_switches[k] = value.to_bool
      end
    else
      $game_switches[key] = value.to_bool
    end
  end
end

#==============================================================================
# ** SV (special thanks to Zeus81)
#------------------------------------------------------------------------------
#  self Variable handling API
#==============================================================================

module SV
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  extend self
  #--------------------------------------------------------------------------
  # * Returns a self Variable
  #--------------------------------------------------------------------------
  def [](*args, id)
    ev_id = args[-1] || Game_Interpreter.current_id
    map_id = args[-2] || Game_Interpreter.current_map_id
    $game_self_vars.fetch([map_id, ev_id, id], 0)
  end
  #--------------------------------------------------------------------------
  # * Modifies a self variable
  #--------------------------------------------------------------------------
  def []=(*args, id, value)
    ev_id = args[-1] || Game_Interpreter.current_id
    map_id = args[-2] || Game_Interpreter.current_map_id
    if id.is_a?(Range)
      id.each do |k|
        $game_self_vars[[map_id, ev_id, k]] = value
      end
    else
      $game_self_vars[[map_id, ev_id, id]] = value
    end
    $game_map.need_refresh = true
  end
end

#==============================================================================
# ** SL
#------------------------------------------------------------------------------
#  self Labels handling API
#==============================================================================

module SL
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  extend self
  #--------------------------------------------------------------------------
  # * Returns a self Variable
  #--------------------------------------------------------------------------
  def [](*args, id)
    ev_id = args[-1] || Game_Interpreter.current_id
    map_id = args[-2] || Game_Interpreter.current_map_id
    $game_self_labels.fetch([map_id, ev_id, id], 0)
  end
  #--------------------------------------------------------------------------
  # * Modifies a self variable
  #--------------------------------------------------------------------------
  def []=(*args, id, value)
    ev_id = args[-1] || Game_Interpreter.current_id
    map_id = args[-2] || Game_Interpreter.current_map_id
    $game_self_labels[[map_id, ev_id, id]] = value
    $game_map.need_refresh = true
  end
end

#==============================================================================
# ** SS (special thanks to Zeus81)
#------------------------------------------------------------------------------
#  Self Switches handling API
#==============================================================================

module SS
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  extend self
  #--------------------------------------------------------------------------
  # * map key
  #--------------------------------------------------------------------------
  def map_id_s(id)
    auth = ("A".."Z").to_a
    return id if auth.include?(id)
    return auth[id-1] if id.to_i.between?(1, 26)
    return "A"
  end
  private :map_id_s
  #--------------------------------------------------------------------------
  # * Returns a self switch
  #--------------------------------------------------------------------------
  def [](*args, id)
    ev_id = args[-1] || Game_Interpreter.current_id
    map_id = args[-2] || Game_Interpreter.current_map_id
    key = [map_id, ev_id, map_id_s(id)]
    $game_self_switches[key]
  end
  #--------------------------------------------------------------------------
  # * Modifies a self switch
  #--------------------------------------------------------------------------
  def []=(*args, id, value)
    ev_id = args[-1] || Game_Interpreter.current_id
    map_id = args[-2] || Game_Interpreter.current_map_id
    key = [map_id, ev_id, map_id_s(id)]
    $game_self_switches[key] = value.to_bool
    $game_map.need_refresh = true
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
# ** Game_Temp
#------------------------------------------------------------------------------
#  This class handles temporary data that is not included with save data.
# The instance of this class is referenced by $game_temp.
#==============================================================================

class Game_Temp
  class << self
    attr_accessor :in_battle
    attr_accessor :current_troop
    attr_accessor :cached_map
    Game_Temp.in_battle = false
    Game_Temp.current_troop = 0
  end
  attr_accessor :last_used_item
end


#==============================================================================
# ** BattleManager
#------------------------------------------------------------------------------
#  This module manages battle progress.
#==============================================================================

module BattleManager
  class << self
    alias_method :extender_setup, :setup
    alias_method :extender_end, :battle_end
    #--------------------------------------------------------------------------
    # * Setup
    #--------------------------------------------------------------------------
    def setup(*a)
      Game_Temp.in_battle = true
      Game_Temp.current_troop = a[0]
      extender_setup(*a)
    end
    #--------------------------------------------------------------------------
    # * End Battle
    #     result : Result (0: Win 1: Escape 2: Lose)
    #--------------------------------------------------------------------------
    def battle_end(result)
      Game_Temp.in_battle = false
      Game_Temp.current_troop = -1
      extender_end(result)
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
  alias_method :extender_active?, :active?
  #--------------------------------------------------------------------------
  # * Determine if Active State
  #--------------------------------------------------------------------------
  def active?
    return extender_active? if not in_battle?
    @event.for_battle? && @event.battle_trigger.call()
  end
end

#==============================================================================
# ** Game_Battler
#------------------------------------------------------------------------------
#  A battler class with methods for sprites and actions added. This class
# is used as a super class of the Game_Actor class and Game_Enemy class.
#==============================================================================

class Game_Battler < Game_BattlerBase
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :old_use_item, :use_item
  #--------------------------------------------------------------------------
  # * Memorize item ID
  #--------------------------------------------------------------------------
  def use_item(item)
    $game_temp.last_used_item = item.id
    old_use_item(item)
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
  alias_method :extender_setup, :setup
  alias_method :extender_update, :update
  #--------------------------------------------------------------------------
  # * Setup
  #--------------------------------------------------------------------------
  def setup(troop_id)
    extender_setup(troop_id)
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
    extender_update
    event_update
  end
  #--------------------------------------------------------------------------
  # * Event Update
  #--------------------------------------------------------------------------
  def event_update
    @common_events.each {|e| e.update}
  end
end


#==============================================================================
# ** Kernel
#------------------------------------------------------------------------------
#  Object class methods are defined in this module.
#  This ensures compatibility with top-level method redefinition.
#==============================================================================

module Kernel
  #--------------------------------------------------------------------------
  # * Define an onload behaviour
  #--------------------------------------------------------------------------
  def map_onload(*ids, &block)
    Game_Map.onload(ids, &block)
  end
  #--------------------------------------------------------------------------
  # * Define an onRunning behaviour
  #--------------------------------------------------------------------------
  def map_onprogress(*ids, &block)
    Game_Map.onprogress(ids, &block)
  end

  #--------------------------------------------------------------------------
  # * Define custom Trigger
  #--------------------------------------------------------------------------
  def trigger(&block)
    block
  end

  def store_action(key, t, &a)
    Handler.store(key, t, a)
  end

  alias_method :listener, :trigger
  alias_method :action, :trigger
  alias_method :ignore_left, :trigger
  #--------------------------------------------------------------------------
  # * Trigger true
  #--------------------------------------------------------------------------
  def always_run
    true
  end
  #--------------------------------------------------------------------------
  # * Trigger in battle
  #--------------------------------------------------------------------------
  def in_battle(&block)
    return lambda{|*id| true} unless block_given?
    block
  end
  #--------------------------------------------------------------------------
  # * Current battle troop
  #--------------------------------------------------------------------------
  def current_troop; Game_Temp.current_troop; end
  #--------------------------------------------------------------------------
  # * check if in battle
  #--------------------------------------------------------------------------
  def in_battle?
    Game_Temp.in_battle
  end
  #--------------------------------------------------------------------------
  # * Cast Events args
  #--------------------------------------------------------------------------
  def select_events(e)
    return [e] if e.is_a?(Fixnum)
    return [e] if e.is_a?(Array) && e[0] == :follower && e.length == 2
    e
  end
  alias_method :select_pictures, :select_events
  #--------------------------------------------------------------------------
  # * All selector
  #--------------------------------------------------------------------------
  def all_events
    events(:all_events)
  end
  #--------------------------------------------------------------------------
  # * Selectors
  #--------------------------------------------------------------------------
  def all_pictures
    a = $game_map.screen.pictures.to_a.select{|pict| !pict.name.empty?}
    a.map {|i| i.number}
  end
  def get_pictures(*ids, &block)
    return [] unless SceneManager.scene.is_a?(Scene_Map)
    if ids.length == 1 && ids[0] == :all_pictures
      return all_pictures
    end
    result = []
    ids.each { |id| result << id if all_pictures.include?(id) }
    result += all_pictures.select(&block) if block_given?
    result
  end
  def events(*ids, &block)
    return [] unless SceneManager.scene.is_a?(Scene_Map)
    if ids.length == 1 && ids[0] == :all_events
      return $game_map.each_events
    end
    result = []
    ids.each{|id| result << id if $game_map.each_events[id]}
    result += $game_map.each_events.select(&block) if block_given?
    result
  end

  alias :e :events
  alias :get_events :events

  def once_event(&block)
    $game_map.each_events.find(&block)
  end
  def once_random_event(&block)
    $game_map.each_events.dup.shuffle.find(&block)
  end
end

#==============================================================================
# ** Module
#------------------------------------------------------------------------------
#  A Module is a collection of methods and constants.
#  The methods in a module may be instance methods or module methods.
#==============================================================================

class Module
  #--------------------------------------------------------------------------
  # * Add Commands to Command Collection
  #--------------------------------------------------------------------------
  def append_commands
    Command.send(:extend, self)
    Game_Interpreter.send(:include, self)
  end
  #--------------------------------------------------------------------------
  # * Public Command Interface
  #--------------------------------------------------------------------------
  def include_commands
    include Generative::CommandAPI
    include Command
  end
end


#==============================================================================
# ** Window movement
#------------------------------------------------------------------------------
#  Window handler
#==============================================================================

module Window_Movement

  #--------------------------------------------------------------------------
  # * Public instance variable
  #--------------------------------------------------------------------------
  attr_accessor :target_opacity, :target_x, :target_y, :target_tone
  attr_accessor :target_width, :target_height, :opacity_duration
  attr_accessor :pos_duration, :size_duration, :tone_duration

  #--------------------------------------------------------------------------
  # * Init public member
  #--------------------------------------------------------------------------
  def init_target
    @target_opacity = self.opacity
    @target_x = self.x
    @target_y = self.y
    @target_tone = self.tone
    @target_width = self.width
    @target_height = self.height
    @opacity_duration = @pos_duration = 0
    @size_duration = @tone_duration = 0
  end

  #--------------------------------------------------------------------------
  # * module update
  #--------------------------------------------------------------------------
  def mod_update
    mod_update_opacity
    mod_update_pos
    mod_update_size
    mod_update_tone
  end

  def move_position(x, y, duration)
    @target_x = x
    @target_y = y
    @pos_duration = duration
  end

  def move_opacity(op, duration)
    @target_opacity = op
    @opacity_duration = duration
  end

  def move_size(w, h, duration)
    @target_width = w
    @target_height = h
    @size_duration = duration
  end

  def move_tone(t, duration)
    @target_tone = t
    @tone_duration = duration
  end

  def extra_move(x, y, w, h, op, duration, tone = nil)
    move_position(x, y, duration)
    move_opacity(op, duration)
    move_size(w, h, duration)
    move_tone(tone, duration) if tone
  end

  #--------------------------------------------------------------------------
  # * Update opacity
  #--------------------------------------------------------------------------
  def mod_update_opacity
    return if @opacity_duration <= 0
    d = @opacity_duration
    self.opacity = (self.opacity * (d - 1) + @target_opacity) / d
    self.contents_opacity = self.opacity
    @opacity_duration -= 1
  end

  #--------------------------------------------------------------------------
  # * Update position
  #--------------------------------------------------------------------------
  def mod_update_pos
    return if @pos_duration <= 0
    d = @pos_duration
    self.x = (self.x * (d - 1) + @target_x) / d
    self.y = (self.y * (d - 1) + @target_y) / d
    @pos_duration -= 1
  end

  #--------------------------------------------------------------------------
  # * Update Size
  #--------------------------------------------------------------------------
  def mod_update_size
    return if @size_duration <= 0
    d = @size_duration
    self.width  = (self.width   * (d - 1) + @target_width)  / d
    self.height = (self.height  * (d - 1) + @target_height)  / d
    @size_duration -= 1
  end

  #--------------------------------------------------------------------------
  # * Update Tone
  #--------------------------------------------------------------------------
  def mod_update_tone
    return if @tone_duration <= 0
    d = @tone_duration
    self.tone.red   = (self.tone.red   * (d - 1) + @target_tone.red)   / d
    self.tone.green = (self.tone.green * (d - 1) + @target_tone.green) / d
    self.tone.blue  = (self.tone.blue  * (d - 1) + @target_tone.blue)  / d
    self.tone.gray  = (self.tone.gray  * (d - 1) + @target_tone.gray)  / d
    @tone_duration -= 1
  end


end

#==============================================================================
# ** Area
#------------------------------------------------------------------------------
#  Area definition
#==============================================================================

module Area

  #==============================================================================
  # ** Common
  #------------------------------------------------------------------------------
  # Defining Common Area
  #==============================================================================

  class Common

    def hover?;         in?(Mouse.x, Mouse.y);                end
    def square_hover?;  in?(Mouse.square_x, Mouse.square_y);  end
    def click?;         hover? && Mouse.click?;               end
    def square_click?;  square_hover? && Mouse.click?;        end

    [:trigger?, :press?, :release?, :repeat?].each do |m|

      define_method(m) do |*k|
        k = k[0] || :mouse_left
        hover? && Mouse.send(m, k)
      end

      define_method("square_#{m}") do |*k|
        k = k[0] || :mouse_left
        square_hover? && Mouse.send("square_#{m}", k)
      end

    end

  end

  #==============================================================================
  # ** Rect
  #------------------------------------------------------------------------------
  # Defining rectangular areas
  #==============================================================================

  class Rect < Common
    #--------------------------------------------------------------------------
    # * Constructor
    #--------------------------------------------------------------------------
    def initialize(x, y, w, h)
      @sprite = nil
      @color = Color.new(Kernel.rand(255), Kernel.rand(255),Kernel.rand(255), 200)
      set(x, y, w, h)
    end
    #--------------------------------------------------------------------------
    # * Set values
    #--------------------------------------------------------------------------
    def set(x, y, w, h)
      @x, @y = x, y
      @width, @height = w, h
    end
    #--------------------------------------------------------------------------
    # * Check if point 's included in the area
    #--------------------------------------------------------------------------
    def in?(x, y)
      check_x = x.between?(@x, @x+@width)
      check_y = y.between?(@y, @y+@height)
      check_x && check_y
    end
    #--------------------------------------------------------------------------
    # * Render area
    #--------------------------------------------------------------------------
    def render
      if @sprite && @sprite.disposed?
        @sprite.dispose
      end
      @sprite = Sprite.new
      @sprite.bitmap = Bitmap.new(@width, @height)
      @sprite.x = @x
      @sprite.y = @y
      @sprite.bitmap.fill_rect(0, 0, @width, @height, @color)
    end
    def hide
      return unless @sprite || @sprite.disposed?
      @sprite.dispose
    end
  end

  #==============================================================================
  # ** Circle
  #------------------------------------------------------------------------------
  # Defining circular areas
  #==============================================================================

  class Circle < Common
    #--------------------------------------------------------------------------
    # * Constructor
    #--------------------------------------------------------------------------
    def initialize(x, y, r)
      set(x, y, r)
    end
    #--------------------------------------------------------------------------
    # * Edits the coordinates
    #--------------------------------------------------------------------------
    def set(x, y, r)
      @x, @y, @r = x, y, r
    end
    #--------------------------------------------------------------------------
    # * check if point 's include in the rect
    #--------------------------------------------------------------------------
    def in?(x, y)
      ((x-@x)**2) + ((y-@y)**2) <= (@r**2)
    end
  end

  #==============================================================================
  # ** Polygon
  #------------------------------------------------------------------------------
  # Defining polygonal areas
  #==============================================================================

  class Polygon < Common
    #--------------------------------------------------------------------------
    # * Constructor
    #--------------------------------------------------------------------------
    def initialize(points)
      set(points)
    end
    #--------------------------------------------------------------------------
    # * Edits the coordinates
    #--------------------------------------------------------------------------
    def set(points)
      @points = points
      @max = points.flatten.max
    end
    #--------------------------------------------------------------------------
    # * Finds the segment intersection function
    #--------------------------------------------------------------------------
    def intersectsegment(ax, ay, bx, by, ix, iy, px, py)
      dx, dy = bx - ax, by - ay
      ex, ey = px - ix, py - iy
      denominator = (dx*ey) - (dy*ex)
      return 0 if denominator == 0
      t = (ix*ey + ex*ay - ax*ey - ex*iy) / denominator
      return 0 if t < 0 || t >= 1
      u = (dx*ay - dx*iy - dy*ax + dy*ix) / denominator
      return 0 if u < 0 || u >= 1
      return 1
    end
    #--------------------------------------------------------------------------
    # * check if point 's include in the rect
    #--------------------------------------------------------------------------
    def in?(px, py)
      ix, iy = @max+100, @max+100
      nbintersections = 0
      @points.each_index do |index|
        ax, ay = *@points[index]
        bx, by = *@points[(index + 1) % @points.length]
        nbintersections += intersectsegment(ax, ay, bx, by, ix, iy, px, py)
      end
      return (nbintersections%2 == 1)
    end
  end

  #==============================================================================
  # ** Ellipse
  #------------------------------------------------------------------------------
  # Defining elliptic areas
  #==============================================================================

  class Ellipse < Common
    #--------------------------------------------------------------------------
    # * Constructor
    #--------------------------------------------------------------------------
    def initialize(x, y, width, height)
      set(x, y, width, height)
    end
    #--------------------------------------------------------------------------
    # * Edits the coordinates
    #--------------------------------------------------------------------------
    def set(x, y, width, height)
      @x, @y, @width, @height = x, y, width, height
    end
    #--------------------------------------------------------------------------
    # * check if point 's include in the rect
    #--------------------------------------------------------------------------
    def in?(x, y)
      w = ((x.to_f-@x.to_f)**2.0)/(@width.to_f/2.0)
      h = ((y.to_f-@y.to_f)**2.0)/(@height.to_f/2.0)
      w + h <= 1
    end
  end

end

#==============================================================================
# ** Handler
#------------------------------------------------------------------------------
#  Custom Event Handler
#==============================================================================

module Handler
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    #--------------------------------------------------------------------------
    # * Public instance variable
    #--------------------------------------------------------------------------
    attr_accessor :triggers
    Handler.triggers = {}
    #--------------------------------------------------------------------------
    # * Store a trigger
    #--------------------------------------------------------------------------
    def store(key, t, a)
      tri = Proc.new {|i| $game_map.interpreter.instance_exec i, &t}
      act = Proc.new {|i| $game_map.interpreter.instance_exec i, &a}
      Handler.triggers[key.to_sym] = Struct.new(:trigger, :action).new(tri, act)
    end
  end
  #--------------------------------------------------------------------------
  # * Event behaviour
  #--------------------------------------------------------------------------
  module Behaviour
    #--------------------------------------------------------------------------
    # * Setup Event Handler
    #--------------------------------------------------------------------------
    def setup_eHandler
      @table_triggers = {}
    end
    #--------------------------------------------------------------------------
    # * Unbinding process
    #--------------------------------------------------------------------------
    def unbind(key = nil)
      unless key
        setup_eHandler
        return
      end
      @table_triggers.keys.each {|k| @table_triggers[k] = 0}
    end
    #--------------------------------------------------------------------------
    # * Binding event
    #--------------------------------------------------------------------------
    def bind(key, n = -1)
      @table_triggers[key.to_sym] = n
    end
    #--------------------------------------------------------------------------
    # * Update events
    #--------------------------------------------------------------------------
    def update_eHandler
      @table_triggers.keys.each do |k|
        if @table_triggers[k] != 0
          return unless Handler.triggers[k]
          oth_id = @id
          b = Handler.triggers[k].trigger
          if $game_map.interpreter.instance_exec(oth_id, &b)
            a = Proc.new{Handler.triggers[k].action.(oth_id)}
            $game_map.interpreter.instance_eval(&a)
            @table_triggers[k] -= 1 if @table_triggers[k] > 0
          end
        end
      end
    end
    #--------------------------------------------------------------------------
    # * Get according sprite
    #--------------------------------------------------------------------------
    def k_sprite
      return nil unless SceneManager.scene.is_a?(Scene_Map)
      return nil unless SceneManager.scene.spriteset
      return nil unless @sprite_index
      SceneManager.scene.spriteset.character_sprites[@sprite_index]
    end
    #--------------------------------------------------------------------------
    # * Hover
    #--------------------------------------------------------------------------
    def hover?(pr = false)
      return false unless k_sprite
      k_sprite.hover?(pr)
    end
    #--------------------------------------------------------------------------
    # * Click
    #--------------------------------------------------------------------------
    def click?(pr = false)
      return false unless k_sprite
      k_sprite.click?(pr)
    end
    #--------------------------------------------------------------------------
    # * Press
    #--------------------------------------------------------------------------
    def press?(key = :mouse_left, pr = false)
      return false unless k_sprite
      k_sprite.press?(key, pr)
    end
    #--------------------------------------------------------------------------
    # * Trigger
    #--------------------------------------------------------------------------
    def trigger?(key = :mouse_left, pr = false)
      return false unless k_sprite
      k_sprite.trigger?(key, pr)
    end
    #--------------------------------------------------------------------------
    # * Repeat
    #--------------------------------------------------------------------------
    def repeat?(key = :mouse_left, pr = false)
      return false unless k_sprite
      k_sprite.repeat?(key, pr)
    end
    #--------------------------------------------------------------------------
    # * Release
    #--------------------------------------------------------------------------
    def release?(key = :mouse_left, pr = false)
      return false unless k_sprite
      k_sprite.release?(key, pr)
    end
  end
  #==============================================================================
  # ** API
  #------------------------------------------------------------------------------
  #  Command handling
  #==============================================================================
  module API
    #--------------------------------------------------------------------------
    # * Event
    #--------------------------------------------------------------------------
    def event(i)
      return $game_player if i == 0
      return $game_map.events[i] if $game_map.events[i]
      raise sprintf("Event %d doesn't exist", i)
    end
    #--------------------------------------------------------------------------
    # * Binding
    #--------------------------------------------------------------------------
    def bind(e, k, n= -1)
      e = select_events(e)
      e.each{|i|event(i).bind(k, n)}
    end
    #--------------------------------------------------------------------------
    # * UnBinding
    #--------------------------------------------------------------------------
    def unbind(e, k=nil)
      e = select_events(e)
      e.each{|i|event(i).unbind(k)}
    end
    #--------------------------------------------------------------------------
    # * Mouse Hover Event
    #--------------------------------------------------------------------------
    def mouse_hover_event?(e, pr = false)
      e = select_events(e)
      e.any?{|i|event(i).hover?(pr)}
    end
    #--------------------------------------------------------------------------
    # * clicked event
    #--------------------------------------------------------------------------
    def mouse_click_event?(e, pr = false)
      e = select_events(e)
      e.any?{|i|event(i).click?(pr)}
    end
    #--------------------------------------------------------------------------
    # * Pressed event
    #--------------------------------------------------------------------------
    def mouse_press_event?(e, k=:mouse_left, pr = false)
      e = select_events(e)
      e.any?{|i|event(i).press?(k, pr)}
    end
    #--------------------------------------------------------------------------
    # * Triggered event
    #--------------------------------------------------------------------------
    def mouse_trigger_event?(e, k=:mouse_left, pr = false)
      e = select_events(e)
      e.any?{|i|event(i).trigger?(k, pr)}
    end
    #--------------------------------------------------------------------------
    # * Repeated event
    #--------------------------------------------------------------------------
    def mouse_repeat_event?(e, k=:mouse_left, pr = false)
      e = select_events(e)
      e.any?{|i|event(i).repeat?(k, pr)}
    end
    #--------------------------------------------------------------------------
    # * Released event
    #--------------------------------------------------------------------------
    def mouse_release_event?(e, k=:mouse_left, pr = false)
      e = select_events(e)
      e.any?{|i|event(i).release?(k, pr)}
    end
    #--------------------------------------------------------------------------
    # * API for player
    #--------------------------------------------------------------------------
    [:hover, :click].each do |m|
      define_method("mouse_#{m}_player?"){ |*k|
        k = (k[0]) ? k[0] : false
        $game_player.send("#{m}?", k)
      }
    end
    [:press, :trigger, :repeat, :release].each do |m|
      define_method("mouse_#{m}_player?") do |*k|
        k = (k[0]) ? k[0] : :mouse_left
        r = (k[1]) ? k[1] : false
        $game_player.send("#{m}?", k, r)
      end
    end

    # EE4 compatibilities
    alias_method :mouse_clicked_event?, :mouse_click_event?
    alias_method :mouse_clicked_player?, :mouse_click_player?

    #--------------------------------------------------------------------------
    # * Load Commands
    #--------------------------------------------------------------------------
    append_commands
  end
end

#==============================================================================
# ** Game_Text
#------------------------------------------------------------------------------
#  Dynamic text representation
#==============================================================================

class Game_Text
  #--------------------------------------------------------------------------
  # * Public instance variable
  #--------------------------------------------------------------------------
  attr_reader :number
  attr_accessor :origin
  attr_accessor :x, :y
  attr_accessor :zoom_x, :zoom_y
  attr_accessor :opacity
  attr_accessor :angle
  attr_reader :blend_type
  attr_accessor :text_value
  attr_reader :profile
  attr_accessor :target_y, :target_x
  attr_accessor :target_zoom_x, :target_zoom_y
  attr_accessor :target_opacity
  attr_accessor :duration
  attr_accessor :opacity_duration
  #--------------------------------------------------------------------------
  # * Constructor
  #--------------------------------------------------------------------------
  def initialize(index)
    @moving = false
    @profile = nil
    @number = index
    init_basic
    init_target
    init_rotate
  end
  #--------------------------------------------------------------------------
  # * Set profile
  #--------------------------------------------------------------------------
  def profile=(p)
    @profile = get_profile(p)
  end
  #--------------------------------------------------------------------------
  # * Init basic values
  #--------------------------------------------------------------------------
  def init_basic
    @text_value = ""
    @origin = @x = @y = 0
    @zoom_x = @zoom_y = 100.0
    @opacity = 255.0
    @blend_type = 1
  end
  #--------------------------------------------------------------------------
  # * Init movement
  #--------------------------------------------------------------------------
  def init_target
    @target_x = @x
    @target_y = @y
    @target_zoom_x = @zoom_x
    @target_zoom_y = @zoom_y
    @target_opacity = @opacity
    @duration = @opacity_duration = 0
  end
  #--------------------------------------------------------------------------
  # * Init rotate
  #--------------------------------------------------------------------------
  def init_rotate
    @angle = 0
    @rotate_speed = 0
  end
  #--------------------------------------------------------------------------
  # * Display
  #--------------------------------------------------------------------------
  def show(text_value, profile, x, y, z_x = 100, z_y = 100, op = 255, bt = 0, ori = 0)
    @profile = get_profile(profile)
    @text_value = text_value.to_s
    @origin = ori
    @x = x.to_f
    @y = y.to_f
    @zoom_x = z_x.to_f
    @zoom_y = z_y.to_f
    @opacity = op.to_f
    @blend_type = bt
    init_target
    init_rotate
  end
  #--------------------------------------------------------------------------
  # * Move
  #--------------------------------------------------------------------------
  def move(duration, x = -1, y = -1, zoom_x = -1, zoom_y = -1, opacity = -1, blend_type = -1, origin = -1)
    @origin = origin unless origin == -1
    @target_x = x.to_f unless x == -1
    @target_y = y.to_f unless y == -1
    @target_zoom_x = zoom_x.to_f unless zoom_x == -1
    @target_zoom_y = zoom_y.to_f unless zoom_y == -1
    @target_opacity = opacity.to_f unless opacity == -1
    @blend_type = blend_type unless blend_type == -1
    @duration = duration
    @opacity_duration = duration
  end
  #--------------------------------------------------------------------------
  # * Change rotate
  #--------------------------------------------------------------------------
  def rotate(speed)
    @rotate_speed = speed
  end
  #--------------------------------------------------------------------------
  # * Erase text
  #--------------------------------------------------------------------------
  def erase
    @text_value = ""
    @profile = nil
    @origin = 0
  end
  #--------------------------------------------------------------------------
  # * Check if a text is erased
  #--------------------------------------------------------------------------
  def erased?
    !@profile
  end
  #--------------------------------------------------------------------------
  # * Update frame
  #--------------------------------------------------------------------------
  def update
    change = [@x, @y, @zoom_x, @zoom_y, @angle]
    update_move
    update_opacity
    update_rotate
    @moving = (change != [@x, @y, @zoom_x, @zoom_y, @angle])
  end
  #--------------------------------------------------------------------------
  # * Update movement
  #--------------------------------------------------------------------------
  def update_move
    return if @duration == 0
    d = @duration
    @x = (@x * (d - 1) + @target_x) / d
    @y = (@y * (d - 1) + @target_y) / d
    @zoom_x  = (@zoom_x  * (d - 1) + @target_zoom_x)  / d
    @zoom_y  = (@zoom_y  * (d - 1) + @target_zoom_y)  / d
    @duration -= 1
  end
  #--------------------------------------------------------------------------
  # * Update opacity
  #--------------------------------------------------------------------------
  def update_opacity
    return if @opacity_duration == 0
    d = @opacity_duration
    @opacity = (@opacity * (d - 1) + @target_opacity) / d
    @opacity_duration -= 1
  end
  #--------------------------------------------------------------------------
  # * Update rotate
  #--------------------------------------------------------------------------
  def update_rotate
    return if @rotate_speed == 0
    @angle += @rotate_speed / 2.0
    @angle += 360 while @angle < 0
    @angle %= 360
  end
  #--------------------------------------------------------------------------
  # * Text is moving ?
  #--------------------------------------------------------------------------
  def move?
    return @moving
  end
end

#==============================================================================
# ** Game_Texts
#------------------------------------------------------------------------------
#  Text's collection
#==============================================================================

class Game_Texts
  #--------------------------------------------------------------------------
  # * Constructor
  #--------------------------------------------------------------------------
  def initialize
    @data = []
  end
  #--------------------------------------------------------------------------
  # * Fresh id
  #--------------------------------------------------------------------------
  def fresh_id
    i = @data.find_index {|text| !text || text.erased? }
    return (i || @data.length)
  end
  #--------------------------------------------------------------------------
  # * Get a text
  #--------------------------------------------------------------------------
  def [](number)
    @data[number] ||= Game_Text.new(number)
  end
  #--------------------------------------------------------------------------
  # * Iterator
  #--------------------------------------------------------------------------
  def each
    @data.compact.each {|text| yield text } if block_given?
  end
end

#==============================================================================
# ** Light_Emitter
#------------------------------------------------------------------------------
#  The Abstract representation of a lightsource
#==============================================================================

class Light_Emitter

  attr_accessor :rayon, :intensity, :excluded, :fx

  def initialize(rayon, intensity, excluded = [], fx = {})
    @rayon = rayon
    @intensity = intensity
    @excluded = excluded
    @fx = fx
  end

end

#==============================================================================
# ** Game_CharacterBase
#------------------------------------------------------------------------------
#  This base class handles characters. It retains basic information, such as
# coordinates and graphics, shared by all characters.
#==============================================================================

class Game_CharacterBase
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    attr_accessor :last_clicked
    attr_accessor :last_pressed
    attr_accessor :last_triggered
    attr_accessor :last_released
    attr_accessor :last_repeated
    attr_accessor :last_hovered
  end
  #--------------------------------------------------------------------------
  # * alias
  #--------------------------------------------------------------------------
  alias :rm_extender_initialize          :initialize
  alias :rm_extender_init_public_members :init_public_members
  alias :rm_extender_update              :update
  attr_accessor :buzz
  attr_accessor :buzz_amplitude
  attr_accessor :buzz_length
  attr_accessor :move_speed
  attr_accessor :move_frequency
  attr_accessor :priority_type
  attr_accessor :through
  attr_accessor :trails
  attr_accessor :trails_prop
  attr_accessor :trails_signal
  attr_accessor :opacity
  attr_accessor :ox, :oy, :zoom_x, :zoom_y
  attr_accessor :move_succeed
  attr_accessor :light_emitter
  attr_accessor :tone
  attr_reader :id

  #--------------------------------------------------------------------------
  # * Initialisation du Buzzer
  #--------------------------------------------------------------------------
  def  setup_buzzer
    @buzz           = 0
    @buzz_amplitude = 0.1
    @buzz_length    = 16
  end
  #--------------------------------------------------------------------------
  # * Public instance variable
  #--------------------------------------------------------------------------
  attr_reader :rect
  attr_accessor :sprite_index
  #--------------------------------------------------------------------------
  # * Event Handling
  #--------------------------------------------------------------------------
  include Handler::Behaviour
  #--------------------------------------------------------------------------
  # * Object initialize
  #--------------------------------------------------------------------------
  def initialize
    @id = 0
    rm_extender_initialize
    @light_emitter = nil
    @zoom_x = @zoom_y = 100.0
    @rect = Rect.new(0,0,0,0)
    @sprite_index
    init_tone
  end

  #--------------------------------------------------------------------------
  # * Initialize Color Tone
  #--------------------------------------------------------------------------
  def init_tone
    @tone = Tone.new
    @tone_target = Tone.new
    @tone_duration = 0
  end

  #--------------------------------------------------------------------------
  # * Remove Emitter
  #--------------------------------------------------------------------------
  def remove_light_emitter
    @light_emitter = nil
  end

  #--------------------------------------------------------------------------
  # * restore ox oy
  #--------------------------------------------------------------------------
  def restore_oxy
    if tile_id > 0
      @ox = 16
      @oy = 32
    else
      bitmap = Cache.character(@character_name)
      sign = @character_name[/^[\!\$]./]
      if sign && sign.include?('$')
        cw = bitmap.width / 3
        ch = bitmap.height / 4
      else
        cw = bitmap.width / 12
        ch = bitmap.height / 8
      end
      @ox = cw / 2
      @oy = ch
    end
  end
  #--------------------------------------------------------------------------
  # * Initialize Public Member Variables
  #--------------------------------------------------------------------------
  def init_public_members
    rm_extender_init_public_members
    setup_eHandler
    @trails = 0
    @trails_signal = false
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    last_real_x = @real_x
    last_real_y = @real_y
    rm_extender_update
    update_scroll(last_real_x, last_real_y)
    update_eHandler
    Game_CharacterBase.last_hovered = @id if hover?
    Game_CharacterBase.last_clicked = @id if click?
    Game_CharacterBase.last_triggered = @id if trigger?
    Game_CharacterBase.last_released = @id if release?
    Game_CharacterBase.last_repeated = @id if repeat?
    Game_CharacterBase.last_pressed = @id if press?
    update_tone_change
  end
  #--------------------------------------------------------------------------
  # * Start Changing Color Tone
  #--------------------------------------------------------------------------
  def start_tone_change(tone, duration, ease=:InLinear)
    @tone.set_transition('red',   tone.red,   duration, ease)
    @tone.set_transition('green', tone.green, duration, ease)
    @tone.set_transition('blue',  tone.blue,  duration, ease)
    @tone.set_transition('gray',  tone.gray,  duration, ease)
  end
  #--------------------------------------------------------------------------
  # * Update Color Tone Change
  #--------------------------------------------------------------------------
  def update_tone_change
    @tone.update_transition('red')
    @tone.update_transition('green')
    @tone.update_transition('blue')
    @tone.update_transition('gray')
  end
  #--------------------------------------------------------------------------
  # * Scroll Processing
  #--------------------------------------------------------------------------
  def update_scroll(last_real_x, last_real_y)
    return if $game_map.target_camera != self
    ax1 = $game_map.adjust_x(last_real_x)
    ay1 = $game_map.adjust_y(last_real_y)
    ax2 = $game_map.adjust_x(@real_x)
    ay2 = $game_map.adjust_y(@real_y)
    $game_map.scroll_down (ay2 - ay1) if ay2 > ay1 && ay2 > center_y
    $game_map.scroll_left (ax1 - ax2) if ax2 < ax1 && ax2 < center_x
    $game_map.scroll_right(ax2 - ax1) if ax2 > ax1 && ax2 > center_x
    $game_map.scroll_up   (ay1 - ay2) if ay2 < ay1 && ay2 < center_y
  end
  #--------------------------------------------------------------------------
  # * X Coordinate of Screen Center
  #--------------------------------------------------------------------------
  def center_x
    (Graphics.width / 32 - 1) / 2.0
  end
  #--------------------------------------------------------------------------
  # * Y Coordinate of Screen Center
  #--------------------------------------------------------------------------
  def center_y
    (Graphics.height / 32 - 1) / 2.0
  end
  #--------------------------------------------------------------------------
  # * Set Map Display Position to Center of Screen
  #--------------------------------------------------------------------------
  def center(x, y)
    $game_map.set_display_pos(x - center_x, y - center_y)
  end

  #--------------------------------------------------------------------------
  # * Check if the event is adjacent to the map's border
  #--------------------------------------------------------------------------
  def adjacent_of_map_border?
    w = $game_map.width -1
    h = $game_map.height -1
    (self.x == 0 or self.x == w) or (self.y == 0 or self.y == h)
  end

  #--------------------------------------------------------------------------
  # * Move to x y coord
  #--------------------------------------------------------------------------
  def move_to_position(sx, sy, wait=false, no_through = false)
    return unless $game_map.passable?(sx,sy,0)
    route = Pathfinder.create_path(Point.new(sx, sy), self, no_through)
    self.force_move_route(route)
    Fiber.yield while self.move_route_forcing if wait
  end
  #--------------------------------------------------------------------------
  # * Get path length
  #--------------------------------------------------------------------------
  def get_path_length(x, y, noth=false)
    route = Pathfinder.create_path(Pathfinder::Goal.new(x, y), self, noth)
    return route.list.length
  end
  #--------------------------------------------------------------------------
  # * Jump to coord
  #--------------------------------------------------------------------------
  def jump_to(x, y, wait=true)
    t_w = @wait_jump
    @wait_jump = wait
    return false if t_w && jumping?
    x_plus, y_plus = x-@x, y-@y
    if x_plus.abs > y_plus.abs
      set_direction(x_plus < 0 ? 4 : 6) if x_plus != 0
    else
      set_direction(y_plus < 0 ? 8 : 2) if y_plus != 0
    end
    return unless @through || map_passable?(x, y, @direction)
    jump(x_plus, y_plus)
  end
  #--------------------------------------------------------------------------
  # * Event name
  #--------------------------------------------------------------------------
  def name
    ""
  end

  #--------------------------------------------------------------------------
  # * Eval sequence
  #--------------------------------------------------------------------------
  def eval(str, r=nil)
    Game_Interpreter.current_id = @id
    Game_Interpreter.current_map_id = $game_map.map_id
    script = str.gsub(/S(V|S)\[(\d+)\]/) { "S#{$1}[#{@id}, #{$2}]" }
    super(script, $game_map.interpreter.get_binding)
  end

end

#==============================================================================
# ** Game_Character
#------------------------------------------------------------------------------
#  A character class with mainly movement route and other such processing
# added. It is used as a super class of Game_Player, Game_Follower,
# GameVehicle, and Game_Event.
#==============================================================================

class Game_Character

  #--------------------------------------------------------------------------
  # * Move Toward position
  #--------------------------------------------------------------------------
  def move_toward_xy(x, y)
    sx = distance_x_from(x)
    sy = distance_y_from(y)
    if sx.abs > sy.abs
      move_straight(sx > 0 ? 4 : 6)
      move_straight(sy > 0 ? 8 : 2) if !@move_succeed && sy != 0
    elsif sy != 0
      move_straight(sy > 0 ? 8 : 2)
      move_straight(sx > 0 ? 4 : 6) if !@move_succeed && sx != 0
    end
  end
  #--------------------------------------------------------------------------
  # * Move Away from position
  #--------------------------------------------------------------------------
  def move_away_from_xy(x, y)
    sx = distance_x_from(x)
    sy = distance_y_from(y)
    if sx.abs > sy.abs
      move_straight(sx > 0 ? 6 : 4)
      move_straight(sy > 0 ? 2 : 8) if !@move_succeed && sy != 0
    elsif sy != 0
      move_straight(sy > 0 ? 2 : 8)
      move_straight(sx > 0 ? 6 : 4) if !@move_succeed && sx != 0
    end
  end
  #--------------------------------------------------------------------------
  # * Turn Toward position
  #--------------------------------------------------------------------------
  def turn_toward_xy(x, y)
    sx = distance_x_from(x)
    sy = distance_y_from(y)
    if sx.abs > sy.abs
      set_direction(sx > 0 ? 4 : 6)
    elsif sy != 0
      set_direction(sy > 0 ? 8 : 2)
    end
  end
  #--------------------------------------------------------------------------
  # * Turn Away from position
  #--------------------------------------------------------------------------
  def turn_away_from_xy(x, y)
    sx = distance_x_from(x)
    sy = distance_y_from(y)
    if sx.abs > sy.abs
      set_direction(sx > 0 ? 6 : 4)
    elsif sy != 0
      set_direction(sy > 0 ? 2 : 8)
    end
  end

end



#==============================================================================
# ** Game_Player
#------------------------------------------------------------------------------
#  This class handles the player. It includes event starting determinants and
# map scrolling functions. The instance of this class is referenced by
# $game_player.
#==============================================================================

class Game_Player
  #--------------------------------------------------------------------------
  # * Scroll Processing
  #--------------------------------------------------------------------------
  alias_method :rme_update_scroll, :update_scroll
  alias_method :rme_refresh, :refresh
  def update_scroll(last_real_x, last_real_y)
    return if $game_map.target_camera != self
    rme_update_scroll(last_real_x, last_real_y)
  end
  #--------------------------------------------------------------------------
  # * Checks if the player is erased.
  #--------------------------------------------------------------------------
  def erased?
    false
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    rme_refresh
    restore_oxy
  end
end

#==============================================================================
# ** Sprite_Shadow
#------------------------------------------------------------------------------
#  This sprite is used to display characters's Shadow
#==============================================================================

class Sprite_Shadow < Sprite_Character

end

#==============================================================================
# ** Sprite_Reflect
#------------------------------------------------------------------------------
#  This sprite is used to display characters's reflection
#==============================================================================

class Sprite_Reflect < Sprite_Character

  def initialize(*args, id, cases)
    @id = id
    @y_offset = compute_y_offset
    @base_opacity = 255
    @cases = cases
    super(*args)
  end

  def compute_y_offset
    return 0 unless @character
    return 1 if @character.priority_type != 2
    ev = $game_map.events_xy(@character.x, @character.y + 1)
    return 3 if !ev.empty? && ev[0].priority_type == 0
    2
  end

  def update_other; end
  def setup_new_effect; end

  def y_rect
    return 8 if src_rect.height > 32
    0
  end

  def need_erased?
    @character.transparent || @cases[:excluded].include?(@id)
  end

  def update
    if need_erased?
      self.visible = false
      return
    end
    self.visible = true
    @y_offset = compute_y_offset
    super()
    self.angle = 180
    self.mirror = true
    self.z = -100
    self.y = @character.screen_y + ((@y_offset - 1) * 32) - 2 - y_rect
    update_sprite_effect
    update_for(:terrains, :terrain_tag)
    update_for(:regions, :region_id)
  end

  def update_sprite_effect
    self.wave_amp = @cases[:wave_amp]
    self.wave_speed = @cases[:wave_speed]
    self.opacity = @cases[:opacity]
    self.tone = @cases[:tone]
  end

  def update_for(key, method)
    id = $game_map.send(method, @character.x, @character.y + @y_offset)
    if @cases[key].has_key?(id)
      reg = @cases[key][id]
      self.wave_amp = reg[:wave_amp] || @cases[:wave_amp]
      self.wave_speed = reg[:wave_speed] || @cases[:wave_speed]
      self.opacity = reg[:opacity] || @cases[:opacity]
      self.tone =  reg[:tone] || @cases[:tone]
    end
  end


end


#==============================================================================
# ** Sprite_Character
#------------------------------------------------------------------------------
#  This sprite is used to display characters. It observes an instance of the
# Game_Character class and automatically changes sprite state.
#==============================================================================

class Sprite_Character
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :rm_extender_update,      :update
  alias_method :rm_extender_initialize,  :initialize
  alias_method :rm_extender_dispose,     :dispose
  alias_method :rm_extender_set_character_bitmap,  :set_character_bitmap
  #--------------------------------------------------------------------------
  # * Object initialization
  #--------------------------------------------------------------------------
  def initialize(viewport, character = nil)
    @trails = []
    rm_extender_initialize(viewport, character)
    set_rect
    self.character.setup_buzzer if self.character
    @old_buzz = 0
    @origin_len_x = self.zoom_x
    @origin_len_y = self.zoom_y
  end
  #--------------------------------------------------------------------------
  # * Frame Update zoom
  #--------------------------------------------------------------------------
  def set_character_bitmap
    rm_extender_set_character_bitmap
    character.ox = self.ox
    character.oy = self.oy
    @old_buzz = 0
    @origin_len_x = self.zoom_x
  end
  #--------------------------------------------------------------------------
  # * Dispose trails
  #--------------------------------------------------------------------------
  def dispose_trails
    @trails.each {|trail| trail.dispose unless trail.disposed?}
    self.character.trails = 0 if self.character.trails_signal
    self.character.trails_signal = false
  end
  #--------------------------------------------------------------------------
  # * Set rect to dynamic layer
  #--------------------------------------------------------------------------
  def set_rect
    if character
      x_rect, y_rect = self.x-self.ox*self.zoom_x, self.y-self.oy*self.zoom_y
      w_rect, h_rect = self.src_rect.width*self.zoom_x, self.src_rect.height*self.zoom_y
      character.rect.set(x_rect, y_rect, w_rect, h_rect)
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    rm_extender_update
    return if disposed?
    set_rect
    update_zooms
    update_buzzer
    update_trails
    self.tone.set(character.tone)
  end
  #--------------------------------------------------------------------------
  # * Frame Update zoom
  #--------------------------------------------------------------------------
  def update_zooms
    return unless character
    self.zoom_x = character.zoom_x / 100.0
    self.zoom_y = character.zoom_y / 100.0
    self.ox = character.ox if character.ox
    self.oy = character.oy if character.oy
  end
  #--------------------------------------------------------------------------
  # * Update trails
  #--------------------------------------------------------------------------
  def update_trails
    if @trails.length != character.trails
      dispose_trails
      @trails = Array.new(character.trails) do |i|
        k = Sprite_Trail.new(viewport, character)
        k.opacity = (k.base_opacity+1) / character.trails * i
        k
      end
    end
    @trails.each do |trail|
      trail.update
      if self.character.trails_signal
        trail.dispose if !trail.disposed? && trail.opacity == 0
      end
    end
    f = self.character.trails_signal && @trails.all? {|tr| tr.disposed?}
    dispose_trails if f
  end
  #--------------------------------------------------------------------------
  # * Dispose
  #--------------------------------------------------------------------------
  def dispose
    dispose_trails
    rm_extender_dispose
  end
  #--------------------------------------------------------------------------
  # * Update buzzer
  #--------------------------------------------------------------------------
  def update_buzzer
    return if !self.character.buzz || self.character.buzz == 0
    if @old_buzz == 0
      @origin_len_x = self.zoom_x
      @origin_len_y = self.zoom_y
    end
    @old_buzz             = self.character.buzz
    len                   = self.character.buzz_length
    transformation        = Math.sin(@old_buzz*6.283/len)
    transformation        *= self.character.buzz_amplitude
    self.zoom_x           = @origin_len_x + transformation
    self.zoom_y           = @origin_len_y - transformation
    self.character.buzz   -= 1
    if self.character.buzz == 0
      self.zoom_x = @origin_len_x
      self.zoom_y = @origin_len_y
      @old_buzz = 0
    end
  end
end

#==============================================================================
# ** Sprite_Trail
#------------------------------------------------------------------------------
#  Character trail
#==============================================================================

class Sprite_Trail < Sprite_Base
  #--------------------------------------------------------------------------
  # * Object Initialization
  #     viewport  : viewport
  #     character : character (Game_Character)
  #--------------------------------------------------------------------------
  def initialize(viewport, chara)
    super(viewport)
    @timer = 0
    @character = chara
    self.opacity = 0
    process_prop
    self.z = @prop[:z]
    self.tone = @prop[:tone] if @prop[:tone]
    self.blend_type = @prop[:blend_type]
    @real_x = @real_y = 0
    update
  end

  #--------------------------------------------------------------------------
  # * Base opacity
  #--------------------------------------------------------------------------
  def base_opacity
    @prop[:opacity]
  end

  #--------------------------------------------------------------------------
  # * Process prop
  #--------------------------------------------------------------------------
  def process_prop
    if @character && @character.trails_prop
      @prop = Hash.new
      @prop[:opacity]     = @character.trails_prop[:opacity]    || 255
      @prop[:blend_type]  = @character.trails_prop[:blend_type] || 1
      @prop[:step]        = @character.trails_prop[:step]       || 0.5
      @prop[:z]           = @character.trails_prop[:z]          || 99
    else
      @prop = {
        opacity: 255,
        blend_type: 1,
        tone: Tone.new(200, 0, 0),
        step: 1,
        z: 99
      }
    end
  end

  #--------------------------------------------------------------------------
  # * Update
  #--------------------------------------------------------------------------
  def update
    return if disposed?
    if self.opacity <= 0
      super
      self.blend_type = @prop[:blend_type]
      update_bitmap
      update_src_rect
      update_position
      update
    end
    fact = (@prop[:opacity]+1.0) / (@character.trails - 1.0)
    self.opacity -= fact
    @prop[:udpate_callback].call(self) if @prop[:udpate_callback]
    @timer +=1
    @timer %= @prop[:step]
    self.x = $game_map.adjust_x(@real_x) * 32 + 16
    self.y = $game_map.adjust_y(@real_y) * 32 + 32 - 4 - @character.jump_height
  end

  #--------------------------------------------------------------------------
  # * Update position
  #--------------------------------------------------------------------------
  def update_position
    if @timer == 0
      @real_x = @character.real_x
      @real_y = @character.real_y
    end
  end

  #--------------------------------------------------------------------------
  # * Update bitmap
  #--------------------------------------------------------------------------
  def update_bitmap
    @character_name = @character.character_name
    @character_index = @character.character_index
    self.bitmap = Cache.character(@character_name)
    sign = @character_name[/^[\!\$]./]
    if sign && sign.include?('$')
      @cw = bitmap.width / 3
      @ch = bitmap.height / 4
    else
      @cw = bitmap.width / 12
      @ch = bitmap.height / 8
    end
    self.ox = @cw / 2
    self.oy = @ch
  end

  #--------------------------------------------------------------------------
  # * Update Transfer Origin Rectangle
  #--------------------------------------------------------------------------
  def update_src_rect
    self.visible =
      (not @character.transparent and @character.trails > 0 and @character.moving?)
    self.opacity = 0 unless @character.moving?
    index = @character.character_index
    pattern = @character.pattern < 3 ? @character.pattern : 1
    sx = (index % 4 * 3 + pattern) * @cw
    sy = (index / 4 * 4 + (@character.direction - 2) / 2) * @ch
    self.opacity = @prop[:opacity]
    self.src_rect.set(sx, sy, @cw, @ch)
  end

end

#==============================================================================
# ** Window_Base
#------------------------------------------------------------------------------
#  This is a super class of all windows within the game.
#==============================================================================

class Window_Base
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :rm_extender_convert_escape_characters, :convert_escape_characters
  alias_method :rm_extender_initialize, :initialize
  alias_method :rm_extender_update, :update
  #--------------------------------------------------------------------------
  # * Object Initialize
  #--------------------------------------------------------------------------
  def initialize(*args)
    rm_extender_initialize(*args)
    init_target
    self.opacity = $game_system.window_opacity
  end
  #--------------------------------------------------------------------------
  # * Frame update
  #--------------------------------------------------------------------------
  def update
    rm_extender_update
    mod_update
  end
  #--------------------------------------------------------------------------
  # * Preconvert Control Characters
  #    As a rule, replace only what will be changed into text strings before
  #    starting actual drawing. The character "\" is replaced with the escape
  #    character (\e).
  #--------------------------------------------------------------------------
  def convert_escape_characters(text)
    result = rm_extender_convert_escape_characters(text).to_s.clone
    result.gsub!(/\eL\[\:(\w+)\]/i) { L[$1.to_sym] }
    result.gsub!(/\eSL\[\:(\w+)\]/i) { SL[$game_message.call_event, $1.to_sym] }
    result.gsub!(/\eSL\[(\d+)\,\s*\:(\w+)\]/i) { SL[$1.to_i, $2.to_sym] }
    result.gsub!(/\eSL\[(\d+)\,\s*(\d+)\,\s*\:(\w+)\]/i) { SL[$1.to_i, $2.to_i, $3.to_sym] }
    result.gsub!(/\eSV\[([^\]]+)\]/i) do
      numbers = $1.extract_numbers
      array = [*numbers]
      if numbers.length == 1
        array = [$game_message.call_event] + array
      end
      SV[*array]
    end
    return result
  end
  #--------------------------------------------------------------------------
  # * Include Window movement
  #--------------------------------------------------------------------------
  include Window_Movement
  #--------------------------------------------------------------------------
  # * mouse_hover?
  #--------------------------------------------------------------------------
  def mouse_hover?
    posX = Mouse.x - self.x
    posY = Mouse.y - self.y
    posX -= viewport.x if (viewport)
    posY -= viewport.y if (viewport)
    return(posX.between?(0, self.width-1) && posY.between?(0, self.height-1))
  end
end

#==============================================================================
# ** Window_Text
#------------------------------------------------------------------------------
#  This message window is used to display text.
#==============================================================================

class Window_Text < Window_Base
  #--------------------------------------------------------------------------
  # * Public instances variables
  #--------------------------------------------------------------------------
  attr_accessor :profile
  attr_accessor :content
  #--------------------------------------------------------------------------
  # * Get Text box
  #--------------------------------------------------------------------------
  def textbox
    bmp = Bitmap.new(1, 1)
    bmp.font = get_profile(@profile.text_profile).to_font
    widths = Array.new
    heights = Array.new
    lines = @content
    lines = @content.split("\n") if @content.is_a?(String)
    lines = lines.collect{|k| convert_escape_characters(k)}
    lines.each do |line|
      r = bmp.text_size(line)
      widths << r.width
      heights << r.height
    end
    width, height = widths.max, heights.max
    total_height = height * lines.length
    [width, total_height, height]
  end
  #--------------------------------------------------------------------------
  # * Object Initialize
  #--------------------------------------------------------------------------
  def initialize(x, y, content, width, height, closed = nil)
    @profile = get_windowProfile("default")
    @content = content
    @w, @th, @h = *textbox
    width = @w + 2*standard_padding if width == -1
    height = @th + 2*standard_padding if height == -1
    super(x, y, width, height)
    refresh
    self.openness = 0 if closed
  end
  #--------------------------------------------------------------------------
  # * Profile accessor
  #--------------------------------------------------------------------------
  def profile=(k)
    @profile = get_windowProfile(k)
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh(flag = false)
    if flag
      @w, @th, @h = *textbox
      width = @w + 2*standard_padding
      height = @th + 2*standard_padding
      move(self.x, self.y, width, height)
    end
    init_bitmap
  end
  #--------------------------------------------------------------------------
  # * Init Bitmap
  #--------------------------------------------------------------------------
  def init_bitmap
    create_contents
    self.contents.font = get_profile(@profile.text_profile).to_font
    draw_text_content
  end
  #--------------------------------------------------------------------------
  # * Draw text content
  #--------------------------------------------------------------------------
  def draw_text_content
    i = 0
    lines = @content
    lines = lines.join("\n") if @content.is_a?(Array)
    draw_text_ex(0, i, lines)
  end
end

#==============================================================================
# ** Window_EvCommand
#------------------------------------------------------------------------------
#  This window deals with general command choices.
#==============================================================================

class Window_EvCommand < Window_Command
  #--------------------------------------------------------------------------
  # * Public instances variables
  #--------------------------------------------------------------------------
  attr_accessor :content
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(x, y, w, h, hash, closed = nil)
    @content = hash
    @ev_width, @ev_height = w, h
    super(x, y)
    self.openness = 0 if closed
    define_handlers
  end
  #--------------------------------------------------------------------------
  # * Define handlers
  #--------------------------------------------------------------------------
  def define_handlers
    @content.each do |key, value|
      action = value.respond_to?(:call) ? value : value[:action]
      actionProc = Proc.new{
        action.call
        self.activate
      }
      set_handler(key.to_sym, actionProc)
    end
  end
  #--------------------------------------------------------------------------
  # * Get Window Width
  #--------------------------------------------------------------------------
  def window_width
    return @ev_width
  end
  #--------------------------------------------------------------------------
  # * Get Number of Lines to Show
  #--------------------------------------------------------------------------
  def visible_line_number
    @ev_height
  end
  #--------------------------------------------------------------------------
  # * Create Command List
  #--------------------------------------------------------------------------
  def make_command_list
    @content.each do |key, value|
      if value.respond_to?(:call)
        e = true
      else
        e = value.has_key?(:enabled?) ? value[:enabled?] : true
      end
      self.add_command(key, key.to_sym, e)
    end
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh(resize = false)
    if resize
      @ev_height = @content.size
      self.height = window_height
    end
    super()
    define_handlers
    select(0)
  end
end

#==============================================================================
# ** Window_HorzCommand
#------------------------------------------------------------------------------
#  This is a command window for the horizontal selection format.
#==============================================================================

class Window_EvHorzCommand < Window_EvCommand
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(x, y, w, hash, closed = nil)
    @col = w
    super(x, y, Graphics.width, 1, hash)
    self.openness = 0 if closed
  end
  #--------------------------------------------------------------------------
  # * Get Number of Lines to Show
  #--------------------------------------------------------------------------
  def visible_line_number
    return 1
  end
  #--------------------------------------------------------------------------
  # * Get Digit Count
  #--------------------------------------------------------------------------
  def col_max
    return @col
  end
  #--------------------------------------------------------------------------
  # * Get Spacing for Items Arranged Side by Side
  #--------------------------------------------------------------------------
  def spacing
    return 8
  end
  #--------------------------------------------------------------------------
  # * Calculate Width of Window Contents
  #--------------------------------------------------------------------------
  def contents_width
    (item_width + spacing) * item_max - spacing
  end
  #--------------------------------------------------------------------------
  # * Calculate Height of Window Contents
  #--------------------------------------------------------------------------
  def contents_height
    item_height
  end
  #--------------------------------------------------------------------------
  # * Get Leading Digits
  #--------------------------------------------------------------------------
  def top_col
    ox / (item_width + spacing)
  end
  #--------------------------------------------------------------------------
  # * Set Leading Digits
  #--------------------------------------------------------------------------
  def top_col=(col)
    col = 0 if col < 0
    col = col_max - 1 if col > col_max - 1
    self.ox = col * (item_width + spacing)
  end
  #--------------------------------------------------------------------------
  # * Get Trailing Digits
  #--------------------------------------------------------------------------
  def bottom_col
    top_col + col_max - 1
  end
  #--------------------------------------------------------------------------
  # * Set Trailing Digits
  #--------------------------------------------------------------------------
  def bottom_col=(col)
    self.top_col = col - (col_max - 1)
  end
  #--------------------------------------------------------------------------
  # * Scroll Cursor to Position Within Screen
  #--------------------------------------------------------------------------
  def ensure_cursor_visible
    self.top_col = index if index < top_col
    self.bottom_col = index if index > bottom_col
  end
  #--------------------------------------------------------------------------
  # * Get Rectangle for Displaying Items
  #--------------------------------------------------------------------------
  def item_rect(index)
    rect = super
    rect.x = index * (item_width + spacing)
    rect.y = 0
    rect
  end
  #--------------------------------------------------------------------------
  # * Get Alignment
  #--------------------------------------------------------------------------
  def alignment
    return 1
  end
  #--------------------------------------------------------------------------
  # * Move Cursor Down
  #--------------------------------------------------------------------------
  def cursor_down(wrap = false)
  end
  #--------------------------------------------------------------------------
  # * Move Cursor Up
  #--------------------------------------------------------------------------
  def cursor_up(wrap = false)
  end
  #--------------------------------------------------------------------------
  # * Move Cursor One Page Down
  #--------------------------------------------------------------------------
  def cursor_pagedown
  end
  #--------------------------------------------------------------------------
  # * Move Cursor One Page Up
  #--------------------------------------------------------------------------
  def cursor_pageup
  end
end

#==============================================================================
# ** Window_EvSelect
#------------------------------------------------------------------------------
#  This window deals with general command choices.
#==============================================================================

class Window_EvSelectable < Window_Selectable

  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(x, y, width, height, hash, closed = nil)
    @raw_hash = hash
    @enabled_callback = hash[:enabled] || Proc.new{ |i| true }
    @enumeration = hash[:data]
    @action_callback = Proc.new do
      return if disposed?
      hash[:action].call(self.current_item) if hash[:action]
      activate
    end
    @cancel_callback = Proc.new do
      return if disposed?
      hash[:cancel].call(self.current_item) if hash[:cancel]
      activate
    end
    @draw_callback = hash[:draw] || Proc.new {|i| write_text(i, @enumeration[i])}
    @column = hash[:column] || 1
    @activation = hash[:activate] || true
    @move_callback = hash[:change]
    super(x, y, width, height)
    self.openness = 0 if closed
    refresh
    set_handler(:ok, @action_callback)
    set_handler(:cancel, @cancel_callback)
    select(0)
    activate if @activation
  end

  #--------------------------------------------------------------------------
  # * item
  #--------------------------------------------------------------------------
  def item(id)
    @enumeration[id] || nil
  end

  #--------------------------------------------------------------------------
  # * current item
  #--------------------------------------------------------------------------
  def current_item
    item(index)
  end

  #--------------------------------------------------------------------------
  # * enabled?
  #--------------------------------------------------------------------------
  def enabled?(index)
    instance_exec(index, &@enabled_callback)
  end

  #--------------------------------------------------------------------------
  # * Get Activation State of Selection Item
  #--------------------------------------------------------------------------
  def current_item_enabled?
    enabled?(index)
  end

  #--------------------------------------------------------------------------
  # * Select Item
  #--------------------------------------------------------------------------
  def select(index)
    super(index)
    instance_exec(index, &@move_callback) if @move_callback
  end

  #--------------------------------------------------------------------------
  # * Create data list
  #--------------------------------------------------------------------------
  def make_item_list
    @data = []
    @enumeration.each do |value|
      @data.push(value)
    end
  end

  #--------------------------------------------------------------------------
  # * Draw text
  #--------------------------------------------------------------------------
  def write_text(index, s, align = 0)
    change_color(normal_color, enabled?(index))
    draw_text(item_rect_for_text(index), s.to_s, align)
  end

  #--------------------------------------------------------------------------
  # * Draw text with number
  #--------------------------------------------------------------------------
  def write_with_number(index, s, n)
    write_text(index, s)
    write_text(index, n, 2)
  end

  #--------------------------------------------------------------------------
  # * Draw text with icon (and number)
  #--------------------------------------------------------------------------
  def write_with_icon(index, s, icon, n = nil)
    rect = item_rect_for_text(index)
    rect.width -= 20
    rect.x += 22
    change_color(normal_color, enabled?(index))
    draw_text(rect, s.to_s)
    draw_icon(icon, rect.x-22, rect.y, enabled?(index))
    draw_text(rect, n, 2) if n
  end

  #--------------------------------------------------------------------------
  # * Draw Item
  #--------------------------------------------------------------------------
  def draw_item(index)
    instance_exec(index, &@draw_callback)
  end

  #--------------------------------------------------------------------------
  # * Get Number of Items
  #--------------------------------------------------------------------------
  def item_max
    return @enumeration.length
  end

end

#==============================================================================
# ** Window_Message
#------------------------------------------------------------------------------
#  This message window is used to display text.
#==============================================================================

class Window_Message
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    attr_accessor :line_number
    Window_Message.line_number = 4
  end
  #--------------------------------------------------------------------------
  # * Get Number of Lines to Show
  #--------------------------------------------------------------------------
  def visible_line_number
    Window_Message.line_number
  end
  #--------------------------------------------------------------------------
  # * Update Window Background
  #--------------------------------------------------------------------------
  def update_background
    @background = $game_message.background
    self.opacity = @background == 0 ? $game_system.window_opacity : 0
  end
end

#==============================================================================
# ** Scene_Map
#------------------------------------------------------------------------------
#  This class performs the map screen processing.
#==============================================================================

class Scene_Map
  #--------------------------------------------------------------------------
  # * Public instance variable
  #--------------------------------------------------------------------------
  attr_reader :spriteset
  attr_accessor :textfields
  attr_accessor :windows
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :extender_start, :start
  #--------------------------------------------------------------------------
  # * Start
  #--------------------------------------------------------------------------
  def start
    @textfields = Hash.new
    @windows = Hash.new
    extender_start
    $game_map.reflash_map
  end
  #--------------------------------------------------------------------------
  # * Erase a Window
  #--------------------------------------------------------------------------
  def erase_window(i)
    @windows[i].dispose if @windows[i] &&  !@windows[i].disposed?
    @windows.delete(i) if @windows[i]
  end
  #--------------------------------------------------------------------------
  # * Erase all Windows
  #--------------------------------------------------------------------------
  def erase_windows
    return unless @windows
    @windows.each {|i,t| erase_window(i)}
  end
  #--------------------------------------------------------------------------
  # * unActivate all Windows
  #--------------------------------------------------------------------------
  def unactivate_windows
    @windows.each {|i,t| t.deactivate if t && !t.disposed?}
  end
  #--------------------------------------------------------------------------
  # * add Window
  #--------------------------------------------------------------------------
  def add_window(i, window)
    erase_window(i)
    @windows[i] = window
  end
  #--------------------------------------------------------------------------
  # * Erase a field
  #--------------------------------------------------------------------------
  def erase_textfield(i)
    @textfields[i].dispose if @textfields[i] && !@textfields[i].disposed?
    @textfields.delete(i) if @textfields[i]
  end
  #--------------------------------------------------------------------------
  # * Erase all fields
  #--------------------------------------------------------------------------
  def erase_textfields
    return unless @textfields
    @textfields.each {|i,t| erase_textfield(i)}
  end
  #--------------------------------------------------------------------------
  # * Unactivate all textfields
  #--------------------------------------------------------------------------
  def unactivate_textfields
    return unless @textfields
    @textfields.each {|i,t| t.deactivate if t && !t.disposed?}
  end
  #--------------------------------------------------------------------------
  # * add textfield
  #--------------------------------------------------------------------------
  def add_textfield(i, tf)
    erase_textfield(i)
    @textfields[i] = tf
  end
  #--------------------------------------------------------------------------
  # * refresh spriteset
  #--------------------------------------------------------------------------
  def refresh_spriteset
    dispose_spriteset
    create_spriteset
  end
  #--------------------------------------------------------------------------
  # * Refresh Windows
  #--------------------------------------------------------------------------
  def refresh_message
    @message_window.dispose
    @message_window = Window_Message.new
  end

  #--------------------------------------------------------------------------
  # * Update All Windows
  #--------------------------------------------------------------------------
  def update_all_windows
    super
    @windows.values.collect(&:update)
    @textfields.values.collect(&:update)
  end

end

#==============================================================================
# ** Game_Map
#------------------------------------------------------------------------------
# This class handles maps. It includes scrolling and passage determination
# functions. The instance of this class is referenced by $game_map.
#==============================================================================
class Game_Map
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :rm_extender_initialize, :initialize
  alias_method :rm_extender_setup, :setup
  alias_method :rm_extender_update, :update
  alias_method :rm_extender_setup_events, :setup_events
  alias_method :rm_extender_setup_scroll, :setup_scroll
  alias_method :rm_extender_pc, :parallel_common_events
  alias_method :rm_extender_update_scroll, :update_scroll
  alias_method :rm_extender_scroll_up, :scroll_up
  alias_method :rm_extender_scroll_down, :scroll_down
  alias_method :rm_extender_scroll_left, :scroll_left
  alias_method :rm_extender_scroll_right, :scroll_right
  alias_method :rm_extender_refresh, :refresh

  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    #--------------------------------------------------------------------------
    # * Public instances variables
    #--------------------------------------------------------------------------
    attr_accessor :loaded_proc
    attr_accessor :running_proc
    Game_Map.loaded_proc ||= Hash.new
    Game_Map.running_proc ||= Hash.new
    #--------------------------------------------------------------------------
    # * Map onload
    #-------------------------------------------------------------------------
    def onload(ids, &block)
      ids.each do |id|
        oth = Game_Map.loaded_proc[id] || Proc.new {}
        nex = Proc.new do
          $game_map.interpreter.instance_eval(&oth)
          $game_map.interpreter.instance_eval(&block)
        end
        Game_Map.loaded_proc[id] = nex
      end
    end
    #--------------------------------------------------------------------------
    # * Map onRunning
    #--------------------------------------------------------------------------
    def onprogress(ids, &block)
      ids.each do |id|
        oth = Game_Map.running_proc[id] || Proc.new {}
        nex = Proc.new do
          $game_map.interpreter.instance_eval(&oth)
          $game_map.interpreter.instance_eval(&block)
        end
        Game_Map.running_proc[id] = nex
      end
    end
    #--------------------------------------------------------------------------
    # * Eval proc
    #--------------------------------------------------------------------------
    def eval_proc(id, c = Game_Map.loaded_proc)
      c[id].call if c.has_key?(id)
    end
  end
  #--------------------------------------------------------------------------
  # * Public instance variables
  #--------------------------------------------------------------------------
  attr_accessor :parallaxes
  attr_accessor :target_camera
  attr_accessor :camera_lock
  attr_accessor :tileset_id
  attr_accessor :map
  attr_accessor :use_reflection
  attr_accessor :reflection_properties
  attr_accessor :region_mapper
  attr_accessor :tile_mapper
  attr_accessor :scroll_speed
  attr_accessor :can_dash
  attr_accessor :scrolling_activate
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    @use_reflection = false
    @reflection_properties = {}
    @parallaxes = Game_Parallaxes.new
    rm_extender_initialize
  end
  #--------------------------------------------------------------------------
  # * Setup
  #--------------------------------------------------------------------------
  def setup(map_id)
    rm_extender_setup(map_id)
    SceneManager.scene.erase_textfields if SceneManager.scene.is_a?(Scene_Map)
    Game_Map.eval_proc(:all)
    Game_Map.eval_proc(map_id)
    @target_camera = $game_player
    @camera_lock = []
    reflash_map
    setup_region_data
    @max_event_id = events.keys.max || 0
    @can_dash = !@map.disable_dashing
  end
  #--------------------------------------------------------------------------
  # * Get Whether Dash is Disabled
  #--------------------------------------------------------------------------
  def disable_dash?
    !can_dash
  end
  #--------------------------------------------------------------------------
  # * Setup Region Data
  #--------------------------------------------------------------------------
  def setup_region_data
    @region_mapper = Array.new(64) { Array.new }
    @terrain_mapper = Array.new(8) { Array.new }
    @tile_mapper = [Hash.new, Hash.new, Hash.new]
    data.xsize.times do |x|
      data.ysize.times do |y|
        3.times do |layer|
          tile = tile_id(x, y, layer)
          @tile_mapper[layer][tile] ||= Array.new
          @tile_mapper[layer][tile] << Point.new(x, y)
        end
        @region_mapper[region_id(x, y)] << Point.new(x, y)
        @terrain_mapper[terrain_tag(x, y)] << Point.new(x, y)
      end
    end
  end
  #--------------------------------------------------------------------------
  # * reflash all squares
  #--------------------------------------------------------------------------
  def reflash_map
    return unless SceneManager.scene.is_a?(Scene_Map)
    tilemap = SceneManager.scene.spriteset.tilemap
    old_flash = $game_system.flashed_data[map_id]
    if tilemap && old_flash
      tilemap.flash_data = old_flash
    end
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    rm_extender_refresh
  end
  #--------------------------------------------------------------------------
  # * Scroll Processing
  #--------------------------------------------------------------------------
  def update_scroll
    return if @fixed

    if @scroll_function.nil?
      rm_extender_update_scroll
    else
      target = @scroll_function.call(@scroll_rest)
      @display_x = target.x
      @display_y = target.y
      @scroll_rest -= 1

      @scroll_function = nil if (0 >= @scroll_rest)
    end
  end

  #--------------------------------------------------------------------------
  # * Scroll Down
  #--------------------------------------------------------------------------
  def scroll_down(distance)
    return if @camera_lock.include?(:y)
    rm_extender_scroll_down(distance)
  end
  #--------------------------------------------------------------------------
  # * Scroll Left
  #--------------------------------------------------------------------------
  def scroll_left(distance)
    return if @camera_lock.include?(:x)
    rm_extender_scroll_left(distance)
  end
  #--------------------------------------------------------------------------
  # * Scroll Right
  #--------------------------------------------------------------------------
  def scroll_right(distance)
    return if @camera_lock.include?(:x)
    rm_extender_scroll_right(distance)
  end
  #--------------------------------------------------------------------------
  # * Scroll Up
  #--------------------------------------------------------------------------
  def scroll_up(distance)
    return if @camera_lock.include?(:y)
    rm_extender_scroll_up(distance)
  end
  #--------------------------------------------------------------------------
  # * Scroll straight towards the given point (x, y)
  #--------------------------------------------------------------------------
  def start_scroll_towards(x, y, nb_steps, easing_function)
    initial = Point.new(@display_x, @display_y)
    target  = Point.new(x, y)

    return if initial.eql? target

    nb_steps += 1

    if (initial.x == target.x)
      step_variation = Easing.tween(initial.y, target.y,
                                    nb_steps, easing_function)
      @scroll_function = build_scroll_function(target, nb_steps) do |i|
        Point.new(initial.x, step_variation.call(i))
      end
    else
      linear_interpolant = Point.linear_interpolant(initial, target)
      direction = (target.x < initial.x) ? -1 : 1
      distance = (initial.x - target.x).abs
      x_step = Easing.tween(0, distance, nb_steps, easing_function)
      x_variation = lambda { |i| initial.x + direction * x_step.call(i) }

      @scroll_function = build_scroll_function(target, nb_steps) do |i|
        x = x_variation.call(i)
        y = linear_interpolant.call(x)
        Point.new(x, y)
      end
    end

    @scroll_rest = nb_steps
  end

  def build_scroll_function(target, nb_steps)
    lambda do |nb_steps_still|
      return target if (1 >= nb_steps_still)

      i = nb_steps - nb_steps_still
      p = yield i
      Point.new(p.x % @map.width, p.y % @map.height)
    end
  end

  private :build_scroll_function

  #--------------------------------------------------------------------------
  # * Get each events
  #--------------------------------------------------------------------------
  def each_events
    result = events.keys.dup << 0
    result
  end
  #--------------------------------------------------------------------------
  # * Returns Max Event Id
  #--------------------------------------------------------------------------
  def max_id
    @max_event_id
  end

  #--------------------------------------------------------------------------
  # * Returns the first ID of an erased event
  #--------------------------------------------------------------------------
  def min_erased_id
    e = events.find {|id, ev| ev.erased?}
    (e) ? e[0] : nil
  end

  def super_page
    page = RPG::Event::Page.new
    page.trigger = 4
    page.list = [RPG::EventCommand.new(123, 0, ['internal_rme_trigger', 0])]
    page
  end


  def ev_format(event)
    first = event.pages.first.condition
    if !first.self_switch_valid
      first.self_switch_valid = true
      first.self_switch_ch = 'internal_rme_trigger'
      event.pages = [super_page] + event.pages
    end
    event
  end

  #--------------------------------------------------------------------------
  # * Add event to map
  #--------------------------------------------------------------------------
  def add_event(map_id, event_id, new_id,x=nil,y=nil)
    map = Cache.map(map_id)
    return unless map
    event = ev_format(map.events.fetch(event_id, nil).custom_deep_clone)
    return unless event
    event.id = new_id
    clone_events = @events.clone
    clone_events.store(new_id, Game_Event.new(@map_id, event))
    x ||= event.x
    y ||= event.y
    @events = clone_events
    @events[new_id].moveto(x, y)
    @need_refresh = true
    @max_event_id = [@max_event_id, new_id].max
    SceneManager.scene.refresh_spriteset
  end
  #--------------------------------------------------------------------------
  # * Clear parallaxes
  #--------------------------------------------------------------------------
  def clear_parallaxes
    @parallaxes.each {|parallax| parallax.hide}
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #     main:  Interpreter update flag
  #--------------------------------------------------------------------------
  def update(main = false)
    setup(@map_id) if $TEST && Keyboard.trigger?(RME::Config::MAP_RELOAD)
    @scrolling_activate = (@l_display_y != @display_y) || (@l_display_x != @display_x)
    @l_display_x = @display_x
    @l_display_y = @display_y
    Game_Map.eval_proc(:all, Game_Map.running_proc)
    Game_Map.eval_proc(map_id, Game_Map.running_proc)
    @parallaxes.each {|parallax| parallax.update}
    rm_extender_update(main)
  end
  #--------------------------------------------------------------------------
  # * Event Setup
  #--------------------------------------------------------------------------
  def setup_events
    rm_extender_setup_events
    @common_events.each {|event| event.refresh }
  end
  #--------------------------------------------------------------------------
  # * Event Setup
  #--------------------------------------------------------------------------
  def setup_scroll
    rm_extender_setup_scroll
    @scroll_function = nil
  end
  #--------------------------------------------------------------------------
  # * Get Random Square of the map
  #--------------------------------------------------------------------------
  def random_square(region_id)
    reg = @region_mapper[region_id] || []
    reg.sample
  end

  #--------------------------------------------------------------------------
  # * Get squares by region
  #--------------------------------------------------------------------------
  def squares_by_region(region_id)
    @region_mapper[region_id] || []
  end

  #--------------------------------------------------------------------------
  # * Get squares by terrain tag
  #--------------------------------------------------------------------------
  def squares_by_terrain(terrain_tag)
    @terrain_mapper[terrain_tag] || []
  end

  #--------------------------------------------------------------------------
  # * Get squares by tile_id
  #--------------------------------------------------------------------------
  def squares_by_tile(layer, tile_id)
    @tile_mapper[layer][tile_id] || []
  end

  #--------------------------------------------------------------------------
  # * Get Array of Parallel Common Events
  #--------------------------------------------------------------------------
  def parallel_common_events
    rm_extender_pc.select {|e| e && !e.for_battle?}
  end
end


#==============================================================================
# ** Game_Message
#------------------------------------------------------------------------------
#  This class handles the state of the message window that displays text or
# selections, etc. The instance of this class is referenced by $game_message.
#==============================================================================

class Game_Message
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor :call_event
  attr_accessor :last_choice
end

#==============================================================================
# ** Game_Screen
#------------------------------------------------------------------------------
#  This class handles screen maintenance data, such as changes in color tone,
# flashes, etc. It's used within the Game_Map and Game_Troop classes.
#==============================================================================

class Game_Screen
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self

    #--------------------------------------------------------------------------
    # * Return current Game Screen
    #--------------------------------------------------------------------------
    def get
      $game_party.in_battle ? $game_troop.screen : $game_map.screen
    end
  end
  #--------------------------------------------------------------------------
  # * Public instance variable
  #--------------------------------------------------------------------------
  attr_reader :texts
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :displaytext_initialize, :initialize
  alias_method :displaytext_update,     :update
  #--------------------------------------------------------------------------
  # * Constructor
  #--------------------------------------------------------------------------
  def initialize
    @texts = Game_Texts.new
    displaytext_initialize
  end
  #--------------------------------------------------------------------------
  # * Clear
  #--------------------------------------------------------------------------
  alias_method :displaytext_clear, :clear
  def clear
    displaytext_clear
    clear_texts
  end
  #--------------------------------------------------------------------------
  # * Clear text
  #--------------------------------------------------------------------------
  def clear_texts
    @texts.each{|t|t.erase}
  end
  #--------------------------------------------------------------------------
  # * Frame update
  #--------------------------------------------------------------------------
  def update
    displaytext_update
    update_texts
  end
  #--------------------------------------------------------------------------
  # * Update texts
  #--------------------------------------------------------------------------
  def update_texts
    @texts.each{|t|t.update}
  end
  #--------------------------------------------------------------------------
  # * Update texts
  #--------------------------------------------------------------------------
  def tone_change?
    @tone_duration > 0
  end
end

#==============================================================================
# ** Sprite_Text
#------------------------------------------------------------------------------
#  text view
#==============================================================================

class Sprite_Text < Sprite
  #--------------------------------------------------------------------------
  # * Constructor
  #--------------------------------------------------------------------------
  def initialize(viewport, dynamic_text)
    super(viewport)
    @text = dynamic_text
    @text_value = ""
    @profile = nil
  end
  #--------------------------------------------------------------------------
  # * Free bitmap
  #--------------------------------------------------------------------------
  def dispose
    bitmap.dispose if bitmap
    super
  end
  #--------------------------------------------------------------------------
  # * Modification à chaque frames
  #--------------------------------------------------------------------------
  def update
    super
    update_bitmap
    update_origin
    update_position
    update_zoom
    update_other
  end
  #--------------------------------------------------------------------------
  # * Création du bitmap
  #--------------------------------------------------------------------------
  def create_bitmap
    font = @text.profile.to_font
    bmp = Bitmap.new(1, 1)
    bmp.font = font
    lines = @text_value.split("\n")
    widths = Array.new
    heights = Array.new
    lines.each do |line|
      r = bmp.text_size(line)
      widths << r.width
      heights << r.height
    end
    width, height = widths.max + font.size, heights.max + font.size
    total_height = height * lines.length
    self.bitmap = Bitmap.new(width, total_height)
    self.bitmap.font = font
    iterator = 0
    lines.each do |line|
      self.bitmap.draw_text(0, iterator, width, height, line, 0)
      iterator += height
    end
  end
  #--------------------------------------------------------------------------
  # * Update bitmap
  #--------------------------------------------------------------------------
  def update_bitmap
    if @text.text_value.empty?
      self.bitmap = nil
      @text_value = ""
    else
      if @text.text_value != @text_value || @profile != @text.profile
        @profile = @text.profile
        @text_value = @text.text_value
        if self.bitmap && !self.bitmap.disposed?
          self.bitmap = nil
        end
        create_bitmap
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Update origin
  #--------------------------------------------------------------------------
  def update_origin
    if @text.origin == 0
      self.ox = 0
      self.oy = 0
    else
      self.ox = bitmap.width / 2
      self.oy = bitmap.height / 2
    end
  end
  #--------------------------------------------------------------------------
  # * Update Position
  #--------------------------------------------------------------------------
  def update_position
    self.x = @text.x
    self.y = @text.y
    self.z = @text.number
  end
  #--------------------------------------------------------------------------
  # * Update Zoom Factor
  #--------------------------------------------------------------------------
  def update_zoom
    self.zoom_x = @text.zoom_x / 100.0
    self.zoom_y = @text.zoom_y / 100.0
  end
  #--------------------------------------------------------------------------
  # * Update Other
  #--------------------------------------------------------------------------
  def update_other
    self.opacity = @text.opacity
    self.blend_type = @text.blend_type
    self.angle = @text.angle
  end
end

#==============================================================================
# ** Game_Parallax
#------------------------------------------------------------------------------
#  This class handles Parallaxes.
#==============================================================================

class Game_Parallax
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor :id, :name, :z, :opacity, :zoom_x, :zoom_y, :blend_type
  attr_accessor :autospeed_x, :autospeed_y, :move_x, :move_y, :tone
  #--------------------------------------------------------------------------
  # * Initialize
  #--------------------------------------------------------------------------
  def initialize(id)
    @id = id
    init_basic
  end
  #--------------------------------------------------------------------------
  # * Initialize basic arguments
  #--------------------------------------------------------------------------
  def init_basic
    @name, @z, @opacity = "", -100, 255
    @zoom_x, @zoom_y = 100, 100
    @blend_type = 0
    @autospeed_x = @autospeed_y = 0
    @move_x = @move_y = 0
    @tone = Tone.new(0,0,0)
    @duration = 0
    @tone_duration = 0
    @auto_duration = 0
  end
  #--------------------------------------------------------------------------
  # * show
  #--------------------------------------------------------------------------
  def show(n, z, op, a_x, a_y, m_x, m_y, b = 0, z_x = 100, z_y = 100, t = Tone.new)
    @name, @z, @opacity = n, z, op
    @zoom_x, @zoom_y = z_x, z_y
    @autospeed_x, @autospeed_y = a_x, a_y
    @move_x, @move_y = m_x, m_y
    @blend_type = b
    @tone = t
  end
  #--------------------------------------------------------------------------
  # * move
  #--------------------------------------------------------------------------
  def move(duration, zoom_x, zoom_y, opacity, tone = nil, ease = :InLinear)
    set_transition('zoom_x',  zoom_x,  duration, ease)
    set_transition('zoom_y',  zoom_y,  duration, ease)
    set_transition('opacity', opacity, duration, ease)
    start_tone_change(tone, duration, ease) if tone.is_a?(Tone)
  end
  #--------------------------------------------------------------------------
  # * Start Changing Color Tone
  #--------------------------------------------------------------------------
  def start_tone_change(tone, duration, ease = :InLinear)
    @tone.set_transition('red',   tone.red,   duration, ease)
    @tone.set_transition('green', tone.green, duration, ease)
    @tone.set_transition('blue',  tone.blue,  duration, ease)
    @tone.set_transition('gray',  tone.gray,  duration, ease)
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    update_move
    update_tone_change
    update_auto_change
  end
  #--------------------------------------------------------------------------
  # * Update Parallax Move
  #--------------------------------------------------------------------------
  def update_move
    update_transition('zoom_x')
    update_transition('zoom_y')
    update_transition('opacity')
  end
  #--------------------------------------------------------------------------
  # * Update Color Tone Change
  #--------------------------------------------------------------------------
  def update_tone_change
    @tone.update_transition('red')
    @tone.update_transition('green')
    @tone.update_transition('blue')
    @tone.update_transition('gray')
  end
  #--------------------------------------------------------------------------
  # * Update auto Change
  #--------------------------------------------------------------------------
  def update_auto_change
    update_transition('autospeed_x')
    update_transition('autospeed_y')
    update_transition('opacity')
  end
  #--------------------------------------------------------------------------
  # * hide parallax
  #--------------------------------------------------------------------------
  def hide
    @name = ""
  end
end

#==============================================================================
# ** Game_Parallaxes
#------------------------------------------------------------------------------
#  This is a wrapper for a parallaxes array. This class is used within the
# Game_Screen class. Map screen parallaxes and battle screen parallaxes are
# handled separately.
#==============================================================================

class Game_Parallaxes
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    @data = []
  end
  # Returns a fresh picture id
  def fresh_id
    i = @data.find_index {|parallax| !parallax || parallax.name.empty? }
    return (i || @data.length)
  end
  #--------------------------------------------------------------------------
  # * Get Picture
  #--------------------------------------------------------------------------
  def [](number)
    @data[number] ||= Game_Parallax.new(number)
  end
  #--------------------------------------------------------------------------
  # * Iterator
  #--------------------------------------------------------------------------
  def each
    @data.compact.each {|parallax| yield parallax } if block_given?
  end
end

#==============================================================================
# ** Game_Pictures
#------------------------------------------------------------------------------
#  This is a wrapper for a picture array. This class is used within the
# Game_Screen class. Map screen pictures and battle screen pictures are
# handled separately.
#==============================================================================

class Game_Pictures
  # cast to array
  def to_a
    return @data.compact
  end
  # Returns a fresh picture id
  def fresh_id
    i = @data.find_index {|picture| !picture || picture.name.empty? }
    return (i || @data.length)
  end
end

#==============================================================================
# ** Game_Spritesheet
#------------------------------------------------------------------------------
#  Spritesheet ingame
#==============================================================================

class Game_Spritesheet < Game_Picture

  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor :cell_x, :cell_y, :index
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(number)
    super(number)
    @cell_x = @cell_y = @index = 0
  end
end


#==============================================================================
# ** Game_Picture
#------------------------------------------------------------------------------
#  Pictures ingame
#==============================================================================

class Game_Picture
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :rm_extender_initialize, :initialize
  alias_method :rm_extender_update,     :update
  alias_method :rm_extender_show,       :show
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor  :number                   # picture index
  attr_accessor  :name                     # filename
  attr_accessor  :origin                   # starting point
  attr_accessor  :x                        # x-coordinate
  attr_accessor  :y                        # y-coordinate
  attr_accessor  :zoom_x                   # x directional zoom rate
  attr_accessor  :zoom_y                   # y directional zoom rate
  attr_accessor  :opacity                  # opacity level
  attr_accessor  :blend_type               # blend method
  attr_accessor  :tone                     # color tone
  attr_accessor  :angle                    # rotation angle
  attr_accessor  :pinned
  attr_accessor  :shake
  attr_accessor  :mirror
  attr_accessor  :wave_amp
  attr_accessor  :wave_speed
  attr_accessor  :duration
  attr_accessor  :scroll_speed_x, :scroll_speed_y
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(number)
    rm_extender_initialize(number)
    clear_effects
  end
  #--------------------------------------------------------------------------
  # * Show Picture
  #--------------------------------------------------------------------------
  def show(name, origin, x, y, zoom_x, zoom_y, opacity, blend_type)
    rm_extender_show(name, origin, x, y, zoom_x, zoom_y, opacity, blend_type)
    clear_effects
  end
  #--------------------------------------------------------------------------
  # * Move Picture
  #--------------------------------------------------------------------------
  def move(origin, x, y, zoom_x, zoom_y, opacity, blend_type, duration, ease=:InLinear)
    @origin = origin
    @blend_type = blend_type
    set_transition('x', x, duration, ease)
    set_transition('y', y, duration, ease)
    set_transition('zoom_x', zoom_x, duration, ease)
    set_transition('zoom_y', zoom_y, duration, ease)
    set_transition('opacity', opacity, duration, ease)
  end
  #--------------------------------------------------------------------------
  # * Update Picture Move
  #--------------------------------------------------------------------------
  def update_move
    change = [@x, @y, @zoom_x, @zoom_y]
    update_transition('x')
    update_transition('y')
    update_transition('zoom_x')
    update_transition('zoom_y')
    update_transition('opacity')
    update_transition('angle')
    @moving = (change != [@x, @y, @zoom_x, @zoom_y])
  end
  #--------------------------------------------------------------------------
  # * Start Changing Color Tone
  #--------------------------------------------------------------------------
  def start_tone_change(tone, duration, ease=:InLinear)
    @tone.set_transition('red',   tone.red,   duration, ease)
    @tone.set_transition('green', tone.green, duration, ease)
    @tone.set_transition('blue',  tone.blue,  duration, ease)
    @tone.set_transition('gray',  tone.gray,  duration, ease)
  end
  #--------------------------------------------------------------------------
  # * Update Color Tone Change
  #--------------------------------------------------------------------------
  def update_tone_change
    @tone.update_transition('red')
    @tone.update_transition('green')
    @tone.update_transition('blue')
    @tone.update_transition('gray')
  end
  #--------------------------------------------------------------------------
  # * Clear effects
  #--------------------------------------------------------------------------
  def clear_effects
    @mirror = false
    @wave_amp = @wave_speed = 0
    @pin = false
    @scroll_speed_y = @scroll_speed_x = 2
    clear_shake
  end
  #--------------------------------------------------------------------------
  # * Clear Shake
  #--------------------------------------------------------------------------
  def clear_shake
    @shake_power = 0
    @shake_speed = 0
    @shake_duration = 0
    @shake_direction = 1
    @shake = 0
  end
  #--------------------------------------------------------------------------
  # * Start Shaking
  #     power: intensity
  #     speed: speed
  #--------------------------------------------------------------------------
  def start_shake(power, speed, duration)
    @shake_power = power
    @shake_speed = speed
    @shake_duration = duration
  end
  #--------------------------------------------------------------------------
  # * Update Shake
  #--------------------------------------------------------------------------
  def update_shake
    if @shake_duration > 0 || @shake != 0
      delta = (@shake_power * @shake_speed * @shake_direction) / 10.0
      if @shake_duration <= 1 && @shake * (@shake + delta) < 0
        @shake = 0
      else
        @shake += delta
      end
      @shake_direction = -1 if @shake > @shake_power * 2
      @shake_direction = 1 if @shake < - @shake_power * 2
      @shake_duration -= 1
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    rm_extender_update
    update_shake
  end

  #--------------------------------------------------------------------------
  # * Wave
  #--------------------------------------------------------------------------
  def wave(amp, speed)
    @wave_amp = amp
    @wave_speed = speed
  end

  #--------------------------------------------------------------------------
  # * Flip picture
  #--------------------------------------------------------------------------
  def flip
    self.mirror = !self.mirror
  end

  #--------------------------------------------------------------------------
  # * Blend mode
  #--------------------------------------------------------------------------
  def blend=(mode)
    blend_type = 0
    blend_type = blend if [0,1,2].include?(blend)
    @blend_type = blend_type
  end

  #--------------------------------------------------------------------------
  # * Pin picture
  #--------------------------------------------------------------------------
  def pin
    @pinned = true
  end

  #--------------------------------------------------------------------------
  # * Unpin picture
  #--------------------------------------------------------------------------
  def unpin
    @pinned = false
  end

  #--------------------------------------------------------------------------
  # * Picture is in movement
  #--------------------------------------------------------------------------
  def move?
    @moving
  end

end

#==============================================================================
# ** Plane_Parallax
#------------------------------------------------------------------------------
#  This plane is used to display parallaxes.
#==============================================================================

class Plane_Parallax < Plane
  #--------------------------------------------------------------------------
  # * Object initialization
  #--------------------------------------------------------------------------
  def initialize(parallax)
    super()
    @parallax = parallax
    @scroll_x = @scroll_y = 0
    update
  end
  #--------------------------------------------------------------------------
  # * update bitmap
  #--------------------------------------------------------------------------
  def update
    if @parallax.name.empty?
      self.bitmap = nil
    else
      self.bitmap = Cache.parallax(@parallax.name)
      update_zoom
      update_scroll_dimension
      update_position
      update_other
    end
  end
  #--------------------------------------------------------------------------
  # * update scroll dimension
  #--------------------------------------------------------------------------
  def update_scroll_dimension
    @scroll_width = self.bitmap.width * self.zoom_x
    @scroll_height = self.bitmap.height * self.zoom_y
  end
  #--------------------------------------------------------------------------
  # * update position
  #--------------------------------------------------------------------------
  def update_position
    x_s = 16 * @parallax.move_x
    y_s = 16 * @parallax.move_y
    self.z = @parallax.z
    @scroll_x = (@scroll_x + @parallax.autospeed_x) % @scroll_width
    @scroll_y = (@scroll_y + @parallax.autospeed_y) % @scroll_height
    self.ox = @scroll_x + ($game_map.display_x * x_s)
    self.oy = @scroll_y + ($game_map.display_y * y_s)
  end
  #--------------------------------------------------------------------------
  # * update zoom
  #--------------------------------------------------------------------------
  def update_zoom
    self.zoom_x = @parallax.zoom_x / 100.0
    self.zoom_y = @parallax.zoom_y / 100.0
  end
  #--------------------------------------------------------------------------
  # * update others
  #--------------------------------------------------------------------------
  def update_other
    self.opacity = @parallax.opacity
    self.blend_type = @parallax.blend_type
    self.tone.set(@parallax.tone)
  end
end

#==============================================================================
# ** Spriteset_Map
#------------------------------------------------------------------------------
#  This class brings together map screen sprites, tilemaps, etc. It's used
# within the Scene_Map class.
#==============================================================================

class Spriteset_Map
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :rme_initialize, :initialize
  alias_method :rme_dispose, :dispose
  alias_method :rme_update,  :update
  alias_method :rm_extender_create_parallax, :create_parallax
  alias_method :rm_extender_dispose_parallax, :dispose_parallax
  alias_method :rm_extender_update_parallax, :update_parallax
  alias_method :rm_extender_create_chars, :create_characters

  #--------------------------------------------------------------------------
  # * Public instances variables
  #--------------------------------------------------------------------------
  attr_accessor :picture_sprites
  attr_accessor :text_sprites
  attr_accessor :character_sprites
  attr_accessor :tilemap
  #--------------------------------------------------------------------------
  # * Constructor
  #--------------------------------------------------------------------------
  def initialize
    create_texts
    rme_initialize
  end
  #--------------------------------------------------------------------------
  # * Create Reflect and shadows
  #--------------------------------------------------------------------------
  def create_effects
    @reflect_sprites = []
    return if not $game_map.use_reflection
    $game_map.events.values.each do |event|
      push_reflect(event.id, event)
    end
    i = 0
    $game_map.vehicles.each do |vehicle|
      id = [:vehicle, i]
      push_reflect(id, vehicle)
      i += 1
    end
    i = 0
    $game_player.followers.reverse_each do |follower|
      id =  [:follower, i]
      push_reflect(id, follower)
      i += 1
    end
    push_reflect(0, $game_player)
  end

  def push_reflect(id, char)
    return unless char
    return if $game_map.reflection_properties[:excluded].include?(id)
    @reflect_sprites.push(
      Sprite_Reflect.new(
        @viewport1,
        char,
        id,
        $game_map.reflection_properties
        )
      )
  end


  #--------------------------------------------------------------------------
  # * Create Character Sprite
  #--------------------------------------------------------------------------
  def create_characters
    rm_extender_create_chars
    @character_sprites.each.with_index do |c, i|
      c.character.sprite_index = i
    end
     create_effects
  end

  #--------------------------------------------------------------------------
  # * Text creation
  #--------------------------------------------------------------------------
  def create_texts
    @text_sprites = Array.new
  end
  #--------------------------------------------------------------------------
  # * Free
  #--------------------------------------------------------------------------
  def dispose
    rme_dispose
    dispose_texts
    dispose_reflects
  end
  #--------------------------------------------------------------------------
  # * Dispose reflects
  #--------------------------------------------------------------------------
  def dispose_reflects
    @reflect_sprites.each {|sprite| sprite.update }
  end
  #--------------------------------------------------------------------------
  # * Free text
  #--------------------------------------------------------------------------
  def dispose_texts
    @text_sprites.compact.each {|t| t.dispose }
  end
  #--------------------------------------------------------------------------
  # * Update frame
  #--------------------------------------------------------------------------
  def update
    update_texts
    rme_update
    update_reflects
  end
  #--------------------------------------------------------------------------
  # * Update Reflects
  #--------------------------------------------------------------------------
  def update_reflects
    @reflect_sprites.each {|sprite| sprite.update }
  end

  #--------------------------------------------------------------------------
  # * Modification des texts
  #--------------------------------------------------------------------------
  def update_texts
    Game_Screen.get.texts.each do |txt|
      @text_sprites[txt.number] ||= Sprite_Text.new(@viewport2, txt)
      @text_sprites[txt.number].update
    end
  end
  #--------------------------------------------------------------------------
  # * Create Parallax
  #--------------------------------------------------------------------------
  def create_parallax
    @parallaxes_plane = []
    rm_extender_create_parallax
  end
  #--------------------------------------------------------------------------
  # * Free Parallax
  #--------------------------------------------------------------------------
  def dispose_parallax
    @parallaxes_plane.compact.each {|parallax| parallax.dispose}
    rm_extender_dispose_parallax
  end
  #--------------------------------------------------------------------------
  # * Update Parallax
  #--------------------------------------------------------------------------
  def update_parallax
    $game_map.parallaxes.each do |parallax|
      @parallaxes_plane[parallax.id] ||= Plane_Parallax.new(parallax)
      @parallaxes_plane[parallax.id].update
    end
    rm_extender_update_parallax
  end
end

#==============================================================================
# ** Sprite_Picture
#------------------------------------------------------------------------------
#  Sprite picture InGame
#==============================================================================

class Sprite_Picture
  #--------------------------------------------------------------------------
  # * Get cache
  #--------------------------------------------------------------------------
  def swap_cache

    name = @picture.name

    if name == :screenshot
      return self.bitmap if @old_snap
      @old_snap = true
      return Graphics.snap_to_bitmap.clone
    end

    @old_snap = false
    if /^(\/Pictures|Pictures)\/(.*)/ =~ name
      return Cache.picture($2)
    end
    if /^(\/Battlers|Battlers)\/(.*)/ =~ name
      return Cache.battler($2, 0)
    end
    if /^(\/Battlebacks1|Battlebacks1)\/(.*)/ =~ name
      return Cache.battleback1($2)
    end
    if /^(\/Battlebacks2|Battlebacks2)\/(.*)/ =~ name
      return Cache.battleback2($2)
    end
    if /^(\/Parallaxes|Parallaxes)\/(.*)/ =~ name
      return Cache.parallax($2)
    end
    if /^(\/Titles1|Titles1)\/(.*)/ =~ name
      return Cache.title1($2)
    end
    if /^(\/Titles2|Titles2)\/(.*)/ =~ name
      return Cache.title2($2)
    end
    return Cache.picture(name)
  end
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :rm_extender_update, :update
  alias_method :rm_extender_update_origin, :update_origin

  #--------------------------------------------------------------------------
  # * Update Transfer Origin Bitmap
  #--------------------------------------------------------------------------
  def update_bitmap
    if @picture.name.empty?
      self.bitmap = nil
    else
      self.bitmap = swap_cache
      self.mirror = false
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    rm_extender_update
    self.mirror = @picture.mirror if @picture.mirror != self.mirror
    self.wave_amp = @picture.wave_amp if @picture.wave_amp != self.wave_amp
    self.wave_speed = @picture.wave_speed if @picture.wave_speed != self.wave_speed
  end
  #--------------------------------------------------------------------------
  # * Update Position
  #--------------------------------------------------------------------------
  def update_position
    if @picture.pinned
      x_s = 16 * @picture.scroll_speed_x
      y_s = 16 * @picture.scroll_speed_y
      self.x = @picture.x - ($game_map.display_x * x_s) + @picture.shake
      self.y = @picture.y - ($game_map.display_y * y_s)
    else
      self.x = @picture.x + @picture.shake
      self.y = @picture.y
    end
    self.z = @picture.number
  end
  #--------------------------------------------------------------------------
  # * Update Origin
  #--------------------------------------------------------------------------
  def update_origin
    return unless bitmap || disposed?
    if @picture.origin.is_a?(Array)
      k_x, k_y = @picture.origin
      self.ox, self.oy = k_x, k_y
    else
      rm_extender_update_origin
    end
  end
end

  #==============================================================================
  # ** Spriteset_Weather
  #------------------------------------------------------------------------------
  #  A class for weather effects (rain, storm, and snow). It is used within the
  # Spriteset_Map class.
  #==============================================================================

  class Spriteset_Weather
    #--------------------------------------------------------------------------
    # * Aliases
    #--------------------------------------------------------------------------
    alias_method :rme_dimness, :dimness
    #--------------------------------------------------------------------------
    # * Get Dimness
    #--------------------------------------------------------------------------
    def dimness
      $game_system.weather_no_dimness ? 0 : rme_dimness
    end
  end

#==============================================================================
# ** Game_Actor
#------------------------------------------------------------------------------
#  This class handles actors. It is used within the Game_Actors class
# ($game_actors) and is also referenced from the Game_Party class ($game_party).
#==============================================================================

class Game_Actor
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor   :character_name           # character graphic filename
  attr_accessor   :character_index          # character graphic index
  attr_accessor   :face_name                # face graphic filename
  attr_accessor   :face_index               # face graphic index
end

#==============================================================================
# ** Game_Event
#------------------------------------------------------------------------------
#  This class handles events. Functions include event page switching via
# condition determinants and running parallel process events. Used within the
# Game_Map class.
#==============================================================================

class Game_Event
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :rm_extender_conditions_met?,  :conditions_met?
  attr_accessor :erased
  attr_accessor :trigger
  alias_method :erased?, :erased
  alias_method :rme_setup_page_settings, :setup_page_settings
  #--------------------------------------------------------------------------
  # * Event Page Setup
  #--------------------------------------------------------------------------
  def setup_page_settings
    rme_setup_page_settings
    restore_oxy
  end
  #--------------------------------------------------------------------------
  # * Determine if Event Page Conditions Are Met
  #--------------------------------------------------------------------------
  def conditions_met?(page)
    value = rm_extender_conditions_met?(page)
    first = first_is_trigger?(page)
    if first.is_a?(Array)
      return first[0].(@event.id)
    end
    return value unless first
    return value && first.(@event.id)
  end
  #--------------------------------------------------------------------------
  # * Determine if the first command is a Trigger
  #--------------------------------------------------------------------------
  def first_is_trigger?(page)
    return false unless $game_map.events.has_key?(self.id)
    return false unless page || page.list || page.list[0]
    return false unless page.list[0].code == 355
    script = page.list[0].parameters[0] + "\n"
    index = 1
    while page.list[index].code == 655
      script += page.list[index].parameters[0] + "\n"
      index += 1
    end
    if script =~ /^\s*(trigger|listener)/
      script = script.gsub(/S(V|S)\[(\d+)\]/) { "S#{$1}[#{@id}, #{$2}]" }
      potential_trigger = eval(script)
      return potential_trigger if potential_trigger.is_a?(Proc)
    elsif script =~ /^\s*(ignore_left)/
      script = script.gsub(/S(V|S)\[(\d+)\]/) { "S#{$1}[#{@id}, #{$2}]" }
      potential_trigger = eval(script)
      return [potential_trigger, :ign] if potential_trigger.is_a?(Proc)
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Get event name
  #--------------------------------------------------------------------------
  def name
    @event.name
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
  # * Singleton
  #--------------------------------------------------------------------------
  class << self

    #--------------------------------------------------------------------------
    # * Public instances variables
    #--------------------------------------------------------------------------
    attr_accessor :current_id
    attr_accessor :current_map_id

    #--------------------------------------------------------------------------
    # * Get page
    #--------------------------------------------------------------------------
    def get_page(map_id, event_id, page_id)
      if map_id != $game_map.map_id
        if !Game_Temp.cached_map || Game_Temp.cached_map[0] != map_id
          Game_Temp.cached_map =
            [map_id, load_data(sprintf("Data/Map%03d.rvdata2", map_id))]
        end
        map = Game_Temp.cached_map[1]
      else
        map = $game_map.map
      end
      return unless map
      event = map.events[event_id]
      return unless event
      page = event.pages[page_id-1]
      return unless page
      return page
    end

    #--------------------------------------------------------------------------
    # * Determine if Event Page Conditions Are Met For a Particular Event
    #--------------------------------------------------------------------------
    def conditions_met?(map_id, event_id, page)
      c = page.condition
      if c.switch1_valid
        return false unless $game_switches[c.switch1_id]
      end
      if c.switch2_valid
        return false unless $game_switches[c.switch2_id]
      end
      if c.variable_valid
        return false if $game_variables[c.variable_id] < c.variable_value
      end
      if c.self_switch_valid
        key = [map_id, event_id, c.self_switch_ch]
        return false if $game_self_switches[key] != true
      end
      if c.item_valid
        item = $data_items[c.item_id]
        return false unless $game_party.has_item?(item)
      end
      if c.actor_valid
        actor = $game_actors[c.actor_id]
        return false unless $game_party.members.include?(actor)
      end
      return true
    end

  end
  alias_method :extender_command_101, :command_101
  alias_method :extender_command_111, :command_111
  alias_method :extender_command_105, :command_105
  alias_method :extender_command_355, :command_355
  alias_method :extender_command_117, :command_117

  #--------------------------------------------------------------------------
  # * Show Text
  #--------------------------------------------------------------------------
  def command_101
    $game_message.call_event = @event_id
    extender_command_101
  end
  #--------------------------------------------------------------------------
  # * Show Scrolling Text
  #--------------------------------------------------------------------------
  def command_105
    $game_message.call_event = @event_id
    extender_command_105
  end
  #--------------------------------------------------------------------------
  # * Append Interpreter
  #--------------------------------------------------------------------------
  def append_interpreter(page)
    list = page.list
    child = Game_Interpreter.new(@depth + 1)
    child.setup(list, same_map? ? @event_id : 0)
    child.run
  end
  #--------------------------------------------------------------------------
  # * Conditional Branch
  #--------------------------------------------------------------------------
  def command_111
    Game_Interpreter.current_id = @event_id
    Game_Interpreter.current_map_id = @map_id
    extender_command_111
  end
  #--------------------------------------------------------------------------
  # * Script
  #--------------------------------------------------------------------------
  def command_355
    Game_Interpreter.current_id = @event_id
    Game_Interpreter.current_map_id = @map_id
    script = @list[@index].parameters[0] + "\n"
    while next_event_code == 655
      @index += 1
      script += @list[@index].parameters[0] + "\n"
    end
    script = script.gsub(/S(V|S)\[(\d+)\]/) { "S#{$1}[#{@event_id}, #{$2}]" }
    eval(script)
  end
  #--------------------------------------------------------------------------
  # * Common Event
  #--------------------------------------------------------------------------
  def command_117
    return if $data_common_events[@params[0]].for_battle?
    extender_command_117
  end
  #--------------------------------------------------------------------------
  # * Execute code
  #--------------------------------------------------------------------------
  def exec(&block)
    self.instance_eval(&block)
  end
  #--------------------------------------------------------------------------
  # * Add command API
  #--------------------------------------------------------------------------
  include_commands
  #--------------------------------------------------------------------------
  # * Get Binding
  #--------------------------------------------------------------------------
  def get_binding; binding; end
end

#==============================================================================
# ** UI
#------------------------------------------------------------------------------
# Minimalist UI
#==============================================================================

module UI

  #==============================================================================
  # ** Abstract_Textfield
  #------------------------------------------------------------------------------
  # Abstract text field representation
  #==============================================================================

  class Abstract_Textfield < Window_Base

    #--------------------------------------------------------------------------
    # * Public instance variables
    #--------------------------------------------------------------------------
    attr_accessor :profile
    alias_method :active?, :active
    attr_accessor :range

    #--------------------------------------------------------------------------
    # * Restrict int
    #--------------------------------------------------------------------------
    def restrict(x, r, m=:to_i)
      [[r.min, x.send(m)].max, r.max].min
    end

    #--------------------------------------------------------------------------
    # * Constructor
    #--------------------------------------------------------------------------
    def initialize(x, y, w, t, profile, range = false)
      @menu_disabled = $game_system.menu_disabled
      @raw_w = w
      @profile = get_fieldProfile(profile)
      @text = t
      @range = range
      super(x, y, w, @profile.height)
      init_basic
      refresh
    end

    #--------------------------------------------------------------------------
    # * Basic initialize
    #--------------------------------------------------------------------------
    def init_basic
      @old_text = @text.dup
      self.arrows_visible = false
      self.padding = @profile.padding
      self.padding_bottom = @profile.padding_bottom
      self.active = false
    end

    #--------------------------------------------------------------------------
    # * Bitmap initialize
    #--------------------------------------------------------------------------
    def init_bitmap
      self.contents = Bitmap.new(@raw_w-8, @profile.height-8)
      @align = @profile.alignement%3
      self.contents.font = get_profile(@profile.text_profile).to_font
      self.tone.set(@profile.get_tone)
    end

    #--------------------------------------------------------------------------
    # * Refresh bitmap
    #--------------------------------------------------------------------------
    def refresh
      self.contents.clear
      init_bitmap
      w, h = self.contents.width, self.contents.height
      self.contents.draw_text(0, 0, w, h, @text, @align)
    end

    #--------------------------------------------------------------------------
    # * Frame update
    #--------------------------------------------------------------------------
    def update
      super
      self.tone.set(@profile.get_tone)
      @text = @text[0...@text.length-1] || "" if Keyboard.repeat?(:backspace)
      if @old_text != @text
        refresh
        @old_text = @text.dup
      end
    end

    #--------------------------------------------------------------------------
    # * Set profile
    #--------------------------------------------------------------------------
    def profile=(pr)
      @profile =  get_fieldProfile(pr)
      refresh
    end

    #--------------------------------------------------------------------------
    # * Activate
    #--------------------------------------------------------------------------
    def activate
      @menu_disabled = $game_system.menu_disabled
      $game_system.menu_disabled = true
      return super
    end

    #--------------------------------------------------------------------------
    # * unActivate
    #--------------------------------------------------------------------------
    def deactivate
      $game_system.menu_disabled = @menu_disabled
      return super
    end

    #--------------------------------------------------------------------------
    # * Dispose
    #--------------------------------------------------------------------------
    def dispose
      $game_system.menu_disabled = @menu_disabled
      super
    end

    #--------------------------------------------------------------------------
    # * Get text value
    #--------------------------------------------------------------------------
    def value; @text; end

    #--------------------------------------------------------------------------
    # * point include in textfield
    #--------------------------------------------------------------------------
    def in?(x, y)
      check_x = x.between?(self.x, self.x+self.width)
      check_y = y.between?(self.y, self.y+self.height)
      check_x && check_y
    end

  end

  #==============================================================================
  # ** Window_Textfield
  #------------------------------------------------------------------------------
  # Text field representation
  #==============================================================================

  class Window_Textfield < Abstract_Textfield

    #--------------------------------------------------------------------------
    # * Constructor
    #--------------------------------------------------------------------------
    def initialize(x, y, w, t, profile, range = false)
      range = (range.is_a?(Fixnum) && range > 0) ? range : false
      t = t[0..range-1] if range
      super(x, y, w, t, profile, range)
    end

    #--------------------------------------------------------------------------
    # * Value
    #--------------------------------------------------------------------------
    def value=(t)
      t = t[0..range-1] if range
      @text = t
    end

    #--------------------------------------------------------------------------
    # * Frame update
    #--------------------------------------------------------------------------
    def update
      return unless active?
      return if Keyboard.press?(:enter)
      @text << Keyboard.current_char
      self.value = @text
      super
    end

  end

  #==============================================================================
  # ** Window_IntField
  #------------------------------------------------------------------------------
  # Text field representation
  #==============================================================================

  class Window_Intfield < Abstract_Textfield
    #--------------------------------------------------------------------------
    # * Constructor
    #--------------------------------------------------------------------------
    def initialize(x, y, w, t, profile, range = false)
      range = (range.is_a?(Range)) ? range : false
      t = restrict(t, range) if range
      super(x, y, w, t.to_i.to_s, profile, range)
    end
    #--------------------------------------------------------------------------
    # * Get the input value
    #--------------------------------------------------------------------------
    def value; super.to_i; end
    #--------------------------------------------------------------------------
    # * Set the value
    #--------------------------------------------------------------------------
    def value=(text)
      if text == "+" || text == "-"
        @text = text
        return
      end
      text = restrict(text, range) if range
      @text = text.to_i.to_s
    end
    #--------------------------------------------------------------------------
    # * Update
    #--------------------------------------------------------------------------
    def update
      return unless active?
      super
      letter = Keyboard.current_char
      return unless (["+","-"] + ("0".."9").to_a).include?(letter)
      return if @text != "" && ["+","-"].include?(letter)
      @text << letter
      self.value = @text
    end
  end

  #==============================================================================
  # ** Window_Floatfield
  #------------------------------------------------------------------------------
  # Text field representation
  #==============================================================================

  class Window_Floatfield < Abstract_Textfield
    #--------------------------------------------------------------------------
    # * Constructor
    #--------------------------------------------------------------------------
    def initialize(x, y, w, t, profile, range = false)
      range = (range.is_a?(Range)) ? range : false
      t = restrict(t, range, :to_f) if range
      super(x, y, w, t.to_f.to_s, profile, range)
    end
    #--------------------------------------------------------------------------
    # * Get the input value
    #--------------------------------------------------------------------------
    def value; super.to_f; end
    #--------------------------------------------------------------------------
    # * Set the value
    #--------------------------------------------------------------------------
    def value=(text)
      if text == "+" || text == "-" || text == "."
        @text = text
        return
      end
      text = restrict(text, range, :to_f) if range && must_restrict?(text)
      @text = text.to_s
    end
    #--------------------------------------------------------------------------
    # * Must restriction process
    #--------------------------------------------------------------------------
    def must_restrict?(text)
      return true if text == "+" || text == "-" || text == "."
      return text.to_f < range.min || text.to_f > range.max
    end
    #--------------------------------------------------------------------------
    # * Update
    #--------------------------------------------------------------------------
    def update
      return unless active?
      super
      letter = Keyboard.current_char
      return unless (["+","-", "."] + ("0".."9").to_a).include?(letter)
      return if @text != "" && ["+","-"].include?(letter)
      return if letter == "." && @text.count(".") == 1
      @text << letter
      return if letter == "."
      self.value = @text
    end
  end

end

#==============================================================================
# ** Scene_End
#------------------------------------------------------------------------------
#  This class performs game over screen processing.
#==============================================================================

class Scene_End

  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :evex_command_to_title, :command_to_title
  #--------------------------------------------------------------------------
  # * [Go to Title] Command
  #--------------------------------------------------------------------------
  def command_to_title
    data = skip_title_data
    if !data.activate || !map_exists?(data.map_id)
      evex_command_to_title
      return
    end
    close_command_window
    fadeout_all
    SceneManager.run
  end

end

#==============================================================================
# ** Battle_Context
#------------------------------------------------------------------------------
#  Define a battle context for build your own CBS !
# Work in progress DUUUDE
#==============================================================================

class Battle_Context

  #--------------------------------------------------------------------------
  # * Public instance members
  #--------------------------------------------------------------------------
  attr_reader :troop_id
  attr_reader :can_escape, :can_lose
  alias_method :can_escape?, :can_escape
  alias_method :can_lose?, :can_lose

  #--------------------------------------------------------------------------
  # * Object builder
  #--------------------------------------------------------------------------
  def initialize(troop_id, can_escape, can_lose)
    @troop_id = troop_id
    @can_escape = can_escape
    @can_lose = can_lose
    make_escape_ratio
  end


  #--------------------------------------------------------------------------
  # * Escape ratio
  #--------------------------------------------------------------------------
  def make_escape_ratio
    @escape_ratio = 1.5 - 1.0 * troop.agi / $game_party.agi
  end

  #--------------------------------------------------------------------------
  # * Get troop
  #--------------------------------------------------------------------------
  def troop
    $data_troop[@troop_id]
  end

end

#==============================================================================
# ** Pathfinder
#------------------------------------------------------------------------------
#  Path finder module. A* Algorithm
#==============================================================================

module Pathfinder
  #--------------------------------------------------------------------------
  # * Constants
  #--------------------------------------------------------------------------
  ROUTE_MOVE_DOWN = 1
  ROUTE_MOVE_LEFT = 2
  ROUTE_MOVE_RIGHT = 3
  ROUTE_MOVE_UP = 4
  #--------------------------------------------------------------------------
  # * Definition of a point
  #--------------------------------------------------------------------------
  class Point
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_accessor :x, :y, :g, :h, :f, :parent, :goal
    #--------------------------------------------------------------------------
    # * Object initialize
    #--------------------------------------------------------------------------
    def initialize(x, y, xy, goal = ::Point.new(0,0))
      @goal = goal
      @x, @y, @parent = x, y, xy
      self.score(@parent)
    end
    #--------------------------------------------------------------------------
    # * get an Id from the X and Y coord
    #--------------------------------------------------------------------------
    def id; "#{@x}-#{@y}"; end
    #--------------------------------------------------------------------------
    # * Calculate score
    #--------------------------------------------------------------------------
    def score(parent)
      if !parent
        @g = 0
      elsif !@g || @g > parent.g + 1
        @g = parent.g + 1
        @parent = parent
      end
      @h = (@x - @goal.x).abs + (@y - @goal.y).abs
      @f = @g + @h
    end
    #--------------------------------------------------------------------------
    # * Cast to move_command
    #--------------------------------------------------------------------------
    def to_move
      return nil unless @parent
      return RPG::MoveCommand.new(2) if @x < @parent.x
      return RPG::MoveCommand.new(3) if @x > @parent.x
      return RPG::MoveCommand.new(4) if @y < @parent.y
      return RPG::MoveCommand.new(1) if @y > @parent.y
      return nil
    end
  end
  #--------------------------------------------------------------------------
  # * singleton
  #--------------------------------------------------------------------------
  extend self
  #--------------------------------------------------------------------------
  # * Id Generation
  #--------------------------------------------------------------------------
  def id(x, y); "#{x}-#{y}"; end
  #--------------------------------------------------------------------------
  # * Check the passability
  #--------------------------------------------------------------------------
  def passable?(e, x, y, dir, s = false);
    if s and e.through
      return $game_map.passable?(x, y, dir)
    end
    e.passable?(x, y, dir)
  end

  #--------------------------------------------------------------------------
  # * Complete passability
  #--------------------------------------------------------------------------
  def check_passability?(event, current, elt, no_through, x, y, cl)
    passable?(event, x, y, elt, no_through) && !has_key?(x, y, cl)
  end

  #--------------------------------------------------------------------------
  # * Check closed_list
  #--------------------------------------------------------------------------
  def has_key?(x, y, l)
    l.has_key?(id(x, y))
  end

  #--------------------------------------------------------------------------
  # * Check if unbounded
  #--------------------------------------------------------------------------
  def unbounded?(x, y)
    (x < 0 or x >= $game_map.width) or (y < 0 or y >= $game_map.height)
  end

  #--------------------------------------------------------------------------
  # * Create a path
  #--------------------------------------------------------------------------
  def create_path(goal, event, no_through = false)

    open_list, closed_list = Hash.new, Hash.new
    current = Point.new(event.x, event.y, nil, goal)
    open_list[current.id] = current

    while !has_key?(goal.x, goal.y, closed_list) && !open_list.empty?

      current = open_list.values.min{|point1, point2|point1.f <=> point2.f}
      open_list.delete(current.id)
      closed_list[current.id] = current


      [[0, 1], [-1, 0], [1, 0], [0, -1]].each do | elt |
        args = current.x + elt[0], current.y + elt[1]
        next if unbounded?(*args)
        [2, 4, 6, 8].each do |d|
          if check_passability?(event, current, d, no_through, *args, closed_list)
            if !has_key?(*args, open_list)
              open_list[id(*args)] = Point.new(*args, current, goal)
            else
              open_list[id(*args)].score(current)
            end
          end
        end
      end

    end

    move_route = RPG::MoveRoute.new
    if has_key?(goal.x, goal.y, closed_list)
      current = closed_list[id(goal.x, goal.y)]
      while current
        move_command = current.to_move
        move_route.list = [move_command] + move_route.list if move_command
        current = current.parent
      end
    end

    move_route.skippable = true
    move_route.repeat = false
    return move_route

  end
end

#==============================================================================
# ** DataManager
#------------------------------------------------------------------------------
# Data of save manager
#==============================================================================

module DataManager
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    #--------------------------------------------------------------------------
    # * Alias
    #--------------------------------------------------------------------------
    alias_method :rm_extender_create_game_objects, :create_game_objects
    alias_method :rm_extender_make_save_contents, :make_save_contents
    alias_method :rm_extender_extract_save_contents, :extract_save_contents
    alias_method :rm_extender_init, :init
    #--------------------------------------------------------------------------
    # * Reinitialize the DataManager
    #--------------------------------------------------------------------------
    def init
      rm_extender_init
      Window_Message.line_number = 4
    end
    #--------------------------------------------------------------------------
    # * Creates the objects of the game
    #--------------------------------------------------------------------------
    def create_game_objects
      rm_extender_create_game_objects
      $game_self_vars = Hash.new
      $game_labels = Hash.new
      $game_self_labels = Hash.new
    end
    #--------------------------------------------------------------------------
    # * Saves the contents of the game
    #--------------------------------------------------------------------------
    def make_save_contents
      contents = rm_extender_make_save_contents
      contents[:self_vars] = $game_self_vars
      contents[:labels] = $game_labels
      contents[:self_labels] = $game_self_labels
      contents
    end
    #--------------------------------------------------------------------------
    # * Load a save
    #--------------------------------------------------------------------------
    def extract_save_contents(contents)
      rm_extender_extract_save_contents(contents)
      $game_self_vars = contents[:self_vars]
      $game_labels = contents[:labels]
      $game_self_labels = contents[:self_labels]
    end
    #--------------------------------------------------------------------------
    # * Export Data
    #--------------------------------------------------------------------------
    def export(index)
      datas = Hash.new
      File.open(make_filename(index), "rb") do |file|
        Marshal.load(file)
        contents = Marshal.load(file)
        game_system             = contents[:system]
        game_timer              = contents[:timer]
        game_message            = contents[:message]
        datas[:switches]        = contents[:switches]
        datas[:variables]       = contents[:variables]
        datas[:self_switches]   = contents[:self_switches]
        game_actors             = contents[:actors]
        game_party              = contents[:party]
        game_troop              = contents[:troop]
        game_map                = contents[:map]
        game_player             = contents[:player]
        datas[:self_vars]       = contents[:self_vars]
        datas[:labels]          = contents[:labels]
        datas[:self_labels]     = contents[:self_labels]
      end
      return datas
    end

  end
end

#==============================================================================
# ** SceneManager
#------------------------------------------------------------------------------
#  This module manages scene transitions. For example, it can handle
# hierarchical structures such as calling the item screen from the main menu
# or returning from the item screen to the main menu.
#==============================================================================

module SceneManager
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    #--------------------------------------------------------------------------
    # * Alias
    #--------------------------------------------------------------------------
    alias_method :skip_ee_run, :run
    #--------------------------------------------------------------------------
    # * Run game
    #--------------------------------------------------------------------------
    def run
      Game_Temp.in_game = true
      DataManager.init_cst_db
      data = skip_title_data
      if !data.activate || !map_exists?(data.map_id)
        skip_ee_run
        return
      end
      DataManager.init
      Audio.setup_midi if use_midi?
      DataManager.create_game_objects
      $game_party.setup_starting_members
      $game_map.setup(data.map_id)
      $game_map.autoplay
      $game_player.moveto(data.x, data.y)
      $game_player.refresh
      goto(Scene_Map)
      scene.main while scene
    end
  end
end

#==============================================================================
# ** ScreenEffects
#------------------------------------------------------------------------------
#  This module manages screen effects like zoom, blur, pixelation, etc.
#==============================================================================

module ScreenEffects

  #--------------------------------------------------------------------------
  # * Screen into sprite
  #--------------------------------------------------------------------------
  class Screen < Sprite

    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_accessor :pixelation, :zoom, :zoom_target_x, :zoom_target_y,
    :motion_blur, :focus_event, :blur, :blur_step
    #--------------------------------------------------------------------------
    # * Object initialize
    #--------------------------------------------------------------------------
    def initialize
      super
      self.viewport = Viewport.new
      self.viewport.z = 100
      @zoom = 100
      @pixelation  = 1
      @motion_blur = 0
      @blur = 0
      @blur_step = 1
      @gaussian_curve = Hash.new
      @focus_event = true
      @capture_rect = Rect.new
      @display_rect  = Rect.new
    end
    #--------------------------------------------------------------------------
    # * Frame update
    #--------------------------------------------------------------------------
    def update
      return if disposed?
      update_transitions
      if !SceneManager.scene_is?(Scene_Map) || [@blur, @motion_blur, @pixelation, @zoom] == [0, 0, 1, 100]
        return self.visible = false
      end
      update_zoom_target
      update_capture_rect
      update_pixelation
      update_bitmap
    end
    #--------------------------------------------------------------------------
    # * Update transition
    #--------------------------------------------------------------------------
    def update_transitions
      update_transition('blur')
      update_transition('motion_blur')
      update_transition('pixelation')
      update_transition('zoom')
      unless @focus_event
        update_transition('zoom_target_x')
        update_transition('zoom_target_y')
      end
    end
    #--------------------------------------------------------------------------
    # * Update zoom target
    #--------------------------------------------------------------------------
    def update_zoom_target
      if @focus_event
        @zoom_target_x = $game_map.target_camera.screen_x
        @zoom_target_y = $game_map.target_camera.screen_y
      end
    end
    #--------------------------------------------------------------------------
    # * Portion to capture, depending of zoom processing
    #--------------------------------------------------------------------------
    def update_capture_rect
      @zoom = [100, @zoom].max
      tx, ty = @zoom_target_x, @zoom_target_y
      f = @zoom / 100.0
      w = (Graphics.width / f).to_i
      h = (Graphics.height / f).to_i
      x = (tx - w / 2.0).to_i.bound(0, Graphics.width  - w)
      y = (ty - h / 2.0).to_i.bound(0, Graphics.height - h)
      @capture_rect.set(x, y, w, h)
    end
    #--------------------------------------------------------------------------
    # * Pixelates the screen
    #--------------------------------------------------------------------------
    def update_pixelation
      @blur = [0, @blur].max
      pix = @forced_pixelation = [@pixelation, @blur>5?2:1, @blur>25?3:1].max
      if pix != @pixelation_old
        w = Graphics.width  / pix.to_i
        h = Graphics.height / pix.to_i
        self.zoom_x = Graphics.width.to_f  / w
        self.zoom_y = Graphics.height.to_f / h
        current = bitmap.clone if bitmap
        self.bitmap = Bitmap.new(w, h)
        @pixelation_old = pix
        @display_rect.set(0, 0, w, h)
        self.bitmap.stretch_blt(@display_rect, current, current.rect) if current
      end
    end
    #--------------------------------------------------------------------------
    # * Updates the bitmap
    #--------------------------------------------------------------------------
    def update_bitmap
      visible_windows = collect_visible_windows
      visible_windows.each {|w| w.visible = false}
      o = 255 - [@motion_blur, @blur*3].max.to_i.bound(0, 255)
      self.visible = false
      self.bitmap.stretch_blt(@display_rect, Graphics.snap_to_bitmap, @capture_rect, o)
      self.bitmap.gaussian_blur(@blur/@forced_pixelation, @blur_step/@forced_pixelation)
      self.visible = true
      visible_windows.each {|w| w.visible = true }
    end
    #--------------------------------------------------------------------------
    # * Collects all visible windows
    #--------------------------------------------------------------------------
    def collect_visible_windows
      scene = SceneManager.scene
      scene.instance_variables.collect do |varname|
        scene.instance_variable_get(varname)
      end.select do |ivar|
        ivar.is_a?(Window) && !ivar.disposed? && ivar.visible
      end
    end

  end
end

#==============================================================================
# ** Graphics
#------------------------------------------------------------------------------
#  The module that carries out graphics processing.
#==============================================================================

module Graphics
  class << self
    #--------------------------------------------------------------------------
    # * Alias
    #--------------------------------------------------------------------------
    alias_method :rme_screen_effect_update, :update
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_accessor :screen
    #--------------------------------------------------------------------------
    # * Frame update
    #--------------------------------------------------------------------------
    def update
      @screen = ScreenEffects::Screen.new if @screen.nil? || @screen.disposed?
      @screen.update
      rme_screen_effect_update
    end
  end
end
