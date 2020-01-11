if RME.allowed?(:enlarge_resolution)

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
        Graphics.overlayer.viewport = Viewport.new
        Graphics.overlayer.viewport.z = 1000
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
