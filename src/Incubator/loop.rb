# Short cut for Event Making Loop
# Based on Pico-loop, by Grim

if RME.allowed?(:extender_loop)
  
  class Loop_Iterator

    class << self

      def fresh
        {
          maps: {},
          commons: {}
        }
      end

      def for_array(array)
        lambda do |step|
          if array.length == 0 then [false, nil]
          else
            [step < (array.length - 1), array[step]]
          end
        end
      end

      def for_range(a, b)
        range = (a > b) ? (b..a).to_a.reverse : (a..b).to_a
        for_array(range)
      end
      
      def case_iterator(iterator)
        return lambda{|i| [true, i]} if iterator == :default
        if iterator.is_a?(Array)
          return for_array(iterator[1]) if iterator[0] == :array
          return for_range(iterator[1], iterator[2]) if iterator[0] == :range
        end
        raise RuntimeError, "Unknown iterator #{iterator}"
      end
      
    end
    
    attr_reader :iterators
    attr_reader :counter
    attr_reader :driver

    
    def initialize
      @iterators = {}
      @counter = 0
      clear_driver
    end

    def clear_driver
      @driver = default_driver
    end

    def realloc_driver
      if !@driver
        clear_driver
      end
    end

    def remove(indent)
      @iterators.delete(indent)
      @counter -= 1
      @counter = 0 if @counter < 0
      clear_driver
    end

    def exec(indent, offset)
      realloc_driver
      current = (get(indent) || {value: 0, driver: @driver})
      current_value = current[:value]
      current_driver = current[:driver]
      proc = Loop_Iterator.case_iterator(current_driver)
      value = current_value + offset
      state = proc.call(value)
      @iterators[indent] = {
        value: value,
        driver: current_driver,
        state: state[1],
        continue: state[0]
      }
      clear_driver
      @counter += 1
    end

    def get(id)
      @iterators[id]
    end

    def default_driver
      :default
    end

    def set_driver(driver)
      @driver = driver
    end
  end

  module DataManager
    
    class << self
      alias_method :loop_create_game_objects, :create_game_objects
      alias_method :loop_make_save_contents, :make_save_contents
      alias_method :loop_extract_save_contents, :extract_save_contents
      
      def create_game_objects
        loop_create_game_objects
        $game_loops = Loop_Iterator.fresh
      end

      def make_save_contents
        contents = loop_make_save_contents
        contents[:loops] = $game_loops
        contents
      end

      def extract_save_contents(contents)
        loop_extract_save_contents(contents)
        $game_loops = contents[:loops]
      end
      
    end
  end
  

  class Game_Interpreter

    alias_method :loop_command_112, :command_112
    alias_method :loop_command_413, :command_413
    alias_method :loop_command_113, :command_113

    def init_loop_iterator
      if common_event?
        $game_loops[:commons] ||= {}
        $game_loops[:commons][@common_event_id] ||= Loop_Iterator.new
      else
        $game_loops[:maps] ||= {}
        $game_loops[:maps][map_id] ||= {}
        $game_loops[:maps][map_id][@event_id] ||= Loop_Iterator.new
      end
    end

    def get_loop_iterator
      init_loop_iterator
      if common_event?
        $game_loops[:commons][@common_event_id]
      else
        $game_loops[:maps][map_id][@event_id]
      end
    end

    def command_112
      get_loop_iterator.exec(@indent, 0)
      loop_command_112
    end

    def command_113
      get_loop_iterator.remove(@indent-1)
      loop_command_113
    end

    def command_413
      it = get_loop_iterator.get(@indent)
      if it
        unless it[:continue]
          get_loop_iterator.remove(@indent)
          return
        end
        get_loop_iterator.exec(@indent, 1)
      end
      loop_command_413
    end

  end

  module Loop_Commands

    def loop_step
      return if @indent == 0
      iterator = get_loop_iterator.get(@indent - 1)
      return iterator[:value] if iterator && iterator[:value]
      return nil
    end

    def loop_state
      return if @indent == 0
      iterator = get_loop_iterator.get(@indent - 1)
      return iterator[:state] if iterator && iterator[:state]
      return nil
    end

    def loop_for(array)
      get_loop_iterator.set_driver([:array, array])
    end

    def loop_range(a, b)
      get_loop_iterator.set_driver([:range, a, b])
    end

    def loop_times(i)
      get_loop_iterator.set_driver([:range, 1, i.abs])
    end
    
    append_commands
  end
  
end
