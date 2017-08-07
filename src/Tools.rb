# -*- coding: utf-8 -*-
#==============================================================================
# ** RME
#------------------------------------------------------------------------------
#  With :
# Grim (original project)
# Nuki (a lot of things)
# Raho (general reformulation)
# Zeus81 (a lot of help)
# Hiino (some help and GUI Components)
# Joke (some help)
# Zangther (some help)
# XHTMLBoy (koffie)
# Fabien (Buzzer)
# Kaelar (Improvement)
#
#==============================================================================

=begin

License coming soon

=end

#==============================================================================
# ** Scene_Map
#------------------------------------------------------------------------------
#  This class performs the map screen processing.
#==============================================================================

class Scene_Map
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :tools_update, :update
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    tools_update
    update_eval if $TEST
  end
  #--------------------------------------------------------------------------
  # * Update eval
  #--------------------------------------------------------------------------
  def update_eval

    if (!@box || @box.disposed?)  &&Keyboard.trigger?(RME::Config::KEY_EVAL)
      @old_call_menu = $game_system.menu_disabled
      $game_system.menu_disabled = true
      @box = Graphical_Eval.new
    else
      if ((@box && !@box.disposed?) && Keyboard.any?(:trigger?, RME::Config::KEY_EVAL, :esc) && (
        !@box.in_completion?))
        @box.dispose
        Game_Temp.in_game = true
        @box = nil
        sleep(0.5)
        $game_system.menu_disabled = @old_call_menu
        return
      end
      @box.update if @box
    end

  end
end

#==============================================================================
# ** Graphical_tone
#------------------------------------------------------------------------------
#  Provide a Tone tester
#==============================================================================

class Graphical_tone 

  #--------------------------------------------------------------------------
  # * Init fonts
  #--------------------------------------------------------------------------
  def init_fonts
    @font = Font.new("Arial")
    @font.color = Color.new(0, 0, 0)
    @font.size = 10
    @font.shadow = false 
    @font.bold = false
    @font.outline = false
  end

  #--------------------------------------------------------------------------
  # * Build Object
  #--------------------------------------------------------------------------
  def initialize
    init_fonts
    @last_y = 0
    @disposed = false
    @base_tone = $game_map.screen.tone.clone
    @current_tone = $game_map.screen.tone.clone
    create_box
    create_root
    create_components
    create_simulator
    Draggable << @box
    @box.drag_restriction = Rect.new(
      0, 0, Graphics.width - @box.width, Graphics.height - @box.height
    )
  end

  #--------------------------------------------------------------------------
  # * Check if the box is disposed
  #--------------------------------------------------------------------------
  def disposed? 
    @disposed
  end
  
  #--------------------------------------------------------------------------
  # * Create root
  #--------------------------------------------------------------------------
  def create_root
    @root = Gui::Box.new(
      width: 100.percent, 
      height: 100.percent, 
      border: 0,
      parent: @box, 
      padding: 0
    )
  end


  #--------------------------------------------------------------------------
  # * Dispose the box
  #--------------------------------------------------------------------------
  def dispose 
    $game_map.screen.tone.set(@base_tone)
    @wait_label.dispose
    @box.dispose
    @disposed = true
  end

  #--------------------------------------------------------------------------
  # * Create General Box
  #--------------------------------------------------------------------------
  def create_box
    @box = Gui::Pannel.new(
      width: 175, 
      height: 200,
      title: "Testeur de teintes",
      x: 10, 
      y: 10, 
      z: 4000,
      padding: 0,
      margin: 6,
      border_color: Color.new('#113F59'),
      background_color: Color.new(255, 255, 255)
    )
  end

  #--------------------------------------------------------------------------
  # * Create a trackbar
  #--------------------------------------------------------------------------
  def create_trackbar(kind, i)
    offset = (kind == "gray") ? 0 : 255
    instance_variable_set(
      "@#{kind}_track", 
      Gui::TrackBar.new(
        parent: @root, 
        x: 10,
        y: 10 + (i * 20),
        width: 60.percent,
        max_value: offset + 255, 
      )
    )

    v = instance_variable_get("@#{kind}_track")
    v.value = @current_tone.send(kind) + offset
    v.bar.style_set(:background_color, get_color(kind))
  end

  #--------------------------------------------------------------------------
  # * Create input text
  #--------------------------------------------------------------------------
  def create_fields(kind, i)
    offset = (kind == "gray") ? 0 : 255
    new_y =  4 + (i * 20)
    instance_variable_set(
      "@#{kind}_field", 
      Gui::TextField.new(
        parent: @root, 
        width: 30.percent, 
        border: 1,
        padding: 1,
        border_color: Color.new("#c0c0c0"),
        margin: 2,
        x: 68.percent, 
        y: new_y, 
        format: :int, 
        range_value: [-offset, 255]
      )
    )
    @last_y = new_y
    v = instance_variable_get("@#{kind}_field")
    v.value = @current_tone.send(kind)
  end


  #--------------------------------------------------------------------------
  # * Create Trackbars and input text
  #--------------------------------------------------------------------------
  def create_components
    ["red", "green", "blue", "gray"].each_with_index do |item, i|
      create_trackbar(item, i)
      create_fields(item, i)
    end 
  end

  #--------------------------------------------------------------------------
  # * Create Simulator
  #--------------------------------------------------------------------------
  def create_simulator
    @last_y += 30
    @checkbox = Gui::CheckBox.new(
      y: @last_y,
      x: 10,
      border_color: Color.new('#c0c0c0'),
      parent: @root,
    )
    @wait_label = Gui::Label.new(
      parent: @root.outer,
      value: 'Attendre la fin ?',
      x: 32, 
      y: @last_y,
      z: 4500
    )
  end

  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    return if disposed?
    update_tone
    update_input
    update_fields
  end

  #--------------------------------------------------------------------------
  # * Update fields
  #--------------------------------------------------------------------------
  def update_fields
    [ "red", "green", "blue", "gray"].each do |elt|
      field = instance_variable_get("@#{elt}_field")
      offset = (elt == "gray") ? 0 : 255
      track = instance_variable_get("@#{elt}_track")
      field_value = field.formatted_value.to_i
      track_value = (track.value.to_i - offset)
      if track.bar.dragging?
        field.value = track_value
      elsif field.actived?
        track.value = (field_value + offset)     
      end
      field.update 
    end

  end

  #--------------------------------------------------------------------------
  # * Update input
  #--------------------------------------------------------------------------
  def update_input
    return dispose if Key::Esc.trigger? 
  end

  #--------------------------------------------------------------------------
  # * Update tone
  #--------------------------------------------------------------------------
  def update_tone
    tone = Tone.new(
      @red_field.formatted_value, 
      @green_field.formatted_value, 
      @blue_field.formatted_value,
      @gray_field.formatted_value, 
    )
    return if @current_tone == tone
    @current_tone = tone 
    $game_map.screen.tone.set(@current_tone)
  end


end


#==============================================================================
# ** Graphical_eval
#------------------------------------------------------------------------------
#  Provide a GUI toplevel
#==============================================================================

class Graphical_Eval
  
  class << self 
    
    attr_accessor :stack, :cursor
    Graphical_Eval.stack = Array.new
    Graphical_Eval.cursor = 0
      
  end

  #--------------------------------------------------------------------------
  # * Build Object
  #--------------------------------------------------------------------------
  def initialize
    @disposed = false
    init_fonts
    base_init
    create_box
    create_toolbox
    create_consistent_block
    create_textfield
    create_checkbox
    create_marker
    create_buttons
    @candidates = nil
  end
  
  #--------------------------------------------------------------------------
  # * Init fonts
  #--------------------------------------------------------------------------
  def init_fonts
    @font = Font.new("Arial")
    @font.color = Color.new(255, 255, 255)
    @font.size = 15
    @font.shadow = false 
    @font.bold = false
    @font.outline = false
    @textfield_font = @font.clone 
    @textfield_font.color = Color.new('#000000')
    @toolbox_font = @font.clone 
    @toolbox_font.size = 14
    @success_font = @toolbox_font.clone 
    @failure_font = @toolbox_font.clone 
    @success_font.color = Color.new('#00FF00')
    @failure_font.color = Color.new('#FF0000')
  end
  
  #--------------------------------------------------------------------------
  # * Init coords
  #--------------------------------------------------------------------------
  def base_init
    Game_Temp.in_game = false
    @height = 58+12
    @y = Graphics.height - @height
    @title_height = 18
  end
  
  #--------------------------------------------------------------------------
  # * Create General Box
  #--------------------------------------------------------------------------
  def create_box
    @box = Gui::Pannel.new(
      width: 100.percent, 
      height: @height,
      title: "Testeur de commandes",
      x: 0, 
      y: @y, 
      z: 4000,
      padding: 0,
      margin: 6,
      border_color: Color.new('#113F59')
    )
    @title_lab = Gui::Label.new(
      parent: @box.outer,
      x: 70.percent, 
      font: @font,
      value: 'Copy as',
      z: 4500
    )
    @run_lab = Gui::Label.new(
      parent: @box.outer,
      font: @font,
      value: 'Run', 
      z: 4500
    )
    @run_lab.set(
      x: @box.outer.width - @run_lab.width - 8
    )
  end
  
  #--------------------------------------------------------------------------
  # * Create consistent block
  #--------------------------------------------------------------------------
  def create_consistent_block 
    @bg = Gui::Box.new(
      parent: @box, 
      width: 30.percent,
      height: @box.inner.height - @toolbox.height, 
      background_color: Color.new('#19BEC0'),
      border: 0,
      x: 70.percent,
      margin: 0, 
      padding: 0,
    )
  end
  
  #--------------------------------------------------------------------------
  # * Create tool box
  #--------------------------------------------------------------------------
  def create_toolbox
    h = 12
    @toolbox = Gui::Box.new(
      parent: @box, 
      width: 100.percent,
      height: h, 
      background_color:  Color.new('#113F59'),
      border: 0, 
      y: @box.inner.height - h,
      margin: 0,
      padding: 0,
    )  
  end
  
  #--------------------------------------------------------------------------
  # * Create textfield
  #--------------------------------------------------------------------------
  def create_textfield
    @textfield = 
      Gui::TextField.new(
        parent: @box, 
        width: 70.percent, 
        height: @box.inner.height - @toolbox.height,
        border: 0,
        margin: 2,
      )
    @textfield.activate
  end
  
  #--------------------------------------------------------------------------
  # * Create checkbox
  #--------------------------------------------------------------------------
  def create_checkbox
    @checkbox = Gui::CheckBox.new(
      parent: @toolbox, 
      position: :relative,
      border: 0,
      border_color: Color.new(0, 0, 0, 0), 
      background_color: Color.new(0, 0, 0, 0), 
      font: @toolbox_font, 
      checked_label: '[X] console output',
      unchecked_label: '[  ] console output', 
      margin: 0, 
      padding: 0,
    )
    @checkbox.check
  end
  
  #--------------------------------------------------------------------------
  # * Create marker
  #--------------------------------------------------------------------------
  def create_marker
    @marker = Gui::Label.new(
      parent: @toolbox,
      font: @font,
      value:" "
    )
    
  end
  
  #--------------------------------------------------------------------------
  # * Create buttons
  #--------------------------------------------------------------------------
  def create_buttons
    @copy_as_text = Gui::Button.new(
      parent: @bg, 
      margin: 3, 
      width: 33.percent, 
      height: 100.percent,
      title: 'TXT',
      trigger: trigger do 
          unless @textfield.formatted_value.empty?
            Clipboard.push_text(@textfield.formatted_value)
            msgbox("Script line pushed in the clipboard (as a text)")
          end
        end
    )
    @copy_as_ev = Gui::Button.new(
      parent: @bg, 
      margin: 3, 
      width: 33.percent, 
      height: 100.percent,
      title: 'EVT',
      x: 33.percent,
      trigger: trigger do 
          unless @textfield.formatted_value.empty?
            rpg_command = RPG::EventCommand.new(355, 0, [@textfield.formatted_value])
            Clipboard.push_command(rpg_command)
            msgbox("Script line pushed in the clipboard (as an event's command)")
          end
        end
    ) 
    @run = Gui::Button.new(
      parent: @bg, 
      margin: 3, 
      width: 33.percent, 
      height: 100.percent,
      title: '►',
      x: 66.percent,
      trigger: trigger { execute_command }
    ) 
  end
  
  #--------------------------------------------------------------------------
  # * Valid marker
  #--------------------------------------------------------------------------
  def build_passing 
    @marker.set(font: @success_font)
    @marker.value = 'success'
    @marker.set(x: @toolbox.width - @marker.width)
  end
  
  #--------------------------------------------------------------------------
  # * Invalid
  #--------------------------------------------------------------------------
  def build_failure
    @marker.set(font: @failure_font)
    @marker.value = 'failure'
    @marker.set(x: @toolbox.width - @marker.width)
  end
  
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    update_cursor
    execute_command if Devices::Keys::Enter.trigger? && !in_completion?
    a = @textfield.formatted_value
    @textfield.update
    update_completion_box
    update_completion if Devices::Keys::Tab.trigger? && !in_completion?
  end
  
  #--------------------------------------------------------------------------
  # * Update Autocompletion
  #--------------------------------------------------------------------------
  def update_completion(i = 0)
    candidates = completion_candidates
    return if candidates.length < 2
    @token = candidates.shift
    @candidates = candidates.reverse
    draw_completion_box(i)
  end

  #--------------------------------------------------------------------------
  # * Draw completion box
  #--------------------------------------------------------------------------
  def draw_completion_box(i = 0)
    fon = Font.new(Font.default_name, 16)
    fon.color = Color.new('#113f59')
    fon.outline = false
    @i = i % (@candidates.length)
    @last_text_completed = @textfield.formatted_value
    @candidates = @candidates.rotate(@i)
    destroy_completion
    @completion_list = Gui::Box.new(z: 5000)
    @completion_candidates = []
    @candidates.each_index do |c|
      if (c == @candidates.length - 1)
        fon.color = Color.new('#6a3639')
        fon.bold = true
      end
      @completion_candidates[c] = Gui::Label.new(
        parent: @completion_list,
        value: @candidates[c],
        y: 18*c,
        font: fon
      )
    end
    @completion_list.set(
      x: @textfield.cursor_screen_x,
      y: @textfield.cursor_screen_y - @completion_list.height
    )
  end

  #--------------------------------------------------------------------------
  # * Update completion
  #-------------------------------------------------------------------------- 
  def update_completion_box
    return unless in_completion?
    if Devices::Keys::Esc.trigger? || @textfield.formatted_value != @last_text_completed
      return destroy_completion 
    end
    update_completion(@i - 1) if Devices::Keys::Tab.trigger? || Devices::Keys::Up.trigger?
    update_completion(@i + 1) if Devices::Keys::Down.trigger?
    if Devices::Keys::Enter.trigger?
      len = @token.length + 1
      new_value = @textfield.formatted_value[0..-len]
      @textfield.value = new_value + @candidates.last.to_s
      destroy_completion
    end
  end 


  #--------------------------------------------------------------------------
  # * Has completion_box
  #--------------------------------------------------------------------------  
  def in_completion?
    @completion_list && !@completion_list.disposed?
  end

  #--------------------------------------------------------------------------
  # * Destroy completion
  #--------------------------------------------------------------------------  
  def destroy_completion
    @completion_list.dispose if @completion_list
  end

  #--------------------------------------------------------------------------
  # * Completion candidates
  #--------------------------------------------------------------------------  
  def completion_candidates
    i = @textfield.recorder.virtual_position
    @textfield.formatted_value.complete_at_point(i)
  end
  
  #--------------------------------------------------------------------------
  # * Update cursor
  #--------------------------------------------------------------------------
  def update_cursor
    return if self.class.stack.length == 0
    if not in_completion?
      if (Devices::Keys::Up.trigger? || Devices::Keys::Down.trigger?)
        self.class.cursor += (Keys::Down.press?) ? 1 : -1 
        self.class.cursor = self.class.cursor % self.class.stack.length
        @textfield.value = self.class.stack[self.class.cursor]
      end
    end
  end
  
  #--------------------------------------------------------------------------
  # * Filter with damerau_levenshtein
  #--------------------------------------------------------------------------
  def filter(key, candidates)
    candidates.uniq!
    candidates.delete(:method_missing)
    candidates.collect!(&:to_s)
    candidates.sort_by! {|i| i.damerau_levenshtein(key)}
    key_a = "Did you mean maybe [#{candidates[0]}]"
    key_b = candidates.length > 1 ? ", or [#{candidates[1]}] ?" : " ?"
    return "[#{key}] does not exist.\n#{key_a}#{key_b}"
  end
  
  #--------------------------------------------------------------------------
  # * Execute code
  #--------------------------------------------------------------------------
  def execute_command
    commands = @textfield.formatted_value
    return if commands.empty?
    begin 
      raw_command = commands
      commands = "p #{commands}" if @checkbox.checked?
      build_passing
      eval(commands, $game_map.interpreter.get_binding)
      $game_map.need_refresh = true
      self.class.stack << raw_command if raw_command != self.class.stack[-1]
      self.class.cursor = self.class.stack.length-1
      return
    rescue NameError => error
      message = filter(error.name, Command.singleton_methods)
    rescue SyntaxError => syntaxFailure 
      message = syntaxFailure.message.split(/\:\d+\:/)[-1].strip 
    rescue Exception => exc
      message = "#{exc.message}"    
    end 
    build_failure
    msgbox(message)
  end

  #--------------------------------------------------------------------------
  # * Dispose
  #--------------------------------------------------------------------------
  def dispose 
    @box.dispose
    @run_lab.dispose
    @title_lab.dispose
    @disposed = true
  end

  #--------------------------------------------------------------------------
  # * Disposed ? 
  #--------------------------------------------------------------------------
  def disposed? 
    @disposed
  end
  
end
