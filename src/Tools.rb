# -*- coding: utf-8 -*-
#==============================================================================
# ** RME V1.0.0
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
    unless @box
      if Keyboard.trigger?(RME::Config::KEY_EVAL)
        @old_call_menu = $game_system.menu_disabled
        $game_system.menu_disabled = true
        @box = Graphical_eval.new
      end
    else
      if Keyboard.any?(:trigger?, RME::Config::KEY_EVAL, :esc)
        $game_system.menu_disabled = @old_call_menu
        @box.dispose
        Game_Temp.in_game = true
        @box = nil
        return
      end
      @box.update
    end
  end
end



class Graphical_eval

  def initialize
    Game_Temp.in_game = false
    @width = Graphics.width - 12
    @height = 42
    @x = 6
    @y = Graphics.height - @height - 6
    @list = RME::Doc.commands.keys.map{|k|k.to_s}
    create_viewport
    create_background
    create_textfield
    create_marker
  end

  def create_viewport
    @viewport = Viewport.new(@x, @y, @width, @height)
  end

  def create_textfield
    @textfield = Gui::Components::Text_Field.new(
                  Gui::Components::Text_Recorder.new, 8, 17, @width - 164,
                  "small_standard", true)
    @textfield >> @viewport
  end

  def create_background
    @background = Sprite.new(@viewport)
    @background.bitmap = Bitmap.new(@width, @height)
    rect = @background.bitmap.rect
    colorA = Color.new(83, 83, 83, 130)
    colorB = Color.new(36, 36, 36, 130)
    @background.bitmap.gradient_fill_rect(rect, colorA, colorB, true)
    @text_rect = Rect.new(6, 15, @width - 160, @height - 20)
    @background.bitmap.fill_rect(@text_rect, Color.new(255, 255, 255, 200))
    @background.bitmap.fill_rect(0, 0, @width, 12, Color.new(0, 0, 0, 200))
    @background.bitmap.font = get_profile("small_standard_title").to_font
    @background.bitmap.draw_text(2, 0, @width, 10, "Test script line")
  end

  def create_marker
    @marker = Sprite.new(@viewport)
    @marker.bitmap = Bitmap.new(8,  @height - 20)
    @marker.x = @width - 160 + 6
    @marker.y = 15
    @marker.bitmap.fill_rect(0, 0, 8, @height-20, Color.new(100, 100, 100))
    valid_marker
  end

  def valid_marker
    @marker.tone.set(0, 255, 0)
  end

  def invalid_marker
    @marker.tone.set(255, 0, 0)
  end

  def update
    execute_command if Devices::Keys::Enter.trigger?
    @textfield.update
  end

  def execute_command
    commands = @textfield.formatted_value
    begin
      eval(commands, $game_map.interpreter.get_binding)
      $game_map.need_refresh = true
      valid_marker
    rescue Exception => exc
      invalid_marker
      p exc
      p exc.class
      result = exc.message
      if exc.is_a?(NameError)
        keywords = Command.singleton_methods
        keywords.uniq!
        keywords.delete(:method_missing)
        keywords.collect!{|i|i.to_s}
        keywords.sort_by!{|o| o.damerau_levenshtein(exc.name)}
        snd = keywords.length > 1 ? " or [#{keywords[1]}]" : ""
        result = "[#{exc.name}] doesn't exist. Did you mean [#{keywords[0]}]"+snd+"?"
      elsif exc.is_a?(SyntaxError)
        result = exc.message.split(/\:\d+\:/)[-1].strip
      end
      msgbox result
    end
  end

  def dispose
    @textfield.dispose
    @viewport.dispose
  end

end
