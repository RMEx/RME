#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Commandes évènements**  
- - -  
#Commandes évènements
Commandes relatives aux évènements

##Liste des commandes
*    [angle_between(idA, idB)](#angle_betweenida-idb)
*    [event_direction(id)](#event_directionid)
*    [event_erase(id)](#event_eraseid)
*    [event_erased?(id)](#event_erasedid)
*    [event_in_screen?(id)](#event_in_screenid)
*    [event_look_at?(idA, idB, scope, *metric)](#event_look_atida-idb-scope-metric)
*    [event_move_frequency(ids, f)](#event_move_frequencyids-f)
*    [event_move_speed(ids, v)](#event_move_speedids-v)
*    [event_move_speed_frequency(ids, v, f)](#event_move_speed_frequencyids-v-f)
*    [event_name(id)](#event_nameid)
*    [event_pixel_x(id)](#event_pixel_xid)
*    [event_pixel_y(id)](#event_pixel_yid)
*    [event_screen_x(id)](#event_screen_xid)
*    [event_screen_y(id)](#event_screen_yid)
*    [event_x(id)](#event_xid)
*    [event_y(id)](#event_yid)
*    [events_buzz(e, *duration)](#events_buzze-duration)
*    [events_buzzer_properties(e, amplitude, length)](#events_buzzer_propertiese-amplitude-length)
*    [events_collide?(idA, idB)](#events_collideida-idb)
*    [followers_buzz(ids, *duration)](#followers_buzzids-duration)
*    [followers_buzzer_properties(*ids, amplitude, length)](#followers_buzzer_propertiesids-amplitude-length)
*    [fresh_event_id](#fresh_event_id)
*    [include_page(map_id, event_id, page_id, *runnable, *context)](#include_pagemap_id-event_id-page_id-runnable-context)
*    [invoke_event(map_id, event_id, new_id, *x, *y)](#invoke_eventmap_id-event_id-new_id-x-y)
*    [last_clicked_event](#last_clicked_event)
*    [last_hovered_event](#last_hovered_event)
*    [last_pressed_event](#last_pressed_event)
*    [last_released_event](#last_released_event)
*    [last_repeated_event](#last_repeated_event)
*    [last_triggered_event](#last_triggered_event)
*    [max_event_id](#max_event_id)
*    [mouse_click_event?(events)](#mouse_click_eventevents)
*    [mouse_click_player?](#mouse_click_player)
*    [mouse_hover_event?(events)](#mouse_hover_eventevents)
*    [mouse_hover_player?](#mouse_hover_player)
*    [mouse_press_event?(events, *key)](#mouse_press_eventevents-key)
*    [mouse_press_player?(*key)](#mouse_press_playerkey)
*    [mouse_release_event?(events, *key)](#mouse_release_eventevents-key)
*    [mouse_release_player?(*key)](#mouse_release_playerkey)
*    [mouse_repeat_event?(events, *key)](#mouse_repeat_eventevents-key)
*    [mouse_repeat_player?(*key)](#mouse_repeat_playerkey)
*    [mouse_trigger_event?(events, *key)](#mouse_trigger_eventevents-key)
*    [mouse_trigger_player?(*key)](#mouse_trigger_playerkey)
*    [page_runnable?(map_id, event_id, page_id, *context)](#page_runnablemap_id-event_id-page_id-context)
*    [pixels_between(idA, idB)](#pixels_betweenida-idb)
*    [player_direction](#player_direction)
*    [player_in_screen?](#player_in_screen)
*    [player_move_frequency(f)](#player_move_frequencyf)
*    [player_move_speed(v)](#player_move_speedv)
*    [player_pixel_x](#player_pixel_x)
*    [player_pixel_y](#player_pixel_y)
*    [player_screen_x](#player_screen_x)
*    [player_screen_y](#player_screen_y)
*    [player_x](#player_x)
*    [player_y](#player_y)
*    [show_animation(ids, id_animation, *wait_flag)](#show_animationids-id_animation-wait_flag)
*    [show_balloon(ids, id_balloon, *wait_flag)](#show_balloonids-id_balloon-wait_flag)
*    [squares_between(idA, idB)](#squares_betweenida-idb)


##Description des commandes
##### angle_between(idA, idB)

> Renvoie l'angle entre deux événements référencés par leurs ID's

  
> Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de l'évènement A (0 pour héros)  
`idB`|`Fixnum`|ID de l'évènement B (0 pour héros)  


##### event_direction(id)

> Renvoie la direction (2 pour le haut, 8, pour le bas, 4 pour la gauche , 6 pour la droite ) de l'évènement référencé par son ID en pixel sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  


##### event_erase(id)

> Efface les événements de la map référencer par le sélécteur IDS

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Selector`|IDS des événements  


##### event_erased?(id)

> Renvoie true si l'évènement référencé par son ID à été supprimé, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour le héro)  


##### event_in_screen?(id)

> Renvoie true si l'évènement référencé par son ID est visible à l'écran, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  


##### event_look_at?(idA, idB, scope, *metric)

> Renvoie true si l'evenement A regarde dans la direction de l'évènement B et que celui ci est dans son périmètre, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de l'évènement A (0 pour héros)  
`idB`|`Fixnum`|ID de l'évènement B (0 pour héros)  
`scope`|`Fixnum`|Nombre de case ou de pixels  
`*metric`|`Fixnum`|par défaut :square, pour en case, :pixels pour en pixels  


##### event_move_frequency(ids, f)

> Modifie la fréquence des événements référencés par leur Ids

  
> Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|ID des événements  
`f`|`Fixnum`|Fréquence des événements  


##### event_move_speed(ids, v)

> Modifie la vitesse des événements référencés par leur Ids

  
> Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|ID des événements  
`v`|`Fixnum`|Vitesse des événements  


##### event_move_speed_frequency(ids, v, f)

> Change la vitesse et la fréquence des événements référencer par le ids

  
> Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|IDs des événements  
`v`|`Fixnum`|Vitesse des événements  
`f`|`Fixnum`|Fréquence des événements  


##### event_name(id)

> Renvoi le nom d'un évènement, renvoi nil s' il s'agit du héros

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour le héro)  


##### event_pixel_x(id)

> Renvoie la coordonnées X de l'évènement référencé par son ID en pixel sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  


##### event_pixel_y(id)

> Renvoie la coordonnées Y de l'évènement référencé par son ID en pixel sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  


##### event_screen_x(id)

> Renvoie la coordonnées X de l'évènement référencé par son ID par rapport à l'écran

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  


##### event_screen_y(id)

> Renvoie la coordonnées Y de l'évènement référencé par son ID par rapport à l'écran

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  


##### event_x(id)

> Renvoie la coordonnées X de la case sur laquelle est l'évènement référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  


##### event_y(id)

> Renvoie la coordonnées Y de la case sur laquelle est l'évènement référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  


##### events_buzz(e, *duration)

> Fait tressaillir les évènements

  
> Nom|Type|Description  
--- | --- | ---  
`e`|`Selector`|Selecteur d'évènements  
`*duration`|`Fixnum`|Durée du dressaillement (en frame), par défaut, 16  


##### events_buzzer_properties(e, amplitude, length)

> Change les propriétés de tressaillement d'évènements

  
> Nom|Type|Description  
--- | --- | ---  
`e`|`Selector`|Selecteurs d'évènements  
`amplitude`|`ArgType`|Amplitude du tressaillement  
`length`|`Fixnum`|Taille du tressaiellement  


##### events_collide?(idA, idB)

> Renvoie true si l'evenement A est en collision avec l'évènement B, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de l'évènement A (0 pour héros)  
`idB`|`Fixnum`|ID de l'évènement B (0 pour héros)  


##### followers_buzz(ids, *duration)

> Fait tressaillir les suiveurs (followers_buzz([1,2,3], *duration), par exemple, si la liste des suiveurs est vide, ça s'applique à tous les followers)

  
> Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|Tableau des identifiants des suiveurs à faire tressaillir, utiliser [] pour appliquer à tous les suiveurs  
`*duration`|`Fixnum`|Durée du dressaillement (en frame), par défaut, 16  


##### followers_buzzer_properties(*ids, amplitude, length)

> Change les propriétés de tressaillement des membre de la chenille (followers_buzzer_properties(0,1,2,3, amplitude, length))

  
> Nom|Type|Description  
--- | --- | ---  
`*ids`|`ArgsList`|Liste des positions des suiveurs. Si cet argument est occulté, ces paramètres s'appliquent à tous les suiveurs.  
`amplitude`|`ArgType`|Amplitude du tressaillement  
`length`|`Fixnum`|Taille du tressaiellement  


##### fresh_event_id

> Renvoie un ID libre (utile en cas d'invocation d'évènement)

  
> 

##### include_page(map_id, event_id, page_id, *runnable, *context)

> Invoque une page (comme s'il s'agissait d'un évènement commun) d'un autre évènement

  
> Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à inclure  
`event_id`|`Fixnum`|ID de l'évènement où chercher la page à inclure  
`page_id`|`Fixnum`|ID de la page à inclure  
`*runnable`|`Boolean`|Par défaut, cette variable a pour valeur `false`. Si elle vaut `true`, la page ne sera incluse que si la condition de lancement de la page est respectée. Par défaut, elle utilise le contexte (les interrupteurs locaux) de l'évènement appelant.  
`*context`|`Boolean`|Par défaut, cette variable a pour valeur `false`. Si `runnable` et `context` valent `true`, la condition de lancement de la page utilisera le contexte (les interrupteurs locaux) de l'évènement d'origine à la place de celui de l'évènement appelant.  


##### invoke_event(map_id, event_id, new_id, *x, *y)

> Invoque un évènement d'une autre map (ou de la même) sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à invoquer  
`event_id`|`Fixnum`|ID de l'évènement à invoquer  
`new_id`|`Fixnum`|Nouvel ID de l'évènement fraîchement invoqué  
`*x`|`Fixnum`|Position X où placer l'évènement invoqué, par défaut, conserve la valeur de l'évènement invoqué  
`*y`|`Fixnum`|Position Y où placer l'évènement invoqué, par défaut conserve la valeur de l'évènement invoqué  


##### last_clicked_event

> Renvoie le dernier event cliqué par la souris, nil si aucun évènement n'a été cliqué

  
> 

##### last_hovered_event

> Renvoie le dernier event survolé par la souris, nil si aucun évènement n'a été survolé

  
> 

##### last_pressed_event

> Renvoie le dernier event pressé (avec :mouse_left) par la souris, nil si aucun évènement n'a été pressé

  
> 

##### last_released_event

> Renvoie le dernier event relaché (avec mouse_left) par la souris, nil si aucun évènement n'a été relaché

  
> 

##### last_repeated_event

> Renvoie le dernier event cliqué en continu (avec :mouse_left) par la souris, nil si aucun évènement n'a été cliqué en continu

  
> 

##### last_triggered_event

> Renvoie le dernier event appuyé une fois (avec :mouse_left) par la souris, nil si aucun évènement n'a été triggeré

  
> 

##### max_event_id

> Renvoie le plus grand ID d'évènement occupé sur la carte

  
> 

##### mouse_click_event?(events)

> Renvoie true si la souris clique un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  


##### mouse_click_player?

> Renvoie true si la souris clique le joueur

  
> 

##### mouse_hover_event?(events)

> Renvoie true si la souris survol un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  


##### mouse_hover_player?

> Renvoie true si la souris survol le joueur

  
> 

##### mouse_press_event?(events, *key)

> Renvoie true si la souris presse un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Symbol`|Touche à presser (par défaut, la touche est :mouse_left  


##### mouse_press_player?(*key)

> Renvoie true si la souris presse en continu la touche passée en argument sur le joueur

  
> Nom|Type|Description  
--- | --- | ---  
`*key`|`ArgType`|Touche à presser (par défaut, la touche est :mouse_left)  


##### mouse_release_event?(events, *key)

> Renvoie true si la souris est relâchée sur un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Symbol`|Touche à presser (par défaut, la touche est :mouse_left  


##### mouse_release_player?(*key)

> Renvoie true si la souris relâche la touche passée en argument sur le joueur

  
> Nom|Type|Description  
--- | --- | ---  
`*key`|`ArgType`|Touche à presser (par défaut, la touche est :mouse_left)  


##### mouse_repeat_event?(events, *key)

> Renvoie true si la souris clique de manière répétée un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Symbol`|Touche à presser (par défaut, la touche est :mouse_left  


##### mouse_repeat_player?(*key)

> Renvoie true si la souris appuye successivement sur la touche passée en argument sur le joueur

  
> Nom|Type|Description  
--- | --- | ---  
`*key`|`ArgType`|Touche à presser (par défaut, la touche est :mouse_left)  


##### mouse_trigger_event?(events, *key)

> Renvoie true si la souris vient de cliquer un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Symbol`|Touche à presser (par défaut, la touche est :mouse_left  


##### mouse_trigger_player?(*key)

> Renvoie true si la souris appuie une fois la touche passée en argument sur le joueur

  
> Nom|Type|Description  
--- | --- | ---  
`*key`|`ArgType`|Touche à presser (par défaut, la touche est :mouse_left)  


##### page_runnable?(map_id, event_id, page_id, *context)

> Vérifie si la page est exécutable dans le contexte de l'évènement appelant.

  
> Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à tester  
`event_id`|`Fixnum`|ID de l'évènement où chercher la page à tester  
`page_id`|`Fixnum`|ID de la page à tester  
`*context`|`Boolean`|Par défaut, cette variable a pour valeur `false`. Si elle vaut `true`, la condition de lancement de la page utilisera le contexte (les interrupteurs locaux) de l'évènement d'origine à la place de celui de l'évènement appelant.  


##### pixels_between(idA, idB)

> Renvoie le nombre de pixels entre deux évènements référencés par leurs ID's

  
> Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de l'évènement A (0 pour héros)  
`idB`|`Fixnum`|ID de l'évènement B (0 pour héros)  


##### player_direction

> Renvoie la direction (2 pour le haut, 8, pour le bas, 4 pour la gauche , 6 pour la droite ) du joueur en pixel sur la carte

  
> 

##### player_in_screen?

> Renvoie true si le joueur est visible à l'écran, false sinon

  
> 

##### player_move_frequency(f)

> Modifie la fréquence du joueur

  
> Nom|Type|Description  
--- | --- | ---  
`f`|`Fixnum`|Fréquence du joueur  


##### player_move_speed(v)

> Modifie la vitesse du joueur

  
> Nom|Type|Description  
--- | --- | ---  
`v`|`Fixnum`|Vitesses du joueur  


##### player_pixel_x

> Renvoie la coordonnées X du joueur en pixel sur la carte

  
> 

##### player_pixel_y

> Renvoie la coordonnées Y du joueur en pixel sur la carte

  
> 

##### player_screen_x

> Renvoie la coordonnées X du joueur par rapport à l'écran

  
> 

##### player_screen_y

> Renvoie la coordonnées Y du joueur par rapport à l'écran

  
> 

##### player_x

> Renvoie la coordonnées X de la case sur laquelle est le joueur

  
> 

##### player_y

> Renvoie la coordonnées Y de la case sur laquelle est le joueur

  
> 

##### show_animation(ids, id_animation, *wait_flag)

> Joue une animation sur les événements référencé par le selecteur IDS

  
> Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|IDS des événements  
`id_animation`|`Fixnum`|ID de l'animation  
`*wait_flag`|`string`|attend la fin si true  


##### show_balloon(ids, id_balloon, *wait_flag)

> Joue une émoticone sur les événements référencé par le selecteur IDS

  
> Nom|Type|Description  
--- | --- | ---  
`ids`|`Selector`|IDS des événements  
`id_balloon`|`Fixnum`|ID de l'émoticone  
`*wait_flag`|`String`|attend la fin si true  


##### squares_between(idA, idB)

> Renvoie le nombre de cases entre deux évènements référencés par leurs ID's

  
> Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de l'évènement A (0 pour héros)  
`idB`|`Fixnum`|ID de l'évènement B (0 pour héros)  


