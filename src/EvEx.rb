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
    $game_self_vars[[map_id, ev_id, id]] = value
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
  alias_method :listener, :trigger
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
  attr_reader :angle
  attr_reader :blend_type
  attr_accessor :text_value 
  attr_reader :profile
  attr_accessor :target_y, :target_x
  attr_accessor :target_zoom_x, :target_zoom_y
  attr_accessor :target_opacity
  attr_accessor :duration
  #--------------------------------------------------------------------------
  # * Constructor
  #--------------------------------------------------------------------------
  def initialize(index)
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
    @duration = 0
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
  # * Update frame
  #--------------------------------------------------------------------------
  def update
    update_move
    update_rotate
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
    @opacity = (@opacity * (d - 1) + @target_opacity) / d
    @duration -= 1
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
  #--------------------------------------------------------------------------
  # * Event name
  #--------------------------------------------------------------------------
  def name 
    nil
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
  alias_method :rm_extender_setup_events, :setup_events
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
  #--------------------------------------------------------------------------
  # * Event Setup
  #--------------------------------------------------------------------------
  def setup_events
    rm_extender_setup_events
    @common_events.each {|event| event.refresh }
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
  #--------------------------------------------------------------------------
  # * Public instance variable
  #--------------------------------------------------------------------------
  attr_reader :texts 
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias :displaytext_initialize :initialize
  alias :displaytext_update     :update
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
    width, height = widths.max, heights.max
    total_height = height * lines.length
    self.bitmap = Bitmap.new(width+32, total_height)
    self.bitmap.font = font 
    iterator = 0 
    lines.each do |line|
      self.bitmap.draw_text(0, iterator, width+32, height, line, 0)
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
  attr_accessor  :duration
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
  alias_method :rme_initialize, :initialize
  alias_method :rme_dispose, :dispose
  alias_method :rme_update,  :update
  alias_method :rm_extender_create_parallax, :create_parallax
  alias_method :rm_extender_dispose_parallax, :dispose_parallax
  alias_method :rm_extender_update_parallax, :update_parallax
  #--------------------------------------------------------------------------
  # * Public instances variables
  #--------------------------------------------------------------------------
  attr_accessor :picture_sprites
  #--------------------------------------------------------------------------
  # * Constructor
  #--------------------------------------------------------------------------
  def initialize
    create_texts
    rme_initialize
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
    if first.is_a?(Array)
      return first[0].()
    end
    return value unless first
    return value && first.()
  end
  #--------------------------------------------------------------------------
  # * Determine if the first command is a Trigger
  #--------------------------------------------------------------------------
  def first_is_trigger?(page)
    return false unless page || page.list || page.list[0]
    return false unless page.list[0].code == 355
    script = page.list[0].parameters[0] + "\n"
    index = 1
    while page.list[index].code == 655
      script += page.list[index].parameters[0] + "\n"
      index += 1
    end
    if script =~ /^\s*(trigger|listener)/
      potential_trigger = eval(script, $game_map.interpreter.get_binding)
      return potential_trigger if potential_trigger.is_a?(Proc)
    elsif script =~ /^\s*(ignore_left)/
      potential_trigger = eval(script, $game_map.interpreter.get_binding)
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
  def me; @event_id; end
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
