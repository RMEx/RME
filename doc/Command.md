#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Classes et modules](__class-and-module_list.md) > **Command**  
- - -  
#Command
Collection des commandes EventExtender

##Liste des méthodes
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
*    [Command.actor_change_equip(id, slot, object_id)](#commandactor_change_equipid-slot-object_id)
*    [Command.actor_character_index(id)](#commandactor_character_indexid)
*    [Command.actor_character_name(id)](#commandactor_character_nameid)
*    [Command.actor_class(id)](#commandactor_classid)
*    [Command.actor_counter_attack_rate(id)](#commandactor_counter_attack_rateid)
*    [Command.actor_critical_evasion_rate(id)](#commandactor_critical_evasion_rateid)
*    [Command.actor_critical_rate(id)](#commandactor_critical_rateid)
*    [Command.actor_defense(id)](#commandactor_defenseid)
*    [Command.actor_description(id)](#commandactor_descriptionid)
*    [Command.actor_equip(id, slot)](#commandactor_equipid-slot)
*    [Command.actor_equip_accessory(id, object_id)](#commandactor_equip_accessoryid-object_id)
*    [Command.actor_equip_body(id, object_id)](#commandactor_equip_bodyid-object_id)
*    [Command.actor_equip_head(id, object_id)](#commandactor_equip_headid-object_id)
*    [Command.actor_equip_shield(id, object_id)](#commandactor_equip_shieldid-object_id)
*    [Command.actor_equip_weapon(id, object_id)](#commandactor_equip_weaponid-object_id)
*    [Command.actor_evasion_rate(id)](#commandactor_evasion_rateid)
*    [Command.actor_exp(id)](#commandactor_expid)
*    [Command.actor_exp_for_next_level(id)](#commandactor_exp_for_next_levelid)
*    [Command.actor_experience_rate(id)](#commandactor_experience_rateid)
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
*    [Command.actor_target_rate(id)](#commandactor_target_rateid)
*    [Command.actor_tp(id)](#commandactor_tpid)
*    [Command.actor_tp_charge_rate(id)](#commandactor_tp_charge_rateid)
*    [Command.actor_tp_regeneration_rate(id)](#commandactor_tp_regeneration_rateid)
*    [Command.actor_weapon(id)](#commandactor_weaponid)
*    [Command.actor_weapons(id)](#commandactor_weaponsid)
*    [Command.alt_gr?](#commandalt_gr)
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
*    [Command.asin(x)](#commandasinx)
*    [Command.asinh(x)](#commandasinhx)
*    [Command.atan(x)](#commandatanx)
*    [Command.atan2(x, y)](#commandatan2x-y)
*    [Command.atanh(x)](#commandatanhx)
*    [Command.battle_count](#commandbattle_count)
*    [Command.call_load_screen](#commandcall_load_screen)
*    [Command.call_title_screen](#commandcall_title_screen)
*    [Command.caps_lock?](#commandcaps_lock)
*    [Command.click_time(key)](#commandclick_timekey)
*    [Command.color(red, green, blue, *alpha)](#commandcolorred-green-blue-alpha)
*    [Command.cos(x)](#commandcosx)
*    [Command.cosh(x)](#commandcoshx)
*    [Command.ctrl?(key)](#commandctrlkey)
*    [Command.currency](#commandcurrency)
*    [Command.current_enemies](#commandcurrent_enemies)
*    [Command.current_troop](#commandcurrent_troop)
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
*    [Command.event_collide?(idA, idB)](#commandevent_collideida-idb)
*    [Command.event_direction(id)](#commandevent_directionid)
*    [Command.event_in_screen?(id)](#commandevent_in_screenid)
*    [Command.event_look_at?(idA, idB, scope, *metric)](#commandevent_look_atida-idb-scope-metric)
*    [Command.event_pixel_x(id)](#commandevent_pixel_xid)
*    [Command.event_pixel_y(id)](#commandevent_pixel_yid)
*    [Command.event_screen_x(id)](#commandevent_screen_xid)
*    [Command.event_screen_y(id)](#commandevent_screen_yid)
*    [Command.event_x(id)](#commandevent_xid)
*    [Command.event_y(id)](#commandevent_yid)
*    [Command.fadeout(*time)](#commandfadeouttime)
*    [Command.fresh_event_id](#commandfresh_event_id)
*    [Command.gain_gold(amount)](#commandgain_goldamount)
*    [Command.game_title](#commandgame_title)
*    [Command.get(array, index)](#commandgetarray-index)
*    [Command.give_armor(id, amount, *include_equipement)](#commandgive_armorid-amount-include_equipement)
*    [Command.give_item(id, amount)](#commandgive_itemid-amount)
*    [Command.give_weapon(id, amount, *include_equipement)](#commandgive_weaponid-amount-include_equipement)
*    [Command.gold](#commandgold)
*    [Command.has_armor?(id, *include_equipement)](#commandhas_armorid-include_equipement)
*    [Command.has_item?(id)](#commandhas_itemid)
*    [Command.has_weapon?(id, *include_equipement)](#commandhas_weaponid-include_equipement)
*    [Command.hypot(x, y)](#commandhypotx-y)
*    [Command.id_at(x, y)](#commandid_atx-y)
*    [Command.import_label(index, idlabel)](#commandimport_labelindex-idlabel)
*    [Command.import_switch(index, idswitch)](#commandimport_switchindex-idswitch)
*    [Command.import_variable(index, idvar)](#commandimport_variableindex-idvar)
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
*    [Command.length(array)](#commandlengtharray)
*    [Command.load_game(index, *time)](#commandload_gameindex-time)
*    [Command.lose_gold(amount)](#commandlose_goldamount)
*    [Command.map_id](#commandmap_id)
*    [Command.map_name](#commandmap_name)
*    [Command.max(a, b)](#commandmaxa-b)
*    [Command.max_event_id](#commandmax_event_id)
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
*    [Command.mouse_click_event?(events)](#commandmouse_click_eventevents)
*    [Command.mouse_current_key(method)](#commandmouse_current_keymethod)
*    [Command.mouse_dragging?](#commandmouse_dragging)
*    [Command.mouse_hover_event?(events)](#commandmouse_hover_eventevents)
*    [Command.mouse_in?(rectangle)](#commandmouse_inrectangle)
*    [Command.mouse_last_rect](#commandmouse_last_rect)
*    [Command.mouse_point](#commandmouse_point)
*    [Command.mouse_press?(key)](#commandmouse_presskey)
*    [Command.mouse_press_event?(events, *key)](#commandmouse_press_eventevents-key)
*    [Command.mouse_rect](#commandmouse_rect)
*    [Command.mouse_release?(key)](#commandmouse_releasekey)
*    [Command.mouse_release_event?(events, *key)](#commandmouse_release_eventevents-key)
*    [Command.mouse_repeat?(key)](#commandmouse_repeatkey)
*    [Command.mouse_repeat_event?(events, *key)](#commandmouse_repeat_eventevents-key)
*    [Command.mouse_square_x](#commandmouse_square_x)
*    [Command.mouse_square_y](#commandmouse_square_y)
*    [Command.mouse_trigger?(key)](#commandmouse_triggerkey)
*    [Command.mouse_trigger_event?(events, *key)](#commandmouse_trigger_eventevents-key)
*    [Command.mouse_x](#commandmouse_x)
*    [Command.mouse_y](#commandmouse_y)
*    [Command.num_lock?](#commandnum_lock)
*    [Command.page_runnable?(map_id, event_id, page_id, *context)](#commandpage_runnablemap_id-event_id-page_id-context)
*    [Command.parallax_autoscroll_x(id, speed, *duration, *wait_flag)](#commandparallax_autoscroll_xid-speed-duration-wait_flag)
*    [Command.parallax_autoscroll_y(id, speed, *duration, *wait_flag)](#commandparallax_autoscroll_yid-speed-duration-wait_flag)
*    [Command.parallax_blend(id, blend_type)](#commandparallax_blendid-blend_type)
*    [Command.parallax_erase(id)](#commandparallax_eraseid)
*    [Command.parallax_opacity(id, opacity, *duration, *wait_flag)](#commandparallax_opacityid-opacity-duration-wait_flag)
*    [Command.parallax_scroll_x(id, speed)](#commandparallax_scroll_xid-speed)
*    [Command.parallax_scroll_y(id, speed)](#commandparallax_scroll_yid-speed)
*    [Command.parallax_show(id, name, *z, *opacity, *auto_x, *auto_y, *scroll_x, *scroll_y, *blend_type, *zoom_x, *zoom_y, *tone)](#commandparallax_showid-name-z-opacity-auto_x-auto_y-scroll_x-scroll_y-blend_type-zoom_x-zoom_y-tone)
*    [Command.parallax_tone(id, tone, *duration, *wait_flag)](#commandparallax_toneid-tone-duration-wait_flag)
*    [Command.parallax_transform(id, duration, *wait_flag, *zoom_x, *zoom_y, *opacity, *tone)](#commandparallax_transformid-duration-wait_flag-zoom_x-zoom_y-opacity-tone)
*    [Command.parallax_zoom(id, zoom, *duration, *wait_flag)](#commandparallax_zoomid-zoom-duration-wait_flag)
*    [Command.parallax_zoom_x(id, zoom, *duration, *wait_flag)](#commandparallax_zoom_xid-zoom-duration-wait_flag)
*    [Command.parallax_zoom_y(id, zoom, *duration, *wait_flag)](#commandparallax_zoom_yid-zoom-duration-wait_flag)
*    [Command.parallaxes_clear](#commandparallaxes_clear)
*    [Command.percent(value, max)](#commandpercentvalue-max)
*    [Command.pi](#commandpi)
*    [Command.pick_random(*elts)](#commandpick_randomelts)
*    [Command.picture_angle(id, angle)](#commandpicture_angleid-angle)
*    [Command.picture_blend(id, mode)](#commandpicture_blendid-mode)
*    [Command.picture_erase(id)](#commandpicture_eraseid)
*    [Command.picture_flip(id)](#commandpicture_flipid)
*    [Command.picture_move(id, x, y, zoom_x, zoom_y, duration, *wait_flag, *opacity, *blend_type, *origin)](#commandpicture_moveid-x-y-zoom_x-zoom_y-duration-wait_flag-opacity-blend_type-origin)
*    [Command.picture_opacity(id, opacity, *duration, *wait_flag)](#commandpicture_opacityid-opacity-duration-wait_flag)
*    [Command.picture_origin(id, origin)](#commandpicture_originid-origin)
*    [Command.picture_pin(id, x, y)](#commandpicture_pinid-x-y)
*    [Command.picture_position(id, x, y, *duration, *wait_flag)](#commandpicture_positionid-x-y-duration-wait_flag)
*    [Command.picture_rotate(id, speed)](#commandpicture_rotateid-speed)
*    [Command.picture_scroll(id, vitesse)](#commandpicture_scrollid-vitesse)
*    [Command.picture_scroll_x(id, vitesse)](#commandpicture_scroll_xid-vitesse)
*    [Command.picture_scroll_y(id, vitesse)](#commandpicture_scroll_yid-vitesse)
*    [Command.picture_shake(id, power, speed, duration)](#commandpicture_shakeid-power-speed-duration)
*    [Command.picture_show(id, name, *x, *y, *origin, *zoom_x, *zoom_y, *opacity, *blend_type)](#commandpicture_showid-name-x-y-origin-zoom_x-zoom_y-opacity-blend_type)
*    [Command.picture_show_enemy(pic_id, id, position)](#commandpicture_show_enemypic_id-id-position)
*    [Command.picture_tone(id, tone, *duration, *wait_flag)](#commandpicture_toneid-tone-duration-wait_flag)
*    [Command.picture_unpin(id)](#commandpicture_unpinid)
*    [Command.picture_wave(id, amplitude, vitesse)](#commandpicture_waveid-amplitude-vitesse)
*    [Command.picture_x(id, x, *duration, *wait_flag)](#commandpicture_xid-x-duration-wait_flag)
*    [Command.picture_y(id, x, *duration, *wait_flag)](#commandpicture_yid-x-duration-wait_flag)
*    [Command.picture_zoom(id, zoom_x, *zoom_y, *duration, *wait_flag)](#commandpicture_zoomid-zoom_x-zoom_y-duration-wait_flag)
*    [Command.picture_zoom_x(id, zoom, *duration, *wait_flag)](#commandpicture_zoom_xid-zoom-duration-wait_flag)
*    [Command.picture_zoom_y(id, zoom, *duration, *wait_flag)](#commandpicture_zoom_yid-zoom-duration-wait_flag)
*    [Command.pictures_clear](#commandpictures_clear)
*    [Command.pictures_collide?(id, id2)](#commandpictures_collideid-id2)
*    [Command.pictures_perfect_collide?(idA, idB)](#commandpictures_perfect_collideida-idb)
*    [Command.pixel_in_picture?(id, x, y, *precise)](#commandpixel_in_pictureid-x-y-precise)
*    [Command.pixels_between(idA, idB)](#commandpixels_betweenida-idb)
*    [Command.play_time](#commandplay_time)
*    [Command.player_direction](#commandplayer_direction)
*    [Command.player_in_screen?](#commandplayer_in_screen)
*    [Command.player_pixel_x](#commandplayer_pixel_x)
*    [Command.player_pixel_y](#commandplayer_pixel_y)
*    [Command.player_screen_x](#commandplayer_screen_x)
*    [Command.player_screen_y](#commandplayer_screen_y)
*    [Command.player_x](#commandplayer_x)
*    [Command.player_y](#commandplayer_y)
*    [Command.qte(key, time, *strict)](#commandqtekey-time-strict)
*    [Command.random(min, max)](#commandrandommin-max)
*    [Command.random_combination(len, *keys)](#commandrandom_combinationlen-keys)
*    [Command.random_figures(x)](#commandrandom_figuresx)
*    [Command.region_id(x, y)](#commandregion_idx-y)
*    [Command.rm_kill](#commandrm_kill)
*    [Command.save_count](#commandsave_count)
*    [Command.save_delete(index)](#commandsave_deleteindex)
*    [Command.save_exists?(index)](#commandsave_existsindex)
*    [Command.save_game(index)](#commandsave_gameindex)
*    [Command.scene_call(scene)](#commandscene_callscene)
*    [Command.scene_clear_history](#commandscene_clear_history)
*    [Command.scene_goto(scene)](#commandscene_gotoscene)
*    [Command.scene_return](#commandscene_return)
*    [Command.scroll_lock?](#commandscroll_lock)
*    [Command.session_username](#commandsession_username)
*    [Command.set_actor_name(id, new_name)](#commandset_actor_nameid-new_name)
*    [Command.set_actor_nickname(id, new_name)](#commandset_actor_nicknameid-new_name)
*    [Command.shift?](#commandshift)
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
*    [Command.sqrt(x)](#commandsqrtx)
*    [Command.square_passable?(x, y, direction)](#commandsquare_passablex-y-direction)
*    [Command.squares_between(idA, idB)](#commandsquares_betweenida-idb)
*    [Command.start_map_id](#commandstart_map_id)
*    [Command.start_new_game](#commandstart_new_game)
*    [Command.start_x](#commandstart_x)
*    [Command.start_y](#commandstart_y)
*    [Command.steps](#commandsteps)
*    [Command.tan(x)](#commandtanx)
*    [Command.tanh(x)](#commandtanhx)
*    [Command.team_size](#commandteam_size)
*    [Command.terrain_tag(x, y)](#commandterrain_tagx-y)
*    [Command.text_change(id, text)](#commandtext_changeid-text)
*    [Command.text_erase(id)](#commandtext_eraseid)
*    [Command.text_move(id, duration, wait_flag, x, y, zoom_x, zoom_y, opacity, blend_type, origin)](#commandtext_moveid-duration-wait_flag-x-y-zoom_x-zoom_y-opacity-blend_type-origin)
*    [Command.text_opacity(id, opacity, *duration, *wait_flag)](#commandtext_opacityid-opacity-duration-wait_flag)
*    [Command.text_position(id, x, y, *duration, *wait_flag)](#commandtext_positionid-x-y-duration-wait_flag)
*    [Command.text_profile(id, profile)](#commandtext_profileid-profile)
*    [Command.text_rotate(id, speed)](#commandtext_rotateid-speed)
*    [Command.text_show(id, text, profile, x, y, *zoom_x, *zoom_y, *opacity, *blend_type, *origin)](#commandtext_showid-text-profile-x-y-zoom_x-zoom_y-opacity-blend_type-origin)
*    [Command.text_x(id, x, *duration, *wait_flag)](#commandtext_xid-x-duration-wait_flag)
*    [Command.text_y(id, y, *duration, *wait_flag)](#commandtext_yid-y-duration-wait_flag)
*    [Command.text_zoom(id, zoom_x, zoom_y, *duration, *wait_flag)](#commandtext_zoomid-zoom_x-zoom_y-duration-wait_flag)
*    [Command.text_zoom_x(id, zoom_x, *duration, *wait_flag)](#commandtext_zoom_xid-zoom_x-duration-wait_flag)
*    [Command.text_zoom_y(id, zoom_y, *duration, *wait_flag)](#commandtext_zoom_yid-zoom_y-duration-wait_flag)
*    [Command.tile_id(x, y)](#commandtile_idx-y)
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
*    [Command.version_id](#commandversion_id)
*    [Command.wait(duration)](#commandwaitduration)
*    [Command.wait_release(key)](#commandwait_releasekey)
*    [Command.wait_trigger(key)](#commandwait_triggerkey)
*    [Command.wait_with(time, &block)](#commandwait_withtime-&block)
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


##Description des méthodes
##### Command.a_save_exists?

> Renvoie true si au moins une sauvegade a été faite, false sinon

  
> 





##### Command.acos(x)

> Renvoie l'arc cosinus de x

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  






##### Command.acosh(x)

> Renvoie l'inverse hyperbolique cosinus de x

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  






##### Command.active_actor

> renvoie l'identifiant d'un acteur si il est entrain de sélectionner une action, nil sinon

  
> 





##### Command.active_actor?

> renvoie true si un acteur est entrain de choisir une action, false sinon

  
> 





##### Command.actor_accessory(id)

> renvoie l'id l' accessoire équipé du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_agility(id)

> renvoie les points d'agilité du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_armors(id)

> renvoie le tableau des ID's des armures équipées du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_attack(id)

> renvoie les points d'attaque du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_body(id)

> renvoie l'id de l'armure équipée du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_change_equip(id, slot, object_id)

> Change l'équipement du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`slot`|`Symbol`|Slot d'équipement (:Weapon, :Body, :Shield, : Head, :Accessory)  
`object_id`|`Fixnum`|ID de l'Arme ou de l'Armure (La commande déduira s'il doit s'agir d'une arme ou d'une armure)  






##### Command.actor_character_index(id)

> renvoie l'index du charset du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_character_name(id)

> renvoie le nom du charset du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_class(id)

> renvoie l'ID de la classe du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_counter_attack_rate(id)

> renvoie la probabilité d'un contre (sur une attaque physique) du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_critical_evasion_rate(id)

> renvoie la probabilité de faire un coup critique en préemptif du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_critical_rate(id)

> renvoie la probabilité de coup critique du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_defense(id)

> renvoie les points de défense du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_description(id)

> renvoie la déscription du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_equip(id, slot)

> Renvoie l'id de l'équipement du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`slot`|`Symbol`|Slot d'équipement soit :Weapon, :Head, :Body, :Shield ou :Accessory  






##### Command.actor_equip_accessory(id, object_id)

> Change l'accessoire du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`object_id`|`Fixnum`|ID de l'Armure  






##### Command.actor_equip_body(id, object_id)

> Change l'armure du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`object_id`|`Fixnum`|ID de l'Armure  






##### Command.actor_equip_head(id, object_id)

> Change le casque du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`object_id`|`Fixnum`|ID de l'Armure  






##### Command.actor_equip_shield(id, object_id)

> Change le bouclier du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`object_id`|`Fixnum`|ID de l'Armure  






##### Command.actor_equip_weapon(id, object_id)

> Change l'arme du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`object_id`|`Fixnum`|ID de l'Arme  






##### Command.actor_evasion_rate(id)

> renvoie la probabilité d'esquiver une attaque physique du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_exp(id)

> renvoie les points d'expériences du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_exp_for_next_level(id)

> renvoie le nombre d'expérience nécéssaire pour passer au niveau suivant du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_experience_rate(id)

> renvoie le pourcentage de la variation d'acquisition d'expérience du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_face_index(id)

> renvoie l'index du faceset du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_face_name(id)

> renvoie le nom du faceset du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_floor_damage_rate(id)

> renvoie le pourcentage de dommage des terrains reçu du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_forget(id, skill_id)

> Oublie la technique passée en argument au héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`skill_id`|`Fixnum`|ID de le technique  






##### Command.actor_give_exp(id, exp)

> fait gagner de l'expérience au héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`exp`|`Fixnum`|Expérience donnée  






##### Command.actor_guard_effect_rate(id)

> renvoie la force de défense (diminution de l'attaque subie) du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_has_accessory?(id)

> renvoie true si le héros référencé par son ID est équipé d'un accessoire, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_has_body?(id)

> renvoie true si le héros référencé par son ID est équipé d'une armure, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_has_head?(id)

> renvoie true si le héros référencé par son ID est équipé d'une casque, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_has_shield?(id)

> renvoie true si le héros référencé par son ID est équipé d'un bouclier, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_has_weapon?(id)

> renvoie true si le héros référencé par son ID est équipé d'une arme, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_head(id)

> renvoie l'id du casque équipée du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_hit_rate(id)

> renvoie la probabilité de toucher du héros référencé par son ID sur un ennemi

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_hp(id)

> renvoie les points de vie du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_hp_regeneration_rate(id)

> renvoie le pourcentage de régénration de HP à chaque tour du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_knowns?(id, skill_id)

> Renvoie true si le héros référencé par son ID connait la technique référencée par son ID, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`skill_id`|`Fixnum`|ID de le technique  






##### Command.actor_learn(id, skill_id)

> Apprend la technique passée en argument au héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`skill_id`|`Fixnum`|ID de le technique  






##### Command.actor_level(id)

> renvoie le niveau du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_level_down(id)

> fait perdre un niveau au héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_level_max(id)

> renvoie le niveau maximum du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_level_up(id)

> fait gagner un niveau au héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_luck(id)

> renvoie les points de chance du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_magic_attack(id)

> renvoie les points d'attaque magique du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_magic_defense(id)

> renvoie les points de défense magique du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_magical_damage_rate(id)

> renvoie le pourcentage de dommage magique reçu du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_magical_evasion_rate(id)

> renvoie la probabilité d'une esquiver une attaque magique du héros référencé par son ID par un ennemi

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_magical_reflection_rate(id)

> renvoie la probabilité d'une réflexion magique du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_max_hp(id)

> renvoie le nombre de points de vie maximum du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_max_mp(id)

> renvoie le nombre de points de magie du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_mp(id)

> renvoie les points de magie du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_mp_cost_rate(id)

> renvoie le facteur d'un cout de MP (pour une attaque faisant varier la consommation de MP) du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_mp_regeneration_rate(id)

> renvoie le pourcentage de régénration MP à chaque tour du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_name(id)

> renvoie le nom du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_nickname(id)

> renvoie le surnom du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_note(id)

> renvoie le commentaire de la base de données du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_optimize_equipement(id)

> Optimise l'équipement du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_pharmacology(id)

> renvoie le pourcentage de HP/MP récupéré via un objet du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_physical_damage_rate(id)

> renvoie le pourcentage de dommage physique reçu du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_recovery_effect_rate(id)

> renvoie le pourcentage de MP/HP recu, du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_set_graphic(id, character_name, character_index, face_name, face_index)

> Change les graphisme du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`character_name`|`String`|Charset  
`character_index`|`Fixnum`|index du Charset  
`face_name`|`String`|Faceset  
`face_index`|`Fixnum`|Index du faceset  






##### Command.actor_shield(id)

> renvoie l'id du bouclier équipé du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_skills(id)

> renvoie le tableau des ID's des techniques connues du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_target_rate(id)

> renvoie la probabilité d'être ciblé par un ennemi, du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_tp(id)

> renvoie les points de temps du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_tp_charge_rate(id)

> renvoie le facteur de cout de TP (pour une attaque faisant varier la consommation de TP) du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_tp_regeneration_rate(id)

> renvoie le pourcentage de régénration de TP par tour du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_weapon(id)

> renvoie l'id de l'arme équipée du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.actor_weapons(id)

> renvoie le tableau des ID's des armes équipées du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  






##### Command.alt_gr?

> Renvoie true si la touche ALT_GR (ou la combinaison CTRL+ALT) est appuyée au moment de l'appel, false sinon

  
> 





##### Command.angle_xy(xa, ya, xb, yb)

> Renvoie l' angle x->y entre deux points, défini entre 0 et 360 degrés

  
> Nom|Type|Description  
--- | --- | ---  
`xa`|`Fixnum`|Coordonnée X du point A  
`ya`|`Fixnum`|Coordonnées Y du point A  
`xb`|`Fixnum`|Coordonnées X du point B  
`yb`|`Fixnum`|Coordonnées Y du point B  






##### Command.apply_percent(percent, max)

> Applique percent à max

  
> Nom|Type|Description  
--- | --- | ---  
`percent`|`Fixnum`|Valeur à appliquer  
`max`|`Fixnum`|Valeur maximum  




Exemple  
```ruby  
Command.apply_percent(50, 80) # Renvoie 40 (parce que 50% de 80 = 40)  
```



##### Command.armor_agility(id)

> Renvoie l'apport d'agilité d'une armure référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.armor_attack_power(id)

> Renvoie la puissance d'attaque d'une armure référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.armor_count(id)

> Renvoie le nombre d'armures référencées par son ID possédées par l'équipe

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure à compter  






##### Command.armor_defense_power(id)

> Renvoie la puissance de défense d'une armure référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.armor_description(id)

> Renvoie la description de l'armure référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  






##### Command.armor_equiped?(id, *member_id)

> Renvoie true si l'armure référencé par son ID est équipée par un des membres de l'équipe, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  
`*member_id`|`Fixnum`|Id du membre de l'équipe. Si aucun membre_id n'est spécifié, la commande vérifiera pour toute l'équipe   






##### Command.armor_icon(id)

> Renvoie l'index de l'icone  de l'armure référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  






##### Command.armor_luck(id)

> Renvoie l'apport de chance d'une armure référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.armor_magic_attack_power(id)

> Renvoie la puissance d'attaque magique d'une armure référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.armor_magic_defense_power(id)

> Renvoie la puissance de défense magique d'une armure référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.armor_max_hit_points(id)

> Renvoie le maximum des points de vie d'une armure référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.armor_max_magic_points(id)

> Renvoie le maximum des points de magie d'une armure référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.armor_name(id)

> Renvoie le nom de l'armure référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  






##### Command.armor_note(id)

> Renvoie le commentaire de l'armure référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  






##### Command.armor_price(id)

> Renvoie le prix  de l'armure référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  






##### Command.armor_type(id)

> Renvoie le type de l'armure référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  






##### Command.asin(x)

> Renvoie l'arc sinus de x

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  






##### Command.asinh(x)

> Renvoie l'inverse hyperbolique sinus de x

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  






##### Command.atan(x)

> Renvoie l'arc tangeant de x

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  






##### Command.atan2(x, y)

> Renvoie l'arc tangeant pour x et y

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  
`y`|`Numeric`|Valeur numérique  






##### Command.atanh(x)

> Renvoie l'inverse hyperbolique tangeant de x

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  






##### Command.battle_count

> Renvoie le nombre de combat effectués par partie

  
> 





##### Command.call_load_screen

> Renvoi à la scene de chargement de partie

  
> 





##### Command.call_title_screen

> Renvoi à l'écran titre

  
> 





##### Command.caps_lock?

> Renvoie true si le clavier est en mode CAPS_LOCK au moment de l'appel, false sinon

  
> 





##### Command.click_time(key)

> Renvoie le nombre de frame pressée d'une touche en cours

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche à vérifier  






##### Command.color(red, green, blue, *alpha)

> Renvoie une couleur

  
> Nom|Type|Description  
--- | --- | ---  
`red`|`Fixnum`|Valeur de rouge  
`green`|`Fixnum`|Valeur de vert  
`blue`|`Fixnum`|Valeur de bleu  
`*alpha`|`Fixnum`|Opacité, par défaut 255!  






##### Command.cos(x)

> Renvoie le cosinus de x

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  






##### Command.cosh(x)

> Renvoie le cosinus hyperbolique de x

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  






##### Command.ctrl?(key)

> Renvoie true si la touche CTRL (ou une combinaison CTRL+key) est appuyée au moment de l'appel, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant la touche (cf:attributs) mise en combinaison  






##### Command.currency

> Renvoie la monnaie du jeu

  
> 





##### Command.current_enemies

> Renvoie un tableau contenant les ennemis en cours de combat

  
> 





##### Command.current_troop

> Renvoie l'identifiant du groupe en cours de combat

  
> 





##### Command.enemy_agility(position)

> renvoie les points d'agilité de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_attack(position)

> renvoie les points d'attaque de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_counter_attack_rate(position)

> renvoie la probabilité d'un contre (sur une attaque physique) de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_critical_evasion_rate(position)

> renvoie la probabilité de faire un coup critique en préemptif de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_critical_rate(position)

> renvoie la probabilité de coup critique de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_defense(position)

> renvoie les points de défense de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_die?(position)

> renvoie true si l'ennemi en combat référencé par sa position en combat est mort, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_evasion_rate(position)

> renvoie la probabilité d'esquiver une attaque physique de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_experience_rate(position)

> renvoie le pourcentage de la variation d'acquisition d'expérience de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_floor_damage_rate(position)

> renvoie le pourcentage de dommage des terrains reçu de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_guard_effect_rate(position)

> renvoie la force de défense (diminution de l'attaque subie) de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_hidden?(position)

> renvoie true si l'ennemi en combat référencé par sa position en combat est invisble, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_hit_rate(position)

> renvoie la probabilité de toucher de l'ennemi en combat référencé par sa position en combat sur un ennemi

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_hp(position)

> renvoie les points de vie de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_hp_regeneration_rate(position)

> renvoie le pourcentage de régénration de HP à chaque tour de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_luck(position)

> renvoie les points de chance de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_magic_attack(position)

> renvoie les points d'attaque magique de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_magic_defense(position)

> renvoie les points de défense magique de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_magical_damage_rate(position)

> renvoie le pourcentage de dommage magique reçu de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_magical_evasion_rate(position)

> renvoie la probabilité d'une esquiver une attaque magique de l'ennemi en combat référencé par sa position en combat par un ennemi

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_magical_reflection_rate(position)

> renvoie la probabilité d'une réflexion magique de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_max_hp(position)

> renvoie le nombre de points de vie maximum de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_max_mp(position)

> renvoie le nombre de points de magie de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_mp(position)

> renvoie les points de magie de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_mp_cost_rate(position)

> renvoie le facteur d'un cout de MP (pour une attaque faisant varier la consommation de MP) de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_mp_regeneration_rate(position)

> renvoie le pourcentage de régénration MP à chaque tour de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_pharmacology(position)

> renvoie le pourcentage de HP/MP récupéré via un objet de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_physical_damage_rate(position)

> renvoie le pourcentage de dommage physique reçu de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_recovery_effect_rate(position)

> renvoie le pourcentage de MP/HP recu, de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_target_rate(position)

> renvoie la probabilité d'être ciblé par un ennemi, de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_tp(position)

> renvoie les points de temps de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_tp_charge_rate(position)

> renvoie le facteur de cout de TP (pour une attaque faisant varier la consommation de TP) de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.enemy_tp_regeneration_rate(position)

> renvoie le pourcentage de régénration de TP par tour de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.event_collide?(idA, idB)

> Renvoie true si l'evenement A est en collision avec l'évènement B, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de l'évènement A (0 pour héros)  
`idB`|`Fixnum`|ID de l'évènement B (0 pour héros)  






##### Command.event_direction(id)

> Renvoie la direction (2 pour le haut, 8, pour le bas, 4 pour la gauche , 6 pour la droite ) de l'évènement référencé par son ID en pixel sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  






##### Command.event_in_screen?(id)

> Renvoie true si l'évènement référencé par son ID est visible à l'écran, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  






##### Command.event_look_at?(idA, idB, scope, *metric)

> Renvoie true si l'evenement A regarde dans la direction de l'évènement B et que celui ci est dans son périmètre, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de l'évènement A (0 pour héros)  
`idB`|`Fixnum`|ID de l'évènement B (0 pour héros)  
`scope`|`Fixnum`|Nombre de case ou de pixels  
`*metric`|`Fixnum`|par défaut :square, pour en case, :pixels pour en pixels  






##### Command.event_pixel_x(id)

> Renvoie la coordonnées X de l'évènement référencé par son ID en pixel sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  






##### Command.event_pixel_y(id)

> Renvoie la coordonnées Y de l'évènement référencé par son ID en pixel sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  






##### Command.event_screen_x(id)

> Renvoie la coordonnées X de l'évènement référencé par son ID par rapport à l'écran

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  






##### Command.event_screen_y(id)

> Renvoie la coordonnées Y de l'évènement référencé par son ID par rapport à l'écran

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  






##### Command.event_x(id)

> Renvoie la coordonnées X de la case sur laquelle est l'évènement référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  






##### Command.event_y(id)

> Renvoie la coordonnées Y de la case sur laquelle est l'évènement référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  






##### Command.fadeout(*time)

> Fondu noir (et sonore) du jeu pendant la durée passée en argument

  
> Nom|Type|Description  
--- | --- | ---  
`*time`|`Fixnum`|Durée de fondu  






##### Command.fresh_event_id

> Renvoie un ID libre (utile en cas d'invocation d'évènement)

  
> 





##### Command.gain_gold(amount)

> Fait gagner de l'argent à l'équipe

  
> Nom|Type|Description  
--- | --- | ---  
`amount`|`o`|T  






##### Command.game_title

> Renvoie le titre du jeu

  
> 





##### Command.get(array, index)

> Renvoie la cellule à la valeur donné d'un tableau

  
> Nom|Type|Description  
--- | --- | ---  
`array`|`Array`|Tableau dont il faut renvoyer la taille  
`index`|`Fixnum`|Index à trouver  




Exemple  
```ruby  
Command.get([0, 1, 2, 17], 2) # Renvoie 2 (parce que c'est la deuxième cellule et que l'indexation des tableaux commence à 0)  
```



##### Command.give_armor(id, amount, *include_equipement)

> Fait gagner à l'équipe l'armure référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  
`amount`|`Fixnum`|Nombre à donner. Si le nombre est négatif, l'objet sera retiré  
`*include_equipement`|`Boolean`|Ce paramètre n'est utile que si on supprime des objets (ammount négatif). Si cette variable vaut true, les objets équipés seront déséquipés si l'inventaire n'en possède pas assez. Par défaut, il vaut false. Donc pas de déséquipement  






##### Command.give_item(id, amount)

> Fait gagner à l'équipe l'objet référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  
`amount`|`Fixnum`|Nombre à donner. Si le nombre est négatif, l'objet sera retiré  






##### Command.give_weapon(id, amount, *include_equipement)

> Fait gagner à l'équipe l'arme référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  
`amount`|`Fixnum`|Nombre à donner. Si le nombre est négatif, l'objet sera retiré  
`*include_equipement`|`Boolean`|Ce paramètre n'est utile que si on supprime des objets (ammount négatif). Si cette variable vaut true, les objets équipés seront déséquipés si l'inventaire n'en possède pas assez. Par défaut, il vaut false. Donc pas de déséquipement  






##### Command.gold

> Renvoie l'argent possédé

  
> 





##### Command.has_armor?(id, *include_equipement)

> Renvoie true si l'armure référencé par son ID est possédée par l'équipe, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  
`*include_equipement`|`Boolean`|Si ce paramètre vaut true, la commande prend en compte l'équipement, sinon (false), elle ne le prend pas en compte (par défaut: false)  






##### Command.has_item?(id)

> Renvoie true si l'objet référencé par son ID est possédé par l'équipe, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.has_weapon?(id, *include_equipement)

> Renvoie true si l'arme référencé par son ID est possédée par l'équipe, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  
`*include_equipement`|`Boolean`|Si ce paramètre vaut true, la commande prend en compte l'équipement, sinon (false), elle ne le prend pas en compte (par défaut: false)  






##### Command.hypot(x, y)

> Renvoie l'hypothénuse de x et y

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  
`y`|`Numeric`|Valeur numérique  






##### Command.id_at(x, y)

> Renvoie l'ID de l'évènement pointé par les coordonnées X,Y (0 si c'est le héros, -1 s'il n'y en a pas)

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  






##### Command.import_label(index, idlabel)

> Renvoi la valeur d'un label issu d'une autre sauvegarde

  
> Nom|Type|Description  
--- | --- | ---  
`index`|`Fixnum`|Numéro de la sauvegarde  
`idlabel`|`Fixnum`|Identifiant du label  






##### Command.import_switch(index, idswitch)

> Renvoi la valeur d'un interrupteur issu d'une autre sauvegarde

  
> Nom|Type|Description  
--- | --- | ---  
`index`|`Fixnum`|Numéro de la sauvegarde  
`idswitch`|`Fixnum`|Numéro de l'interrupteur  






##### Command.import_variable(index, idvar)

> Renvoi la valeur d'une variable issue d'une autre sauvegarde

  
> Nom|Type|Description  
--- | --- | ---  
`index`|`Fixnum`|Numéro de la sauvegarde  
`idvar`|`Fixnum`|Numéro de la variable  






##### Command.include_page(map_id, event_id, page_id, *runnable, *context)

> Invoque une page (comme s'il s'agissait d'un évènement commun) d'un autre évènement

  
> Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à inclure  
`event_id`|`Fixnum`|ID de l'évènement où chercher la page à inclure  
`page_id`|`Fixnum`|ID de la page à inclure  
`*runnable`|`Boolean`|Par défaut, cette variable a pour valeur `false`. Si elle vaut `true`, la page ne sera incluse que si la condition de lancement de la page est respectée. Par défaut, elle utilise le contexte (les interrupteurs locaux) de l'évènement appelant.  
`*context`|`Boolean`|Par défaut, cette variable a pour valeur `false`. Si `runnable` et `context` valent `true`, la condition de lancement de la page utilisera le contexte (les interrupteurs locaux) de l'évènement d'origine à la place de celui de l'évènement appelant.  






##### Command.invoke_event(map_id, event_id, new_id, *x, *y)

> Invoque un évènement d'une autre map (ou de la même) sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à invoquer  
`event_id`|`Fixnum`|ID de l'évènement à invoquer  
`new_id`|`Fixnum`|Nouvel ID de l'évènement fraîchement invoqué  
`*x`|`Fixnum`|Position X où placer l'évènement invoqué, par défaut, conserve la valeur de l'évènement invoqué  
`*y`|`Fixnum`|Position Y où placer l'évènement invoqué, par défaut conserve la valeur de l'évènement invoqué  






##### Command.is_key_item?(id)

> Renvoie true si l'objet référencé par son ID est un objet clé, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_always_usable?(id)

> Renvoie true si l'objet référencé par son ID est utilisable partout

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_battle_usable?(id)

> Renvoie true si l'objet référencé par son ID est utilisable en combat

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_certain?(id)

> Renvoie true si un objet référencée par son ID a une garantie de réussite total, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_consumable?(id)

> Renvoie true si l'objet référencé par son ID est consommable, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_count(id)

> Renvoie le nombre d'objet référencé par son ID possédés par l'équipe

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet à compter  






##### Command.item_description(id)

> Renvoie la description de l'objet référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_for_all?(id)

> Renvoie true si un objet référencée par son ID cible tout le groupe, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_for_all_allies?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise tous les alliés, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_for_all_dead_allies?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise tous les alliés morts, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_for_all_enemies?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise tous les ennemis, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_for_caller?(id)

> Renvoie true si la cible d'un objet référencée par son ID , false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_for_dead_friend?(id)

> Renvoie true si un objet référencée par son ID cible (un ou) les alliés morts, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_for_four_random_enemies?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise quatre ennemis au hasard, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_for_friend?(id)

> Renvoie true si un objet référencée par son ID cible (un ou) les alliés, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_for_one?(id)

> Renvoie true si un objet référencée par son ID cible une cible, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_for_one_ally?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise un allié, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_for_one_dead_ally?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise un allié mort, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_for_one_enemy?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise un ennemi, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_for_one_random_enemy?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise un ennemi au hasard, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_for_opponent?(id)

> Renvoie true si un objet référencée par son ID cible les ennemis, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_for_random?(id)

> Renvoie true si un objet référencée par son ID cible aléatoirement, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_for_three_random_enemies?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise trois ennemis au hasard, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_for_two_random_enemies?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise deux ennemis au hasard, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_has_no_scope?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise personne, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_icon(id)

> Renvoie l'index de l'icone de l'objet référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_magical?(id)

> Renvoie true si un objet référencée par son ID produit un dommage magique, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_menu_usable?(id)

> Renvoie true si l'objet référencé par son ID est utilisable dans le menu

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_name(id)

> Renvoie le nom de l'objet référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_nb_hits(id)

> Renvoie le nombre de coup porté par l'objet référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_need_selection?(id)

> Renvoie true si un objet référencée par son ID requiert la sélection de l'ennemi, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_never_usable?(id)

> Renvoie true si l'objet référencé par son ID n'est jamais utilisable

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_note(id)

> Renvoie le commentaire de l'objet référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_number_of_targets(id)

> Renvoie le nombre de cibles d'un objet référencée par son ID produit un dommage magique, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_occasion(id)

> Renvoie un entier correspondant au droit d'utilisation de l'objet

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_physical?(id)

> Renvoie true si un objet référencée par son ID produit un dommage physique, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_price(id)

> Renvoie le prix de l'objet référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_scope(id)

> Renvoie la portée (en Entier) d'un objet référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  






##### Command.item_speed(id)

> Renvoie l'apport de vitesse de l'objet référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_success_rate(id)

> Renvoie la probabilité de succès de l'objet référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_tp_gain(id)

> Renvoie le gain de TP que l'objet référencé par son ID apporte une fois utilisé en combat

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.key_current(method)

> Renvoie la touche activée selon la méthode passée en argument, nil si aucune touche n'est activée

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthode d'activation (:press?, :release?, :trigger? etc.)  






##### Command.key_current_rgss(method)

> Renvoie la touche du RGSS (:X, :A, :B, :C etc.) activée selon la méthode passée en argument, nil si aucune touche n'est activée

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthode d'activation (:press?, :release?, :trigger? etc.)  






##### Command.key_press?(key)

> Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






##### Command.key_release?(key)

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être relâchée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






##### Command.key_repeat?(key)

> Renvoie true si la touche passée en argument (cf:attributs) est appuyée successivement, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






##### Command.key_time(key)

> Renvoie le nombre de frame pressée d'une touche en cours

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche à vérifier  






##### Command.key_trigger?(key)

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être pressée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






##### Command.keyboard_all?(method, keys)

> Renvoie true si toutes les touches passées à keys sont activées selon la méthode passées à method

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.  
`keys`|`Argslist`|Liste des touches qui doivent être activée selon la méthode  






##### Command.keyboard_any?(method, keys)

> Renvoie true si toutes au moins une touches passée à keys est activée selon la méthode passées à method

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.  
`keys`|`Argslist`|Liste des touches qui doivent être activée selon la méthode, si rien n'est passé, toutes les touches sont prises en compte  






##### Command.keyboard_current_char

> Renvoie le caractère actuel pressé par le clavier

  
> 





##### Command.keyboard_current_digit

> Renvoie le chiffre actuel pressé par le clavier

  
> 





##### Command.length(array)

> Renvoie la taille d'un tableau

  
> Nom|Type|Description  
--- | --- | ---  
`array`|`Array`|Tableau dont il faut renvoyer la taille  






##### Command.load_game(index, *time)

> Charge la partie référencée par l'ID de sauvegarde donné

  
> Nom|Type|Description  
--- | --- | ---  
`index`|`Fixnum`|Numéro de la sauvegarde  
`*time`|`Fixnum`|Durée du fadeout  






##### Command.lose_gold(amount)

> Fait perdre de l'argent à l'équipe

  
> Nom|Type|Description  
--- | --- | ---  
`amount`|`o`|T  






##### Command.map_id

> Renvoie l'ID de la map en cours

  
> 





##### Command.map_name

> Renvoie le nom de la map en cours

  
> 





##### Command.max(a, b)

> Renvoie la plus grande des deux valeurs A, B

  
> Nom|Type|Description  
--- | --- | ---  
`a`|`Object`|Valeur de A  
`b`|`Object`|Valeur de B  






##### Command.max_event_id

> Renvoie le plus grand ID d'évènement occupé sur la carte

  
> 





##### Command.min(a, b)

> Renvoie la plus petite des deux valeurs A, B

  
> Nom|Type|Description  
--- | --- | ---  
`a`|`Object`|Valeur de A  
`b`|`Object`|Valeur de B  






##### Command.monster_agility(id)

> renvoie l'agilité d'un ennemi référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  






##### Command.monster_attack_power(id)

> renvoie les points d'attaque d'un ennemi référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  






##### Command.monster_battler_height(position)

> renvoie la largeur du battler de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.monster_battler_hue(id)

> renvoie la teinte d'un ennemi référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  






##### Command.monster_battler_name(id)

> renvoie le nom du fichier battler d'un ennemi référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  






##### Command.monster_battler_width(position)

> renvoie la largeur du battler de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  






##### Command.monster_defense_power(id)

> renvoie les points de défense d'un ennemi référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  






##### Command.monster_description(id)

> renvoie la description d'un ennemi référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  






##### Command.monster_give_exp(id)

> renvoie l'experience donnée par un ennemi référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  






##### Command.monster_give_gold(id)

> renvoie l'or donnée par un ennemi référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  






##### Command.monster_icon(id)

> renvoie l'icone index d'un ennemi référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  






##### Command.monster_luck(id)

> renvoie la chance d'un ennemi référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  






##### Command.monster_magic_attack_power(id)

> renvoie les points d'attaque magique d'un ennemi référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  






##### Command.monster_magic_defense_power(id)

> renvoie les points de défense magique d'un ennemi référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  






##### Command.monster_max_hp(id)

> renvoie le maximum de points de vie d'un ennemi référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  






##### Command.monster_max_mp(id)

> renvoie le maximum de point de magie d'un ennemi référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  






##### Command.monster_name(id)

> renvoie le nom d'un ennemi référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  






##### Command.monster_note(id)

> renvoie la note/commentaire d'un ennemi référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'ennemi  






##### Command.mouse_all?(method, keys)

> Renvoie true si toutes les touches passées à keys sont activées selon la méthode passées à method

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.  
`keys`|`Argslist`|Liste des touches qui doivent être activée selon la méthode  






##### Command.mouse_any?(method, keys)

> Renvoie true si toutes au moins une touches passée à keys est activée selon la méthode passées à method

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.  
`keys`|`Argslist`|Liste des touches qui doivent être activée selon la méthode, si rien n'est passé, toutes les touches sont prises en compte  






##### Command.mouse_click?

> Renvoie true lorsqu'on effectue un clic gauche

  
> 





##### Command.mouse_click_event?(events)

> Renvoie true si la souris clique un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  






##### Command.mouse_current_key(method)

> Renvoie la touche activée selon la méthode passée en argument, nil si aucune touche n'est activée

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthode d'activation (:press?, :release?, :trigger? etc.)  






##### Command.mouse_dragging?

> Renvoie true si la souris est en train de sélectionner (cliquer/glisser) à l'écran

  
> 





##### Command.mouse_hover_event?(events)

> Renvoie true si la souris survol un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  






##### Command.mouse_in?(rectangle)

> Renvoie true si la souris se trouve dans le rectangle passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`rectangle`|`Rect`|Rectangle à vérifier  






##### Command.mouse_last_rect

> Renvoie le dernier rectangle de sélection de la souris effectué

  
> 





##### Command.mouse_point

> Renvoie un point (possédant les attributs x, y) référençant la position de la souris en pixels par rapport à l'écran

  
> 





##### Command.mouse_press?(key)

> Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






##### Command.mouse_press_event?(events, *key)

> Renvoie true si la souris presse un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Selector`|Touche à presser (par défaut, la touche est :mouse_left  






##### Command.mouse_rect

> Renvoie le rectangle de sélection de la souris (tracé en cours)

  
> 





##### Command.mouse_release?(key)

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être relâchée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






##### Command.mouse_release_event?(events, *key)

> Renvoie true si la souris est relâchée sur un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Selector`|Touche à presser (par défaut, la touche est :mouse_left  






##### Command.mouse_repeat?(key)

> Renvoie true si la touche passée en argument (cf:attributs) est appuyée successivement, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






##### Command.mouse_repeat_event?(events, *key)

> Renvoie true si la souris clique de manière répétée un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Selector`|Touche à presser (par défaut, la touche est :mouse_left  






##### Command.mouse_square_x

> Renvoie la position (en cases) X de la souris

  
> 





##### Command.mouse_square_y

> Renvoie la position (en cases) Y de la souris

  
> 





##### Command.mouse_trigger?(key)

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être pressée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






##### Command.mouse_trigger_event?(events, *key)

> Renvoie true si la souris vient de cliquer un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Selector`|Touche à presser (par défaut, la touche est :mouse_left  






##### Command.mouse_x

> Renvoie la position (en pixels) X de la souris

  
> 





##### Command.mouse_y

> Renvoie la position (en pixels) Y de la souris

  
> 





##### Command.num_lock?

> Renvoie true si le clavier est en mode NUM_LOCK au moment de l'appel, false sinon

  
> 





##### Command.page_runnable?(map_id, event_id, page_id, *context)

> Vérifie si la page est exécutable dans le contexte de l'évènement appelant.

  
> Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à tester  
`event_id`|`Fixnum`|ID de l'évènement où chercher la page à tester  
`page_id`|`Fixnum`|ID de la page à tester  
`*context`|`Boolean`|Par défaut, cette variable a pour valeur `false`. Si elle vaut `true`, la condition de lancement de la page utilisera le contexte (les interrupteurs locaux) de l'évènement d'origine à la place de celui de l'évènement appelant.  






##### Command.parallax_autoscroll_x(id, speed, *duration, *wait_flag)

> Défilement horizontal automatique d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`speed`|`Fixnum`|Vitesse de défilement  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  






##### Command.parallax_autoscroll_y(id, speed, *duration, *wait_flag)

> Défilement vertical automatique d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`speed`|`Fixnum`|Vitesse de défilement  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  






##### Command.parallax_blend(id, blend_type)

> Change le mode de fusion d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`blend_type`|`Fixnum`|mode de fusion (0 => normal, 1 => Addition, 2 => Soustraction)  






##### Command.parallax_erase(id)

> Supprime un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  






##### Command.parallax_opacity(id, opacity, *duration, *wait_flag)

> Change l'opacité d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`opacity`|`Fixnum`|valeur de l'opacité (0 à 255)  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  






##### Command.parallax_scroll_x(id, speed)

> Défilement horizontal d'un panorama par rapport au défilement de la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`speed`|`Fixnum`|Vitesse de défilement  






##### Command.parallax_scroll_y(id, speed)

> Défilement vertical d'un panorama par rapport au défilement de la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`speed`|`Fixnum`|Vitesse de défilement  






##### Command.parallax_show(id, name, *z, *opacity, *auto_x, *auto_y, *scroll_x, *scroll_y, *blend_type, *zoom_x, *zoom_y, *tone)

> Affiche un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`name`|`String`|Nom du panorama  
`*z`|`Fixnum`|Axe Z (par défaut - 100)  
`*opacity`|`Fixnum`|Opacité (par défaut 255)  
`*auto_x`|`Fixnum`|Défilement automatique horizontal (par défaut 0, ne défile pas)  
`*auto_y`|`Fixnum`|Défilement automatique vertical (par défaut 0, ne défile pas)  
`*scroll_x`|`Fixnum`|Défilement horizontal (par défaut 2, à la même vitesse que la carte. 1 = vitesse du panorama de VXace)  
`*scroll_y`|`Fixnum`|Défilement vertical (par défaut 2, à la même vitesse que la carte. 1 = vitesse du panorama de VXace)  
`*blend_type`|`Fixnum`|Mode de fusion (par défaut 0), mode normal  
`*zoom_x`|`Fixnum`|Zoom horizontal (par défaut 100)  
`*zoom_y`|`Fixnum`|Zoom vertical (par défaut 100)  
`*tone`|`Tone`|Teinte, utilisez la commande tone (rubrique Standard), par défaut teinte normale  






##### Command.parallax_tone(id, tone, *duration, *wait_flag)

> Change la teinte d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`tone`|`Tone`|teinte du panorama (utilisez la commande tone des commandes standars)  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  






##### Command.parallax_transform(id, duration, *wait_flag, *zoom_x, *zoom_y, *opacity, *tone)

> Transforme un panorama durant une période

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`duration`|`Fixnum`|Durée en frame du déplacement  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut false  
`*zoom_x`|`Fixnum`|Zoom horizontal (par défaut 100)  
`*zoom_y`|`Fixnum`|Zoom vertical (par défaut 100)  
`*opacity`|`Fixnum`|Opacité (par défaut 255)  
`*tone`|`Tone`|Teinte, utilisez la commande tone (rubrique Standard), par défaut aucun changement de teinte  






##### Command.parallax_zoom(id, zoom, *duration, *wait_flag)

> Zoom sur les deux axes d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`zoom`|`Fixnum`|taille en pourcentage  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  






##### Command.parallax_zoom_x(id, zoom, *duration, *wait_flag)

> Zoom horizontal d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`zoom`|`Fixnum`|taille en pourcentage  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  






##### Command.parallax_zoom_y(id, zoom, *duration, *wait_flag)

> Zoom vertical d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`zoom`|`Fixnum`|taille en pourcentage  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  






##### Command.parallaxes_clear

> Supprime tous les panoramas

  
> 





##### Command.percent(value, max)

> Renvoie le pourcentage de value par rapport à max

  
> Nom|Type|Description  
--- | --- | ---  
`value`|`Fixnum`|Valeur à transformer  
`max`|`Fixnum`|Valeur maximum  




Exemple  
```ruby  
Command.percent(40, 80) # Renvoie 50 (parce que 40 = 50% de 80)  
```



##### Command.pi

> Renvoie une approximation de PI

  
> 





##### Command.pick_random(*elts)

> Renvoi un élément au hasard du tableau (ou de la liste d'argument)

  
> Nom|Type|Description  
--- | --- | ---  
`*elts`|`ArgsList`|éléments dans lequel piocher un élément aléatoire. Soit pick_random(a, b, c, d...etc.) soit pick_random([a,b,c,d...etc])  






##### Command.picture_angle(id, angle)

> Change l'angle de l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`angle`|`Fixnum`|Angle d'orientation de l'image (En degrés décimaux, sens anti-horaire). Si aucun angle n'est donné, la commande renverra l'angle de l'image  






##### Command.picture_blend(id, mode)

> Change le mode de fusion d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`mode`|`Fixnum`|Mode choisi (0, 1 ou 2)  






##### Command.picture_erase(id)

> Efface l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  






##### Command.picture_flip(id)

> Applique un effet miroir sur l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  






##### Command.picture_move(id, x, y, zoom_x, zoom_y, duration, *wait_flag, *opacity, *blend_type, *origin)

> Déplace une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`x`|`Fixnum`|Position en x de l'image où l'image doit se rendre  
`y`|`Fixnum`|Position en y de l'image où l'image doit se rendre  
`zoom_x`|`Fixnum`|Zoom de la largeur (en %)  
`zoom_y`|`Fixnum`|Zoom de la hauteur (en %)  
`duration`|`Fixnum`|Durée du déplacement en frames  
`*wait_flag`|`Boolean`|Attendre la fin du déplacement, par défaut, true  
`*opacity`|`Fixnum`|Opacitée (de 0 à 255) que l'image devra avoir, si aucun argument n'est donné, l'image conserva son opacité actuelle  
`*blend_type`|`Fixnum`|Mode de fusion (0, 1, 2) que l'image devra avoir, si aucun argument n'est donné, l'image conserva son mode de fusion actuel  
`*origin`|`Fixnum`|Origine que l'image devra avoir, si aucun argument n'est donné, l'image conserva son origine actuelle  






##### Command.picture_opacity(id, opacity, *duration, *wait_flag)

> Change l'opacité d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`opacity`|`Fixnum`|valeur de l'opacité (de 0 à 255)  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  






##### Command.picture_origin(id, origin)

> Change l'origine d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`origin`|`Fixnum`|Origine de l'image, 0 = Haut gauche, 1 = centré, [x,y] = orienté autours de X,Y, par défaut, zéro  






##### Command.picture_pin(id, x, y)

> Fait défiler une image avec la carte (la fixe à une position)

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`x`|`Fixnum`|Coordonnées X de la carte en pixel  
`y`|`Fixnum`|Coordonnées X de la carte en pixel  






##### Command.picture_position(id, x, y, *duration, *wait_flag)

> Change la position de l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`x`|`Fixnum`|Position en x de l'image  
`y`|`Fixnum`|Position en y de l'image  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  






##### Command.picture_rotate(id, speed)

> Fait tourner l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`speed`|`Fixnum`|Vitesse de rotation de l'image  






##### Command.picture_scroll(id, vitesse)

> Change la vitesse de défilement (vertical et horizontal) d'une image fixée sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`vitesse`|`Fixnum`|Vitesse de défilement  






##### Command.picture_scroll_x(id, vitesse)

> Change la vitesse de défilement horizontal d'une image fixée sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`vitesse`|`Fixnum`|Vitesse de défilement  






##### Command.picture_scroll_y(id, vitesse)

> Change la vitesse de défilement vertical d'une image fixée sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`vitesse`|`Fixnum`|Vitesse de défilement  






##### Command.picture_shake(id, power, speed, duration)

> Fait trembler l'image pendant un temps donné

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`power`|`Fixnum`|La puissance du tremblement  
`speed`|`Fixnum`|La vitesse du tremblement  
`duration`|`Fixnum`|La durée en frame du tremblement  






##### Command.picture_show(id, name, *x, *y, *origin, *zoom_x, *zoom_y, *opacity, *blend_type)

> Affiche une image à l'écran

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`name`|`String`|Nom de l'image (sans l'extension)  
`*x`|`Fixnum`|Position en X de l'image (par défaut 0)  
`*y`|`Fixnum`|Position en X de l'image (par défaut 0)  
`*origin`|`Fixnum`|Origine de l'image, 0 = Haut gauche, 1 = centré, [x,y] = orienté autours de X,Y, par défaut, zéro  
`*zoom_x`|`Fixnum`|Zoom sur la largeur de l'image par défaut 100 (pour 100%)  
`*zoom_y`|`Fixnum`|Zoom sur la hauteur de l'image par défaut 100 (pour 100%)  
`*opacity`|`Fixnum`|Opacité de l'image, par défaut 255 (de 0 à 255)  
`*blend_type`|`Fixnum`|Mode de fusion, par défaut 0, 0=Normal, 1=Addition, 2=Soustraction  






##### Command.picture_show_enemy(pic_id, id, position)

> Affiche un monstre d'un groupe à sa position définie dans la base de données

  
> Nom|Type|Description  
--- | --- | ---  
`pic_id`|`Fixnum`|ID de l'image dans laquelle afficher le monstre  
`id`|`Fixnum`|ID du groupe de monstre  
`position`|`Fixnum`|Position du monstre  






##### Command.picture_tone(id, tone, *duration, *wait_flag)

> Change la teinte d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`tone`|`Tone`|Teinte de l'image  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut false  






##### Command.picture_unpin(id)

> Arrête de faire défiler une image avec la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  






##### Command.picture_wave(id, amplitude, vitesse)

> Fait onduler l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`amplitude`|`Fixnum`|Amplitude (taille de l'ondulation)  
`vitesse`|`Fixnum`|Vitesse de l'ondulation  






##### Command.picture_x(id, x, *duration, *wait_flag)

> Change l'axe X d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`x`|`Fixnum`|Position en x de l'image, si aucun argument n'est passé, la commande renverra la position X de l'image  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  






##### Command.picture_y(id, x, *duration, *wait_flag)

> Change l'axe Y d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`x`|`Fixnum`|Position en y de l'image, si aucun argument n'est passé, la commande renverra la position Y de l'image  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  






##### Command.picture_zoom(id, zoom_x, *zoom_y, *duration, *wait_flag)

> Change la taille d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`zoom_x`|`Fixnum`|Pourcentage d'agrandissement de la largeur de l'image  
`*zoom_y`|`Fixnum`|Pourcentage d'agrandissement de la hauteur de l'image. Si cet argument est ommis, la largeur sera égal à la hauteur.  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  






##### Command.picture_zoom_x(id, zoom, *duration, *wait_flag)

> Change la largeur d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`zoom`|`Fixnum`|Pourcentage d'agrandissement de la largeur de l'image. Si aucune valeur n'est donné, la commande renverra le zoom_x de l'image.  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  






##### Command.picture_zoom_y(id, zoom, *duration, *wait_flag)

> Change la hauteur d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`zoom`|`Fixnum`|Pourcentage d'agrandissement de la hauteur de l'image. Si aucune valeur n'est donné, la commande renverra le zoom_y de l'image.  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  






##### Command.pictures_clear

> Efface toutes les images

  
> 





##### Command.pictures_collide?(id, id2)

> Vérifie que deux images sont en collisions

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`id2`|`Fixnum`|ID de l'autre image  






##### Command.pictures_perfect_collide?(idA, idB)

> Vérifie la collision entre deux images au pixel près. ATTENTION, CETTE COMMANDE LAG ENORMEMENT !IL EST DECONSEILLE DE L'UTILISER !

  
> Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de la première image  
`idB`|`Fixnum`|ID de la seconde image  






##### Command.pixel_in_picture?(id, x, y, *precise)

> Vérifie que le x, y sont inscrit dans l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`*precise`|`Boolean`|Par défaut, precise vaut false, si precise vaut true, seuls les pixels non transparent seront prit en compte  






##### Command.pixels_between(idA, idB)

> Renvoie le nombre de pixels entre deux évènements référencés par leurs ID's

  
> Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de l'évènement A (0 pour héros)  
`idB`|`Fixnum`|ID de l'évènement B (0 pour héros)  






##### Command.play_time

> Renvoie le temps de jeu en secondes

  
> 





##### Command.player_direction

> Renvoie la direction (2 pour le haut, 8, pour le bas, 4 pour la gauche , 6 pour la droite ) du joueur en pixel sur la carte

  
> 





##### Command.player_in_screen?

> Renvoie true si le joueur est visible à l'écran, false sinon

  
> 





##### Command.player_pixel_x

> Renvoie la coordonnées X du joueur en pixel sur la carte

  
> 





##### Command.player_pixel_y

> Renvoie la coordonnées Y du joueur en pixel sur la carte

  
> 





##### Command.player_screen_x

> Renvoie la coordonnées X du joueur par rapport à l'écran

  
> 





##### Command.player_screen_y

> Renvoie la coordonnées Y du joueur par rapport à l'écran

  
> 





##### Command.player_x

> Renvoie la coordonnées X de la case sur laquelle est le joueur

  
> 





##### Command.player_y

> Renvoie la coordonnées Y de la case sur laquelle est le joueur

  
> 





##### Command.qte(key, time, *strict)

> Attend la saisie d'une touche pendant une durée donnée. La commande renvoie true si la touche a été saisie, false sinon.

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche qu'il faut presser avant la fin  
`time`|`Fixnum`|Durée  
`*strict`|`Boolean`|Difficulté, si elle vaut true, aucune erreur admise, sinon erreur admises. Par défaut vaut true  






##### Command.random(min, max)

> Renvoie un nombre aléatoire compris entre MIN et MAX inclus

  
> Nom|Type|Description  
--- | --- | ---  
`min`|`Fixnum`|Borne minimale  
`max`|`Fixnum`|Borne maximale (à noter que si cet argument n'est pas spécifié, le résultat sera compris entre 0 et min inclus)  






##### Command.random_combination(len, *keys)

> Renvoi une combinaison (tableau itérable) aléatoire de la taille spécifiée en argument, composés des paramètres des touches passées en arguments. (par exemple : random_combination(5, :UP, :DOWN, :LEFT, :RIGHT) )

  
> Nom|Type|Description  
--- | --- | ---  
`len`|`Fixnum`|Args description  
`*keys`|`Argslist`|Liste des touches pouvant constituer la combinaison  






##### Command.random_figures(x)

> Renvoie un nombre à virgule aléatoire compris entre x et x+1

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Valeur de base (si cet argument n'est pas spécifié, le résultat sera compris entre 0 et 1)  






##### Command.region_id(x, y)

> Renvoie l'ID de la région pointée par les coordonnées X,Y

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  






##### Command.rm_kill

> Quitte le jeu... d'un coup sec... TCHAK

  
> 





##### Command.save_count

> Renvoie le nombre de sauvegarde effectuées par partie

  
> 





##### Command.save_delete(index)

> Supprime la sauvegarde référencée par son numéro

  
> Nom|Type|Description  
--- | --- | ---  
`index`|`Fixnum`|Numéro de la sauvegarde  






##### Command.save_exists?(index)

> Renvoie true si la sauvegarde référencée par son numéro existe

  
> Nom|Type|Description  
--- | --- | ---  
`index`|`Fixnum`|Numéro de la sauvegarde  






##### Command.save_game(index)

> Sauvegarde la partie sur la sauvegardé référencée par l'ID donné

  
> Nom|Type|Description  
--- | --- | ---  
`index`|`Fixnum`|Numéro de la sauvegarde  






##### Command.scene_call(scene)

> Appel une scene (et la place dans la pile de scene)

  
> Nom|Type|Description  
--- | --- | ---  
`scene`|`Scene`|Scene à appeler  






##### Command.scene_clear_history

> Vide la pile d'appel des scenes

  
> 





##### Command.scene_goto(scene)

> Appel une scene (sans la placer dans la pile de scene)

  
> Nom|Type|Description  
--- | --- | ---  
`scene`|`Scene`|Scene à appeler  






##### Command.scene_return

> Renvoi à la dernière scene dans la pile d'appel

  
> 





##### Command.scroll_lock?

> Renvoie true si le clavier est en mode SCROLL_LOCK au moment de l'appel, false sinon

  
> 





##### Command.session_username

> Renvoie le nom d'utilisateur de la session Windows

  
> 





##### Command.set_actor_name(id, new_name)

> modifie le nom du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`new_name`|`String`|Nouveau nom  






##### Command.set_actor_nickname(id, new_name)

> modifie le surnom du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`new_name`|`String`|Nouveau surnom  






##### Command.shift?

> Renvoie true si la touche Maj du clavier est activée au moment de l'appel, false sinon

  
> 





##### Command.sin(x)

> Renvoie le sinus de x

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  






##### Command.sinh(x)

> Renvoie le sinus hyperbolique de x

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  






##### Command.skill_always_usable?(id)

> Renvoie true si la technique référencé par son ID est utilisable partout

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_battle_usable?(id)

> Renvoie true si la technique référencé par son ID est utilisable en combat

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_certain?(id)

> Renvoie true si une technique référencée par son ID a une garantie de réussite total, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_description(id)

> Renvoie la description la technique référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_for_all?(id)

> Renvoie true si une technique référencée par son ID cible tout le groupe, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_for_all_allies?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise tous les alliés, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_for_all_dead_allies?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise tous les alliés morts, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_for_all_enemies?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise tous les ennemis, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_for_caller?(id)

> Renvoie true si la cible d'une technique référencée par son ID l'utilisateur, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_for_dead_friend?(id)

> Renvoie true si une technique référencée par son ID cible (un ou) les alliés morts, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_for_four_random_enemies?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise quatre ennemis au hasard, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_for_friend?(id)

> Renvoie true si une technique référencée par son ID cible (un ou) les alliés, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_for_one?(id)

> Renvoie true si une technique référencée par son ID cible une cible, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_for_one_ally?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise un allié, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_for_one_dead_ally?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise un allié mort, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_for_one_enemy?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise un ennemi, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_for_one_random_enemy?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise un ennemi au hasard, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_for_opponent?(id)

> Renvoie true si une technique référencée par son ID cible les ennemis, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_for_random?(id)

> Renvoie true si une technique référencée par son ID cible aléatoirement, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_for_three_random_enemies?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise trois ennemis au hasard, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_for_two_random_enemies?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise deux ennemis au hasard, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_has_no_scope?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise personne, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_icon(id)

> Renvoie l'index de l'icone de la technique référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_magical?(id)

> Renvoie true si une technique référencée par son ID produit un dommage magique, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_menu_usable?(id)

> Renvoie true si la technique référencé par son ID est utilisable dans le menu

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_name(id)

> Renvoie le nom de la technique référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_nb_hits(id)

> Renvoie le nombre de coup porté par la technique référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_need_selection?(id)

> Renvoie true si une technique référencée par son ID requiert la sélection de l'ennemi, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_never_usable?(id)

> Renvoie true si la technique référencé par son ID n'est jamais utilisable

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_note(id)

> Renvoie le commentaire de la base de données de la technique référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_number_of_targets(id)

> Renvoie le nombre de cibles d'une technique référencée par son ID produit un dommage magique, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_occasion(id)

> Renvoie un entier correspondant au droit d'utilisation de la technique

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_physical?(id)

> Renvoie true si une technique référencée par son ID produit un dommage physique, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_scope(id)

> Renvoie la portée (en Entier) d'une technique référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la techinuqe  






##### Command.skill_speed(id)

> Renvoie l'apport de vitesse de la technique référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_success_rate(id)

> Renvoie la probabilité de succès de la technique référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.skill_tp_gain(id)

> Renvoie le gain de TP que la technique référencé par son ID apporte une fois utilisé en combat

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  






##### Command.socket_connect(address, port)

> Se connecte à un serveur, renvoie true si la connexion à réussie, false sinon.

  
> Nom|Type|Description  
--- | --- | ---  
`address`|`String`|Adresse du serveur  
`port`|`Fixnum`|Port d'écoute  






##### Command.socket_connected?

> Renvoi true si la connexion est en cours, false, sinon

  
> 





##### Command.socket_disconnect

> Déconnecte la connexion courrante

  
> 





##### Command.socket_recv(*len)

> Renvoi le message envoyé par le serveur au client, false si aucun message n' est reçu

  
> Nom|Type|Description  
--- | --- | ---  
`*len`|`Fixnum`|Taille maximale du message à recevoir, par défaut 1024  






##### Command.socket_send(data)

> Envoi un message au serveur connecté, renvoie true en cas de réussite, false en cas d'échec

  
> Nom|Type|Description  
--- | --- | ---  
`data`|`String`|Message à envoyer  






##### Command.socket_wait_recv(*len)

> Attend une réponse du serveur, se termine quand une réponse a été reçue (et l'a renvoi)

  
> Nom|Type|Description  
--- | --- | ---  
`*len`|`Fixnum`|Taille maximale du message à recevoir, par défaut 1024  






##### Command.sqrt(x)

> Renvoie la racine carrée de x

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  






##### Command.square_passable?(x, y, direction)

> Renvoie true si la case référencée par X, Y est passable dans la direction référencée par direction, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  
`direction`|`Fixnum`|Direction (2,4,6,8)  






##### Command.squares_between(idA, idB)

> Renvoie le nombre de cases entre deux évènements référencés par leurs ID's

  
> Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de l'évènement A (0 pour héros)  
`idB`|`Fixnum`|ID de l'évènement B (0 pour héros)  






##### Command.start_map_id

> Renvoie l'ID de la map de départ

  
> 





##### Command.start_new_game

> Démarre une nouvelle partie

  
> 





##### Command.start_x

> Renvoie la position X de départ du joueur

  
> 





##### Command.start_y

> Renvoie la position Y de départ du joueur

  
> 





##### Command.steps

> Renvoie le nombre de pas effectué par l'équipe

  
> 





##### Command.tan(x)

> Renvoie la tangeante de x

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  






##### Command.tanh(x)

> Renvoie la tangeante hyperbolique de x

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  






##### Command.team_size

> Renvoie la taille de l'équipe

  
> 





##### Command.terrain_tag(x, y)

> Renvoie le tag du terrain de la case pointée par les coordonnées X,Y

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  






##### Command.text_change(id, text)

> Change le texte affiché à l'écran

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
`text`|`String`|Nouveau texte  






##### Command.text_erase(id)

> Supprime le texte affiché à l'écran

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  






##### Command.text_move(id, duration, wait_flag, x, y, zoom_x, zoom_y, opacity, blend_type, origin)

> Déplace un texte affiché à l'écran

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
`duration`|`Fixnum`|Durée du déplacement en frames  
`wait_flag`|`Boolean`|Attendre la fin du déplacement, par défaut, true  
`x`|`Fixnum`|Position en x où le texte doit se rendre  
`y`|`Fixnum`|Position en y ou le texte doit se rendre  
`zoom_x`|`Fixnum`|Zoom de la largeur (en %)  
`zoom_y`|`Fixnum`|Zoom de la hauteur (en %)  
`opacity`|`Fixnum`|Opacitée (de 0 à 255)  
`blend_type`|`Fixnum`|Mode de fusion (0, 1, 2)   
`origin`|`Fixnum`|Origine  






##### Command.text_opacity(id, opacity, *duration, *wait_flag)

> Change l'opacité du texte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
`opacity`|`Fixnum`|valeur de l'opacité  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  






##### Command.text_position(id, x, y, *duration, *wait_flag)

> Change la position d'un texte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`x`|`Fixnum`|Position en x du texte  
`y`|`Fixnum`|Position en y du texte  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  






##### Command.text_profile(id, profile)

> Change le profil du texte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
`profile`|`String`|Nouveau profil  






##### Command.text_rotate(id, speed)

> Fait tourner le texte (mettez une vitesse négative pour changer le sens de rotation)

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
`speed`|`Fixnum`|Vitesse de rotation  






##### Command.text_show(id, text, profile, x, y, *zoom_x, *zoom_y, *opacity, *blend_type, *origin)

> Affiche un texte à l'écran

  
> Nom|Type|Description  
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
`*origin`|`Fixnum`|Origine du texte, 0 = Haut gauche, 1 = centré par défaut, zéro  






##### Command.text_x(id, x, *duration, *wait_flag)

> Change l'axe X d'un texte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`x`|`Fixnum`|Position en x du texte, si aucun argument n'est passé, la commande renverra la position X du texte  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  






##### Command.text_y(id, y, *duration, *wait_flag)

> Change l'axe Y d'un texte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`y`|`Fixnum`|Position en y du texte, si aucun argument n'est passé, la commande renverra la position X du texte  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  






##### Command.text_zoom(id, zoom_x, zoom_y, *duration, *wait_flag)

> Change le zoom d'un texte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`zoom_x`|`Fixnum`|zoom x du texte  
`zoom_y`|`Fixnum`|zoom y du texte  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  






##### Command.text_zoom_x(id, zoom_x, *duration, *wait_flag)

> Change le zoom X d'un texte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`zoom_x`|`Fixnum`|zoom x du texte, si aucun argument n'est passé, la commande renverra le zoom X du texte  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  






##### Command.text_zoom_y(id, zoom_y, *duration, *wait_flag)

> Change le zoom y d'un texte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`zoom_y`|`Fixnum`|zoom y du texte, si aucun argument n'est passé, la commande renverra le zoom X du texte  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  






##### Command.tile_id(x, y)

> Renvoie l'ID de la tile pointée par les coordonnées X,Y

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  






##### Command.time_day

> Renvoi le jour actuel

  
> 





##### Command.time_hour

> Renvoi l' heure actuelle

  
> 





##### Command.time_min

> Renvoi la minute actuelle

  
> 





##### Command.time_month

> Renvoi le mois actuel

  
> 





##### Command.time_sec

> Renvoi la seconde actuelle

  
> 





##### Command.time_year

> Renvoi l'année actuelle

  
> 





##### Command.timer

> Renvoie la valeur du chronomètre

  
> 





##### Command.to_deg(x)

> Renvoie x (supposé radian) convertit en degré

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  






##### Command.to_rad(x)

> Renvoie x (supposé degré) convertit en radian

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Numeric`|Valeur numérique  






##### Command.tone(red, green, blue, *gray)

> Renvoie une teinte

  
> Nom|Type|Description  
--- | --- | ---  
`red`|`Fixnum`|Valeur de rouge  
`green`|`Fixnum`|Valeur de vert  
`blue`|`Fixnum`|Valeur de bleu  
`*gray`|`Fixnum`|Valeur de gris, par défaut 0!  






##### Command.total_enemies

> Renvoie le nombre d'enemis en combat (mort ou vivant)

  
> 





##### Command.troop_member(id, position)

> Renvoie l'id d'un monstre d'un groupe de monstre référencé par son ID et par sa position (0 = premier).

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du groupe de monstre  
`position`|`Fixnum`|Position du monstre  






##### Command.troop_member_x(id, position)

> Renvoie la position X d'un monstre d'un groupe de monstre référencé par son ID et par sa position (0 = premier) tel que défini dans la base de données.

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du groupe de monstre  
`position`|`Fixnum`|Position du monstre  






##### Command.troop_member_y(id, position)

> Renvoie la position Y d'un monstre d'un groupe de monstre référencé par son ID et par sa position (0 = premier) tel que défini dans la base de données.

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du groupe de monstre  
`position`|`Fixnum`|Position du monstre  






##### Command.troop_members(id)

> Renvoie un tableau des enemy_id  d'un groupe de monstres référencé par son ID.

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du groupe de monstre  






##### Command.troop_name(id)

> Renvoie le nom d'un groupe de monstres référencé par son ID.

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du groupe de monstre  






##### Command.troop_size(id)

> Renvoie la taille d'un groupe de monstres référencé par son ID.

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du groupe de monstre  






##### Command.version_id

> Renvoie l'ID de la version du jeu

  
> 





##### Command.wait(duration)

> Attend un nombre de frames donné

  
> Nom|Type|Description  
--- | --- | ---  
`duration`|`Fixnum`|Nombre de frames a attendre  






##### Command.wait_release(key)

> Attend le relâchement d'une touche

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche à attendre  






##### Command.wait_trigger(key)

> Attend l'appui d'une touche

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche à attendre  






##### Command.wait_with(time, &block)

> Attend en exécutant une action

  
> Nom|Type|Description  
--- | --- | ---  
`time`|`Fixnum`|Temps d'attente  
`&block`|`Block`|Action a exécuter ({action})  






##### Command.weapon_agility(id)

> Renvoie l'apport d'agilité d'une arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.weapon_attack_power(id)

> Renvoie la puissance d'attaque d'une arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.weapon_count(id)

> Renvoie le nombre d'armes référencées par son ID possédées par l'équipe

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme à compter  






##### Command.weapon_defense_power(id)

> Renvoie la puissance de défense d'une arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.weapon_description(id)

> Renvoie la description de l'arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  






##### Command.weapon_equiped?(id, *member_id)

> Renvoie true si l'arme référencé par son ID est équipée par un des membres de l'équipe, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  
`*member_id`|`Fixnum`|Id du membre de l'équipe. Si aucun membre_id n'est spécifié, la commande vérifiera pour toute l'équipe   






##### Command.weapon_icon(id)

> Renvoie l'index de l'icone de l'arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  






##### Command.weapon_luck(id)

> Renvoie l'apport de chance d'une arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.weapon_magic_attack_power(id)

> Renvoie la puissance d'attaque magique d'une arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.weapon_magic_defense_power(id)

> Renvoie la puissance de défense magique d'une arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.weapon_max_hit_points(id)

> Renvoie le maximum des points de vie d'une arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.weapon_max_magic_points(id)

> Renvoie le maximum des points de magie d'une arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.weapon_name(id)

> Renvoie le nom de l'arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  






##### Command.weapon_note(id)

> Renvoie le commentaire de l'arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  






##### Command.weapon_price(id)

> Renvoie le prix de l'arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  






##### Command.weapon_type(id)

> Renvoie le type de l'arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  






