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

  alias_method :tools_update, :update

  def update
    tools_update
    update_tools if $TEST
  end

  def eval_disposed?; !@eval || @eval.disposed?; end 
  def tone_disposed?; !@tone || @tone.disposed?; end

  def dispose_eval
    @eval.dispose
    Game_Temp.in_game = true
    @eval = nil 
    sleep(0.3)
    $game_system.menu_disabled = @old_call_menu
  end

  def dispose_tone 
    @tone.dispose
    Game_Temp.in_game = true
    @tone = nil 
    sleep(0.3)
    $game_system.menu_disabled = @old_call_menu
  end

  def update_tone
    @tone.update if @tone
  end 

  def update_eval
    @eval.update if @eval
  end

  def can_launch?(key)
    tone_disposed? && eval_disposed? && Keyboard.trigger?(key)
  end

  def can_launch_tone?
    can_launch?(RME::Config::KEY_TONE)
  end

  def can_launch_eval?
    can_launch?(RME::Config::KEY_EVAL)
  end

  def must_dispose_tone?
    !tone_disposed? && (Keyboard.trigger?(RME::Config::KEY_TONE) || Keyboard.trigger?(:esc))
  end

  def must_dispose_eval?
    !eval_disposed? && (
      Keyboard.trigger?(RME::Config::KEY_EVAL) || Keyboard.trigger?(:esc)
      ) && ! @eval.in_completion?
  end


  def update_tools
    update_tone
    update_eval
    if can_launch_eval? 
      @old_call_menu = $game_system.menu_disabled
      $game_system.menu_disabled = true
      @eval = Graphical_Eval.new
    elsif can_launch_tone?
      @old_call_menu = $game_system.menu_disabled
      $game_system.menu_disabled = true
      @tone = Graphical_Tone.new
    elsif must_dispose_eval?
      dispose_eval
    elsif must_dispose_tone?
      dispose_tone   
    end
  end
end

#==============================================================================
# ** Graphical_tone
#------------------------------------------------------------------------------
#  Provide a Tone tester
#==============================================================================

class Graphical_Tone 

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
    @changing = false
    @last_y = 0
    @disposed = false
    @base_tone = $game_map.screen.tone.clone
    @current_tone = $game_map.screen.tone.clone
    create_box
    create_root
    create_components
    create_simulator
    create_buttons
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
      padding: 4
    )
  end


  #--------------------------------------------------------------------------
  # * Dispose the box
  #--------------------------------------------------------------------------
  def dispose 
    $game_map.screen.clear_tone
    $game_map.screen.tone.set(@base_tone)
    #@wait_label.dispose
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
        width: 32.percent, 
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
    @last_y += 35
    @checkbox = Gui::CheckBox.new(
      y: @last_y,
      border_color: Color.new('#c0c0c0'),
      parent: @root,
      x: 3,
    )
    @wait_label = Gui::Label.new(
      parent: @root,
      value: 'Attendre',
      x: 38, 
      y: @last_y,
      z: 4500
    )
    @frames =Gui::TextField.new(
      parent: @root, 
      width: 32.percent, 
      border: 1,
      padding: 1,
      border_color: Color.new("#c0c0c0"),
      margin: 2,
      x: 68.percent, 
      y: @last_y-4, 
      format: :int, 
      range_value: [0, 600]
    )
    @frames.value = 60
  end

  #--------------------------------------------------------------------------
  # * Create Buttons
  #--------------------------------------------------------------------------
  def create_buttons
    @last_y += 30
    @copy_as_text = Gui::Button.new(
      y: @last_y,
      parent: @root, 
      margin: 3, 
      width: 33.percent, 
      title: 'TXT',
      trigger: trigger do 
          text = sprintf(
            "screen_tone(tone(%d,%d,%d,%d), %d, %s)",
            @red_field.formatted_value.to_i,
            @green_field.formatted_value.to_i,
            @blue_field.formatted_value.to_i,
            @gray_field.formatted_value.to_i,
            @frames.formatted_value.to_i, 
            @checkbox.checked?.to_s
          )
          Clipboard.push_text(text)
          msgbox("La ligne de script a été collée dans le presse-papier")
        end
    )
    @copy_as_ev = Gui::Button.new(
      y: @last_y,
      parent: @root, 
      margin: 3, 
      width: 33.percent, 
      title: 'EVT',
      x: 33.percent,
      trigger: trigger do 
          set_tone
          time = @frames.formatted_value.to_i
          check = @checkbox.checked?
          rpg_command =  RPG::EventCommand.new(223, 0, [@tone, time, check])
          Clipboard.push_command(rpg_command)
          msgbox("La commande événementielle a été collée dans le presse-papier")
        end
    ) 
    @run = Gui::Button.new(
      y: @last_y,
      parent: @root, 
      margin: 3, 
      width: 33.percent, 
      title: '►',
      x: 66.percent,
      trigger: trigger do 
        @changing = true
        $game_map.screen.tone.set(@base_tone)
        set_tone 
         $game_map.screen.start_tone_change(
           @tone, 
           @frames.formatted_value.to_i
          )
      end
    ) 
  end


  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    return if disposed?
    if $game_map.screen.tone_change? 
      update_fields_values
    else
      if @changing 
        update_fields_values
        @changing = false
      end
      update_tone
      update_fields 
    end
  end

  #--------------------------------------------------------------------------
  # * Update fields values
  #--------------------------------------------------------------------------
  def update_fields_values 
    [ "red", "green", "blue", "gray"].each do |elt|
      field = instance_variable_get("@#{elt}_field")
      offset = (elt == "gray") ? 0 : 255
      track = instance_variable_get("@#{elt}_track")
      value = $game_map.screen.tone.send(elt)
      field.value = value.to_i
      track.value = value.to_i + offset
    end 
  end 

  #--------------------------------------------------------------------------
  # * Update fields
  #--------------------------------------------------------------------------
  def update_fields
    @frames.update
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
  # * Set current tone
  #--------------------------------------------------------------------------
  def set_tone
    @tone = Tone.new(
      @red_field.formatted_value, 
      @green_field.formatted_value, 
      @blue_field.formatted_value,
      @gray_field.formatted_value, 
    )
  end

  #--------------------------------------------------------------------------
  # * Update input
  #--------------------------------------------------------------------------
  def update_input
    return dispose if Key::Esc.trigger? || Keyboard.trigger?(RME::Config::KEY_TONE)
  end

  #--------------------------------------------------------------------------
  # * Update tone
  #--------------------------------------------------------------------------
  def update_tone
    set_tone
    return if @current_tone == @tone
    @current_tone = @tone
    $game_map.screen.tone.set(@tone)
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
      value: 'Copier',
      z: 4500
    )
    @run_lab = Gui::Label.new(
      parent: @box.outer,
      font: @font,
      value: 'Lancer', 
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
      checked_label: '[X] Afficher dans la console',
      unchecked_label: '[  ] Afficher dans la console', 
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
            msgbox("La ligne de script a été collée dans le presse-papier")
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
            msgbox("La commande événementielle a été collée dans le presse-papier")
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


#==============================================================================
# ** Scene_RME
#------------------------------------------------------------------------------
#  This scene provide tools to generate RMEScene
#==============================================================================

class Scene_RME < Scene_Base

  #--------------------------------------------------------------------------
  # * Utils
  #--------------------------------------------------------------------------
  def width; Graphics.width; end
  def height; Graphics.height; end

  #--------------------------------------------------------------------------
  # * Create White Background
  #--------------------------------------------------------------------------
  def create_background 
    @background = Sprite.new
    @background.bitmap = Bitmap.new(width, height)
    @background.bitmap.fill_rect(0, 0, width, height, Color.new(255, 255, 255)) 
  end 

  #--------------------------------------------------------------------------
  # * Create Full pannel
  #--------------------------------------------------------------------------
  def create_pannel(title)
    @pannel = Gui::Pannel.new(
      width: width, 
      height: height,
      title: title,
      border_color: Color.new('#113F59'),
      background_color: Color.new(255, 255, 255), 
      padding: 0
    )
  end

  #--------------------------------------------------------------------------
  # * Dispose Pannel
  #--------------------------------------------------------------------------
  def dispose_pannel
    @pannel.dispose
  end

  #--------------------------------------------------------------------------
  # * Dispose Background
  #--------------------------------------------------------------------------
  def dispose_background
    @background.bitmap.dispose
    @background.dispose
  end

  #--------------------------------------------------------------------------
  # * General start
  #--------------------------------------------------------------------------
  def start
    super 
    Graphics.freeze 
    create_background
  end

  #--------------------------------------------------------------------------
  # * Termination Processing
  #--------------------------------------------------------------------------
  def terminate
    super
    dispose_background
  end

  #--------------------------------------------------------------------------
  # * Create a viewport to the whole content
  #--------------------------------------------------------------------------
  def create_main_viewport
    @main_viewport = Gui::ScrollableField.new(
      width: width, 
      height: height
    )
  end

  #--------------------------------------------------------------------------
  # * Dispose Main viewport
  #--------------------------------------------------------------------------
  def dispose_main_viewport
    @main_viewport.dispose
  end

end

#==============================================================================
# ** Scene_Commands
#------------------------------------------------------------------------------
#  This scene provides tools to build commands
#==============================================================================

class Scene_Commands < Scene_RME

  #--------------------------------------------------------------------------
  # * General start
  #--------------------------------------------------------------------------
  def start
    super 
    @size = 0
    create_main_viewport
  end

  #--------------------------------------------------------------------------
  # * Termination Processing
  #--------------------------------------------------------------------------
  def terminate
    super
    dispose_main_viewport
  end
end