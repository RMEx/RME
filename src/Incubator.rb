#
# Cette partie concerne les scripts expérimentaux
#

=begin
Implémentation de trucs potentiellement cool pour la future GUI
état tout à fait incumbatif, bien naturellement : c'est dans l'incubator.
=end

#==============================================================================
# ** Viewport
#------------------------------------------------------------------------------
#  Used when displaying sprites on one portion of the screen
#==============================================================================

class Viewport

  #--------------------------------------------------------------------------
  # * Public instances variables
  #--------------------------------------------------------------------------
  attr_accessor :elts
  attr_accessor :children
  attr_accessor :parent
  attr_accessor :disposed
  attr_reader   :def_rect
  #--------------------------------------------------------------------------
  # * alias
  #--------------------------------------------------------------------------
  alias_method :sdk_initialize, :initialize
  alias_method :sdk_dispose, :dispose
  alias_method :sdk_update, :update
  alias_method :disposed?, :disposed
  alias_method :true_ox=, :ox=
  alias_method :true_oy=, :oy=
  alias_method :true_rect, :rect
  alias_method :rect, :def_rect
  [:x, :y, :width, :height].each{|m| delegate :rect, m}
  [
    :in?,
    :hover?,
    :click?,
    :press?,
    :trigger?,
    :repeat?,
    :release?,
    :mouse_x,
    :mouse_y
  ].each{|m| delegate :true_rect, m}
  #--------------------------------------------------------------------------
  # * Object initialize
  #--------------------------------------------------------------------------
  def initialize(*args)
    sdk_initialize(*args)
    @disposed = false
    @def_rect = true_rect.clone
    @children = []
    @parent = nil
    @elts = []
  end
  #--------------------------------------------------------------------------
  # * Enterbrain, you forget this
  #--------------------------------------------------------------------------
  def dispose
    @disposed = true
    sdk_dispose
  end
  #--------------------------------------------------------------------------
  # * Sets definition attributes
  #--------------------------------------------------------------------------
  def ox=(v);     @def_ox = v;      update_from_definition; end
  def oy=(v);     @def_oy = v;      update_from_definition; end
  def x=(v);      rect.x = v;       update_from_definition; end
  def y=(v);      rect.y = v;       update_from_definition; end
  def width=(v);  rect.width = v;   update_from_definition; end
  def height=(v); rect.height = v;  update_from_definition; end
  #--------------------------------------------------------------------------
  # * Gets ox, oy
  #--------------------------------------------------------------------------
  def ox; @def_ox ||= 0; end
  def oy; @def_oy ||= 0; end
  #--------------------------------------------------------------------------
  # * Gets coordinates relative to screen
  #--------------------------------------------------------------------------
  def screen_x
     return self.x unless @parent
     @parent.screen_x - @parent.ox + self.x
  end
  def screen_y
    return self.y unless @parent
    @parent.screen_y - @parent.oy + self.y
  end
  #--------------------------------------------------------------------------
  # * Pushes another viewport in self
  #--------------------------------------------------------------------------
  def <<(oth)
    oth.parent = self
    @children << oth
    oth.update_from_definition
    oth
  end
  #--------------------------------------------------------------------------
  # * Pushes self in another viewport
  #--------------------------------------------------------------------------
  def >>(oth)
    @parent = oth
    oth.children << self
    update_from_definition
    oth
  end
  #--------------------------------------------------------------------------
  # * Updates the viewport's visible area from the definition
  #--------------------------------------------------------------------------
  def update_from_definition
    if @parent
      a = @parent.true_rect
      min_x = [self.screen_x, a.x].max
      min_y = [self.screen_y, a.y].max
      max_x = [self.screen_x + self.width,  a.x + a.width ].min
      max_y = [self.screen_y + self.height, a.y + a.height].min
      true_rect.set(min_x, min_y, max_x-min_x, max_y-min_y)
      self.true_ox = self.ox + min_x - self.screen_x
      self.true_oy = self.oy + min_y - self.screen_y
    else
      true_rect.set(rect)
      self.true_ox = self.ox
      self.true_oy = self.oy
    end
    @children.each{|c| c.update_from_definition}
  end
  #--------------------------------------------------------------------------
  # * Append Sprites
  #--------------------------------------------------------------------------
  def append(s)
    @elts << (s)
  end
  #--------------------------------------------------------------------------
  # * Calcul height space
  #--------------------------------------------------------------------------
  def calc_height
    return rect.height if @elts.empty?
    v = @elts.max{|a, b| (a.y + a.rect.height) <=> (b.y + b.rect.height)}
    [(v.y+v.rect.height), rect.height].max
  end
  #--------------------------------------------------------------------------
  # * Calcul height space
  #--------------------------------------------------------------------------
  def calc_width
    return rect.width if @elts.empty?
    v = @elts.max{|a, b| (a.x + a.rect.width) <=> (b.x + b.rect.width)}
    [(v.x+v.rect.width), rect.width].max
  end
end

#==============================================================================
# ** Draggable
#------------------------------------------------------------------------------
#  Any Object responding to ":x, :y, :in?" can be draggable.
#  Simply by pushing itself into the Draggable.objects array.
#==============================================================================

module Draggable
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    attr_accessor :objects, :picked
    Draggable.objects = []
    Draggable.picked  = nil
    #--------------------------------------------------------------------------
    # * Drags the picked Object
    #--------------------------------------------------------------------------
    def <<(*obj)
      obj.each do |o|
        @objects << o
        o.extend(Draggable)
      end
    end
    alias :push :<<
    #--------------------------------------------------------------------------
    # * Finds and pick the first Object clicked
    #--------------------------------------------------------------------------
    def find
      @picked = @objects.find do |o|
        @checked = o
        (o.in?(Mouse.x, Mouse.y) &&
          !(o.respond_to?(:children) &&
            o.children.any? {|c| c.in?(Mouse.x, Mouse.y)}
            )
          )
      end
      return unless @picked
      @x_init = @picked.x
      @y_init = @picked.y
    rescue
      @objects.delete(@checked)
      find
    end
    #--------------------------------------------------------------------------
    # * Drags the picked Object
    #--------------------------------------------------------------------------
    def drag
      return unless @picked
      @picked.drag_viewport_instead ? o = @picked.viewport : o = @picked
      nx, ny = @x_init + Mouse.drag.ox, @y_init + Mouse.drag.oy
      if r = @picked.drag_restriction
        o.x = [[nx, r.x].max, r.x + r.width ].min
        o.y = [[ny, r.y].max, r.y + r.height].min
      else
        o.x, o.y = nx, ny
      end
    end
    #--------------------------------------------------------------------------
    # * Drops the last picked Object
    #--------------------------------------------------------------------------
    def drop
      @picked = nil
    end
  end

  #--------------------------------------------------------------------------
  # * Extend the draggable object's behaviour
  #--------------------------------------------------------------------------
  attr_accessor :drag_viewport_instead
  attr_accessor :drag_restriction

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

=begin
Implémentation des évènements communs dans le système de combat
- Solution proposée par <Grim, Nuki>
  - Special thanks to Zeus81
- Etat : Incubé
=end

#==============================================================================
# ** RPG::CommonEvent
#------------------------------------------------------------------------------
#  The data class for common events.
#==============================================================================

class RPG::CommonEvent
  #--------------------------------------------------------------------------
  # * Define battle trigger
  #--------------------------------------------------------------------------
  def def_battle_trigger
    return false if !@list[0] || @list[0].code != 355
    script = @list[0].parameters[0] + "\n"
    index = 1
    while @list[index].code == 655
      script += @list[index].parameters[0] + "\n"
      index += 1
    end
    if script =~ /^\s*(in_battle)/
      potential_trigger = eval(script)
      return potential_trigger if potential_trigger.is_a?(Proc)
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * get battle trigger
  #--------------------------------------------------------------------------
  def battle_trigger
    @battle_trigger ||= def_battle_trigger
  end
  #--------------------------------------------------------------------------
  # * Is for battle
  #--------------------------------------------------------------------------
  def for_battle?
    !!battle_trigger
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
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :incubator_pc, :parallel_common_events
  #--------------------------------------------------------------------------
  # * Get Array of Parallel Common Events
  #--------------------------------------------------------------------------
  def parallel_common_events
    incubator_pc.select {|e| e && !e.for_battle?}
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
  alias_method :incubator_ce, :command_117
  #--------------------------------------------------------------------------
  # * Common Event
  #--------------------------------------------------------------------------
  def command_117
    return if $data_common_events[@params[0]].for_battle?
    incubator_ce
  end
end

#==============================================================================
# ** Game_Temp
#------------------------------------------------------------------------------
#  This class handles temporary data that is not included with save data.
# The instance of this class is referenced by $game_temp.
#==============================================================================

class Game_Temp
  class << self
    attr_accessor :in_battle
    attr_accessor :current_troop
    Game_Temp.in_battle = false
    Game_Temp.current_troop = 0
  end
end

#==============================================================================
# ** BattleManager
#------------------------------------------------------------------------------
#  This module manages battle progress.
#==============================================================================

module BattleManager
  class << self
    alias_method :incubator_setup, :setup
    alias_method :incubator_end, :battle_end
    #--------------------------------------------------------------------------
    # * Setup
    #--------------------------------------------------------------------------
    def setup(*a)
      Game_Temp.in_battle = true
      Game_Temp.current_troop = a[0]
      incubator_setup(*a)
    end
    #--------------------------------------------------------------------------
    # * End Battle
    #     result : Result (0: Win 1: Escape 2: Lose)
    #--------------------------------------------------------------------------
    def battle_end(result)
      Game_Temp.in_battle = false
      Game_Temp.current_troop = -1
      incubator_end(result)
    end
  end
end

#==============================================================================
# ** Game_CommonEvent
#------------------------------------------------------------------------------
#  This class handles common events. It includes functionality for execution of
# parallel process events. It's used within the Game_Map class ($game_map).
#==============================================================================

class Game_CommonEvent
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :incubator_active?, :active?
  #--------------------------------------------------------------------------
  # * Determine if Active State
  #--------------------------------------------------------------------------
  def active?
    return incubator_active? if not in_battle?
    @event.for_battle? && @event.battle_trigger.call()
  end
end

#==============================================================================
# ** Game_Troop
#------------------------------------------------------------------------------
#  This class handles enemy groups and battle-related data. Also performs
# battle events. The instance of this class is referenced by $game_troop.
#==============================================================================

class Game_Troop
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :incubator_setup, :setup
  alias_method :incubator_update, :update
  #--------------------------------------------------------------------------
  # * Setup
  #--------------------------------------------------------------------------
  def setup(troop_id)
    incubator_setup(troop_id)
    init_common_events
  end
  #--------------------------------------------------------------------------
  # * Initialize common events
  #--------------------------------------------------------------------------
  def init_common_events
    events = $data_common_events.select {|event| event && event.for_battle? }
    @common_events = events.map {|e| Game_CommonEvent.new(e.id)}
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    incubator_update
    event_update
  end
  #--------------------------------------------------------------------------
  # * Event Update
  #--------------------------------------------------------------------------
  def event_update
    @common_events.each {|e| e.update}
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
