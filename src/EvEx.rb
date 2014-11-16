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
  alias_method :rm_extender_setup, :setup
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    #--------------------------------------------------------------------------
    # * Public instances variables
    #--------------------------------------------------------------------------
    attr_accessor :loaded_proc
    Game_Map.loaded_proc ||= Hash.new 
    #--------------------------------------------------------------------------
    # * Map onload
    #--------------------------------------------------------------------------
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
    # * Eval proc
    #--------------------------------------------------------------------------
    def eval_proc(id, i)
      if Game_Map.loaded_proc.has_key?(id)
        Game_Map.loaded_proc[id].call
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Setup
  #--------------------------------------------------------------------------
  def setup(map_id)
    rm_extender_setup(map_id)
    Game_Map.eval_proc(:all, self.interpreter)
    Game_Map.eval_proc(map_id, self.interpreter)
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
# ** Commands Base
#------------------------------------------------------------------------------
#  Parallaxes Commands
#==============================================================================

module Command
  #--------------------------------------------------------------------------
  # * Show parallax
  #--------------------------------------------------------------------------
  def parallax_show(
      id, 
      name, 
      z  = -100, 
      op = 255, 
      ax = 0, 
      ay = 0, 
      mx = 2, 
      my = 2, 
      b  = 0, 
      zx = 100, 
      zy = 100
    )
    $game_map.parallaxes[id].show(name, z, op, ax, ay, mx, my, b, zx, zy)
  end
  #--------------------------------------------------------------------------
  # * Move parallax
  #--------------------------------------------------------------------------
  def parallax_transform(
      id, 
      duration, 
      wf = false, 
      zoom_x = 100, 
      zoom_y = 100, 
      opacity = 255, 
      tone = nil
    )
    $game_map.parallaxes[id].move(duration, zoom_x, zoom_y, opacity, tone)
    wait(duration) if wf
  end
  #--------------------------------------------------------------------------
  # * Hide parallax
  #--------------------------------------------------------------------------
  def parallax_erase(id)
    $game_map.parallaxes[id].hide
  end
  #--------------------------------------------------------------------------
  # * Hide all parallax
  #--------------------------------------------------------------------------
  def parallaxes_clear
    $game_map.clear_parallaxes
  end
  #--------------------------------------------------------------------------
  # * Change blend type of a parallax
  #--------------------------------------------------------------------------
  def parallax_blend(id, v)
    $game_map.parallaxes[id].blend_type = v
  end
  #--------------------------------------------------------------------------
  # * Change autospeed_x 
  #--------------------------------------------------------------------------
  def parallax_autoscroll_x(id, v, duration = nil, wf = false)
    if duration.is_a?(Fixnum)
      pr = $game_map.parallaxes[id]
      pr.start_auto_change(v.to_f, pr.autospeed_y, duration)
      wait(duration) if wf
    else
      $game_map.parallaxes[id].autospeed_x = v
    end
  end
  #--------------------------------------------------------------------------
  # * Change autospeed_x 
  #--------------------------------------------------------------------------
  def parallax_autoscroll_y(id, v, duration = nil, wf = false)
    if duration.is_a?(Fixnum)
      pr = $game_map.parallaxes[id]
      pr.start_auto_change(pr.autospeed_x, v.to_f, duration)
      wait(duration) if wf
    else
      $game_map.parallaxes[id].autospeed_y = v
    end
  end
  #--------------------------------------------------------------------------
  # * Change scroll_x
  #--------------------------------------------------------------------------
  def parallax_scroll_x(id, v)
    $game_map.parallaxes[id].move_x = v
  end
  #--------------------------------------------------------------------------
  # * Change scroll_y
  #--------------------------------------------------------------------------
  def parallax_scroll_y(id, v)
    $game_map.parallaxes[id].move_y = v
  end
  #--------------------------------------------------------------------------
  # * Change zoom_x
  #--------------------------------------------------------------------------
  def parallax_zoom_x(id, v, duration = nil, wf = false)
    if duration.is_a?(Fixnum)
      pr = $game_map.parallaxes[id]
      pr.move(duration, v, pr.zoom_y, pr.opacity)
      wait(duration) if wf
    else
      $game_map.parallaxes[id].zoom_x = v
    end
  end
  #--------------------------------------------------------------------------
  # * Change zoom_y
  #--------------------------------------------------------------------------
  def parallax_zoom_y(id, v, duration = nil, wf = false)
    if duration.is_a?(Fixnum)
      pr = $game_map.parallaxes[id]
      pr.move(duration, pr.zoom_x, v, pr.opacity)
      wait(duration) if wf
    else
      $game_map.parallaxes[id].zoom_y = v
    end
  end
  #--------------------------------------------------------------------------
  # * Change zoom
  #--------------------------------------------------------------------------
  def parallax_zoom(id, v, duration = nil, wf = false)
    if duration.is_a?(Fixnum)
      pr = $game_map.parallaxes[id]
      pr.move(duration, v, v, pr.opacity)
      wait(duration) if wf
    else
      $game_map.parallaxes[id].zoom_y = v
      $game_map.parallaxes[id].zoom_x = v
    end
  end
  #--------------------------------------------------------------------------
  # * Change tone
  #--------------------------------------------------------------------------
  def parallax_tone(id, v, duration = nil, wf = false)
    if duration.is_a?(Fixnum)
      pr = $game_map.parallaxes[id]
      pr.move(duration, pr.zoom_x, pr.zoom_y, pr.opacity, v)
      wait(duration) if wf
    else
      $game_map.parallaxes[id].tone = v
    end
  end
  #--------------------------------------------------------------------------
  # * Change opacity
  #--------------------------------------------------------------------------
  def parallax_opacity(id, v, duration = nil, wf = false)
    if duration.is_a?(Fixnum)
      pr = $game_map.parallaxes[id]
      pr.move(duration, pr.zoom_x, pr.zoom_y, v)
      wait(duration) if wf
    else
      $game_map.parallaxes[id].opacity = v
    end
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
  def picture_tone(id, *args)
    case args.length
    when 1; tone = args[0]
    else
      r, g, b = args[0], args[1], args[2]
      gray = args[3] || 0
      tone = Tone.new(r, g, b, gray)
    end
    pictures[id].tone = tone
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
    spr.in?(x, y) unless precise
    spr.precise_in?(x, y) if precise
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
  alias_method :rm_extender_update, :update
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
  # * Frame Update
  #     main:  Interpreter update flag
  #--------------------------------------------------------------------------
  def update(main = false)
    @parallaxes.each {|parallax| parallax.update}
    rm_extender_update(main)
  end
  #--------------------------------------------------------------------------
  # * Clear parallaxes
  #--------------------------------------------------------------------------
  def clear_parallaxes
    @parallaxes.each {|parallax| parallax.hide}
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
    (value*100)/max
  end
  #--------------------------------------------------------------------------
  # * Get a value from a percent
  #--------------------------------------------------------------------------
  def apply_percent(percent, max)
    (percent*max)/100
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
  # * Method suggestions
  #--------------------------------------------------------------------------
  def method_missing(*args)
    keywords = Command.singleton_methods
    keywords.uniq!
    keywords.delete(:method_missing)
    keywords.collect!{|i|i.to_s}
    keywords.sort_by!{|o| o.damerau_levenshtein(args[0].to_s)}
    snd = keywords.length > 1 ? " or [#{keywords[1]}]" : ""
    msg = "[#{args[0]}] doesn't exist. Did you mean [#{keywords[0]}]"+snd+"?"
    raise(NoMethodError, msg)
  end
  #--------------------------------------------------------------------------
  # * Create a tone
  #--------------------------------------------------------------------------
  def tone(r, v, b, gray = 0)
    Tone.new(r, v, b, gray)
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