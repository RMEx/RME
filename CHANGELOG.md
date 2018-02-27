# RME Changelog

## Release (1.3.0)

In this release, we decided to use English as the main language.

### Bug fixes
- Fix `SkipTitle` in the "battle-test-case" (@Jauke)

## Release (1.2.0)

### Additions
* Add range support in the syntax shortcuts for variables : `SV[1, 2, 1..18] = 10` (for example) (@xvw)
* Add command `camera_scrolling?` (@xvw, reported by @Zer0Zer0x)
* Add commandsn `windowskin_tone` and `windowskin_opacity` (@xvw, reported by @YendaHusk)
* Add commands `event_tone` and `player_tone` (@xvw, reported by @Zer0Zer0x)
* Add command `event_character_name` (@BastienDuplessier)
* Add command `event_character_index` (@BastienDuplessier)
* Add command `event_change_character` (@BastienDuplessier)
     - Add command `menu_enabled?|disabled?`
     - Add command `save_enabled?|disabled?`
     - Add command `formation_enabled?|disabled?`
     - Add command `encounter_enabled?|disabled?`
     (@xvw, reported by Zer0Zer0x)
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
*  Add command `last_used_item`, (@hinola, reported by @Zer0Zer0x)
*  Add command `disable_weather_dimness`+ `disable_weather_dimness` (@BastienDuplessier, reported by @Zer0Zer0x)
*  Add command `window_exists?` (@hinola)
     - Add command `camera_locked?`
     - Add command `camera_lock_x`
     - Add command `camera_lock_y`
     - Add command `camera_unlock_x`
     - Add command `camera_unlock_y`
     (@BastienDuplessier, reported by @lunri)
*  Add command `mouse_hover_window?` (@hinola)
*  Add commands `choice` and `last_choice` (@xvw, reported by @Zer0Zer0x)
    - Add command `dash_activation`
    - Add command `dash_activate`
    - Add command `dash_deactivate`
    - Add command `dash_activate?`
    - Add command `dash_deactivate?`
    (@xvw, reported by @Zer0Zer0x)

### Bug fixes
*  Fix commands `armors_possessed` and `weapons_possessed` (@hinola)
*  Fix commands `event_flash` and `player_flash` (@BastienDuplessier)
*  Fix on the `displayText` (profiles with outlines) (@xvw reported by @jauke)
*  Fix on linear interpolation (@xvw, reported by @hinola)
