# -*- coding: utf-8 -*-

# ==============================================================================
# * RPG Maker (VX / VX.ACE) Extender
# ------------------------------------------------------------------------------
# {{ TODO: authors }}
# ------------------------------------------------------------------------------
# Events related commands.
#
# [Dependencies]
#   - `../*.rb`
#   - `../documentation/internal_commands.rb`
#   - `../documentation/internal_documentation.rb`
# ==============================================================================

module RME
  module Command
    module Event

      # Common parameters' declaration
      MAP_ID = {:name        => :map_id,
                :type        => ParameterType::MapId,
                :description => 'Event.map_id'}
      EVENT_ID = {:name        => :event_id,
                  :type        => ParameterType::EventId,
                  :description => 'Event.event_id'}
      EVENT_IDS = {:name        => :ids,
                   :type        => ParameterType::EventsSelector,
                   :description => 'Event.event_ids'}
      TRAIL_LENGTH = {:name        => :length,
                      :type        => ParameterType::PositiveInteger,
                      :description => 'Event.event_trail.length'}
      TRAIL_BLEND_MODE = {:name        => :blend_mode,
                          :type        => ParameterType::BlendingMode,
                          :description => 'Event.event_trail.blend_mode',
                          :default     => ParameterType::BLENDING_MODES[:normal]}
      EVENT_TONE = {:name        => :tone,
                    :type        => ParameterType::Tone,
                    :description => 'Event.event_tone.tone'}
      TRAIL_TONE = {:name        => :tone,
                    :type        => ParameterType::NullableTone,
                    :description => 'Event.event_trail.tone',
                    :default     => nil}
      PIXEL_X = {:name        => :x,
                 :type        => ParameterType::Coordinate,
                 :description => 'Event.pixel_in_event?.x'}
      PIXEL_Y = {:name        => :y,
                 :type        => ParameterType::Coordinate,
                 :description => 'Event.pixel_in_event?.y'}
      PIXEL_PRECISION = {:name        => :precision,
                         :type        => ParameterType::Boolean,
                         :description => 'Event.pixel_in_event?.precision',
                         :default     => false}
      OPACITY = {:name        => :value,
                 :type        => ParameterType::NullableOpacity,
                 :description => 'Event.event_opacity.value',
                 :default     => nil}
      TRANSITION_DURATION = {:name        => :duration,
                             :type        => ParameterType::PositiveInteger,
                             :description => 'Event.transtion_duration',
                             :default     => 0}
      WAIT_FLAG = {:name        => :wait_flag,
                   :type        => ParameterType::Boolean,
                   :description => 'Event.wait_flag',
                   :default     => false}
      EASING_FUNCTION = {:name        => :easing,
                         :type        => ParameterType::EasingFunction,
                         :description => 'Event.easing',
                         :default     => :InLinear}
      NEW_COORDINATE_VALUE = {:name        => :value,
                              :type        => ParameterType::NullableCoordinate,
                              :description => 'Event.new_coordinate_value',
                              :default     => nil}
      NEW_ZOOM_VALUE = {:name        => :value,
                        :type        => ParameterType::PositiveFloat,
                        :description => 'Event.new_zoom_value',
                        :default     => nil}

      # ------------------------------------------------------------------------
      # * Includes and calls the page of another event.
      #   (The execution context can be modified with `runnable` and `context`)
      # ------------------------------------------------------------------------
      Command::declare({:section      => self,
                        :name         => :include_page,
                        :description  => 'Event.include_page',
                        :add_exec_ctx => true,
                        :parameters   => [
                          MAP_ID,
                          {:name        => :event_id,
                           :type        => ParameterType::EventId,
                           :description => 'Event.include_page.event_id'},
                          {:name        => :page_id,
                           :type        => ParameterType::EventPageId,
                           :description => 'Event.include_page.page_id'},
                          {:name        => :runnable,
                           :type        => ParameterType::Boolean,
                           :description => 'Event.include_page.runnable',
                           :default     => false},
                          {:name        => :context,
                           :type        => ParameterType::Boolean,
                           :description => 'Event.include_page.context',
                           :default     => false}
                        ]}) do |map_id, event_id, page_id, runnable, context, exec_ctx|
        if exec_ctx.class == Game_Interpreter
          page = Game_Interpreter.get_page(map_id, event_id, page_id)
          if page &&
             (!runnable || page_runnable?(map_id, event_id, page, context))
            exec_ctx.append_interpreter(page)
          end
        end
      end

      # ------------------------------------------------------------------------
      # * Tells whether the event is moving (`true`) or not (`false`).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :event_moving?,
                        :description => 'Event.event_moving?',
                        :parameters  => [ EVENT_ID ]}) do |event_id|
        ::Command.event(event_id).moving?
      end

      # ------------------------------------------------------------------------
      # * Tells whether the player is moving (`true`) or not (`false`).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :player_moving?,
                        :description => 'Event.player_moving?'}) do
        ::Command.event_moving?(0)
      end

      # ------------------------------------------------------------------------
      # * Apply a trailing visual effect on the given events.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :event_trail,
                        :description => 'Event.event_trail',
                        :parameters  => [
                          EVENT_IDS,
                          TRAIL_LENGTH,
                          TRAIL_BLEND_MODE,
                          TRAIL_TONE
                        ]}) do |ids, length, blend_mode, tone|
        select_events(ids).each do |id_event|
          ::Command.event(id_event).trails = length
          ::Command.event(id_event).trails_prop = {
            :blend_type => blend_mode,
            :tone => tone
          }
        end
      end

      # ------------------------------------------------------------------------
      # * Tells whether the given point (`x`, `y`) is inside the event's sprite
      #   (`true`) or not (`false`).
      # TODO: Revise this command as it does not work currently !
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :pixel_in_event?,
                        :description => 'Event.pixel_in_event?',
                        :parameters  => [
                          EVENT_ID,
                          PIXEL_X,
                          PIXEL_Y,
                          PIXEL_PRECISION
                        ]}) do |event_id, x, y, precision|
        ::Command.event(event_id).pixel_in?(x, y, precision)
      end

      # ------------------------------------------------------------------------
      # * Tells whether the given point (`x`, `y`) is inside the player's sprite
      #   (`true`) or not (`false`).
      # TODO: Revise this command as it does not work currently !
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :pixel_in_player?,
                        :description => 'Event.pixel_in_player?',
                        :parameters  => [
                          PIXEL_X,
                          PIXEL_Y,
                          PIXEL_PRECISION
                        ]}) do |x, y, precision|
        ::Command.pixel_in_event?(0, x, y, precision)
      end

      # ------------------------------------------------------------------------
      # * Retrieves or updates the opacity of the given events' sprites.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :event_opacity,
                        :description => 'Event.event_opacity',
                        :parameters  => [
                          EVENT_IDS,
                          OPACITY
                        ]}) do |ids, value|
        unless value
          ::Command.event(ids).opacity
        else
          select_events(ids).each do |id_event|
            ::Command.event(id_event).opacity = value
          end
        end
      end

      # ------------------------------------------------------------------------
      # * Updates the tone of the given events' sprites.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :event_tone,
                        :description => 'Event.event_tone',
                        :parameters  => [
                          EVENT_IDS,
                          EVENT_TONE,
                          TRANSITION_DURATION,
                          WAIT_FLAG,
                          EASING_FUNCTION
                        ]}) do |ids, tone, duration, wait_flag, easing|
        select_events(ids).each do |id_event|
          ::Command.event(id_event).start_tone_change(tone, duration, easing)
        end
        ::Command.wait(duration) if wait_flag
      end

      # ------------------------------------------------------------------------
      # * Updates the tone of the player's sprite.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :player_tone,
                        :description => 'Event.player_tone',
                        :parameters  => [
                          EVENT_TONE,
                          TRANSITION_DURATION,
                          WAIT_FLAG,
                          EASING_FUNCTION
                        ]}) do |tone, duration, wait_flag, easing|
        ::Command.event_tone(0, tone, duration, wait_flag, easing)
      end

      # ------------------------------------------------------------------------
      # * Updates the opacity of the player's sprite.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :player_opacity,
                        :description => 'Event.player_opacity',
                        :parameters  => [
                          OPACITY
                        ]}) do |value|
        ::Command.event_opacity(0, value)
      end

      # ------------------------------------------------------------------------
      # * Returns or updates (if `value` is provided) the starting position
      #   of the given event (as set in the editor).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :event_ox,
                        :description => 'Event.event_ox',
                        :parameters  => [
                          EVENT_ID,
                          NEW_COORDINATE_VALUE
                        ]}) do |event_id, value|
        unless value
          ::Command.event(event_id).ox
        else
          ::Command.event(event_id).ox = value
        end
      end

      # ------------------------------------------------------------------------
      # * Returns or updates (if `value` is provided) the starting position
      #   of the given event (as set in the editor).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :event_oy,
                        :description => 'Event.event_oy',
                        :parameters  => [
                          EVENT_ID,
                          NEW_COORDINATE_VALUE
                        ]}) do |event_id, value|
        unless value
          ::Command.event(event_id).oy
        else
          ::Command.event(event_id).oy = value
        end
      end

      # ------------------------------------------------------------------------
      # * Returns or updates (if `value` is provided) the starting position
      #   of the player (as set in the editor).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :player_ox,
                        :description => 'Event.player_ox',
                        :parameters  => [
                          NEW_COORDINATE_VALUE
                        ]}) do |value|
        ::Command.event_ox(0, value)
      end

      # ------------------------------------------------------------------------
      # * Returns or updates (if `value` is provided) the starting position
      #   of the player (as set in the editor).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :player_oy,
                        :description => 'Event.player_oy',
                        :parameters  => [
                          NEW_COORDINATE_VALUE
                        ]}) do |value|
        ::Command.event_oy(0, value)
      end

      # ------------------------------------------------------------------------
      # * Updates the given event's sprite's x-axis' zoom level.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :event_zoom_x,
                        :description => 'Event.event_zoom_x',
                        :parameters  => [
                          EVENT_ID,
                          NEW_ZOOM_VALUE
                        ]}) do |event_id, value|
        unless value
          ::Command.event(event_id).zoom_x
        else
          ::Command.event(event_id).zoom_x = value
        end
      end

      # ------------------------------------------------------------------------
      # * Updates the given event's sprite's y-axis' zoom level.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :event_zoom_y,
                        :description => 'Event.event_zoom_y',
                        :parameters  => [
                          EVENT_ID,
                          NEW_ZOOM_VALUE
                        ]}) do |event_id, value|
        unless value
          ::Command.event(event_id).zoom_y
        else
          ::Command.event(event_id).zoom_y = value
        end
      end

      # ------------------------------------------------------------------------
      # * Updates the given event's sprite's zoom level.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :event_zoom,
                        :description => 'Event.event_zoom',
                        :parameters  => [
                          EVENT_ID,
                          {:name        => :value,
                           :type        => ParameterType::PositiveFloat,
                           :description => 'Event.event_zoom.value'}
                        ]}) do |event_id, value|
        ::Command.event_zoom_x(event_id, value)
        ::Command.event_zoom_y(event_id, value)
      end

      # ------------------------------------------------------------------------
      # * Restores the event's starting position, to the one defined in the
      #   editor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :event_restore_origin,
                        :description => 'Event.event_restore_origin',
                        :parameters  => [ EVENT_ID ]}) do |event_id|
        ::Command.event(event_id).restore_oxy
      end

      # ------------------------------------------------------------------------
      # * Restores the players starting position, to the one defined in the
      #   editor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :player_restore_origin,
                        :description => 'Event.player_restore_origin'}) do
        ::Command.event_restore_origin(0)
      end

      # ------------------------------------------------------------------------
      # * Updates the player's sprite's x-axis' zoom level.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :player_zoom_x,
                        :description => 'Event.player_zoom_x',
                        :parameters  => [ NEW_ZOOM_VALUE ]}) do |value|
        ::Command.event_zoom_x(0, value)
      end

      # ------------------------------------------------------------------------
      # * Updates the player's sprite's y-axis' zoom level.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :player_zoom_y,
                        :description => 'Event.player_zoom_y',
                        :parameters  => [ NEW_ZOOM_VALUE ]}) do |value|
        ::Command.event_zoom_y(0, value)
      end

      # ------------------------------------------------------------------------
      # * Updates the player's sprite's zoom level.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :player_zoom,
                        :description => 'Event.player_zoom',
                        :parameters  => [
                          {:name        => :value,
                           :type        => ParameterType::PositiveFloat,
                           :description => 'Event.event_zoom.value'}
                        ]}) do |value|
        ::Command.event_zoom(0, value)
      end

      # ------------------------------------------------------------------------
      # * Apply a trailing visual effect on the player.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :player_trail,
                        :description => 'Event.player_trail',
                        :parameters  => [
                          TRAIL_LENGTH,
                          TRAIL_BLEND_MODE,
                          TRAIL_TONE
                        ]}) do |length, blend_mode, tone|
        ::Command.event_trail(0, length, blend_mode, tone)
      end

      # ------------------------------------------------------------------------
      # * Stop the trailing effect on the given events.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :event_stop_trail,
                        :description => 'Event.event_stop_trail',
                        :parameters  => [ EVENT_IDS ]}) do |ids|
        select_events(ids).each do |id_event|
          ::Command.event(id_event).trails_signal = true
        end
      end

      # TODO
      # - `player_stop_trail`
      # - `event_brutal_stop_trail`
      # - `player_brutal_stop_trail`
      # - `page_runnable?`
      # - `invoke_event`
      # - `max_event_id`
      # - `fresh_event_id`
      # - `mouse_over_event?`
      # - `mouse_click_event?`
      # - `mouse_press_event?`
      # - `mouse_trigger_event?`
      # - `mouse_repeat_event?`
      # - `mouse_release_event?`
      # - `event_x`
      # - `event_in_screen?`
      # - `player_in_screen?`
      # - `event_y`
      # - `event_screen_x`
      # - `event_screen_y`
      # - `event_pixel_x`
      # - `event_pixel_y`
      # - `event_change_character`
      # - `event_character_name`
      # - `event_character_index`
      # - `current_event_id`
      # - `me`
      # - `event_direction`
      # - `player_x`
      # - `player_y`
      # - `player_screen_x`
      # - `player_screen_y`
      # - `player_pixel_x`
      # - `player_pixel_y`
      # - `player_direction`
      # - `squares_between`
      # - `pixels_between`
      # - `event_look_at?`
      # - `event_move_with`
      # - `player_move_with`
      # - `events_collide?`
      # - `event_name`
      # - `event_through?`
      # - `player_through?`
      # - `event_through`
      # - `player_through`
      # - `event_erased?`
      # - `mouse_hover_player?`
      # - `mouse_click_player?`
      # - `mouse_press_player?`
      # - `mouse_trigger_player?`
      # - `mouse_repeat_player?`
      # - `mouse_release_player?`
      # - `last_clicked_event`
      # - `last_pressed_event`
      # - `last_triggered_event`
      # - `last_released_event`
      # - `last_repeated_event`
      # - `last_hovered_event`
      # - `events_buzzer_properties`
      # - `followers_buzzer_properties`
      # - `events_buzz`
      # - `followers_buzz`
      # - `angle_between`
      # - `event_erase`
      # - `show_animation`
      # - `show_balloon`
      # - `event_move_speed`
      # - `player_move_speed`
      # - `event_move_frequency`
      # - `player_move_frequence`
      # - `event_transfert`
      # - `player_transfert`
      # - `player_teleport`
      # - `player_teleport_with_transition`
      # - `event_move_speed_frequency`
      # - `player_move_speed_frequency`
      # - `player_path_length`
      # - `event_path_length`
      # - `move_to`
      # - `event_move_to`
      # - `event_partial_move_to`
      # - `jump_to`
      # - `event_jump_to`
      # - `event_jump`
      # - `player_jump`
      # - `event_jump_x`
      # - `event_jump_y`
      # - `player_jump_x`
      # - `player_jump_y`
      # - `player_move_to`
      # - `player_partial_move_to`
      # - `player_jump_to`
      # - `event_start`
      # - `event_priority`
      # - `event_trigger`
      # - `event_transparent?`
      # - `player_transparent?`
      # - `event_transparent`
      # - `player_transparent`
      # - `event_opaque`
      # - `player_opaque`
      # - `event_move_down`
      # - `event_move_left`
      # - `event_move_right`
      # - `event_move_up`
      # - `player_move_down`
      # - `player_move_left`
      # - `player_move_right`
      # - `player_move_up`
      # - `event_move_straight`
      # - `player_move_straight`
      # - `event_move_random`
      # - `player_move_random`
      # - `event_move_diagonal`
      # - `player_move_diagonal`
      # - `event_move_lower_left`
      # - `event_move_lower_right`
      # - `event_move_upper_left`
      # - `event_move_upper_right`
      # - `player_move_lower_left`
      # - `player_move_lower_right`
      # - `player_move_upper_left`
      # - `player_move_upper_right`
      # - `event_move_toward_position`
      # - `player_move_toward_position`
      # - `event_move_toward_event`
      # - `event_move_toward_player`
      # - `player_move_toward_event`
      # - `event_move_away_from_position`
      # - `player_move_away_from_position`
      # - `event_move_away_from_event`
      # - `event_move_away_from_player`
      # - `player_move_away_from_event`
      # - `event_move_forward`
      # - `player_move_forward`
      # - `event_move_backward`
      # - `player_move_backward`
      # - `event_turn_down`
      # - `player_turn_down`
      # - `event_turn_left`
      # - `player_turn_left`
      # - `event_turn_right`
      # - `player_turn_right`
      # - `event_turn_up`
      # - `player_turn_up`
      # - `event_turn_90_left`
      # - `player_turn_90_left`
      # - `event_turn_90_right`
      # - `player_turn_90_right`
      # - `event_turn_180`
      # - `player_turn_180`
      # - `event_turn_90_right_or_left`
      # - `player_turn_90_right_or_left`
      # - `event_turn_random`
      # - `player_turn_random`
      # - `event_turn_toward_position`
      # - `player_turn_toward_position`
      # - `event_turn_toward_event`
      # - `event_turn_toward_player`
      # - `player_turn_toward_event`
      # - `event_turn_away_from_position`
      # - `player_turn_away_from_position`
      # - `event_turn_away_from_event`
      # - `event_turn_away_from_player`
      # - `player_turn_away_from_event`
      # - `event_flash`
      # - `player_flash`
      # - `event_width`
      # - `event_height`
      # - `player_width`
      # - `player_height`
      # - `character_width`
      # - `character_height`

      append_commands
    end
  end
end
