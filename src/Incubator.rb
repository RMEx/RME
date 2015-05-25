#
# Cette partie concerne les scripts expérimentaux
#

=begin
Implémentation de trucs potentiellement cool pour la future GUI
état tout à fait incumbatif, bien naturellement : c'est dans l'incubator.
=end

#==============================================================================
# ** SCREEN EFFECT
#------------------------------------------------------------------------------
#  Lul
#==============================================================================

class Window
  alias_method :rme_screen_effect_initialize, :initialize
  def initialize(*args)
    rme_screen_effect_initialize(*args)
    self.viewport = Graphics.windows_viewport
  end
end

class Screen < Sprite
  attr_accessor :pixelation, :zoom, :zoom_target_x, :zoom_target_y, :motion_blur

  def initialize
    super
    self.viewport = Viewport.new
    self.viewport.z = 500
    @pixelation  = 1
    @zoom = 100
    @motion_blur = @zoom_target_x = @zoom_target_y = 0
    @recorded_rect = Rect.new
    @display_rect  = Rect.new
  end

  def update
    if [@motion_blur, @pixelisation, @zoom] == [0, 1, 100]
      return self.visible = false
    end
    update_recorded_rect
    update_pixelation
    update_bitmap
  end

  def update_recorded_rect
    @zoom = [100, @zoom].max
    f, tx, ty = @zoom / 100.0, @zoom_target_x, @zoom_target_y
    w = (Graphics.width / f).to_i
    h = (Graphics.height / f).to_i
    x = (tx - w / 2.0).to_i.bound(0, Graphics.width  - w)
    y = (ty - h / 2.0).to_i.bound(0, Graphics.height - h)
    @recorded_rect.set(x, y, w, h)
  end

  def update_pixelation
    pix = @pixelation = [1, @pixelation].max
    if pix != @pixelation_old
      @pixelation_old = pix
      self.zoom_x = pix
      self.zoom_y = pix
      w = Graphics.width  / pix
      h = Graphics.height / pix
      @display_rect.set(0, 0, w, h)
      self.bitmap = Bitmap.new(w, h)
    end
  end

  def update_bitmap
    self.visible = Graphics.windows_viewport.visible = false
    o = 255 - @motion_blur.bound(0, 255)
    self.bitmap.stretch_blt(@display_rect, Graphics.snap_to_bitmap, @recorded_rect, o)
    self.visible = Graphics.windows_viewport.visible = true
  end
end

module Graphics
  class << self
    alias_method :rme_screen_effect_update, :update
    attr_accessor :screen

    def update
      @screen ||= Screen.new
      @screen.update
      rme_screen_effect_update
    end

    def windows_viewport
      @windows_viewport ||= Viewport.new
      @windows_viewport.z = 600
      @windows_viewport
    end
  end
end

#==============================================================================
# ** Bilou
#------------------------------------------------------------------------------
#  Bilou is the best example for anything
#==============================================================================

class Bilou < Viewport
  def initialize(x,y,w,h,c,draggable=false)
    super(x,y,w,h)
    Draggable << self if draggable
    self.color = c
  end
end

class SuperBilou < Viewport
  attr_accessor :inner, :style
  def initialize(x,y,w,h)
    super(x,y,w,h)
    @x,@y,@width,@height = x,y,w,h
    @style = Gui::Style.new
    Gui::CSS.apply_to(self)
    @background = Sprite.new(self)
    @inner = Rect.new
    @inner >> rect
    update_background
    Draggable << self
  end
  def update_background
    @background.bitmap = Bitmap.new(self.width, self.height)
    r = Rect.new(0, 0, self.width, self.height)
    @style.contract_with(:margin, r)
    @background.bitmap.fill_rect(r, @style[:border_color])
    @style.contract_with(:border, r)
    @background.bitmap.fill_rect(r, @style[:background_color])
    @style.contract_with(:padding, r)
    @inner.set(r)
  end
  def compute_self
    super
    update_background
  end
end

class GrosTest
  def initialize
    @viewport = Viewport.new(50,50,300,300)
  end
end


=begin
Implémentation du mode large (actuellement bloqué dans l'incubator, en mode Unsafe)
Code chelou par raho, reste par Grim
=end

if RME.unsafe?

  #==============================================================================
  # ** SceneManager
  #------------------------------------------------------------------------------
  #  This module manages scene transitions. For example, it can handle
  # hierarchical structures such as calling the item screen from the main menu
  # or returning from the item screen to the main menu.
  #==============================================================================

  module SceneManager
    class << self
      alias_method :incubator_run, :run
      #--------------------------------------------------------------------------
      # * Execute
      #--------------------------------------------------------------------------
      def run
        Graphics.overlayer = Sprite.new
        Graphics.overlayer.z = 2 ** ([42].pack('i').size - 2) -1
        Graphics.retreive_bitmap
        incubator_run
      end
    end
  end

  #==============================================================================
  # ** Graphics
  #------------------------------------------------------------------------------
  #  Ugly Graphics Monkeypatch
  #==============================================================================
  module Graphics

    #------------------------------------------------------------------------
    # * Singleton
    #------------------------------------------------------------------------
    class << self

      #------------------------------------------------------------------------
      # * Public instance variables
      #------------------------------------------------------------------------
      attr_accessor :overlayer

      #------------------------------------------------------------------------
      # * Retreive bitmap
      #------------------------------------------------------------------------
      def retreive_bitmap
        black = Color.new(0,0,0,255)
        Graphics.overlayer.bitmap = Bitmap.new(Graphics.width, Graphics.height)
        r = Rect.new(0,0,Graphics.width, Graphics.height)
        Graphics.overlayer.bitmap.fill_rect(r, black)
      end

      #------------------------------------------------------------------------
      # * Freezes the current screen in preparation for transitions.
      #------------------------------------------------------------------------
      def freeze
        Graphics.overlayer.bitmap = snap_to_bitmap
      end

      #------------------------------------------------------------------------
      # * Performs a fade-out of the screen.
      #------------------------------------------------------------------------
      def fadeout(frames)
        steps = 255.0/frames.to_f
        1.upto(frames) do |k|
          Graphics.brightness = 255.0 - (steps * k)
          Graphics.wait(1)
        end
      end

      #------------------------------------------------------------------------
      # * Performs a fade-in of the screen.
      #------------------------------------------------------------------------
      def fadein(frames)
        steps = 255.0/frames.to_f
        frames.times do |k|
          Graphics.brightness = steps * k.to_f
          Graphics.wait(1)
        end
      end

      #------------------------------------------------------------------------
      # * The brightness of the screen
      #------------------------------------------------------------------------
      def brightness
        255 - Graphics.overlayer.opacity
      end
      #------------------------------------------------------------------------
      # * change The brightness of the screen
      #------------------------------------------------------------------------
      def brightness=(val)
        Graphics.overlayer.opacity = 255.0 - val.to_f
      end

      #------------------------------------------------------------------------
      # * Carries out a transition from the screen frozen by Graphics.freeze
      #   to the current screen.
      #------------------------------------------------------------------------
      def transition(duration = 10, filename=nil, wave=nil)
        Graphics.overlayer.bitmap = Bitmap.new(filename) if filename
        Graphics.overlayer.opacity = 255
        steps = 255.0 / duration.to_f
        duration.times do |k|
          Graphics.overlayer.opacity = 255.0 - (steps * k.to_f)
          Graphics.wait(1)
        end
        Graphics.overlayer.bitmap.dispose if Graphics.overlayer.bitmap
        retreive_bitmap
      end

    end

  end

  #==============================================================================
  # ** Resolution
  #------------------------------------------------------------------------------
  #  Hack in the matrice :'( :'(
  #==============================================================================
  module Resolution
    extend self
    #------------------------------------------------------------------------
    # * ... no idea
    #------------------------------------------------------------------------
    def fresh_pointer(reg, v)
      ptr = DL::CPtr.new(268435456 + reg)
      ptr[0, v.size] = v
    end
    #------------------------------------------------------------------------
    # * ... pack dimension
    #------------------------------------------------------------------------
    def pack_dimension(width, height)
      [
        [width, height],[width+32, height+32],
        [-(~(width/32)), -(~(height/32))]
      ].collect{|elt| elt.pack('ll').scan(/..../)}
    end
    #------------------------------------------------------------------------
    # * ... Oh yeah, i'm currently listening a nice song !
    #------------------------------------------------------------------------
    def map_reg(width, height)
      empty_buff = [].pack('x4')
      (buff_aa, buff_ab), (buff_ba, buff_bb),
      (buff_ca, buff_cb) = *pack_dimension(width, height)
      {
        6495 => "\x90"*5, 6564 => buff_ab, 6569 => buff_aa,
        6742 => buff_ab, 6747 => buff_aa, 8438 => buff_aa,
        8447 => buff_aa, 8454 => buff_ab, 8463 => buff_ab,
        116195 => empty_buff, 116200 => empty_buff,
        128119 => buff_ab, 128124 => buff_aa, 135679 => buff_bb,
        135684 => buff_ba, 138621 => buff_cb[0], 138753 => buff_ca[0],
        1105576=> buff_ab, 1105581=> buff_aa, 1105631=> buff_ab,
        1105648=> buff_aa, 1105684=> buff_ab, 1105688=> buff_aa,
        1105736=> buff_ab, 1105740=> buff_aa, 1107623=> buff_aa,
        1107651=> buff_ab, 1109673=> buff_aa, 1109689=> buff_ab
      }.each{|k, v| fresh_pointer(k, v)}
    end
    #------------------------------------------------------------------------
    # * ... Change resolution
    #------------------------------------------------------------------------
    def change(w, h)
      map_reg(w, h)
      Graphics.resize_screen(w, h)
    end
  end

end


if RME.unsafe?
  #==============================================================================
  # ** Plane
  #------------------------------------------------------------------------------
  #  Plane rewritting
  #==============================================================================
  #------------------------------------------------------------------------
  # * jutsu to erase acutal Plane class
  #------------------------------------------------------------------------
  Object.send(:remove_const, :Plane)
  class Plane < Sprite

    #------------------------------------------------------------------------
    # * Z modifier
    #------------------------------------------------------------------------
    def z=(z); super(z * 1000);end

    #------------------------------------------------------------------------
    # * Oz modifier
    #------------------------------------------------------------------------
    def ox=(ox)
      return if @bitmap == nil
      super(ox % @bitmap.width)
    end

    #------------------------------------------------------------------------
    # * Oy modifier
    #------------------------------------------------------------------------
    def oy=(oy)
      return if @bitmap == nil
      super(oy % @bitmap.height)
    end

    #------------------------------------------------------------------------
    # * Bitmap accessor
    #------------------------------------------------------------------------
    def bitmap
      return @bitmap
    end

    #------------------------------------------------------------------------
    # * Bitmap Mutator
    #------------------------------------------------------------------------
    def bitmap=(tile)
      @bitmap = tile
      xx = 1 + (Graphics.width.to_f / tile.width).ceil
      yy = 1 + (Graphics.height.to_f / tile.height).ceil
      plane = Bitmap.new(@bitmap.width * xx, @bitmap.height * yy)
      (0..xx).each do|x|
        (0..yy).each do |y|
          plane.blt(x * @bitmap.width, y * @bitmap.height, @bitmap, @bitmap.rect)
        end
      end
      super(plane)
    end

  end
end

if RME.unsafe?

  #==============================================================================
  # ** Scene_Map
  #------------------------------------------------------------------------------
  #  This class performs the map screen processing.
  #==============================================================================

  class Scene_Map
    #--------------------------------------------------------------------------
    # * Post Processing for Transferring Player
    #--------------------------------------------------------------------------
    alias_method :incubator_post_t, :post_transfer
    def post_transfer
      @spriteset.incubator_refresh_viewports
      incubator_post_t
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
    # * Retreive a correct rect
    #--------------------------------------------------------------------------
    def correct_rect
      real_w = $game_map.width * 32
      real_h = $game_map.height * 32
      loop_h = $game_map.loop_vertical?
      loop_w = $game_map.loop_horizontal?
      coeffx = coeffy = 0
      coeffx = (Graphics.width - real_w)/2 if Graphics.width > real_w  && !loop_w
      coeffy = (Graphics.height - real_h)/2 if Graphics.height > real_h  && !loop_h
      coeffw = (loop_w) ? Graphics.width : [Graphics.width, real_w].min
      coeffh = (loop_h) ? Graphics.height : [Graphics.height, real_h].min
      Rect.new(coeffx, coeffy, coeffw, coeffh)
    end
    #--------------------------------------------------------------------------
    # * Create Viewport
    #--------------------------------------------------------------------------
    def create_viewports
      r = correct_rect
      @viewport1 = Viewport.new(r)
      @viewport2 = Viewport.new(r)
      @viewport3 = Viewport.new(r)
      @viewport2.z = 50
      @viewport3.z = 100
    end
    #--------------------------------------------------------------------------
    # * Refresh viewports
    #--------------------------------------------------------------------------
    def incubator_refresh_viewports
      r = correct_rect
      [@viewport1, @viewport2, @viewport3].each do |vp|
        vp.rect.set(r)
      end
    end
  end

  #==============================================================================
  # ** Game_Map
  #------------------------------------------------------------------------------
  #  This class handles maps. It includes scrolling and passage determination
  # functions. The instance of this class is referenced by $game_map.
  #==============================================================================

  class Game_Map
    #--------------------------------------------------------------------------
    # * Scroll Down
    #--------------------------------------------------------------------------
    def scroll_down(distance)
      if loop_vertical?
        @display_y += distance
        @display_y %= @map.height * 256
        @parallax_y += distance if @parallax_loop_y
      else
        last_y = @display_y
        tile_y = (Graphics.height > (height * 32)) ? height : screen_tile_y
        @display_y = [@display_y + distance, (height - tile_y)].min
        @parallax_y += @display_y - last_y
      end
    end
    #--------------------------------------------------------------------------
    # * Scroll Right
    #--------------------------------------------------------------------------
    def scroll_right(distance)
      if loop_horizontal?
        @display_x += distance
        @display_x %= @map.width * 256
        @parallax_x += distance if @parallax_loop_x
      else
        last_x = @display_x
        tile_x = (Graphics.width > (width * 32)) ? width : screen_tile_x
        @display_x = [@display_x + distance, (width - tile_x)].min
        @parallax_x += @display_x - last_x
      end
    end
  end


end
