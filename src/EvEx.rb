#==============================================================================
# ** RME V1.0.0 Evex
#------------------------------------------------------------------------------
#  With : 
# Grim (original project)
# Nuki 
# Raho
#------------------------------------------------------------------------------
# An RPGMaker's Event extention
#==============================================================================

#==============================================================================
# ** Command
#------------------------------------------------------------------------------
#  Command Extension
#==============================================================================



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
# ** Game_Map
#------------------------------------------------------------------------------
# This class handles maps. It includes scrolling and passage determination
# functions. The instance of this class is referenced by $game_map.
#==============================================================================
class Game_Map
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
# ** Game_Interpreter
#------------------------------------------------------------------------------
#  An interpreter for executing event commands. This class is used within the
# Game_Map, Game_Troop, and Game_Event classes.
#==============================================================================

class Game_Interpreter
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias extender_command_101 command_101
  alias extender_command_111 command_111
  alias extender_command_105 command_105
  alias extender_command_355 command_355 
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    #--------------------------------------------------------------------------
    # * Public instances variables
    #--------------------------------------------------------------------------
    attr_accessor :current_id
    attr_accessor :current_map_id
  end
  #--------------------------------------------------------------------------
  # * Show Text
  #--------------------------------------------------------------------------
  def command_101
    $game_message.call_event = @id
    extender_command_101
  end
  #--------------------------------------------------------------------------
  # * Show Scrolling Text
  #--------------------------------------------------------------------------
  def command_105
    $game_message.call_event = @id
    extender_command_105
  end
  #--------------------------------------------------------------------------
  # * Append Interpreter
  #--------------------------------------------------------------------------
  def append_interpreter(map_id, id, page_id)
    map = load_data(sprintf("Data/Map%03d.rvdata2", map_id))
    return unless map
    event = map.events[id]
    return unless event
    page = event.pages[page_id-1]
    return unless page
    list = page.list
    child = Game_Interpreter.new(@depth + 1)
    child.setup(list, same_map? ? @id : 0)
    child.run
  end
  #--------------------------------------------------------------------------
  # * Conditional Branch
  #--------------------------------------------------------------------------
  def command_111
    Game_Interpreter.current_id = @id
    Game_Interpreter.current_map_id = @map_id
    extender_command_111
  end
  #--------------------------------------------------------------------------
  # * Script
  #--------------------------------------------------------------------------
  def command_355
    Game_Interpreter.current_id = @id
    Game_Interpreter.current_map_id = @map_id
    extender_command_355
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


module Command
  #--------------------------------------------------------------------------
  # * Random between range
  #--------------------------------------------------------------------------
  def random(*min, max)
    min[0] ||= 0
    min, max = [min[0], max.to_i].sort
    min + Kernel.rand(max-min)
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
    $game_map.map_name
  end
  #--------------------------------------------------------------------------
  # * Get Event Id form coords
  #--------------------------------------------------------------------------
  def id_at(x, y)
    result = $game_map.id_xy(x, y)
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
  def include_page(map_id, id, page_id)
    return unless self.class == Game_Interpreter
    self.append_interpreter(map_id, id, page_id)
  end
  #--------------------------------------------------------------------------
  # * Invoke Event
  #--------------------------------------------------------------------------
  def invoke_event(map_id, event_id, new_id, x=nil, y=nil)
    $game_map.add_event(map_id, event_id, new_id, x, y)
  end
  #--------------------------------------------------------------------------
  # * Get the max Event ID
  #--------------------------------------------------------------------------
  def max_event_id; $game_map.max_id; end
  def fresh_event_id; max_event_id + 1; end
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
    msg = "[#{args[0]}] doesn't exists. Did you mean maybe [#{keywords[0]}]"+snd+"?"
    raise(NoMethodError, msg)
  end
end