# RME Changelog

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

### Bug fixes
- Fix Game_End background that wasn't disposed on `skip_title` activated (@BastienDuplessier, reported by @Zer0xxxx)
- Fix `get_path_length` (@BastienDuplessier, reported by @Ibiky)
- Fix `Float DomainError : Infinity` when losing focus (@BastienDuplessier, reported by @Zer0xxxx)
- Fix `create_text_window`, now can create empty text windows (@BastienDuplessier, reported by @Zer0xxxx)
- Fix `text_show` with empty content and centered (@BastienDuplessier, reported by @aureliendossantos)
- Teleport/Moving player will not recenter camera anymore if camera is locked (@BastienDuplessier, reported by @LucasDevos)

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
