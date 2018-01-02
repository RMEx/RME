# -*- coding: utf-8 -*-
#==============================================================================
# ** RME Commands
#------------------------------------------------------------------------------
#  With :
# Grim (original project)
# Nuki
# Raho
#  Help :
# Fabien
# Zeus81
# Joke
# Zangther
# Spyrojojo
#------------------------------------------------------------------------------
# Commands API
# Provide all commands of the EvEx
#==============================================================================

module RMECommands

  #--------------------------------------------------------------------------
  # * Public Commands
  #--------------------------------------------------------------------------

  def game_window_rect
    rect = [0,0,0,0].pack('l4')
    Externlib::GetWindowRect.call(HWND, rect)
    args = rect.unpack('l4')
    return ::Rect.new(*args)
  end

  def fadeout(time = 100)
    RPG::BGM.fade(time)
    RPG::BGS.fade(time)
    RPG::ME.fade(time)
    Graphics.fadeout(time * Graphics.frame_rate / 1000)
    RPG::BGM.stop
    RPG::BGS.stop
    RPG::ME.stop
  end

  def fadein(time = 100)
    Graphics.fadein(time * Graphics.frame_rate / 1000)
  end

  def call_common_event(id)
    $game_temp.reserve_common_event(id)
  end

  def has_prefix?(string, prefix)
    string.start_with?(prefix)
  end

  def has_suffix?(string, suffix)
    string.end_with?(suffix)
  end

  def has_substring?(string, substring)
    string.include?(substring)
  end

  def windowskin_tone(tone = nil)
    $game_system.window_tone = tone if tone
    $game_system.window_tone
  end

  def windowskin_opacity(opacity = nil)
    $game_system.window_opacity = opacity if opacity
    $game_system.window_opacity
  end

  def menu_disabled?
    $game_system.menu_disabled
  end

  def menu_enabled?
    !menu_disabled?
  end

  def save_enabled?
    !save_disabled?
  end

  def save_disabled?
    $game_system.save_disabled
  end

  def encounter_disabled?
    $game_system.encounter_disabled
  end

  def encounter_enabled?
    !encounter_disabled?
  end

  def formation_disabled?
    $game_system.formation_disabled
  end

  def formation_enabled?
    !formation_disabled?
  end


  def max(a, b); [a, b].max; end
  def min(a, b); [a, b].min; end
  def screen; Game_Screen.get; end
  def pictures; screen.pictures; end
  def scene; SceneManager.scene; end
  def spriteset; scene.spriteset; end
  def tilemap; spriteset.tilemap; end
  def wait(d); d.times { Fiber.yield}; end
  def session_username; USERNAME; end
  def length(a); a.to_a.length; end
  def get(a, i); a[i]; end
  def event(id)
    if id.is_a?(Array)
      if id[0] == :follower
        e = $game_player.followers[id[1]]
        return e if e
        raise sprintf("Follower n° %d doesn't exist", id)
      else id[0] == :vehicle
        e =  $game_map.vehicles[id[1]]
        return e if e
        raise sprintf("Vehicle n° %d doesn't exist", id)
      end
    end
    return $game_player if id == 0
    return $game_map.events[id] if $game_map.events[id]
    raise sprintf("Event %d doesn't exist", id)
  end
  def follower(pos)
    [:follower, pos]
  end
  def rm_kill; SceneManager.exit; end
  def website(url); Thread.new { system("start #{url}") };end
  def split_each_char(str); str.scan(/./); end

  def wait_with(time, &block)
    time.times do
      block.call
      Fiber.yield
    end
  end

  def qte(key, time, strict = true)
    i = 0
    wait_with(time) do
      unless strict
        return true if Keyboard.trigger?(key) && i > 6
      else
        c = Keyboard.rgss_current_key(:trigger?)
        return c == key if c && i > 6
      end
      i += 1
    end
    return false
  end

  def random_combination(len, *keys)
    Array.new(len) {keys[Kernel.rand(keys.length)]}
  end

  def wait_trigger(key)
    wait(1)
    Fiber.yield while(!Keyboard.trigger?(key))
  end

  def wait_release(key)
    wait(1)
    Fiber.yield while(!Keyboard.release?(key))
  end

  def pick_random(*args)
    if args.length == 1 && args[0].is_a?(Array)
      return args[0][Kernel.rand(args[0].length)]
    end
    args[Kernel.rand(args.length)]
  end

  def get_tileset_id
    $game_map.tileset_id
  end

  def switch_tileset(tileset_id)
    $game_map.tileset_id = tileset_id
  end

  def set_tile(value, x, y, layer)
    $game_map.instance_variable_get(:@map).data[x, y, layer] = value
  end

  def set_tile_where(layer, id, new_id)
    map = $game_map.instance_variable_get(:@map)
    map_height.times do |y|
      map_width.times do |x|
        map.data[x, y, layer] = new_id if map.data[x, y, layer] == id
      end
    end
  end

  def delete_tiles(layer, id)
    set_tile_where(layer, id, 0)
  end

  #--------------------------------------------------------------------------
  # * Change Message height
  #--------------------------------------------------------------------------
  def message_height(n)
    Window_Message.line_number = n
    scene = SceneManager.scene
    scene.refresh_message if scene.respond_to?(:refresh_message)
  end

  def choice(array, index_if_cancelled, value = nil, face_name = nil, face_index = 0, position = 2, background = 0)
    if value
      if face_name
        $game_message.face_name = face_name
        $game_message.face_index = face_index
      end
      $game_message.position = position
      $game_message.background = background
      $game_message.add(value)
    else
      wait_for_message
    end
    setup_choices([array, index_if_cancelled])
    $game_message.choice_cancel_type = index_if_cancelled
    $game_message.choice_proc = Proc.new {|n| $game_message.last_choice = n+1}
    if value
      wait_for_message
    else
      Fiber.yield while $game_message.choice?
    end
    return $game_message.last_choice
  end

  def last_choice
    $game_message.last_choice
  end

  def message(value, face_name = nil, face_index = 0, position = 2, background = 0)
    if face_name
      $game_message.face_name = face_name
      $game_message.face_index = face_index
    end
    $game_message.position = position
    $game_message.background = background
    $game_message.add(value)
    wait_for_message
  end

  # Fix Username
  alias_method :windows_username, :session_username


  append_commands

  #==============================================================================
  # ** Parallaxes
  #------------------------------------------------------------------------------
  #  Parallaxes Commands
  #==============================================================================
  module Parallaxes
    #--------------------------------------------------------------------------
    # * Show parallax
    #--------------------------------------------------------------------------
    def parallax_show(
        id,
        name,
        z  = -100,
        op = 255,
        ax = 0,
        ay = 0,
        mx = 2,
        my = 2,
        b  = 0,
        zx = 100,
        zy = 100
      )
      $game_map.parallaxes[id].show(name, z, op, ax, ay, mx, my, b, zx, zy)
    end
    #--------------------------------------------------------------------------
    # * Move parallax
    #--------------------------------------------------------------------------
    def parallax_transform(
        id,
        duration,
        wf = false,
        zoom_x = 100,
        zoom_y = 100,
        opacity = 255,
        tone = nil,
        ease = :InLinear
      )
      $game_map.parallaxes[id].move(duration, zoom_x, zoom_y, opacity, tone, ease)
      wait(duration) if wf
    end
    def fresh_parallax_id
      $game_map.parallaxes.fresh_id
    end
    #--------------------------------------------------------------------------
    # * Hide parallax
    #--------------------------------------------------------------------------
    def parallax_erase(id)
      $game_map.parallaxes[id].hide
    end
    def parallax_erased?(id)
      $game_map.parallaxes[id].name.empty?
    end
    #--------------------------------------------------------------------------
    # * Hide all parallax
    #--------------------------------------------------------------------------
    def parallaxes_clear
      $game_map.clear_parallaxes
    end
    #--------------------------------------------------------------------------
    # * Change blend type of a parallax
    #--------------------------------------------------------------------------
    def parallax_blend(id, v)
      $game_map.parallaxes[id].blend_type = v
    end
    #--------------------------------------------------------------------------
    # * Change autospeed_x
    #--------------------------------------------------------------------------
    def parallax_autoscroll_x(id, v, duration = 0, wf = false, ease = :InLinear)
      $game_map.parallaxes[id].set_transition('autospeed_x', v, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Change autospeed_x
    #--------------------------------------------------------------------------
    def parallax_autoscroll_y(id, v, duration = 0, wf = false, ease = :InLinear)
      $game_map.parallaxes[id].set_transition('autospeed_y', v, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Change autospeed
    #--------------------------------------------------------------------------
    def parallax_autoscroll(id, x, y, d = 0, wf = false, ease = :InLinear)
      parallax_autoscroll_x(id, x, d, false, ease)
      parallax_autoscroll_y(id, y, d, wf, ease)
    end
    #--------------------------------------------------------------------------
    # * Change z
    #--------------------------------------------------------------------------
    def parallax_z(id, v)
      $game_map.parallaxes[id].z = v
    end
    #--------------------------------------------------------------------------
    # * Change scroll_x
    #--------------------------------------------------------------------------
    def parallax_scroll_x(id, v)
      $game_map.parallaxes[id].move_x = v
    end
    #--------------------------------------------------------------------------
    # * Change scroll_y
    #--------------------------------------------------------------------------
    def parallax_scroll_y(id, v)
      $game_map.parallaxes[id].move_y = v
    end
    #--------------------------------------------------------------------------
    # * Change speed
    #--------------------------------------------------------------------------
    def parallax_scroll(id, x, y)
      parallax_scroll_x(id, x)
      parallax_scroll_y(id, y)
    end
    #--------------------------------------------------------------------------
    # * Change zoom_x
    #--------------------------------------------------------------------------
    def parallax_zoom_x(id, v, duration = 0, wf = false, ease = :InLinear)
      $game_map.parallaxes[id].set_transition('zoom_x', v, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Change zoom_y
    #--------------------------------------------------------------------------
    def parallax_zoom_y(id, v, duration = 0, wf = false, ease = :InLinear)
      $game_map.parallaxes[id].set_transition('zoom_y', v, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Change zoom
    #--------------------------------------------------------------------------
    def parallax_zoom(id, v, duration = 0, wf = false, ease = :InLinear)
      parallax_zoom_x(id, v, duration, false, ease)
      parallax_zoom_y(id, v, duration, wf, ease)
    end
    #--------------------------------------------------------------------------
    # * Change tone
    #--------------------------------------------------------------------------
    def parallax_tone(id, tone, duration = 0, wf = false, ease = :InLinear)
      $game_map.parallaxes[id].start_tone_change(tone, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Change opacity
    #--------------------------------------------------------------------------
    def parallax_opacity(id, v, duration = 0, wf = false, ease = :InLinear)
      $game_map.parallaxes[id].set_transition('opacity', v, duration, ease)
      wait(duration) if wf
    end

    # fix for EE4
    alias_method :parallax_scrollspeed, :parallax_scroll

    append_commands
  end

  #==============================================================================
  # ** Commands Picture
  #------------------------------------------------------------------------------
  #  Pictures manipulation
  #==============================================================================

  module Pictures
    #--------------------------------------------------------------------------
    # * Sprite picture
    #--------------------------------------------------------------------------
    def sprite_picture(id)
      spriteset.picture_sprites[id]
    end
    #--------------------------------------------------------------------------
    # * Picture show
    #--------------------------------------------------------------------------
    def picture_show(id, n, x=0, y=0, ori=0,  z_x=100, z_y=100, op=255, bl=0)
      pictures[id].show(n, ori, x, y, z_x, z_y, op, bl)
    end
    #--------------------------------------------------------------------------
    # * Picture show
    #--------------------------------------------------------------------------
    def picture_show_screenshot(id, x=0, y=0, ori=0,  z_x=100, z_y=100, op=255, bl=0)
      pictures[id].show(:screenshot, ori, x, y, z_x, z_y, op, bl)
    end
    #--------------------------------------------------------------------------
    # * Picture erase
    #--------------------------------------------------------------------------
    def picture_erase(ids)
      ids = select_pictures(ids)
      ids.each {|id| pictures[id].erase}
    end
    #--------------------------------------------------------------------------
    # * Picture name
    #--------------------------------------------------------------------------
    def picture_name(id, name = nil)
      return pictures[id].name unless name
      pictures[id].name = name
    end
    #--------------------------------------------------------------------------
    # * Modify Origin
    # Origin : 0 | 1 (0 = Corner High Left, 1 = Center)
    #--------------------------------------------------------------------------
    def picture_origin(id, *origin)
      origin = origin[0] if origin.length == 1
      pictures[id].origin = origin
    end
    #--------------------------------------------------------------------------
    # * Modify x position
    #--------------------------------------------------------------------------
    def picture_x(id, x=false, duration = 0, wf = false, ease = :InLinear)
      return pictures[id].x unless x
      pictures[id].set_transition('x', x, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Modify y position
    #--------------------------------------------------------------------------
    def picture_y(id, y=false, duration = 0, wf = false, ease = :InLinear)
      return pictures[id].y unless y
      pictures[id].set_transition('y', y, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Modify position
    #--------------------------------------------------------------------------
    def picture_position(ids, x, y, duration = 0, wf = false, ease = :InLinear)
      ids = select_pictures(ids)
      ids.each do |id|
        picture_x(id, x, duration, false, ease)
        picture_y(id, y, duration, false, ease)
      end
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Move picture
    #--------------------------------------------------------------------------
    def picture_move(ids, x, y, zoom_x, zoom_y, dur, wf = true, opacity = -1, bt = -1, o = -1, ease = :InLinear)
      ids = select_pictures(ids)
      ids.each do |id|
        p = pictures[id]
        opacity = (opacity == -1) ? p.opacity : opacity
        blend = (bt == -1) ? p.blend_type : bt
        origin = (o == -1) ? p.origin : o
        p.move(origin, x, y, zoom_x, zoom_y, opacity, blend, dur, ease)
      end
      wait(dur) if wf
    end
    #--------------------------------------------------------------------------
    # * Modify wave
    #--------------------------------------------------------------------------
    def picture_wave(ids, amp, speed)
      ids = select_pictures(ids)
      ids.each do |id|
        pictures[id].wave_amp = amp
        pictures[id].wave_speed = speed
      end
    end
    #--------------------------------------------------------------------------
    # * Apply Mirror
    #--------------------------------------------------------------------------
    def picture_flip(ids)
      ids = select_pictures(ids)
      ids.each do |id|
        pictures[id].mirror = !pictures[id].mirror
      end
    end
    #--------------------------------------------------------------------------
    # * Modify Angle
    #--------------------------------------------------------------------------
    def picture_angle(id, angle=false, duration = 0, wf = false, ease = :InLinear)
      return pictures[id].angle unless angle
      pictures[id].set_transition('angle', angle, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Rotate
    #--------------------------------------------------------------------------
    def picture_rotate(ids, speed)
      ids = select_pictures(ids)
      ids.each do |id|
        pictures[id].rotate(speed)
      end
    end
    #--------------------------------------------------------------------------
    # * change Zoom X
    #--------------------------------------------------------------------------
    def picture_zoom_x(id, zoom_x=false, duration = 0, wf = false, ease = :InLinear)
      return pictures[id].zoom_x unless zoom_x
      pictures[id].set_transition('zoom_x', zoom_x, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * change Zoom Y
    #--------------------------------------------------------------------------
    def picture_zoom_y(id, zoom_y=false, duration = 0, wf = false, ease = :InLinear)
      return pictures[id].zoom_y unless zoom_y
      pictures[id].set_transition('zoom_y', zoom_y, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * change Zoom
    #--------------------------------------------------------------------------
    def picture_zoom(ids, zoom_x, zoom_y = false, duration = 0, wf = false, ease = :InLinear)
      zoom_y ||= zoom_x
      select_pictures(ids).each do |id|
        picture_zoom_x(id, zoom_x, duration, false, ease)
        picture_zoom_y(id, zoom_y, duration, false, ease)
      end
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * change Tone
    #--------------------------------------------------------------------------
    def picture_tone(id, tone, d = 0, wf = false, ease = :InLinear)
      if d.is_a?(Fixnum)
        pictures[id].start_tone_change(tone, d, ease)
        wait(d) if wf
      else
        pictures[id].tone = tone
      end
    end
    #--------------------------------------------------------------------------
    # * Change blend type
    #--------------------------------------------------------------------------
    def picture_blend(ids, blend)
      select_pictures(ids).each {|id| pictures[id].blend = blend }
    end
    #--------------------------------------------------------------------------
    # * Pin picture on the map
    #--------------------------------------------------------------------------
    def picture_pin(ids, x=nil, y=nil)
      select_pictures(ids).each do |id|
        unless x
          x_s = 16 * pictures[id].scroll_speed_x
          y_s = 16 * pictures[id].scroll_speed_y
          x = picture_x(id) + $game_map.display_x * x_s + pictures[id].shake
          y = picture_y(id) + $game_map.display_y * y_s
        end
        picture_x(id, x)
        picture_y(id, y)
        pictures[id].pin
      end
    end
    #--------------------------------------------------------------------------
    # * Unpin picture on the map
    #--------------------------------------------------------------------------
    def picture_unpin(ids)
      select_pictures(ids).each {|id| pictures[id].unpin }
    end

    #--------------------------------------------------------------------------
    # * Check if a picture is in movement
    #--------------------------------------------------------------------------
    def picture_move?(id)
      pictures[id].move?
    end

    def picture_erased?(id)
      pictures[id].name.empty?
    end

    def picture_showed?(id)
      !picture_erased?(id)
    end

    def fresh_picture_id
      pictures.fresh_id
    end


    #--------------------------------------------------------------------------
    # * Change Picture Opacity
    #--------------------------------------------------------------------------
    def picture_opacity(ids, value, duration = 0, wf = false, ease = :InLinear)
      select_pictures(ids).each do |id|
        pictures[id].set_transition('opacity', value, duration, ease)
      end
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Shake the picture
    #--------------------------------------------------------------------------
    def picture_shake(ids, power, speed, duration)
      select_pictures(ids).each do |id|
        pictures[id].start_shake(power, speed, duration)
      end
    end
    #--------------------------------------------------------------------------
    # * Point in picture
    #--------------------------------------------------------------------------
    def pixel_in_picture?(id, x, y, precise = false)
      spr = sprite_picture(id)
      return false unless spr
      precise ? spr.precise_in?(x, y) : spr.in?(x, y)
    end
    def picture_mouse_hover?(id, precise = false)
      pixel_in_picture?(id, Mouse.x, Mouse.y, precise)
    end
    def picture_mouse_click?(id, precise = false)
      picture_mouse_hover?(id, precise) && Mouse.click?
    end
    def picture_mouse_press?(id, key = :mouse_left, precise = false)
      picture_mouse_hover?(id, precise) && Mouse.press?(key)
    end
    def picture_mouse_trigger?(id, key = :mouse_left, precise = false)
      picture_mouse_hover?(id, precise) && Mouse.trigger?(key)
    end
    def picture_mouse_repeat?(id, key = :mouse_left, precise = false)
      picture_mouse_hover?(id, precise) && Mouse.repeat?(key)
    end
    def picture_mouse_release?(id, key = :mouse_left, precise = false)
      picture_mouse_hover?(id, precise) && Mouse.release?(key)
    end
    #--------------------------------------------------------------------------
    # * Picture collisions
    #--------------------------------------------------------------------------
    def pictures_collide?(a, b)
      spr_a = sprite_picture(a)
      spr_b = sprite_picture(b)
      return if (!spr_a) || (!spr_b)
      spr_a.collide_with?(spr_b)
    end
    #--------------------------------------------------------------------------
    # * Picture collisions (perfect pixel)
    #--------------------------------------------------------------------------
    def pictures_perfect_collide?(a, b)
      spr_a = sprite_picture(a)
      spr_b = sprite_picture(b)
      return if (!spr_a) || (!spr_b)
      spr_a.pixel_collide_with(spr_b)
    end
    #--------------------------------------------------------------------------
    # * Change scroll speed (in X)
    #--------------------------------------------------------------------------
    def picture_scroll_x(ids, speed = nil)
      return pictures[ids].scroll_speed_x unless speed
      select_pictures(ids).each {|id| pictures[id].scroll_speed_x = speed}
    end
    #--------------------------------------------------------------------------
    # * Change scroll speed (in Y)
    #--------------------------------------------------------------------------
    def picture_scroll_y(ids, speed = nil)
    return pictures[ids].scroll_speed_y unless speed
      select_pictures(ids).each {|id| pictures[id].scroll_speed_y = speed}
    end
    #--------------------------------------------------------------------------
    # * Change scroll speed
    #--------------------------------------------------------------------------
    def picture_scroll(ids, speed)
      select_pictures(ids).each do |id|
        picture_scroll_x(id, speed)
        picture_scroll_y(id, speed)
      end
    end
    #--------------------------------------------------------------------------
    # * Clear all pictures
    #--------------------------------------------------------------------------
    def pictures_clear
      screen.clear_pictures
    end

    #--------------------------------------------------------------------------
    # * Get pictures dimension
    #--------------------------------------------------------------------------
    def picture_width(id, v = nil, duration = 0, wf = false, ease = :InLinear)
      pict = pictures[id]
      unless v
        return 0 if !pict || pict.name.empty?
        bmp = sprite_picture(id).swap_cache
        return (((bmp.width * pict.zoom_x))/100.0).to_i
      end
      zoom = Command.percent(v, picture_width(id))
      picture_zoom_x(id, zoom, duration, wf, ease)
    end

    #--------------------------------------------------------------------------
    # * Get pictures dimension
    #--------------------------------------------------------------------------
    def picture_height(id, v = nil, duration = 0, wf = false, ease = :InLinear)
      pict = pictures[id]
      unless v
        return 0 if !pict || pict.name.empty?
        bmp = sprite_picture(id).swap_cache
        return (((bmp.height * pict.zoom_y))/100.0).to_i
      end
      zoom = Command.percent(v, picture_height(id))
      picture_zoom_y(id, zoom, duration, wf, ease)
    end

    #--------------------------------------------------------------------------
    # * set pictures dimension
    #--------------------------------------------------------------------------
    def picture_dimension(id, w, h, duration = 0, wf = false, ease = :InLinear)
      picture_width(id, w, duration, false, ease)
      picture_height(id, h, duration, wf, ease)
    end


    # Fix for EE4
    alias_method :picture_origine, :picture_origin
    alias_method :picture_detach, :picture_unpin

  append_commands
  end

  #==============================================================================
  # ** Commands Base
  #------------------------------------------------------------------------------
  #  Basics Commands
  #==============================================================================

  module Std
    #--------------------------------------------------------------------------
    # * Random number from a range
    #--------------------------------------------------------------------------
    def random(min=0, max)
      min, max = [min.to_i, max.to_i].sort
      min + Kernel.rand(max-min+1)
    end
    #--------------------------------------------------------------------------
    # * Random floating point value between x and its successor
    #--------------------------------------------------------------------------
    def random_figures(x=0)
      x + Kernel.rand
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
      $game_map.display_name
    end
    #--------------------------------------------------------------------------
    # * Get Event Id form coords
    #--------------------------------------------------------------------------
    def id_at(x, y)
      result = $game_map.event_id_xy(x, y)
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
    def tile_id(x, y, layer, map_id = nil)
      return $game_map.tile_id(x, y, layer) unless map_id
      Cache.map(map_id).data[x, y, layer]
    end

    #--------------------------------------------------------------------------
    # * retreive data about tiles
    #--------------------------------------------------------------------------
    def wall?(x, y)
      tile_id = tile_id(x, y, 0)
      tile_id.between?(2288, 2335) || tile_id.between?(2384, 2431) ||
      tile_id.between?(2480, 2527) || tile_id.between?(2576, 2623) ||
      tile_id.between?(2672, 2719) || tile_id.between?(2768, 2815) ||
      tile_id.between?(4736, 5119) || tile_id.between?(5504, 5887) ||
      tile_id.between?(6272, 6655) || tile_id.between?(7040, 7423) ||
      tile_id > 7807
    end

    def roof?(x, y)
      tile_id = tile_id(x, y, 0)
      tile_id.between?(4352, 4735) || tile_id.between?(5120, 5503) ||
      tile_id.between?(5888, 6271) || tile_id.between?(6656, 7039) ||
      tile_id.between?(7424, 7807)
    end

    def stair?(x, y)
      tile_id = tile_id(x, y, 0)
      tile_id.between?(1541, 1542) || tile_id.between?(1549, 1550) ||
      tile_id.between?(1600, 1615)
    end

    def table?(x, y)
      tile_id = tile_id(x, y, 0)
      tile_id.between?(3152, 3199) || tile_id.between?(3536, 3583) ||
      tile_id.between?(3920, 3967) || tile_id.between?(4304, 4351)
    end

    def ground?(x, y)
      tile_id = tile_id(x, y, 0)
      (tile_id.between?(2816, 4351) && !table?(x,y)) ||
      (tile_id > 1663 && !stair?(x,y))
    end

    def get_squares_by_region(region_id)
      $game_map.squares_by_region(region_id)
    end

    def get_squares_by_terrain(terrain_tag)
      $game_map.squares_by_terrain(terrain_tag)
    end

    def get_squares_by_tile(layer, tile_id)
       $game_map.squares_by_tile(layer, tile_id)
    end

    def get_random_square(region_id = 0)
      $game_map.random_square(region_id)
    end

    def use_reflection(properties = nil)
      $game_map.use_reflection = true
      return unless properties && properties.is_a?(Hash)
      $game_map.reflection_properties = properties
      $game_map.reflection_properties[:excluded] ||= []
      $game_map.reflection_properties[:wave_amp] ||= 0
      $game_map.reflection_properties[:wave_speed] ||= 360
      $game_map.reflection_properties[:opacity] ||= 255
      $game_map.reflection_properties[:tone] ||= Tone.new(0, 0, 0, 0)
      $game_map.reflection_properties[:terrains] ||= {}
      $game_map.reflection_properties[:regions] ||= {}
    end

    def create_light_emitters(hash)
      hash.each do |key, value|
        event(id).light_emitter = Light_Emitter.new(
          value[:rayon],
          value[:intensity],
          value[:excluded] || [],
          value[:fx] || {}
        )
      end
      $game_map.need_refresh = true
      SceneManager.scene.refresh_spriteset
    end

    #--------------------------------------------------------------------------
    # * Disable dimness on weather
    #--------------------------------------------------------------------------
    def disable_weather_dimness
      $game_system.weather_no_dimness = true
    end

    #--------------------------------------------------------------------------
    # * Enable dimness on weather
    #--------------------------------------------------------------------------
    def enable_weather_dimness
      $game_system.weather_no_dimness = false
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
    # * Check wounding
    #--------------------------------------------------------------------------
    def damage_floor?(x, y)
      $game_map.damage_floor?(x, y)
    end
    #--------------------------------------------------------------------------
    # * Get a percent
    #--------------------------------------------------------------------------
    def percent(value, max)
      ((value*100.0)/max).to_i
    end
    #--------------------------------------------------------------------------
    # * Get a value from a percent
    #--------------------------------------------------------------------------
    def apply_percent(percent, max)
      ((percent*max)/100.0).to_i
    end
    #--------------------------------------------------------------------------
    # * Include event page
    #--------------------------------------------------------------------------
    def include_page(map_id, ev_id, p_id, if_runnable = false, context=false)
      return unless self.class == Game_Interpreter
      page = Game_Interpreter.get_page(map_id, ev_id, p_id)
      return unless page
      if !if_runnable || page_runnable?(map_id, ev_id, page, context)
        self.append_interpreter(page)
      end
    end
    #--------------------------------------------------------------------------
    # * Invoke Event
    #--------------------------------------------------------------------------
    def invoke_event(map_id, ev_id, new_id, x=nil, y=nil)
      $game_map.add_event(map_id, ev_id, new_id, x, y)
    end
    #--------------------------------------------------------------------------
    # * Get the max Event ID
    #--------------------------------------------------------------------------
    def max_event_id; $game_map.max_id; end
    def fresh_event_id(erased = false)
      if erased
        i = $game_map.min_erased_id
        return i if i
      end
      max_event_id + 1
    end
    #--------------------------------------------------------------------------
    # * Check if a page is runnable
    #--------------------------------------------------------------------------
    def page_runnable?(map_id, ev_id, page, context=false)
      return unless self.class == Game_Interpreter
      page = Game_Interpreter.get_page(map_id, ev_id, p_id) if page.is_a?(Fixnum)
      return unless page
      return Game_Interpreter.conditions_met?(map_id, ev_id, page) if context
      c_map_id = Game_Interpreter.current_map_id
      c_ev_id = self.event_id
      Game_Interpreter.conditions_met?(c_map_id, c_ev_id, page)
    end
    #--------------------------------------------------------------------------
    # * Create a tone
    #--------------------------------------------------------------------------
    def tone(r, v, b, gray = 0)
      Tone.new(r, v, b, gray)
    end
    #--------------------------------------------------------------------------
    # * Create a Color
    #--------------------------------------------------------------------------
    def color(r, v, b, a = 255)
      Color.new(r,v,b,a)
    end

    def map_width; $game_map.width; end
    def map_height; $game_map.height; end

    #--------------------------------------------------------------------------
    # * Flash a square
    #--------------------------------------------------------------------------
    def flash_square(x, y, color)
      tilemap.flash_data ||= Table.new($game_map.width, $game_map.height)
      tilemap.flash_data[x, y] = color.to_hex
      $game_system.flashed_data[$game_map.map_id] = tilemap.flash_data
    end
    #--------------------------------------------------------------------------
    # * UnFlash a square
    #--------------------------------------------------------------------------
    def unflash_square(x, y)
      flash_square(x, y, Color.new(0, 0, 0))
    end
    #--------------------------------------------------------------------------
    # * Flash rect
    #--------------------------------------------------------------------------
    def flash_rect(x, y, width, height, color)
      (x..x+width).each do |i|
        (y..y+height).each do |j|
          flash_square(i, j, color)
        end
      end
    end
    #--------------------------------------------------------------------------
    # * UnFlash rect
    #--------------------------------------------------------------------------
    def unflash_rect(x, y, width, height)
      flash_rect(x, y, width, height, Color.new(0, 0, 0))
    end

    append_commands
  end

  #==============================================================================
  # ** Commands Device
  #------------------------------------------------------------------------------
  #  Device commands
  #==============================================================================

  module Device
    #--------------------------------------------------------------------------
    # * Keyboard support
    #--------------------------------------------------------------------------
    def key_press?(k);        Keyboard.press?(k);             end
    def key_trigger?(k);      Keyboard.trigger?(k);           end
    def key_release?(k);      Keyboard.release?(k);           end
    def key_repeat?(k);       Keyboard.repeat?(k);            end
    def ctrl?(k=nil);         Keyboard.ctrl?(k);              end
    def keyboard_all?(m, *k); Keyboard.all?(m, *k);           end
    def keyboard_any?(m, *k); Keyboard.any?(m, *k);           end
    def caps_lock?;           Keyboard.caps_lock?;            end
    def num_lock?;            Keyboard.num_lock?;             end
    def scroll_lock?;         Keyboard.scroll_lock?;          end
    def shift?;               Keyboard.shift?;                end
    def alt_gr?;              Keyboard.alt_gr?;               end
    def key_time(k);          Keyboard.time(k);               end
    def key_current(*m);      Keyboard.current_key(*m);       end
    def key_current_rgss(*m); Keyboard.rgss_current_key(*m);  end
    def keyboard_current_digit; Keyboard.current_digit;         end
    def keyboard_current_char;  Keyboard.current_char;          end

    #--------------------------------------------------------------------------
    # * Mouse Support
    #--------------------------------------------------------------------------
    def mouse_press?(k);    Mouse.press?(k);                end
    def mouse_click?;       Mouse.click?;                   end
    def mouse_trigger?(k);  Mouse.trigger?(k);              end
    def mouse_release?(k);  Mouse.release?(k);              end
    def mouse_dragging?;    Mouse.dragging?;                end
    def mouse_repeat?(k);   Mouse.repeat?(k);               end
    def mouse_all?(m, *k);  Mouse.all?(m, *k);              end
    def mouse_any?(m, *k);  Mouse.any?(m, *k);              end
    def mouse_x;            Mouse.x;                        end
    def mouse_y;            Mouse.y;                        end
    def mouse_point;        Mouse.point;                    end
    def mouse_square_x;     Mouse.square_x;                 end
    def mouse_square_y;     Mouse.square_y;                 end
    def mouse_rect;         Mouse.rect;                     end
    def mouse_last_rect;    Mouse.last_rect;                end
    def mouse_moving?;      Mouse.moving?;                  end
    def click_time(k);      Mouse.time(k);                  end
    def mouse_in?(rect);    Mouse.in?(rect);                end
    def mouse_current_key(*m)   Mouse.current_key(*m);      end
    def cursor_system(b)
      flag = (!!b) ? 1 : 0
      Externlib::ShowCursor.(flag)
    end

    # Fix for EE4
    alias_method :key_number, :keyboard_current_digit
    alias_method :key_char, :keyboard_current_char
    alias_method :key_char?, :keyboard_current_char
    alias_method :maj?, :shift?
    alias_method :mouse_x_square, :mouse_square_x
    alias_method :mouse_y_square, :mouse_square_y
    alias_method :show_cursor_system, :cursor_system

    append_commands
  end

  #==============================================================================
  # ** Commands Team
  #------------------------------------------------------------------------------
  #  Team Commands
  #==============================================================================

  module Party
    #--------------------------------------------------------------------------
    # * Party data
    #--------------------------------------------------------------------------
    def team_size; $game_party.members.size; end
    def team_members; $game_party.members.map(&:id); end
    def team_member(pos); $game_party.members[pos - 1].id; end
    def gold; $game_party.gold; end
    def steps; $game_party.steps; end
    def play_time; (Graphics.frame_count / Graphics.frame_rate); end
    def timer; $game_timer.sec; end
    def save_count; $game_system.save_count; end
    def battle_count; $game_system.battle_count; end
    def gain_gold(amount); $game_party.gain_gold(amount); end
    def lose_gold(amount); $game_party.lose_gold(amount); end
    #--------------------------------------------------------------------------
    # * Items
    #--------------------------------------------------------------------------
    def use_item(item_id, actor_id)
      return false unless test_item(item_id, actor_id)
      item = $data_items[item_id]
      user = $game_party.movable_members.max_by {|member| member.pha }
      target = $game_actors[actor_id]
      return false unless item && user && target

      user.use_item(item)
      item.repeats.times { target.item_apply(user, item) }
      true
    end
    def test_item(item_id, actor_id)
      item = $data_items[item_id]
      user = $game_party.movable_members.max_by {|member| member.pha }
      target = $game_actors[actor_id]

      target.item_test(user, item)
    end

    def items_possessed
      $game_party.items.map {|i| [i.id] * $game_party.item_number(i)}.flatten
    end
    def armors_possessed
      $game_party.armors.map {|i| [i.id] * $game_party.item_number(i)}.flatten
    end
    def weapons_possessed
      $game_party.weapons.map {|i| [i.id] * $game_party.item_number(i)}.flatten
    end
    def item_count(id); $game_party.item_number($data_items[id]); end
    def weapon_count(id); $game_party.item_number($data_weapons[id]); end
    def armor_count(id); $game_party.item_number($data_armors[id]); end
    def item_name(id); $data_items[id].name; end
    def weapon_name(id); $data_weapons[id].name; end
    def armor_name(id); $data_armors[id].name; end
    def item_note(id); $data_items[id].note; end
    def weapon_note(id); $data_weapons[id].note; end
    def armor_note(id); $data_armors[id].note; end
    def item_description(id); $data_items[id].description; end
    def weapon_description(id); $data_weapons[id].description; end
    def armor_description(id); $data_armors[id].description; end
    def item_icon(id); $data_items[id].icon_index; end
    def weapon_icon(id); $data_weapons[id].icon_index; end
    def armor_icon(id); $data_armors[id].icon_index; end
    def item_price(id); $data_items[id].price; end
    def weapon_price(id); $data_weapons[id].price; end
    def armor_price(id); $data_armors[id].price; end
    def item_consumable?(id); $data_items[id].consumable; end
    def is_key_item?(id); $data_items[id].key_item?; end
    def weapon_max_hit_points(id); $data_weapons[id].params[0]; end
    def weapon_max_magic_points(id); $data_weapons[id].params[1]; end
    def weapon_attack_power(id); $data_weapons[id].params[2]; end
    def weapon_defense_power(id); $data_weapons[id].params[3]; end
    def weapon_magic_attack_power(id); $data_weapons[id].params[4]; end
    def weapon_magic_defense_power(id); $data_weapons[id].params[5]; end
    def weapon_agility(id); $data_weapons[id].params[6]; end
    def weapon_luck(id); $data_weapons[id].params[7]; end
    def armor_max_hit_points(id); $data_armors[id].params[0]; end
    def armor_max_magic_points(id); $data_armors[id].params[1]; end
    def armor_attack_power(id); $data_armors[id].params[2]; end
    def armor_defense_power(id); $data_armors[id].params[3]; end
    def armor_magic_attack_power(id); $data_armors[id].params[4]; end
    def armor_magic_defense_power(id); $data_armors[id].params[5]; end
    def armor_agility(id); $data_armors[id].params[6]; end
    def armor_luck(id); $data_armors[id].params[7]; end

    # def armor_element_rate(i, actor_id, element_id)
    #   item = $data_armors[i]
    #   user = $game_actors[i]
    #   if item.damage.element_id < 0
    #     user.atk_elements.empty? ? 1.0 : elements_max_rate(user.atk_elements)
    #   else
    #     element_rate(item.damage.element_id)
    #   end
    # end

    # def weapon_element_rate(i, actor_id, element_id)
    #   item = $data_weapons[i]
    #   user = $game_actors[i]
    #   if item.damage.element_id < 0
    #     user.atk_elements.empty? ? 1.0 : elements_max_rate(user.atk_elements)
    #   else
    #     element_rate(item.damage.element_id)
    #   end
    # end

    def give_item(id, amount)
      item = $data_items[id];
      $game_party.gain_item(item, amount)
    end
    def give_weapon(id, amount, include_equip = false)
      item = $data_weapons[id];
      $game_party.gain_item(item, amount, include_equip)
    end
    def give_armor(id, amount, include_equip = false)
      item = $data_armors[id];
      $game_party.gain_item(item, amount, include_equip)
    end
    def has_item?(id)
      item = $data_items[id]
      $game_party.has_item?(item)
    end
    def has_weapon?(id, include_equip = false)
      item = $data_weapons[id]
      $game_party.has_item?(item, include_equip)
    end
    def has_armor?(id, include_equip = false)
      item = $data_armors[id]
      $game_party.has_item?(item, include_equip)
    end
    def weapon_equiped?(id, member = nil)
      item = $data_weapons[id]
      return $game_party.members_equip_include?(item) unless member
      $game_actors[member].equips.include?(item)
    end
    def armor_equiped?(id, member = nil)
      item = $data_armors[id]
      return $game_party.members_equip_include?(item) unless member
      $game_actors[member].equips.include?(item)
    end

    def weapon_type(id)
     i = $data_weapons[id].wtype_id
     $data_system.weapon_types[i]
    end
    def armor_type(id)
      i = $data_armors[id].atype_id
      $data_system.armor_types[i]
    end
    def item_scope(id)
      $data_items[id].scope
    end
    def item_has_no_scope?(id)
      item_scope(id) == 0
    end
    def item_for_one_enemy?(id)
      item_scope(id) == 1
    end
    def item_for_all_enemies?(id)
      item_scope(id) == 2
    end
    def item_for_one_random_enemy?(id)
      item_scope(id) == 3
    end
    def item_for_two_random_enemies?(id)
      item_scope(id) == 4
    end
    def item_for_three_random_enemies?(id)
      item_scope(id) == 5
    end
    def item_for_four_random_enemies?(id)
      item_scope(id) == 6
    end
    def item_for_one_ally?(id)
      item_scope(id) == 7
    end
    def item_for_all_allies?(id)
      item_scope(id) == 8
    end
    def item_for_one_dead_ally?(id)
      item_scope(id) == 9
    end
    def item_for_all_dead_allies?(id)
      item_scope(id) == 10
    end
    def item_for_caller?(id)
      item_scope(id) == 11
    end
    def item_occasion(id)
      $data_items[id].occasion
    end
    def item_always_usable?(id)
      item_occasion(id) == 0
    end
    def item_battle_usable?(id)
      item_always_usable?(id) || item_occasion(id) == 1
    end
    def item_menu_usable?(id)
      item_always_usable?(id) || item_occasion(id) == 2
    end
    def item_never_usable?(id)
      item_occasion(id) == 3
    end
    def item_for_opponent?(i); $data_items[i].for_opponent?; end
    def item_for_friend?(i); $data_items[i].for_friend?; end
    def item_for_dead_friend?(i); $data_items[i].for_dead_friend?; end
    def item_for_one?(i); $data_items[i].for_one?; end
    def item_for_random?(i); $data_items[i].for_random?; end
    def item_for_all?(i); $data_items[i].for_all?; end
    def item_need_selection?(i); $data_items[i].need_selection?; end
    def item_certain?(i); $data_items[i].certain?; end
    def item_physical?(i); $data_items[i].physical?; end
    def item_magical?(i); $data_items[i].magical?; end
    def item_number_of_targets(i); $data_items[i].number_of_targets; end
    def item_speed(i); $data_items[i].speed; end
    def item_nb_hits(i); $data_items[i].repeats; end
    def item_success_rate(i); $data_items[i].success_rate; end
    def item_tp_gain(i); $data_items[i].tp_gain; end
    # def item_element_rate(i, actor_id, element_id)
    #   item = $data_items[i]
    #   user = $game_actors[i]
    #   if item.damage.element_id < 0
    #     user.atk_elements.empty? ? 1.0 : elements_max_rate(user.atk_elements)
    #   else
    #     element_rate(item.damage.element_id)
    #   end
    # end

    def last_used_item(); $game_temp.last_used_item; end

    append_commands
  end

  #==============================================================================
  # ** Commands System
  #------------------------------------------------------------------------------
  #  System Commands
  #==============================================================================

  module System
    def sys; $data_system; end
    def game_title; sys.game_title; end
    def version_id; sys.version_id; end
    def currency; sys.currency_unit; end
    def start_map_id; sys.start_map_id; end
    def start_x; sys.start_x; end
    def start_y; sys.start_y; end
    append_commands
  end

  #==============================================================================
  # ** Database  Actor reader
  #------------------------------------------------------------------------------
  #  DatabaseActor commands
  #==============================================================================

  module Actors
    def type_equip(str)
      [:Weapon, :Shield, :Head, :Body, :Accessory].index(str)
    end
    def actor_equip(id, t)
      k = $game_actors[id].equips[type_equip(t)]
      (k.nil?) ? 0 : k.id
    end
    def actor_weapon(id); actor_equip(id, :Weapon); end
    def actor_shield(id); actor_equip(id, :Shield); end
    def actor_head(id); actor_equip(id, :Head); end
    def actor_body(id); actor_equip(id, :Body); end
    def actor_description(id); $game_actors[id].description; end
    def actor_accessory(id); actor_equip(id, :Accessory); end
    def actor_has_weapon?(id); actor_weapon(id) != 0; end
    def actor_has_shield?(id); actor_shield(id) != 0; end
    def actor_has_head?(id); actor_head(id) != 0; end
    def actor_has_body?(id); actor_body(id) != 0; end
    def actor_has_accessory?(id); actor_accessory(id) != 0; end
    def actor_level(id); $game_actors[id].level; end
    def actor_level_max(id); $game_actors[id].max_level; end
    def actor_exp(id); $game_actors[id].exp; end
    def actor_note(id);  $game_actors[id].actor.note; end
    def actor_hp(id); $game_actors[id].hp; end
    def actor_mp(id); $game_actors[id].mp; end
    def actor_tp(id); $game_actors[id].tp; end
    def actor_max_hp(id); $game_actors[id].mhp; end
    def actor_max_mp(id); $game_actors[id].mmp; end
    def actor_attack(id); $game_actors[id].atk; end
    def actor_defense(id); $game_actors[id].def; end
    def actor_magic_attack(id); $game_actors[id].mat; end
    def actor_magic_defense(id); $game_actors[id].mdf; end
    def actor_agility(id); $game_actors[id].agi; end
    def actor_luck(id); $game_actors[id].luk; end
    def actor_hit_rate(id); $game_actors[id].hit; end
    def actor_evasion_rate(id); $game_actors[id].eva; end
    def actor_critical_rate(id); $game_actors[id].cri; end
    def actor_critical_evasion_rate(id); $game_actors[id].cev; end
    def actor_magical_evasion_rate(id); $game_actors[id].mev; end
    def actor_magical_reflection_rate(id); $game_actors[id].mrf; end
    def actor_counter_attack_rate(id); $game_actors[id].cnt; end
    def actor_hp_regeneration_rate(id); $game_actors[id].hrg; end
    def actor_mp_regeneration_rate(id); $game_actors[id].mrg; end
    def actor_tp_regeneration_rate(id); $game_actors[id].trg; end
    def actor_target_rate(id); $game_actors[id].tgr; end
    def actor_guard_effect_rate(id); $game_actors[id].grd; end
    def actor_recovery_effect_rate(id); $game_actors[id].rec; end
    def actor_pharmacology(id); $game_actors[id].pha; end
    def actor_mp_cost_rate(id); $game_actors[id].mcr; end
    def actor_tp_charge_rate(id); $game_actors[id].tcr; end
    def actor_physical_damage_rate(id); $game_actors[id].pdr; end
    def actor_magical_damage_rate(id); $game_actors[id].mdr; end
    def actor_floor_damage_rate(id); $game_actors[id].fdr; end
    def actor_experience_rate(id); $game_actors[id].exr; end
    def actor_name(id); $game_actors[id].name; end
    def set_actor_name(id, n); $game_actors[id].name = n; end
    def actor_nickname(id); $game_actors[id].nickname; end
    def set_actor_nickname(id, n); $game_actors[id].nickname = n; end
    def actor_character_name(id); $game_actors[id].character_name; end
    def actor_character_index(id); $game_actors[id].character_index; end
    def actor_face_name(id); $game_actors[id].face_name; end
    def actor_face_index(id); $game_actors[id].face_index; end
    def actor_class(id); $game_actors[id].class_id; end
    def actor_exp_for_next_level(id); $game_actors[id].next_level_exp; end
    def actor_change_equip(id, slot, wp_id)
      $game_actors[id].change_equip_by_id(type_equip(slot), wp_id)
    end
    def actor_equip_weapon(id, wp); actor_equip(id, :Weapon, wp_id); end
    def actor_equip_shield(id, wp); actor_equip(id, :Shield, wp_id); end
    def actor_equip_head(id, wp); actor_equip(id, :Head, wp_id); end
    def actor_equip_body(id, wp); actor_equip(id, :Body, wp_id); end
    def actor_equip_accessory(id, wp); actor_equip(id, :Accessory, wp_id); end
    def actor_optimize_equipement(id); $game_actors[id].optimize_equipement; end
    def actor_level_up(id); $game_actors[id].level_up; end
    def actor_level_down(id); $game_actors[id].level_down; end
    def actor_give_exp(id, exp); $game_actors[id].gain_exp(exp); end
    def actor_learn(id, skill_id); $game_actors[id].learn_skill(skill_id); end
    def actor_forget(id, skill_id); $game_actors[id].forget_skill(skill_id); end
    def actor_knowns?(id, skill_id); $game_actors[id].skill_learn?($data_skills[skill_id]); end
    def actor_set_graphic(character_name, character_index, face_name, face_index)
      $game_actors.set_graphic(character_name, character_index, face_name, face_index)
    end
    def actor_change_appear(id, character_name, character_index, face_name, face_index)
      $game_actors[id].set_graphic(character_name, character_index, face_name, face_index)
      $game_player.refresh
    end
    def actor_change_character(id, character_name, character_index)
      $game_actors[id].character_name = character_name
      $game_actors[id].character_index = character_index
      $game_player.refresh
    end
    def actor_change_face(id, face_name, face_index)
      $game_actors[id].face_name = face_name
      $game_actors[id].face_index = face_index
      $game_player.refresh
    end
    def actor_skills(id); $game_actors[id].skills.map{|s| s.id}; end
    def actor_weapons(id); $game_actors[id].weapons.map{|w| w.id}; end
    def actor_armors(id); $game_actors[id].armors.map{|a| a.id}; end
    def actor_element_rate(id, element_id)
      $game_actors[id].element_rate(element_id)
    end
    def actor_slot(id)
      return 0 unless $game_party.members[id - 1]
      $game_party.members[id - 1].id
    end

    # Fix for EE4
    alias_method :actor_experience, :actor_exp
    alias_method :actor_exp_rate, :actor_experience_rate
    alias_method :actor_magic, :actor_magic_attack

    append_commands
  end


  #==============================================================================
  # ** Events positions
  #------------------------------------------------------------------------------
  #  Events positions commands
  #==============================================================================

  module Events
    def event_moving?(id); event(id).moving?; end
    def player_moving?; event_moving?(0); end
    def event_name(id); event(id).name; end
    def event_x(id); event(id).x; end
    def event_y(id); event(id).y; end
    def event_screen_x(id); event(id).screen_x; end
    def event_screen_y(id); event(id).screen_y; end
    def event_pixel_y(id)
      ($game_map.display_y * 32) + event_screen_y(id)
    end
    def event_pixel_x(id)
      ($game_map.display_x * 32) + event_screen_x(id)
    end
    def event_direction(id, value = nil)
      return event(id).direction unless value
      event(id).set_direction(value)
    end
    def event_change_character(id, character_name, character_index)
      event(id).set_graphic(character_name, character_index)
    end
    def event_character_name(id); event(id).character_name; end
    def event_character_index(id); event(id).character_index; end
    def current_event_id; me; end
    def me; Game_Interpreter.current_id; end
    def player_x; event(0).x; end
    def player_y; event(0).y; end
    def player_screen_x; event(0).screen_x; end
    def player_screen_y; event(0).screen_y; end
    def player_pixel_x; event_pixel_x(0); end
    def player_pixel_y; event_pixel_y(0); end
    def player_direction(value = nil) ; event_direction(0, value) end
    def distance_between(flag, ev1, ev2)
      ev1, ev2 = event(ev1), event(ev2)
      args = (ev1.screen_x-ev2.screen_x),(ev1.screen_y-ev2.screen_y)
      args = (ev1.x-ev2.x),(ev1.y-ev2.y) if flag == :square
      Math.hypot(*args).to_i
    end

    def dash_activate?
      $game_map.can_dash
    end

    def dash_deactivate?
      !dash_activate
    end

    def dash_activation(flag)
      $game_map.can_dash = !!flag
    end

    def dash_activate
      dash_activation(true)
    end

    def dash_deactivate
      dash_activation(false)
    end

    def event_flash(id, _color, duration)
      color = _color.is_a?(String) ? get_color(_color) : _color
      event(id).k_sprite.flash(color, duration)
    end

    def player_flash(color, duration)
      event_flash(0, color, duration)
    end

    def between(x1, y1, x2, y2)
      a = x1 - x2
      b = y1 - y2
      Math.hypot(a, b)
    end
    def squares_between(ev1, ev2); distance_between(:square, ev1, ev2); end
    def pixels_between(ev1, ev2); distance_between(:pixel, ev1, ev2); end
    def angle_between(ev1, ev2)
      ev1, ev2 = event(ev1), event(ev2)
      args = (ev2.screen_y-ev1.screen_y),(ev2.screen_x-ev1.screen_x)
      - (Math.atan2(*args)*57.29)%360
    end
    def event_look_at?(ev, to, scope, metric = :square)
      if event_direction(ev) == 8
        x_axis = event_x(to) == event_x(ev)
        y_axis = event_y(ev) > event_y(to)
      end
      if event_direction(ev) == 2
        x_axis = event_x(to) == event_x(ev)
        y_axis = event_y(ev) < event_y(to)
      end
      if event_direction(ev) == 4
        x_axis = event_x(to) < event_x(ev)
        y_axis = event_y(ev) == event_y(to)
      end
      if event_direction(ev) == 6
        x_axis = event_x(to) > event_x(ev)
        y_axis = event_y(ev) == event_y(to)
      end
      return x_axis && y_axis && (distance_between(metric, ev, to)<=scope)
    end
    def events_collide?(ev1, ev2)
      event1 = event(ev1)
      event2 = event(ev2)
      return true if event1.x == event2.x && event1.y == event2.y
      flag = case event1.direction
      when 2; event2.x == event1.x && event2.y == event1.y+1
      when 4; event2.x == event1.x-1 && event2.y == event1.y
      when 6; event2.x == event1.x+1 && event2.y == event1.y
      when 8; event2.x == event1.x && event2.y == event1.y-1
      else; false
      end
      return flag && !event1.moving?
    end
    def pixel_in_event?(id, x, y, pr = false)
      event(id).pixel_in?(x, y, pr)
    end
    def pixel_in_player?(x, y, pr = false)
      pixel_in_event?(0, x, y, pr)
    end
    def event_in_screen?(id)
      ev = event(id)
      check_x = ev.screen_x > 0 && ev.screen_x < Graphics.width
      check_y = ev.screen_y > 0 && ev.screen_y < Graphics.height
      check_x && check_y
    end
    def player_in_screen?
      event_in_screen?(0)
    end

    def event_ox(id, value = nil)
      return event(id).ox unless value
      event(id).ox = value
    end

    def event_oy(id, value = nil)
      return event(id).oy unless value
      event(id).oy = value
    end

    def player_ox(value = nil); event_ox(0, value); end
    def player_oy(value = nil); event_oy(0, value); end

    def event_zoom_x(id, value = nil)
      return event(id).zoom_x unless value
      event(id).zoom_x = value
    end

    def event_zoom_y(id, value = nil)
      return event(id).zoom_y unless value
      event(id).zoom_y = value
    end

    def event_zoom(id, value)
      event_zoom_x(id, value)
      event_zoom_y(id, value)
    end

    def player_zoom_x(value = nil); event_zoom_x(0, value); end
    def player_zoom_y(value = nil); event_zoom_y(0, value); end
    def player_zoom(value); event_zoom(0, value); end

    def event_restore_origin(id)
      event(id).restore_oxy
    end
    def player_restore_origin; event_restore_origin(0); end
      [:last_clicked,
      :last_pressed,
      :last_triggered,
      :last_released ,
      :last_repeated,
      :last_hovered].each do |m|
        define_method("#{m}_event") do
          Game_CharacterBase.send(m)
        end
    end

    def events_buzzer_properties(e, amplitude, length)
      es = select_events(e)
      es.each do |e|
        event(e).buzz_amplitude = amplitude
        event(e).buzz_length = length
      end
    end

    def followers_buzzer_properties(*ids, amplitude, length)
      if ids.length == 0
        $game_player.followers.each do |f|
          f.buzz_amplitude = amplitude
          f.buzz_length = length
        end
        return
      end
      ids.each do |i|
        e = $game_player.followers[i]
        if e
          e.buzz_amplitude = amplitude
          e.buzz_length = length
        end
      end
    end

    def events_buzz(e, duration=16)
      es = select_events(e)
      es.each do |e|
        event(e).buzz = duration
      end
    end

    def followers_buzz(ids, duration=16)
      return if !$game_player.followers.visible
      if ids.length == 0
        $game_player.followers.each do |f|
          f.buzz = duration
        end
        return
      end
      ids.each do |i|
        e = $game_player.followers[i]
        e.buzz = duration if e
      end
    end

    def event_erased?(id); event(id).erased?; end

    def event_erase(ids)
      select_events(ids).not(0).each do |id_event|
        event(id_event).erase
      end
    end


    def show_animation(ids, id_animation, wait_flag=false)
      character = nil
      select_events(ids).each do |id_event|
        character = event(id_event)
        character.animation_id = id_animation
      end
      Fiber.yield while character.animation_id > 0 if wait_flag && character
    end

    def show_balloon(ids, id_balloon, wait_flag=false)
      character = nil
      select_events(ids).each do |id_event|
        character = event(id_event)
        character.balloon_id = id_balloon
      end
      Fiber.yield while character.balloon_id > 0 if wait_flag
    end

    def event_move_speed(ids, v = nil)
      return event(ids).move_speed if !v && ids.is_a?(Fixnum)
      select_events(ids).each do |id_event|
        event(id_event).move_speed = v
      end
    end

    def player_move_speed(v = nil)
      event_move_speed(0, v)
    end

    def event_move_frequency(ids, f = nil)
      return event(ids).move_frequency if !f && ids.is_a?(Fixnum)
      select_events(ids).each do |id_event|
        event(id_event).move_frequency = f
      end
    end

    def player_move_frequency(f = nil)
      event_move_frequency(0, f)
    end

    def event_move_speed_frequency(ids, v, f)
      select_events(ids).each do |id_event|
        event(id_event).move_speed = v
        event(id_event).move_frequency = f
      end
    end

    def player_move_speed_frequency(v, f)
      event_move_speed(0, v)
      event_move_frequency(0, f)
    end

    def event_priority(ids, priority = nil)
      return event(ids).priority_type if !priority && ids.is_a?(Fixnum)
      select_events(ids).not(0).each do |id_event|
      event(id_event).priority_type = priority
    end
    end

    def event_trigger(ids, trigger = nil)
      return event(ids).trigger if !trigger && ids.is_a?(Fixnum)
      select_events(ids).not(0).each do |id_event|
        event(id_event).trigger = trigger
      end
    end

    def event_transfert(id, new_x, new_y)
      event(id).moveto(new_x, new_y)
    end

    def player_transfert(new_x, new_y)
      event_transfert(0, new_x, new_y)
    end

    def player_teleport(map_id, x, y, direction = nil, fade_type = 0)
      direction ||= $game_player.direction
      $game_player.reserve_transfer(map_id, x, y, direction)
      $game_temp.fade_type = fade_type
      Fiber.yield while $game_player.transfer?
    end

    def player_teleport_with_transition(map_id, x, y, transition, duration, vague=40, direction = nil)
      direction ||= $game_player.direction
      Graphics.freeze
      $game_player.reserve_transfer(map_id, x, y, direction)
      wait(1)
      Graphics.transition(duration, "Graphics/#{transition}", vague)
    end

    def perform_transition(duration, transition, before, during, after, vague = 40)
      Graphics.freeze
      before.()
      wait(1)
      during.()
      Graphics.transition(duration, "Graphics/#{transition}", vague)
      after.()
    end

    def event_transparent?(id)
      event(id).transparent
    end

    def player_transparent?
      event_transparent?(0)
    end

    def event_transparent(id)
      event(id).transparent = true
    end
    def player_transparent; event_transparent(0); end

    def event_opaque(id)
      event(id).transparent = false
    end
    def player_opaque; event_opaque(0); end

    def event_through?(id); event(id).through; end
    def player_through?; event_through?(0); end

    def event_through(id, flag = true); event(id).through = flag; end
    def player_through(flag = true); event_through(flag); end

    def event_trail(ids, len, mode = 0, tone = nil)
      select_events(ids).each do |id_event|
        event(id_event).trails = len
        event(id_event).trails_prop = {:blend_type => mode, :tone => tone}
      end
    end
    def player_trail(len, mode = 0, tone = nil)
      event_trail(0, len, mode, tone)
    end

    def event_stop_trail(ids)
      select_events(ids).each do |id_event|
        event(id_event).trails_signal = true
      end
    end
    def player_stop_trail; event_stop_trail(0); end

    def event_brutal_stop_trail(ids)
      select_events(ids).each do |id_event|
        event(id_event).trails = 0
      end
    end
    def player_brutal_stop_trail; event_brutal_stop_trail(0); end

    def event_opacity(ids, value = nil)
      return event(ids).opacity unless value
      select_events(ids).each do |id_event|
        event(id_event).opacity = value
      end
    end

    #--------------------------------------------------------------------------
    # * change Tone
    #--------------------------------------------------------------------------
    def event_tone(ids, tone, d = 0, wf = false, ease = :InLinear)
      select_events(ids).each do |id_event|
        event(id_event).start_tone_change(tone, d, ease)
      end
      if d.is_a?(Fixnum) && wf
        wait(d)
      end
    end

    def player_tone(tone, d = 0, wf = false, ease = :InLinear)
      event_tone(0, tone, d, wf, ease)
    end

    def player_opacity(value = nil)
      event_opacity(0, value)
    end

    def event_move_with(id, *code)
      route = RPG::MoveRoute.new
      route.list = code.map {|i| RPG::MoveCommand.new(i)}
      event(id).force_move_route(route)
    end

    def event_path_length(id, x, y, nth = false)
      return event(id).get_path_length(x, y, noth)
    end

    def player_path_length(x, y, nth = false)
      return event_path_length(0, x, y, nth)
    end

    def player_move_with(*code)
      event_move_with(0, *code)
    end

    def event_move_straight(id, value, turn_ok = true)
      ev = event(id)
      ev.move_straight(value, turn_ok)
      return ev.move_succeed
    end

    def player_move_straight(value, turn_ok = true)
      event_move_straight(0, value, turn_ok)
    end

    def event_move_down(id, turn_ok = true)
      event_move_straight(id, 2, turn_ok)
    end
    def event_move_left(id, turn_ok = true)
      event_move_straight(id, 4, turn_ok)
    end
    def event_move_right(id, turn_ok = true)
      event_move_straight(id, 6, turn_ok)
    end
    def event_move_up(id, turn_ok = true)
      event_move_straight(id, 8, turn_ok)
    end

    def player_move_down(turn_ok = true); event_move_down(0, turn_ok); end
    def player_move_left(turn_ok = true); event_move_left(0, turn_ok); end
    def player_move_right(turn_ok = true); event_move_right(0, turn_ok); end
    def player_move_up(turn_ok = true); event_move_up(0, turn_ok); end

    def event_move_random(id); event(id).move_random; end
    def player_move_random; event_move_random(0); end

    def event_move_diagonal(id, horizontal, vertical)
      ev = event(id)
      ev.move_diagonal(horizontal, vertical)
      ev.move_succeed
    end

    def player_move_diagonal(horizontal, vertical)
      event_move_diagonal(0, horizontal, vertical)
    end

    def event_move_lower_left(id); event_move_diagonal(id, 4, 2); end
    def event_move_lower_right(id); event_move_diagonal(id, 6, 2); end
    def event_move_upper_left(id); event_move_diagonal(id, 4, 8); end
    def event_move_upper_right(id); event_move_diagonal(id, 6, 8); end

    def player_move_lower_left; event_move_lower_left(0); end
    def player_move_lower_right; event_move_lower_right(0); end
    def player_move_upper_left; event_move_upper_left(0); end
    def player_move_upper_right; event_move_upper_right(0); end

    def event_move_toward_position(id, x, y)
      ev = event(id)
      ev.move_toward_xy(x, y)
      ev.move_succeed
    end

    def player_move_toward_position(x, y)
      event_move_toward_position(0, x, y)
    end

    def event_move_toward_event(id, target)
      ev = event(id)
      tr = event(target)
      ev.move_toward_character(tr)
      ev.move_succeed
    end

    def event_move_toward_player(id)
      event_move_toward_event(id, 0)
    end

    def player_move_toward_event(id)
      event_move_toward_event(0, id)
    end


    def event_move_away_from_position(id, x, y)
      ev = event(id)
      ev.move_away_from_xy(x, y)
      ev.move_succeed
    end

    def player_move_away_from_position(x, y)
      event_move_away_from_position(0, x, y)
    end

    def event_move_away_from_event(id, target)
      ev = event(id)
      tr = event(target)
      ev.move_away_from_character(tr)
      ev.move_succeed
    end

    def event_move_away_from_player(id)
      event_move_away_from_event(id, 0)
    end

    def player_move_away_from_event(id)
      event_move_away_from_event(0, id)
    end

    def event_move_forward(id)
      ev = event(id)
      ev.move_forward
      ev.move_succeed
    end
    def player_move_forward; event_move_forward(0); end

    def event_move_backward(id)
      ev = event(id)
      ev.move_backward
      ev.move_succeed
    end
    def player_move_backward; event_move_backward(0); end


    def event_turn_down(id); event_direction(id, 2); end
    def player_turn_down; event_turn_down(0); end

    def event_turn_left(id); event_direction(id, 4); end
    def player_turn_left; event_turn_left(0); end

    def event_turn_right(id); event_direction(id, 6); end
    def player_turn_right; event_turn_right(0); end

    def event_turn_up(id); event_direction(id, 8); end
    def player_turn_up; event_turn_up(0); end


    def event_turn_90_left(id); event(id).turn_left_90; end
    def player_turn_90_left; event_turn_90_left(0); end
    def event_turn_90_right(id); event(id).turn_right_90; end
    def player_turn_90_right; event_turn_90_right(0); end
    def event_turn_180(id); event.turn_180; end
    def player_turn_180; event_turn_180(0); end
    def event_turn_90_right_or_left(id); event(id).turn_right_or_left_90; end
    def player_turn_90_right_or_left; event_turn_90_right_or_left(0); end
    def event_turn_random(id); event(id).turn_random; end
    def player_turn_random; event_turn_random(0); end


    def event_turn_toward_position(id, x, y)
      ev = event(id)
      ev.turn_toward_xy(x, y)
    end

    def player_turn_toward_position(x, y)
      event_turn_toward_position(0, x, y)
    end

    def event_turn_toward_event(id, target)
      ev = event(id)
      tr = event(target)
      ev.turn_toward_character(tr)
    end

    def event_turn_toward_player(id)
      event_turn_toward_event(id, 0)
    end

    def player_turn_toward_event(id)
      event_turn_toward_event(0, id)
    end


    def event_turn_away_from_position(id, x, y)
      ev = event(id)
      ev.turn_away_from_xy(x, y)
    end

    def player_turn_away_from_position(x, y)
      event_turn_away_from_position(0, x, y)
    end

    def event_turn_away_from_event(id, target)
      ev = event(id)
      tr = event(target)
      ev.turn_away_from_character(tr)
    end

    def event_turn_away_from_player(id)
      event_turn_away_from_event(id, 0)
    end

    def player_turn_away_from_event(id)
      event_turn_away_from_event(0, id)
    end



    #--------------------------------------------------------------------------
    # * Move event to x, y coords
    #--------------------------------------------------------------------------
    def move_to(id, x, y, w=false, no_t = false); event(id).move_to_position(x, y, w, no_t); end
    #--------------------------------------------------------------------------
    # * Jump event to x, y coords
    #--------------------------------------------------------------------------
    def jump_to(id, x, y, w=true); event(id).jump_to(x, y, w); end

    # Fix for EE4
    alias_method :collide?, :events_collide?
    alias_method :look_at, :event_look_at?
    alias_method :look_at?, :look_at
    alias_method :buzz, :events_buzz
    append_commands
  end

  #==============================================================================
  # ** Skills
  #------------------------------------------------------------------------------
  #  Skills commands
  #==============================================================================

  module Skills

    def skill_name(id); $data_skills[id].name; end
    def skill_note(id); $data_skills[id].note; end
    def skill_description(id); $data_skills[id].description; end
    def skill_icon(id); $data_skills[id].icon_index; end
    def skill_scope(id)
      $data_skills[id].scope
    end
    def skill_has_no_scope?(id)
      skill_scope(id) == 0
    end
    def skill_for_one_enemy?(id)
      skill_scope(id) == 1
    end
    def skill_for_all_enemies?(id)
      skill_scope(id) == 2
    end
    def skill_for_one_random_enemy?(id)
      skill_scope(id) == 3
    end
    def skill_for_two_random_enemies?(id)
      skill_scope(id) == 4
    end
    def skill_for_three_random_enemies?(id)
      skill_scope(id) == 5
    end
    def skill_for_four_random_enemies?(id)
      skill_scope(id) == 6
    end
    def skill_for_one_ally?(id)
      skill_scope(id) == 7
    end
    def skill_for_all_allies?(id)
      skill_scope(id) == 8
    end
    def skill_for_one_dead_ally?(id)
      skill_scope(id) == 9
    end
    def skill_for_all_dead_allies?(id)
      skill_scope(id) == 10
    end
    def skill_for_caller?(id)
      skill_scope(id) == 11
    end
    def skill_occasion(id)
      $data_skills[id].occasion
    end
    def skill_always_usable?(id)
      skill_occasion(id) == 0
    end
    def skill_battle_usable?(id)
      skill_always_usable(id) || skill_occasion(id) == 1
    end
    def skill_menu_usable?(id)
      skill_always_usable(id) || skill_occasion(id) == 2
    end
    def skill_never_usable?(id)
      skill_occasion(id) == 3
    end
    def skill_for_opponent?(i); $data_skills[i].for_opponent?; end
    def skill_for_friend?(i); $data_skills[i].for_friend?; end
    def skill_for_dead_friend?(i); $data_skills[i].for_dead_friend?; end
    def skill_for_one?(i); $data_skills[i].for_one?; end
    def skill_for_random?(i); $data_skills[i].for_random?; end
    def skill_for_all?(i); $data_skills[i].for_all?; end
    def skill_need_selection?(i); $data_skills[i].need_selection?; end
    def skill_certain?(i); $data_skills[i].certain?; end
    def skill_physical?(i); $data_skills[i].physical?; end
    def skill_magical?(i); $data_skills[i].magical?; end
    def skill_number_of_targets(i); $data_skills[i].number_of_targets; end
    def skill_speed(i); $data_skills[i].speed; end
    def skill_nb_hits(i); $data_skills[i].repeats; end
    def skill_success_rate(i); $data_skills[i].success_rate; end
    def skill_tp_gain(i); $data_skills[i].tp_gain; end

    append_commands
  end

  #==============================================================================
  # ** Mathematics
  #------------------------------------------------------------------------------
  #  Math cmds
  #==============================================================================
  module Mathematics
    def pi; Math::PI; end
    def acos(x); Math.acos(x); end
    def acosh(x); Math.acosh(x); end
    def asin(x); Math.asin(x); end
    def asinh(x); Math.asinh(x); end
    def atan(x); Math.atan(x); end
    def atan2(x, y); Math.atan2(x, y); end
    def atanh(x); Math.atanh(x); end
    def cos(x); Math.cos(x); end
    def cosh(x); Math.cosh(x); end
    def hypot(x, y); Math.hypot(x, y); end
    def sin(x); Math.sin(x); end
    def sinh(x); Math.sinh(x); end
    def sqrt(x); Math.sqrt(x); end
    def tan(x); Math.tan(x); end
    def tanh(x); Math.tanh(x); end
    def to_deg(x); (x.to_f)*57.2957795; end
    def to_rad(x); (x.to_f)/57.2957795; end
    # This ugly method is only for preserve the precision !
    def mantissa(x)
      [0, x.to_s.split('.')[1]].join('.').to_f
    end
    #--------------------------------------------------------------------------
    # * Find angle from a couple of point
    #--------------------------------------------------------------------------
    def angle_xy(xa, ya, xb, yb)
      - Math.atan2(yb-ya, xb-xa)*57.29%360
    end
    append_commands
  end

  #==============================================================================
  # ** TroopAndEnemy
  #------------------------------------------------------------------------------
  #  cmd about troops
  #==============================================================================

  module TroopAndEnemy

    def enemy(id)
      return id.enemy if id.is_a?(Game_Enemy)
      $data_enemies[id]
    end
    def troop(id); $data_troops[id]; end
    def troop_size(id); troop(id).members.length; end
    def troop_name(id); troop(id).name; end
    def troop_members(id); troop(id).members.collect{|e| e.enemy_id}; end
    def troop_member(id, pos); troop_members(id)[pos]; end
    def troop_member_x(id, pos); troop(id).members[pos].x; end
    def troop_member_y(id, pos); troop(id).members[pos].y; end

    def picture_show_enemy(id_pic, id, pos)
      x = troop_member_x(id, pos)
      y = troop_member_y(id, pos)
      enemy = enemy(troop_member(id, pos))
      picture = enemy.battler_name
      picture_name = "Battlers/"+picture
      bmp = Cache.battler(picture, enemy.battler_hue)
      w, h = bmp.width/2, bmp.height
      c(:picture_show, id_pic, picture_name, x, y, [w, h])
    end

    def monster_battler_dimension(pos)
      enemy = enemy(troop_member(current_troop, pos))
      picture = enemy.battler_name
      picture_name = "Battlers/"+picture
      bmp = Cache.battler(picture, enemy.battler_hue)
      return [bmp.width, bmp.height]
    end
    def monster_battler_width(i); monster_battler_dimension(i)[0]; end
    def monster_battler_height(i); monster_battler_dimension(i)[1]; end
    def monster_name(id); enemy(id).name; end
    def monster_icon(id); enemy(id).icon_index; end
    def monster_description(id); enemy(id).description; end
    def monster_note(id); enemy(id).note; end
    def monster_max_hp(id); enemy(id).params[0]; end
    def monster_max_mp(id); enemy(id).params[1]; end
    def monster_attack_power(id); enemy(id).params[2]; end
    def monster_defense_power(id); enemy(id).params[3]; end
    def monster_magic_attack_power(id); enemy(id).params[4]; end
    def monster_magic_defense_power(id); enemy(id).params[5]; end
    def monster_agility(id); enemy(id).params[6]; end
    def monster_luck(id); enemy(id).params[7]; end
    def monster_give_exp(id); enemy(id).exp; end
    def monster_give_gold(id); enemy(id).gold; end
    def monster_battler_name(id); enemy(id).battler_name; end
    def monster_battler_hue(id); enemy(id).battler_hue; end
    def current_troop; Kernel.current_troop; end
    # def monster_element_rate(id, element_id)
    #   enemy(id).element_rate(element_id)
    # end

    # Fix for EE4
    alias_method :monster_attack, :monster_attack_power
    alias_method :monster_magic_attack, :monster_magic_attack_power
    alias_method :monster_magic_defense, :monster_magic_defense_power
    alias_method :monster_defense, :monster_defense_power
    alias_method :monster_hp, :monster_max_hp
    alias_method :monster_mp, :monster_max_mp
    alias_method :troop_member_id, :troop_member


    def enemy_hp(id); $game_troop.members[id].hp; end
    def enemy_mp(id); $game_troop.members[id].mp; end
    def enemy_tp(id); $game_troop.members[id].tp; end
    def enemy_max_hp(id); $game_troop.members[id].mhp; end
    def enemy_max_mp(id); $game_troop.members[id].mmp; end
    def enemy_attack(id); $game_troop.members[id].atk; end
    def enemy_defense(id); $game_troop.members[id].def; end
    def enemy_magic_attack(id); $game_troop.members[id].mat; end
    def enemy_magic_defense(id); $game_troop.members[id].mdf; end
    def enemy_agility(id); $game_troop.members[id].agi; end
    def enemy_luck(id); $game_troop.members[id].luk; end
    def enemy_hit_rate(id); $game_troop.members[id].hit; end
    def enemy_evasion_rate(id); $game_troop.members[id].eva; end
    def enemy_critical_rate(id); $game_troop.members[id].cri; end
    def enemy_critical_evasion_rate(id); $game_troop.members[id].cev; end
    def enemy_magical_evasion_rate(id); $game_troop.members[id].mev; end
    def enemy_magical_reflection_rate(id); $game_troop.members[id].mrf; end
    def enemy_counter_attack_rate(id); $game_troop.members[id].cnt; end
    def enemy_hp_regeneration_rate(id); $game_troop.members[id].hrg; end
    def enemy_mp_regeneration_rate(id); $game_troop.members[id].mrg; end
    def enemy_tp_regeneration_rate(id); $game_troop.members[id].trg; end
    def enemy_target_rate(id); $game_troop.members[id].tgr; end
    def enemy_guard_effect_rate(id); $game_troop.members[id].grd; end
    def enemy_recovery_effect_rate(id); $game_troop.members[id].rec; end
    def enemy_pharmacology(id); $game_troop.members[id].pha; end
    def enemy_mp_cost_rate(id); $game_troop.members[id].mcr; end
    def enemy_tp_charge_rate(id); $game_troop.members[id].tcr; end
    def enemy_physical_damage_rate(id); $game_troop.members[id].pdr; end
    def enemy_magical_damage_rate(id); $game_troop.members[id].mdr; end
    def enemy_floor_damage_rate(id); $game_troop.members[id].fdr; end
    def enemy_experience_rate(id); $game_troop.members[id].exr; end
    def enemy_hidden?(id); $game_troop.members[id].hidden?; end
    def enemy_die?(id); $game_troop.members[id].hp <= 0; end
    def current_enemies; $game_troop.members; end
    def total_enemies; $game_troop.members.size; end
    def active_actor
      return BattleManager.actor.id if BattleManager.actor
      nil
    end
    def active_actor?; !!active_actor; end

    append_commands
  end

  #==============================================================================
  # ** Texts
  #------------------------------------------------------------------------------
  #  cmd about texts
  #==============================================================================

  module Texts

    #--------------------------------------------------------------------------
    # * Get a fresh text ID
    #--------------------------------------------------------------------------
    def fresh_text_id
      Game_Screen.get.texts.fresh_id
    end

    #--------------------------------------------------------------------------
    # * Display a text
    #--------------------------------------------------------------------------
    def text_show(id, *args)
      Game_Screen.get.texts[id].show(*args)
    end

    #--------------------------------------------------------------------------
    # * Texte movement
    #--------------------------------------------------------------------------
    def text_move(id, duration, wait_flag, x, y, zoom_x = -1,
        zoom_y = -1, opacity = -1, blend_type = -1, origin = -1)
      Game_Screen.get.texts[id].move(
        duration, x, y, zoom_x, zoom_y, opacity,
        blend_type, origin
      )
      wait(duration) if wait_flag
    end

    def text_move?(id)
      Game_Screen.get.texts[id].move?
    end

    #--------------------------------------------------------------------------
    # * Erase
    #--------------------------------------------------------------------------
    def text_erase(id)
      Game_Screen.get.texts[id].erase
    end
    #--------------------------------------------------------------------------
    # * Change text
    #--------------------------------------------------------------------------
    def text_change(id, value)
      Game_Screen.get.texts[id].text_value = value
    end
    #--------------------------------------------------------------------------
    # * Change profile
    #--------------------------------------------------------------------------
    def text_profile(id, profile = nil)
      return Game_Screen.get.texts[id].profile unless profile
      Game_Screen.get.texts[id].profile = profile
    end
    #--------------------------------------------------------------------------
    # * Rotation
    #--------------------------------------------------------------------------
    def text_rotate(id, speed)
      Game_Screen.get.texts[id].rotate(speed)
    end

    #--------------------------------------------------------------------------
    # * Modify x position
    #--------------------------------------------------------------------------
    def text_x(id, x=false, duration = nil, wf = false)
      return Game_Screen.get.texts[id].x unless x
      if duration.is_a?(Fixnum)
        Game_Screen.get.texts[id].target_x = x
        Game_Screen.get.texts[id].duration = duration
        wait(duration) if wf
      else
        Game_Screen.get.texts[id].x = x
      end
    end

    #--------------------------------------------------------------------------
    # * Modify y position
    #--------------------------------------------------------------------------
    def text_y(id, y=false, duration = nil, wf = false)
      return Game_Screen.get.texts[id].y unless y
      if duration.is_a?(Fixnum)
        Game_Screen.get.texts[id].target_y = y
        Game_Screen.get.texts[id].duration = duration
        wait(duration) if wf
      else
        Game_Screen.get.texts[id].y = y
      end
    end

    #--------------------------------------------------------------------------
    # * change position
    #--------------------------------------------------------------------------
    def text_position(id, x, y, duration = nil, wf = false)
      text_x(id, x, duration)
      text_y(id, y, duration, wf)
    end

    #--------------------------------------------------------------------------
    # * Modify zoom x
    #--------------------------------------------------------------------------
    def text_zoom_x(id, x=false, duration = nil, wf = false)
      return Game_Screen.get.texts[id].zoom_x unless x
      if duration.is_a?(Fixnum)
        Game_Screen.get.texts[id].target_zoom_x = x
        Game_Screen.get.texts[id].duration = duration
        wait(duration) if wf
      else
        Game_Screen.get.texts[id].zoom_x = x
      end
    end

    #--------------------------------------------------------------------------
    # * Modify zoom y
    #--------------------------------------------------------------------------
    def text_zoom_y(id, y=false, duration = nil, wf = false)
      return Game_Screen.get.texts[id].zoom_y unless y
      if duration.is_a?(Fixnum)
        Game_Screen.get.texts[id].target_zoom_y = y
        Game_Screen.get.texts[id].duration = duration
        wait(duration) if wf
      else
        Game_Screen.get.texts[id].zoom_y = y
      end
    end

    #--------------------------------------------------------------------------
    # * change zoom
    #--------------------------------------------------------------------------
    def text_zoom(id, x, y, duration = nil, wf = false)
      text_zoom_x(id, x, duration)
      text_zoom_y(id, y, duration, wf)
    end

    #--------------------------------------------------------------------------
    # * Change Text Opacity
    #--------------------------------------------------------------------------
    def text_opacity(id, value = nil, duration = nil, wf = false)
      return Game_Screen.get.texts[id].opacity unless value
      if duration.is_a?(Fixnum)
        Game_Screen.get.texts[id].target_opacity = value
        Game_Screen.get.texts[id].opacity_duration = duration
        wait(duration) if wf
      else
        Game_Screen.get.texts[id].opacity = value
      end
    end

    def text_value(id)
      Game_Screen.get.texts[id].text_value
    end

    def text_angle(id, value = nil)
      return Game_Screen.get.texts[id].angle unless value
      Game_Screen.get.texts[id].angle = value
    end

    def text_progressive(id, value, delay)
      value.each_char do |ch|
        yield if block_given?
        text_change(id, text_value(id) + ch)
        wait(delay)
      end
    end

    #--------------------------------------------------------------------------
    # * Point in text
    #--------------------------------------------------------------------------
    def pixel_in_text?(id, x, y, precise = false)
      spr = spriteset.text_sprites[id]
      return false unless spr
      precise ? spr.precise_in?(x, y) : spr.in?(x, y)
    end
    def text_mouse_hover?(id, precise = false)
      pixel_in_text?(id, Mouse.x, Mouse.y, precise)
    end
    def text_mouse_click?(id, precise = false)
      text_mouse_hover?(id, precise) && Mouse.click?
    end
    def text_mouse_press?(id, key = :mouse_left, precise = false)
      text_mouse_hover?(id, precise) && Mouse.press?(key)
    end
    def text_mouse_trigger?(id, key = :mouse_left, precise = false)
      text_mouse_hover?(id, precise) && Mouse.trigger?(key)
    end
    def text_mouse_repeat?(id, key = :mouse_left, precise = false)
      text_mouse_hover?(id, precise) && Mouse.repeat?(key)
    end
    def text_mouse_release?(id, key = :mouse_left, precise = false)
      text_mouse_hover?(id, precise) && Mouse.release?(key)
    end

    #--------------------------------------------------------------------------
    # * Clear all texts
    #--------------------------------------------------------------------------
    def texts_clear; Game_Screen.get.clear_texts; end

    append_commands
  end

  #==============================================================================
  # ** Time
  #------------------------------------------------------------------------------
  #  cmd about Time
  #==============================================================================

  module CmdTime

    #--------------------------------------------------------------------------
    # * Get the current year
    #--------------------------------------------------------------------------
    def time_year; Time.now.year ;end
    #--------------------------------------------------------------------------
    # * Get the current month
    #--------------------------------------------------------------------------
    def time_month; Time.now.month; end
    #--------------------------------------------------------------------------
    # * Get the current day
    #--------------------------------------------------------------------------
    def time_day; Time.now.day; end
    #--------------------------------------------------------------------------
    # * Get the current hour
    #--------------------------------------------------------------------------
    def time_hour; Time.now.hour; end
    #--------------------------------------------------------------------------
    # * Get the current min
    #--------------------------------------------------------------------------
    def time_min; Time.now.min; end
    #--------------------------------------------------------------------------
    # * Get the current sec
    #--------------------------------------------------------------------------
    def time_sec; Time.now.sec; end

    append_commands

  end

  #==============================================================================
  # ** Socket
  #------------------------------------------------------------------------------
  #  cmd about Socket
  #==============================================================================

  module TCP

    #--------------------------------------------------------------------------
    # * Check Socket
    #--------------------------------------------------------------------------
    def socket_connected?
      Socket.instance && Socket.instance.connected?
    end

    #--------------------------------------------------------------------------
    # * Connect to serveur
    #--------------------------------------------------------------------------
    def socket_connect(address, port)
      Socket.instance.close if socket_connected?
      Socket.instance = Socket.new(address, port)
      Socket.instance.connect!
    end

    #--------------------------------------------------------------------------
    # * Disconnect of serveur
    #--------------------------------------------------------------------------
    def socket_disconnect
      Socket.instance.close
    end

    #--------------------------------------------------------------------------
    # * Send data
    #--------------------------------------------------------------------------
    def socket_send(data)
      return unless socket_connected?
      Socket.instance.send(data)
    end

    #--------------------------------------------------------------------------
    # * Recv data
    #--------------------------------------------------------------------------
    def socket_recv(len = 1024)
      return false unless socket_connected?
      Socket.instance.recv(len)
    end

    #--------------------------------------------------------------------------
    # * Wait a response
    #--------------------------------------------------------------------------
    def socket_wait_recv(len = 1024)
      return false unless socket_connected?
      flag = false
      while !flag
        Graphics.update
        Input.update
        flag = socket_recv(len)
      end
      flag
    end

    ## EE4 fixtures
    alias_method :server_single_close_connection, :socket_disconnect
    alias_method :server_single_connect, :socket_connect
    alias_method :server_single_recv, :socket_recv
    alias_method :server_single_send, :socket_send
    alias_method :server_single_wait_recv, :socket_wait_recv

    append_commands

  end

  #==============================================================================
  # ** Scene
  #------------------------------------------------------------------------------
  #  cmd about scene navigation
  #==============================================================================

  module Scene

    #--------------------------------------------------------------------------
    # * Go to title Screen
    #--------------------------------------------------------------------------
    def call_title_screen
      SceneManager.call(Scene_Title)
    end
    #--------------------------------------------------------------------------
    # * Go to Load Screen
    #--------------------------------------------------------------------------
    def call_load_screen
      SceneManager.call(Scene_Load)
    end

    #--------------------------------------------------------------------------
    # * call scene
    #--------------------------------------------------------------------------
    def scene_call(scene)
      SceneManager.call(scene)
    end

    #--------------------------------------------------------------------------
    # * Goto scene
    #--------------------------------------------------------------------------
    def scene_goto(scene)
      SceneManager.goto(scene)
    end

    #--------------------------------------------------------------------------
    # * Return scene
    #--------------------------------------------------------------------------
    def scene_return
      SceneManager.return
    end

    #--------------------------------------------------------------------------
    # * Clear scene history
    #--------------------------------------------------------------------------
    def scene_clear_history
      SceneManager.clear
    end


    append_commands

  end

  #==============================================================================
  # ** Save
  #------------------------------------------------------------------------------
  #  cmd about saves
  #==============================================================================

  module Save

    #--------------------------------------------------------------------------
    # * Start new Game from the RMVXAce Editor
    #--------------------------------------------------------------------------
    def start_new_game
      DataManager.setup_new_game
      SceneManager.goto(Scene_Map)
      $game_map.autoplay
    end

    #--------------------------------------------------------------------------
    # * Save Game
    #--------------------------------------------------------------------------
    def save_game(index)
      DataManager.save_game(index - 1)
    end

    #--------------------------------------------------------------------------
    # * Load Game
    #--------------------------------------------------------------------------
    def load_game(index, time=100)
      DataManager.load_game(index-1)
      fadeout(time)
      $game_system.on_after_load
      SceneManager.goto(Scene_Map)
    end

    #--------------------------------------------------------------------------
    # * Determine if save exists
    #--------------------------------------------------------------------------
    def a_save_exists?
      DataManager.save_file_exists?
    end

    #--------------------------------------------------------------------------
    # * Determine if save exists
    #--------------------------------------------------------------------------
    def save_exists?(index)
      File.exists?(DataManager.make_filename(index-1))
    end

    #--------------------------------------------------------------------------
    # * Delete save
    #--------------------------------------------------------------------------
    def save_delete(index)
      DataManager.delete_save_file(index-1)
    end

    #--------------------------------------------------------------------------
    # * Import_data
    #--------------------------------------------------------------------------
    def import_variable(ids, idvar); DataManager.export(ids-1)[:variables][idvar]; end
    def import_switch(ids, idswitch); DataManager.export(ids-1)[:switches][idswitch]; end
    def import_label(ids, idlabel); DataManager.export(ids-1)[:labels][idlabel]; end

    # Fix for EE4
    alias_method :delete_save, :save_delete

    append_commands
  end

  #==============================================================================
  # ** Areas
  #------------------------------------------------------------------------------
  #  Areas commands
  #==============================================================================

  module AreaCmds
    def create_rect_area(x, y, width, height); Area::Rect.new(x, y, width, height); end
    def create_circle_area(x, y, rayon); Area::Circle.new(x, y, rayon); end
    def create_ellipse_area(x, y, width, height); Area::Ellipse.new(x, y, width, height); end
    def create_polygon_area(*points); Area::Polygon.new(*points); end
    def in_area?(area, x, y); area.in?(x, y); end
    def mouse_hover_area?(area); area.hover?; end
    def mouse_hover_square_area?(area); area.square_hover?; end
    def mouse_click_area?(area, k=nil); area.click?; end
    def mouse_click_square_area?(area, k=nil); area.square_click?; end

    def mouse_trigger_area?(area, k=:mouse_left)
      area.trigger?(k)
    end
    def mouse_trigger_square_area?(area, k=:mouse_left)
      area.square_trigger?(k)
    end

    def mouse_press_area?(area, k=:mouse_left)
      area.press?(k)
    end
    def mouse_press_square_area?(area, k=:mouse_left)
      area.square_press?(k)
    end

    def mouse_release_area?(area, k=:mouse_left)
      area.release?(k)
    end
    def mouse_release_square_area?(area, k=:mouse_left)
      area.square_release?(k)
    end

    def mouse_repeat_area?(area, k=:mouse_left)
      area.repeat?(k)
    end
    def mouse_repeat_square_area?(area, k=:mouse_left)
      area.square_repeat?(k)
    end

    # EE4 compatibilities
    alias_method :mouse_square_hover_area?, :mouse_hover_square_area?
    alias_method :mouse_clicked_area?, :mouse_click_area?
    alias_method :mouse_square_clicked_area?, :mouse_click_square_area?
    alias_method :mouse_triggered_area?, :mouse_trigger_area?
    alias_method :mouse_square_triggered_area?, :mouse_trigger_square_area?
    alias_method :mouse_pressed_area?, :mouse_press_area?
    alias_method :mouse_square_pressed_area?, :mouse_press_square_area?
    alias_method :mouse_released_area?, :mouse_release_area?
    alias_method :mouse_square_released_area?, :mouse_release_square_area?
    alias_method :mouse_repeated_area?, :mouse_repeat_area?
    alias_method :mouse_square_repeated_area?, :mouse_repeat_square_area?

    append_commands
  end

  #==============================================================================
  # ** Clipboard
  #------------------------------------------------------------------------------
  #  Clipboar commands
  #==============================================================================
  module RMEClipboard
    def clipboard_push_text(text); Clipboard.push_text(text); end
    def clipboard_get_text; Clipboard.get_text; end
    def clipboard_push_command(cmd); Clipboard.push_command(cmd); end
    append_commands
  end

  #==============================================================================
  # ** Pad360
  #------------------------------------------------------------------------------
  #  Vibration commands
  #==============================================================================

  module Pad360
    def pad360_plugged?(id = 0); Devices::XBOX360Pad.plugged?(id);  end
    def pad360_stop_vibration_left(id = 0)
      Devices::XBOX360Pad.stop_left_vibration(id)
    end
    def pad360_stop_vibration_right(id = 0)
      Devices::XBOX360Pad.stop_right_vibration(id)
    end
    def pad360_vibrate(id = 0, left = 100, right = 100)
      Devices::XBOX360Pad.left_vibration(id, left)
      Devices::XBOX360Pad.right_vibration(id, right)
    end
    def pad360_stop_vibration(id = 0)
      Devices::XBOX360Pad.stop_left_vibration(id)
      Devices::XBOX360Pad.stop_right_vibration(id)
    end
    def pad360_vibrate_left(id = 0, s = 100)
      Devices::XBOX360Pad.left_vibration(id, s)
    end
    def pad360_vibrate_right(id = 0, s = 100)
      Devices::XBOX360Pad.right_vibration(id, s)
    end
    append_commands
  end

  #==============================================================================
  # ** Textfields
  #------------------------------------------------------------------------------
  #  Textfields commands
  #==============================================================================

  module Textfields

    def scene; SceneManager.scene; end

    def textfield_text_show(id, text, x, y, w, profile, range = false, active = true, op = 255)
      scene.add_textfield(id, UI::Window_Textfield.new(x, y, w, text, profile, range))
      textfield_opacity(id, op)
      textfield_activate(id)
    end

    def textfield_int_show(id, number, x, y, w, profile, range = false, active = true, op = 255)
      scene.add_textfield(id, UI::Window_Intfield.new(x, y, w, text, profile, range))
      textfield_opacity(id, op)
      textfield_activate(id)
    end

    def textfield_float_show(id, number, x, y, w, profile, range = false, active = true, op = 255)
      scene.add_textfield(id, UI::Window_Floatfield.new(x, y, w, text, profile, range))
      textfield_opacity(id, op)
      textfield_activate(id)
    end

    def textfield_erase(id = nil)
      unless id
        scene.erase_textfields
        return
      end
      scene.erase_textfield(id)
    end

    def textfield_activate(id)
      scene.unactivate_textfields
      scene.textfields[id].activate if scene.textfields[id]
    end

    def textfield_deactivate(id = nil)
      unless id
        scene.unactivate_textfields
        return
      end
      scene.textfields[id].deactivate if scene.textfields[id]
    end

    def textfield_active?(id)
      return scene.textfields[id].active? if scene.textfields[id]
      false
    end

    def textfield_get_value(id)
      return scene.textfields[id].value if scene.textfields[id]
      ""
    end

    def textfield_set_value(id, value)
      scene.textfields[id].value = value if scene.textfields[id]
    end

    def textfield_hover?(id)
      return scene.textfields[id].in?(Mouse.x, Mouse.y) if scene.textfields[id]
      false
    end

    def textfield_click?(id)
      textfield_hover?(id) && Mouse.click?
    end

    [:press?, :release?, :trigger?, :repeat?].each do |m|
      define_method("textfield_#{m}") do |id, *key|
        key = key[0] || :mouse_left
        textfield_hover?(id) && Mouse.send(m, key)
      end
    end

    def textfield_visible(id, flag)
      scene.textfields[id].visibility = !!flag if scene.textfields[id]
    end

    def textfield_visible?(id)
      return scene.textfields[id].visible if scene.textfields[id] && !scene.textfields[id].disposed?
      false
    end

    def textfield_opacity(id, opacity = nil)
      if scene.textfields[id]
        return scene.textfields[id].opacity unless opacity
        scene.textfields[id].opacity = opacity%256
      end
      0
    end

    append_commands
  end

  #==============================================================================
  # ** CmdSounds
  #------------------------------------------------------------------------------
  #  Command for Sound manipulation
  #==============================================================================

  class RPG::BGM
    attr_accessor :name
  end

  module CmdSounds

    def bgm_play(name, volume=100, pitch=100)
      RPG::BGM.new(name, volume, pitch).play
    end
    def bgs_play(name, volume=80, pitch=100)
      RPG::BGS.new(name, volume, pitch).play
    end
    def se_play(name, volume=80, pitch=100)
      RPG::SE.new(name, volume, pitch).play
    end
    def me_play(name, volume=100, pitch=100)
      RPG::ME.new(name, volume, pitch).play
    end

    def bgm_volume(volume)
      RPG::BGM.last.replay.volume = volume
    end
    def bgs_volume(volume)
      RPG::BGS.last.replay.volume = volume
    end

    def bgm_pitch(pitch)
      RPG::BGM.last.replay.pitch = pitch
    end
    def bgs_pitch(pitch)
      RPG::BGS.last.replay.pitch = pitch
    end

    def bgm_fade(wait, frame=false)
      wait *= frame ? 17 : 1000
      RPG::BGM.fade(wait)
    end
    def bgs_fade(wait, frame=false)
      wait *= frame ? 17 : 1000
      RPG::BGS.fade(wait)
    end
    def me_fade(wait, frame=false)
      wait *= frame ? 17 : 1000
      RPG::ME.fade(wait)
    end
    def sound_fade(wait, frame=false)
      wait *= frame ? 17 : 1000
      RPG::BGM.fade(wait)
      RPG::BGS.fade(wait)
      RPG::ME.fade(wait)
    end

    def bgm_stop; RPG::BGM.stop; end
    def bgs_stop; RPG::BGS.stop; end
    def se_stop; RPG::SE.stop; end
    def me_stop; RPG::ME.stop; end
    def sound_stop
      RPG::BGM.stop
      RPG::BGS.stop
      RPG::SE.stop
      RPG::ME.stop
    end

    def save_bgm; $game_system.save_bgm; end
    def replay_bgm; $game_system.replay_bgm; end

    append_commands
  end


  #==============================================================================
  # ** Camera
  #------------------------------------------------------------------------------
  #  Command for Camera manipulation
  #==============================================================================
  module Camera

    CENTER_X = (Graphics.width / 32 - 1) / 2.0
    CENTER_Y = (Graphics.height / 32 - 1) / 2.0

    POSITION = {
      :centered        => lambda { |x, y| [center_x(x), center_y(y)] },
      :centered_left   => lambda { |x, y| [left_x(x), center_y(y)] },
      :centered_right  => lambda { |x, y| [right_x(x), center_y(y)] },
      :centered_top    => lambda { |x, y| [center_x(x), top_y(y)] },
      :centered_bottom => lambda { |x, y| [center_x(x), bottom_y(y)] },
      :top_left        => lambda { |x, y| [left_x(x), top_y(y)] },
      :top_right       => lambda { |x, y| [right_x(x), top_y(y)] },
      :bottom_left     => lambda { |x, y| [left_x(x), bottom_y(y)] },
      :bottom_right    => lambda { |x, y| [right_x(x), bottom_y(y)] }
    }

    def self.limit_within_range(x, min, max)
      min if (x < min)
      max if (x > max)
      x
    end

    def self.left_x(x); limit_within_range(x, 0, $game_map.width); end
    def self.center_x(x); limit_within_range(x - CENTER_X, 0, $game_map.width); end
    def self.right_x(x); limit_within_range(x - 2 * CENTER_X, 0, $game_map.width); end

    def self.top_y(y); limit_within_range(y, 0, $game_map.height); end
    def self.center_y(y); limit_within_range(y - CENTER_Y, 0, $game_map.height); end
    def self.bottom_y(y); limit_within_range(y - 2 * CENTER_Y, 0, $game_map.height); end

    private_class_method :left_x, :center_x, :right_x,
                         :top_y, :center_y, :bottom_y,
                         :limit_within_range

    def camera_scroll(direction, distance, speed)
      Fiber.yield while $game_map.scrolling?
      $game_map.start_scroll(direction, distance, speed)
    end

    def camera_scroll_towards(x, y, nb_steps, easing = :InLinear, position = :top_left)
      Fiber.yield while $game_map.scrolling?
      $game_map.start_scroll_towards(*POSITION[position].call(x, y),
                                     nb_steps,
                                     Easing::FUNCTIONS[easing])
    end

    def camera_scroll_towards_event(id, nb_steps, easing = :InLinear, position = :top_left)
      camera_scroll_towards(event_x(id), event_y(id), nb_steps, easing, position)
    end

    def camera_scroll_towards_player(nb_steps, easing = :InLinear, position = :top_left)
      camera_scroll_towards(player_x, player_y, nb_steps, easing, position)
    end

    def camera_move_on(x, y)
      $game_map.set_display_pos(x-CENTER_X, y-CENTER_Y)
    end

    def camera_scrolling?
      $game_map.scrolling? || $game_map.scrolling_activate
    end

    def camera_scroll_on(x, y, speed)
      camera_scroll(((dx = $game_map.display_x) > x)?4:6, (dx-x).abs-CENTER_X, speed)
      camera_scroll(((dy = $game_map.display_y) > y)?8:2, (dy-y).abs-CENTER_Y, speed)
    end

    def camera_lock; $game_map.target_camera = nil; end
    def camera_unlock; $game_map.target_camera = $game_player; end
    def camera_locked?; $game_map.target_camera.nil?; end

    def camera_lock_x; $game_map.camera_lock << :x; end
    def camera_unlock_x; $game_map.camera_lock.delete(:x); end
    def camera_x_locked?; $game_map.camera_lock.include?(:x); end

    def camera_lock_y; $game_map.camera_lock << :y; end
    def camera_unlock_y; $game_map.camera_lock.delete(:y); end
    def camera_y_locked?; $game_map.camera_lock.include?(:y); end

    def camera_change_focus(event_id)
      e = event(event_id)
      camera_move_on(e.x, e.y)
      $game_map.target_camera = e
    end

    def camera_zoom(zoom, duration = 0, wait_flag = false, ease = :InLinear)
      Graphics.screen.set_transition('zoom', zoom, duration, ease)
      wait(duration) if wait_flag
    end
    def camera_motion_blur(v, duration = 0, wait_flag = false, ease = :InLinear)
      Graphics.screen.set_transition('motion_blur', v, duration, ease)
      wait(duration) if wait_flag
    end

    append_commands
  end

  #==============================================================================
  # ** Screen
  #------------------------------------------------------------------------------
  #  Change screen data
  #==============================================================================
  module Screen

    def screen_fadeout(duration)
      Fiber.yield while $game_message.visible
      screen.start_fadeout(duration)
      wait(duration)
    end

    def screen_fadein(duration)
      Fiber.yield while $game_message.visible
      screen.start_fadein(duration)
      wait(duration)
    end

    def screen_tone(tone, duration, wait_flag = false)
      $game_map.screen.start_tone_change(tone, duration)
      wait(duration) if wait_flag
    end

    def screen_flash(color, duration, wait_flag = false)
      screen.start_flash(color, duration)
      wait(duration) if wait_flag
    end

    def screen_shake(power, speed, duration, wait_flag = false)
      $game_map.screen.start_shake(power, speed, duration)
      wait(duration) if wait_flag
    end

    def screen_width; Graphics.width; end
    def screen_height; Graphics.height; end

    def screen_pixelation(v, duration = 0, wait_flag = false, ease = :InLinear)
      Graphics.screen.set_transition('pixelation', v, duration, ease)
      wait(duration) if wait_flag
    end
    def screen_blur(v, duration = 0, wait_flag = false, ease = :InLinear)
      Graphics.screen.set_transition('blur', v, duration, ease)
      wait(duration) if wait_flag
    end

    append_commands
  end

  #==============================================================================
  # ** Window
  #------------------------------------------------------------------------------
  #  uhu
  #==============================================================================

  module CmdWindow

    def create_text_window(id, content, x, y, w=-1, h=-1, op = 255, closed=nil)
      f = Window_Text.new(x, y, content, w, h, closed)
      SceneManager.scene.add_window(id, f)
    end

    def create_commands_window(id, x, y, w, hash, op = 255,  closed =nil, h = hash.size)
      f = Window_EvCommand.new(x, y, w, h, hash, closed)
      SceneManager.scene.add_window(id, f)
    end

    def create_horizontal_commands_window(id, x, y, hash, op=255, closed = nil, rows = hash.length)
      f = Window_EvHorzCommand.new(x, y, rows, hash, closed)
      SceneManager.scene.add_window(id, f)
    end

    def create_selectable_window(id, x, y, width, height, hash, op=255, closed = nil)
      f = Window_EvSelectable.new(x, y, width, height, hash, closed)
      SceneManager.scene.add_window(id, f)
    end

    def remove_window(id)
      SceneManager.scene.erase_window(id)
    end

    def remove_all_windows
      SceneManager.scene.erase_windows
    end

    def close_window(id)
      SceneManager.scene.windows[id].close if SceneManager.scene.windows[id]
    end

    def open_window(id)
      SceneManager.scene.windows[id].open if SceneManager.scene.windows[id]
    end

    def window_closed?(id)
      return false unless window_exists?(id)
      SceneManager.scene.windows[id].close?
    end

    def window_opened?(id)
      return false unless window_exists?(id)
      SceneManager.scene.windows[id].open?
    end

    def window_exists?(id)
      SceneManager.scene.windows[id].to_bool
    end

    def window_content(id, content = nil, resize = false)
      return SceneManager.scene.windows[id].content unless content
      SceneManager.scene.windows[id].content = content
      SceneManager.scene.windows[id].refresh(resize)
    end

    def window_moveto(id, x, y, duration = 0, wf = false)
      SceneManager.scene.windows[id].move_position(x, y, duration)
      wait(duration) if wf
    end

    def window_dimension(id, width, height, duration = 0, wf = false)
      if duration > 0
        SceneManager.scene.windows[id].move_size(x, y, duration)
        wait(duration) if wf
        return
      end
      SceneManager.scene.windows[id].width = width
      SceneManager.scene.windows[id].height = height
    end

    def window_opacity(id, value = nil, duration = 0, wf = false)
      return SceneManager.scene.windows[id].opacity unless value
      if duration > 0
        SceneManager.scene.windows[id].move_opacity(value, duration)
        wait(duration) if wf
        return
      end
      SceneManager.scene.windows[id].opacity = value
    end

    def window_move(id, x, y, w, h, opacity, duration = 0, wf = false)
      SceneManager.scene.windows[id].extra_move(x, y, w, h, opacity, duration)
      wait(duration) if wf
    end

    def window_current_symbol(id)
      SceneManager.scene.windows[id].current_symbol
    end

    def window_activate(id)
      SceneManager.scene.windows[id].activate
    end

    def window_deactivate(id)
      SceneManager.scene.windows[id].deactivate
    end

    def window_width(id)
      SceneManager.scene.windows[id].width
    end

    def window_height(id)
      SceneManager.scene.windows[id].height
    end

    def window_x(id, x = nil)
      return SceneManager.scene.windows[id].x unless x
      SceneManager.scene.windows[id].x = x
    end

    def window_y(id, y = nil)
      return SceneManager.scene.windows[id].y unless y
      SceneManager.scene.windows[id].y = y
    end

    #--------------------------------------------------------------------------
    # * Point in window
    #--------------------------------------------------------------------------

    def mouse_hover_window?(id)
      SceneManager.scene.windows[id].mouse_hover? if SceneManager.scene.windows[id]
    end

    append_commands
  end

end
