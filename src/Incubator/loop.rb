if RME.allowed?(:extender_loop)

  class Loop_Iterator
    
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
      if !@driver || !@driver.is_a?(Proc)
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
      value = current_value + offset
      state = current_driver.call(value)
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
      lambda{|i| [true, i]}
    end

    def set_driver(&block)
      @driver = block
    end
  end

  class Game_Interpreter

    attr_reader :loop_iterator
    alias_method :loop_clear, :clear
    alias_method :loop_command_112, :command_112
    alias_method :loop_command_413, :command_413
    alias_method :loop_command_113, :command_113

    def clear
      @loop_iterator = Loop_Iterator.new
      loop_clear
    end

    def command_112
      @loop_iterator.exec(@indent, 0)
      loop_command_112
    end

    def command_113
      @loop_iterator.remove(@indent-1)
      loop_command_113
    end

    def command_413
      it = @loop_iterator.get(@indent)
      if it
        unless it[:continue]
          @loop_iterator.remove(@indent)
          return
        end
        @loop_iterator.exec(@indent, 1)
      end
      loop_command_413
    end

  end

  module Loop_Commands

    def loop_step
      return if @indent == 0
      iterator = loop_iterator.get(@indent - 1)
      return iterator[:value] if iterator && iterator[:value]
      return nil
    end

    def loop_state
      return if @indent == 0
      iterator = loop_iterator.get(@indent - 1)
      return iterator[:state] if iterator && iterator[:state]
      return nil
    end

    def loop_for(array)
      loop_iterator.set_driver do |step|
        if array.length == 0 then [false, nil]
        else
          [step < (array.length - 1), array[step]]
        end
      end
    end

    def loop_times(i)
      loop_for((1..i).to_a)
    end
    
    append_commands
  end
  
end
