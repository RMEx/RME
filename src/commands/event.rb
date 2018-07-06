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

      # TODO
      # - `include_page`
      # - `event_moving?`
      # - `player_moving?`
      # - `event_trail`
      # - `pixel_in_event?`
      # - `pixel_in_player?`
      # - `event_opacity`
      # - `event_tone`
      # - `player_tone`
      # - `player_opacity`
      # - `event_ox`
      # - `event_oy`
      # - `player_ox`
      # - `player_oy`
      # - `event_zoom_x`
      # - `event_zoom_y`
      # - `event_zoom`
      # - `event_restore_origin`
      # - `player_restore_origin`
      # - `player_zoom_x`
      # - `player_zoom_y`
      # - `player_zoom`
      # - `player_trail`
      # - `event_stop_trail`
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
