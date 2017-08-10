# RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste%20des%20commandes.md) > **Evénements**  
- - -  
# Evénements
Commandes relatives aux évènements

## Liste des commandes
*    [angle_between(idA, idB)](#angle_betweenida-idb)
*    [event_brutal_stop_trail(ids)](#event_brutal_stop_trailids)
*    [event_direction(id, *value)](#event_directionid-value)
*    [event_erase(id)](#event_eraseid)
*    [event_erased?(id)](#event_erasedid)
*    [event_flash(id, color, duration)](#event_flashid-color-duration)
*    [event_in_screen?(id)](#event_in_screenid)
*    [event_look_at?(idA, idB, scope, *metric)](#event_look_atida-idb-scope-metric)
*    [event_move_away_from_event(id, target)](#event_move_away_from_eventid-target)
*    [event_move_away_from_player(id)](#event_move_away_from_playerid)
*    [event_move_away_from_position(id, x, y)](#event_move_away_from_positionid-x-y)
*    [event_move_backward(id)](#event_move_backwardid)
*    [event_move_diagonal(id, horizontal, vertical)](#event_move_diagonalid-horizontal-vertical)
*    [event_move_down(id, *turn_ok)](#event_move_downid-turn_ok)
*    [event_move_forward(id)](#event_move_forwardid)
*    [event_move_frequency(ids, f)](#event_move_frequencyids-f)
*    [event_move_left(id, *turn_ok)](#event_move_leftid-turn_ok)
*    [event_move_lower_left(id)](#event_move_lower_leftid)
*    [event_move_lower_right(id)](#event_move_lower_rightid)
*    [event_move_random(id)](#event_move_randomid)
*    [event_move_right(id, *turn_ok)](#event_move_rightid-turn_ok)
*    [event_move_speed(ids, v)](#event_move_speedids-v)
*    [event_move_speed_frequency(ids, v, f)](#event_move_speed_frequencyids-v-f)
*    [event_move_straight(id, value, *turn_ok)](#event_move_straightid-value-turn_ok)
*    [event_move_toward_event(id, target)](#event_move_toward_eventid-target)
*    [event_move_toward_player(id)](#event_move_toward_playerid)
*    [event_move_toward_position(id, x, y)](#event_move_toward_positionid-x-y)
*    [event_move_up(id, *turn_ok)](#event_move_upid-turn_ok)
*    [event_move_upper_left(id)](#event_move_upper_leftid)
*    [event_move_upper_right(id)](#event_move_upper_rightid)
*    [event_move_with(id, code)](#event_move_withid-code)
*    [event_moving?(id)](#event_movingid)
*    [event_name(id)](#event_nameid)
*    [event_opacity(ids, *value)](#event_opacityids-value)
*    [event_opaque(id)](#event_opaqueid)
*    [event_ox(id, *value)](#event_oxid-value)
*    [event_oy(id, *value)](#event_oyid-value)
*    [event_path_length(id, x, y, *wait_flag, *no_through)](#event_path_lengthid-x-y-wait_flag-no_through)
*    [event_pixel_x(id)](#event_pixel_xid)
*    [event_pixel_y(id)](#event_pixel_yid)
*    [event_priority(ids, priority)](#event_priorityids-priority)
*    [event_restore_origin(id)](#event_restore_originid)
*    [event_screen_x(id)](#event_screen_xid)
*    [event_screen_y(id)](#event_screen_yid)
*    [event_stop_trail(ids)](#event_stop_trailids)
*    [event_through(id, *flag)](#event_throughid-flag)
*    [event_through?(id)](#event_throughid)
*    [event_trail(ids, len, *mode)](#event_trailids-len-mode)
*    [event_transfert(id, new_x, new_y)](#event_transfertid-new_x-new_y)
*    [event_transparent(id)](#event_transparentid)
*    [event_transparent?(id)](#event_transparentid)
*    [event_trigger(ids, trigger)](#event_triggerids-trigger)
*    [event_turn_180(id)](#event_turn_180id)
*    [event_turn_90_left(id)](#event_turn_90_leftid)
*    [event_turn_90_right(id)](#event_turn_90_rightid)
*    [event_turn_90_right_or_left(id)](#event_turn_90_right_or_leftid)
*    [event_turn_away_from_event(id, target)](#event_turn_away_from_eventid-target)
*    [event_turn_away_from_player(id)](#event_turn_away_from_playerid)
*    [event_turn_away_from_position(id, x, y)](#event_turn_away_from_positionid-x-y)
*    [event_turn_down(id)](#event_turn_downid)
*    [event_turn_left(id)](#event_turn_leftid)
*    [event_turn_random(id)](#event_turn_randomid)
*    [event_turn_right(id)](#event_turn_rightid)
*    [event_turn_toward_event(id, target)](#event_turn_toward_eventid-target)
*    [event_turn_toward_player(id)](#event_turn_toward_playerid)
*    [event_turn_toward_position(id, x, y)](#event_turn_toward_positionid-x-y)
*    [event_turn_up(id)](#event_turn_upid)
*    [event_x(id)](#event_xid)
*    [event_y(id)](#event_yid)
*    [event_zoom(id, value)](#event_zoomid-value)
*    [event_zoom_x(id, *value)](#event_zoom_xid-value)
*    [event_zoom_y(id, *value)](#event_zoom_yid-value)
*    [events_buzz(e, *duration)](#events_buzze-duration)
*    [events_buzzer_properties(e, amplitude, length)](#events_buzzer_propertiese-amplitude-length)
*    [events_collide?(idA, idB)](#events_collideida-idb)
*    [followers_buzz(ids, *duration)](#followers_buzzids-duration)
*    [followers_buzzer_properties(*ids, amplitude, length)](#followers_buzzer_propertiesids-amplitude-length)
*    [fresh_event_id(*erased)](#fresh_event_iderased)
*    [include_page(map_id, event_id, page_id, *runnable, *context)](#include_pagemap_id-event_id-page_id-runnable-context)
*    [invoke_event(map_id, event_id, new_id, *x, *y)](#invoke_eventmap_id-event_id-new_id-x-y)
*    [jump_to(id, x, y, *wait_flag)](#jump_toid-x-y-wait_flag)
*    [last_clicked_event](#last_clicked_event)
*    [last_hovered_event](#last_hovered_event)
*    [last_pressed_event](#last_pressed_event)
*    [last_released_event](#last_released_event)
*    [last_repeated_event](#last_repeated_event)
*    [last_triggered_event](#last_triggered_event)
*    [max_event_id](#max_event_id)
*    [mouse_click_event?(events, *precise)](#mouse_click_eventevents-precise)
*    [mouse_click_player?](#mouse_click_player)
*    [mouse_hover_event?(events, *precise)](#mouse_hover_eventevents-precise)
*    [mouse_hover_player?](#mouse_hover_player)
*    [mouse_press_event?(events, *key, *precise)](#mouse_press_eventevents-key-precise)
*    [mouse_press_player?(*key)](#mouse_press_playerkey)
*    [mouse_release_event?(events, *key, *precise)](#mouse_release_eventevents-key-precise)
*    [mouse_release_player?(*key)](#mouse_release_playerkey)
*    [mouse_repeat_event?(events, *key, *precise)](#mouse_repeat_eventevents-key-precise)
*    [mouse_repeat_player?(*key)](#mouse_repeat_playerkey)
*    [mouse_trigger_event?(events, *key, *precise)](#mouse_trigger_eventevents-key-precise)
*    [mouse_trigger_player?(*key)](#mouse_trigger_playerkey)
*    [move_to(id, x, y, *wait_flag, *no_throug)](#move_toid-x-y-wait_flag-no_throug)
*    [page_runnable?(map_id, event_id, page_id, *context)](#page_runnablemap_id-event_id-page_id-context)
*    [pixel_in_event?(id, x, y, *precise)](#pixel_in_eventid-x-y-precise)
*    [pixel_in_player?(x, y, *precise)](#pixel_in_playerx-y-precise)
*    [pixels_between(idA, idB)](#pixels_betweenida-idb)
*    [player_brutal_stop_trail](#player_brutal_stop_trail)
*    [player_direction(*value)](#player_directionvalue)
*    [player_flash(color, duration)](#player_flashcolor-duration)
*    [player_in_screen?](#player_in_screen)
*    [player_move_away_from_event(id)](#player_move_away_from_eventid)
*    [player_move_away_from_position(x, y)](#player_move_away_from_positionx-y)
*    [player_move_backward](#player_move_backward)
*    [player_move_diagonal(horizontal, vertical)](#player_move_diagonalhorizontal-vertical)
*    [player_move_down(*turn_ok)](#player_move_downturn_ok)
*    [player_move_forward](#player_move_forward)
*    [player_move_frequency(f)](#player_move_frequencyf)
*    [player_move_left(*turn_ok)](#player_move_leftturn_ok)
*    [player_move_lower_left](#player_move_lower_left)
*    [player_move_lower_right](#player_move_lower_right)
*    [player_move_random](#player_move_random)
*    [player_move_right(*turn_ok)](#player_move_rightturn_ok)
*    [player_move_speed(v)](#player_move_speedv)
*    [player_move_speed_frequency(v, f)](#player_move_speed_frequencyv-f)
*    [player_move_straight(value, *turn_ok)](#player_move_straightvalue-turn_ok)
*    [player_move_toward_event(id)](#player_move_toward_eventid)
*    [player_move_toward_position(x, y)](#player_move_toward_positionx-y)
*    [player_move_up(*turn_ok)](#player_move_upturn_ok)
*    [player_move_upper_left](#player_move_upper_left)
*    [player_move_upper_right](#player_move_upper_right)
*    [player_move_with(code)](#player_move_withcode)
*    [player_moving?](#player_moving)
*    [player_opacity(*value)](#player_opacityvalue)
*    [player_opaque](#player_opaque)
*    [player_ox(*value)](#player_oxvalue)
*    [player_oy(*value)](#player_oyvalue)
*    [player_path_length(x, y, *wait_flag, *no_through)](#player_path_lengthx-y-wait_flag-no_through)
*    [player_pixel_x](#player_pixel_x)
*    [player_pixel_y](#player_pixel_y)
*    [player_restore_origin](#player_restore_origin)
*    [player_screen_x](#player_screen_x)
*    [player_screen_y](#player_screen_y)
*    [player_stop_trail](#player_stop_trail)
*    [player_teleport(map_id, x, y, *direction, *fade_type)](#player_teleportmap_id-x-y-direction-fade_type)
*    [player_teleport_with_transition(map_id, x, y, transition, duration, *vague, *direction)](#player_teleport_with_transitionmap_id-x-y-transition-duration-vague-direction)
*    [player_through(*flag)](#player_throughflag)
*    [player_through?](#player_through)
*    [player_trail(len, *mode, *tone)](#player_traillen-mode-tone)
*    [player_transfert(new_x, new_y)](#player_transfertnew_x-new_y)
*    [player_transparent](#player_transparent)
*    [player_transparent?](#player_transparent)
*    [player_turn_180](#player_turn_180)
*    [player_turn_90_left](#player_turn_90_left)
*    [player_turn_90_right](#player_turn_90_right)
*    [player_turn_90_right_or_left](#player_turn_90_right_or_left)
*    [player_turn_away_from_event(id)](#player_turn_away_from_eventid)
*    [player_turn_away_from_position(x, y)](#player_turn_away_from_positionx-y)
*    [player_turn_down](#player_turn_down)
*    [player_turn_left](#player_turn_left)
*    [player_turn_random](#player_turn_random)
*    [player_turn_right](#player_turn_right)
*    [player_turn_toward_event(id)](#player_turn_toward_eventid)
*    [player_turn_toward_position(x, y)](#player_turn_toward_positionx-y)
*    [player_turn_up](#player_turn_up)
*    [player_x](#player_x)
*    [player_y](#player_y)
*    [player_zoom(value)](#player_zoomvalue)
*    [player_zoom_x(*value)](#player_zoom_xvalue)
*    [player_zoom_y(*value)](#player_zoom_yvalue)
*    [show_animation(ids, id_animation, *wait_flag)](#show_animationids-id_animation-wait_flag)
*    [show_balloon(ids, id_balloon, *wait_flag)](#show_balloonids-id_balloon-wait_flag)
*    [squares_between(idA, idB)](#squares_betweenida-idb)


## Description des commandes
##### angle_between(idA, idB)

> Renvoie l'angle entre deux événements référencés par leurs ID's

  
Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de l'évènement A (0 pour héros)  
`idB`|`Fixnum`|ID de l'évènement B (0 pour héros)  
##### event_brutal_stop_trail(ids)

> Arrête brutalement la traînée sur un sélecteur d'évènements

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|Sélecteur d'évènements à qui attribuer une traînée  
##### event_direction(id, *value)

> Renvoie (ou change) la direction (2 pour le haut, 8, pour le bas, 4 pour la gauche , 6 pour la droite ) de l'évènement référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  
`*value`|`Fixnum`|Valeur de la direction, 2,4,6,8. Si aucune valeur n'est donnée, la commande retourne la direction de l'évènement ciblé.  
##### event_erase(id)

> Efface de la map les événements référencés par le sélécteur ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Selector`|ID des événements  
##### event_erased?(id)

> Renvoie true si l'évènement référencé par son ID à été supprimé, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour le héro)  
##### event_flash(id, color, duration)

> Flash un événement (référencé par son ID) dans une couleur

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|l'ID de l'événement cible  
`color`|`Color`|La couleur du flash (vous pouvez utiliser la commande color ou via son profil dans la base de données)  
`duration`|`Fixnum`|La durée du flash en frames  
##### event_in_screen?(id)

> Renvoie true si l'évènement référencé par son ID est visible à l'écran, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  
##### event_look_at?(idA, idB, scope, *metric)

> Renvoie true si l'évènement A regarde dans la direction de l'évènement B et que celui ci est dans son périmètre, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de l'évènement A (0 pour héros)  
`idB`|`Fixnum`|ID de l'évènement B (0 pour héros)  
`scope`|`Fixnum`|Nombre de cases ou de pixels  
`*metric`|`Fixnum`|par défaut :square pour en cases, mettre :pixels pour en pixels  
##### event_move_away_from_event(id, target)

> Déplace un événement référencé par son ID d'une case dans la direction opposée à un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement devant effectuer le déplacement  
`target`|`Fixnum`|Id de l'événement cible  
##### event_move_away_from_player(id)

> Déplace un événement référencé par son ID d'une case en direction opposée au héro. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement devant effectuer le déplacement  
##### event_move_away_from_position(id, x, y)

> Déplace un événement référencé par son ID d'une case dans la direction opposée à une coordonnée. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
##### event_move_backward(id)

> Déplace l'événement référencé par son ID d'une case en arrière. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement devant effectuer le déplacement  
##### event_move_diagonal(id, horizontal, vertical)

> Déplace un événement référencé par son ID d'une case en diagonale. Renvoie true si le mouvement à réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement  
`horizontal`|`Fixnum`|Direction horizontale (4 pour gauche, 6 pour droite)  
`vertical`|`Fixnum`|Direction verticale (2 pour bas, 8 pour haut)  
##### event_move_down(id, *turn_ok)

> Fait bouger l'événement référencé par son ID d'une case vers le bas. Renvoie true si le déplacement s'est effectué, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement  
`*turn_ok`|`Boolean`|En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)  
##### event_move_forward(id)

> Déplace l'événement référencé par son ID d'une case en avant. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement devant effectuer le déplacement  
##### event_move_frequency(ids, f)

> Modifie la fréquence des événements référencés par leurs Id

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|ID des événements  
`f`|`Fixnum`|Fréquence des événements, si aucune priorité n'est donnée, la commande renverra la valeur de la fréquence de l'évènement référencé par son ID  
##### event_move_left(id, *turn_ok)

> Fait bouger l'événement référencé par son ID d'une case vers la gauche. Renvoie true si le déplacement s'est effectué, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement  
`*turn_ok`|`Boolean`|En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)  
##### event_move_lower_left(id)

> Déplacement l'événement référencé par son ID d'une case en diagonale bas-gauche. Renvoie true si le déplacement à réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
##### event_move_lower_right(id)

> Déplacement l'événement référencé par son ID d'une case en diagonale bas-droite. Renvoie true si le déplacement à réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
##### event_move_random(id)

> Déplace un événement d' une case aléatoire.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement  
##### event_move_right(id, *turn_ok)

> Fait bouger l'événement référencé par son ID d'une case vers la droite. Renvoie true si le déplacement s'est effectué, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement  
`*turn_ok`|`Boolean`|En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)  
##### event_move_speed(ids, v)

> Modifie la vitesse des événements référencés par leurs Id

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|ID des événements  
`v`|`Fixnum`|Vitesse des événements,si aucune priorité n'est donnée, la commande renverra la valeur de la vitesse de l'évènement référencé par son ID  
##### event_move_speed_frequency(ids, v, f)

> Change la vitesse et la fréquence des événements référencés par leurs ID

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|IDs des événements  
`v`|`Fixnum`|Vitesse des événements  
`f`|`Fixnum`|Fréquence des événements  
##### event_move_straight(id, value, *turn_ok)

> Déplace un événement référencé par son ID d'une case dans une direction. La commande renvoie true ou false si le déplacement a réussi ou non.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement  
`value`|`Fixnum`|Valeur, 2 pour bas, 4 pour gauche, 6 pour droite et 8 pour bas  
`*turn_ok`|`Boolean`|En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)  
##### event_move_toward_event(id, target)

> Déplace un événement référencé par son ID d'une case en direction d'un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement devant effectuer le déplacement  
`target`|`Fixnum`|Id de l'événement cible  
##### event_move_toward_player(id)

> Déplace un événement référencé par son ID d'une case en direction du héro. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement devant effectuer le déplacement  
##### event_move_toward_position(id, x, y)

> Déplace un événement référencé par son ID d'une case en direction d'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
##### event_move_up(id, *turn_ok)

> Fait bouger l'événement référencé par son ID d'une case vers le haut. Renvoie true si le déplacement s'est effectué, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement  
`*turn_ok`|`Boolean`|En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)  
##### event_move_upper_left(id)

> Déplacement l'événement référencé par son ID d'une case en diagonale haut-gauche. Renvoie true si le déplacement à réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
##### event_move_upper_right(id)

> Déplacement l'événement référencé par son ID d'une case en diagonale haut-droite. Renvoie true si le déplacement à réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
##### event_move_with(id, code)

> Applique un déplacement (selon un code) à un événement

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement  
`code`|`Fixnum`|Liste des codes de déplacement  
##### event_moving?(id)

> Renvoie true si l'évènement est en mouvement, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement  
##### event_name(id)

> Renvoie le nom d'un évènement, renvoie nil s' il s'agit du héros

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour le héros)  
##### event_opacity(ids, *value)

> Modifie (ou retourne) l'opacité d'un évènement 

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|Id de l'évènement (ne pas utiliser de selecteur pour renvoyer l'opacité)  
`*value`|`Fixnum`|Valeur de l'opacité, entre 0 et 255. Si aucune valeur n'est donnée, la commande retourne l'opacité de l'évènement ciblé.  
##### event_opaque(id)

> Rend l'évènement référencé par son ID opaque

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement  
##### event_ox(id, *value)

> Modifie (ou retourne) la coordonnée X du point de départ d'un événement (le point d'accroche)

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
`*value`|`Fixnum`|Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante  
##### event_oy(id, *value)

> Modifie (ou retourne) la coordonnée y du point de départ d'un événement (le point d'accroche)

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
`*value`|`Fixnum`|Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante  
##### event_path_length(id, x, y, *wait_flag, *no_through)

> Renvoie la taille du chemin nécéssaire au pathfinder pour se rendre a un point

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'évènement (0 pour le héros)  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`*wait_flag`|`Boolean`|Par défaut, false, cette valeur définit le blocage durant le déplacement ou non  
`*no_through`|`Boolean`|Par défaut, false, si cette valeur vaut true, même en mode fantôme, l'évènement utilisera un chemin passable  
##### event_pixel_x(id)

> Renvoie la coordonnée X de l'évènement référencé par son ID en pixel sur la carte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  
##### event_pixel_y(id)

> Renvoie la coordonnée Y de l'évènement référencé par son ID en pixel sur la carte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  
##### event_priority(ids, priority)

> Change la priorité d'affichage des événements référencés par leurs ID (0: sous le héros, 1: même niveau que le héros, 2: au dessus du héros)

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|ID des événements  
`priority`|`Fixnum`|Priorité d'affichage, si aucune priorité n'est donnée, la commande renverra la valeur de la priorité de l'évènement référencé par son ID  
##### event_restore_origin(id)

> Restore l'origine de l'événement référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
##### event_screen_x(id)

> Renvoie la coordonnée X de l'évènement référencé par son ID par rapport à l'écran

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  
##### event_screen_y(id)

> Renvoie la coordonnée Y de l'évènement référencé par son ID par rapport à l'écran

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  
##### event_stop_trail(ids)

> Arrête la trainée sur un sélecteur d'évènements

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|Sélecteur d'évènements à qui attribuer une traînée  
##### event_through(id, *flag)

> Change le mode de traversée de l'évènement

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement  
`*flag`|`Boolean`|true pour 'traverse tout', false pour 'ne traverse pas tout', par défaut vaut true   
##### event_through?(id)

> Renvoie true si l'évènement est en mode 'traverse tout', false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement  
##### event_trail(ids, len, *mode)

> Applique une traînée sur un sélecteur d'évènements

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|Sélecteur d'évènements à qui attribuer une traînée  
`len`|`Fixnum`|Taille de la trainée  
`*mode`|`Tone`|Teinte de la trainée (utilisez la commande tone)  
##### event_transfert(id, new_x, new_y)

> Téléporte l'évènement référencé par son ID à une nouvelle coordonnées de la carte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement  
`new_x`|`Fixnum`|Coordonnées X  
`new_y`|`Fixnum`|Coordonnées Y  
##### event_transparent(id)

> Rend l'évènement référencé par son ID transparent

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement  
##### event_transparent?(id)

> Renvoie true si l'évènement est transparent (false sinon)

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement  
##### event_trigger(ids, trigger)

> Change le type de déclenchement des événements référencés par leurs ID (0: touche action, 1: contact du héros, 2: contact de l'event, 3: automatique, 4: processus paralléle).

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|ID des événements  
`trigger`|`Fixnum`|Type de déclenchement, si aucune priorité n'est donnée, la commande renverra la valeur du déclencheur de l'évènement référencé par son ID  
##### event_turn_180(id)

> Fait tourner un événement référencé par son ID de 180°

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
##### event_turn_90_left(id)

> Fait tourner un événement référencé par son ID de 90° par la gauche

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
##### event_turn_90_right(id)

> Fait tourner un événement référencé par son ID de 90° par la droite

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
##### event_turn_90_right_or_left(id)

> Fait tourner un événement référencé par son ID de 90° par la gauche ou par la droite (aléatoirement)

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
##### event_turn_away_from_event(id, target)

> Tourne un événement référencé par son ID d'une case dans la direction opposée à un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement devant effectuer le déplacement  
`target`|`Fixnum`|Id de l'événement cible  
##### event_turn_away_from_player(id)

> Tourne un événement référencé par son ID d'une case en direction opposée au héro. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement devant effectuer le déplacement  
##### event_turn_away_from_position(id, x, y)

> Tourne un événement référencé par son ID d'une case dans la direction opposée à une coordonnée. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
##### event_turn_down(id)

> Fait tourner un événement vers le bas

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
##### event_turn_left(id)

> Fait tourner un événement à gauche

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
##### event_turn_random(id)

> Fait tourner un événement référencé par son ID dans une direction aléatoire

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
##### event_turn_right(id)

> Fait tourner un événement à droite

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
##### event_turn_toward_event(id, target)

> Tourne un événement référencé par son ID d'une case en direction d'un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement devant effectuer le déplacement  
`target`|`Fixnum`|Id de l'événement cible  
##### event_turn_toward_player(id)

> Tourne un événement référencé par son ID d'une case en direction du héro. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement devant effectuer le déplacement  
##### event_turn_toward_position(id, x, y)

> Tourne un événement référencé par son ID d'une case en direction d'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
##### event_turn_up(id)

> Fait tourner un événement vers le bas

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
##### event_x(id)

> Renvoie la coordonnées X de la case sur laquelle se trouve l'évènement référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  
##### event_y(id)

> Renvoie la coordonnée Y de la case sur laquelle se trouve l'évènement référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  
##### event_zoom(id, value)

> Modifie le zoom d'un événement

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
`value`|`Fixnum`|Valeur du zoom  
##### event_zoom_x(id, *value)

> Modifie (ou retourne) la valeur du zoom horizontal d'un événement

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
`*value`|`Fixnum`|Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante  
##### event_zoom_y(id, *value)

> Modifie (ou retourne) la valeur du zoom vertical d'un événement

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement  
`*value`|`Fixnum`|Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante  
##### events_buzz(e, *duration)

> Fait tressaillir les évènements

  
Nom|Type|Description  
--- | --- | ---  
`e`|`Selector`|Selecteur d'évènements  
`*duration`|`Fixnum`|Durée du dressaillement (en frames), par défaut, 16  
##### events_buzzer_properties(e, amplitude, length)

> Change les propriétés de tressaillement d'évènements

  
Nom|Type|Description  
--- | --- | ---  
`e`|`Selector`|Selecteurs d'évènements  
`amplitude`|`ArgType`|Amplitude du tressaillement  
`length`|`Fixnum`|Taille du tressaillement  
##### events_collide?(idA, idB)

> Renvoie true si l'evenement A est en collision avec l'évènement B, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de l'évènement A (0 pour héros)  
`idB`|`Fixnum`|ID de l'évènement B (0 pour héros)  
##### followers_buzz(ids, *duration)

> Fait tressaillir les suiveurs (followers_buzz([1,2,3], *duration), par exemple, si la liste des suiveurs n'est pas renseignée, ça s'applique à tous les followers)

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|Tableau des identifiants des suiveurs à faire tressaillir, utiliser [] pour appliquer à tous les suiveurs  
`*duration`|`Fixnum`|Durée du dressaillement (en frame), par défaut, 16  
##### followers_buzzer_properties(*ids, amplitude, length)

> Change les propriétés de tressaillement des membres de la chenille (followers_buzzer_properties(0,1,2,3, amplitude, length))

  
Nom|Type|Description  
--- | --- | ---  
`*ids`|`ArgsList`|Liste des positions des suiveurs. Si cet argument est occulté, ces paramètres s'appliquent à tous les suiveurs.  
`amplitude`|`ArgType`|Amplitude du tressaillement  
`length`|`Fixnum`|Taille du tressaillement  
##### fresh_event_id(*erased)

> Renvoie un ID libre (utile en cas d'invocation d'évènement)

  
Nom|Type|Description  
--- | --- | ---  
`*erased`|`Boolean`|Si cette valeur vaut true, la commande renverra le plus petit ID d'un événement supprimé  
##### include_page(map_id, event_id, page_id, *runnable, *context)

> Invoque une page (comme s'il s'agissait d'un évènement commun) d'un autre évènement

  
Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à inclure  
`event_id`|`Fixnum`|ID de l'évènement où chercher la page à inclure  
`page_id`|`Fixnum`|ID de la page à inclure  
`*runnable`|`Boolean`|Par défaut, cette variable a pour valeur `false`. Si elle vaut `true`, la page ne sera incluse que si la condition de lancement de la page est respectée. Par défaut, elle utilise le contexte (les interrupteurs locaux) de l'évènement appelant.  
`*context`|`Boolean`|Par défaut, cette variable a pour valeur `false`. Si `runnable` et `context` valent `true`, la condition de lancement de la page utilisera le contexte (les interrupteurs locaux) de l'évènement d'origine à la place de celui de l'évènement appelant.  
##### invoke_event(map_id, event_id, new_id, *x, *y)

> Invoque un évènement d'une autre map (ou de la même) sur la carte

  
Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à invoquer  
`event_id`|`Fixnum`|ID de l'évènement à invoquer  
`new_id`|`Fixnum`|Nouvel ID de l'évènement fraîchement invoqué  
`*x`|`Fixnum`|Position X où placer l'évènement invoqué, par défaut, conserve la valeur de l'évènement invoqué  
`*y`|`Fixnum`|Position Y où placer l'évènement invoqué, par défaut conserve la valeur de l'évènement invoqué  
##### jump_to(id, x, y, *wait_flag)

> Déplace l'évènement, en sautant, référencé par son ID (0 pour le héros) vers les coordonnées données en argument

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'évènement (0 pour le héros)  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`*wait_flag`|`Boolean`|Par défaut, false, cette valeur définit le blocage durant le déplacement ou non  
##### last_clicked_event

> Renvoie le dernier event cliqué par la souris, nil si aucun évènement n'a été cliqué

  
##### last_hovered_event

> Renvoie le dernier event survolé par la souris, nil si aucun évènement n'a été survolé

  
##### last_pressed_event

> Renvoie le dernier event pressé (avec :mouse_left) par la souris, nil si aucun évènement n'a été pressé

  
##### last_released_event

> Renvoie le dernier event relâché (avec mouse_left) par la souris, nil si aucun évènement n'a été relâché

  
##### last_repeated_event

> Renvoie le dernier event cliqué en continu (avec :mouse_left) par la souris, nil si aucun évènement n'a été cliqué en continu

  
##### last_triggered_event

> Renvoie le dernier event appuyé une fois (avec :mouse_left) par la souris, nil si aucun évènement n'a été triggeré

  
##### max_event_id

> Renvoie le plus grand ID d'évènement occupé sur la carte

  
##### mouse_click_event?(events, *precise)

> Renvoie true si la souris clique sur un évènement du sélecteur passé en argument

  
Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*precise`|`Boolean`|Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut false   
##### mouse_click_player?

> Renvoie true si la souris clique sur l'image du joueur

  
##### mouse_hover_event?(events, *precise)

> Renvoie true si la souris survole un évènement du sélecteur passé en argument

  
Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*precise`|`Boolean`|Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut true   
##### mouse_hover_player?

> Renvoie true si la souris survole l'image du joueur

  
##### mouse_press_event?(events, *key, *precise)

> Renvoie true si la souris reste pressée sur un évènement du sélecteur passé en argument

  
Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Symbol`|Touche à presser (par défaut, la touche est :mouse_left)  
`*precise`|`Boolean`|Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut false   
##### mouse_press_player?(*key)

> Renvoie true si la souris presse en continu la touche passée en argument sur le joueur

  
Nom|Type|Description  
--- | --- | ---  
`*key`|`ArgType`|Touche à presser (par défaut, la touche est :mouse_left)  
##### mouse_release_event?(events, *key, *precise)

> Renvoie true si la souris est relâchée sur un évènement du sélecteur passé en argument

  
Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Symbol`|Touche à presser (par défaut, la touche est :mouse_left)  
`*precise`|`Boolean`|Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut false   
##### mouse_release_player?(*key)

> Renvoie true si la souris relâche la touche passée en argument sur le joueur

  
Nom|Type|Description  
--- | --- | ---  
`*key`|`ArgType`|Touche à presser (par défaut, la touche est :mouse_left)  
##### mouse_repeat_event?(events, *key, *precise)

> Renvoie true si la souris clique de manière répétée un évènement du sélecteur passé en argument

  
Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Symbol`|Touche à presser (par défaut, la touche est :mouse_left)  
`*precise`|`Boolean`|Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut false   
##### mouse_repeat_player?(*key)

> Renvoie true si la souris appuie de manière répétée sur la touche passée en argument sur l'image du joueur

  
Nom|Type|Description  
--- | --- | ---  
`*key`|`ArgType`|Touche à presser (par défaut, la touche est :mouse_left)  
##### mouse_trigger_event?(events, *key, *precise)

> Renvoie true si la souris vient de cliquer un évènement du sélecteur passé en argument

  
Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Symbol`|Touche à presser (par défaut, la touche est :mouse_left)  
`*precise`|`Boolean`|Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut false   
##### mouse_trigger_player?(*key)

> Renvoie true si la souris appuie une fois la touche passée en argument sur le joueur

  
Nom|Type|Description  
--- | --- | ---  
`*key`|`ArgType`|Touche à presser (par défaut, la touche est :mouse_left)  
##### move_to(id, x, y, *wait_flag, *no_throug)

> Déplace l'évènement référencé par son ID (0 pour le héros) vers les coordonnées données en argument

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'évènement (0 pour le héros)  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`*wait_flag`|`Boolean`|Par défaut, false, cette valeur définit le blocage durant le déplacement ou non  
`*no_throug`|`Boolean`|Par défaut, false, si cette valeur vaut true, même en mode fantôme, l'évènement utilisera un chemin passable  
##### page_runnable?(map_id, event_id, page_id, *context)

> Vérifie si la page est exécutable dans le contexte de l'évènement appelant.

  
Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à tester  
`event_id`|`Fixnum`|ID de l'évènement où chercher la page à tester  
`page_id`|`Fixnum`|ID de la page à tester  
`*context`|`Boolean`|Par défaut, cette variable a pour valeur `false`. Si elle vaut `true`, la condition de lancement de la page utilisera le contexte (les interrupteurs locaux) de l'évènement d'origine à la place de celui de l'évènement appelant.  
##### pixel_in_event?(id, x, y, *precise)

> Renvoie true si le pixel (x, y) est inclu dans l'événement, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`ArgType`|Args description  
`x`|`Fixnum`|Coordonnées X du point à vérifier  
`y`|`Fixnum`|Coordonnées Y du point à vérifier  
`*precise`|`Boolean`|Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut true   
##### pixel_in_player?(x, y, *precise)

> Renvoie true si le pixel (x, y) est inclu dans le joueur, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X du point à vérifier  
`y`|`Fixnum`|Coordonnées Y du point à vérifier  
`*precise`|`Boolean`|Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut true   
##### pixels_between(idA, idB)

> Renvoie le nombre de pixels entre deux évènements référencés par leurs ID's

  
Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de l'évènement A (0 pour héros)  
`idB`|`Fixnum`|ID de l'évènement B (0 pour héros)  
##### player_brutal_stop_trail

> Arrête brutalement la traînée sur le joueur

  
##### player_direction(*value)

> Renvoie (ou change) la direction (2 pour le haut, 8, pour le bas, 4 pour la gauche , 6 pour la droite ) du joueur

  
Nom|Type|Description  
--- | --- | ---  
`*value`|`Fixnum`|Valeur de la direction, 2,4,6,8. Si aucune valeur n'est donnée, la commande retourne la direction du héros  
##### player_flash(color, duration)

> Flash le hér dans une couleur

  
Nom|Type|Description  
--- | --- | ---  
`color`|`Color`|La couleur du flash (vous pouvez utiliser la commande color ou via son profil dans la base de données)  
`duration`|`Fixnum`|La durée du flash en frames  
##### player_in_screen?

> Renvoie true si le joueur est visible à l'écran, false sinon

  
##### player_move_away_from_event(id)

> Déplace le héro d'une case dans la direction opposée à un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement cible  
##### player_move_away_from_position(x, y)

> Déplace le héro d'une case dans la direction opposée d'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
##### player_move_backward

> Déplace le héro d'une case en arrière. Renvoie true si le mouvement a réussi, false sinon.

  
##### player_move_diagonal(horizontal, vertical)

> Déplace le héro d'une case en diagonale. Renvoie true si le mouvement à réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`horizontal`|`Fixnum`|Direction horizontale (4 pour gauche, 6 pour droite)  
`vertical`|`Fixnum`|Direction verticale (2 pour bas, 8 pour haut)  
##### player_move_down(*turn_ok)

> Fait bouger le joueur d'une case vers le bas

  
Nom|Type|Description  
--- | --- | ---  
`*turn_ok`|`Boolean`|En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)  
##### player_move_forward

> Déplace le héro d'une case en avant. Renvoie true si le mouvement a réussi, false sinon.

  
##### player_move_frequency(f)

> Modifie la fréquence du joueur

  
Nom|Type|Description  
--- | --- | ---  
`f`|`Fixnum`|Fréquence du joueur, si aucune priorité n'est donnée, la commande renverra la valeur de la fréquence du héros  
##### player_move_left(*turn_ok)

> Fait bouger le joueur d'une case vers la gauche. Renvoie true si le déplacement s'est effectué, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`*turn_ok`|`Boolean`|En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)  
##### player_move_lower_left

> Déplacement  le héro d'une case en diagonale bas-gauche. Renvoie true si le déplacement à réussi, false sinon.

  
##### player_move_lower_right

> Déplacement  le héro d'une case en diagonale bas-droite. Renvoie true si le déplacement à réussi, false sinon.

  
##### player_move_random

> Déplacele héro d' une case aléatoire.

  
##### player_move_right(*turn_ok)

> Fait bouger le joueur d'une case vers la droite. Renvoie true si le déplacement s'est effectué, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`*turn_ok`|`Boolean`|En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)  
##### player_move_speed(v)

> Modifie la vitesse du joueur

  
Nom|Type|Description  
--- | --- | ---  
`v`|`Fixnum`|Vitesse du joueur à donner,si aucune priorité n'est donnée, la commande renverra la valeur de la vitesse du héros  
##### player_move_speed_frequency(v, f)

> Change la vitesse et la fréquence de déplacement du joueur

  
Nom|Type|Description  
--- | --- | ---  
`v`|`Fixnum`|Vitesse du joueur  
`f`|`Fixnum`|Fréquence du joueur  
##### player_move_straight(value, *turn_ok)

> Déplace un événement référencé par son ID d'une case dans une direction. La commande renvoie true ou false si le déplacement a réussi ou non.

  
Nom|Type|Description  
--- | --- | ---  
`value`|`Fixnum`|Valeur, 2 pour bas, 4 pour gauche, 6 pour droite et 8 pour bas  
`*turn_ok`|`Boolean`|En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)  
##### player_move_toward_event(id)

> Déplace le héro d'une case en direction d'un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement cible  
##### player_move_toward_position(x, y)

> Déplace le héro d'une case en direction d'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
##### player_move_up(*turn_ok)

> Fait bouger le joueur d'une case vers le haut. Renvoie true si le déplacement s'est effectué, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`*turn_ok`|`Boolean`|En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)  
##### player_move_upper_left

> Déplacement  le héro d'une case en diagonale haut-gauche. Renvoie true si le déplacement à réussi, false sinon.

  
##### player_move_upper_right

> Déplacement  le héro d'une case en diagonale haut-droite. Renvoie true si le déplacement à réussi, false sinon.

  
##### player_move_with(code)

> Applique un déplacement (selon un code) au héros

  
Nom|Type|Description  
--- | --- | ---  
`code`|`Fixnum`|Liste des codes de déplacement  
##### player_moving?

> Renvoie true si le héros est en mouvement, false sinon

  
##### player_opacity(*value)

> Modifie (ou retourne) l'opacité du héros

  
Nom|Type|Description  
--- | --- | ---  
`*value`|`Fixnum`|Valeur de l'opacité, entre 0 et 255. Si aucune valeur n'est donnée. La commande retourne l'opacité du héros.  
##### player_opaque

> Rend le joueur opaque

  
##### player_ox(*value)

> Modifie (ou retourne) la coordonnée X du point de départ du héros (le point d'accroche)

  
Nom|Type|Description  
--- | --- | ---  
`*value`|`Fixnum`|Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante  
##### player_oy(*value)

> Modifie (ou retourne) la coordonnée Y du point de départ du héros (le point d'accroche)

  
Nom|Type|Description  
--- | --- | ---  
`*value`|`Fixnum`|Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante  
##### player_path_length(x, y, *wait_flag, *no_through)

> Renvoie la taille du chemin nécéssaire au pathfinder pour se rendre a un point

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`*wait_flag`|`Boolean`|Par défaut, false, cette valeur définit le blocage durant le déplacement ou non  
`*no_through`|`Boolean`|Par défaut, false, si cette valeur vaut true, même en mode fantôme, l'évènement utilisera un chemin passable  
##### player_pixel_x

> Renvoie la coordonnées X du joueur en pixel sur la carte

  
##### player_pixel_y

> Renvoie la coordonnées Y du joueur en pixel sur la carte

  
##### player_restore_origin

> Restore l'origine du héros

  
##### player_screen_x

> Renvoie la coordonnée X du joueur par rapport à l'écran

  
##### player_screen_y

> Renvoie la coordonnée Y du joueur par rapport à l'écran

  
##### player_stop_trail

> Arrête la traînée sur le joueur

  
##### player_teleport(map_id, x, y, *direction, *fade_type)

> Téléporte le héros à une nouvelle coordonnées sur une nouvelle map (potentiellement)

  
Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la carte. Utiliser c(:map_id) pour téléporter sur la même carte  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`*direction`|`Fixnum`|Nouvelle direction pour le héro (2,4,6 ou 8). Si aucune direction n'est spécifiée, le joueur gardera sa direction  
`*fade_type`|`Fixnum`|Le mode de téléport (par défaut 0), 0 = fondu noir, 1 = fondu blanc, 2 = instantanné  
##### player_teleport_with_transition(map_id, x, y, transition, duration, *vague, *direction)

> Effectue une téléportation avec une image comme transition

  
Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la carte. Utiliser c(:map_id) pour téléporter sur la même carte  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`transition`|`String`|Image où se trouve la transition  
`duration`|`Fixnum`|Durée de la transition  
`*vague`|`Fixnum`|Ambiguité (par défaut, 40)  
`*direction`|`Fixnum`|Nouvelle direction pour le héro (2,4,6 ou 8). Si aucune direction n'est spécifiée, le joueur gardera sa direction  
##### player_through(*flag)

> Change le mode de traversée du joueur

  
Nom|Type|Description  
--- | --- | ---  
`*flag`|`Boolean`|true pour 'traverse tout', false pour 'ne traverse pas tout', par défaut vaut true   
##### player_through?

> Renvoie true si le joueur est en mode 'traverse tout', false sinon

  
##### player_trail(len, *mode, *tone)

> Applique une traînée sur le joueur

  
Nom|Type|Description  
--- | --- | ---  
`len`|`Fixnum`|Taille de la traînée  
`*mode`|`Fixnum`|Mode de fusion de la traînée (0, 1 ou 2), par défaut: 0  
`*tone`|`Tone`|Teinte de la traînée (utilisez la commande tone)  
##### player_transfert(new_x, new_y)

> Téléporte instanément le héros à une autre position de la carte

  
Nom|Type|Description  
--- | --- | ---  
`new_x`|`Fixnum`|Coordonnée X  
`new_y`|`Fixnum`|Coordonnée Y  
##### player_transparent

> Rend le joueur transparent

  
##### player_transparent?

> Renvoi true si le joueur est transparent (false sinon)

  
##### player_turn_180

> Fait tourner le héro de 180°

  
##### player_turn_90_left

> Fait tourner le joueur de 90° par la gauche

  
##### player_turn_90_right

> Fait tourner le joueur de 90° par la droite

  
##### player_turn_90_right_or_left

> Fait tourner le héro de 90° par la gauche ou par la droite (aléatoirement)

  
##### player_turn_away_from_event(id)

> Tourne le héro d'une case dans la direction opposée à un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement cible  
##### player_turn_away_from_position(x, y)

> Tourne le héro d'une case dans la direction opposée d'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
##### player_turn_down

> Fait tourner le héro vers le bas

  
##### player_turn_left

> Fait tourner le héro à gauche

  
##### player_turn_random

> Fait tourner le héro dans une direction aléatoire

  
##### player_turn_right

> Fait tourner le héro à droite

  
##### player_turn_toward_event(id)

> Tourne le héro d'une case en direction d'un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'événement cible  
##### player_turn_toward_position(x, y)

> Tourne le héro d'une case en direction d'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
##### player_turn_up

> Fait tourner le héro vers le bas

  
##### player_x

> Renvoie la coordonnée X de la case sur laquelle est le joueur

  
##### player_y

> Renvoie la coordonnée Y de la case sur laquelle est le joueur

  
##### player_zoom(value)

> Modifie le zoom du héros

  
Nom|Type|Description  
--- | --- | ---  
`value`|`Fixnum`|Valeur du zoom  
##### player_zoom_x(*value)

> Modifie (ou retourne) la valeur du zoom horizontal du héros

  
Nom|Type|Description  
--- | --- | ---  
`*value`|`Fixnum`|Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante  
##### player_zoom_y(*value)

> Modifie (ou retourne) la valeur du zoom vertical du héros

  
Nom|Type|Description  
--- | --- | ---  
`*value`|`Fixnum`|Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante  
##### show_animation(ids, id_animation, *wait_flag)

> Joue une animation sur les événements référencés par le selecteur ID

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|IDS des événements  
`id_animation`|`Fixnum`|ID de l'animation  
`*wait_flag`|`string`|attend la fin si true  
##### show_balloon(ids, id_balloon, *wait_flag)

> Joue une émoticone sur les événements référencés par le selecteur ID

  
Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|IDS des événements  
`id_balloon`|`Fixnum`|ID de l'émoticone  
`*wait_flag`|`String`|attend la fin si true  
##### squares_between(idA, idB)

> Renvoie le nombre de cases entre deux évènements référencés par leurs ID

  
Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de l'évènement A (0 pour héros)  
`idB`|`Fixnum`|ID de l'évènement B (0 pour héros)  
