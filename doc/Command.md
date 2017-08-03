# RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Classes et modules](Classes%20et%20modules.md) > **Command**  
- - -  
# Command
Collection des commandes EventExtender

## Liste des méthodes
*    [Command.a_save_exists?](#commanda_save_exists)
*    [Command.acos(x)](#commandacosx)
*    [Command.acosh(x)](#commandacoshx)
*    [Command.active_actor](#commandactive_actor)
*    [Command.active_actor?](#commandactive_actor)
*    [Command.actor_accessory(id)](#commandactor_accessoryid)
*    [Command.actor_agility(id)](#commandactor_agilityid)
*    [Command.actor_armors(id)](#commandactor_armorsid)
*    [Command.actor_attack(id)](#commandactor_attackid)
*    [Command.actor_body(id)](#commandactor_bodyid)
*    [Command.actor_change_appear(id, character_name, character_index, face_name, face_index)](#commandactor_change_appearid-character_name-character_index-face_name-face_index)
*    [Command.actor_change_character(id, character_name, character_index)](#commandactor_change_characterid-character_name-character_index)
*    [Command.actor_change_equip(id, slot, object_id)](#commandactor_change_equipid-slot-object_id)
*    [Command.actor_change_face(id, face_name, face_index)](#commandactor_change_faceid-face_name-face_index)
*    [Command.actor_character_index(id)](#commandactor_character_indexid)
*    [Command.actor_character_name(id)](#commandactor_character_nameid)
*    [Command.actor_class(id)](#commandactor_classid)
*    [Command.actor_counter_attack_rate(id)](#commandactor_counter_attack_rateid)
*    [Command.actor_critical_evasion_rate(id)](#commandactor_critical_evasion_rateid)
*    [Command.actor_critical_rate(id)](#commandactor_critical_rateid)
*    [Command.actor_defense(id)](#commandactor_defenseid)
*    [Command.actor_description(id)](#commandactor_descriptionid)
*    [Command.actor_element_rate(id, element_id)](#commandactor_element_rateid-element_id)
*    [Command.actor_equip(id, slot)](#commandactor_equipid-slot)
*    [Command.actor_equip_accessory(id, object_id)](#commandactor_equip_accessoryid-object_id)
*    [Command.actor_equip_body(id, object_id)](#commandactor_equip_bodyid-object_id)
*    [Command.actor_equip_head(id, object_id)](#commandactor_equip_headid-object_id)
*    [Command.actor_equip_shield(id, object_id)](#commandactor_equip_shieldid-object_id)
*    [Command.actor_equip_weapon(id, object_id)](#commandactor_equip_weaponid-object_id)
*    [Command.actor_evasion_rate(id)](#commandactor_evasion_rateid)
*    [Command.actor_exp(id)](#commandactor_expid)
*    [Command.actor_exp_for_next_level(id)](#commandactor_exp_for_next_levelid)
*    [Command.actor_exp_rate(id)](#commandactor_exp_rateid)
*    [Command.actor_face_index(id)](#commandactor_face_indexid)
*    [Command.actor_face_name(id)](#commandactor_face_nameid)
*    [Command.actor_floor_damage_rate(id)](#commandactor_floor_damage_rateid)
*    [Command.actor_forget(id, skill_id)](#commandactor_forgetid-skill_id)
*    [Command.actor_give_exp(id, exp)](#commandactor_give_expid-exp)
*    [Command.actor_guard_effect_rate(id)](#commandactor_guard_effect_rateid)
*    [Command.actor_has_accessory?(id)](#commandactor_has_accessoryid)
*    [Command.actor_has_body?(id)](#commandactor_has_bodyid)
*    [Command.actor_has_head?(id)](#commandactor_has_headid)
*    [Command.actor_has_shield?(id)](#commandactor_has_shieldid)
*    [Command.actor_has_weapon?(id)](#commandactor_has_weaponid)
*    [Command.actor_head(id)](#commandactor_headid)
*    [Command.actor_hit_rate(id)](#commandactor_hit_rateid)
*    [Command.actor_hp(id)](#commandactor_hpid)
*    [Command.actor_hp_regeneration_rate(id)](#commandactor_hp_regeneration_rateid)
*    [Command.actor_knowns?(id, skill_id)](#commandactor_knownsid-skill_id)
*    [Command.actor_learn(id, skill_id)](#commandactor_learnid-skill_id)
*    [Command.actor_level(id)](#commandactor_levelid)
*    [Command.actor_level_down(id)](#commandactor_level_downid)
*    [Command.actor_level_max(id)](#commandactor_level_maxid)
*    [Command.actor_level_up(id)](#commandactor_level_upid)
*    [Command.actor_luck(id)](#commandactor_luckid)
*    [Command.actor_magic_attack(id)](#commandactor_magic_attackid)
*    [Command.actor_magic_defense(id)](#commandactor_magic_defenseid)
*    [Command.actor_magical_damage_rate(id)](#commandactor_magical_damage_rateid)
*    [Command.actor_magical_evasion_rate(id)](#commandactor_magical_evasion_rateid)
*    [Command.actor_magical_reflection_rate(id)](#commandactor_magical_reflection_rateid)
*    [Command.actor_max_hp(id)](#commandactor_max_hpid)
*    [Command.actor_max_mp(id)](#commandactor_max_mpid)
*    [Command.actor_mp(id)](#commandactor_mpid)
*    [Command.actor_mp_cost_rate(id)](#commandactor_mp_cost_rateid)
*    [Command.actor_mp_regeneration_rate(id)](#commandactor_mp_regeneration_rateid)
*    [Command.actor_name(id)](#commandactor_nameid)
*    [Command.actor_nickname(id)](#commandactor_nicknameid)
*    [Command.actor_note(id)](#commandactor_noteid)
*    [Command.actor_optimize_equipement(id)](#commandactor_optimize_equipementid)
*    [Command.actor_pharmacology(id)](#commandactor_pharmacologyid)
*    [Command.actor_physical_damage_rate(id)](#commandactor_physical_damage_rateid)
*    [Command.actor_recovery_effect_rate(id)](#commandactor_recovery_effect_rateid)
*    [Command.actor_set_graphic(id, character_name, character_index, face_name, face_index)](#commandactor_set_graphicid-character_name-character_index-face_name-face_index)
*    [Command.actor_shield(id)](#commandactor_shieldid)
*    [Command.actor_skills(id)](#commandactor_skillsid)
*    [Command.actor_slot(id)](#commandactor_slotid)
*    [Command.actor_target_rate(id)](#commandactor_target_rateid)
*    [Command.actor_tp(id)](#commandactor_tpid)
*    [Command.actor_tp_charge_rate(id)](#commandactor_tp_charge_rateid)
*    [Command.actor_tp_regeneration_rate(id)](#commandactor_tp_regeneration_rateid)
*    [Command.actor_weapon(id)](#commandactor_weaponid)
*    [Command.actor_weapons(id)](#commandactor_weaponsid)
*    [Command.alt_gr?](#commandalt_gr)
*    [Command.angle_between(idA, idB)](#commandangle_betweenida-idb)
*    [Command.angle_xy(xa, ya, xb, yb)](#commandangle_xyxa-ya-xb-yb)
*    [Command.apply_percent(percent, max)](#commandapply_percentpercent-max)
*    [Command.armor_agility(id)](#commandarmor_agilityid)
*    [Command.armor_attack_power(id)](#commandarmor_attack_powerid)
*    [Command.armor_count(id)](#commandarmor_countid)
*    [Command.armor_defense_power(id)](#commandarmor_defense_powerid)
*    [Command.armor_description(id)](#commandarmor_descriptionid)
*    [Command.armor_equiped?(id, *member_id)](#commandarmor_equipedid-member_id)
*    [Command.armor_icon(id)](#commandarmor_iconid)
*    [Command.armor_luck(id)](#commandarmor_luckid)
*    [Command.armor_magic_attack_power(id)](#commandarmor_magic_attack_powerid)
*    [Command.armor_magic_defense_power(id)](#commandarmor_magic_defense_powerid)
*    [Command.armor_max_hit_points(id)](#commandarmor_max_hit_pointsid)
*    [Command.armor_max_magic_points(id)](#commandarmor_max_magic_pointsid)
*    [Command.armor_name(id)](#commandarmor_nameid)
*    [Command.armor_note(id)](#commandarmor_noteid)
*    [Command.armor_price(id)](#commandarmor_priceid)
*    [Command.armor_type(id)](#commandarmor_typeid)
*    [Command.armors_possessed](#commandarmors_possessed)
*    [Command.asin(x)](#commandasinx)
*    [Command.asinh(x)](#commandasinhx)
*    [Command.atan(x)](#commandatanx)
*    [Command.atan2(x, y)](#commandatan2x-y)
*    [Command.atanh(x)](#commandatanhx)
*    [Command.battle_count](#commandbattle_count)
*    [Command.between(x1, y1, x2, y2)](#commandbetweenx1-y1-x2-y2)
*    [Command.bgm_fade(wait, *frame)](#commandbgm_fadewait-frame)
*    [Command.bgm_pitch(pitch)](#commandbgm_pitchpitch)
*    [Command.bgm_play(name, *volume, *pitch)](#commandbgm_playname-volume-pitch)
*    [Command.bgm_stop](#commandbgm_stop)
*    [Command.bgm_volume(volume)](#commandbgm_volumevolume)
*    [Command.bgs_fade(wait, *frame)](#commandbgs_fadewait-frame)
*    [Command.bgs_pitch(pitch)](#commandbgs_pitchpitch)
*    [Command.bgs_play(name, *volume, *pitch)](#commandbgs_playname-volume-pitch)
*    [Command.bgs_stop](#commandbgs_stop)
*    [Command.bgs_volume(volume)](#commandbgs_volumevolume)
*    [Command.call_common_event(id)](#commandcall_common_eventid)
*    [Command.call_load_screen](#commandcall_load_screen)
*    [Command.call_title_screen](#commandcall_title_screen)
*    [Command.camera_change_focus(event_id)](#commandcamera_change_focusevent_id)
*    [Command.camera_lock](#commandcamera_lock)
*    [Command.camera_motion_blur(attenuation, *duration, *wait_flag, *ease)](#commandcamera_motion_blurattenuation-duration-wait_flag-ease)
*    [Command.camera_move_on(x, y)](#commandcamera_move_onx-y)
*    [Command.camera_scroll(direction, distance, speed)](#commandcamera_scrolldirection-distance-speed)
*    [Command.camera_scroll_on(x, y, speed)](#commandcamera_scroll_onx-y-speed)
*    [Command.camera_unlock](#commandcamera_unlock)
*    [Command.camera_zoom(zoom, *duration, *wait_flag, *ease)](#commandcamera_zoomzoom-duration-wait_flag-ease)
*    [Command.caps_lock?](#commandcaps_lock)
*    [Command.click_time(key)](#commandclick_timekey)
*    [Command.clipboard_get_text](#commandclipboard_get_text)
*    [Command.clipboard_push_command(cmd)](#commandclipboard_push_commandcmd)
*    [Command.clipboard_push_text(text)](#commandclipboard_push_texttext)
*    [Command.close_window(id)](#commandclose_windowid)
*    [Command.color(red, green, blue, *alpha)](#commandcolorred-green-blue-alpha)
*    [Command.cos(x)](#commandcosx)
*    [Command.cosh(x)](#commandcoshx)
*    [Command.create_circle_area(x, y, rayon)](#commandcreate_circle_areax-y-rayon)
*    [Command.create_commands_window(id, x, y, w, hash, *h)](#commandcreate_commands_windowid-x-y-w-hash-h)
*    [Command.create_ellipse_area(x, y, width, height)](#commandcreate_ellipse_areax-y-width-height)
*    [Command.create_horizontal_commands_window(id, x, y, hash, row)](#commandcreate_horizontal_commands_windowid-x-y-hash-row)
*    [Command.create_polygon_area(points)](#commandcreate_polygon_areapoints)
*    [Command.create_rect_area(x, y, width, height)](#commandcreate_rect_areax-y-width-height)
*    [Command.create_selectable_window(id, x, y, width, height, hash)](#commandcreate_selectable_windowid-x-y-width-height-hash)
*    [Command.create_text_window(id, content, x, y, *w, *h)](#commandcreate_text_windowid-content-x-y-w-h)
*    [Command.ctrl?(key)](#commandctrlkey)
*    [Command.currency](#commandcurrency)
*    [Command.current_enemies](#commandcurrent_enemies)
*    [Command.current_troop](#commandcurrent_troop)
*    [Command.cursor_system(flag)](#commandcursor_systemflag)
*    [Command.damage_floor?(x, y)](#commanddamage_floorx-y)
*    [Command.delete_tiles(layer, id)](#commanddelete_tileslayer-id)
*    [Command.enemy_agility(position)](#commandenemy_agilityposition)
*    [Command.enemy_attack(position)](#commandenemy_attackposition)
*    [Command.enemy_counter_attack_rate(position)](#commandenemy_counter_attack_rateposition)
*    [Command.enemy_critical_evasion_rate(position)](#commandenemy_critical_evasion_rateposition)
*    [Command.enemy_critical_rate(position)](#commandenemy_critical_rateposition)
*    [Command.enemy_defense(position)](#commandenemy_defenseposition)
*    [Command.enemy_die?(position)](#commandenemy_dieposition)
*    [Command.enemy_evasion_rate(position)](#commandenemy_evasion_rateposition)
*    [Command.enemy_experience_rate(position)](#commandenemy_experience_rateposition)
*    [Command.enemy_floor_damage_rate(position)](#commandenemy_floor_damage_rateposition)
*    [Command.enemy_guard_effect_rate(position)](#commandenemy_guard_effect_rateposition)
*    [Command.enemy_hidden?(position)](#commandenemy_hiddenposition)
*    [Command.enemy_hit_rate(position)](#commandenemy_hit_rateposition)
*    [Command.enemy_hp(position)](#commandenemy_hpposition)
*    [Command.enemy_hp_regeneration_rate(position)](#commandenemy_hp_regeneration_rateposition)
*    [Command.enemy_luck(position)](#commandenemy_luckposition)
*    [Command.enemy_magic_attack(position)](#commandenemy_magic_attackposition)
*    [Command.enemy_magic_defense(position)](#commandenemy_magic_defenseposition)
*    [Command.enemy_magical_damage_rate(position)](#commandenemy_magical_damage_rateposition)
*    [Command.enemy_magical_evasion_rate(position)](#commandenemy_magical_evasion_rateposition)
*    [Command.enemy_magical_reflection_rate(position)](#commandenemy_magical_reflection_rateposition)
*    [Command.enemy_max_hp(position)](#commandenemy_max_hpposition)
*    [Command.enemy_max_mp(position)](#commandenemy_max_mpposition)
*    [Command.enemy_mp(position)](#commandenemy_mpposition)
*    [Command.enemy_mp_cost_rate(position)](#commandenemy_mp_cost_rateposition)
*    [Command.enemy_mp_regeneration_rate(position)](#commandenemy_mp_regeneration_rateposition)
*    [Command.enemy_pharmacology(position)](#commandenemy_pharmacologyposition)
*    [Command.enemy_physical_damage_rate(position)](#commandenemy_physical_damage_rateposition)
*    [Command.enemy_recovery_effect_rate(position)](#commandenemy_recovery_effect_rateposition)
*    [Command.enemy_target_rate(position)](#commandenemy_target_rateposition)
*    [Command.enemy_tp(position)](#commandenemy_tpposition)
*    [Command.enemy_tp_charge_rate(position)](#commandenemy_tp_charge_rateposition)
*    [Command.enemy_tp_regeneration_rate(position)](#commandenemy_tp_regeneration_rateposition)
*    [Command.event_brutal_stop_trail(ids)](#commandevent_brutal_stop_trailids)
*    [Command.event_direction(id, *value)](#commandevent_directionid-value)
*    [Command.event_erase(id)](#commandevent_eraseid)
*    [Command.event_erased?(id)](#commandevent_erasedid)
*    [Command.event_flash(id, color, duration)](#commandevent_flashid-color-duration)
*    [Command.event_in_screen?(id)](#commandevent_in_screenid)
*    [Command.event_look_at?(idA, idB, scope, *metric)](#commandevent_look_atida-idb-scope-metric)
*    [Command.event_move_away_from_event(id, target)](#commandevent_move_away_from_eventid-target)
*    [Command.event_move_away_from_player(id)](#commandevent_move_away_from_playerid)
*    [Command.event_move_away_from_position(id, x, y)](#commandevent_move_away_from_positionid-x-y)
*    [Command.event_move_backward(id)](#commandevent_move_backwardid)
*    [Command.event_move_diagonal(id, horizontal, vertical)](#commandevent_move_diagonalid-horizontal-vertical)
*    [Command.event_move_down(id, *turn_ok)](#commandevent_move_downid-turn_ok)
*    [Command.event_move_forward(id)](#commandevent_move_forwardid)
*    [Command.event_move_frequency(ids, f)](#commandevent_move_frequencyids-f)
*    [Command.event_move_left(id, *turn_ok)](#commandevent_move_leftid-turn_ok)
*    [Command.event_move_lower_left(id)](#commandevent_move_lower_leftid)
*    [Command.event_move_lower_right(id)](#commandevent_move_lower_rightid)
*    [Command.event_move_random(id)](#commandevent_move_randomid)
*    [Command.event_move_right(id, *turn_ok)](#commandevent_move_rightid-turn_ok)
*    [Command.event_move_speed(ids, v)](#commandevent_move_speedids-v)
*    [Command.event_move_speed_frequency(ids, v, f)](#commandevent_move_speed_frequencyids-v-f)
*    [Command.event_move_straight(id, value, *turn_ok)](#commandevent_move_straightid-value-turn_ok)
*    [Command.event_move_toward_event(id, target)](#commandevent_move_toward_eventid-target)
*    [Command.event_move_toward_player(id)](#commandevent_move_toward_playerid)
*    [Command.event_move_toward_position(id, x, y)](#commandevent_move_toward_positionid-x-y)
*    [Command.event_move_up(id, *turn_ok)](#commandevent_move_upid-turn_ok)
*    [Command.event_move_upper_left(id)](#commandevent_move_upper_leftid)
*    [Command.event_move_upper_right(id)](#commandevent_move_upper_rightid)
*    [Command.event_move_with(id, code)](#commandevent_move_withid-code)
*    [Command.event_moving?(id)](#commandevent_movingid)
*    [Command.event_name(id)](#commandevent_nameid)
*    [Command.event_opacity(ids, *value)](#commandevent_opacityids-value)
*    [Command.event_opaque(id)](#commandevent_opaqueid)
*    [Command.event_ox(id, *value)](#commandevent_oxid-value)
*    [Command.event_oy(id, *value)](#commandevent_oyid-value)
*    [Command.event_path_length(id, x, y, *wait_flag, *no_through)](#commandevent_path_lengthid-x-y-wait_flag-no_through)
*    [Command.event_pixel_x(id)](#commandevent_pixel_xid)
*    [Command.event_pixel_y(id)](#commandevent_pixel_yid)
*    [Command.event_priority(ids, priority)](#commandevent_priorityids-priority)
*    [Command.event_restore_origin(id)](#commandevent_restore_originid)
*    [Command.event_screen_x(id)](#commandevent_screen_xid)
*    [Command.event_screen_y(id)](#commandevent_screen_yid)
*    [Command.event_stop_trail(ids)](#commandevent_stop_trailids)
*    [Command.event_through(id, *flag)](#commandevent_throughid-flag)
*    [Command.event_through?(id)](#commandevent_throughid)
*    [Command.event_trail(ids, len, *mode)](#commandevent_trailids-len-mode)
*    [Command.event_transfert(id, new_x, new_y)](#commandevent_transfertid-new_x-new_y)
*    [Command.event_transparent(id)](#commandevent_transparentid)
*    [Command.event_transparent?(id)](#commandevent_transparentid)
*    [Command.event_trigger(ids, trigger)](#commandevent_triggerids-trigger)
*    [Command.event_turn_180(id)](#commandevent_turn_180id)
*    [Command.event_turn_90_left(id)](#commandevent_turn_90_leftid)
*    [Command.event_turn_90_right(id)](#commandevent_turn_90_rightid)
*    [Command.event_turn_90_right_or_left(id)](#commandevent_turn_90_right_or_leftid)
*    [Command.event_turn_away_from_event(id, target)](#commandevent_turn_away_from_eventid-target)
*    [Command.event_turn_away_from_player(id)](#commandevent_turn_away_from_playerid)
*    [Command.event_turn_away_from_position(id, x, y)](#commandevent_turn_away_from_positionid-x-y)
*    [Command.event_turn_down(id)](#commandevent_turn_downid)
*    [Command.event_turn_left(id)](#commandevent_turn_leftid)
*    [Command.event_turn_random(id)](#commandevent_turn_randomid)
*    [Command.event_turn_right(id)](#commandevent_turn_rightid)
*    [Command.event_turn_toward_event(id, target)](#commandevent_turn_toward_eventid-target)
*    [Command.event_turn_toward_player(id)](#commandevent_turn_toward_playerid)
*    [Command.event_turn_toward_position(id, x, y)](#commandevent_turn_toward_positionid-x-y)
*    [Command.event_turn_up(id)](#commandevent_turn_upid)
*    [Command.event_x(id)](#commandevent_xid)
*    [Command.event_y(id)](#commandevent_yid)
*    [Command.event_zoom(id, value)](#commandevent_zoomid-value)
*    [Command.event_zoom_x(id, *value)](#commandevent_zoom_xid-value)
*    [Command.event_zoom_y(id, *value)](#commandevent_zoom_yid-value)
*    [Command.events_buzz(e, *duration)](#commandevents_buzze-duration)
*    [Command.events_buzzer_properties(e, amplitude, length)](#commandevents_buzzer_propertiese-amplitude-length)
*    [Command.events_collide?(idA, idB)](#commandevents_collideida-idb)
*    [Command.fadein(*time)](#commandfadeintime)
*    [Command.fadeout(*time)](#commandfadeouttime)
*    [Command.flash_rect(x, y, width, height, color)](#commandflash_rectx-y-width-height-color)
*    [Command.flash_square(x, y, color)](#commandflash_squarex-y-color)
*    [Command.followers_buzz(ids, *duration)](#commandfollowers_buzzids-duration)
*    [Command.followers_buzzer_properties(*ids, amplitude, length)](#commandfollowers_buzzer_propertiesids-amplitude-length)
*    [Command.fresh_event_id(*erased)](#commandfresh_event_iderased)
*    [Command.gain_gold(amount)](#commandgain_goldamount)
*    [Command.game_title](#commandgame_title)
*    [Command.game_window_rect](#commandgame_window_rect)
*    [Command.get(array, index)](#commandgetarray-index)
*    [Command.get_random_square(*region_id)](#commandget_random_squareregion_id)
*    [Command.get_squares_by_region(region_id)](#commandget_squares_by_regionregion_id)
*    [Command.get_squares_by_terrain(terrain_tag)](#commandget_squares_by_terrainterrain_tag)
*    [Command.get_squares_by_tile(layer, tile_id)](#commandget_squares_by_tilelayer-tile_id)
*    [Command.get_tileset_id](#commandget_tileset_id)
*    [Command.give_armor(id, amount, *include_equipement)](#commandgive_armorid-amount-include_equipement)
*    [Command.give_item(id, amount)](#commandgive_itemid-amount)
*    [Command.give_weapon(id, amount, *include_equipement)](#commandgive_weaponid-amount-include_equipement)
*    [Command.gold](#commandgold)
*    [Command.ground?(x, y)](#commandgroundx-y)
*    [Command.has_armor?(id, *include_equipement)](#commandhas_armorid-include_equipement)
*    [Command.has_item?(id)](#commandhas_itemid)
*    [Command.has_prefix?(string, prefix)](#commandhas_prefixstring-prefix)
*    [Command.has_substring?(string, substring)](#commandhas_substringstring-substring)
*    [Command.has_suffix?(string, suffix)](#commandhas_suffixstring-suffix)
*    [Command.has_weapon?(id, *include_equipement)](#commandhas_weaponid-include_equipement)
*    [Command.hypot(x, y)](#commandhypotx-y)
*    [Command.id_at(x, y)](#commandid_atx-y)
*    [Command.import_label(index, idlabel)](#commandimport_labelindex-idlabel)
*    [Command.import_switch(index, idswitch)](#commandimport_switchindex-idswitch)
*    [Command.import_variable(index, idvar)](#commandimport_variableindex-idvar)
*    [Command.in_area?(area, x, y)](#commandin_areaarea-x-y)
*    [Command.include_page(map_id, event_id, page_id, *runnable, *context)](#commandinclude_pagemap_id-event_id-page_id-runnable-context)
*    [Command.invoke_event(map_id, event_id, new_id, *x, *y)](#commandinvoke_eventmap_id-event_id-new_id-x-y)
*    [Command.is_key_item?(id)](#commandis_key_itemid)
*    [Command.item_always_usable?(id)](#commanditem_always_usableid)
*    [Command.item_battle_usable?(id)](#commanditem_battle_usableid)
*    [Command.item_certain?(id)](#commanditem_certainid)
*    [Command.item_consumable?(id)](#commanditem_consumableid)
*    [Command.item_count(id)](#commanditem_countid)
*    [Command.item_description(id)](#commanditem_descriptionid)
*    [Command.item_for_all?(id)](#commanditem_for_allid)
*    [Command.item_for_all_allies?(id)](#commanditem_for_all_alliesid)
*    [Command.item_for_all_dead_allies?(id)](#commanditem_for_all_dead_alliesid)
*    [Command.item_for_all_enemies?(id)](#commanditem_for_all_enemiesid)
*    [Command.item_for_caller?(id)](#commanditem_for_callerid)
*    [Command.item_for_dead_friend?(id)](#commanditem_for_dead_friendid)
*    [Command.item_for_four_random_enemies?(id)](#commanditem_for_four_random_enemiesid)
*    [Command.item_for_friend?(id)](#commanditem_for_friendid)
*    [Command.item_for_one?(id)](#commanditem_for_oneid)
*    [Command.item_for_one_ally?(id)](#commanditem_for_one_allyid)
*    [Command.item_for_one_dead_ally?(id)](#commanditem_for_one_dead_allyid)
*    [Command.item_for_one_enemy?(id)](#commanditem_for_one_enemyid)
*    [Command.item_for_one_random_enemy?(id)](#commanditem_for_one_random_enemyid)
*    [Command.item_for_opponent?(id)](#commanditem_for_opponentid)
*    [Command.item_for_random?(id)](#commanditem_for_randomid)
*    [Command.item_for_three_random_enemies?(id)](#commanditem_for_three_random_enemiesid)
*    [Command.item_for_two_random_enemies?(id)](#commanditem_for_two_random_enemiesid)
*    [Command.item_has_no_scope?(id)](#commanditem_has_no_scopeid)
*    [Command.item_icon(id)](#commanditem_iconid)
*    [Command.item_magical?(id)](#commanditem_magicalid)
*    [Command.item_menu_usable?(id)](#commanditem_menu_usableid)
*    [Command.item_name(id)](#commanditem_nameid)
*    [Command.item_nb_hits(id)](#commanditem_nb_hitsid)
*    [Command.item_need_selection?(id)](#commanditem_need_selectionid)
*    [Command.item_never_usable?(id)](#commanditem_never_usableid)
*    [Command.item_note(id)](#commanditem_noteid)
*    [Command.item_number_of_targets(id)](#commanditem_number_of_targetsid)
*    [Command.item_occasion(id)](#commanditem_occasionid)
*    [Command.item_physical?(id)](#commanditem_physicalid)
*    [Command.item_price(id)](#commanditem_priceid)
*    [Command.item_scope(id)](#commanditem_scopeid)
*    [Command.item_speed(id)](#commanditem_speedid)
*    [Command.item_success_rate(id)](#commanditem_success_rateid)
*    [Command.item_tp_gain(id)](#commanditem_tp_gainid)
*    [Command.items_possessed](#commanditems_possessed)
*    [Command.jump_to(id, x, y, *wait_flag)](#commandjump_toid-x-y-wait_flag)
*    [Command.key_current(method)](#commandkey_currentmethod)
*    [Command.key_current_rgss(method)](#commandkey_current_rgssmethod)
*    [Command.key_press?(key)](#commandkey_presskey)
*    [Command.key_release?(key)](#commandkey_releasekey)
*    [Command.key_repeat?(key)](#commandkey_repeatkey)
*    [Command.key_time(key)](#commandkey_timekey)
*    [Command.key_trigger?(key)](#commandkey_triggerkey)
*    [Command.keyboard_all?(method, keys)](#commandkeyboard_allmethod-keys)
*    [Command.keyboard_any?(method, keys)](#commandkeyboard_anymethod-keys)
*    [Command.keyboard_current_char](#commandkeyboard_current_char)
*    [Command.keyboard_current_digit](#commandkeyboard_current_digit)
*    [Command.last_clicked_event](#commandlast_clicked_event)
*    [Command.last_hovered_event](#commandlast_hovered_event)
*    [Command.last_pressed_event](#commandlast_pressed_event)
*    [Command.last_released_event](#commandlast_released_event)
*    [Command.last_repeated_event](#commandlast_repeated_event)
*    [Command.last_triggered_event](#commandlast_triggered_event)
*    [Command.length(array)](#commandlengtharray)
*    [Command.load_game(index, *time)](#commandload_gameindex-time)
*    [Command.lose_gold(amount)](#commandlose_goldamount)
*    [Command.mantissa(x)](#commandmantissax)
*    [Command.map_height](#commandmap_height)
*    [Command.map_id](#commandmap_id)
*    [Command.map_name](#commandmap_name)
*    [Command.map_width](#commandmap_width)
*    [Command.max(a, b)](#commandmaxa-b)
*    [Command.max_event_id](#commandmax_event_id)
*    [Command.me_fade(wait, *frame)](#commandme_fadewait-frame)
*    [Command.me_play(name, *volume, *pitch)](#commandme_playname-volume-pitch)
*    [Command.me_stop](#commandme_stop)
*    [Command.message(value, *face_name, *face_index, *position, *background)](#commandmessagevalue-face_name-face_index-position-background)
*    [Command.message_height(n)](#commandmessage_heightn)
*    [Command.min(a, b)](#commandmina-b)
*    [Command.monster_agility(id)](#commandmonster_agilityid)
*    [Command.monster_attack_power(id)](#commandmonster_attack_powerid)
*    [Command.monster_battler_height(position)](#commandmonster_battler_heightposition)
*    [Command.monster_battler_hue(id)](#commandmonster_battler_hueid)
*    [Command.monster_battler_name(id)](#commandmonster_battler_nameid)
*    [Command.monster_battler_width(position)](#commandmonster_battler_widthposition)
*    [Command.monster_defense_power(id)](#commandmonster_defense_powerid)
*    [Command.monster_description(id)](#commandmonster_descriptionid)
*    [Command.monster_give_exp(id)](#commandmonster_give_expid)
*    [Command.monster_give_gold(id)](#commandmonster_give_goldid)
*    [Command.monster_icon(id)](#commandmonster_iconid)
*    [Command.monster_luck(id)](#commandmonster_luckid)
*    [Command.monster_magic_attack_power(id)](#commandmonster_magic_attack_powerid)
*    [Command.monster_magic_defense_power(id)](#commandmonster_magic_defense_powerid)
*    [Command.monster_max_hp(id)](#commandmonster_max_hpid)
*    [Command.monster_max_mp(id)](#commandmonster_max_mpid)
*    [Command.monster_name(id)](#commandmonster_nameid)
*    [Command.monster_note(id)](#commandmonster_noteid)
*    [Command.mouse_all?(method, keys)](#commandmouse_allmethod-keys)
*    [Command.mouse_any?(method, keys)](#commandmouse_anymethod-keys)
*    [Command.mouse_click?](#commandmouse_click)
*    [Command.mouse_click_area?(area)](#commandmouse_click_areaarea)
*    [Command.mouse_click_event?(events, *precise)](#commandmouse_click_eventevents-precise)
*    [Command.mouse_click_player?](#commandmouse_click_player)
*    [Command.mouse_click_square_area?(area, *key)](#commandmouse_click_square_areaarea-key)
*    [Command.mouse_current_key(method)](#commandmouse_current_keymethod)
*    [Command.mouse_dragging?](#commandmouse_dragging)
*    [Command.mouse_hover_area?(area)](#commandmouse_hover_areaarea)
*    [Command.mouse_hover_event?(events, *precise)](#commandmouse_hover_eventevents-precise)
*    [Command.mouse_hover_player?](#commandmouse_hover_player)
*    [Command.mouse_hover_square_area?(area)](#commandmouse_hover_square_areaarea)
*    [Command.mouse_in?(rectangle)](#commandmouse_inrectangle)
*    [Command.mouse_last_rect](#commandmouse_last_rect)
*    [Command.mouse_point](#commandmouse_point)
*    [Command.mouse_press?(key)](#commandmouse_presskey)
*    [Command.mouse_press_area?(area, *key)](#commandmouse_press_areaarea-key)
*    [Command.mouse_press_event?(events, *key, *precise)](#commandmouse_press_eventevents-key-precise)
*    [Command.mouse_press_player?(*key)](#commandmouse_press_playerkey)
*    [Command.mouse_press_square_area?(area, *key)](#commandmouse_press_square_areaarea-key)
*    [Command.mouse_rect](#commandmouse_rect)
*    [Command.mouse_release?(key)](#commandmouse_releasekey)
*    [Command.mouse_release_area?(area, *key)](#commandmouse_release_areaarea-key)
*    [Command.mouse_release_event?(events, *key, *precise)](#commandmouse_release_eventevents-key-precise)
*    [Command.mouse_release_player?(*key)](#commandmouse_release_playerkey)
*    [Command.mouse_release_square_area?(area, *key)](#commandmouse_release_square_areaarea-key)
*    [Command.mouse_repeat?(key)](#commandmouse_repeatkey)
*    [Command.mouse_repeat_area?(area, *key)](#commandmouse_repeat_areaarea-key)
*    [Command.mouse_repeat_event?(events, *key, *precise)](#commandmouse_repeat_eventevents-key-precise)
*    [Command.mouse_repeat_player?(*key)](#commandmouse_repeat_playerkey)
*    [Command.mouse_repeat_square_area?(area, *key)](#commandmouse_repeat_square_areaarea-key)
*    [Command.mouse_square_x](#commandmouse_square_x)
*    [Command.mouse_square_y](#commandmouse_square_y)
*    [Command.mouse_trigger?(key)](#commandmouse_triggerkey)
*    [Command.mouse_trigger_area?(area, *key)](#commandmouse_trigger_areaarea-key)
*    [Command.mouse_trigger_event?(events, *key, *precise)](#commandmouse_trigger_eventevents-key-precise)
*    [Command.mouse_trigger_player?(*key)](#commandmouse_trigger_playerkey)
*    [Command.mouse_trigger_square_area?(area, *key)](#commandmouse_trigger_square_areaarea-key)
*    [Command.mouse_x](#commandmouse_x)
*    [Command.mouse_y](#commandmouse_y)
*    [Command.move_to(id, x, y, *wait_flag, *no_throug)](#commandmove_toid-x-y-wait_flag-no_throug)
*    [Command.num_lock?](#commandnum_lock)
*    [Command.open_window(id)](#commandopen_windowid)
*    [Command.pad360_plugged?(*id)](#commandpad360_pluggedid)
*    [Command.pad360_stop_vibration(*id)](#commandpad360_stop_vibrationid)
*    [Command.pad360_stop_vibration_left(*id)](#commandpad360_stop_vibration_leftid)
*    [Command.pad360_stop_vibration_right(*id)](#commandpad360_stop_vibration_rightid)
*    [Command.pad360_vibrate(*id, *left, *right)](#commandpad360_vibrateid-left-right)
*    [Command.pad360_vibrate_left(*id, *s)](#commandpad360_vibrate_leftid-s)
*    [Command.pad360_vibrate_right(*id, *s)](#commandpad360_vibrate_rightid-s)
*    [Command.page_runnable?(map_id, event_id, page_id, *context)](#commandpage_runnablemap_id-event_id-page_id-context)
*    [Command.parallax_autoscroll(id, speed_x, *duration, *wait_flag)](#commandparallax_autoscrollid-speed_x-duration-wait_flag)
*    [Command.parallax_autoscroll_x(id, speed, *duration, *wait_flag, *ease)](#commandparallax_autoscroll_xid-speed-duration-wait_flag-ease)
*    [Command.parallax_autoscroll_y(id, speed, *duration, *wait_flag, *ease)](#commandparallax_autoscroll_yid-speed-duration-wait_flag-ease)
*    [Command.parallax_blend(id, blend_type)](#commandparallax_blendid-blend_type)
*    [Command.parallax_erase(id)](#commandparallax_eraseid)
*    [Command.parallax_opacity(id, opacity, *duration, *wait_flag, *ease)](#commandparallax_opacityid-opacity-duration-wait_flag-ease)
*    [Command.parallax_scroll(id, x, y)](#commandparallax_scrollid-x-y)
*    [Command.parallax_scroll_x(id, speed)](#commandparallax_scroll_xid-speed)
*    [Command.parallax_scroll_y(id, speed)](#commandparallax_scroll_yid-speed)
*    [Command.parallax_show(id, name, *z, *opacity, *auto_x, *auto_y, *scroll_x, *scroll_y, *blend_type, *zoom_x, *zoom_y, *tone)](#commandparallax_showid-name-z-opacity-auto_x-auto_y-scroll_x-scroll_y-blend_type-zoom_x-zoom_y-tone)
*    [Command.parallax_tone(id, tone, *duration, *wait_flag, *ease)](#commandparallax_toneid-tone-duration-wait_flag-ease)
*    [Command.parallax_transform(id, duration, *wait_flag, *zoom_x, *zoom_y, *opacity, *tone, *ease)](#commandparallax_transformid-duration-wait_flag-zoom_x-zoom_y-opacity-tone-ease)
*    [Command.parallax_z(id, z)](#commandparallax_zid-z)
*    [Command.parallax_zoom(id, zoom, *duration, *wait_flag, *ease)](#commandparallax_zoomid-zoom-duration-wait_flag-ease)
*    [Command.parallax_zoom_x(id, zoom, *duration, *wait_flag, *ease)](#commandparallax_zoom_xid-zoom-duration-wait_flag-ease)
*    [Command.parallax_zoom_y(id, zoom, *duration, *wait_flag, *ease)](#commandparallax_zoom_yid-zoom-duration-wait_flag-ease)
*    [Command.parallaxes_clear](#commandparallaxes_clear)
*    [Command.percent(value, max)](#commandpercentvalue-max)
*    [Command.pi](#commandpi)
*    [Command.pick_random(*elts)](#commandpick_randomelts)
*    [Command.picture_angle(id, angle, *duration, *wait_flag, *ease)](#commandpicture_angleid-angle-duration-wait_flag-ease)
*    [Command.picture_blend(Selector, mode)](#commandpicture_blendselector-mode)
*    [Command.picture_dimension(id, w, h, *duration, *wait_flag, *ease)](#commandpicture_dimensionid-w-h-duration-wait_flag-ease)
*    [Command.picture_erase(Selector)](#commandpicture_eraseselector)
*    [Command.picture_erased?(id)](#commandpicture_erasedid)
*    [Command.picture_flip(Selector)](#commandpicture_flipselector)
*    [Command.picture_height(id, *v, *duration, *wait_flag, *ease)](#commandpicture_heightid-v-duration-wait_flag-ease)
*    [Command.picture_mouse_click?(id, *precise)](#commandpicture_mouse_clickid-precise)
*    [Command.picture_mouse_hover?(id, *precise)](#commandpicture_mouse_hoverid-precise)
*    [Command.picture_mouse_press?(id, *key, *precise)](#commandpicture_mouse_pressid-key-precise)
*    [Command.picture_mouse_release?(id, *key, *precise)](#commandpicture_mouse_releaseid-key-precise)
*    [Command.picture_mouse_repeat?(id, *key, *precise)](#commandpicture_mouse_repeatid-key-precise)
*    [Command.picture_mouse_trigger?(id, *key, *precise)](#commandpicture_mouse_triggerid-key-precise)
*    [Command.picture_move(Selector, x, y, zoom_x, zoom_y, duration, *wait_flag, *opacity, *blend_type, *origin, *ease)](#commandpicture_moveselector-x-y-zoom_x-zoom_y-duration-wait_flag-opacity-blend_type-origin-ease)
*    [Command.picture_move?(id)](#commandpicture_moveid)
*    [Command.picture_name(id, *name)](#commandpicture_nameid-name)
*    [Command.picture_opacity(Selector, opacity, *duration, *wait_flag, *ease)](#commandpicture_opacityselector-opacity-duration-wait_flag-ease)
*    [Command.picture_origin(id, origin)](#commandpicture_originid-origin)
*    [Command.picture_pin(Selector, *x, *y)](#commandpicture_pinselector-x-y)
*    [Command.picture_position(Selector, x, y, *duration, *wait_flag, *ease)](#commandpicture_positionselector-x-y-duration-wait_flag-ease)
*    [Command.picture_rotate(Selector, speed)](#commandpicture_rotateselector-speed)
*    [Command.picture_scroll(Selector, vitesse)](#commandpicture_scrollselector-vitesse)
*    [Command.picture_scroll_x(Selector, *vitesse)](#commandpicture_scroll_xselector-vitesse)
*    [Command.picture_scroll_y(Selector, *vitesse)](#commandpicture_scroll_yselector-vitesse)
*    [Command.picture_shake(Selector, power, speed, duration)](#commandpicture_shakeselector-power-speed-duration)
*    [Command.picture_show(id, name, *x, *y, *origin, *zoom_x, *zoom_y, *opacity, *blend_type)](#commandpicture_showid-name-x-y-origin-zoom_x-zoom_y-opacity-blend_type)
*    [Command.picture_show_enemy(pic_id, id, position)](#commandpicture_show_enemypic_id-id-position)
*    [Command.picture_show_screenshot(id, *x, *y, *origin, *zoom_x, *zoom_y, *opacity, *blend_type)](#commandpicture_show_screenshotid-x-y-origin-zoom_x-zoom_y-opacity-blend_type)
*    [Command.picture_showed?(id)](#commandpicture_showedid)
*    [Command.picture_tone(id, tone, *duration, *wait_flag, *ease)](#commandpicture_toneid-tone-duration-wait_flag-ease)
*    [Command.picture_unpin(Selector)](#commandpicture_unpinselector)
*    [Command.picture_wave(Selector, amplitude, vitesse)](#commandpicture_waveselector-amplitude-vitesse)
*    [Command.picture_width(id, *v, *duration, *wait_flag, *ease)](#commandpicture_widthid-v-duration-wait_flag-ease)
*    [Command.picture_x(id, x, *duration, *wait_flag, *ease)](#commandpicture_xid-x-duration-wait_flag-ease)
*    [Command.picture_y(id, y, *duration, *wait_flag, *ease)](#commandpicture_yid-y-duration-wait_flag-ease)
*    [Command.picture_zoom(Selector, zoom_x, *zoom_y, *duration, *wait_flag, *ease)](#commandpicture_zoomselector-zoom_x-zoom_y-duration-wait_flag-ease)
*    [Command.picture_zoom_x(id, zoom, *duration, *wait_flag, *ease)](#commandpicture_zoom_xid-zoom-duration-wait_flag-ease)
*    [Command.picture_zoom_y(id, zoom, *duration, *wait_flag, *ease)](#commandpicture_zoom_yid-zoom-duration-wait_flag-ease)
*    [Command.pictures_clear](#commandpictures_clear)
*    [Command.pictures_collide?(id, id2)](#commandpictures_collideid-id2)
*    [Command.pictures_perfect_collide?(idA, idB)](#commandpictures_perfect_collideida-idb)
*    [Command.pixel_in_event?(id, x, y, *precise)](#commandpixel_in_eventid-x-y-precise)
*    [Command.pixel_in_picture?(id, x, y, *precise)](#commandpixel_in_pictureid-x-y-precise)
*    [Command.pixel_in_player?(x, y, *precise)](#commandpixel_in_playerx-y-precise)
*    [Command.pixels_between(idA, idB)](#commandpixels_betweenida-idb)
*    [Command.play_time](#commandplay_time)
*    [Command.player_brutal_stop_trail](#commandplayer_brutal_stop_trail)
*    [Command.player_direction(*value)](#commandplayer_directionvalue)
*    [Command.player_flash(color, duration)](#commandplayer_flashcolor-duration)
*    [Command.player_in_screen?](#commandplayer_in_screen)
*    [Command.player_move_away_from_event(id)](#commandplayer_move_away_from_eventid)
*    [Command.player_move_away_from_position(x, y)](#commandplayer_move_away_from_positionx-y)
*    [Command.player_move_backward](#commandplayer_move_backward)
*    [Command.player_move_diagonal(horizontal, vertical)](#commandplayer_move_diagonalhorizontal-vertical)
*    [Command.player_move_down(*turn_ok)](#commandplayer_move_downturn_ok)
*    [Command.player_move_forward](#commandplayer_move_forward)
*    [Command.player_move_frequency(f)](#commandplayer_move_frequencyf)
*    [Command.player_move_left(*turn_ok)](#commandplayer_move_leftturn_ok)
*    [Command.player_move_lower_left](#commandplayer_move_lower_left)
*    [Command.player_move_lower_right](#commandplayer_move_lower_right)
*    [Command.player_move_random](#commandplayer_move_random)
*    [Command.player_move_right(*turn_ok)](#commandplayer_move_rightturn_ok)
*    [Command.player_move_speed(v)](#commandplayer_move_speedv)
*    [Command.player_move_speed_frequency(v, f)](#commandplayer_move_speed_frequencyv-f)
*    [Command.player_move_straight(value, *turn_ok)](#commandplayer_move_straightvalue-turn_ok)
*    [Command.player_move_toward_event(id)](#commandplayer_move_toward_eventid)
*    [Command.player_move_toward_position(x, y)](#commandplayer_move_toward_positionx-y)
*    [Command.player_move_up(*turn_ok)](#commandplayer_move_upturn_ok)
*    [Command.player_move_upper_left](#commandplayer_move_upper_left)
*    [Command.player_move_upper_right](#commandplayer_move_upper_right)
*    [Command.player_move_with(code)](#commandplayer_move_withcode)
*    [Command.player_moving?](#commandplayer_moving)
*    [Command.player_opacity(*value)](#commandplayer_opacityvalue)
*    [Command.player_opaque](#commandplayer_opaque)
*    [Command.player_ox(*value)](#commandplayer_oxvalue)
*    [Command.player_oy(*value)](#commandplayer_oyvalue)
*    [Command.player_path_length(x, y, *wait_flag, *no_through)](#commandplayer_path_lengthx-y-wait_flag-no_through)
*    [Command.player_pixel_x](#commandplayer_pixel_x)
*    [Command.player_pixel_y](#commandplayer_pixel_y)
*    [Command.player_restore_origin](#commandplayer_restore_origin)
*    [Command.player_screen_x](#commandplayer_screen_x)
*    [Command.player_screen_y](#commandplayer_screen_y)
*    [Command.player_stop_trail](#commandplayer_stop_trail)
*    [Command.player_teleport(map_id, x, y, direction, *fade_type)](#commandplayer_teleportmap_id-x-y-direction-fade_type)
*    [Command.player_through(*flag)](#commandplayer_throughflag)
*    [Command.player_through?](#commandplayer_through)
*    [Command.player_trail(len, *mode, *tone)](#commandplayer_traillen-mode-tone)
*    [Command.player_transfert(new_x, new_y)](#commandplayer_transfertnew_x-new_y)
*    [Command.player_transparent](#commandplayer_transparent)
*    [Command.player_transparent?](#commandplayer_transparent)
*    [Command.player_turn_180](#commandplayer_turn_180)
*    [Command.player_turn_90_left](#commandplayer_turn_90_left)
*    [Command.player_turn_90_right](#commandplayer_turn_90_right)
*    [Command.player_turn_90_right_or_left](#commandplayer_turn_90_right_or_left)
*    [Command.player_turn_away_from_event(id)](#commandplayer_turn_away_from_eventid)
*    [Command.player_turn_away_from_position(x, y)](#commandplayer_turn_away_from_positionx-y)
*    [Command.player_turn_down](#commandplayer_turn_down)
*    [Command.player_turn_left](#commandplayer_turn_left)
*    [Command.player_turn_random](#commandplayer_turn_random)
*    [Command.player_turn_right](#commandplayer_turn_right)
*    [Command.player_turn_toward_event(id)](#commandplayer_turn_toward_eventid)
*    [Command.player_turn_toward_position(x, y)](#commandplayer_turn_toward_positionx-y)
*    [Command.player_turn_up](#commandplayer_turn_up)
*    [Command.player_x](#commandplayer_x)
*    [Command.player_y](#commandplayer_y)
*    [Command.player_zoom(value)](#commandplayer_zoomvalue)
*    [Command.player_zoom_x(*value)](#commandplayer_zoom_xvalue)
*    [Command.player_zoom_y(*value)](#commandplayer_zoom_yvalue)
*    [Command.qte(key, time, *strict)](#commandqtekey-time-strict)
*    [Command.random(min, max)](#commandrandommin-max)
*    [Command.random_combination(len, *keys)](#commandrandom_combinationlen-keys)
*    [Command.random_figures(x)](#commandrandom_figuresx)
*    [Command.region_id(x, y)](#commandregion_idx-y)
*    [Command.remove_all_windows](#commandremove_all_windows)
*    [Command.remove_window(id)](#commandremove_windowid)
*    [Command.replay_bgm](#commandreplay_bgm)
*    [Command.rm_kill](#commandrm_kill)
*    [Command.roof?(x, y)](#commandroofx-y)
*    [Command.save_bgm](#commandsave_bgm)
*    [Command.save_count](#commandsave_count)
*    [Command.save_delete(index)](#commandsave_deleteindex)
*    [Command.save_exists?(index)](#commandsave_existsindex)
*    [Command.save_game(index)](#commandsave_gameindex)
*    [Command.scene_call(scene)](#commandscene_callscene)
*    [Command.scene_clear_history](#commandscene_clear_history)
*    [Command.scene_goto(scene)](#commandscene_gotoscene)
*    [Command.scene_return](#commandscene_return)
*    [Command.screen_blur(radius, *duration, *wait_flag, *ease)](#commandscreen_blurradius-duration-wait_flag-ease)
*    [Command.screen_fadein(duration)](#commandscreen_fadeinduration)
*    [Command.screen_fadeout(duration)](#commandscreen_fadeoutduration)
*    [Command.screen_flash(color, duration, *wait_flag)](#commandscreen_flashcolor-duration-wait_flag)
*    [Command.screen_height](#commandscreen_height)
*    [Command.screen_pixelation(pixelation, *duration, *wait_flag, *ease)](#commandscreen_pixelationpixelation-duration-wait_flag-ease)
*    [Command.screen_shake(power, speed, duration, *wait_flag)](#commandscreen_shakepower-speed-duration-wait_flag)
*    [Command.screen_tone(tone, duration, *wait_flag)](#commandscreen_tonetone-duration-wait_flag)
*    [Command.screen_width](#commandscreen_width)
*    [Command.scroll_lock?](#commandscroll_lock)
*    [Command.se_play(name, *volume, *pitch)](#commandse_playname-volume-pitch)
*    [Command.se_stop](#commandse_stop)
*    [Command.session_username](#commandsession_username)
*    [Command.set_actor_name(id, new_name)](#commandset_actor_nameid-new_name)
*    [Command.set_actor_nickname(id, new_name)](#commandset_actor_nicknameid-new_name)
*    [Command.set_tile(value, x, y, layer)](#commandset_tilevalue-x-y-layer)
*    [Command.set_tile_where(layer, id, new_id)](#commandset_tile_wherelayer-id-new_id)
*    [Command.shift?](#commandshift)
*    [Command.show_animation(ids, id_animation, *wait_flag)](#commandshow_animationids-id_animation-wait_flag)
*    [Command.show_balloon(ids, id_balloon, *wait_flag)](#commandshow_balloonids-id_balloon-wait_flag)
*    [Command.sin(x)](#commandsinx)
*    [Command.sinh(x)](#commandsinhx)
*    [Command.skill_always_usable?(id)](#commandskill_always_usableid)
*    [Command.skill_battle_usable?(id)](#commandskill_battle_usableid)
*    [Command.skill_certain?(id)](#commandskill_certainid)
*    [Command.skill_description(id)](#commandskill_descriptionid)
*    [Command.skill_for_all?(id)](#commandskill_for_allid)
*    [Command.skill_for_all_allies?(id)](#commandskill_for_all_alliesid)
*    [Command.skill_for_all_dead_allies?(id)](#commandskill_for_all_dead_alliesid)
*    [Command.skill_for_all_enemies?(id)](#commandskill_for_all_enemiesid)
*    [Command.skill_for_caller?(id)](#commandskill_for_callerid)
*    [Command.skill_for_dead_friend?(id)](#commandskill_for_dead_friendid)
*    [Command.skill_for_four_random_enemies?(id)](#commandskill_for_four_random_enemiesid)
*    [Command.skill_for_friend?(id)](#commandskill_for_friendid)
*    [Command.skill_for_one?(id)](#commandskill_for_oneid)
*    [Command.skill_for_one_ally?(id)](#commandskill_for_one_allyid)
*    [Command.skill_for_one_dead_ally?(id)](#commandskill_for_one_dead_allyid)
*    [Command.skill_for_one_enemy?(id)](#commandskill_for_one_enemyid)
*    [Command.skill_for_one_random_enemy?(id)](#commandskill_for_one_random_enemyid)
*    [Command.skill_for_opponent?(id)](#commandskill_for_opponentid)
*    [Command.skill_for_random?(id)](#commandskill_for_randomid)
*    [Command.skill_for_three_random_enemies?(id)](#commandskill_for_three_random_enemiesid)
*    [Command.skill_for_two_random_enemies?(id)](#commandskill_for_two_random_enemiesid)
*    [Command.skill_has_no_scope?(id)](#commandskill_has_no_scopeid)
*    [Command.skill_icon(id)](#commandskill_iconid)
*    [Command.skill_magical?(id)](#commandskill_magicalid)
*    [Command.skill_menu_usable?(id)](#commandskill_menu_usableid)
*    [Command.skill_name(id)](#commandskill_nameid)
*    [Command.skill_nb_hits(id)](#commandskill_nb_hitsid)
*    [Command.skill_need_selection?(id)](#commandskill_need_selectionid)
*    [Command.skill_never_usable?(id)](#commandskill_never_usableid)
*    [Command.skill_note(id)](#commandskill_noteid)
*    [Command.skill_number_of_targets(id)](#commandskill_number_of_targetsid)
*    [Command.skill_occasion(id)](#commandskill_occasionid)
*    [Command.skill_physical?(id)](#commandskill_physicalid)
*    [Command.skill_scope(id)](#commandskill_scopeid)
*    [Command.skill_speed(id)](#commandskill_speedid)
*    [Command.skill_success_rate(id)](#commandskill_success_rateid)
*    [Command.skill_tp_gain(id)](#commandskill_tp_gainid)
*    [Command.socket_connect(address, port)](#commandsocket_connectaddress-port)
*    [Command.socket_connected?](#commandsocket_connected)
*    [Command.socket_disconnect](#commandsocket_disconnect)
*    [Command.socket_recv(*len)](#commandsocket_recvlen)
*    [Command.socket_send(data)](#commandsocket_senddata)
*    [Command.socket_wait_recv(*len)](#commandsocket_wait_recvlen)
*    [Command.sound_fade(wait, *frame)](#commandsound_fadewait-frame)
*    [Command.sound_stop](#commandsound_stop)
*    [Command.split_each_char(str)](#commandsplit_each_charstr)
*    [Command.sqrt(x)](#commandsqrtx)
*    [Command.square_passable?(x, y, direction)](#commandsquare_passablex-y-direction)
*    [Command.squares_between(idA, idB)](#commandsquares_betweenida-idb)
*    [Command.stair?(x, y)](#commandstairx-y)
*    [Command.start_map_id](#commandstart_map_id)
*    [Command.start_new_game](#commandstart_new_game)
*    [Command.start_x](#commandstart_x)
*    [Command.start_y](#commandstart_y)
*    [Command.steps](#commandsteps)
*    [Command.switch_tileset(tileset_id)](#commandswitch_tilesettileset_id)
*    [Command.table?(x, y)](#commandtablex-y)
*    [Command.tan(x)](#commandtanx)
*    [Command.tanh(x)](#commandtanhx)
*    [Command.team_size](#commandteam_size)
*    [Command.terrain_tag(x, y)](#commandterrain_tagx-y)
*    [Command.text_angle(id, *value)](#commandtext_angleid-value)
*    [Command.text_change(id, text)](#commandtext_changeid-text)
*    [Command.text_erase(id)](#commandtext_eraseid)
*    [Command.text_move(id, duration, wait_flag, x, y, zoom_x, zoom_y, opacity, blend_type, origin)](#commandtext_moveid-duration-wait_flag-x-y-zoom_x-zoom_y-opacity-blend_type-origin)
*    [Command.text_move?(id)](#commandtext_moveid)
*    [Command.text_opacity(id, *opacity, *duration, *wait_flag)](#commandtext_opacityid-opacity-duration-wait_flag)
*    [Command.text_position(id, x, y, *duration, *wait_flag)](#commandtext_positionid-x-y-duration-wait_flag)
*    [Command.text_profile(id, *profile)](#commandtext_profileid-profile)
*    [Command.text_progressive(id, value, delay, *block)](#commandtext_progressiveid-value-delay-block)
*    [Command.text_rotate(id, speed)](#commandtext_rotateid-speed)
*    [Command.text_show(id, text, profile, x, y, *zoom_x, *zoom_y, *opacity, *blend_type, *origin)](#commandtext_showid-text-profile-x-y-zoom_x-zoom_y-opacity-blend_type-origin)
*    [Command.text_value(id)](#commandtext_valueid)
*    [Command.text_x(id, x, *duration, *wait_flag)](#commandtext_xid-x-duration-wait_flag)
*    [Command.text_y(id, y, *duration, *wait_flag)](#commandtext_yid-y-duration-wait_flag)
*    [Command.text_zoom(id, zoom_x, zoom_y, *duration, *wait_flag)](#commandtext_zoomid-zoom_x-zoom_y-duration-wait_flag)
*    [Command.text_zoom_x(id, zoom_x, *duration, *wait_flag)](#commandtext_zoom_xid-zoom_x-duration-wait_flag)
*    [Command.text_zoom_y(id, zoom_y, *duration, *wait_flag)](#commandtext_zoom_yid-zoom_y-duration-wait_flag)
*    [Command.textfield_activate(id)](#commandtextfield_activateid)
*    [Command.textfield_active?(id)](#commandtextfield_activeid)
*    [Command.textfield_click?(id)](#commandtextfield_clickid)
*    [Command.textfield_deactivate(*id)](#commandtextfield_deactivateid)
*    [Command.textfield_erase(*id)](#commandtextfield_eraseid)
*    [Command.textfield_float_show(id, number, x, y, w, profile, *range, *active, *opacity)](#commandtextfield_float_showid-number-x-y-w-profile-range-active-opacity)
*    [Command.textfield_get_value(id)](#commandtextfield_get_valueid)
*    [Command.textfield_hover?(id)](#commandtextfield_hoverid)
*    [Command.textfield_int_show(id, number, x, y, w, profile, *range, *active, *opacity)](#commandtextfield_int_showid-number-x-y-w-profile-range-active-opacity)
*    [Command.textfield_opacity(id, opacity)](#commandtextfield_opacityid-opacity)
*    [Command.textfield_press?(id, *key)](#commandtextfield_pressid-key)
*    [Command.textfield_release?(id, *key)](#commandtextfield_releaseid-key)
*    [Command.textfield_repeat?(id, *key)](#commandtextfield_repeatid-key)
*    [Command.textfield_set_value(id, value)](#commandtextfield_set_valueid-value)
*    [Command.textfield_text_show(id, text, x, y, w, profile, *range, *active, *opacity)](#commandtextfield_text_showid-text-x-y-w-profile-range-active-opacity)
*    [Command.textfield_trigger?(id, *key)](#commandtextfield_triggerid-key)
*    [Command.textfield_visible(id, flag)](#commandtextfield_visibleid-flag)
*    [Command.textfield_visible?(id)](#commandtextfield_visibleid)
*    [Command.texts_clear](#commandtexts_clear)
*    [Command.tile_id(x, y, layer, *map_id)](#commandtile_idx-y-layer-map_id)
*    [Command.time_day](#commandtime_day)
*    [Command.time_hour](#commandtime_hour)
*    [Command.time_min](#commandtime_min)
*    [Command.time_month](#commandtime_month)
*    [Command.time_sec](#commandtime_sec)
*    [Command.time_year](#commandtime_year)
*    [Command.timer](#commandtimer)
*    [Command.to_deg(x)](#commandto_degx)
*    [Command.to_rad(x)](#commandto_radx)
*    [Command.tone(red, green, blue, *gray)](#commandtonered-green-blue-gray)
*    [Command.total_enemies](#commandtotal_enemies)
*    [Command.troop_member(id, position)](#commandtroop_memberid-position)
*    [Command.troop_member_x(id, position)](#commandtroop_member_xid-position)
*    [Command.troop_member_y(id, position)](#commandtroop_member_yid-position)
*    [Command.troop_members(id)](#commandtroop_membersid)
*    [Command.troop_name(id)](#commandtroop_nameid)
*    [Command.troop_size(id)](#commandtroop_sizeid)
*    [Command.unflash_rect(x, y, width, height)](#commandunflash_rectx-y-width-height)
*    [Command.unflash_square(x, y)](#commandunflash_squarex-y)
*    [Command.version_id](#commandversion_id)
*    [Command.wait(duration)](#commandwaitduration)
*    [Command.wait_release(key)](#commandwait_releasekey)
*    [Command.wait_trigger(key)](#commandwait_triggerkey)
*    [Command.wait_with(time, &block)](#commandwait_withtime-&block)
*    [Command.wall?(x, y)](#commandwallx-y)
*    [Command.weapon_agility(id)](#commandweapon_agilityid)
*    [Command.weapon_attack_power(id)](#commandweapon_attack_powerid)
*    [Command.weapon_count(id)](#commandweapon_countid)
*    [Command.weapon_defense_power(id)](#commandweapon_defense_powerid)
*    [Command.weapon_description(id)](#commandweapon_descriptionid)
*    [Command.weapon_equiped?(id, *member_id)](#commandweapon_equipedid-member_id)
*    [Command.weapon_icon(id)](#commandweapon_iconid)
*    [Command.weapon_luck(id)](#commandweapon_luckid)
*    [Command.weapon_magic_attack_power(id)](#commandweapon_magic_attack_powerid)
*    [Command.weapon_magic_defense_power(id)](#commandweapon_magic_defense_powerid)
*    [Command.weapon_max_hit_points(id)](#commandweapon_max_hit_pointsid)
*    [Command.weapon_max_magic_points(id)](#commandweapon_max_magic_pointsid)
*    [Command.weapon_name(id)](#commandweapon_nameid)
*    [Command.weapon_note(id)](#commandweapon_noteid)
*    [Command.weapon_price(id)](#commandweapon_priceid)
*    [Command.weapon_type(id)](#commandweapon_typeid)
*    [Command.weapons_possessed](#commandweapons_possessed)
*    [Command.website(url)](#commandwebsiteurl)
*    [Command.window_activate(id)](#commandwindow_activateid)
*    [Command.window_closed?(id)](#commandwindow_closedid)
*    [Command.window_content(id, *content, *resize)](#commandwindow_contentid-content-resize)
*    [Command.window_current_symbol(id)](#commandwindow_current_symbolid)
*    [Command.window_deactivate(id)](#commandwindow_deactivateid)
*    [Command.window_dimension(id, width, height, *duration, *wait_flag)](#commandwindow_dimensionid-width-height-duration-wait_flag)
*    [Command.window_height(id)](#commandwindow_heightid)
*    [Command.window_move(id, x, y, w, h, opacity, *duration, *wait_flag)](#commandwindow_moveid-x-y-w-h-opacity-duration-wait_flag)
*    [Command.window_moveto(id, x, y, *duration, *wait_flag)](#commandwindow_movetoid-x-y-duration-wait_flag)
*    [Command.window_opacity(id, *value, *duration, *wait_flag)](#commandwindow_opacityid-value-duration-wait_flag)
*    [Command.window_opened?(id)](#commandwindow_openedid)
*    [Command.window_width(id)](#commandwindow_widthid)
*    [Command.window_x(id, *x)](#commandwindow_xid-x)
*    [Command.window_y(id, *y)](#commandwindow_yid-y)


## Description des méthodes
##### Command.a_save_exists?

> Renvoie true si au moins une sauvegade a été faite, false sinon

  




##### Command.acos(x)

> Renvoie l'arc cosinus de x

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  




##### Command.acosh(x)

> Renvoie l'inverse hyperbolique cosinus de x

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  




##### Command.active_actor

> renvoie l'identifiant d'un acteur si il est en train de sélectionner une action, nil sinon

  




##### Command.active_actor?

> renvoie true si un acteur est en train de choisir une action, false sinon

  




##### Command.actor_accessory(id)

> renvoie l'id l'accessoire équipé par le héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_agility(id)

> renvoie les points d'agilité du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_armors(id)

> renvoie le tableau des ID's des armures équipées du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_attack(id)

> renvoie les points d'attaque du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_body(id)

> renvoie l'id de l'armure équipée par le héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_change_appear(id, character_name, character_index, face_name, face_index)

> Change l'apparence et la face du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du héros  
`character_name`|`String`|Nom du caractère  
`character_index`|`Fixnum`|ID du caractère  
`face_name`|`String`|Nom du face  
`face_index`|`Fixnum`|ID du face  




##### Command.actor_change_character(id, character_name, character_index)

> Change l'apparence du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du héros  
`character_name`|`String`|Nom du caractère  
`character_index`|`Fixnum`|ID du caractère  




##### Command.actor_change_equip(id, slot, object_id)

> Change l'équipement du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`slot`|`Symbol`|Slot d'équipement (:Weapon, :Body, :Shield, : Head, :Accessory)  
`object_id`|`Fixnum`|ID de l'Arme ou de l'Armure à mettre (La commande déduira s'il doit s'agir d'une arme ou d'une armure)  




##### Command.actor_change_face(id, face_name, face_index)

> Change la face du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du héros  
`face_name`|`String`|Nom du face  
`face_index`|`Fixnum`|ID du face  




##### Command.actor_character_index(id)

> renvoie l'index du charset du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_character_name(id)

> renvoie le nom du charset du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_class(id)

> renvoie l'ID de la classe du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_counter_attack_rate(id)

> renvoie la probabilité d'un contre (sur une attaque physique) du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_critical_evasion_rate(id)

> renvoie la probabilité de faire un coup critique en préemptif du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_critical_rate(id)

> renvoie la probabilité de coup critique du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_defense(id)

> renvoie les points de défense du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_description(id)

> renvoie la description du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_element_rate(id, element_id)

> Renvoie la résistance élémentaire (par son ID d'élément) d'un acteur référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'acteur  
`element_id`|`Fixnum`|Id de l'élément  




##### Command.actor_equip(id, slot)

> Renvoie l'id de l'équipement (dans le slot indiqué) du héros (référencé par son ID)

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`slot`|`Symbol`|Slot d'équipement soit :Weapon, :Head, :Body, :Shield ou :Accessory  




##### Command.actor_equip_accessory(id, object_id)

> Change l'accessoire du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`object_id`|`Fixnum`|ID de l'Armure  




##### Command.actor_equip_body(id, object_id)

> Change l'armure du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`object_id`|`Fixnum`|ID de l'Armure  




##### Command.actor_equip_head(id, object_id)

> Change le casque du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`object_id`|`Fixnum`|ID de l'Armure  




##### Command.actor_equip_shield(id, object_id)

> Change le bouclier du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`object_id`|`Fixnum`|ID de l'Armure  




##### Command.actor_equip_weapon(id, object_id)

> Change l'arme du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`object_id`|`Fixnum`|ID de l'Arme  




##### Command.actor_evasion_rate(id)

> renvoie la probabilité d'esquiver une attaque physique du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_exp(id)

> renvoie les points d'expérience du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_exp_for_next_level(id)

> renvoie le nombre de points d'expérience nécéssaires pour passer au niveau suivant pour le héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_exp_rate(id)

> renvoie le pourcentage de la variation d'acquisition d'expérience du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_face_index(id)

> renvoie l'index du faceset du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_face_name(id)

> renvoie le nom du faceset du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_floor_damage_rate(id)

> renvoie le pourcentage de dommage des terrains reçu par le héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_forget(id, skill_id)

> Oublie la technique passée en argument au héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`skill_id`|`Fixnum`|ID de le technique  




##### Command.actor_give_exp(id, exp)

> fait gagner de l'expérience au héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`exp`|`Fixnum`|Expérience donnée  




##### Command.actor_guard_effect_rate(id)

> renvoie la force de défense (diminution de l'attaque subie) du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_has_accessory?(id)

> renvoie true si le héros référencé par son ID est équipé d'un accessoire, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_has_body?(id)

> renvoie true si le héros référencé par son ID est équipé d'une armure, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_has_head?(id)

> renvoie true si le héros référencé par son ID est équipé d'une casque, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_has_shield?(id)

> renvoie true si le héros référencé par son ID est équipé d'un bouclier, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_has_weapon?(id)

> renvoie true si le héros référencé par son ID est équipé d'une arme, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_head(id)

> renvoie l'id du casque équipé par le héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_hit_rate(id)

> renvoie la probabilité de toucher un ennemi pour le héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_hp(id)

> renvoie les points de vie du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_hp_regeneration_rate(id)

> renvoie le pourcentage de régénération de PV à chaque tour du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_knowns?(id, skill_id)

> Renvoie true si le héros référencé par son ID connait la technique référencée par son ID, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`skill_id`|`Fixnum`|ID de le technique  




##### Command.actor_learn(id, skill_id)

> Apprend la technique passée en argument au héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`skill_id`|`Fixnum`|ID de le technique  




##### Command.actor_level(id)

> renvoie le niveau du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_level_down(id)

> fait perdre un niveau au héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_level_max(id)

> renvoie le niveau maximum du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_level_up(id)

> fait gagner un niveau au héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_luck(id)

> renvoie les points de chance du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_magic_attack(id)

> renvoie les points d'attaque magique du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_magic_defense(id)

> renvoie les points de défense magique du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_magical_damage_rate(id)

> renvoie le pourcentage de dommage magique reçu par le héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_magical_evasion_rate(id)

> renvoie la probabilité d'une esquiver une attaque magique d'un ennemi pour le héros référencé par son ID 

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_magical_reflection_rate(id)

> renvoie la probabilité d'une réflexion magique du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_max_hp(id)

> renvoie le nombre de points de vie maximum du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_max_mp(id)

> renvoie le nombre de points de magie maximum du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_mp(id)

> renvoie les points de magie du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_mp_cost_rate(id)

> renvoie le facteur d'un coût de MP (pour une attaque faisant varier la consommation de MP) du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_mp_regeneration_rate(id)

> renvoie le pourcentage de régénration de MP à chaque tour du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_name(id)

> renvoie le nom du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_nickname(id)

> renvoie le surnom du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_note(id)

> renvoie le commentaire de la base de données du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_optimize_equipement(id)

> Optimise l'équipement du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_pharmacology(id)

> renvoie le pourcentage de PV/PM récupéré via un objet du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_physical_damage_rate(id)

> renvoie le pourcentage de dommage physique reçu par le héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_recovery_effect_rate(id)

> renvoie le pourcentage de PV/PM reçu, du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_set_graphic(id, character_name, character_index, face_name, face_index)

> Change les graphismes du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`character_name`|`String`|Charset  
`character_index`|`Fixnum`|index du Charset  
`face_name`|`String`|Faceset  
`face_index`|`Fixnum`|Index du faceset  




##### Command.actor_shield(id)

> renvoie l'id du bouclier équipé par le héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_skills(id)

> renvoie le tableau des ID's des techniques connues du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_slot(id)

> Renvoie l'ID d'un acteur en fonction de sa position dans l'équipe. Renvoie 0 si le slot est vide.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Position de l'acteur dans l'équipe  




##### Command.actor_target_rate(id)

> renvoie la probabilité d'être ciblé par un ennemi, du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_tp(id)

> renvoie les points de temps du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_tp_charge_rate(id)

> renvoie le facteur de coût de TP (pour une attaque faisant varier la consommation de TP) du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_tp_regeneration_rate(id)

> renvoie le pourcentage de régénration de TP par tour du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_weapon(id)

> renvoie l'id de l'arme équipée par le héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.actor_weapons(id)

> renvoie le tableau des ID's des armes équipées du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  




##### Command.alt_gr?

> Renvoie true si la touche ALT_GR (ou la combinaison CTRL+ALT) est appuyée au moment de l'appel, false sinon

  




##### Command.angle_between(idA, idB)

> Renvoie l'angle entre deux événements référencés par leurs ID's

  
Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de l'évènement A (0 pour héros)  
`idB`|`Fixnum`|ID de l'évènement B (0 pour héros)  




##### Command.angle_xy(xa, ya, xb, yb)

> Renvoie l' angle entre deux points, dans le sens anti-horaire, défini entre 0 et 360 degrés

  
Nom|Type|Description  
--- | --- | ---  
`xa`|`Fixnum`|Coordonnée X du point A  
`ya`|`Fixnum`|Coordonnée Y du point A  
`xb`|`Fixnum`|Coordonnée X du point B  
`yb`|`Fixnum`|Coordonnée Y du point B  




##### Command.apply_percent(percent, max)

> Applique percent à max

  
Nom|Type|Description  
--- | --- | ---  
`percent`|`Fixnum`|Valeur à appliquer  
`max`|`Fixnum`|Valeur maximum  


Exemple  
```ruby  
Command.apply_percent(50, 80) # Renvoie 40 (parce que 50% de 80 = 40)  
```



##### Command.armor_agility(id)

> Renvoie l'apport d'agilité d'une armure référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.armor_attack_power(id)

> Renvoie la puissance d'attaque d'une armure référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.armor_count(id)

> Renvoie le nombre d'armures (référencées par un ID) possédées par l'équipe

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure à compter  




##### Command.armor_defense_power(id)

> Renvoie la puissance de défense d'une armure référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.armor_description(id)

> Renvoie la description de l'armure référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  




##### Command.armor_equiped?(id, *member_id)

> Renvoie true si l'armure référencée par son ID est équipée par un des membres de l'équipe, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  
`*member_id`|`Fixnum`|Id du membre de l'équipe. Si aucun membre_id n'est spécifié, la commande vérifiera pour toute l'équipe   




##### Command.armor_icon(id)

> Renvoie l'index de l'icone de l'armure référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  




##### Command.armor_luck(id)

> Renvoie l'apport de chance d'une armure référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.armor_magic_attack_power(id)

> Renvoie la puissance d'attaque magique d'une armure référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.armor_magic_defense_power(id)

> Renvoie la puissance de défense magique d'une armure référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.armor_max_hit_points(id)

> Renvoie le maximum des points de vie d'une armure référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.armor_max_magic_points(id)

> Renvoie le maximum des points de magie d'une armure référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.armor_name(id)

> Renvoie le nom de l'armure référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  




##### Command.armor_note(id)

> Renvoie le commentaire de l'armure référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  




##### Command.armor_price(id)

> Renvoie le prix  de l'armure référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  




##### Command.armor_type(id)

> Renvoie le type de l'armure référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  




##### Command.armors_possessed

> Renvoie la liste des armures possédées

  




##### Command.asin(x)

> Renvoie l'arc sinus de x

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  




##### Command.asinh(x)

> Renvoie l'inverse hyperbolique sinus de x

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  




##### Command.atan(x)

> Renvoie l'arc tangent de x

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  




##### Command.atan2(x, y)

> Renvoie l'arc tangent pour x et y

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  
`y`|`Numeric`|Valeur numérique  




##### Command.atanh(x)

> Renvoie l'inverse hyperbolique tangent de x

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  




##### Command.battle_count

> Renvoie le nombre de combats effectués par partie

  




##### Command.between(x1, y1, x2, y2)

> Donne la distance entre deux points

  
Nom|Type|Description  
--- | --- | ---  
`x1`|`Fixnum`|Valeur X du premier point  
`y1`|`Fixnum`|Valeur Y du premier point  
`x2`|`Fixnum`|Valeur X du second point  
`y2`|`Fixnum`|Valeur Y du second point  




##### Command.bgm_fade(wait, *frame)

> Arrêt en fondu du BGM en cours

  
Nom|Type|Description  
--- | --- | ---  
`wait`|`Fixnum`|Temps du fondu, par défaut en secondes  
`*frame`|`Boolean`|Spécifiez 'true' si vous renseignez un temps en frames plutôt qu'en secondes  




##### Command.bgm_pitch(pitch)

> Change la vitesse du BGM en cours

  
Nom|Type|Description  
--- | --- | ---  
`pitch`|`Fixnum`|Vitesse du BGM. Pourcentage entre 1 et 453  




##### Command.bgm_play(name, *volume, *pitch)

> Joue un BGM

  
Nom|Type|Description  
--- | --- | ---  
`name`|`String`|Nom du BGM  
`*volume`|`Fixnum`|Volume du BGM. Pourcentage entre 0 et 100. Par défaut : 100  
`*pitch`|`Fixnum`|Vitesse du BGM. Pourcentage entre 1 et 453. Par défaut : 100  




##### Command.bgm_stop

> Stoppe le BGM en cours

  




##### Command.bgm_volume(volume)

> Change le volume du BGM en cours

  
Nom|Type|Description  
--- | --- | ---  
`volume`|`Fixnum`|Volume du BGM. Pourcentage entre 0 et 100  




##### Command.bgs_fade(wait, *frame)

> Arrêt en fondu du BGS en cours

  
Nom|Type|Description  
--- | --- | ---  
`wait`|`Fixnum`|Temps du fondu (en secondes)  
`*frame`|`Boolean`|Spécifiez 'true' si vous renseignez un temps en frames plutôt qu'en secondes  




##### Command.bgs_pitch(pitch)

> Change la vitesse du BGS en cours

  
Nom|Type|Description  
--- | --- | ---  
`pitch`|`Fixnum`|Vitesse du BGS. Pourcentage entre 1 et 453  




##### Command.bgs_play(name, *volume, *pitch)

> Joue un BGS

  
Nom|Type|Description  
--- | --- | ---  
`name`|`String`|Nom du BGS  
`*volume`|`Fixnum`|Volume du BGS. Pourcentage entre 0 et 100. Par défaut : 80  
`*pitch`|`Fixnum`|Vitesse du BGS. Pourcentage entre 1 et 453. Par défaut : 100  




##### Command.bgs_stop

> Stoppe le BGS en cours

  




##### Command.bgs_volume(volume)

> Change le volume du BGS en cours

  
Nom|Type|Description  
--- | --- | ---  
`volume`|`Fixnum`|Volume du BGS. Pourcentage entre 0 et 100  




##### Command.call_common_event(id)

> Exécute l'événement commun référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement commun à exécuter  




##### Command.call_load_screen

> Renvoie à la scene de chargement de partie

  




##### Command.call_title_screen

> Renvoie à l'écran titre

  




##### Command.camera_change_focus(event_id)

> Change la cible du scrolling (par défaut, le scrolling suit le héros) pour un autre évènement

  
Nom|Type|Description  
--- | --- | ---  
`event_id`|`Fixnum`|ID de l'évènement à suivre par la caméra  




##### Command.camera_lock

> Verrouille la position de la caméra

  




##### Command.camera_motion_blur(attenuation, *duration, *wait_flag, *ease)

> Atténue le raffraichissement de l'écran. Rend plus diffus les mouvements de caméra, et mouvements à l'écran.

  
Nom|Type|Description  
--- | --- | ---  
`attenuation`|`ArgType`|Valeur d'atténuation du raffraichissement de l'écran, de 0 à 200  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.camera_move_on(x, y)

> Place la caméra sur un point de la carte

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  




##### Command.camera_scroll(direction, distance, speed)

> Fait défiler la carte dans une direction sur une distance (en cases) à une certaine vitesse

  
Nom|Type|Description  
--- | --- | ---  
`direction`|`Fixnum`|Direction (2=bas, 4=gauche, 6=droite, 8=haut)  
`distance`|`Fixnum`|Nombre de case à défiler  
`speed`|`Fixnum`|Vitesse du défilement  




##### Command.camera_scroll_on(x, y, speed)

> Fait défiler la carte vers un point donné

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`speed`|`Fixnum`|Vitesse de défilement  




##### Command.camera_unlock

> Déverrouille la position de la caméra (et reprend le héros comme plan de référence)

  




##### Command.camera_zoom(zoom, *duration, *wait_flag, *ease)

> Zoom tout l'écran en temps réel, sauf les windows (dialogues, etc.)

  
Nom|Type|Description  
--- | --- | ---  
`zoom`|`ArgType`|Valeur de zoom, supérieur à 100  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.caps_lock?

> Renvoie true si le clavier est en mode CAPS_LOCK au moment de l'appel, false sinon

  




##### Command.click_time(key)

> Renvoie, en nombre de frames, la durée de pression d'une touche de souris choisie

  
Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche à vérifier  




##### Command.clipboard_get_text

> Renvoie le texte contenu dans le presse-papier

  




##### Command.clipboard_push_command(cmd)

> Place une commande évènement dans le presse-papier

  
Nom|Type|Description  
--- | --- | ---  
`cmd`|`RPGCommand`|Commande à placer dans le presse-papier  




##### Command.clipboard_push_text(text)

> Place un texte dans le presse-papier

  
Nom|Type|Description  
--- | --- | ---  
`text`|`String`|Texte à sauvegarder dans le presse-papier  




##### Command.close_window(id)

> Ferme la fenêtre référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  




##### Command.color(red, green, blue, *alpha)

> Renvoie une couleur

  
Nom|Type|Description  
--- | --- | ---  
`red`|`Fixnum`|Valeur de rouge  
`green`|`Fixnum`|Valeur de vert  
`blue`|`Fixnum`|Valeur de bleu  
`*alpha`|`Fixnum`|Opacité, par défaut 255!  




##### Command.cos(x)

> Renvoie le cosinus de x

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  




##### Command.cosh(x)

> Renvoie le cosinus hyperbolique de x

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  




##### Command.create_circle_area(x, y, rayon)

> Crée et renvoie une zone circulaire

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la zone  
`y`|`Fixnum`|Coordonnées Y de la zone  
`rayon`|`Fixnum`|Rayon de la zone  




##### Command.create_commands_window(id, x, y, w, hash, *h)

> Crée une fenêtre de sélection verticale

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  
`x`|`Fixnum`|Coordonnées X de la fenêtre  
`y`|`Fixnum`|Coordonnées Y de la fenêtre  
`w`|`Fixnum`|Largeur de la fenêtre  
`hash`|`Hash`|Hash décrivant les différentes sections de la fenêtre  
`*h`|`Fixnum`|Hauteur de la fenêtre (en nombre de ligne), si aucun argument n'est donné, la hauteur sera calculée  




##### Command.create_ellipse_area(x, y, width, height)

> Crée et renvoie une zone elliptique

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la zone  
`y`|`Fixnum`|Coordonnées Y de la zone  
`width`|`Fixnum`|Largeur de la zone  
`height`|`Fixnum`|Hauteur de la zone  




##### Command.create_horizontal_commands_window(id, x, y, hash, row)

> Crée une fenêtre de sélection horizontale

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  
`x`|`Fixnum`|Coordonnées X de la fenêtre  
`y`|`Fixnum`|Coordonnées Y de la fenêtre  
`hash`|`Hash`|Hash décrivant les différentes sections de la fenêtre  
`row`|`Fixnum`|Nombre de colonnes. Si aucun argument n'est spécifié, la fenêtre prendra le nombre correct de colonnes  




##### Command.create_polygon_area(points)

> Crée et renvoie une zone polygonale (le dernier point est relié avec le premier)

  
Nom|Type|Description  
--- | --- | ---  
`points`|`ArgType`|Liste de points. Exemple : create_polygon_area([[ax, ay], [bx, by], [cx, cy]])  




##### Command.create_rect_area(x, y, width, height)

> Crée et renvoie une zone rectangulaire

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la zone  
`y`|`Fixnum`|Coordonnées Y de la zone  
`width`|`Fixnum`|Largeur de la zone  
`height`|`Fixnum`|Hauteur de la zone  




##### Command.create_selectable_window(id, x, y, width, height, hash)

> Crée une fenêtre de sélection complexe

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  
`x`|`Fixnum`|Coordonnée X  
`y`|`Fixnum`|Coordonnée Y  
`width`|`Fixnum`|Largeur de la fenêtre  
`height`|`Fixnum`|Hauteur de la fenêtre  
`hash`|`Hash`|Description des callbacks de la fenêtre (CF Wiki)  




##### Command.create_text_window(id, content, x, y, *w, *h)

> Crée une fenêtre pouvant contenir du texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Numéro de la fenêtre  
`content`|`String`|Texte (ou tableau séparé par des virgules) à afficher  
`x`|`Fixnum`|Position X de la fenêtre  
`y`|`Fixnum`|Position Y de la fenêtre  
`*w`|`Fixnum`|Largeur de la fenêtre, utilisez 'nil' pour que la largeur de la fenêtre soit calculée  
`*h`|`Fixnum`|Hauteur de la fenêtre, utilisez 'nil' pour que la hauteur de la fenêtre soit calculée  




##### Command.ctrl?(key)

> Renvoie true si la touche CTRL (ou une combinaison CTRL+key) est appuyée au moment de l'appel, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant la touche (cf:attributs) mise en combinaison  




##### Command.currency

> Renvoie la monnaie du jeu

  




##### Command.current_enemies

> Renvoie un tableau contenant les ID des ennemis en cours de combat

  




##### Command.current_troop

> Renvoie l'identifiant du groupe en cours de combat

  




##### Command.cursor_system(flag)

> Affiche ou masque le curseur Windows sur la fenêtre de jeu

  
Nom|Type|Description  
--- | --- | ---  
`flag`|`Boolean`|true pour visible, false pour invisible  




##### Command.damage_floor?(x, y)

> Renvoie true si la case référencée par X, Y est blessante, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  




##### Command.delete_tiles(layer, id)

> Supprime tous les tiles référencés par un ID et un layer

  
Nom|Type|Description  
--- | --- | ---  
`layer`|`Fixnum`|Numéro de la couche  
`id`|`Fixnum`|Id du tile à supprimer  




##### Command.enemy_agility(position)

> renvoie les points d'agilité de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_attack(position)

> renvoie les points d'attaque de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_counter_attack_rate(position)

> renvoie la probabilité d'un contre (sur une attaque physique) de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_critical_evasion_rate(position)

> renvoie la probabilité de faire un coup critique en préemptif de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_critical_rate(position)

> renvoie la probabilité de coup critique de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_defense(position)

> renvoie les points de défense de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_die?(position)

> renvoie true si l'ennemi en combat référencé par sa position en combat est mort, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_evasion_rate(position)

> renvoie la probabilité d'esquiver une attaque physique de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_experience_rate(position)

> renvoie le pourcentage de la variation d'acquisition d'expérience de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_floor_damage_rate(position)

> renvoie le pourcentage de dommage des terrains reçu par l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_guard_effect_rate(position)

> renvoie la force de défense (diminution de l'attaque subie) de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_hidden?(position)

> renvoie true si l'ennemi en combat référencé par sa position en combat est invisble, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_hit_rate(position)

> renvoie la probabilité de toucher de l'ennemi en combat référencé par sa position en combat sur un ennemi

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_hp(position)

> renvoie les points de vie de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_hp_regeneration_rate(position)

> renvoie le pourcentage de régénération de PV à chaque tour de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_luck(position)

> renvoie les points de chance de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_magic_attack(position)

> renvoie les points d'attaque magique de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_magic_defense(position)

> renvoie les points de défense magique de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_magical_damage_rate(position)

> renvoie le pourcentage de dommage magique reçu par l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_magical_evasion_rate(position)

> renvoie la probabilité d'une esquiver une attaque magique de l'ennemi en combat référencé par sa position en combat par un ennemi

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_magical_reflection_rate(position)

> renvoie la probabilité d'une réflexion magique de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_max_hp(position)

> renvoie le nombre de points de vie maximum de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_max_mp(position)

> renvoie le nombre de points de magie de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_mp(position)

> renvoie les points de magie de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_mp_cost_rate(position)

> renvoie le facteur d'un coût de MP (pour une attaque faisant varier la consommation de MP) de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_mp_regeneration_rate(position)

> renvoie le pourcentage de régénération PM à chaque tour de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_pharmacology(position)

> renvoie le pourcentage de PV/PM récupéré via un objet de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_physical_damage_rate(position)

> renvoie le pourcentage de dommage physique reçu par l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_recovery_effect_rate(position)

> renvoie le pourcentage de PV/PM reçus, de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_target_rate(position)

> renvoie la probabilité d'être ciblé par un ennemi, de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_tp(position)

> renvoie les points de temps de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_tp_charge_rate(position)

> renvoie le facteur de coût de TP (pour une attaque faisant varier la consommation de TP) de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.enemy_tp_regeneration_rate(position)

> renvoie le pourcentage de régénération de TP par tour de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.event_brutal_stop_trail(ids)

> Arrête brutalement la traînée sur un sélecteur d'évènements

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|Sélecteur d'évènements à qui attribuer une traînée  




##### Command.event_direction(id, *value)

> Renvoie (ou change) la direction (2 pour le haut, 8, pour le bas, 4 pour la gauche , 6 pour la droite ) de l'évènement référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  
`*value`|`Fixnum`|Valeur de la direction, 2,4,6,8. Si aucune valeur n'est donnée, la commande retourne la direction de l'évènement ciblé.  




##### Command.event_erase(id)

> Efface de la map les événements référencés par le sélécteur ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Selector`|ID des événements  




##### Command.event_erased?(id)

> Renvoie true si l'évènement référencé par son ID à été supprimé, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour le héro)  




##### Command.event_flash(id, color, duration)

> Flash un événement (référencé par son ID) dans une couleur

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|l'ID de l'événement cible  
`color`|`Color`|La couleur du flash (vous pouvez utiliser la commande color ou via son profil dans la base de données)  
`duration`|`Fixnum`|La durée du flash en frames  




##### Command.event_in_screen?(id)

> Renvoie true si l'évènement référencé par son ID est visible à l'écran, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  




##### Command.event_look_at?(idA, idB, scope, *metric)

> Renvoie true si l'évènement A regarde dans la direction de l'évènement B et que celui ci est dans son périmètre, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de l'évènement A (0 pour héros)  
`idB`|`Fixnum`|ID de l'évènement B (0 pour héros)  
`scope`|`Fixnum`|Nombre de cases ou de pixels  
`*metric`|`Fixnum`|par défaut :square pour en cases, mettre :pixels pour en pixels  




##### Command.event_move_away_from_event(id, target)

> Déplace un événement référencé par son ID d'une case dans la direction opposée à un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement devant effectuer le déplacement  
`target`|`Fixnum`|Id de l'événement cible  




##### Command.event_move_away_from_player(id)

> Déplace un événement référencé par son ID d'une case en direction opposée au héro. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement devant effectuer le déplacement  




##### Command.event_move_away_from_position(id, x, y)

> Déplace un événement référencé par son ID d'une case dans la direction opposée à une coordonnée. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  




##### Command.event_move_backward(id)

> Déplace l'événement référencé par son ID d'une case en arrière. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement devant effectuer le déplacement  




##### Command.event_move_diagonal(id, horizontal, vertical)

> Déplace un événement référencé par son ID d'une case en diagonale. Renvoie true si le mouvement à réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement  
`horizontal`|`Fixnum`|Direction horizontale (4 pour gauche, 6 pour droite)  
`vertical`|`Fixnum`|Direction verticale (2 pour bas, 8 pour haut)  




##### Command.event_move_down(id, *turn_ok)

> Fait bouger l'événement référencé par son ID d'une case vers le bas. Renvoie true si le déplacement s'est effectué, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement  
`*turn_ok`|`Boolean`|En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)  




##### Command.event_move_forward(id)

> Déplace l'événement référencé par son ID d'une case en avant. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement devant effectuer le déplacement  




##### Command.event_move_frequency(ids, f)

> Modifie la fréquence des événements référencés par leurs Id

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|ID des événements  
`f`|`Fixnum`|Fréquence des événements, si aucune priorité n'est donnée, la commande renverra la valeur de la fréquence de l'évènement référencé par son ID  




##### Command.event_move_left(id, *turn_ok)

> Fait bouger l'événement référencé par son ID d'une case vers la gauche. Renvoie true si le déplacement s'est effectué, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement  
`*turn_ok`|`Boolean`|En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)  




##### Command.event_move_lower_left(id)

> Déplacement l'événement référencé par son ID d'une case en diagonale bas-gauche. Renvoie true si le déplacement à réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  




##### Command.event_move_lower_right(id)

> Déplacement l'événement référencé par son ID d'une case en diagonale bas-droite. Renvoie true si le déplacement à réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  




##### Command.event_move_random(id)

> Déplace un événement d' une case aléatoire.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement  




##### Command.event_move_right(id, *turn_ok)

> Fait bouger l'événement référencé par son ID d'une case vers la droite. Renvoie true si le déplacement s'est effectué, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement  
`*turn_ok`|`Boolean`|En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)  




##### Command.event_move_speed(ids, v)

> Modifie la vitesse des événements référencés par leurs Id

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|ID des événements  
`v`|`Fixnum`|Vitesse des événements,si aucune priorité n'est donnée, la commande renverra la valeur de la vitesse de l'évènement référencé par son ID  




##### Command.event_move_speed_frequency(ids, v, f)

> Change la vitesse et la fréquence des événements référencés par leurs ID

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|IDs des événements  
`v`|`Fixnum`|Vitesse des événements  
`f`|`Fixnum`|Fréquence des événements  




##### Command.event_move_straight(id, value, *turn_ok)

> Déplace un événement référencé par son ID d'une case dans une direction. La commande renvoie true ou false si le déplacement a réussi ou non.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement  
`value`|`Fixnum`|Valeur, 2 pour bas, 4 pour gauche, 6 pour droite et 8 pour bas  
`*turn_ok`|`Boolean`|En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)  




##### Command.event_move_toward_event(id, target)

> Déplace un événement référencé par son ID d'une case en direction d'un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement devant effectuer le déplacement  
`target`|`Fixnum`|Id de l'événement cible  




##### Command.event_move_toward_player(id)

> Déplace un événement référencé par son ID d'une case en direction du héro. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement devant effectuer le déplacement  




##### Command.event_move_toward_position(id, x, y)

> Déplace un événement référencé par son ID d'une case en direction d'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  




##### Command.event_move_up(id, *turn_ok)

> Fait bouger l'événement référencé par son ID d'une case vers le haut. Renvoie true si le déplacement s'est effectué, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement  
`*turn_ok`|`Boolean`|En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)  




##### Command.event_move_upper_left(id)

> Déplacement l'événement référencé par son ID d'une case en diagonale haut-gauche. Renvoie true si le déplacement à réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  




##### Command.event_move_upper_right(id)

> Déplacement l'événement référencé par son ID d'une case en diagonale haut-droite. Renvoie true si le déplacement à réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  




##### Command.event_move_with(id, code)

> Applique un déplacement (selon un code) à un événement

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement  
`code`|`Fixnum`|Liste des codes de déplacement  




##### Command.event_moving?(id)

> Renvoie true si l'évènement est en mouvement, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement  




##### Command.event_name(id)

> Renvoie le nom d'un évènement, renvoie nil s' il s'agit du héros

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour le héros)  




##### Command.event_opacity(ids, *value)

> Modifie (ou retourne) l'opacité d'un évènement 

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|Id de l'évènement (ne pas utiliser de selecteur pour renvoyer l'opacité)  
`*value`|`Fixnum`|Valeur de l'opacité, entre 0 et 255. Si aucune valeur n'est donnée, la commande retourne l'opacité de l'évènement ciblé.  




##### Command.event_opaque(id)

> Rend l'évènement référencé par son ID opaque

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement  




##### Command.event_ox(id, *value)

> Modifie (ou retourne) la coordonnée X du point de départ d'un événement (le point d'accroche)

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
`*value`|`Fixnum`|Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante  




##### Command.event_oy(id, *value)

> Modifie (ou retourne) la coordonnée y du point de départ d'un événement (le point d'accroche)

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
`*value`|`Fixnum`|Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante  




##### Command.event_path_length(id, x, y, *wait_flag, *no_through)

> Renvoie la taille du chemin nécéssaire au pathfinder pour se rendre a un point

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'évènement (0 pour le héros)  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`*wait_flag`|`Boolean`|Par défaut, false, cette valeur définit le blocage durant le déplacement ou non  
`*no_through`|`Boolean`|Par défaut, false, si cette valeur vaut true, même en mode fantôme, l'évènement utilisera un chemin passable  




##### Command.event_pixel_x(id)

> Renvoie la coordonnée X de l'évènement référencé par son ID en pixel sur la carte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  




##### Command.event_pixel_y(id)

> Renvoie la coordonnée Y de l'évènement référencé par son ID en pixel sur la carte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  




##### Command.event_priority(ids, priority)

> Change la priorité d'affichage des événements référencés par leurs ID (0: sous le héros, 1: même niveau que le héros, 2: au dessus du héros)

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|ID des événements  
`priority`|`Fixnum`|Priorité d'affichage, si aucune priorité n'est donnée, la commande renverra la valeur de la priorité de l'évènement référencé par son ID  




##### Command.event_restore_origin(id)

> Restore l'origine de l'événement référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  




##### Command.event_screen_x(id)

> Renvoie la coordonnée X de l'évènement référencé par son ID par rapport à l'écran

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  




##### Command.event_screen_y(id)

> Renvoie la coordonnée Y de l'évènement référencé par son ID par rapport à l'écran

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  




##### Command.event_stop_trail(ids)

> Arrête la trainée sur un sélecteur d'évènements

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|Sélecteur d'évènements à qui attribuer une traînée  




##### Command.event_through(id, *flag)

> Change le mode de traversée de l'évènement

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement  
`*flag`|`Boolean`|true pour 'traverse tout', false pour 'ne traverse pas tout', par défaut vaut true   




##### Command.event_through?(id)

> Renvoie true si l'évènement est en mode 'traverse tout', false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement  




##### Command.event_trail(ids, len, *mode)

> Applique une traînée sur un sélecteur d'évènements

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|Sélecteur d'évènements à qui attribuer une traînée  
`len`|`Fixnum`|Taille de la trainée  
`*mode`|`Tone`|Teinte de la trainée (utilisez la commande tone)  




##### Command.event_transfert(id, new_x, new_y)

> Téléporte l'évènement référencé par son ID à une nouvelle coordonnées de la carte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement  
`new_x`|`Fixnum`|Coordonnées X  
`new_y`|`Fixnum`|Coordonnées Y  




##### Command.event_transparent(id)

> Rend l'évènement référencé par son ID transparent

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement  




##### Command.event_transparent?(id)

> Renvoie true si l'évènement est transparent (false sinon)

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement  




##### Command.event_trigger(ids, trigger)

> Change le type de déclenchement des événements référencés par leurs ID (0: touche action, 1: contact du héros, 2: contact de l'event, 3: automatique, 4: processus paralléle).

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|ID des événements  
`trigger`|`Fixnum`|Type de déclenchement, si aucune priorité n'est donnée, la commande renverra la valeur du déclencheur de l'évènement référencé par son ID  




##### Command.event_turn_180(id)

> Fait tourner un événement référencé par son ID de 180°

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  




##### Command.event_turn_90_left(id)

> Fait tourner un événement référencé par son ID de 90° par la gauche

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  




##### Command.event_turn_90_right(id)

> Fait tourner un événement référencé par son ID de 90° par la droite

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  




##### Command.event_turn_90_right_or_left(id)

> Fait tourner un événement référencé par son ID de 90° par la gauche ou par la droite (aléatoirement)

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  




##### Command.event_turn_away_from_event(id, target)

> Tourne un événement référencé par son ID d'une case dans la direction opposée à un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement devant effectuer le déplacement  
`target`|`Fixnum`|Id de l'événement cible  




##### Command.event_turn_away_from_player(id)

> Tourne un événement référencé par son ID d'une case en direction opposée au héro. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement devant effectuer le déplacement  




##### Command.event_turn_away_from_position(id, x, y)

> Tourne un événement référencé par son ID d'une case dans la direction opposée à une coordonnée. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  




##### Command.event_turn_down(id)

> Fait tourner un événement vers le bas

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  




##### Command.event_turn_left(id)

> Fait tourner un événement à gauche

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  




##### Command.event_turn_random(id)

> Fait tourner un événement référencé par son ID dans une direction aléatoire

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  




##### Command.event_turn_right(id)

> Fait tourner un événement à droite

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  




##### Command.event_turn_toward_event(id, target)

> Tourne un événement référencé par son ID d'une case en direction d'un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement devant effectuer le déplacement  
`target`|`Fixnum`|Id de l'événement cible  




##### Command.event_turn_toward_player(id)

> Tourne un événement référencé par son ID d'une case en direction du héro. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement devant effectuer le déplacement  




##### Command.event_turn_toward_position(id, x, y)

> Tourne un événement référencé par son ID d'une case en direction d'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  




##### Command.event_turn_up(id)

> Fait tourner un événement vers le bas

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  




##### Command.event_x(id)

> Renvoie la coordonnées X de la case sur laquelle se trouve l'évènement référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  




##### Command.event_y(id)

> Renvoie la coordonnée Y de la case sur laquelle se trouve l'évènement référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  




##### Command.event_zoom(id, value)

> Modifie le zoom d'un événement

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
`value`|`Fixnum`|Valeur du zoom  




##### Command.event_zoom_x(id, *value)

> Modifie (ou retourne) la valeur du zoom horizontal d'un événement

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
`*value`|`Fixnum`|Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante  




##### Command.event_zoom_y(id, *value)

> Modifie (ou retourne) la valeur du zoom vertical d'un événement

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
`*value`|`Fixnum`|Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante  




##### Command.events_buzz(e, *duration)

> Fait tressaillir les évènements

  
Nom|Type|Description  
--- | --- | ---  
`e`|`Selector`|Selecteur d'évènements  
`*duration`|`Fixnum`|Durée du dressaillement (en frames), par défaut, 16  




##### Command.events_buzzer_properties(e, amplitude, length)

> Change les propriétés de tressaillement d'évènements

  
Nom|Type|Description  
--- | --- | ---  
`e`|`Selector`|Selecteurs d'évènements  
`amplitude`|`ArgType`|Amplitude du tressaillement  
`length`|`Fixnum`|Taille du tressaillement  




##### Command.events_collide?(idA, idB)

> Renvoie true si l'evenement A est en collision avec l'évènement B, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de l'évènement A (0 pour héros)  
`idB`|`Fixnum`|ID de l'évènement B (0 pour héros)  




##### Command.fadein(*time)

> Affiche l'écran en fondu

  
Nom|Type|Description  
--- | --- | ---  
`*time`|`Fixnum`|Durée de la transition  




##### Command.fadeout(*time)

> Fondu noir (et sonore) du jeu pendant la durée passée en argument

  
Nom|Type|Description  
--- | --- | ---  
`*time`|`Fixnum`|Durée de fondu  




##### Command.flash_rect(x, y, width, height, color)

> Fait clignoter un rectangle de cases

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`width`|`Fixnum`|Largeur du rectangle  
`height`|`Fixnum`|Largeur du rectangle  
`color`|`Color`|Couleur du flash (utilisez la commande color)  




##### Command.flash_square(x, y, color)

> Fait clignoter une case selon une couleur

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`color`|`Color`|Couleur du flash (utilisez la commande color)  




##### Command.followers_buzz(ids, *duration)

> Fait tressaillir les suiveurs (followers_buzz([1,2,3], *duration), par exemple, si la liste des suiveurs n'est pas renseignée, ça s'applique à tous les followers)

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|Tableau des identifiants des suiveurs à faire tressaillir, utiliser [] pour appliquer à tous les suiveurs  
`*duration`|`Fixnum`|Durée du dressaillement (en frame), par défaut, 16  




##### Command.followers_buzzer_properties(*ids, amplitude, length)

> Change les propriétés de tressaillement des membres de la chenille (followers_buzzer_properties(0,1,2,3, amplitude, length))

  
Nom|Type|Description  
--- | --- | ---  
`*ids`|`ArgsList`|Liste des positions des suiveurs. Si cet argument est occulté, ces paramètres s'appliquent à tous les suiveurs.  
`amplitude`|`ArgType`|Amplitude du tressaillement  
`length`|`Fixnum`|Taille du tressaillement  




##### Command.fresh_event_id(*erased)

> Renvoie un ID libre (utile en cas d'invocation d'évènement)

  
Nom|Type|Description  
--- | --- | ---  
`*erased`|`Boolean`|Si cette valeur vaut true, la commande renverra le plus petit ID d'un événement supprimé  




##### Command.gain_gold(amount)

> Fait gagner de l'argent à l'équipe

  
Nom|Type|Description  
--- | --- | ---  
`amount`|`o`|T  




##### Command.game_title

> Renvoie le titre du jeu

  




##### Command.game_window_rect

> Renvoie le rectangle correspondant à la fenêtre de jeu

  




##### Command.get(array, index)

> Renvoie la cellule à la valeur donnée d'un tableau

  
Nom|Type|Description  
--- | --- | ---  
`array`|`Array`|Tableau  
`index`|`Fixnum`|Index à trouver  


Exemple  
```ruby  
Command.get([0, 1, 2, 17], 2) # Renvoie 2 (parce que c'est la deuxième cellule et que l'indexation des tableaux commence à 0)  
```



##### Command.get_random_square(*region_id)

> Renvoie un point aléatoire sur la carte, dont la région est référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`*region_id`|`Fixnum`|L'id de la région dans laquelle chercher une case aléatoire. Par défaut, elle vaut 0  




##### Command.get_squares_by_region(region_id)

> Renvoie un tableau de cases pour une région donnée.

  
Nom|Type|Description  
--- | --- | ---  
`region_id`|`Fixnum`|l'ID de la région (entre 0 et 63)  




##### Command.get_squares_by_terrain(terrain_tag)

> Renvoie un tableau de cases pour un terrain_tag donné donnée.

  
Nom|Type|Description  
--- | --- | ---  
`terrain_tag`|`Fixnum`|Le terrain tag (entre 0 et 7)  




##### Command.get_squares_by_tile(layer, tile_id)

> Renvoie un tableau de cases pour un tile (et une couche) donnés.

  
Nom|Type|Description  
--- | --- | ---  
`layer`|`Fixnum`|La couche (entre 0 et 2)  
`tile_id`|`Fixnum`|L'ID du tile  




##### Command.get_tileset_id

> Renvoie l' ID du tileset de la carte en cours

  




##### Command.give_armor(id, amount, *include_equipement)

> Fait gagner à l'équipe l'armure référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  
`amount`|`Fixnum`|Nombre à donner. Si le nombre est négatif, l'objet sera retiré  
`*include_equipement`|`Boolean`|Ce paramètre n'est utile que si on supprime des objets (ammount négatif). Si cette variable vaut true, les objets équipés seront déséquipés si l'inventaire n'en possède pas assez. Par défaut, il vaut false. Donc pas de déséquipement  




##### Command.give_item(id, amount)

> Fait gagner à l'équipe l'objet référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  
`amount`|`Fixnum`|Nombre à donner. Si le nombre est négatif, l'objet sera retiré  




##### Command.give_weapon(id, amount, *include_equipement)

> Fait gagner à l'équipe l'arme référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  
`amount`|`Fixnum`|Nombre à donner. Si le nombre est négatif, l'objet sera retiré  
`*include_equipement`|`Boolean`|Ce paramètre n'est utile que si on supprime des objets (ammount négatif). Si cette variable vaut true, les objets équipés seront déséquipés si l'inventaire n'en possède pas assez. Par défaut, il vaut false. Donc pas de déséquipement  




##### Command.gold

> Renvoie l'argent possédé

  




##### Command.ground?(x, y)

> Renvoie true si les coordonnées sont sur le sol, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  




##### Command.has_armor?(id, *include_equipement)

> Renvoie true si l'armure référencée par son ID est possédée par l'équipe, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  
`*include_equipement`|`Boolean`|Si ce paramètre vaut true, la commande prend en compte l'équipement, sinon (false), elle ne le prend pas en compte (par défaut: false)  




##### Command.has_item?(id)

> Renvoie true si l'objet référencé par son ID est possédé par l'équipe, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.has_prefix?(string, prefix)

> Renvoie true si une chaine à le préfix donné, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`string`|`String`|La chaine de caractère à vérifier  
`prefix`|`String`|Le préfix devant être contenu dans la chaine  




##### Command.has_substring?(string, substring)

> Renvoie true si une chaine contient une autre chaine donnée, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`string`|`String`|La chaine de caractère à vérifier  
`substring`|`String`|La chaine devant être contenue dans la chaine  




##### Command.has_suffix?(string, suffix)

> Renvoie true si une chaine à le suffix donné, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`string`|`String`|La chaine de caractère à vérifier  
`suffix`|`String`|Le suffix devant être contenu dans la chaine  




##### Command.has_weapon?(id, *include_equipement)

> Renvoie true si l'arme référencée par son ID est possédée par l'équipe, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  
`*include_equipement`|`Boolean`|Si ce paramètre vaut true, la commande prend en compte l'équipement, sinon (false), elle ne le prend pas en compte (par défaut: false)  




##### Command.hypot(x, y)

> Renvoie l'hypothénuse de x et y

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  
`y`|`Numeric`|Valeur numérique  




##### Command.id_at(x, y)

> Renvoie l'ID de l'évènement pointé par les coordonnées X,Y (0 si c'est le héros, -1 s'il n'y en a pas)

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  




##### Command.import_label(index, idlabel)

> Renvoie la valeur d'un label issu d'une autre sauvegarde

  
Nom|Type|Description  
--- | --- | ---  
`index`|`Fixnum`|Numéro de la sauvegarde  
`idlabel`|`Fixnum`|Identifiant du label  




##### Command.import_switch(index, idswitch)

> Renvoie la valeur d'un interrupteur issu d'une autre sauvegarde

  
Nom|Type|Description  
--- | --- | ---  
`index`|`Fixnum`|Numéro de la sauvegarde  
`idswitch`|`Fixnum`|Numéro de l'interrupteur  




##### Command.import_variable(index, idvar)

> Renvoie la valeur d'une variable issue d'une autre sauvegarde

  
Nom|Type|Description  
--- | --- | ---  
`index`|`Fixnum`|Numéro de la sauvegarde  
`idvar`|`Fixnum`|Numéro de la variable  




##### Command.in_area?(area, x, y)

> Vérifie si le point référencé par X, Y est inscrit dans la zone passée en argument

  
Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  
`x`|`Fixnum`|Coordonnée X du point  
`y`|`ArgType`|Coordonnée Y du point  




##### Command.include_page(map_id, event_id, page_id, *runnable, *context)

> Invoque une page (comme s'il s'agissait d'un évènement commun) d'un autre évènement

  
Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à inclure  
`event_id`|`Fixnum`|ID de l'évènement où chercher la page à inclure  
`page_id`|`Fixnum`|ID de la page à inclure  
`*runnable`|`Boolean`|Par défaut, cette variable a pour valeur `false`. Si elle vaut `true`, la page ne sera incluse que si la condition de lancement de la page est respectée. Par défaut, elle utilise le contexte (les interrupteurs locaux) de l'évènement appelant.  
`*context`|`Boolean`|Par défaut, cette variable a pour valeur `false`. Si `runnable` et `context` valent `true`, la condition de lancement de la page utilisera le contexte (les interrupteurs locaux) de l'évènement d'origine à la place de celui de l'évènement appelant.  




##### Command.invoke_event(map_id, event_id, new_id, *x, *y)

> Invoque un évènement d'une autre map (ou de la même) sur la carte

  
Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à invoquer  
`event_id`|`Fixnum`|ID de l'évènement à invoquer  
`new_id`|`Fixnum`|Nouvel ID de l'évènement fraîchement invoqué  
`*x`|`Fixnum`|Position X où placer l'évènement invoqué, par défaut, conserve la valeur de l'évènement invoqué  
`*y`|`Fixnum`|Position Y où placer l'évènement invoqué, par défaut conserve la valeur de l'évènement invoqué  




##### Command.is_key_item?(id)

> Renvoie true si l'objet référencé par son ID est un objet clé, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_always_usable?(id)

> Renvoie true si l'objet référencé par son ID est utilisable partout

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_battle_usable?(id)

> Renvoie true si l'objet référencé par son ID est utilisable en combat seulement 

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_certain?(id)

> Renvoie true si un objet référencé par son ID a une garantie de réussite totale, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_consumable?(id)

> Renvoie true si l'objet référencé par son ID est consommable, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_count(id)

> Renvoie le nombre d'objets (référencés par un ID) possédés par l'équipe

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet à compter  




##### Command.item_description(id)

> Renvoie la description de l'objet référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_for_all?(id)

> Renvoie true si l'objet référencé par son ID cible tout un groupe (tous les alliés ou tous les ennemis), false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_for_all_allies?(id)

> Renvoie true si l'objet référencé par son ID cible tous les alliés vivants, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_for_all_dead_allies?(id)

> Renvoie true si l'objet référencé par son ID cible tous les alliés morts, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_for_all_enemies?(id)

> Renvoie true si l'objet référencé par son ID cible tous les ennemis, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_for_caller?(id)

> Renvoie true si l'objet référencé par son ID est utilisable sur le personnage du moment, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_for_dead_friend?(id)

> Renvoie true si l'objet référencé par son ID cible un (ou les) allié(s) mort(s), false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_for_four_random_enemies?(id)

> Renvoie true si l'objet référencé par son ID cible quatre ennemis au hasard, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_for_friend?(id)

> Renvoie true si la cible de l'objet référencé par son ID est du côté allié, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_for_one?(id)

> Renvoie true si l'objet référencé par son ID a une seule cible, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_for_one_ally?(id)

> Renvoie true si l'objet référencé par son ID cible un allié vivant, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_for_one_dead_ally?(id)

> Renvoie true si l'objet référencé par son ID cible un allié mort, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_for_one_enemy?(id)

> Renvoie true si l'objet référencé par son ID cible un ennemi, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_for_one_random_enemy?(id)

> Renvoie true si l'objet référencé par son ID cible un ennemi au hasard, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_for_opponent?(id)

> Renvoie true si l'objet référencé par son ID cible les ennemis, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_for_random?(id)

> Renvoie true si l'objet référencé par son ID cible aléatoirement, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_for_three_random_enemies?(id)

> Renvoie true si l'objet référencé par son ID cible trois ennemis au hasard, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_for_two_random_enemies?(id)

> Renvoie true si l'objet référencé par son ID cible deux ennemis au hasard, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_has_no_scope?(id)

> Renvoie true si l'objet référencé par son ID ne cible personne, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_icon(id)

> Renvoie l'index de l'icone de l'objet référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_magical?(id)

> Renvoie true si un objet référencé par son ID endommage les PM, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_menu_usable?(id)

> Renvoie true si l'objet référencé par son ID est utilisable dans le menu seulement

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_name(id)

> Renvoie le nom de l'objet référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_nb_hits(id)

> Renvoie le nombre de coups portés par l'objet référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_need_selection?(id)

> Renvoie true si un objet référencé par son ID requiert la sélection d'une cible, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_never_usable?(id)

> Renvoie true si l'objet référencé par son ID n'est jamais utilisable

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_note(id)

> Renvoie le commentaire de l'objet référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_number_of_targets(id)

> Renvoie le nombre de cibles d'un objet référencé par son ID, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_occasion(id)

> Renvoie un entier correspondant au droit d'utilisation de l'objet

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_physical?(id)

> Renvoie true si un objet référencé par son ID endommage les PV, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_price(id)

> Renvoie le prix de l'objet référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_scope(id)

> Renvoie la portée (en Entier) d'un objet référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  




##### Command.item_speed(id)

> Renvoie l'apport de vitesse de l'objet référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_success_rate(id)

> Renvoie la probabilité de succès de l'objet référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.item_tp_gain(id)

> Renvoie le gain de TP que l'objet référencé par son ID apporte une fois utilisé en combat

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.items_possessed

> Renvoie la liste des objets possédés

  




##### Command.jump_to(id, x, y, *wait_flag)

> Déplace l'évènement, en sautant, référencé par son ID (0 pour le héros) vers les coordonnées données en argument

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'évènement (0 pour le héros)  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`*wait_flag`|`Boolean`|Par défaut, false, cette valeur définit le blocage durant le déplacement ou non  




##### Command.key_current(method)

> Renvoie la touche activée selon la méthode passée en argument, nil si aucune touche n'est activée

  
Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthode d'activation (:press?, :release?, :trigger? etc.)  




##### Command.key_current_rgss(method)

> Renvoie la touche du RGSS (:X, :A, :B, :C etc.) activée selon la méthode passée en argument, nil si aucune touche n'est activée

  
Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthode d'activation (:press?, :release?, :trigger? etc.)  




##### Command.key_press?(key)

> Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  




##### Command.key_release?(key)

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être relâchée, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  




##### Command.key_repeat?(key)

> Renvoie true si la touche passée en argument (cf:attributs) est appuyée de manière répétée, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  




##### Command.key_time(key)

> Renvoie, en nombre de frames, le temps de pression d'une touche de clavier choisie

  
Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche à vérifier  




##### Command.key_trigger?(key)

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être pressée, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  




##### Command.keyboard_all?(method, keys)

> Renvoie true si toutes les touches passées à keys sont activées selon la méthode passée à method

  
Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthode pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.  
`keys`|`Argslist`|Liste des touches qui doivent être activées selon la méthode  




##### Command.keyboard_any?(method, keys)

> Renvoie true si  au moins une touche passée à keys est activée selon la méthode passée à method

  
Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthode pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.  
`keys`|`Argslist`|Liste des touches qui doivent être activée selon la méthode, si rien n'est passé, toutes les touches sont prises en compte  




##### Command.keyboard_current_char

> Renvoie le caractère actuel pressé par le clavier

  




##### Command.keyboard_current_digit

> Renvoie le chiffre actuel pressé par le clavier

  




##### Command.last_clicked_event

> Renvoie le dernier event cliqué par la souris, nil si aucun évènement n'a été cliqué

  




##### Command.last_hovered_event

> Renvoie le dernier event survolé par la souris, nil si aucun évènement n'a été survolé

  




##### Command.last_pressed_event

> Renvoie le dernier event pressé (avec :mouse_left) par la souris, nil si aucun évènement n'a été pressé

  




##### Command.last_released_event

> Renvoie le dernier event relâché (avec mouse_left) par la souris, nil si aucun évènement n'a été relâché

  




##### Command.last_repeated_event

> Renvoie le dernier event cliqué en continu (avec :mouse_left) par la souris, nil si aucun évènement n'a été cliqué en continu

  




##### Command.last_triggered_event

> Renvoie le dernier event appuyé une fois (avec :mouse_left) par la souris, nil si aucun évènement n'a été triggeré

  




##### Command.length(array)

> Renvoie la taille d'un tableau

  
Nom|Type|Description  
--- | --- | ---  
`array`|`Array`|Tableau dont il faut renvoyer la taille  




##### Command.load_game(index, *time)

> Charge la partie référencée par l'ID de sauvegarde donné

  
Nom|Type|Description  
--- | --- | ---  
`index`|`Fixnum`|Numéro de la sauvegarde  
`*time`|`Fixnum`|Durée du fadeout  




##### Command.lose_gold(amount)

> Fait perdre de l'argent à l'équipe

  
Nom|Type|Description  
--- | --- | ---  
`amount`|`o`|T  




##### Command.mantissa(x)

> Renvoi la partie flottante d'un nombre à virgule

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Float`|Nombre à virgule  




##### Command.map_height

> Retourne la hauteur de la carte

  




##### Command.map_id

> Renvoie l'ID de la map en cours. Idéalement, utiliser c(:map_id) qui est plus sur!

  




##### Command.map_name

> Renvoie le nom de la map en cours

  




##### Command.map_width

> Retourne la largeur de la carte

  




##### Command.max(a, b)

> Renvoie la plus grande des deux valeurs A, B

  
Nom|Type|Description  
--- | --- | ---  
`a`|`Object`|Valeur de A  
`b`|`Object`|Valeur de B  




##### Command.max_event_id

> Renvoie le plus grand ID d'évènement occupé sur la carte

  




##### Command.me_fade(wait, *frame)

> Arrêt en fondu du ME en cours

  
Nom|Type|Description  
--- | --- | ---  
`wait`|`Fixnum`|Temps du fondu, par défaut en secondes  
`*frame`|`Boolean`|Spécifiez 'true' si vous renseignez un temps en frames plutôt qu'en secondes  




##### Command.me_play(name, *volume, *pitch)

> Joue un ME

  
Nom|Type|Description  
--- | --- | ---  
`name`|`String`|Nom du ME  
`*volume`|`Fixnum`|Volume du ME. Pourcentage entre 0 et 100. Par défaut : 100  
`*pitch`|`Fixnum`|Vitesse du ME. Pourcentage entre 1 et 453. Par défaut : 100  




##### Command.me_stop

> Stoppe le ME en cours

  




##### Command.message(value, *face_name, *face_index, *position, *background)

> Affiche un message à l'écran

  
Nom|Type|Description  
--- | --- | ---  
`value`|`String`|Message à afficer  
`*face_name`|`String`|Nom du faceset (peut être remplacé par nil pour ne pas en afficher), il faut utiliser \n pour afficher plusieurs lignes  
`*face_index`|`Fixnum`|Index du faceset (ne sert à rien si aucun faceset n'est donnée)  
`*position`|`Fixnum`|Position de la fenêtre de message (0 = en haut, 1 au centre, 2 en bas), par défaut vaut 2  
`*background`|`Fixnum`|Fond du message, 0 normal, 1 sombre, 2 transparent  




##### Command.message_height(n)

> Change le nombre de lignes affichées dans les messages (Commande Event Afficher message)

  
Nom|Type|Description  
--- | --- | ---  
`n`|`Fixnum`|Nombre de lignes visibles  




##### Command.min(a, b)

> Renvoie la plus petite des deux valeurs A, B

  
Nom|Type|Description  
--- | --- | ---  
`a`|`Object`|Valeur de A  
`b`|`Object`|Valeur de B  




##### Command.monster_agility(id)

> renvoie l'agilité d'un ennemi référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  




##### Command.monster_attack_power(id)

> renvoie les points d'attaque d'un ennemi référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  




##### Command.monster_battler_height(position)

> renvoie la largeur du battler de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.monster_battler_hue(id)

> renvoie la teinte d'un ennemi référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  




##### Command.monster_battler_name(id)

> renvoie le nom du fichier battler d'un ennemi référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  




##### Command.monster_battler_width(position)

> renvoie la largeur du battler de l'ennemi en combat référencé par sa position en combat

  
Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  




##### Command.monster_defense_power(id)

> renvoie les points de défense d'un ennemi référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  




##### Command.monster_description(id)

> renvoie la description d'un ennemi référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  




##### Command.monster_give_exp(id)

> renvoie l'experience donnée par un ennemi référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  




##### Command.monster_give_gold(id)

> renvoie l'or donné par un ennemi référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  




##### Command.monster_icon(id)

> renvoie l'icone index d'un ennemi référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  




##### Command.monster_luck(id)

> renvoie la chance d'un ennemi référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  




##### Command.monster_magic_attack_power(id)

> renvoie les points d'attaque magique d'un ennemi référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  




##### Command.monster_magic_defense_power(id)

> renvoie les points de défense magique d'un ennemi référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  




##### Command.monster_max_hp(id)

> renvoie le maximum de points de vie d'un ennemi référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  




##### Command.monster_max_mp(id)

> renvoie le maximum de points de magie d'un ennemi référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  




##### Command.monster_name(id)

> renvoie le nom d'un ennemi référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  




##### Command.monster_note(id)

> renvoie la note/commentaire d'un ennemi référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  




##### Command.mouse_all?(method, keys)

> Renvoie true si toutes les touches passées à keys sont activées selon la méthode passée à method

  
Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.  
`keys`|`Argslist`|Liste des touches qui doivent être activées selon la méthode  




##### Command.mouse_any?(method, keys)

> Renvoie true si au moins une touche passée à keys est activée selon la méthode passée à method

  
Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthode pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.  
`keys`|`Argslist`|Liste des touches qui doivent être activée selon la méthode, si rien n'est passé, toutes les touches sont prises en compte  




##### Command.mouse_click?

> Renvoie true lorsqu'on effectue un clic gauche

  




##### Command.mouse_click_area?(area)

> Renvoie true si la souris survole et clique sur la zone passée en argument au moment de l'appel, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  




##### Command.mouse_click_event?(events, *precise)

> Renvoie true si la souris clique sur un évènement du sélecteur passé en argument

  
Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*precise`|`Boolean`|Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut false   




##### Command.mouse_click_player?

> Renvoie true si la souris clique sur l'image du joueur

  




##### Command.mouse_click_square_area?(area, *key)

> Renvoie true si la souris survole et clique sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en cases et non en pixels, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  
`*key`|`Symbol`|Touche à vérifier (par défaut, :mouse_left)  




##### Command.mouse_current_key(method)

> Renvoie la touche activée selon la méthode passée en argument, nil si aucune touche n'est activée

  
Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthode d'activation (:press?, :release?, :trigger? etc.)  




##### Command.mouse_dragging?

> Renvoie true si la souris est en train de sélectionner (cliquer/glisser) à l'écran

  




##### Command.mouse_hover_area?(area)

> Renvoie true si la souris survole la zone passée en argument au moment de l'appel, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  




##### Command.mouse_hover_event?(events, *precise)

> Renvoie true si la souris survole un évènement du sélecteur passé en argument

  
Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*precise`|`Boolean`|Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut true   




##### Command.mouse_hover_player?

> Renvoie true si la souris survole l'image du joueur

  




##### Command.mouse_hover_square_area?(area)

> Renvoie true si la souris survole la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en cases et non en pixels, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  




##### Command.mouse_in?(rectangle)

> Renvoie true si la souris se trouve dans le rectangle passé en argument

  
Nom|Type|Description  
--- | --- | ---  
`rectangle`|`Rect`|Rectangle à vérifier  




##### Command.mouse_last_rect

> Renvoie le dernier rectangle de sélection de la souris effectué

  




##### Command.mouse_point

> Renvoie un point (possédant les attributs x, y) référençant la position de la souris en pixels par rapport à l'écran

  




##### Command.mouse_press?(key)

> Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  




##### Command.mouse_press_area?(area, *key)

> Renvoie true si la souris survole et clique en continu sur la zone passée en argument au moment de l'appel, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  
`*key`|`Symbol`|Touche à vérifier (par défaut, :mouse_left)  




##### Command.mouse_press_event?(events, *key, *precise)

> Renvoie true si la souris reste pressée sur un évènement du sélecteur passé en argument

  
Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Symbol`|Touche à presser (par défaut, la touche est :mouse_left)  
`*precise`|`Boolean`|Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut false   




##### Command.mouse_press_player?(*key)

> Renvoie true si la souris presse en continu la touche passée en argument sur le joueur

  
Nom|Type|Description  
--- | --- | ---  
`*key`|`ArgType`|Touche à presser (par défaut, la touche est :mouse_left)  




##### Command.mouse_press_square_area?(area, *key)

> Renvoie true si la souris survole et clique en continu sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en cases et non en pixels, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  
`*key`|`Symbol`|Touche à vérifier (par défaut, :mouse_left)  




##### Command.mouse_rect

> Renvoie le rectangle de sélection de la souris (tracé en cours)

  




##### Command.mouse_release?(key)

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être relâchée, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  




##### Command.mouse_release_area?(area, *key)

> Renvoie true si la souris survole et est relâchée sur la zone passée en argument au moment de l'appel, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  
`*key`|`Symbol`|Touche à vérifier (par défaut, :mouse_left)  




##### Command.mouse_release_event?(events, *key, *precise)

> Renvoie true si la souris est relâchée sur un évènement du sélecteur passé en argument

  
Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Symbol`|Touche à presser (par défaut, la touche est :mouse_left)  
`*precise`|`Boolean`|Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut false   




##### Command.mouse_release_player?(*key)

> Renvoie true si la souris relâche la touche passée en argument sur le joueur

  
Nom|Type|Description  
--- | --- | ---  
`*key`|`ArgType`|Touche à presser (par défaut, la touche est :mouse_left)  




##### Command.mouse_release_square_area?(area, *key)

> Renvoie true si la souris survole et est relâchée sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en cases et non en pixels, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  
`*key`|`Symbol`|Touche à vérifier (par défaut, :mouse_left)  




##### Command.mouse_repeat?(key)

> Renvoie true si la touche passée en argument (cf:attributs) est appuyée de manière répétée, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  




##### Command.mouse_repeat_area?(area, *key)

> Renvoie true si la souris survole et pressée de manière répétée sur la zone passée en argument au moment de l'appel, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  
`*key`|`Symbol`|Touche à vérifier (par défaut, :mouse_left)  




##### Command.mouse_repeat_event?(events, *key, *precise)

> Renvoie true si la souris clique de manière répétée un évènement du sélecteur passé en argument

  
Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Symbol`|Touche à presser (par défaut, la touche est :mouse_left)  
`*precise`|`Boolean`|Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut false   




##### Command.mouse_repeat_player?(*key)

> Renvoie true si la souris appuie de manière répétée sur la touche passée en argument sur l'image du joueur

  
Nom|Type|Description  
--- | --- | ---  
`*key`|`ArgType`|Touche à presser (par défaut, la touche est :mouse_left)  




##### Command.mouse_repeat_square_area?(area, *key)

> Renvoie true si la souris survole et est pressée de manière répétée sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en cases et non en pixels, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  
`*key`|`Symbol`|Touche à vérifier (par défaut, :mouse_left)  




##### Command.mouse_square_x

> Renvoie la position (en cases) X de la souris

  




##### Command.mouse_square_y

> Renvoie la position (en cases) Y de la souris

  




##### Command.mouse_trigger?(key)

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être pressée, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  




##### Command.mouse_trigger_area?(area, *key)

> Renvoie true si la souris survole et clique une fois sur la zone passée en argument au moment de l'appel, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  
`*key`|`Symbol`|Touche à vérifier (par défaut, :mouse_left)  




##### Command.mouse_trigger_event?(events, *key, *precise)

> Renvoie true si la souris vient de cliquer un évènement du sélecteur passé en argument

  
Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Symbol`|Touche à presser (par défaut, la touche est :mouse_left)  
`*precise`|`Boolean`|Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut false   




##### Command.mouse_trigger_player?(*key)

> Renvoie true si la souris appuie une fois la touche passée en argument sur le joueur

  
Nom|Type|Description  
--- | --- | ---  
`*key`|`ArgType`|Touche à presser (par défaut, la touche est :mouse_left)  




##### Command.mouse_trigger_square_area?(area, *key)

> Renvoie true si la souris survole et clique une fois sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en cases et non en pixels, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  
`*key`|`Symbol`|Touche à vérifier (par défaut, :mouse_left)  




##### Command.mouse_x

> Renvoie la position (en pixels) X de la souris

  




##### Command.mouse_y

> Renvoie la position (en pixels) Y de la souris

  




##### Command.move_to(id, x, y, *wait_flag, *no_throug)

> Déplace l'évènement référencé par son ID (0 pour le héros) vers les coordonnées données en argument

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'évènement (0 pour le héros)  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`*wait_flag`|`Boolean`|Par défaut, false, cette valeur définit le blocage durant le déplacement ou non  
`*no_throug`|`Boolean`|Par défaut, false, si cette valeur vaut true, même en mode fantôme, l'évènement utilisera un chemin passable  




##### Command.num_lock?

> Renvoie true si le clavier est en mode NUM_LOCK au moment de l'appel, false sinon

  




##### Command.open_window(id)

> Ouvre la fenêtre référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  




##### Command.pad360_plugged?(*id)

> Renvoie true si une manette est branchée dans le port référencé par son ID, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`*id`|`Fixnum`|Port de la manette, par défaut 0, soit la première manette branchée  




##### Command.pad360_stop_vibration(*id)

> Arrête la vibration des deux moteurs de la manette référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`*id`|`Fixnum`|Port de la manette, par défaut 0, soit la première manette branchée  




##### Command.pad360_stop_vibration_left(*id)

> Arrête la vibration du moteur gauche de la manette référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`*id`|`Fixnum`|Port de la manette, par défaut 0, soit la première manette branchée  




##### Command.pad360_stop_vibration_right(*id)

> Arrête la vibration du moteur droit de la manette référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`*id`|`Fixnum`|Port de la manette, par défaut 0, soit la première manette branchée  




##### Command.pad360_vibrate(*id, *left, *right)

> Fait vibrer la manette référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`*id`|`Fixnum`|Port de la manette, par défaut 0, soit la première manette branchée  
`*left`|`Fixnum`|Force dans le moteur gauche, par défaut, 100  
`*right`|`Fixnum`|Force dans le moteur droit, par défaut, 100  




##### Command.pad360_vibrate_left(*id, *s)

> Fait vibrer le moteur gauche de la manette référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`*id`|`Fixnum`|Port de la manette, par défaut 0, soit la première manette branchée  
`*s`|`Fixnum`|Force de la vibration, par défaut, 100  




##### Command.pad360_vibrate_right(*id, *s)

> Fait vibrer le moteur droit de la manette référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`*id`|`Fixnum`|Port de la manette, par défaut 0, soit la première manette branchée  
`*s`|`Fixnum`|Force de la vibration, par défaut, 100  




##### Command.page_runnable?(map_id, event_id, page_id, *context)

> Vérifie si la page est exécutable dans le contexte de l'évènement appelant.

  
Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à tester  
`event_id`|`Fixnum`|ID de l'évènement où chercher la page à tester  
`page_id`|`Fixnum`|ID de la page à tester  
`*context`|`Boolean`|Par défaut, cette variable a pour valeur `false`. Si elle vaut `true`, la condition de lancement de la page utilisera le contexte (les interrupteurs locaux) de l'évènement d'origine à la place de celui de l'évènement appelant.  




##### Command.parallax_autoscroll(id, speed_x, *duration, *wait_flag)

> Défilement horizontal et vertical automatique d'un panorama

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`speed_x`|`Fixnum`|Vitesse de défilement vertical  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  




##### Command.parallax_autoscroll_x(id, speed, *duration, *wait_flag, *ease)

> Défilement horizontal automatique d'un panorama

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`speed`|`Fixnum`|Vitesse de défilement  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.parallax_autoscroll_y(id, speed, *duration, *wait_flag, *ease)

> Défilement vertical automatique d'un panorama

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`speed`|`Fixnum`|Vitesse de défilement  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.parallax_blend(id, blend_type)

> Change le mode de fusion d'un panorama

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`blend_type`|`Fixnum`|mode de fusion (0 => normal, 1 => Addition, 2 => Soustraction)  




##### Command.parallax_erase(id)

> Supprime un panorama

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  




##### Command.parallax_opacity(id, opacity, *duration, *wait_flag, *ease)

> Change l'opacité d'un panorama

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`opacity`|`Fixnum`|valeur de l'opacité (0 à 255)  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.parallax_scroll(id, x, y)

> Change la vitesse de défilement d' un panorama référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du panorama  
`x`|`Fixnum`|vitesse horizontale  
`y`|`Fixnum`|vitesse verticale  




##### Command.parallax_scroll_x(id, speed)

> Défilement horizontal d'un panorama par rapport au défilement de la carte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`speed`|`Fixnum`|Vitesse de défilement  




##### Command.parallax_scroll_y(id, speed)

> Défilement vertical d'un panorama par rapport au défilement de la carte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`speed`|`Fixnum`|Vitesse de défilement  




##### Command.parallax_show(id, name, *z, *opacity, *auto_x, *auto_y, *scroll_x, *scroll_y, *blend_type, *zoom_x, *zoom_y, *tone)

> Affiche un panorama

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`name`|`String`|Nom du panorama  
`*z`|`Fixnum`|Axe Z (par défaut - 100)  
`*opacity`|`Fixnum`|Opacité, entre 0 et 255. (par défaut 255)  
`*auto_x`|`Fixnum`|Défilement automatique horizontal (par défaut 0, ne défile pas)  
`*auto_y`|`Fixnum`|Défilement automatique vertical (par défaut 0, ne défile pas)  
`*scroll_x`|`Fixnum`|Défilement horizontal (par défaut 2, à la même vitesse que la carte. 1 = vitesse du panorama de VXace)  
`*scroll_y`|`Fixnum`|Défilement vertical (par défaut 2, à la même vitesse que la carte. 1 = vitesse du panorama de VXace)  
`*blend_type`|`Fixnum`|Mode de fusion (par défaut 0), mode normal  
`*zoom_x`|`Fixnum`|Zoom horizontal (par défaut 100)  
`*zoom_y`|`Fixnum`|Zoom vertical (par défaut 100)  
`*tone`|`Tone`|Teinte, utilisez la commande tone (rubrique Standard), par défaut aucun changement de teinte  




##### Command.parallax_tone(id, tone, *duration, *wait_flag, *ease)

> Change la teinte d'un panorama

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`tone`|`Tone`|teinte du panorama (utilisez la commande tone des commandes standards)  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.parallax_transform(id, duration, *wait_flag, *zoom_x, *zoom_y, *opacity, *tone, *ease)

> Transforme un panorama durant une période

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`duration`|`Fixnum`|Durée en frame du déplacement  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut false  
`*zoom_x`|`Fixnum`|Zoom horizontal (par défaut 100)  
`*zoom_y`|`Fixnum`|Zoom vertical (par défaut 100)  
`*opacity`|`Fixnum`|Opacité, entre 0 et 255. (par défaut 255)  
`*tone`|`Tone`|Teinte, utilisez la commande tone (rubrique Standard), par défaut aucun changement de teinte  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.parallax_z(id, z)

> Change l'axe Z du panorama

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du panorama  
`z`|`Fixnum`|Axe Z  




##### Command.parallax_zoom(id, zoom, *duration, *wait_flag, *ease)

> Zoom sur les deux axes d'un panorama

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`zoom`|`Fixnum`|taille en pourcentage  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.parallax_zoom_x(id, zoom, *duration, *wait_flag, *ease)

> Zoom horizontal d'un panorama

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`zoom`|`Fixnum`|taille en pourcentage  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.parallax_zoom_y(id, zoom, *duration, *wait_flag, *ease)

> Zoom vertical d'un panorama

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`zoom`|`Fixnum`|taille en pourcentage  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.parallaxes_clear

> Supprime tous les panoramas

  




##### Command.percent(value, max)

> Renvoie le pourcentage de value par rapport à max

  
Nom|Type|Description  
--- | --- | ---  
`value`|`Fixnum`|Valeur à transformer  
`max`|`Fixnum`|Valeur maximum  


Exemple  
```ruby  
Command.percent(40, 80) # Renvoie 50 (parce que 40 = 50% de 80)  
```



##### Command.pi

> Renvoie une approximation de PI

  




##### Command.pick_random(*elts)

> Renvoie un élément au hasard du tableau (ou de la liste d'arguments)

  
Nom|Type|Description  
--- | --- | ---  
`*elts`|`ArgsList`|éléments dans lesquels piocher un élément aléatoire. Soit pick_random(a, b, c, d...etc.) soit pick_random([a,b,c,d...etc])  




##### Command.picture_angle(id, angle, *duration, *wait_flag, *ease)

> Change l'angle de l'image

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`angle`|`Fixnum`|Angle d'orientation de l'image (En degrés décimaux, sens anti-horaire). Si aucun angle n'est donné, la commande renverra l'angle de l'image  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.picture_blend(Selector, mode)

> Change le mode de fusion d'une image

  
Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
`mode`|`Fixnum`|Mode choisi (0, 1 ou 2)  




##### Command.picture_dimension(id, w, h, *duration, *wait_flag, *ease)

> Change la hauteur et la largeur d'une image référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`w`|`Fixnum`|Largeur à modifier  
`h`|`Fixnum`|Hauteur à modifier  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.picture_erase(Selector)

> Efface l'image

  
Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  




##### Command.picture_erased?(id)

> Renvoie true si l'image est supprimée (ou non affichée), false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  




##### Command.picture_flip(Selector)

> Applique un effet miroir (axe vertical) sur l'image 

  
Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  




##### Command.picture_height(id, *v, *duration, *wait_flag, *ease)

> Change la hauteur d'une image référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`*v`|`Fixnum`|Valeur à changer, si aucune valeur n'est donnée, la commande renverra la hauteur de l'image  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.picture_mouse_click?(id, *precise)

> Renvoie true si la souris survol et est cliquée l'image référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`*precise`|`Boolean`|si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false  




##### Command.picture_mouse_hover?(id, *precise)

> Renvoie true si la souris survol l'image référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`*precise`|`Boolean`|si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false  




##### Command.picture_mouse_press?(id, *key, *precise)

> Renvoie true si la souris survol et presse en continu la touche référencée sur l'image référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`*key`|`Symbol`|Touche de la souris (par défaut, :mouse_left)  
`*precise`|`Boolean`|si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false  




##### Command.picture_mouse_release?(id, *key, *precise)

> Renvoie true si la souris survol et relâche la touche référencée sur l'image référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`*key`|`Symbol`|Touche de la souris (par défaut, :mouse_left)  
`*precise`|`Boolean`|si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false  




##### Command.picture_mouse_repeat?(id, *key, *precise)

> Renvoie true si la souris survol et presse successivement la touche référencée sur l'image référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`*key`|`Symbol`|Touche de la souris (par défaut, :mouse_left)  
`*precise`|`Boolean`|si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false  




##### Command.picture_mouse_trigger?(id, *key, *precise)

> Renvoie true si la souris survol et presse la touche référencée sur l'image référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`*key`|`Symbol`|Touche de la souris (par défaut, :mouse_left)  
`*precise`|`Boolean`|si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false  




##### Command.picture_move(Selector, x, y, zoom_x, zoom_y, duration, *wait_flag, *opacity, *blend_type, *origin, *ease)

> Déplace une image

  
Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
`x`|`Fixnum`|Position en x de l'image où l'image doit se rendre  
`y`|`Fixnum`|Position en y de l'image où l'image doit se rendre  
`zoom_x`|`Fixnum`|Zoom de la largeur (en %)  
`zoom_y`|`Fixnum`|Zoom de la hauteur (en %)  
`duration`|`Fixnum`|Durée du déplacement en frames  
`*wait_flag`|`Boolean`|Attendre la fin du déplacement, par défaut, true  
`*opacity`|`Fixnum`|Opacité (de 0 à 255) que l'image devra avoir, si '-1', ou aucun argument n'est donné, l'image conserva son opacité actuelle  
`*blend_type`|`Fixnum`|Mode de fusion (0, 1, 2) que l'image devra avoir, si '-1', ou aucun argument n'est donné, l'image conserva son mode de fusion du moment  
`*origin`|`Fixnum`|Origine que l'image devra avoir, si '-1', ou aucun argument n'est donné, l'image conserva son origine du moment  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.picture_move?(id)

> Renvoie true si l'image référencée par son ID est en mouvement, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  




##### Command.picture_name(id, *name)

> Change le nom de l'image à afficher

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`*name`|`String`|Nom de l'image (sans l'extension, entre guillemets anglais), si aucun argument n'est passé, la commande renverra le nom courrant  




##### Command.picture_opacity(Selector, opacity, *duration, *wait_flag, *ease)

> Change l'opacité d'une image

  
Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
`opacity`|`Fixnum`|valeur de l'opacité (de 0 à 255)  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.picture_origin(id, origin)

> Change l'origine d'une image

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`origin`|`Fixnum`|Origine de l'image, 0 = Haut gauche, 1 = centré, [x,y] = orienté autour de X,Y, par défaut, zéro, zéro  




##### Command.picture_pin(Selector, *x, *y)

> Fait défiler une image avec la carte (la fixe à une position)

  
Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
`*x`|`Fixnum`|Coordonnées X de la carte en pixels, par défaut la coordonnée convertie de l'écran vers la carte  
`*y`|`Fixnum`|Coordonnées Y de la carte en pixels, par défaut la coordonnée convertie de l'écran vers la carte  




##### Command.picture_position(Selector, x, y, *duration, *wait_flag, *ease)

> Change la position de l'image

  
Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
`x`|`Fixnum`|Position en x de l'image  
`y`|`Fixnum`|Position en y de l'image  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.picture_rotate(Selector, speed)

> Fait tourner l'image

  
Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
`speed`|`Fixnum`|Vitesse de rotation de l'image  




##### Command.picture_scroll(Selector, vitesse)

> Change la vitesse de défilement (vertical et horizontal) d'une image fixée sur la carte

  
Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
`vitesse`|`Fixnum`|Vitesse de défilement  




##### Command.picture_scroll_x(Selector, *vitesse)

> Change la vitesse de défilement horizontal d'une image fixée sur la carte, si aucune vitesse n'est donnée (et que le selector est un simple ID) alors la commande renverra simplement la valeur de défilement.

  
Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
`*vitesse`|`Fixnum`|Vitesse de défilement  




##### Command.picture_scroll_y(Selector, *vitesse)

> Change la vitesse de défilement vertical d'une image fixée sur la carte, si aucune vitesse n'est donnée (et que le selector est un simple ID) alors la commande renverra simplement la valeur de défilement.

  
Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
`*vitesse`|`Fixnum`|Vitesse de défilement  




##### Command.picture_shake(Selector, power, speed, duration)

> Fait trembler l'image pendant un temps donné

  
Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
`power`|`Fixnum`|La puissance du tremblement  
`speed`|`Fixnum`|La vitesse du tremblement  
`duration`|`Fixnum`|La durée en frames du tremblement  




##### Command.picture_show(id, name, *x, *y, *origin, *zoom_x, *zoom_y, *opacity, *blend_type)

> Affiche une image à l'écran

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`name`|`String`|Nom de l'image (sans l'extension, entre guillemets anglais)  
`*x`|`Fixnum`|Position en X de l'image (par défaut 0)  
`*y`|`Fixnum`|Position en Y de l'image (par défaut 0)  
`*origin`|`Fixnum`|Origine de l'image, 0 = Haut gauche, 1 = centré, [x,y] = orienté autours de X,Y, par défaut, zéro  
`*zoom_x`|`Fixnum`|Zoom sur la largeur de l'image par défaut 100 (pour 100%)  
`*zoom_y`|`Fixnum`|Zoom sur la hauteur de l'image par défaut 100 (pour 100%)  
`*opacity`|`Fixnum`|Opacité de l'image, par défaut 255 (de 0 à 255)  
`*blend_type`|`Fixnum`|Mode de fusion, par défaut 0, 0=Normal, 1=Addition, 2=Soustraction  




##### Command.picture_show_enemy(pic_id, id, position)

> Affiche un monstre d'un groupe à sa position définie dans la base de données

  
Nom|Type|Description  
--- | --- | ---  
`pic_id`|`Fixnum`|ID de l'image dans laquelle afficher le monstre  
`id`|`Fixnum`|ID du groupe de monstre  
`position`|`Fixnum`|Position du monstre  




##### Command.picture_show_screenshot(id, *x, *y, *origin, *zoom_x, *zoom_y, *opacity, *blend_type)

> Affiche une capture d'écran (comme une image normale)

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`*x`|`Fixnum`|Position en X de l'image (par défaut 0)  
`*y`|`Fixnum`|Position en Y de l'image (par défaut 0)  
`*origin`|`Fixnum`|Origine de l'image, 0 = Haut gauche, 1 = centré, [x,y] = orienté autours de X,Y, par défaut, zéro  
`*zoom_x`|`Fixnum`|Zoom sur la largeur de l'image par défaut 100 (pour 100%)  
`*zoom_y`|`Fixnum`|Zoom sur la hauteur de l'image par défaut 100 (pour 100%)  
`*opacity`|`Fixnum`|Opacité de l'image, par défaut 255 (de 0 à 255)  
`*blend_type`|`Fixnum`|Mode de fusion, par défaut 0, 0=Normal, 1=Addition, 2=Soustraction  




##### Command.picture_showed?(id)

> Renvoie true si l'image est affichée, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  




##### Command.picture_tone(id, tone, *duration, *wait_flag, *ease)

> Change la teinte d'une image

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`tone`|`Tone`|Teinte de l'image (utilisez la commande tone)  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut false  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.picture_unpin(Selector)

> Arrête de faire défiler une image avec la carte

  
Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  




##### Command.picture_wave(Selector, amplitude, vitesse)

> Fait onduler l'image

  
Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
`amplitude`|`Fixnum`|Amplitude (taille de l'ondulation)  
`vitesse`|`Fixnum`|Vitesse de l'ondulation  




##### Command.picture_width(id, *v, *duration, *wait_flag, *ease)

> Change la largeur d'une image référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`*v`|`Fixnum`|Valeur à changer, si aucune valeur n'est donnée, la commande renverra la largeur de l'image  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.picture_x(id, x, *duration, *wait_flag, *ease)

> Change l'axe X d'une image

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`x`|`Fixnum`|Position en x de l'image, si aucun argument n'est passé, la commande renverra la position X de l'image  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.picture_y(id, y, *duration, *wait_flag, *ease)

> Change l'axe Y d'une image

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`y`|`Fixnum`|Position en y de l'image, si aucun argument n'est passé, la commande renverra la position Y de l'image  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.picture_zoom(Selector, zoom_x, *zoom_y, *duration, *wait_flag, *ease)

> Change la taille d'une image

  
Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
`zoom_x`|`Fixnum`|Pourcentage d'agrandissement de la largeur de l'image  
`*zoom_y`|`Fixnum`|Pourcentage d'agrandissement de la hauteur de l'image. Si cet argument est ommis, la largeur sera égale à la hauteur.  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.picture_zoom_x(id, zoom, *duration, *wait_flag, *ease)

> Change la largeur d'une image

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`zoom`|`Fixnum`|Pourcentage d'agrandissement de la largeur de l'image. Si aucune valeur n'est donnée, la commande renverra le zoom_x de l'image.  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.picture_zoom_y(id, zoom, *duration, *wait_flag, *ease)

> Change la hauteur d'une image

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`zoom`|`Fixnum`|Pourcentage d'agrandissement de la hauteur de l'image. Si aucune valeur n'est donnée, la commande renverra le zoom_y de l'image.  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.pictures_clear

> Efface toutes les images

  




##### Command.pictures_collide?(id, id2)

> Vérifie que deux images sont en collision

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`id2`|`Fixnum`|ID de l'autre image  




##### Command.pictures_perfect_collide?(idA, idB)

> Vérifie la collision entre deux images au pixel près. ATTENTION, CETTE COMMANDE LAG ENORMEMENT !IL EST DECONSEILLE DE L'UTILISER !

  
Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de la première image  
`idB`|`Fixnum`|ID de la seconde image  




##### Command.pixel_in_event?(id, x, y, *precise)

> Renvoie true si le pixel (x, y) est inclu dans l'événement, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`ArgType`|Args description  
`x`|`Fixnum`|Coordonnées X du point à vérifier  
`y`|`Fixnum`|Coordonnées Y du point à vérifier  
`*precise`|`Boolean`|Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut true   




##### Command.pixel_in_picture?(id, x, y, *precise)

> Vérifie que le x, y sont inscrits dans l'image

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`*precise`|`Boolean`|Par défaut, precise vaut false, si precise vaut true, seuls les pixels non transparents seront pris en compte  




##### Command.pixel_in_player?(x, y, *precise)

> Renvoie true si le pixel (x, y) est inclu dans le joueur, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X du point à vérifier  
`y`|`Fixnum`|Coordonnées Y du point à vérifier  
`*precise`|`Boolean`|Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut true   




##### Command.pixels_between(idA, idB)

> Renvoie le nombre de pixels entre deux évènements référencés par leurs ID's

  
Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de l'évènement A (0 pour héros)  
`idB`|`Fixnum`|ID de l'évènement B (0 pour héros)  




##### Command.play_time

> Renvoie le temps de jeu en secondes

  




##### Command.player_brutal_stop_trail

> Arrête brutalement la traînée sur le joueur

  




##### Command.player_direction(*value)

> Renvoie (ou change) la direction (2 pour le haut, 8, pour le bas, 4 pour la gauche , 6 pour la droite ) du joueur

  
Nom|Type|Description  
--- | --- | ---  
`*value`|`Fixnum`|Valeur de la direction, 2,4,6,8. Si aucune valeur n'est donnée, la commande retourne la direction du héros  




##### Command.player_flash(color, duration)

> Flash le hér dans une couleur

  
Nom|Type|Description  
--- | --- | ---  
`color`|`Color`|La couleur du flash (vous pouvez utiliser la commande color ou via son profil dans la base de données)  
`duration`|`Fixnum`|La durée du flash en frames  




##### Command.player_in_screen?

> Renvoie true si le joueur est visible à l'écran, false sinon

  




##### Command.player_move_away_from_event(id)

> Déplace le héro d'une case dans la direction opposée à un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement cible  




##### Command.player_move_away_from_position(x, y)

> Déplace le héro d'une case dans la direction opposée d'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  




##### Command.player_move_backward

> Déplace le héro d'une case en arrière. Renvoie true si le mouvement a réussi, false sinon.

  




##### Command.player_move_diagonal(horizontal, vertical)

> Déplace le héro d'une case en diagonale. Renvoie true si le mouvement à réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`horizontal`|`Fixnum`|Direction horizontale (4 pour gauche, 6 pour droite)  
`vertical`|`Fixnum`|Direction verticale (2 pour bas, 8 pour haut)  




##### Command.player_move_down(*turn_ok)

> Fait bouger le joueur d'une case vers le bas

  
Nom|Type|Description  
--- | --- | ---  
`*turn_ok`|`Boolean`|En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)  




##### Command.player_move_forward

> Déplace le héro d'une case en avant. Renvoie true si le mouvement a réussi, false sinon.

  




##### Command.player_move_frequency(f)

> Modifie la fréquence du joueur

  
Nom|Type|Description  
--- | --- | ---  
`f`|`Fixnum`|Fréquence du joueur, si aucune priorité n'est donnée, la commande renverra la valeur de la fréquence du héros  




##### Command.player_move_left(*turn_ok)

> Fait bouger le joueur d'une case vers la gauche. Renvoie true si le déplacement s'est effectué, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`*turn_ok`|`Boolean`|En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)  




##### Command.player_move_lower_left

> Déplacement  le héro d'une case en diagonale bas-gauche. Renvoie true si le déplacement à réussi, false sinon.

  




##### Command.player_move_lower_right

> Déplacement  le héro d'une case en diagonale bas-droite. Renvoie true si le déplacement à réussi, false sinon.

  




##### Command.player_move_random

> Déplacele héro d' une case aléatoire.

  




##### Command.player_move_right(*turn_ok)

> Fait bouger le joueur d'une case vers la droite. Renvoie true si le déplacement s'est effectué, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`*turn_ok`|`Boolean`|En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)  




##### Command.player_move_speed(v)

> Modifie la vitesse du joueur

  
Nom|Type|Description  
--- | --- | ---  
`v`|`Fixnum`|Vitesse du joueur à donner,si aucune priorité n'est donnée, la commande renverra la valeur de la vitesse du héros  




##### Command.player_move_speed_frequency(v, f)

> Change la vitesse et la fréquence de déplacement du joueur

  
Nom|Type|Description  
--- | --- | ---  
`v`|`Fixnum`|Vitesse du joueur  
`f`|`Fixnum`|Fréquence du joueur  




##### Command.player_move_straight(value, *turn_ok)

> Déplace un événement référencé par son ID d'une case dans une direction. La commande renvoie true ou false si le déplacement a réussi ou non.

  
Nom|Type|Description  
--- | --- | ---  
`value`|`Fixnum`|Valeur, 2 pour bas, 4 pour gauche, 6 pour droite et 8 pour bas  
`*turn_ok`|`Boolean`|En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)  




##### Command.player_move_toward_event(id)

> Déplace le héro d'une case en direction d'un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement cible  




##### Command.player_move_toward_position(x, y)

> Déplace le héro d'une case en direction d'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  




##### Command.player_move_up(*turn_ok)

> Fait bouger le joueur d'une case vers le haut. Renvoie true si le déplacement s'est effectué, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`*turn_ok`|`Boolean`|En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)  




##### Command.player_move_upper_left

> Déplacement  le héro d'une case en diagonale haut-gauche. Renvoie true si le déplacement à réussi, false sinon.

  




##### Command.player_move_upper_right

> Déplacement  le héro d'une case en diagonale haut-droite. Renvoie true si le déplacement à réussi, false sinon.

  




##### Command.player_move_with(code)

> Applique un déplacement (selon un code) au héros

  
Nom|Type|Description  
--- | --- | ---  
`code`|`Fixnum`|Liste des codes de déplacement  




##### Command.player_moving?

> Renvoie true si le héros est en mouvement, false sinon

  




##### Command.player_opacity(*value)

> Modifie (ou retourne) l'opacité du héros

  
Nom|Type|Description  
--- | --- | ---  
`*value`|`Fixnum`|Valeur de l'opacité, entre 0 et 255. Si aucune valeur n'est donnée. La commande retourne l'opacité du héros.  




##### Command.player_opaque

> Rend le joueur opaque

  




##### Command.player_ox(*value)

> Modifie (ou retourne) la coordonnée X du point de départ du héros (le point d'accroche)

  
Nom|Type|Description  
--- | --- | ---  
`*value`|`Fixnum`|Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante  




##### Command.player_oy(*value)

> Modifie (ou retourne) la coordonnée Y du point de départ du héros (le point d'accroche)

  
Nom|Type|Description  
--- | --- | ---  
`*value`|`Fixnum`|Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante  




##### Command.player_path_length(x, y, *wait_flag, *no_through)

> Renvoie la taille du chemin nécéssaire au pathfinder pour se rendre a un point

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`*wait_flag`|`Boolean`|Par défaut, false, cette valeur définit le blocage durant le déplacement ou non  
`*no_through`|`Boolean`|Par défaut, false, si cette valeur vaut true, même en mode fantôme, l'évènement utilisera un chemin passable  




##### Command.player_pixel_x

> Renvoie la coordonnées X du joueur en pixel sur la carte

  




##### Command.player_pixel_y

> Renvoie la coordonnées Y du joueur en pixel sur la carte

  




##### Command.player_restore_origin

> Restore l'origine du héros

  




##### Command.player_screen_x

> Renvoie la coordonnée X du joueur par rapport à l'écran

  




##### Command.player_screen_y

> Renvoie la coordonnée Y du joueur par rapport à l'écran

  




##### Command.player_stop_trail

> Arrête la traînée sur le joueur

  




##### Command.player_teleport(map_id, x, y, direction, *fade_type)

> Téléporte le héros à une nouvelle coordonnées sur une nouvelle map (potentiellement)

  
Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la carte. Utiliser c(:map_id) pour téléporter sur la même carte  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`direction`|`Fixnum`|Nouvelle direction pour le héro (2,4,6 ou 8)  
`*fade_type`|`Fixnum`|Le mode de téléport (par défaut 0), 0 = fondu noir, 1 = fondu blanc, 2 = instantanné  




##### Command.player_through(*flag)

> Change le mode de traversée du joueur

  
Nom|Type|Description  
--- | --- | ---  
`*flag`|`Boolean`|true pour 'traverse tout', false pour 'ne traverse pas tout', par défaut vaut true   




##### Command.player_through?

> Renvoie true si le joueur est en mode 'traverse tout', false sinon

  




##### Command.player_trail(len, *mode, *tone)

> Applique une traînée sur le joueur

  
Nom|Type|Description  
--- | --- | ---  
`len`|`Fixnum`|Taille de la traînée  
`*mode`|`Fixnum`|Mode de fusion de la traînée (0, 1 ou 2), par défaut: 0  
`*tone`|`Tone`|Teinte de la traînée (utilisez la commande tone)  




##### Command.player_transfert(new_x, new_y)

> Téléporte instanément le héros à une autre position de la carte

  
Nom|Type|Description  
--- | --- | ---  
`new_x`|`Fixnum`|Coordonnée X  
`new_y`|`Fixnum`|Coordonnée Y  




##### Command.player_transparent

> Rend le joueur transparent

  




##### Command.player_transparent?

> Renvoi true si le joueur est transparent (false sinon)

  




##### Command.player_turn_180

> Fait tourner le héro de 180°

  




##### Command.player_turn_90_left

> Fait tourner le joueur de 90° par la gauche

  




##### Command.player_turn_90_right

> Fait tourner le joueur de 90° par la droite

  




##### Command.player_turn_90_right_or_left

> Fait tourner le héro de 90° par la gauche ou par la droite (aléatoirement)

  




##### Command.player_turn_away_from_event(id)

> Tourne le héro d'une case dans la direction opposée à un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement cible  




##### Command.player_turn_away_from_position(x, y)

> Tourne le héro d'une case dans la direction opposée d'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  




##### Command.player_turn_down

> Fait tourner le héro vers le bas

  




##### Command.player_turn_left

> Fait tourner le héro à gauche

  




##### Command.player_turn_random

> Fait tourner le héro dans une direction aléatoire

  




##### Command.player_turn_right

> Fait tourner le héro à droite

  




##### Command.player_turn_toward_event(id)

> Tourne le héro d'une case en direction d'un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement cible  




##### Command.player_turn_toward_position(x, y)

> Tourne le héro d'une case en direction d'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  




##### Command.player_turn_up

> Fait tourner le héro vers le bas

  




##### Command.player_x

> Renvoie la coordonnée X de la case sur laquelle est le joueur

  




##### Command.player_y

> Renvoie la coordonnée Y de la case sur laquelle est le joueur

  




##### Command.player_zoom(value)

> Modifie le zoom du héros

  
Nom|Type|Description  
--- | --- | ---  
`value`|`Fixnum`|Valeur du zoom  




##### Command.player_zoom_x(*value)

> Modifie (ou retourne) la valeur du zoom horizontal du héros

  
Nom|Type|Description  
--- | --- | ---  
`*value`|`Fixnum`|Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante  




##### Command.player_zoom_y(*value)

> Modifie (ou retourne) la valeur du zoom vertical du héros

  
Nom|Type|Description  
--- | --- | ---  
`*value`|`Fixnum`|Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante  




##### Command.qte(key, time, *strict)

> Attend la saisie d'une touche pendant une durée donnée. La commande renvoie true si la touche a été saisie, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche qu'il faut presser avant la fin  
`time`|`Fixnum`|Durée  
`*strict`|`Boolean`|Difficulté, si elle vaut true, aucune erreur admise, sinon erreurs admises. Par défaut vaut true  




##### Command.random(min, max)

> Renvoie un nombre aléatoire compris entre MIN et MAX inclus

  
Nom|Type|Description  
--- | --- | ---  
`min`|`Fixnum`|Borne minimale  
`max`|`Fixnum`|Borne maximale (à noter que si cet argument n'est pas spécifié, le résultat sera compris entre 0 et min inclus)  




##### Command.random_combination(len, *keys)

> Renvoie une combinaison (tableau itérable) aléatoire de la taille spécifiée en argument, composée des paramètres des touches passées en arguments. (par exemple : random_combination(5, :UP, :DOWN, :LEFT, :RIGHT) )

  
Nom|Type|Description  
--- | --- | ---  
`len`|`Fixnum`|Args description  
`*keys`|`Argslist`|Liste des touches pouvant constituer la combinaison  




##### Command.random_figures(x)

> Renvoie un nombre à virgule aléatoire compris entre x et x+1

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Valeur de base (si cet argument n'est pas spécifié, le résultat sera compris entre 0 et 1)  




##### Command.region_id(x, y)

> Renvoie l'ID de la région pointée par les coordonnées X,Y

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  




##### Command.remove_all_windows

> Supprime toutes les fenêtres

  




##### Command.remove_window(id)

> Supprime la fenêtre référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  




##### Command.replay_bgm

> Reprend le BGM mémorisé

  




##### Command.rm_kill

> Quitte le jeu... d'un coup sec... TCHAK

  




##### Command.roof?(x, y)

> Renvoie true si les coordonnées sont sur un toit, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  




##### Command.save_bgm

> Mémorise le BGM en cours

  




##### Command.save_count

> Renvoie le nombre de sauvegardes effectuées par partie

  




##### Command.save_delete(index)

> Supprime la sauvegarde référencée par son numéro

  
Nom|Type|Description  
--- | --- | ---  
`index`|`Fixnum`|Numéro de la sauvegarde  




##### Command.save_exists?(index)

> Renvoie true si la sauvegarde référencée par son numéro existe

  
Nom|Type|Description  
--- | --- | ---  
`index`|`Fixnum`|Numéro de la sauvegarde  




##### Command.save_game(index)

> Sauvegarde la partie sur la sauvegardé référencée par l'ID donné

  
Nom|Type|Description  
--- | --- | ---  
`index`|`Fixnum`|Numéro de la sauvegarde  




##### Command.scene_call(scene)

> Appelle une scene (et la place dans la pile de scene)

  
Nom|Type|Description  
--- | --- | ---  
`scene`|`Scene`|Scene à appeler  




##### Command.scene_clear_history

> Vide la pile d'appel des scenes

  




##### Command.scene_goto(scene)

> Appelle une scene (sans la placer dans la pile de scene)

  
Nom|Type|Description  
--- | --- | ---  
`scene`|`Scene`|Scene à appeler  




##### Command.scene_return

> Renvoie à la dernière scene dans la pile d'appel

  




##### Command.screen_blur(radius, *duration, *wait_flag, *ease)

> Applique un flou gaussien sur tout l'écran en temps réel, sauf les windows (dialogues, etc.). Attention, cette commande peut faire baisser le FPS.

  
Nom|Type|Description  
--- | --- | ---  
`radius`|`ArgType`|Radius du flou gaussien. (0 = pas de flou)  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.screen_fadein(duration)

> Affiche l'écran en fondu (de manière moins radicale que la commande fadein)

  
Nom|Type|Description  
--- | --- | ---  
`duration`|`Fixnum`|Durée en frame  




##### Command.screen_fadeout(duration)

> Efface l'écran en fondu (de manière moins radicale que la commande fadeout)

  
Nom|Type|Description  
--- | --- | ---  
`duration`|`Fixnum`|Durée en frame  




##### Command.screen_flash(color, duration, *wait_flag)

> Envoie un flash à l'écran

  
Nom|Type|Description  
--- | --- | ---  
`color`|`Color`|Couleur du flash (utilisez la commande 'color')  
`duration`|`Fixnum`|Durée en frames  
`*wait_flag`|`Boolean`|Attend la fin de l'effet (true), n'attend pas (false). Par défaut cet argument vaut false  




##### Command.screen_height

> Renvoie la hauteur de l'écran (en pixels)

  




##### Command.screen_pixelation(pixelation, *duration, *wait_flag, *ease)

> Pixélise tout l'écran en temps réel, sauf les windows (dialogues, etc.)

  
Nom|Type|Description  
--- | --- | ---  
`pixelation`|`ArgType`|Valeur de pixélisation (exemple: si 2, la taille des pixels est multipliée par deux)  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  




##### Command.screen_shake(power, speed, duration, *wait_flag)

> Fait trembler l'écran pendant une durée déterminée

  
Nom|Type|Description  
--- | --- | ---  
`power`|`Fixnum`|Puissance du tremblement  
`speed`|`Fixnum`|Vitesse du tremblement  
`duration`|`Fixnum`|Durée en frames  
`*wait_flag`|`Boolean`|Attend la fin de l'effet (true), n'attend pas (false). Par défaut cet argument vaut false  




##### Command.screen_tone(tone, duration, *wait_flag)

> Change la teinte de l'écran

  
Nom|Type|Description  
--- | --- | ---  
`tone`|`Tone`|Teinte (utilisez la commande 'tone')  
`duration`|`Fixnum`|Durée en frame  
`*wait_flag`|`Boolean`|Attend la fin de l'effet (true), n'attend pas (false). Par défaut cet argument vaut false  




##### Command.screen_width

> Renvoie la largeur de l'écran (en pixels)

  




##### Command.scroll_lock?

> Renvoie true si le clavier est en mode SCROLL_LOCK au moment de l'appel, false sinon

  




##### Command.se_play(name, *volume, *pitch)

> Joue un SE

  
Nom|Type|Description  
--- | --- | ---  
`name`|`String`|Nom du SE  
`*volume`|`Fixnum`|Volume du SE. Pourcentage entre 0 et 100. Par défaut : 80  
`*pitch`|`Fixnum`|Vitesse du SE. Pourcentage entre 1 et 453. Par défaut : 100  




##### Command.se_stop

> Stoppe le SE en cours

  




##### Command.session_username

> Renvoie le nom d'utilisateur de la session Windows

  




##### Command.set_actor_name(id, new_name)

> modifie le nom du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`new_name`|`String`|Nouveau nom  




##### Command.set_actor_nickname(id, new_name)

> modifie le surnom du héros référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`new_name`|`String`|Nouveau surnom  




##### Command.set_tile(value, x, y, layer)

> Change une case de tile

  
Nom|Type|Description  
--- | --- | ---  
`value`|`Fixnum`|Valeur du tile (utilisez éventuellement la commande tile_id)  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`layer`|`Fixnum`|Couche de la carte (1,2 ou 3)  




##### Command.set_tile_where(layer, id, new_id)

> Change tous les tile d'une carte selon un ID et un layer

  
Nom|Type|Description  
--- | --- | ---  
`layer`|`Fixnum`|Numero de la couche  
`id`|`Fixnum`|Id du tile à remplacer  
`new_id`|`Fixnum`|Nouvel Id du tile  




##### Command.shift?

> Renvoie true si la touche Maj du clavier est activée au moment de l'appel, false sinon

  




##### Command.show_animation(ids, id_animation, *wait_flag)

> Joue une animation sur les événements référencés par le selecteur ID

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|IDS des événements  
`id_animation`|`Fixnum`|ID de l'animation  
`*wait_flag`|`string`|attend la fin si true  




##### Command.show_balloon(ids, id_balloon, *wait_flag)

> Joue une émoticone sur les événements référencés par le selecteur ID

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|IDS des événements  
`id_balloon`|`Fixnum`|ID de l'émoticone  
`*wait_flag`|`String`|attend la fin si true  




##### Command.sin(x)

> Renvoie le sinus de x

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  




##### Command.sinh(x)

> Renvoie le sinus hyperbolique de x

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  




##### Command.skill_always_usable?(id)

> Renvoie true si la technique référencé par son ID est utilisable partout

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_battle_usable?(id)

> Renvoie true si la technique référencé par son ID est utilisable en combat seulement

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_certain?(id)

> Renvoie true si une technique référencée par son ID a une garantie de réussite totale, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_description(id)

> Renvoie la description la technique référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_for_all?(id)

> Renvoie true si une technique référencée par son ID cible tout le groupe allié, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_for_all_allies?(id)

> Renvoie true si la technique référencée par son ID cible tous les alliés, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_for_all_dead_allies?(id)

> Renvoie true si la technique référencée par son ID cible tous les alliés morts, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_for_all_enemies?(id)

> Renvoie true si la technique référencée par son ID cible tous les ennemis, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_for_caller?(id)

> Renvoie true si la technique référencée par son ID cible l'utilisateur, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_for_dead_friend?(id)

> Renvoie true si une technique référencée par son ID cible un (ou les) allié(s) mort(s), false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_for_four_random_enemies?(id)

> Renvoie true si la technique référencée par son ID cible quatre ennemis au hasard, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_for_friend?(id)

> Renvoie true si une technique référencée par son ID cible un (ou les) allié(s), false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_for_one?(id)

> Renvoie true si une technique référencée par son ID a une cible unique, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_for_one_ally?(id)

> Renvoie true si la technique référencée par son ID cible un allié, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_for_one_dead_ally?(id)

> Renvoie true si la technique référencée par son ID cible un allié mort, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_for_one_enemy?(id)

> Renvoie true si la technique référencée par son ID cible un ennemi, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_for_one_random_enemy?(id)

> Renvoie true si la technique référencée par son ID cible un ennemi au hasard, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_for_opponent?(id)

> Renvoie true si une technique référencée par son ID cible les ennemis, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_for_random?(id)

> Renvoie true si une technique référencée par son ID cible aléatoirement, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_for_three_random_enemies?(id)

> Renvoie true si la technique référencée par son ID cible trois ennemis au hasard, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_for_two_random_enemies?(id)

> Renvoie true si la technique référencée par son ID cible deux ennemis au hasard, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_has_no_scope?(id)

> Renvoie true si la technique référencée par son ID ne cible personne, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_icon(id)

> Renvoie l'index de l'icone de la technique référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_magical?(id)

> Renvoie true si une technique référencée par son ID endommage les PM, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_menu_usable?(id)

> Renvoie true si la technique référencé par son ID est utilisable dans le menu seulement

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_name(id)

> Renvoie le nom de la technique référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_nb_hits(id)

> Renvoie le nombre de coups portés par la technique référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_need_selection?(id)

> Renvoie true si une technique référencée par son ID requiert la sélection de l'ennemi, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_never_usable?(id)

> Renvoie true si la technique référencé par son ID n'est jamais utilisable

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_note(id)

> Renvoie le commentaire de la base de données de la technique référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_number_of_targets(id)

> Renvoie le nombre de cibles d'une technique référencée par son ID, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_occasion(id)

> Renvoie un entier correspondant au droit d'utilisation de la technique

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_physical?(id)

> Renvoie true si une technique référencée par son ID endommage les PV, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_scope(id)

> Renvoie la portée (en Entier) d'une technique référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la techinuqe  




##### Command.skill_speed(id)

> Renvoie l'apport de vitesse de la technique référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_success_rate(id)

> Renvoie la probabilité de succès de la technique référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.skill_tp_gain(id)

> Renvoie le gain de TP que la technique référencée par son ID apporte une fois utilisée en combat

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  




##### Command.socket_connect(address, port)

> Se connecte à un serveur, renvoie true si la connexion a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`address`|`String`|Adresse du serveur  
`port`|`Fixnum`|Port d'écoute  




##### Command.socket_connected?

> Renvoie true si la connexion est en cours, false, sinon

  




##### Command.socket_disconnect

> Déconnecte la connexion courante

  




##### Command.socket_recv(*len)

> Renvoie le message envoyé par le serveur au client, false si aucun message n' est reçu

  
Nom|Type|Description  
--- | --- | ---  
`*len`|`Fixnum`|Taille maximale du message à recevoir, par défaut 1024  




##### Command.socket_send(data)

> Envoie un message au serveur connecté, renvoie true en cas de réussite, false en cas d'échec

  
Nom|Type|Description  
--- | --- | ---  
`data`|`String`|Message à envoyer  




##### Command.socket_wait_recv(*len)

> Attend une réponse du serveur, se termine quand une réponse a été reçue (et la renvoie)

  
Nom|Type|Description  
--- | --- | ---  
`*len`|`Fixnum`|Taille maximale du message à recevoir, par défaut 1024  




##### Command.sound_fade(wait, *frame)

> Stoppe les BGM et BGS en fondu

  
Nom|Type|Description  
--- | --- | ---  
`wait`|`Fixnum`|Temps du fondu, par défaut en secondes  
`*frame`|`Boolean`|Spécifiez 'true' si vous renseignez un temps en frames plutôt qu'en secondes  




##### Command.sound_stop

> Stoppe tous les sons en cours

  




##### Command.split_each_char(str)

> Transforme une chaîne de caractères en un tableau de caractères

  
Nom|Type|Description  
--- | --- | ---  
`str`|`String`|Chaine a transformer  




##### Command.sqrt(x)

> Renvoie la racine carrée de x

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  




##### Command.square_passable?(x, y, direction)

> Renvoie true si la case référencée par X, Y est passable dans la direction référencée par direction, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  
`direction`|`Fixnum`|Direction (2,4,6,8)  




##### Command.squares_between(idA, idB)

> Renvoie le nombre de cases entre deux évènements référencés par leurs ID

  
Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de l'évènement A (0 pour héros)  
`idB`|`Fixnum`|ID de l'évènement B (0 pour héros)  




##### Command.stair?(x, y)

> Renvoie true si les coordonnées sont sur une marche, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  




##### Command.start_map_id

> Renvoie l'ID de la map de départ

  




##### Command.start_new_game

> Démarre une nouvelle partie

  




##### Command.start_x

> Renvoie la position X de départ du joueur

  




##### Command.start_y

> Renvoie la position Y de départ du joueur

  




##### Command.steps

> Renvoie le nombre de pas effectués par l'équipe

  




##### Command.switch_tileset(tileset_id)

> Change le tileset de la carte en cours

  
Nom|Type|Description  
--- | --- | ---  
`tileset_id`|`Fixnum`|ID du nouveau tileset  




##### Command.table?(x, y)

> Renvoie true si les coordonnées sont sur une table, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  




##### Command.tan(x)

> Renvoie la tangente de x

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  




##### Command.tanh(x)

> Renvoie la tangente hyperbolique de x

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  




##### Command.team_size

> Renvoie la taille de l'équipe

  




##### Command.terrain_tag(x, y)

> Renvoie le tag du terrain de la case pointée par les coordonnées X,Y

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  




##### Command.text_angle(id, *value)

> Change l'angle d'un texte, si aucun angle n'est donné, la commande renverra la valeur de l'angle du texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id du texte  
`*value`|`Fixnum`|Nouvel angle (peut être vide)  




##### Command.text_change(id, text)

> Change le texte affiché à l'écran

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
`text`|`String`|Nouveau texte  




##### Command.text_erase(id)

> Supprime le texte affiché à l'écran

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  




##### Command.text_move(id, duration, wait_flag, x, y, zoom_x, zoom_y, opacity, blend_type, origin)

> Déplace un texte affiché à l'écran

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
`duration`|`Fixnum`|Durée du déplacement en frames  
`wait_flag`|`Boolean`|Attendre la fin du déplacement, par défaut, true  
`x`|`Fixnum`|Position en x où le texte doit se rendre  
`y`|`Fixnum`|Position en y ou le texte doit se rendre  
`zoom_x`|`Fixnum`|Zoom de la largeur (en %)  
`zoom_y`|`Fixnum`|Zoom de la hauteur (en %)  
`opacity`|`Fixnum`|Opacité (de 0 à 255)  
`blend_type`|`Fixnum`|Mode de fusion (0, 1, 2)   
`origin`|`Fixnum`|Origine  




##### Command.text_move?(id)

> Retourne true sur le texte référencé par son ID est en mouvement, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  




##### Command.text_opacity(id, *opacity, *duration, *wait_flag)

> Change l'opacité du texte, si aucune opacité n'est donnée, la commande renverra l'opacité du texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
`*opacity`|`Fixnum`|valeur de l'opacité, entre 0 et 255.  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  




##### Command.text_position(id, x, y, *duration, *wait_flag)

> Change la position d'un texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`x`|`Fixnum`|Position en x du texte  
`y`|`Fixnum`|Position en y du texte  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  




##### Command.text_profile(id, *profile)

> Change le profil du texte, si aucun profile n'est donné, la commande renverra le profil du texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
`*profile`|`String`|Nouveau profil  




##### Command.text_progressive(id, value, delay, *block)

> Affiche progressivement un texte (caractère par caractère)

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id du champ de texte  
`value`|`String`|Texte a afficher  
`delay`|`Fixnum`|Durée (délai) entre chaque apparition de caractères  
`*block`|`Block`|Vous pouvez passer du code entre accolades qui va s'exécuter à chaque caractère (facultatif)  




##### Command.text_rotate(id, speed)

> Fait tourner le texte (mettez une vitesse négative pour changer le sens de rotation)

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
`speed`|`Fixnum`|Vitesse de rotation  




##### Command.text_show(id, text, profile, x, y, *zoom_x, *zoom_y, *opacity, *blend_type, *origin)

> Affiche un texte à l'écran

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
`text`|`String`|Texte a afficher  
`profile`|`String`|Profil du texte (voir Base de données)  
`x`|`Fixnum`|Position X  
`y`|`Fixnum`|Position Y  
`*zoom_x`|`Fixnum`|Zoom sur la largeur du texte par défaut 100 (pour 100%)  
`*zoom_y`|`Fixnum`|Zoom sur la hauteur du text par défaut 100 (pour 100%)  
`*opacity`|`Fixnum`|Opacité de l'image, par défaut 255 (de 0 à 255)  
`*blend_type`|`Fixnum`|Mode de fusion, par défaut 0, 0=Normal, 1=Addition, 2=Soustraction  
`*origin`|`Fixnum`|Origine du texte, 0 = Haut gauche, 1 = centré, par défaut, zéro  




##### Command.text_value(id)

> Renvoie la valeur d'un texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  




##### Command.text_x(id, x, *duration, *wait_flag)

> Change l'axe X d'un texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`x`|`Fixnum`|Position en x du texte, si aucun argument n'est passé, la commande renverra la position X du texte  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  




##### Command.text_y(id, y, *duration, *wait_flag)

> Change l'axe Y d'un texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`y`|`Fixnum`|Position en y du texte, si aucun argument n'est passé, la commande renverra la position X du texte  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  




##### Command.text_zoom(id, zoom_x, zoom_y, *duration, *wait_flag)

> Change le zoom d'un texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`zoom_x`|`Fixnum`|zoom x du texte  
`zoom_y`|`Fixnum`|zoom y du texte  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  




##### Command.text_zoom_x(id, zoom_x, *duration, *wait_flag)

> Change le zoom X d'un texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`zoom_x`|`Fixnum`|zoom x du texte, si aucun argument n'est passé, la commande renverra le zoom X du texte  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  




##### Command.text_zoom_y(id, zoom_y, *duration, *wait_flag)

> Change le zoom y d'un texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`zoom_y`|`Fixnum`|zoom y du texte, si aucun argument n'est passé, la commande renverra le zoom X du texte  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  




##### Command.textfield_activate(id)

> Active la zone de texte référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la zone de texte  




##### Command.textfield_active?(id)

> Renvoie true si le champ de texte référencé par son ID est activé

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la zone de texte  




##### Command.textfield_click?(id)

> Renvoie true si la souris clique sur le champ de texte référencé par son ID, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la zone de texte  




##### Command.textfield_deactivate(*id)

> désactive la zone de texte référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`*id`|`Fixnum`|ID du champ de texte, si aucun ID n'est spécifié, toutes les zones de textes seront désactivés  




##### Command.textfield_erase(*id)

> Supprime le champ de texte référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`*id`|`Fixnum`|ID de la zone de texte, si aucun ID n'est spécifié, toutes les zones de textes seront supprimées  




##### Command.textfield_float_show(id, number, x, y, w, profile, *range, *active, *opacity)

> Affiche un champ de texte permettant de saisir des nombres à virgule

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du champ de texte  
`number`|`Float`|Nombre à afficher par défaut du champ  
`x`|`Fixnum`|Position X du champ  
`y`|`Fixnum`|Position Y du champ  
`w`|`Fixnum`|Largeur du champ de texte  
`profile`|`Fixnum`|Référence du profile du champ de texte  
`*range`|`Range`|Intervalle des nombres autorisés, peut être occulté  
`*active`|`Boolean`|Défini si le textfield est actif à sa création (true oui, false non). Par défaut: true  
`*opacity`|`Fixnum`|Défini l'opacité du textfield, par défaut, 255  




##### Command.textfield_get_value(id)

> Renvoie la valeur de la zone de texte référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la zone de texte  




##### Command.textfield_hover?(id)

> Renvoie true si la souris survole le champ de texte référencé par son ID, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la zone de texte  




##### Command.textfield_int_show(id, number, x, y, w, profile, *range, *active, *opacity)

> Affiche un champ de texte permettant de saisir des nombres entiers

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du champ de texte  
`number`|`Fixnum`|Nombre à afficher par défaut  
`x`|`Fixnum`|Position X du champ  
`y`|`Fixnum`|Position Y du champ  
`w`|`Fixnum`|Largeur du champ de texte  
`profile`|`Fixnum`|Référence du profile du champ de texte  
`*range`|`Range`|Intervalle des nombres autorisés, peut être occulté  
`*active`|`Boolean`|Défini si le textfield est actif à sa création (true oui, false non). Par défaut: true  
`*opacity`|`Fixnum`|Défini l'opacité du textfield, par défaut, 255  




##### Command.textfield_opacity(id, opacity)

> Change l'opacité du champ de texte référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la zone de texte  
`opacity`|`Fixnum`|Opacité, entre 0 et 255. Si aucune opacité n'est donnée, la commande renverra la valeur de l'opacité du champ  




##### Command.textfield_press?(id, *key)

> Renvoie true si la souris est pressée en continu sur le champ de texte référencé par son ID, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la zone de texte  
`*key`|`Key`|Bouton de la souris, par défaut :mouse_left  




##### Command.textfield_release?(id, *key)

> Renvoie true si la souris est relâchée sur le champ de texte référencé par son ID, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la zone de texte  
`*key`|`Key`|Bouton de la souris, par défaut :mouse_left  




##### Command.textfield_repeat?(id, *key)

> Renvoie true si la souris clique de manière répétée sur le champ de texte référencé par son ID, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la zone de texte  
`*key`|`Key`|Bouton de la souris, par défaut :mouse_left  




##### Command.textfield_set_value(id, value)

> Attribue une valeur à un champ de texte référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la zone de texte  
`value`|`TextfieldType`|Valeur à attribuer  




##### Command.textfield_text_show(id, text, x, y, w, profile, *range, *active, *opacity)

> Affiche un champ de texte permettant de saisir du texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du champ de texte  
`text`|`String`|Texte du champ à afficher par défaut  
`x`|`Fixnum`|Position X du champ  
`y`|`Fixnum`|Position Y du champ  
`w`|`Fixnum`|Largeur du champ de texte  
`profile`|`Fixnum`|Référence du profile du champ de texte  
`*range`|`Range`|Intervalle du nombre de caractères autorisés, peut être occulté  
`*active`|`Boolean`|Défini si le textfield est actif à sa création (true oui, false non). Par défaut: true  
`*opacity`|`Fixnum`|Défini l'opacité du textfield, par défaut, 255  




##### Command.textfield_trigger?(id, *key)

> Renvoie true si la souris clique une fois sur le champ de texte référencé par son ID, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la zone de texte  
`*key`|`Key`|Bouton de la souris, par défaut :mouse_left  




##### Command.textfield_visible(id, flag)

> Change la visibilité du champ de texte référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la zone de texte  
`flag`|`Boolean`|True pour visible, false pour invisible  




##### Command.textfield_visible?(id)

> Renvoie true si le champ de texte référencé par son ID est visible, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la zone de texte  




##### Command.texts_clear

> Supprime tous les textes

  




##### Command.tile_id(x, y, layer, *map_id)

> Renvoie l'ID de la tile pointée par les coordonnées X,Y

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  
`layer`|`Fixnum`|Numéro de la couche  
`*map_id`|`Fixnum`|ID d'une carte, si aucun argument n'est donné, map_id vaut l'id de la map courante  




##### Command.time_day

> Renvoie le jour actuel

  




##### Command.time_hour

> Renvoie l' heure actuelle

  




##### Command.time_min

> Renvoie la minute actuelle

  




##### Command.time_month

> Renvoie le mois actuel

  




##### Command.time_sec

> Renvoie la seconde actuelle

  




##### Command.time_year

> Renvoie l'année actuelle

  




##### Command.timer

> Renvoie la valeur du chronomètre

  




##### Command.to_deg(x)

> Renvoie x (supposé radian) converti en degrés

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  




##### Command.to_rad(x)

> Renvoie x (supposé degré) converti en radians

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  




##### Command.tone(red, green, blue, *gray)

> Renvoie une teinte

  
Nom|Type|Description  
--- | --- | ---  
`red`|`Fixnum`|Valeur de rouge, entre -255 et 255  
`green`|`Fixnum`|Valeur de vert, entre -255 et 255  
`blue`|`Fixnum`|Valeur de bleu, entre -255 et 255  
`*gray`|`Fixnum`|Valeur de gris, entre 0 et 255, par défaut 0 !  




##### Command.total_enemies

> Renvoie le nombre d'enemis en combat (mort ou vivant)

  




##### Command.troop_member(id, position)

> Renvoie l'id d'un monstre d'un groupe de monstres référencé par son ID et par sa position (0 = premier).

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du groupe de monstre  
`position`|`Fixnum`|Position du monstre  




##### Command.troop_member_x(id, position)

> Renvoie la position X d'un monstre d'un groupe de monstres référencé par son ID et par sa position (0 = premier) tel que défini dans la base de données.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du groupe de monstre  
`position`|`Fixnum`|Position du monstre  




##### Command.troop_member_y(id, position)

> Renvoie la position Y d'un monstre d'un groupe de monstres référencé par son ID et par sa position (0 = premier) tel que défini dans la base de données.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du groupe de monstre  
`position`|`Fixnum`|Position du monstre  




##### Command.troop_members(id)

> Renvoie un tableau des enemy_id d'un groupe de monstres référencé par son ID.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du groupe de monstre  




##### Command.troop_name(id)

> Renvoie le nom d'un groupe de monstres référencé par son ID.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du groupe de monstre  




##### Command.troop_size(id)

> Renvoie la taille d'un groupe de monstres référencé par son ID.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du groupe de monstre  




##### Command.unflash_rect(x, y, width, height)

> Arrête de faire clignoter les cases référencées par le rectangle

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`width`|`Fixnum`|Largeur du rectangle  
`height`|`Fixnum`|Largeur du rectangle  




##### Command.unflash_square(x, y)

> Arrête le clignotement

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  




##### Command.version_id

> Renvoie l'ID de la version du jeu

  




##### Command.wait(duration)

> Attend un nombre de frames donné

  
Nom|Type|Description  
--- | --- | ---  
`duration`|`Fixnum`|Nombre de frames à attendre  




##### Command.wait_release(key)

> Attend le relâchement d'une touche

  
Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche à attendre  




##### Command.wait_trigger(key)

> Attend l'appui d'une touche

  
Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche à attendre  




##### Command.wait_with(time, &block)

> Attend en exécutant une action

  
Nom|Type|Description  
--- | --- | ---  
`time`|`Fixnum`|Temps d'attente  
`&block`|`Block`|Action à exécuter ({action})  




##### Command.wall?(x, y)

> Renvoie true si les coordonnées sont sur un mur, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  




##### Command.weapon_agility(id)

> Renvoie l'apport d'agilité d'une arme référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.weapon_attack_power(id)

> Renvoie la puissance d'attaque d'une arme référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.weapon_count(id)

> Renvoie le nombre d'armes (référencées par un ID) possédées par l'équipe

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme à compter  




##### Command.weapon_defense_power(id)

> Renvoie la puissance de défense d'une arme référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.weapon_description(id)

> Renvoie la description de l'arme référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  




##### Command.weapon_equiped?(id, *member_id)

> Renvoie true si l'arme référencée par son ID est équipée par un des membres de l'équipe, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  
`*member_id`|`Fixnum`|Id du membre de l'équipe. Si aucun membre_id n'est spécifié, la commande vérifiera pour toute l'équipe   




##### Command.weapon_icon(id)

> Renvoie l'index de l'icone de l'arme référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  




##### Command.weapon_luck(id)

> Renvoie l'apport de chance d'une arme référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.weapon_magic_attack_power(id)

> Renvoie la puissance d'attaque magique d'une arme référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.weapon_magic_defense_power(id)

> Renvoie la puissance de défense magique d'une arme référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.weapon_max_hit_points(id)

> Renvoie le maximum des points de vie d'une arme référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.weapon_max_magic_points(id)

> Renvoie le maximum des points de magie d'une arme référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  




##### Command.weapon_name(id)

> Renvoie le nom de l'arme référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  




##### Command.weapon_note(id)

> Renvoie le commentaire de l'arme référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  




##### Command.weapon_price(id)

> Renvoie le prix de l'arme référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  




##### Command.weapon_type(id)

> Renvoie le type de l'arme référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  




##### Command.weapons_possessed

> Renvoie la liste des armes possédées

  




##### Command.website(url)

> Ouvre la page web passée en argument

  
Nom|Type|Description  
--- | --- | ---  
`url`|`String`|Url à charger  




##### Command.window_activate(id)

> Rend la fenêtre référencée par son ID active

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  




##### Command.window_closed?(id)

> Renvoie true si la fenêtre référencée par son ID est fermée, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  




##### Command.window_content(id, *content, *resize)

> Change le contenu de la fenêtre référencée par son ID, si aucun contenu n'est donné, la commande renverra le contenu de la fenêtre

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  
`*content`|`Object`|Valeur affichée de la fenêtre  
`*resize`|`Boolean`|Si cet argument vaut true, la taille de la fenêtre est recalculée  




##### Command.window_current_symbol(id)

> Renvoie, pour une fenêtre de sélection, le symbole sélectionné

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  




##### Command.window_deactivate(id)

> Rend la fenêtre référencée par son ID inactive

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  




##### Command.window_dimension(id, width, height, *duration, *wait_flag)

> Change la dimension de la fenêtre

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  
`width`|`Fixnum`|Largeur de la fenêtre  
`height`|`Fixnum`|Hauteur de la fenêtre  
`*duration`|`Fixnum`|Durée du déplacement  
`*wait_flag`|`Boolean`|si cet argument vaut true, on attendra la fin du déplacement  




##### Command.window_height(id)

> Renvoie la hauteur de la fenêtre référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  




##### Command.window_move(id, x, y, w, h, opacity, *duration, *wait_flag)

> Déplacement sur tous les paramètres

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`w`|`Fixnum`|Largeur  
`h`|`Fixnum`|Hauteur  
`opacity`|`Fixnum`|Opacité  
`*duration`|`Fixnum`|Durée du déplacement  
`*wait_flag`|`Boolean`|si cet argument vaut true, on attendra la fin du déplacement  




##### Command.window_moveto(id, x, y, *duration, *wait_flag)

> Change les coordonnées X et Y de la fenêtre

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  
`x`|`Fixnum`|Coordonnée X  
`y`|`Fixnum`|Coordonnée Y  
`*duration`|`Fixnum`|Durée du déplacement  
`*wait_flag`|`Boolean`|si cet argument vaut true, on attendra la fin du déplacement  




##### Command.window_opacity(id, *value, *duration, *wait_flag)

> Change l'opacité de la fenêtre, si aucune valeur n'est spécifiée, la commande renvoie la valeur de l'opacité

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  
`*value`|`Fixnum`|Valeur de l'opacité à changer, entre 0 et 255.  
`*duration`|`Fixnum`|Durée du déplacement  
`*wait_flag`|`Boolean`|si cet argument vaut true, on attendra la fin du déplacement  




##### Command.window_opened?(id)

> Renvoie true si la fenêtre référencée par son ID est ouverte, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  




##### Command.window_width(id)

> Renvoie la largeur de la fenêtre référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  




##### Command.window_x(id, *x)

> Change la coordonnée X de la fenêtre référencée par son ID, si aucun X n'est donné, la commande renverra la valeur actuelle de x

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  
`*x`|`Fixnum`|Coordonnée X de la fenêtre  




##### Command.window_y(id, *y)

> Change la coordonnée Y de la fenêtre référencée par son ID, si aucun Y n'est donné, la commande renverra la valeur actuelle de y

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  
`*y`|`Fixnum`|Coordonnée Y de la fenêtre  




