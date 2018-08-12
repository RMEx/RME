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
      NEW_DIRECTION_VALUE = {:name        => :value,
                             :type        => ParameterType::NullableDirection,
                             :description => 'Event.new_direction_value',
                             :default     => nil}
      NEW_ZOOM_VALUE = {:name        => :value,
                        :type        => ParameterType::PositiveFloat,
                        :description => 'Event.new_zoom_value',
                        :default     => nil}
      MOUSE_PRECISION = {:name        => :precise,
                         :type        => ParameterType::Boolean,
                         :description => 'Event.mouse_hover_event.precise',
                         :default     => false}
      MOUSE_BUTTON = {:name        => :mouse_btn,
                      :type        => ParameterType::MouseButton,
                      :description => 'Event.mouse_hover_event?.mouse_btn',
                      :default     => :mouse_left}

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
             (!runnable || ::Command.page_runnable?(map_id, event_id, page, context))
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

      # ------------------------------------------------------------------------
      # * Stop the trailing effect on the player.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :player_stop_trail,
                        :description => 'Event.player_stop_trail'}) do
        ::Command.event_stop_trail(0)
      end

      # ------------------------------------------------------------------------
      # * Brutally stops the trailing effect on the event.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :event_brutal_stop_trail,
                        :description => 'Event.event_brutal_stop_trail',
                        :parameters  => [ EVENT_IDS ]}) do |ids|
        select_events(ids).each do |id_event|
          ::Command.event(id_event).trails = 0
        end
      end

      # ------------------------------------------------------------------------
      # * Brutally stops the trailing effect on the player.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :player_brutal_stop_trail,
                        :description => 'Event.player_brutal_stop_trail'}) do
        ::Command.event_brutal_stop_trail(0)
      end

      # ------------------------------------------------------------------------
      # * Tells whether the given `page` of the given `event` is runnable
      #   by the calling one (`true`); or not (`false`).
      # ------------------------------------------------------------------------
      Command::declare({:section      => self,
                        :name         => :page_runnable?,
                        :description  => 'Event.page_runnable?',
                        :add_exec_ctx => true,
                        :parameters   => [
                          MAP_ID,
                          {:name        => :event_id,
                           :type        => ParameterType::EventId,
                           :description => 'Event.page_runnable?.event_id'},
                          {:name        => :page,
                           :type        => ParameterType::Variant::of(ParameterType::EventPage,
                                                                      ParameterType::EventPageId),
                           :description => 'Event.page_runnable?.page'},
                          {:name        => :context,
                           :type        => ParameterType::Boolean,
                           :description => 'Event.page_runnable?.context',
                           :default     => false}
                        ]}) do |map_id, event_id, page, context, exec_ctx|
        if exec_ctx.class == Game_Interpreter
          p =
            if (page.is_a? Fixnum)
              Game_Interpreter.get_page(map_id, event_id, page)
            else
              page
            end

          if (p)
            if (context)
              Game_Interpreter.conditions_met?(map_id, event_id, p)
            else
              c_map_id = Game_Interpreter.current_map_id
              c_ev_id = exec_ctx.event_id
              Game_Interpreter.conditions_met?(c_map_id, c_ev_id, p)
            end
          end
        end

      end

      # ------------------------------------------------------------------------
      # * Copies the given event, into the current map.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :invoke_event,
                        :description => 'Event.invoke_event',
                        :parameters  => [
                          {:name        => :map_id,
                           :type        => ParameterType::MapId,
                           :description => 'Event.invoke_event.map_id'},
                          {:name        => :event_id,
                           :type        => ParameterType::EventId,
                           :description => 'Event.invoke_event.event_id'},
                          {:name        => :new_id,
                           :type        => ParameterType::EventId,
                           :description => 'Event.invoke_event.new_id'},
                          {:name        => :new_x,
                           :type        => ParameterType::NullableCoordinate,
                           :description => 'Event.invoke_event.new_x',
                           :default     => nil},
                          {:name        => :new_y,
                           :type        => ParameterType::NullableCoordinate,
                           :description => 'Event.invoke_event.new_y',
                           :default     => nil}
                        ]}) do |map_id, event_id, new_id, new_x, new_y|
        $game_map.add_event(map_id, event_id, new_id, new_x, new_y)
      end

      # ------------------------------------------------------------------------
      # * Returns the greatest event's identifier used in the current map.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :max_event_id,
                        :description => 'Event.max_event_id'}) do
        $game_map.max_id
      end

      # ------------------------------------------------------------------------
      # * Returns a free event's identifier.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :fresh_event_id,
                        :description => 'Event.fresh_event_id',
                        :see         => [:invoke_event],
                        :parameters  => [
                          {:name        => :erased,
                           :type        => ParameterType::Boolean,
                           :description => 'Event.fresh_event_id.erased',
                           :default     => false}
                        ]}) do |erased|
        if (erased and $game_map.min_erased_id)
          $game_map.min_erased_id
        else
          ::Command.max_event_id + 1
        end
      end

      # ------------------------------------------------------------------------
      # * Checks if the mouse is currently above the given event(s) during the
      #   command's call (`true`); or not (`false`).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :mouse_hover_event?,
                        :description => 'Event.mouse_hover_event?',
                        :parameters  => [
                          EVENT_IDS,
                          MOUSE_PRECISION
                        ]}) do |event_ids, precise|
        events = ::Command.select_events(events_ids)
        events.any? { |i| ::Command.event(i).hover?(precise) }
      end

      # ------------------------------------------------------------------------
      # * Checks if the mouse is currently above the player during the
      #   command's call (`true`); or not (`false`).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :mouse_hover_player?,
                        :description => 'Event.mouse_hover_player?',
                        :parameters  => [
                          MOUSE_PRECISION
                        ]}) do |precise|
        $game_player.hover?(precise)
      end

      # ------------------------------------------------------------------------
      # * Checks if the mouse is currently above one of the given event(s) and
      #   triggering a `click` event during the command's call (`true`);
      #   or not (`false`).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :mouse_click_event?,
                        :alias       => :mouse_clicked_event?,
                        :description => 'Event.mouse_click_event?',
                        :parameters  => [
                          EVENT_IDS,
                          MOUSE_PRECISION
                        ]}) do |event_ids, precise|
        events = ::Command.select_events(events_ids)
        events.any? { |i| ::Command.event(i).click?(precise) }
      end

      # ------------------------------------------------------------------------
      # * Checks if the mouse is currently above the player and triggering
      #   a `click` event during the command's call (`true`); or not (`false`).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :mouse_click_player?,
                        :alias       => :mouse_clicked_player?,
                        :description => 'Event.mouse_click_player?',
                        :parameters  => [
                          MOUSE_PRECISION
                        ]}) do |precise|
        $game_player.click?(precise)
      end

      # ------------------------------------------------------------------------
      # * Checks if the mouse is currently above one of the given event(s) and
      #   constantly clicking during the command's call on the specified
      #   `mouse_btn` (`true`); or not (`false`).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :mouse_press_event?,
                        :description => 'Event.mouse_press_event?',
                        :parameters  => [
                          EVENT_IDS,
                          MOUSE_BUTTON,
                          MOUSE_PRECISION
                        ]}) do |event_ids, mouse_btn, precise|
        events = ::Command.select_events(events_ids)
        events.any? { |i| ::Command.event(i).press?(mouse_btn, precise) }
      end

      # ------------------------------------------------------------------------
      # * Checks if the mouse is currently above the player and constantly
      #   clicking during the command's call on the specified
      #   `mouse_btn` (`true`); or not (`false`).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :mouse_press_player?,
                        :description => 'Event.mouse_press_player?',
                        :parameters  => [
                          MOUSE_BUTTON,
                          MOUSE_PRECISION
                        ]}) do |mouse_btn, precise|
        $game_player.press?(mouse_btn, precise)
      end

      # ------------------------------------------------------------------------
      # * Checks if the mouse is currently above one of the given event(s) and
      #   triggering a `click` event during the command's call on the specified
      #   `mouse_btn` (`true`); or not (`false`).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :mouse_trigger_event?,
                        :description => 'Event.mouse_trigger_event?',
                        :parameters  => [
                          EVENT_IDS,
                          MOUSE_BUTTON,
                          MOUSE_PRECISION
                        ]}) do |event_ids, mouse_btn, precise|
        events = ::Command.select_events(events_ids)
        events.any? { |i| ::Command.event(i).trigger?(mouse_btn, precise) }
      end

      # ------------------------------------------------------------------------
      # * Checks if the mouse is currently above the player and triggering
      #   a `click` event during the command's call on the specified
      #   `mouse_btn` (`true`); or not (`false`).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :mouse_trigger_player?,
                        :description => 'Event.mouse_trigger_player?',
                        :parameters  => [
                          MOUSE_BUTTON,
                          MOUSE_PRECISION
                        ]}) do |mouse_btn, precise|
        $game_player.trigger?(mouse_btn, precise)
      end

      # ------------------------------------------------------------------------
      # * Checks if the mouse is currently above one of the given event(s) and
      #   the `mouse_btn` is constantly released during the command's call
      #   (`true`); or not (`false`).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :mouse_repeat_event?,
                        :description => 'Event.mouse_repeat_event?',
                        :parameters  => [
                          EVENT_IDS,
                          MOUSE_BUTTON,
                          MOUSE_PRECISION
                        ]}) do |event_ids, mouse_btn, precise|
        events = ::Command.select_events(events_ids)
        events.any? { |i| ::Command.event(i).repeat?(mouse_btn, precise) }
      end

      # ------------------------------------------------------------------------
      # * Checks if the mouse is currently above the player and the `mouse_btn`
      #   is constantly released during the command's call (`true`);
      #   or not (`false`).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :mouse_repeat_player?,
                        :description => 'Event.mouse_repeat_player?',
                        :parameters  => [
                          MOUSE_BUTTON,
                          MOUSE_PRECISION
                        ]}) do |mouse_btn, precise|
        $game_player.repeat?(mouse_btn, precise)
      end

      # ------------------------------------------------------------------------
      # * Checks if the mouse is currently above one of the given event(s) and
      #   the `mouse_btn` is released during the command's call (`true`);
      #   or not (`false`).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :mouse_release_event?,
                        :description => 'Event.mouse_release_event?',
                        :parameters  => [
                          EVENT_IDS,
                          MOUSE_BUTTON,
                          MOUSE_PRECISION
                        ]}) do |event_ids, mouse_btn, precise|
        events = ::Command.select_events(events_ids)
        events.any? { |i| ::Command.event(i).release?(mouse_btn, precise) }
      end

      # ------------------------------------------------------------------------
      # * Checks if the mouse is currently above the player and the `mouse_btn`
      #  is released during the command's call (`true`); or not (`false`).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :mouse_release_player?,
                        :description => 'Event.mouse_release_player?',
                        :parameters  => [
                          MOUSE_BUTTON,
                          MOUSE_PRECISION
                        ]}) do |mouse_btn, precise|
        $game_player.release?(mouse_btn, precise)
      end

      # ------------------------------------------------------------------------
      # * Returns the x-coordinate of the given event.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :event_x,
                        :description => 'Event.event_x',
                        :parameters  => [
                          EVENT_ID
                        ]}) do |event_id|
        ::Command.event(event_id).x
      end

      # ------------------------------------------------------------------------
      # * Returns the x-coordinate of the player.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :player_x,
                        :description => 'Event.player_x'}) do
        $game_player.x
      end

      # ------------------------------------------------------------------------
      # * Returns the y-coordinate of the given event.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :event_y,
                        :description => 'Event.event_y',
                        :parameters  => [
                          EVENT_ID
                        ]}) do |event_id|
        ::Command.event(event_id).y
      end

      # ------------------------------------------------------------------------
      # * Returns the y-coordinate of the player.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :player_y,
                        :description => 'Event.player_y'}) do
        $game_player.y
      end

      # ------------------------------------------------------------------------
      # * Returns the x-coordinate (relative to the screen) of the given event.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :event_screen_x,
                        :description => 'Event.event_screen_x',
                        :parameters  => [
                          EVENT_ID
                        ]}) do |event_id|
        ::Command.event(event_id).screen_x
      end

      # ------------------------------------------------------------------------
      # * Returns the x-coordinate (relative to the screen) of the player.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :player_screen_x,
                        :description => 'Event.player_screen_x'}) do
        $game_player.screen_x
      end

      # ------------------------------------------------------------------------
      # * Returns the y-coordinate (relative to the screen) of the given event.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :event_screen_y,
                        :description => 'Event.event_screen_y',
                        :parameters  => [
                          EVENT_ID
                        ]}) do |event_id|
        ::Command.event(event_id).screen_y
      end

      # ------------------------------------------------------------------------
      # * Returns the y-coordinate (relative to the screen) of the player.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :player_screen_y,
                        :description => 'Event.player_screen_y'}) do
        $game_player.screen_y
      end

      # ------------------------------------------------------------------------
      # * Returns the x-coordinate (pixels being the unit) of the given event.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :event_pixel_x,
                        :description => 'Event.event_pixel_x',
                        :parameters  => [
                          EVENT_ID
                        ]}) do |event_id|
        ($game_map.display_x * 32) + ::Command.event_screen_x(event_id)
      end

      # ------------------------------------------------------------------------
      # * Returns the x-coordinate (pixels being the unit) of the player.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :player_pixel_x,
                        :description => 'Event.player_pixel_x'}) do
        ::Command.event_pixel_x(0)
      end

      # ------------------------------------------------------------------------
      # * Returns the y-coordinate (pixels being the unit) of the given event.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :event_pixel_y,
                        :description => 'Event.event_pixel_y',
                        :parameters  => [
                          EVENT_ID
                        ]}) do |event_id|
        ($game_map.display_y * 32) + ::Command.event_screen_y(event_id)
      end

      # ------------------------------------------------------------------------
      # * Returns the y-coordinate (pixels being the unit) of the player.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :player_pixel_y,
                        :description => 'Event.player_pixel_y'}) do
        ::Command.event_pixel_y(0)
      end

      # ------------------------------------------------------------------------
      # * Checks if the given event is currently on screen or not.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :event_in_screen?,
                        :description => 'Event.event_in_screen?',
                        :parameters  => [
                          EVENT_ID
                        ]}) do |event_id|
        e = ::Command.event(event_id)
        check_x = (e.screen_x > 0) and (e.screen_x < Graphics.width)
        check_y = (e.screen_y > 0) and (e.screen_y < Graphics.height)
        check_x and check_y
      end

      # ------------------------------------------------------------------------
      # * Checks if the player is currently on screen or not.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :player_in_screen?,
                        :description => 'Event.player_in_screen?'}) do
        ::Command.event_in_screen?(0)
      end

      # ------------------------------------------------------------------------
      # * Returns or updates (if `value` is provided) the direction of the
      #   given event.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :event_direction,
                        :description => 'Event.event_direction',
                        :parameters  => [
                          EVENT_ID,
                          NEW_DIRECTION_VALUE
                        ]}) do |event_id, value|
        unless value
          ::Command.event(event_id).direction
        else
          ::Command.event(event_id).set_direction(value)
        end
      end

      # ------------------------------------------------------------------------
      # * Returns or updates (if `value` is provided) the player's direction.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :player_direction,
                        :description => 'Event.player_direction',
                        :parameters  => [
                          NEW_DIRECTION_VALUE
                        ]}) do |value|
        ::Command.event_directon(0, value)
      end

      # TODO
      # - `event_change_character`
      # - `event_character_name`
      # - `event_character_index`
      # - `current_event_id`
      # - `me`
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
