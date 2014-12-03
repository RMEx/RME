# -*- coding: utf-8 -*-
#==============================================================================
# ** RME V1.0.0 Evex
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
    $game_labels[key] || 0
  end
  
  #--------------------------------------------------------------------------
  # * Modifies a Game Label
  #--------------------------------------------------------------------------
  def []=(key, value)
    $game_labels[key] = value
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
    $game_variables[key] || 0
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
    id = args[-1] || Game_Interpreter.current_id
    map_id = args[-2] || Game_Interpreter.current_map_id
    $game_self_vars.fetch([map_id, id, id], 0)
  end
  #--------------------------------------------------------------------------
  # * Modifies a self variable
  #--------------------------------------------------------------------------
  def []=(*args, id, value)
    id = args[-1] || Game_Interpreter.current_id
    map_id = args[-2] || Game_Interpreter.current_map_id
    $game_self_vars[[map_id, id, id]] = value
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
    id = args[-1] || Game_Interpreter.current_id
    map_id = args[-2] || Game_Interpreter.current_map_id
    $game_self_labels.fetch([map_id, id, id], 0)
  end
  #--------------------------------------------------------------------------
  # * Modifies a self variable
  #--------------------------------------------------------------------------
  def []=(*args, id, value)
    id = args[-1] || Game_Interpreter.current_id
    map_id = args[-2] || Game_Interpreter.current_map_id
    $game_self_labels[[map_id, id, id]] = value
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
    auth = ["A","B","C","D"]
    return id if auth.include?(id)
    return auth[id-1] if id.to_i.between?(1, 4)
    return "A"
  end
  private :map_id_s
  #--------------------------------------------------------------------------
  # * Returns a self switch
  #--------------------------------------------------------------------------
  def [](*args, id)
    id = args[-1] || Game_Interpreter.current_id
    map_id = args[-2] || Game_Interpreter.current_map_id
    key = [map_id, id, map_id_s(id)]
    $game_self_switches[key]
  end
  #--------------------------------------------------------------------------
  # * Modifies a self switch
  #--------------------------------------------------------------------------
  def []=(*args, id, value)
    id = args[-1] || Game_Interpreter.current_id
    map_id = args[-2] || Game_Interpreter.current_map_id
    key = [map_id, id, map_id_s(id)]
    $game_self_switches[key] = value.to_bool
    $game_map.need_refresh = true
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
  alias :listener :trigger
  #--------------------------------------------------------------------------
  # * Cast Events args
  #--------------------------------------------------------------------------
  def select_events(e)
    e = events(e) if e.is_a?(Fixnum)
    e
  end
  #--------------------------------------------------------------------------
  # * All selector
  #--------------------------------------------------------------------------
  def all_events
    events(:all_events)
  end
  #--------------------------------------------------------------------------
  # * Selectors
  #--------------------------------------------------------------------------
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
    attr_accessor :std_triggers
    Handler.std_triggers = [
      :hover,
      :click,
      :trigger,
      :release,
      :repeat
    ] 
  end
  #--------------------------------------------------------------------------
  # * Event behaviour
  #--------------------------------------------------------------------------
  module Behaviour
    #--------------------------------------------------------------------------
    # * Setup Event Handler
    #--------------------------------------------------------------------------
    def setup_eHandler
      @__std_triggers = {
        press:    nil,
        hover:    nil,
        click:    nil,
        trigger:  nil,
        release:  nil, 
        repeat:   nil
      }
      @__cst_triggers = {}
      @table_triggers = {
        press:    method(:press?),
        hover:    method(:hover?),
        click:    method(:click?),
        trigger:  method(:trigger?),
        release:  method(:release?),
        repeat:   method(:repeat?)
      }
    end
    #--------------------------------------------------------------------------
    # * Unbinding process
    #--------------------------------------------------------------------------
    def unbind(key = nil)
      unless key
        setup_eHandler
        return
      end
      if(Handler.std_triggers.include?(key))
        @__std_triggers[key.to_sym] = nil
        return
      end
      @__cst_triggers[key.to_sym] = nil if @__cst_triggers[key.to_sym]
    end
    #--------------------------------------------------------------------------
    # * Binding event
    #--------------------------------------------------------------------------
    def bind(key, *args, &block)
      if(Handler.std_triggers.include?(key))
        ntriggers = args[0] || -1
        @__std_triggers[key.to_sym] = {
          fun:        block,
          ntriggers:  ntriggers
        }
        return
      end
      trigger = args[0]
      ntriggers = args[1] || -1
      @__cst_triggers[key.to_sym] = {
        trigger:    trigger,
        fun:        block,
        ntriggers:  ntriggers
      }
    end
    #--------------------------------------------------------------------------
    # * Update events
    #--------------------------------------------------------------------------
    def update_eHandler
      @__std_triggers.each do |key, event|
        if event && event[:ntriggers] != 0
          if @table_triggers[key] && @table_triggers[key].()
            event[:fun].(self.id)
            event[:ntriggers] -= 1 if event[:ntriggers] != -1
          end
        end
      end
      @__cst_triggers.each do |key, event|
        if event
          if event[:ntriggers] != 0
            event[:fun].(self) if event[:trigger].(self.id)
            event[:ntriggers] -= 1 if event[:ntriggers] != -1
          else
            event = nil
          end
        end
      end
    end
    #--------------------------------------------------------------------------
    # * Hover
    #--------------------------------------------------------------------------
    def hover?
      @rect.hover?
    end
    #--------------------------------------------------------------------------
    # * Click
    #--------------------------------------------------------------------------
    def click?
      @rect.click?
    end
    #--------------------------------------------------------------------------
    # * Press
    #--------------------------------------------------------------------------
    def press?(key = :mouse_left)
      @rect.press?(key)
    end
    #--------------------------------------------------------------------------
    # * Trigger
    #--------------------------------------------------------------------------
    def trigger?(key = :mouse_left)
      @rect.trigger?(key)
    end
    #--------------------------------------------------------------------------
    # * Repeat
    #--------------------------------------------------------------------------
    def repeat?(key = :mouse_left)
      @rect.repeat?(key)
    end
    #--------------------------------------------------------------------------
    # * Release
    #--------------------------------------------------------------------------
    def release?(key = :mouse_left)
      @rect.release?(key)
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
      $game_map.events[i]
    end
    #--------------------------------------------------------------------------
    # * Binding
    #--------------------------------------------------------------------------
    def bind(e, *args, &block)
      e = select_events(e)
      e.each{|i|event(i).bind(*args, &block)}
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
    def mouse_hover_event?(e)
      e = select_events(e)
      e.any?{|i|event(i).hover?}
    end
    #--------------------------------------------------------------------------
    # * clicked event
    #--------------------------------------------------------------------------
    def mouse_click_event?(e)
      e = select_events(e)
      e.any?{|i|event(i).click?}
    end
    #--------------------------------------------------------------------------
    # * Pressed event
    #--------------------------------------------------------------------------
    def mouse_press_event?(e, k=:mouse_left)
      e = select_events(e)
      e.any?{|i|event(i).press?(k)}
    end
    #--------------------------------------------------------------------------
    # * Triggered event
    #--------------------------------------------------------------------------
    def mouse_trigger_event?(e, k=:mouse_left)
      e = select_events(e)
      e.any?{|i|event(i).trigger?(k)}
    end
    #--------------------------------------------------------------------------
    # * Repeated event
    #--------------------------------------------------------------------------
    def mouse_repeat_event?(e, k=:mouse_left)
      e = select_events(e)
      e.any?{|i|event(i).repeat?(k)}
    end
    #--------------------------------------------------------------------------
    # * Released event
    #--------------------------------------------------------------------------
    def mouse_release_event?(e, k=:mouse_left)
      e = select_events(e)
      e.any?{|i|event(i).release?(k)}
    end
    #--------------------------------------------------------------------------
    # * Load Commands
    #--------------------------------------------------------------------------
    append_commands
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
  # * alias
  #--------------------------------------------------------------------------
  alias :rm_extender_initialize          :initialize
  alias :rm_extender_init_public_members :init_public_members
  alias :rm_extender_update              :update
  #--------------------------------------------------------------------------
  # * Public instance variable
  #--------------------------------------------------------------------------
  attr_reader :rect
  #--------------------------------------------------------------------------
  # * Event Handling
  #--------------------------------------------------------------------------
  include Handler::Behaviour
  #--------------------------------------------------------------------------
  # * Object initialize
  #--------------------------------------------------------------------------
  def initialize
    rm_extender_initialize
    @rect = Rect.new(0,0,0,0)
  end
  #--------------------------------------------------------------------------
  # * Initialize Public Member Variables
  #--------------------------------------------------------------------------
  def init_public_members
    rm_extender_init_public_members
    setup_eHandler
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    rm_extender_update
    update_eHandler
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
  alias :rm_extender_update      :update
  alias :rm_extender_initialize  :initialize
  #--------------------------------------------------------------------------
  # * Object initialization
  #--------------------------------------------------------------------------
  def initialize(viewport, character = nil)
    rm_extender_initialize(viewport, character)
    set_rect
  end
  #--------------------------------------------------------------------------
  # * Set rect to dynamic layer
  #--------------------------------------------------------------------------
  def set_rect
    if character
      x_rect, y_rect = self.x-self.ox, self.y-self.oy
      w_rect, h_rect = self.src_rect.width, self.src_rect.height
      character.rect.set(x_rect, y_rect, w_rect, h_rect)
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    rm_extender_update
    set_rect
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
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    @parallaxes = Game_Parallaxes.new
    rm_extender_initialize
  end
  #--------------------------------------------------------------------------
  # * Setup
  #--------------------------------------------------------------------------
  def setup(map_id)
    rm_extender_setup(map_id)
    Game_Map.eval_proc(:all)
    Game_Map.eval_proc(map_id)
  end
  #--------------------------------------------------------------------------
  # * Get each events
  #--------------------------------------------------------------------------
  def each_events
    result = events.keys.dup << 0
    result
  end
  #--------------------------------------------------------------------------
  # * Return Max Event Id
  #--------------------------------------------------------------------------
  def max_id
    @events.keys.max
  end
  #--------------------------------------------------------------------------
  # * Add event to map
  #--------------------------------------------------------------------------
  def add_event(map_id, event_id, new_id,x=nil,y=nil)
    map = load_data(sprintf("Data/Map%03d.rvdata2", map_id))
    return unless map
    event = map.events[event_id]
    return unless event
    event.id = new_id
    @events.store(new_id, Game_Event.new(@map_id, event))
    x ||= event.x
    y ||= event.y
    @events[new_id].moveto(x, y)
    @need_refresh = true
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
    Game_Map.eval_proc(:all, Game_Map.running_proc)
    Game_Map.eval_proc(map_id, Game_Map.running_proc)
    @parallaxes.each {|parallax| parallax.update}
    rm_extender_update(main)
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
  attr_accessor :target_auto_x, :target_auto_y, :duration
  #--------------------------------------------------------------------------
  # * Initialize
  #--------------------------------------------------------------------------
  def initialize(id)
    @id = id
    init_basic
    init_targets
  end
  #--------------------------------------------------------------------------
  # * Initialize basic arguments
  #--------------------------------------------------------------------------
  def init_basic
    @name, @z, @opacity = "", -100, 255.0
    @zoom_x, @zoom_y = 100.0, 100.0
    @blend_type = 0
    @autospeed_x = @autospeed_y = 0.0
    @move_x = @move_y = 0
    @tone = Tone.new(0,0,0)
    @duration = 0
    @tone_duration = 0
    @auto_duration = 0
  end
  #--------------------------------------------------------------------------
  # * Initialize Targets
  #--------------------------------------------------------------------------
  def init_targets
    @target_tone = Tone.new
    @target_auto_x = @autospeed_x
    @target_auto_y = @autospeed_y
    @target_zoom_x = @zoom_x
    @target_zoom_y = @zoom_y
    @target_opacity = @opacity
  end
  #--------------------------------------------------------------------------
  # * Start auto duration
  #--------------------------------------------------------------------------
  def start_auto_change(x, y, duration)
    @target_auto_x = x
    @target_auto_y = y
    @auto_duration = duration 
    if @auto_duration == 0
      @autospeed_x = @target_auto_x
      @autospeed_y = @target_auto_y
    end
  end
  #--------------------------------------------------------------------------
  # * Start Changing Color Tone
  #--------------------------------------------------------------------------
  def start_tone_change(tone, duration)
    @tone_target = tone.clone
    @tone_duration = duration
    @tone = @tone_target.clone if @tone_duration == 0
  end
  #--------------------------------------------------------------------------
  # * Update Parallax Move
  #--------------------------------------------------------------------------
  def update_move
    return if @duration == 0
    d = @duration
    @zoom_x  = (@zoom_x  * (d - 1) + @target_zoom_x)  / d
    @zoom_y  = (@zoom_y  * (d - 1) + @target_zoom_y)  / d
    @opacity = (@opacity * (d - 1) + @target_opacity) / d
    @duration -= 1
  end
  #--------------------------------------------------------------------------
  # * Update auto Change
  #--------------------------------------------------------------------------
  def update_auto_change
    return if @auto_duration == 0
    d = @auto_duration
    @autospeed_x  = (@autospeed_x  * (d - 1) + @target_auto_x)  / d
    @autospeed_y  = (@autospeed_y  * (d - 1) + @target_auto_y)  / d
    @auto_duration -= 1
  end
  #--------------------------------------------------------------------------
  # * Update Color Tone Change
  #--------------------------------------------------------------------------
  def update_tone_change
    return if @tone_duration == 0
    d = @tone_duration
    @tone.red   = (@tone.red   * (d - 1) + @tone_target.red)   / d
    @tone.green = (@tone.green * (d - 1) + @tone_target.green) / d
    @tone.blue  = (@tone.blue  * (d - 1) + @tone_target.blue)  / d
    @tone.gray  = (@tone.gray  * (d - 1) + @tone_target.gray)  / d
    @tone_duration -= 1
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
  # * hide parallax
  #--------------------------------------------------------------------------
  def hide; @name = ""; end
  #--------------------------------------------------------------------------
  # * show
  #--------------------------------------------------------------------------
  def show(n, z, op, a_x, a_y, m_x, m_y, b = 0, z_x = 100.0, z_y = 100.0, t = Tone.new)
    @name, @z, @opacity = n, z, op.to_f
    @zoom_x, @zoom_y = z_x.to_f, z_y.to_f
    @autospeed_x, @autospeed_y = a_x, a_y
    @move_x, @move_y = m_x, m_y
    @blend_type = b
    @tone = t
  end
  #--------------------------------------------------------------------------
  # * move
  #--------------------------------------------------------------------------
  def move(duration, zoom_x, zoom_y, opacity, tone = nil)
    @target_zoom_x = zoom_x.to_f
    @target_zoom_y = zoom_y.to_f
    @target_opacity = opacity.to_f
    @duration = duration
    start_tone_change(tone, duration) if tone.is_a?(Tone)
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
  attr_accessor  :target_x, :target_y, :target_zoom_x, :target_zoom_y
  attr_accessor  :target_opacity
  attr_accessor  :scroll_speed_x, :scroll_speed_y
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(number)
    rm_extender_initialize(number)
    clear_effects
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
  # * Change Tone
  #--------------------------------------------------------------------------
  def tone_change(*args)
    case args.length
    when 1; 
      tone = args[0]
      duration = 0
    else
      r, g, b = args[0], args[1], args[2]
      gray = args[3] || 0
      tone = Tone.new(r, g, b, gray)
      duration = args[4] || 0
    end
    self.start_tone_change(tone, duration)
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

end

#==============================================================================
<<<<<<< HEAD
=======
# ** Commands Picture
#------------------------------------------------------------------------------
#  Pictures manipulation
#==============================================================================

module Command
  #--------------------------------------------------------------------------
  # * Spriteset
  #--------------------------------------------------------------------------
  def spriteset
    scene.spriteset
  end
  #--------------------------------------------------------------------------
  # * Sprite picture
  #--------------------------------------------------------------------------
  def sprite_picture(id)
    spriteset.picture_sprites[id]
  end
  #--------------------------------------------------------------------------
  # * Picture show
  #--------------------------------------------------------------------------
  def picture_show(id, n, x=0, y=0, ori=0,  z_x=100, z_y=100, op=255, bl=0)
    pictures[id].show(n, ori, x, y, z_x, z_y, op, bl)
  end
  #--------------------------------------------------------------------------
  # * Picture erase
  #--------------------------------------------------------------------------
  def picture_erase(id)
    pictures[id].erase
  end
  #--------------------------------------------------------------------------
  # * Modify Origin
  # Origin : 0 | 1 (0 = Corner High Left, 1 = Center)
  #--------------------------------------------------------------------------
  def picture_origin(id, *origin)
    origin = origin[0] if origin.length == 1
    pictures[id].origin = origin
  end
  #--------------------------------------------------------------------------
  # * Modify x position
  #--------------------------------------------------------------------------
  def picture_x(id, x=false)
    return pictures[id].x unless x
    pictures[id].x = x
  end
  #--------------------------------------------------------------------------
  # * Modify y position
  #--------------------------------------------------------------------------
  def picture_y(id, y=false)
    return pictures[id].y unless y
    pictures[id].y = y
  end
  #--------------------------------------------------------------------------
  # * Modify position
  #--------------------------------------------------------------------------
  def picture_position(id, x, y)
    picture_x(id, x)
    picture_y(id, y)
  end
  #--------------------------------------------------------------------------
  # * Move picture
  #--------------------------------------------------------------------------
  def picture_move(id, x, y, zoom_x, zoom_y, dur, wf = true, opacity = -1, bt = -1, o = -1)
    p = pictures[id]
    opacity = (opacity == -1) ? p.opacity : opacity
    blend = (bt == -1) ? p.blend_type : bt
    origin = (o == -1) ? p.origin : o
    p.move(origin, x, y, zoom_x, zoom_y, opacity, blend, dur)
    wait(dur) if wf
  end
  #--------------------------------------------------------------------------
  # * Modify wave
  #--------------------------------------------------------------------------
  def picture_wave(id, amp, speed)
    pictures[id].wave_amp = amp
    pictures[id].wave_speed = speed
  end
  #--------------------------------------------------------------------------
  # * Apply Mirror
  #--------------------------------------------------------------------------
  def picture_flip(id)
    pictures[id].mirror = !pictures[id].mirror
  end
  #--------------------------------------------------------------------------
  # * Modify Angle
  #--------------------------------------------------------------------------
  def picture_angle(id, angle=false)
    return pictures[id].angle unless angle
    pictures[id].angle = angle%360
  end
  #--------------------------------------------------------------------------
  # * Rotate
  #--------------------------------------------------------------------------
  def picture_rotate(id, speed)
    pictures[id].rotate(speed)
  end
  #--------------------------------------------------------------------------
  # * change Zoom X
  #--------------------------------------------------------------------------
  def picture_zoom_x(id, zoom_x=false)
    return pictures[id].zoom_x unless zoom_x
    pictures[id].zoom_x = zoom_x
  end
  #--------------------------------------------------------------------------
  # * change Zoom Y
  #--------------------------------------------------------------------------
  def picture_zoom_y(id, zoom_y=false)
    return pictures[id].zoom_y unless zoom_y
    pictures[id].zoom_y = zoom_y
  end
  #--------------------------------------------------------------------------
  # * change Zoom
  #--------------------------------------------------------------------------
  def picture_zoom(id, zoom_x, zoom_y = -1)
    zoom_y = zoom_x if zoom_y == -1
    picture_zoom_x(id, zoom_x)
    picture_zoom_y(id, zoom_y)
  end
  #--------------------------------------------------------------------------
  # * change Tone
  #--------------------------------------------------------------------------
  def picture_tone(id, tone, d = nil, wf = false)
    if d.is_a?(Fixnum)
      pictures[id].start_tone_change(tone, d)
      wait(d) if wf
    else
      pictures[id].tone = tone
    end
  end
  #--------------------------------------------------------------------------
  # * Change blend type
  #--------------------------------------------------------------------------
  def picture_blend(id, blend)
    pictures[id].blend = blend
  end
  #--------------------------------------------------------------------------
  # * Pin picture on the map
  #--------------------------------------------------------------------------
  def picture_pin(id, x, y)
    picture_x(id, x)
    picture_y(id, y)
    pictures[id].pin
  end
  #--------------------------------------------------------------------------
  # * Unpin picture on the map
  #--------------------------------------------------------------------------
  def picture_unpin(id)
    pictures[id].unpin
  end
  #--------------------------------------------------------------------------
  # * Change Picture Opacity
  #--------------------------------------------------------------------------
  def picture_opacity(id, value)
    pictures[id].opacity = value
  end
  #--------------------------------------------------------------------------
  # * Shake the picture
  #--------------------------------------------------------------------------
  def picture_shake(id, power, speed, duration)
    pictures[id].start_shake(power, speed, duration)
  end
  #--------------------------------------------------------------------------
  # * Point in picture
  #--------------------------------------------------------------------------
  def pixel_in_picture?(id, x, y, precise = false)
    spr = sprite_picture(id)
    return false unless spr
    precise ? spr.precise_in?(x, y) : spr.in?(x, y)
  end
  #--------------------------------------------------------------------------
  # * Picture collisions
  #--------------------------------------------------------------------------
  def pictures_collide?(a, b)
    spr_a = sprite_picture(a)
    spr_b = sprite_picture(b)
    return if (!spr_a) || (!spr_b)
    spr_a.collide_with?(spr_b)
  end
  #--------------------------------------------------------------------------
  # * Picture collisions (perfect pixel)
  #--------------------------------------------------------------------------
  def pictures_perfect_collide?(a, b)
    spr_a = sprite_picture(a)
    spr_b = sprite_picture(b)
    return if (!spr_a) || (!spr_b)
    spr_a.pixel_collide_with(spr_b)
  end
  #--------------------------------------------------------------------------
  # * Change scroll speed (in X)
  #--------------------------------------------------------------------------
  def picture_scroll_x(id, speed)
    pictures[id].scroll_speed_x = speed
  end
  #--------------------------------------------------------------------------
  # * Change scroll speed (in Y)
  #--------------------------------------------------------------------------
  def picture_scroll_y(id, speed)
    pictures[id].scroll_speed_y = speed
  end
  #--------------------------------------------------------------------------
  # * Change scroll speed
  #--------------------------------------------------------------------------
  def picture_scroll(id, speed)
    picture_scroll_x(id, speed)
    picture_scroll_y(id, speed)
  end
  #--------------------------------------------------------------------------
  # * Clear all pictures
  #--------------------------------------------------------------------------
  def pictures_clear
    screen.clear_pictures
  end
end

#==============================================================================
>>>>>>> bee6204a96fd18d1a59c9ce744ae884afb7dcc8b
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
      update_scroll_dimension
      update_position
      update_zoom
      update_other
    end
  end
  #--------------------------------------------------------------------------
  # * update scroll dimension
  #--------------------------------------------------------------------------
  def update_scroll_dimension 
    @scroll_width = self.bitmap.width
    @scroll_height = self.bitmap.height
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
  alias_method :rm_extender_create_parallax, :create_parallax
  alias_method :rm_extender_dispose_parallax, :dispose_parallax
  alias_method :rm_extender_update_parallax, :update_parallax
  #--------------------------------------------------------------------------
  # * Public instances variables
  #--------------------------------------------------------------------------
  attr_accessor :picture_sprites
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
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :rm_extender_update, :update
  alias_method :rm_extender_update_origin, :update_origin
  #--------------------------------------------------------------------------
  # * Get cache
  #--------------------------------------------------------------------------
  def swap_cache(name)
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
  # * Update Transfer Origin Bitmap
  #--------------------------------------------------------------------------
  def update_bitmap
    if @picture.name.empty?
      self.bitmap = nil
    else
      self.bitmap = swap_cache(@picture.name)
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    rm_extender_update
    self.mirror = !self.mirror if @picture.mirror != self.mirror
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
    if @picture.origin.is_a?(Array)
      k_x, k_y = @picture.origin
      self.ox, self.oy = k_x, k_y
    else
      rm_extender_update_origin
    end
  end
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
  alias :rm_extender_conditions_met?  :conditions_met?
  #--------------------------------------------------------------------------
  # * Determine if Event Page Conditions Are Met
  #--------------------------------------------------------------------------
  def conditions_met?(page)
    value = rm_extender_conditions_met?(page)
    first = first_is_trigger?(page)
    return value unless first
    return value && first.()
  end
  #--------------------------------------------------------------------------
  # * Determine if the first command is a Trigger
  #--------------------------------------------------------------------------
  def first_is_trigger?(page)
    return false unless page || page.list || page.list[0]
    return false unless page.list[0].code == 355
    index = 0
    script = page.list[index].parameters[0] + "\n"
    while page.list[index].code == 655
      index += 1
      script += page.list[index].parameters[0] + "\n"
    end
    if script =~ /^\s*(trigger|listener)/
      potential_trigger = eval(script, $game_map.interpreter.get_binding)
      return potential_trigger if potential_trigger.is_a?(Proc)
    end
    return false
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
      map = load_data(sprintf("Data/Map%03d.rvdata2", map_id))
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
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :extender_command_101, :command_101
  alias_method :extender_command_111, :command_111
  alias_method :extender_command_105, :command_105
  alias_method :extender_command_355, :command_355 

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
    extender_command_355
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
# ** Commands Base
#------------------------------------------------------------------------------
#  Basics Commands
#==============================================================================

module Command
  #--------------------------------------------------------------------------
  # * Random number from a range
  #--------------------------------------------------------------------------
  def random(min=0, max)
    min, max = [min.to_i, max.to_i].sort
    min + Kernel.rand(max-min+1)
  end
  #--------------------------------------------------------------------------
  # * Random floating point value between x and its successor
  #--------------------------------------------------------------------------
  def random_figures(x=0)
    x + Kernel.rand
  end
  #--------------------------------------------------------------------------
  # * Return ID of current map
  #--------------------------------------------------------------------------
  def map_id
    $game_map.map_id
  end
  #--------------------------------------------------------------------------
  # * Return map's name
  #--------------------------------------------------------------------------
  def map_name
    $game_map.display_name
  end
  #--------------------------------------------------------------------------
  # * Get Event Id form coords
  #--------------------------------------------------------------------------
  def id_at(x, y)
    result = $game_map.event_id_xy(x, y)
    return result if result > 0
    return 0 if $game_player.x == x && $game_player.y == y
    return -1
  end
  #--------------------------------------------------------------------------
  # * Get terrain Tag from coords
  #--------------------------------------------------------------------------
  def terrain_tag(x, y)
    $game_map.terrain_tag(x, y)
  end
  #--------------------------------------------------------------------------
  # * Get Tile ID from coords and layer (0,1,2)
  #--------------------------------------------------------------------------
  def tile_id(x, y, layer)
    $game_map.tile_id(x, y, layer)
  end
  #--------------------------------------------------------------------------
  # * Get Region ID from coords
  #--------------------------------------------------------------------------
  def region_id(x, y)
    $game_map.region_id(x, y)
  end
  #--------------------------------------------------------------------------
  # * Check passability
  #--------------------------------------------------------------------------
  def square_passable?(x, y, d=2)
    $game_map.passable?(x, y, d)
  end
  #--------------------------------------------------------------------------
  # * Get a percent
  #--------------------------------------------------------------------------
  def percent(value, max)
    ((value*100.0)/max).to_i
  end
  #--------------------------------------------------------------------------
  # * Get a value from a percent
  #--------------------------------------------------------------------------
  def apply_percent(percent, max)
    ((percent*max)/100.0).to_i
  end
  #--------------------------------------------------------------------------
  # * Include event page
  #--------------------------------------------------------------------------
  def include_page(map_id, ev_id, p_id, if_runnable = false, context=false)
    return unless self.class == Game_Interpreter
    page = Game_Interpreter.get_page(map_id, ev_id, p_id)
    return unless page
    if !if_runnable || page_runnable?(map_id, ev_id, page, context)
      self.append_interpreter(page)
    end
  end
  #--------------------------------------------------------------------------
  # * Invoke Event
  #--------------------------------------------------------------------------
  def invoke_event(map_id, ev_id, new_id, x=nil, y=nil)
    $game_map.add_event(map_id, ev_id, new_id, x, y)
  end
  #--------------------------------------------------------------------------
  # * Get the max Event ID
  #--------------------------------------------------------------------------
  def max_event_id; $game_map.max_id; end
  def fresh_event_id; max_event_id + 1; end
  #--------------------------------------------------------------------------
  # * Check if a page is runnable
  #--------------------------------------------------------------------------
  def page_runnable?(map_id, ev_id, page, context=false)
    return unless self.class == Game_Interpreter
    page = Game_Interpreter.get_page(map_id, ev_id, p_id) if page.is_a?(Fixnum)
    return unless page
    return Game_Interpreter.conditions_met?(map_id, ev_id, page) if context
    c_map_id = Game_Interpreter.current_map_id
    c_ev_id = self.event_id
    Game_Interpreter.conditions_met?(c_map_id, c_ev_id, page)
  end
  #--------------------------------------------------------------------------
  # * Create a tone
  #--------------------------------------------------------------------------
  def tone(r, v, b, gray = 0)
    Tone.new(r, v, b, gray)
  end
  #--------------------------------------------------------------------------
  # * Create a Color
  #--------------------------------------------------------------------------
  def color(r, v, b, a = 255)
    Color.new(r,v,b,a)
  end
end

#==============================================================================
# ** Commands Device
#------------------------------------------------------------------------------
#  Device commands
#==============================================================================

module Command
  #--------------------------------------------------------------------------
  # * Keyboard support
  #--------------------------------------------------------------------------
  def key_press?(k);        Keyboard.press?(k);             end
  def key_trigger?(k);      Keyboard.trigger?(k);           end
  def key_release?(k);      Keyboard.release?(k);           end
  def key_repeat?(k);       Keyboard.repeat?(k);            end
  def ctrl?(k=nil);         Keyboard.ctrl?(k);              end
  def keyboard_all?(m, *k); Keyboard.all?(m, *k);           end
  def keyboard_any?(m, *k); Keyboard.any?(m, *k);           end
  def caps_lock?;           Keyboard.caps_lock?;            end
  def num_lock?;            Keyboard.num_lock?;             end
  def scroll_lock?;         Keyboard.scroll_lock?;          end
  def shift?;               Keyboard.shift?;                end
  def alt_gr?;              Keyboard.alt_gr?;               end
  def key_time(k);          Keyboard.time(k);               end
  def key_current(*m);      Keyboard.current_key(*m);       end
  def key_current_rgss(*m); Keyboard.rgss_current_key(*m);  end
  def keyboard_current_digit; Keyboard.current_digit;         end
  def keyboard_current_char;  Keyboard.current_char;          end
  #--------------------------------------------------------------------------
  # * Mouse Support
  #--------------------------------------------------------------------------
  def mouse_press?(k);    Mouse.press?(k);                end
  def mouse_click?;       Mouse.click?;                   end
  def mouse_trigger?(k);  Mouse.trigger?(k);              end
  def mouse_release?(k);  Mouse.release?(k);              end
  def mouse_dragging?;    Mouse.dragging?;                end
  def mouse_repeat?(k);   Mouse.repeat?(k);               end
  def mouse_all?(m, *k);  Mouse.all?(m, *k);              end
  def mouse_any?(m, *k);  Mouse.any?(m, *k);              end
  def mouse_x;            Mouse.x;                        end
  def mouse_y;            Mouse.y;                        end
  def mouse_point;        Mouse.point;                    end 
  def mouse_square_x;     Mouse.square_x;                 end
  def mouse_square_y;     Mouse.square_y;                 end
  def mouse_rect;         Mouse.rect;                     end
  def mouse_last_rect;    Mouse.last_rect;                end
  def click_time(k);      Mouse.time(k);                  end
  def mouse_in?(rect);    Mouse.in?(rect);                end
  def mouse_current_key(*m)   Mouse.current_key(*m);      end
end

#==============================================================================
# ** Commands Device
#------------------------------------------------------------------------------
#  Common Commands
#==============================================================================

module Command
  #--------------------------------------------------------------------------
  # * Party data
  #--------------------------------------------------------------------------
  def team_size; $game_party.members.size; end
  def gold; $game_party.gold; end
  def steps; $game_party.steps; end
  def play_time; (Graphics.frame_count / Graphics.frame_rate); end
  def timer; $game_timer.sec; end
  def save_count; $game_system.save_count; end
  def battle_count; $game_system.battle_count; end
  def gain_gold(amount); $game_party.gain_gold(amount); end
  def lose_gold(amount); $game_party.lose_gold(amount); end
  #--------------------------------------------------------------------------
  # * Items
  #--------------------------------------------------------------------------
  def item_count(id); $game_party.item_number($data_items[id]); end
  def weapon_count(id); $game_party.item_number($data_weapons[id]); end
  def armor_count(id); $game_party.item_number($data_armors[id]); end
  def item_name(id); $data_items[id].name; end
  def weapon_name(id); $data_weapons[id].name; end
  def armor_name(id); $data_armors[id].name; end
  def item_note(id); $data_items[id].note; end
  def weapon_note(id); $data_weapons[id].note; end
  def armor_note(id); $data_armors[id].note; end
  def item_description(id); $data_items[id].description; end
  def weapon_description(id); $data_weapons[id].description; end
  def armor_description(id); $data_armors[id].description; end
  def item_icon(id); $data_items[id].icon_index; end
  def weapon_icon(id); $data_weapons[id].icon_index; end
  def armor_icon(id); $data_armors[id].icon_index; end
  def item_price(id); $data_items[id].price; end
  def weapon_price(id); $data_weapons[id].price; end
  def armor_price(id); $data_armors[id].price; end
  def item_consumable?(id); $data_items[id].consumable; end
  def is_key_item?(id); $data_items[id].key_item?; end
  def weapon_max_hit_points(id); $data_weapons[id].params[0]; end
  def weapon_max_magic_points(id); $data_weapons[id].params[1]; end
  def weapon_attack_power(id); $data_weapons[id].params[2]; end
  def weapon_defense_power(id); $data_weapons[id].params[3]; end
  def weapon_magic_attack_power(id); $data_weapons[id].params[4]; end
  def weapon_magic_defense_power(id); $data_weapons[id].params[5]; end
  def weapon_agility(id); $data_weapons[id].params[6]; end
  def weapon_luck(id); $data_weapons[id].params[7]; end
  def armor_max_hit_points(id); $data_armors[id].params[0]; end
  def armor_max_magic_points(id); $data_armors[id].params[1]; end
  def armor_attack_power(id); $data_armors[id].params[2]; end
  def armor_defense_power(id); $data_armors[id].params[3]; end
  def armor_magic_attack_power(id); $data_armors[id].params[4]; end
  def armor_magic_defense_power(id); $data_armors[id].params[5]; end
  def armor_agility(id); $data_armors[id].params[6]; end
  def armor_luck(id); $data_armors[id].params[7]; end

  def give_item(id, amount)
    item = $data_items[id];
    $game_party.gain_item(item, amount, include_equip)
  end
  def give_weapon(id, amount, include_equip = false)
    item = $data_weapons[id];
    $game_party.gain_item(item, amount, include_equip)
  end
  def give_armor(id, amount, include_equip = false)
    item = $data_armors[id];
    $game_party.gain_item(item, amount, include_equip)
  end
  def has_item?(id)
    item = $data_items[id]
    $game_party.has_item?(item)
  end
  def has_weapon?(id, include_equip = false)
    item = $data_weapons[id]
    $game_party.has_item?(item, include_equip)
  end
  def has_armor?(id, include_equip = false)
    item = $data_armors[id]
    $game_party.has_item?(item, include_equip)
  end
  def weapon_equiped?(id, member = nil)
    item = $data_weapons[id]
    return $game_party.members_equip_include?(item) unless member
    $game_actors[member].equips.include?(item)
  end
  def armor_equiped?(id, member = nil)
    item = $data_armors[id]
    return $game_party.members_equip_include?(item) unless member
    $game_actors[member].equips.include?(item)
  end
  
  def weapon_type(id)
   i = $data_weapons[id].wtype_id
   $data_system.weapon_types[i]
  end
  def armor_type(id)
    i = $data_armors[id].atype_id
    $data_system.armor_types[i]
  end
  def item_scope(id)
    $data_items[id].scope
  end
  def item_has_no_scope?(id)
    item_scope(id) == 0
  end
  def item_for_one_enemy?(id)
    item_scope(id) == 1
  end
  def item_for_all_enemies?(id)
    item_scope(id) == 2
  end
  def item_for_one_random_enemy?(id)
    item_scope(id) == 3
  end
  def item_for_two_random_enemy?(id)
    item_scope(id) == 4
  end
  def item_for_three_random_enemy?(id)
    item_scope(id) == 5
  end
  def item_for_four_random_enemy?(id)
    item_scope(id) == 6
  end
  def item_for_one_ally?(id)
    item_scope(id) == 7
  end
  def item_for_all_allies?(id)
    item_scope(id) == 8
  end
  def item_for_one_dead_ally?(id)
    item_scope(id) == 9
  end
  def item_for_all_dead_allies?(id)
    item_scope(id) == 10
  end
  def item_for_caller?(id)
    item_scope(id) == 11
  end
  def item_occasion(id)
    $data_items[id].occasion
  end
  def item_always_usable?(id)
    item_occasion(id) == 0
  end
  def item_battle_usable?(id)
    item_always_usable?(id) || item_occasion(id) == 1
  end
  def item_menu_usable?(id)
    item_always_usable?(id) || item_occasion(id) == 2
  end
  def item_never_usable?(id)
    item_occasion(id) == 3 
  end
  def item_for_oponent?(i); $data_items[i].for_opponent?; end
  def item_for_friend?(i); $data_items[i].for_friend?; end 
  def item_for_dead_friend?(i); $data_items[i].for_dead_friend?; end 
  def item_for_one?(i); $data_items[i].for_one?; end 
  def item_for_random?(i); $data_items[i].for_random?; end 
  def item_for_all?(i); $data_items[i].for_all?; end 
  def item_need_selection?(i); $data_items[i].need_selection?; end 
  def item_certain?(i); $data_items[i].certain?; end 
  def item_physical?(i); $data_items[i].physical?; end 
  def item_magical?(i); $data_items[i].magical?; end 
  def item_number_of_targets(i); $data_items[i].number_of_targets; end 
  def item_speed(i); $data_items[i].speed; end 
  def item_nb_hits(i); $data_items[i].repeats; end 
  def item_success_rate(i); $data_items[i].success_rate; end
  def item_tp_gain(i); $data_items[i].tp_gain; end
  #--------------------------------------------------------------------------
  # * Systems
  #--------------------------------------------------------------------------
  def sys; $data_system; end
  def game_title; sys.game_title; end
  def version_id; sys.version_id; end
  def currency; sys.currency_unit; end
  def start_map_id; sys.start_map_id; end
  def start_x; sys.start_x; end 
  def start_y; sys.start_y; end
  #--------------------------------------------------------------------------
  # * Database Actor
  #--------------------------------------------------------------------------
  def type_equip(str)
    [:Weapon, :Shield, :Head, :Body, :Accessory].index(str)
  end
  def actor_equip(id, t)
    k = $game_actors[id].equips[type_equip(t)]
    (k.nil?) ? 0 : k.id
  end
  def actor_weapon(id); actor_equip(id, :Weapon); end 
  def actor_shield(id); actor_equip(id, :Shield); end 
  def actor_head(id); actor_equip(id, :Head); end 
  def actor_body(id); actor_equip(id, :Body); end 
  def actor_description(id); $game_actors[id].description; end
  def actor_accessory(id); actor_equip(id, :Accessory); end
  def actor_has_weapon?(id); actor_weapon(id) != 0; end 
  def actor_has_shield?(id); actor_shield(id) != 0; end 
  def actor_has_head?(id); actor_head(id) != 0; end 
  def actor_has_body?(id); actor_body(id) != 0; end 
  def actor_has_accessory?(id); actor_accessory(id) != 0; end 
  def actor_level(id); $game_actors[id].level; end
  def actor_level_max(id); $game_actors[id].max_level; end
  def actor_exp(id); $game_actors[id].exp; end
  def actor_note(id);  $game_actors[id].actor.note; end
  def actor_hp(id); $game_actors[id].hp; end 
  def actor_mp(id); $game_actors[id].mp; end 
  def actor_tp(id); $game_actors[id].tp; end 
  def actor_max_hp(id); $game_actors[id].mhp; end 
  def actor_max_mp(id); $game_actors[id].mmp; end 
  def actor_attack(id); $game_actors[id].atk; end 
  def actor_defense(id); $game_actors[id].def; end 
  def actor_magic_attack(id); $game_actors[id].mat; end 
  def actor_magic_defense(id); $game_actors[id].mdf; end 
  def actor_agility(id); $game_actors[id].agi; end 
  def actor_luck(id); $game_actors[id].luk; end
  def actor_hit_rate(id); $game_actors[id].hit; end
  def actor_evasion_rate(id); $game_actors[id].eva; end
  def actor_critical_rate(id); $game_actors[id].cri; end 
  def actor_critical_evasion_rate(id); $game_actors[id].cev; end 
  def actor_magical_evasion_rate(id); $game_actors[id].mev; end 
  def actor_magical_reflection_rate(id); $game_actors[id].mrf; end 
  def actor_counter_attack_rate(id); $game_actors[id].cnt; end 
  def actor_hp_regeneration_rate(id); $game_actors[id].hrg; end 
  def actor_mp_regeneration_rate(id); $game_actors[id].mrg; end 
  def actor_tp_regeneration_rate(id); $game_actors[id].trg; end 
  def actor_target_rate(id); $game_actors[id].tgr; end 
  def actor_guard_effect_rate(id); $game_actors[id].grd; end 
  def actor_recovery_effect_rate(id); $game_actors[id].rec; end 
  def actor_pharmacology(id); $game_actors[id].pha; end 
  def actor_mp_cost_rate(id); $game_actors[id].mcr; end 
  def actor_tp_charge_rate(id); $game_actors[id].tcr; end 
  def actor_physical_damage_rate(id); $game_actors[id].pdr; end 
  def actor_magical_damage_rate(id); $game_actors[id].mdr; end 
  def actor_floor_damage_rate(id); $game_actors[id].fdr; end
  def actor_experience_rate(id); $game_actors[id].exr; end 
  def actor_name(id); $game_actors[id].name; end
  def set_actor_name(id, n); $game_actors[id].name = n; end
  def actor_nickname(id); $game_actors[id].nickname; end
  def set_actor_nickname(id, n); $game_actors[id].nickname = n; end
  def actor_character_name(id); $game_actors[id].character_name; end
  def actor_character_index(id); $game_actors[id].character_index; end
  def actor_face_name(id); $game_actors[id].face_name; end
  def actor_face_index(id); $game_actors[id].face_index; end
  def actor_class(id); $game_actors[id].class_id; end
  def actor_exp_for_next_level(id); $game_actors[id].next_level_exp; end
  def actor_change_equip(id, slot, wp_id)
    $game_actors[id].change_equip_by_id(type_equip(slot), wp_id)
  end
  def actor_equip_weapon(id, wp); actor_equip(id, :Weapon, wp_id); end 
  def actor_equip_shield(id, wp); actor_equip(id, :Shield, wp_id); end 
  def actor_equip_head(id, wp); actor_equip(id, :Head, wp_id); end 
  def actor_equip_body(id, wp); actor_equip(id, :Body, wp_id); end 
  def actor_equip_accessory(id, wp); actor_equip(id, :Accessory, wp_id); end 
  def actor_optimize_equipement(id); $game_actors[id].optimize_equipement; end
  def actor_level_up(id); $game_actors[id].level_up; end
  def actor_level_down(id); $game_actors[id].level_down; end
  def actor_give_exp(id, exp); $game_actors[id].gain_exp(exp); end
  def actor_learn(id, skill_id); $game_actors[id].learn_skill(skill_id); end
  def actor_forget(id, skill_id); $game_actors[id].forget_skill(skill_id); end
  def actor_knowns?(id, skill_id); $game_actors[id].learn_skill?(skill_id); end
  def actor_set_graphic(character_name, character_index, face_name, face_index)
    $game_actors.set_graphic(character_name, character_index, face_name, face_index)
  end
  def actor_skills(id); $game_actors[id].skills.map{|s| s.id}; end
  def actor_weapons(id); $game_actors[id].weapons.map{|w| w.id}; end
  def actor_armors(id); $game_actors[id].armors.map{|a| a.id}; end
   #--------------------------------------------------------------------------
  # * Event position
  #--------------------------------------------------------------------------
  def event_x(id); event(id).x; end
  def event_y(id); event(id).y; end
  def event_screen_x(id); event(id).screen_x; end
  def event_screen_y(id); event(id).screen_y; end
  def event_pixel_y(id) 
    ($game_map.display_y * 32) + event_screen_y(id)
  end
  def event_pixel_x(id) 
    ($game_map.display_x * 32) + event_screen_x(id)
  end
  def event_direction(id); event(id).direction; end
  def player_x; event(0).x; end
  def player_y; event(0).y; end
  def player_screen_x; event(0).screen_x; end
  def player_screen_y; event(0).screen_y; end
  def player_pixel_x; event_pixel_x(0); end
  def player_pixel_y; event_pixel_y(0); end
  def player_direction; event(0).direction; end
  def distance_between(flag, ev1, ev2)
    ev1, ev2 = event(ev1), event(ev2)
    args = (ev1.screen_x-ev2.screen_x),(ev1.screen_y-ev2.screen_y)
    args = (ev1.x-ev2.x),(ev1.y-ev2.y) if flag == :square
    Math.hypot(*args).to_i
  end
  def squares_between(ev1, ev2); distance_between(:square, ev1, ev2); end
  def pixels_between(ev1, ev2); distance_between(:pixel, ev1, ev2); end
  def event_look_at?(ev, to, scope, metric = :square)
    if event_direction(ev) == 8
      x_axis = event_x(to) == event_x(ev)
      y_axis = event_y(ev) > event_y(to)
    end
    if event_direction(ev) == 2
      x_axis = event_x(to) == event_x(ev)
      y_axis = event_y(ev) < event_y(to)
    end
    if event_direction(ev) == 4
      x_axis = event_x(to) < event_x(ev)
      y_axis = event_y(ev) == event_y(to)
    end
    if event_direction(ev) == 6
      x_axis = event_x(to) > event_x(ev)
      y_axis = event_y(ev) == event_y(to)
    end
    return x_axis && y_axis && (distance_between(metric, ev, to)<=scope)
  end
  def event_collide?(ev1, ev2)
    event1 = event(ev1)
    event2 = event(ev2)
    flag = case event1.direction
    when 2; event2.x == event1.x && event2.y == event1.y+1
    when 4; event2.x == event1.x-1 && event2.y == event1.y
    when 6; event2.x == event1.x+1 && event2.y == event1.y
    when 8; event2.x == event1.x && event2.y == event1.y-1
    else; false
    end
    return flag && !event1.moving?
  end
  def event_in_screen?(id)
    ev = event(id)
    check_x = ev.screen_x > 0 && ev.screen_x < Graphics.width
    check_y = ev.screen_y > 0 && ev.screen_y < Graphics.height
    check_x && check_y
  end
  def player_in_screen?
    event_in_screen?(0)
  end
  #--------------------------------------------------------------------------
  # * Skills
  #--------------------------------------------------------------------------
  def skill_name(id); $data_skills[id].name; end 
  def skill_note(id); $data_skills[id].note; end 
  def skill_description(id); $data_skills[id].description; end
  def skill_icon(id); $data_skills[id].icon_index; end
  def skill_scope(id)
    $data_skills[id].scope
  end
  def skill_has_no_scope?(id)
    skill_scope(id) == 0
  end
  def skill_for_one_enemy?(id)
    skill_scope(id) == 1
  end
  def skill_for_all_enemies?(id)
    skill_scope(id) == 2
  end
  def skill_for_one_random_enemy?(id)
    skill_scope(id) == 3
  end
  def skill_for_two_random_enemy?(id)
    skill_scope(id) == 4
  end
  def skill_for_three_random_enemy?(id)
    skill_scope(id) == 5
  end
  def skill_for_four_random_enemy?(id)
    skill_scope(id) == 6
  end
  def skill_for_one_ally?(id)
    skill_scope(id) == 7
  end
  def skill_for_all_allies?(id)
    skill_scope(id) == 8
  end
  def skill_for_one_dead_ally?(id)
    skill_scope(id) == 9
  end
  def skill_for_all_dead_allies?(id)
    skill_scope(id) == 10
  end
  def skill_for_caller?(id)
    skill_scope(id) == 11
  end
  def skill_occasion(id)
    $data_skills[id].occasion
  end
  def skill_always_usable?(id)
    skill_occasion(id) == 0
  end
  def skill_battle_usable?(id)
    skill_always_usable(id) || skill_occasion(id) == 1
  end
  def skill_menu_usable?(id)
    skill_always_usable(id) || skill_occasion(id) == 2
  end
  def skill_never_usable?(id)
    skill_occasion(id) == 3
  end
  def skill_for_oponent?(i); $data_skills[i].for_opponent?; end
  def skill_for_friend?(i); $data_skills[i].for_friend?; end 
  def skill_for_dead_friend?(i); $data_skills[i].for_dead_friend?; end 
  def skill_for_one?(i); $data_skills[i].for_one?; end 
  def skill_for_random?(i); $data_skills[i].for_random?; end 
  def skill_for_all?(i); $data_skills[i].for_all?; end 
  def skill_need_selection?(i); $data_skills[i].need_selection?; end 
  def skill_certain?(i); $data_skills[i].certain?; end 
  def skill_physical?(i); $data_skills[i].physical?; end 
  def skill_magical?(i); $data_skills[i].magical?; end 
  def skill_number_of_targets(i); $data_skills[i].number_of_targets; end 
  def skill_speed(i); $data_skills[i].speed; end 
  def skill_nb_hits(i); $data_skills[i].repeats; end 
  def skill_success_rate(i); $data_skills[i].success_rate; end
  def skill_tp_gain(i); $data_skills[i].tp_gain; end
  #--------------------------------------------------------------------------
  # * Math
  #--------------------------------------------------------------------------
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
  end
end
