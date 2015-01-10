#RME : RPG Maker Extender
Outil d'extension de RPG Maker
    (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](__command_list.md) > **Commandes évènements**- - -#Commandes évènements
Commandes relatives aux évènements

##Liste des commandes
*    [event_collide?(idA, idB)](#event_collideida-idb)
*    [event_direction(id)](#event_directionid)
*    [event_in_screen?(id)](#event_in_screenid)
*    [event_look_at?(idA, idB, scope, *metric)](#event_look_atida-idb-scope-metric)
*    [event_pixel_x(id)](#event_pixel_xid)
*    [event_pixel_y(id)](#event_pixel_yid)
*    [event_screen_x(id)](#event_screen_xid)
*    [event_screen_y(id)](#event_screen_yid)
*    [event_x(id)](#event_xid)
*    [event_y(id)](#event_yid)
*    [fresh_event_id](#fresh_event_id)
*    [include_page(map_id, event_id, page_id, *runnable, *context)](#include_pagemap_id-event_id-page_id-runnable-context)
*    [invoke_event(map_id, event_id, new_id, *x, *y)](#invoke_eventmap_id-event_id-new_id-x-y)
*    [max_event_id](#max_event_id)
*    [mouse_click_event?(events)](#mouse_click_eventevents)
*    [mouse_hover_event?(events)](#mouse_hover_eventevents)
*    [mouse_press_event?(events, *key)](#mouse_press_eventevents-key)
*    [mouse_release_event?(events, *key)](#mouse_release_eventevents-key)
*    [mouse_repeat_event?(events, *key)](#mouse_repeat_eventevents-key)
*    [mouse_trigger_event?(events, *key)](#mouse_trigger_eventevents-key)
*    [page_runnable?(map_id, event_id, page_id, *context)](#page_runnablemap_id-event_id-page_id-context)
*    [pixels_between(idA, idB)](#pixels_betweenida-idb)
*    [player_direction](#player_direction)
*    [player_in_screen?](#player_in_screen)
*    [player_pixel_x](#player_pixel_x)
*    [player_pixel_y](#player_pixel_y)
*    [player_screen_x](#player_screen_x)
*    [player_screen_y](#player_screen_y)
*    [player_x](#player_x)
*    [player_y](#player_y)
*    [squares_between(idA, idB)](#squares_betweenida-idb)


##Description des commandes
##### event_collide?(idA, idB)

> Renvoie true si l'evenement A est en collision avec l'évènement B, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de l'évènement A (0 pour héros)  
`idB`|`Fixnum`|ID de l'évènement B (0 pour héros)  


##### event_direction(id)

> Renvoie la direction (2 pour le haut, 8, pour le bas, 4 pour la gauche , 6 pour la droite ) de l'évènement référencé par son ID en pixel sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  


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


##### max_event_id

> Renvoie le plus grand ID d'évènement occupé sur la carte

  
> 

##### mouse_click_event?(events)

> Renvoie true si la souris clique un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  


##### mouse_hover_event?(events)

> Renvoie true si la souris survol un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  


##### mouse_press_event?(events, *key)

> Renvoie true si la souris presse un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Selector`|Touche à presser (par défaut, la touche est :mouse_left  


##### mouse_release_event?(events, *key)

> Renvoie true si la souris est relâchée sur un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Selector`|Touche à presser (par défaut, la touche est :mouse_left  


##### mouse_repeat_event?(events, *key)

> Renvoie true si la souris clique de manière répétée un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Selector`|Touche à presser (par défaut, la touche est :mouse_left  


##### mouse_trigger_event?(events, *key)

> Renvoie true si la souris vient de cliquer un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Selector`|Touche à presser (par défaut, la touche est :mouse_left  


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

##### squares_between(idA, idB)

> Renvoie le nombre de cases entre deux évènements référencés par leurs ID's

  
> Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de l'évènement A (0 pour héros)  
`idB`|`Fixnum`|ID de l'évènement B (0 pour héros)  


