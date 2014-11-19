#Command
[Retourner à l'index](README.md)

Collection des commandes EventExtender

##Liste des méthodes
*    [Command.alt_gr?](#Command.alt_gr)
*    [Command.apply_percent(percent, max)](#Command.apply_percentpercent-max)
*    [Command.armor_agility(id)](#Command.armor_agilityid)
*    [Command.armor_attack_power(id)](#Command.armor_attack_powerid)
*    [Command.armor_count(id)](#Command.armor_countid)
*    [Command.armor_defense_power(id)](#Command.armor_defense_powerid)
*    [Command.armor_description(id)](#Command.armor_descriptionid)
*    [Command.armor_equiped?(id, *member_id)](#Command.armor_equipedid-member_id)
*    [Command.armor_icon(id)](#Command.armor_iconid)
*    [Command.armor_luck(id)](#Command.armor_luckid)
*    [Command.armor_magic_attack_power(id)](#Command.armor_magic_attack_powerid)
*    [Command.armor_magic_defense_power(id)](#Command.armor_magic_defense_powerid)
*    [Command.armor_max_hit_points(id)](#Command.armor_max_hit_pointsid)
*    [Command.armor_max_magic_points(id)](#Command.armor_max_magic_pointsid)
*    [Command.armor_name(id)](#Command.armor_nameid)
*    [Command.armor_note(id)](#Command.armor_noteid)
*    [Command.armor_price(id)](#Command.armor_priceid)
*    [Command.armor_type(id)](#Command.armor_typeid)
*    [Command.battle_count](#Command.battle_count)
*    [Command.caps_lock?](#Command.caps_lock)
*    [Command.click_time(key)](#Command.click_timekey)
*    [Command.color(red, green, blue, *alpha)](#Command.colorred-green-blue-alpha)
*    [Command.ctrl?(key)](#Command.ctrlkey)
*    [Command.fresh_event_id](#Command.fresh_event_id)
*    [Command.give_armor(id, amount, *include_equipement)](#Command.give_armorid-amount-include_equipement)
*    [Command.give_item(id, amount)](#Command.give_itemid-amount)
*    [Command.give_weapon(id, amount, *include_equipement)](#Command.give_weaponid-amount-include_equipement)
*    [Command.gold](#Command.gold)
*    [Command.has_armor?(id, *include_equipement)](#Command.has_armorid-include_equipement)
*    [Command.has_item?(id)](#Command.has_itemid)
*    [Command.has_weapon?(id, *include_equipement)](#Command.has_weaponid-include_equipement)
*    [Command.id_at(x, y)](#Command.id_atx-y)
*    [Command.include_page(map_id, event_id, page_id, *runnable, *context)](#Command.include_pagemap_id-event_id-page_id-runnable-context)
*    [Command.invoke_event(map_id, event_id, new_id, *x, *y)](#Command.invoke_eventmap_id-event_id-new_id-x-y)
*    [Command.is_key_item?(id)](#Command.is_key_itemid)
*    [Command.item_always_usable?(id)](#Command.item_always_usableid)
*    [Command.item_battle_usable?(id)](#Command.item_battle_usableid)
*    [Command.item_consumable?(id)](#Command.item_consumableid)
*    [Command.item_count(id)](#Command.item_countid)
*    [Command.item_description(id)](#Command.item_descriptionid)
*    [Command.item_for_all_allies?(id)](#Command.item_for_all_alliesid)
*    [Command.item_for_all_dead_allies?(id)](#Command.item_for_all_dead_alliesid)
*    [Command.item_for_all_enemies?(id)](#Command.item_for_all_enemiesid)
*    [Command.item_for_caller?(id)](#Command.item_for_callerid)
*    [Command.item_for_four_random_enemies?(id)](#Command.item_for_four_random_enemiesid)
*    [Command.item_for_one_ally?(id)](#Command.item_for_one_allyid)
*    [Command.item_for_one_dead_ally?(id)](#Command.item_for_one_dead_allyid)
*    [Command.item_for_one_enemy?(id)](#Command.item_for_one_enemyid)
*    [Command.item_for_one_random_enemy?(id)](#Command.item_for_one_random_enemyid)
*    [Command.item_for_three_random_enemies?(id)](#Command.item_for_three_random_enemiesid)
*    [Command.item_for_two_random_enemies?(id)](#Command.item_for_two_random_enemiesid)
*    [Command.item_has_no_scope?(id)](#Command.item_has_no_scopeid)
*    [Command.item_icon(id)](#Command.item_iconid)
*    [Command.item_menu_usable?(id)](#Command.item_menu_usableid)
*    [Command.item_name(id)](#Command.item_nameid)
*    [Command.item_never_usable?(id)](#Command.item_never_usableid)
*    [Command.item_note(id)](#Command.item_noteid)
*    [Command.item_occasion(id)](#Command.item_occasionid)
*    [Command.item_price(id)](#Command.item_priceid)
*    [Command.item_scope(id)](#Command.item_scopeid)
*    [Command.key_current(method)](#Command.key_currentmethod)
*    [Command.key_current_rgss(method)](#Command.key_current_rgssmethod)
*    [Command.key_press?(key)](#Command.key_presskey)
*    [Command.key_release?(key)](#Command.key_releasekey)
*    [Command.key_repeat?(key)](#Command.key_repeatkey)
*    [Command.key_time(key)](#Command.key_timekey)
*    [Command.key_trigger?(key)](#Command.key_triggerkey)
*    [Command.keyboard_all?(method, keys)](#Command.keyboard_allmethod-keys)
*    [Command.keyboard_any?(method, keys)](#Command.keyboard_anymethod-keys)
*    [Command.keyboard_current_char](#Command.keyboard_current_char)
*    [Command.keyboard_current_digit](#Command.keyboard_current_digit)
*    [Command.map_id](#Command.map_id)
*    [Command.map_name](#Command.map_name)
*    [Command.max_event_id](#Command.max_event_id)
*    [Command.mouse_all?(method, keys)](#Command.mouse_allmethod-keys)
*    [Command.mouse_any?(method, keys)](#Command.mouse_anymethod-keys)
*    [Command.mouse_click?(key)](#Command.mouse_clickkey)
*    [Command.mouse_click_event?(events)](#Command.mouse_click_eventevents)
*    [Command.mouse_current_key(method)](#Command.mouse_current_keymethod)
*    [Command.mouse_dragging?](#Command.mouse_dragging)
*    [Command.mouse_hover_event?(events)](#Command.mouse_hover_eventevents)
*    [Command.mouse_in?(rectangle)](#Command.mouse_inrectangle)
*    [Command.mouse_last_rect](#Command.mouse_last_rect)
*    [Command.mouse_point](#Command.mouse_point)
*    [Command.mouse_press?(key)](#Command.mouse_presskey)
*    [Command.mouse_press_event?(events, *key)](#Command.mouse_press_eventevents-key)
*    [Command.mouse_rect](#Command.mouse_rect)
*    [Command.mouse_release?(key)](#Command.mouse_releasekey)
*    [Command.mouse_release_event?(events, *key)](#Command.mouse_release_eventevents-key)
*    [Command.mouse_repeat?(key)](#Command.mouse_repeatkey)
*    [Command.mouse_repeat_event?(events, *key)](#Command.mouse_repeat_eventevents-key)
*    [Command.mouse_square_x](#Command.mouse_square_x)
*    [Command.mouse_square_y](#Command.mouse_square_y)
*    [Command.mouse_trigger?(key)](#Command.mouse_triggerkey)
*    [Command.mouse_trigger_event?(events, *key)](#Command.mouse_trigger_eventevents-key)
*    [Command.mouse_x](#Command.mouse_x)
*    [Command.mouse_y](#Command.mouse_y)
*    [Command.num_lock?](#Command.num_lock)
*    [Command.page_runnable?(map_id, event_id, page_id, *context)](#Command.page_runnablemap_id-event_id-page_id-context)
*    [Command.parallax_autoscroll_x(id, speed, *duration, *wait_flag)](#Command.parallax_autoscroll_xid-speed-duration-wait_flag)
*    [Command.parallax_autoscroll_y(id, speed, *duration, *wait_flag)](#Command.parallax_autoscroll_yid-speed-duration-wait_flag)
*    [Command.parallax_blend(id, blend_type)](#Command.parallax_blendid-blend_type)
*    [Command.parallax_erase(id)](#Command.parallax_eraseid)
*    [Command.parallax_opacity(id, opacity, *duration, *wait_flag)](#Command.parallax_opacityid-opacity-duration-wait_flag)
*    [Command.parallax_scroll_x(id, speed)](#Command.parallax_scroll_xid-speed)
*    [Command.parallax_scroll_y(id, speed)](#Command.parallax_scroll_yid-speed)
*    [Command.parallax_show(id, name, *z, *opacity, *auto_x, *auto_y, *scroll_x, *scroll_y, *blend_type, *zoom_x, *zoom_y, *tone)](#Command.parallax_showid-name-z-opacity-auto_x-auto_y-scroll_x-scroll_y-blend_type-zoom_x-zoom_y-tone)
*    [Command.parallax_tone(id, tone, *duration, *wait_flag)](#Command.parallax_toneid-tone-duration-wait_flag)
*    [Command.parallax_transform(id, duration, *wait_flag, *zoom_x, *zoom_y, *opacity, *tone)](#Command.parallax_transformid-duration-wait_flag-zoom_x-zoom_y-opacity-tone)
*    [Command.parallax_zoom(id, zoom, *duration, *wait_flag)](#Command.parallax_zoomid-zoom-duration-wait_flag)
*    [Command.parallax_zoom_x(id, zoom, *duration, *wait_flag)](#Command.parallax_zoom_xid-zoom-duration-wait_flag)
*    [Command.parallax_zoom_y(id, zoom, *duration, *wait_flag)](#Command.parallax_zoom_yid-zoom-duration-wait_flag)
*    [Command.parallaxes_clear](#Command.parallaxes_clear)
*    [Command.percent(value, max)](#Command.percentvalue-max)
*    [Command.picture_angle(id, angle)](#Command.picture_angleid-angle)
*    [Command.picture_blend(id, mode)](#Command.picture_blendid-mode)
*    [Command.picture_erase(id)](#Command.picture_eraseid)
*    [Command.picture_flip(id)](#Command.picture_flipid)
*    [Command.picture_move(id, x, y, zoom_x, zoom_y, duration, *wait_flag, *opacity, *blend_type, *origin)](#Command.picture_moveid-x-y-zoom_x-zoom_y-duration-wait_flag-opacity-blend_type-origin)
*    [Command.picture_opacity(id, opacity)](#Command.picture_opacityid-opacity)
*    [Command.picture_origin(id, origin)](#Command.picture_originid-origin)
*    [Command.picture_pin(id, x, y)](#Command.picture_pinid-x-y)
*    [Command.picture_position(id, x, y)](#Command.picture_positionid-x-y)
*    [Command.picture_rotate(id, speed)](#Command.picture_rotateid-speed)
*    [Command.picture_scroll(id, vitesse)](#Command.picture_scrollid-vitesse)
*    [Command.picture_scroll_x(id, vitesse)](#Command.picture_scroll_xid-vitesse)
*    [Command.picture_scroll_y(id, vitesse)](#Command.picture_scroll_yid-vitesse)
*    [Command.picture_shake(id, power, speed, duration)](#Command.picture_shakeid-power-speed-duration)
*    [Command.picture_show(id, name, *x, *y, *origin, *zoom_x, *zoom_y, *opacity, *blend_type)](#Command.picture_showid-name-x-y-origin-zoom_x-zoom_y-opacity-blend_type)
*    [Command.picture_tone(id, R, V, B, *G)](#Command.picture_toneid-R-V-B-G)
*    [Command.picture_unpin(id)](#Command.picture_unpinid)
*    [Command.picture_wave(id, amplitude, vitesse)](#Command.picture_waveid-amplitude-vitesse)
*    [Command.picture_x(id, x)](#Command.picture_xid-x)
*    [Command.picture_y(id, x)](#Command.picture_yid-x)
*    [Command.picture_zoom(id, zoom_x, zoom_y)](#Command.picture_zoomid-zoom_x-zoom_y)
*    [Command.picture_zoom_x(id, zoom)](#Command.picture_zoom_xid-zoom)
*    [Command.picture_zoom_y(id, zoom)](#Command.picture_zoom_yid-zoom)
*    [Command.pictures_clear](#Command.pictures_clear)
*    [Command.pictures_collide?(id, id2)](#Command.pictures_collideid-id2)
*    [Command.pixel_in_picture?(id, x, y, *precise)](#Command.pixel_in_pictureid-x-y-precise)
*    [Command.play_time](#Command.play_time)
*    [Command.random(min, max)](#Command.randommin-max)
*    [Command.random_figures(x)](#Command.random_figuresx)
*    [Command.region_id(x, y)](#Command.region_idx-y)
*    [Command.save_count](#Command.save_count)
*    [Command.scroll_lock?](#Command.scroll_lock)
*    [Command.session_username](#Command.session_username)
*    [Command.shift?](#Command.shift)
*    [Command.square_passable?(x, y, direction)](#Command.square_passablex-y-direction)
*    [Command.steps](#Command.steps)
*    [Command.team_size](#Command.team_size)
*    [Command.terrain_tag(x, y)](#Command.terrain_tagx-y)
*    [Command.tile_id(x, y)](#Command.tile_idx-y)
*    [Command.timer](#Command.timer)
*    [Command.tone(red, green, blue, *gray)](#Command.tonered-green-blue-gray)
*    [Command.wait(duration)](#Command.waitduration)
*    [Command.weapon_agility(id)](#Command.weapon_agilityid)
*    [Command.weapon_attack_power(id)](#Command.weapon_attack_powerid)
*    [Command.weapon_count(id)](#Command.weapon_countid)
*    [Command.weapon_defense_power(id)](#Command.weapon_defense_powerid)
*    [Command.weapon_description(id)](#Command.weapon_descriptionid)
*    [Command.weapon_equiped?(id, *member_id)](#Command.weapon_equipedid-member_id)
*    [Command.weapon_icon(id)](#Command.weapon_iconid)
*    [Command.weapon_luck(id)](#Command.weapon_luckid)
*    [Command.weapon_magic_attack_power(id)](#Command.weapon_magic_attack_powerid)
*    [Command.weapon_magic_defense_power(id)](#Command.weapon_magic_defense_powerid)
*    [Command.weapon_max_hit_points(id)](#Command.weapon_max_hit_pointsid)
*    [Command.weapon_max_magic_points(id)](#Command.weapon_max_magic_pointsid)
*    [Command.weapon_name(id)](#Command.weapon_nameid)
*    [Command.weapon_note(id)](#Command.weapon_noteid)
*    [Command.weapon_price(id)](#Command.weapon_priceid)
*    [Command.weapon_type(id)](#Command.weapon_typeid)


##Description des méthodes
##### Command.alt_gr?

> Renvoie true si la touche ALT_GR (ou la combinaison CTRL+ALT) est appuyée au moment de l'appel, false sinon

  
> 





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

> Renvoie le maximum des points de dégat d'une armure référencée par son ID

  
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






##### Command.battle_count

> Renvoie le nombre de combat effectués par partie

  
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






##### Command.ctrl?(key)

> Renvoie true si la touche CTRL (ou une combinaison CTRL+key) est appuyée au moment de l'appel, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant la touche (cf:attributs) mise en combinaison  






##### Command.fresh_event_id

> Renvoie un ID libre (utile en cas d'invocation d'évènement)

  
> 





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






##### Command.id_at(x, y)

> Renvoie l'ID de l'évènement pointé par les coordonnées X,Y (0 si c'est le héros, -1 s'il n'y en a pas)

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  






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

> Renvoie true si la cible d'un objet référencée par son ID l'utilisateur, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  






##### Command.item_for_four_random_enemies?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise quatre ennemis au hasard, false sinon

  
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






##### Command.item_occasion(id)

> Renvoie un entier correspondant au droit d'utilisation de l'objet

  
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





##### Command.map_id

> Renvoie l'ID de la map en cours

  
> 





##### Command.map_name

> Renvoie le nom de la map en cours

  
> 





##### Command.max_event_id

> Renvoie le plus grand ID d'évènement occupé sur la carte

  
> 





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






##### Command.mouse_click?(key)

> Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon. (Alias de Mouse.press?)

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






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

> Renvoie true si la sourisest relâchée sur un évènement du sélecteur passé en argument

  
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



##### Command.picture_angle(id, angle)

> Change l'angle de l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`angle`|`Fixnum`|Angle d'orientation de l'image. Si aucun angle n'est donné, la commande renverra l'angle de l'image  






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






##### Command.picture_opacity(id, opacity)

> Change l'opacité d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`opacity`|`Fixnum`|valeur de l'opacité (de 0 à 255)  






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






##### Command.picture_position(id, x, y)

> Change la position de l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`x`|`Fixnum`|Position en x de l'image  
`y`|`Fixnum`|Position en y de l'image  






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






##### Command.picture_tone(id, R, V, B, *G)

> Change la teinte d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`R`|`Fixnum`|Valeur de rouge (de -255 a +255)  
`V`|`Fixnum`|Valeur de verte (de -255 a +255)  
`B`|`Fixnum`|Valeur de bleu (de -255 a +255)  
`*G`|`Fixnum`|Valeur de Gris (de 0 a +255), par défaut, cette valeur vaut 0  






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






##### Command.picture_x(id, x)

> Change l'axe X d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`x`|`Fixnum`|Position en x de l'image, si aucun argument n'est passé, la commande renverra la position X de l'image  






##### Command.picture_y(id, x)

> Change l'axe Y d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`x`|`Fixnum`|Position en y de l'image, si aucun argument n'est passé, la commande renverra la position Y de l'image  






##### Command.picture_zoom(id, zoom_x, zoom_y)

> Change la taille d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`zoom_x`|`Fixnum`|Pourcentage d'agrandissement de la largeur de l'image  
`zoom_y`|`Fixnum`|Pourcentage d'agrandissement de la hauteur de l'image. Si cet argument est ommis, la largeur sera égal à la hauteur.  






##### Command.picture_zoom_x(id, zoom)

> Change la largeur d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`zoom`|`Fixnum`|Pourcentage d'agrandissement de la largeur de l'image. Si aucun angle n'est donné, la commande renverra le zoom_x de l'image.  






##### Command.picture_zoom_y(id, zoom)

> Change la hauteur d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`zoom`|`Fixnum`|Pourcentage d'agrandissement de la hauteur de l'image. Si aucun angle n'est donné, la commande renverra le zoom_y de l'image.  






##### Command.pictures_clear

> Efface toutes les images

  
> 





##### Command.pictures_collide?(id, id2)

> Vérifie que deux images sont en collisions

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`id2`|`Fixnum`|ID de l'autre image  






##### Command.pixel_in_picture?(id, x, y, *precise)

> Vérifie que le x, y sont inscrit dans l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`*precise`|`Boolean`|Par défaut, precise vaut false, si precise vaut true, seuls les pixels non transparent seront prit en compte  






##### Command.play_time

> Renvoie le temps de jeu en secondes

  
> 





##### Command.random(min, max)

> Renvoie un nombre aléatoire compris entre MIN et MAX inclus

  
> Nom|Type|Description  
--- | --- | ---  
`min`|`Fixnum`|Borne minimale  
`max`|`Fixnum`|Borne maximale (à noter que si cet argument n'est pas spécifié, le résultat sera compris entre 0 et min inclus)  






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






##### Command.save_count

> Renvoie le nombre de sauvegarde effectuées par partie

  
> 





##### Command.scroll_lock?

> Renvoie true si le clavier est en mode SCROLL_LOCK au moment de l'appel, false sinon

  
> 





##### Command.session_username

> Renvoie le nom d'utilisateur de la session Windows

  
> 





##### Command.shift?

> Renvoie true si la touche Maj du clavier est activée au moment de l'appel, false sinon

  
> 





##### Command.square_passable?(x, y, direction)

> Renvoie true si la case référencée par X, Y est passable dans la direction référencée par direction, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  
`direction`|`Fixnum`|Direction (2,4,6,8)  






##### Command.steps

> Renvoie le nombre de pas effectué par l'équipe

  
> 





##### Command.team_size

> Renvoie la taille de l'équipe

  
> 





##### Command.terrain_tag(x, y)

> Renvoie le tag du terrain de la case pointée par les coordonnées X,Y

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  






##### Command.tile_id(x, y)

> Renvoie l'ID de la tile pointée par les coordonnées X,Y

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  






##### Command.timer

> Renvoie la valeur du chronomètre

  
> 





##### Command.tone(red, green, blue, *gray)

> Renvoie une teinte

  
> Nom|Type|Description  
--- | --- | ---  
`red`|`Fixnum`|Valeur de rouge  
`green`|`Fixnum`|Valeur de vert  
`blue`|`Fixnum`|Valeur de bleu  
`*gray`|`Fixnum`|Valeur de gris, par défaut 0!  






##### Command.wait(duration)

> Attend un nombre de frames donné

  
> Nom|Type|Description  
--- | --- | ---  
`duration`|`Fixnum`|Nombre de frames a attendre  






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

> Renvoie le maximum des points de dégat d'une arme référencée par son ID

  
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






