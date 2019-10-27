# RME Changelog

## Release (2.1.0)

### Additions

- Add command `text_showed?` (@xvw, requested by @mamie-nani)
- Add commands `reset_variables`, `reset_switches`, `reset_self_switches` `reset_self_variables`, `reset_labels`, `reset_self_labels` and `reset_contents` (@xvw, requested by @mamie-nani)
- More comprehensive feedback on error in script call (@xvw, requested by @BastienDuplessier)

### Bug fixes

### Documentation

- Fix some multiple mistakes in documentation and samples (@xvw, reported by @Zer0xxxxx)
- Clarification between region and virtual zone (@xvw, reported by @Zer0xxxxx)

## Release (2.0.0)

### Additions
- Add commands `event_dashing?` and `player_dashing?` (@xvw, requested by @Zer0xxxxx and @CyrilRPG)
- Add command `get_picture_opacity` (@xvw, reported by @Zer0xxxxx)
- Add commands `event_direction_fix` and `player_direction_fix` (@xvw, requested by @Zer0xxxxx)
- Add commands `event_step_animation` and `player_step_animation` (@xvw, requested by @Zer0xxxxx)
- Add commands `event_walk_animation` and `player_walk_animation` (@xvw, requested by @Zer0xxxxx)
- Add command `last_used_skill` (@xvw, requested by @CuddleFox)

### Bug fixes
- Fix `player_through` (@xvw, reported by @acs-l)
- Fix `last_used_item` to introduce distinction between skills and items (@xvw)
- Fix followers displacement (@xvw, reported by @Erwill)
- Fix `create_text_window` size inference (@xvw, reported by @AurelienDosSantos)
- Great improvement on global performances (@xvw with @BlancLapin and @AurelienDosSantos 's help)

## Release (1.4.1)

### Bug fixes
- Fix `spritesheet_erase` and  `spritesheets_clear` (@BastienDuplessier, reported by @Princesseuh)
- Fix `event_look_towards?` and `event_look_towards_event?` (@BastienDuplessier, reported by @Azvnrd)
- Fix `pixel_in_event?` and `pixel_in_player?` (@BastienDuplessier, reported by @acs-l)
- Fix `page_runnable?` (@BastienDuplessier, reported by @acs-l)
- Fix `event_move_with`, move is not repeatable anymore  (@BastienDuplessier, reported by @Zer0xxxxx)
- Fix `invoke_event` which was stopping animations when called  (@BastienDuplessier, reported by @YendaHusk)
- Fix `switch_tileset`, now does not reset ox/oy of events sprites (@BastienDuplessier, reported by @YendaHusk)

## Release (1.4.0)

### Additions
- Add command `reset` (@BastienDuplessier, reported by @YendaHusk)
- Add commands `event_original_x` and `event_original_y` (@BastienDuplessier, reported by @Zer0xxxx)
- Allow to get `message_height` (@BastienDuplessier, reported by @Zer0xxxx)
- Add command `fresh_window_id` (@BastienDuplessier, reported by @Zer0xxxx)
- Add command `picture_z` (@xvw, reported by @Zer0xxxx)
- Add command `spritesheet_z` (@xvw, reported by @Zer0xxxx)
- Add `purge` parameter for `text_progressive` (@xvw, reported by @Princesseuh)
- Add command `abs` (@xvw, reported by @Zer0xxxx)
- Add command `include_common_event` (@BastienDuplessier)
- Add command `get_squares_between` and `get_squares_between_events` (@BastienDuplessier)
- Add commands `window_change_windowskin`, `window_change_tone`, `window_use_default_windowskin, `window_use_default_tone` (@BastienDuplessier, reported by @Zer0xxxx)
- Add command `event_allow_overlap` (@BastienDuplessier, reported by @YendaHusk)
- Add commands `get_squares_around_event`, `get_squares_around`, `get_squares_in_circle` and `get_squares_in_rectangle` (@BastienDuplessier)
- Add commands `skill_mp_cost` and `skill_tp_cost` (@LucasDevos, @BastienDuplessier)
- Add commands `event_look_towards_event?` and `event_look_towards?` (@BastienDuplessier)

### Bug fixes
- Fix Game_End background that wasn't disposed on `skip_title` activated (@BastienDuplessier, reported by @Zer0xxxx)
- Fix `get_path_length` (@BastienDuplessier, reported by @Ibiky)
- Fix `Float DomainError : Infinity` when losing focus (@BastienDuplessier, reported by @Zer0xxxx)
- Fix `create_text_window`, now can create empty text windows (@BastienDuplessier, reported by @Zer0xxxx)
- Fix `text_show` with empty content and centered (@BastienDuplessier, reported by @aureliendossantos)
- Teleport/Moving player will not recenter camera anymore if camera is locked (@BastienDuplessier, reported by @LucasDevos)
- Fix disapearing windows and textfields after returning to Scene_Map

### Misc
- Various fixes in the documentation (reported by @aureliendossantos, @Zer0xxxx, @grrim, @YendaHusk)

## Release (1.3.0)

In this release, we decided to use English as the main language.

### Additions
- Add command `player_height` (@grrim)
- Add command `player_width` (@grrim)
- Add command `event_height` (@grrim)
- Add command `event_width` (@grrim)
- Add command `character_height` (@grrim, reported by @Zer0Zer0x)
- Add command `character_width` (@grrim, reported by @Zer0Zer0x)
- Add module `spritesheet` (@grrim, reported by @Spyrojojo and @Zer0Zer0x)
- Add command `import_variable_with_free_name` (@grrim, reported by @Zer0Zer0x)
- Add command `import_label_with_free_name` (@grrim, reported by @Zer0Zer0x)
- Add command `import_switch_with_free_name` (@grrim, reported by @Zer0Zer0x)
- Add command `file_append` (@grrim)
- Add command `file_write` (@grrim)
- Add command `file_read` (@grrim)
- Add command `file_delete` (@grrim)
- Add command `file_exists?` (@grrim)
- Add command `load_game_with_free_name` (@grrim, reported by @Zer0Zer0x)
- Add command `save_game_with_free_name` (@grrim, reported by @Zer0Zer0x)
- Add command `text_unpin` (@grrim, reported by @Princesseuh)
- Add command `text_pinned?` (@grrim, reported by @Princesseuh)
- Add command `text_pin` (@grrim, reported by @Princesseuh)
- Add command `text_scroll_y` (@grrim)
- Add command `text_scroll_x` (@grrim)
- Add command `text_scroll` (@grrim)
- Add command `player_jump_y` (@grrim, reported by @xvw)
- Add command `player_jump_x` (@grrim, reported by @xvw)
- Add command `event_jump_y` (@grrim, reported by @xvw)
- Add command `event_jump_x` (@grrim, reported by @xvw)
- Add command `player_jump` (@grrim, reported by @xvw)
- Add command `event_jump` (@grrim, reported by @xvw)
- Add command `player_move_to` (@grrim)
- Add command `player_jump_to` (@grrim)
- Add command `event_move_to` (@grrim)
- Add command `event_jump_to` (@grrim)
- Add command `event_partial_move_to` (@BastienDuplessier)
- Add command `player_partial_move_to` (@BastienDuplessier)
- Add command `boat_passable?` (@BastienDuplessier)
- Add command `ship_passable?` (@BastienDuplessier)
- Add command `autotile_type` (@BastienDuplessier)
- Add command `event_at` (@BastienDuplessier)
- Add command `event_start` (@BastienDuplessier)

### Bug fixes
- Change default parameters of `camera_*` (use `centered` instead of `top_left`) (@grrim, reported by @Jauke)
- Fix commands `picture_width` and `picture_height` (@grrim, reported by @Jauke)
- Fix `SkipTitle` in the "battle-test-case" (@Jauke)
- Fix move_to command (@BastienDuplessier)

### Deprecates
- `move_to` : use `event_move_to` instead (@grrim)
- `jump_to` : use `event_jump_to` instead (@grrim)
- `id_at` : use `event_at` instead (@BastienDuplessier)

## Release (1.2.0)

### Additions
* Add range support in the syntax shortcuts for variables : `SV[1, 2, 1..18] = 10` (for example) (@xvw)
* Add command `camera_scrolling?` (@xvw, reported by @Zer0Zer0x)
* Add commands `windowskin_tone` and `windowskin_opacity` (@xvw, reported by @YendaHusk)
* Add commands `event_tone` and `player_tone` (@xvw, reported by @Zer0Zer0x)
* Add command `event_character_name` (@BastienDuplessier)
* Add command `event_character_index` (@BastienDuplessier)
* Add command `event_change_character` (@BastienDuplessier)
* Add command `menu_enabled?|disabled?` (@xvw, reported by Zer0Zer0x)
* Add command `save_enabled?|disabled?` (@xvw, reported by Zer0Zer0x)
* Add command `formation_enabled?|disabled?` (@xvw, reported by Zer0Zer0x)
* Add command `encounter_enabled?|disabled?` (@xvw, reported by Zer0Zer0x)
* Move command `current_event_id` and `me` from EvEx to Commands (@BastienDuplessier)
* Add command `use_item` (@BastienDuplessier)
* Add command `test_item` (@BastienDuplessier)

### Bug fixes
* Fix `me` on event's trips (@xvw, reported by @Zer0Zer0x)
* Fix `flash_*` commands (@xvw)
* Fix command `picture_zoom` (@xvw)
* Fix command `event_priority` (@xvw, reported by @Zer0Zer0x)
* Fix command `event_trigger` (@xvw)

## Release (1.1.0)

### Additions
* Add command `last_used_item`, (@hinola, reported by @Zer0Zer0x)
* Add command `disable_weather_dimness`+ `disable_weather_dimness` (@BastienDuplessier, reported by @Zer0Zer0x)
* Add command `window_exists?` (@hinola)
* Add command `camera_locked?` (@BastienDuplessier, reported by @lunri)
* Add command `camera_lock_x` (@BastienDuplessier, reported by @lunri)
* Add command `camera_lock_y` (@BastienDuplessier, reported by @lunri)
* Add command `camera_unlock_x` (@BastienDuplessier, reported by @lunri)
* Add command `camera_unlock_y` (@BastienDuplessier, reported by @lunri)
* Add command `mouse_hover_window?` (@hinola)
* Add commands `choice` and `last_choice` (@xvw, reported by @Zer0Zer0x)
* Add command `dash_activation` (@xvw, reported by @Zer0Zer0x)
* Add command `dash_activate` (@xvw, reported by @Zer0Zer0x)
* Add command `dash_deactivate` (@xvw, reported by @Zer0Zer0x)
* Add command `dash_activate?` (@xvw, reported by @Zer0Zer0x)
* Add command `dash_deactivate?` (@xvw, reported by @Zer0Zer0x)

### Bug fixes
*  Fix commands `armors_possessed` and `weapons_possessed` (@hinola)
*  Fix commands `event_flash` and `player_flash` (@BastienDuplessier)
*  Fix on the `displayText` (profiles with outlines) (@xvw reported by @jauke)
*  Fix on linear interpolation (@xvw, reported by @hinola)
