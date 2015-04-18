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

class Graphical_eval

  def initialize
    @width = Graphics.width - 12
    @height = 32
    @x = 6
    @y = Graphics.height - @height - 6
    create_viewport
    create_background
    create_textfield
  end

  def create_viewport
    @viewport = Viewport.new(@x, @y, @width, @height)
  end

  def create_textfield
    @textfield = Gui::Components::Text_Field.new(
                  Gui::Components::Float_Recorder.new(100, (-8.0 ... 1000)), 8, 7, @width - 164,
                  "small_standard", true)
    @textfield >> @viewport
  end

  def create_background
    @background = Sprite.new(@viewport)
    @background.bitmap = Bitmap.new(@width, @height)
    @background.z = 99999999
    rect = @background.bitmap.rect
    colorA = Color.new(83, 83, 83, 130)
    colorB = Color.new(36, 36, 36, 130)
    @background.bitmap.gradient_fill_rect(rect, colorA, colorB, true)
    @text_rect = Rect.new(6, 6, @width - 160, @height - 12)
    @background.bitmap.fill_rect(@text_rect, Color.new(255, 255, 255, 200))
  end

  def update
    @textfield.update
    execute_command if Devices::Keys::Enter.trigger?
  end

  def execute_command
    p @textfield.formatted_value
  end

end
