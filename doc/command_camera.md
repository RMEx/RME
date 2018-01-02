# RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste%20des%20commandes.md) > **Caméra**  
- - -  
# Caméra
Commandes relatives à la manipulation de la caméra (scrolling de la carte)

## Liste des commandes
*    [camera_change_focus(event_id)](#camera_change_focusevent_id)
*    [camera_lock](#camera_lock)
*    [camera_lock_x](#camera_lock_x)
*    [camera_lock_y](#camera_lock_y)
*    [camera_locked?](#camera_locked)
*    [camera_motion_blur(attenuation, *duration, *wait_flag, *ease)](#camera_motion_blurattenuation-duration-wait_flag-ease)
*    [camera_move_on(x, y)](#camera_move_onx-y)
*    [camera_scroll(direction, distance, speed)](#camera_scrolldirection-distance-speed)
*    [camera_scroll_on(x, y, speed)](#camera_scroll_onx-y-speed)
*    [camera_scroll_towards(x, y, nb_steps, *easing_function, *position)](#camera_scroll_towardsx-y-nb_steps-easing_function-position)
*    [camera_scroll_towards_event(id, nb_steps, *easing_function, *position)](#camera_scroll_towards_eventid-nb_steps-easing_function-position)
*    [camera_scroll_towards_player(nb_steps, *easing_function, *position)](#camera_scroll_towards_playernb_steps-easing_function-position)
*    [camera_scrolling?](#camera_scrolling)
*    [camera_unlock](#camera_unlock)
*    [camera_unlock_x](#camera_unlock_x)
*    [camera_unlock_y](#camera_unlock_y)
*    [camera_x_locked?](#camera_x_locked)
*    [camera_y_locked?](#camera_y_locked)
*    [camera_zoom(zoom, *duration, *wait_flag, *ease)](#camera_zoomzoom-duration-wait_flag-ease)


## Description des commandes
##### camera_change_focus(event_id)

> Change la cible du scrolling (par défaut, le scrolling suit le héros) pour un autre évènement

  
Nom|Type|Description  
--- | --- | ---  
`event_id`|`Fixnum`|ID de l'évènement à suivre par la caméra  
##### camera_lock

> Verrouille la position de la caméra

  
##### camera_lock_x

> Verrouille la position de la caméra sur l'axe X

  
##### camera_lock_y

> Verrouille la position de la caméra sur l'axe Y

  
##### camera_locked?

> Renovie true si la camera est verrouillée

  
##### camera_motion_blur(attenuation, *duration, *wait_flag, *ease)

> Atténue le raffraichissement de l'écran. Rend plus diffus les mouvements de caméra, et mouvements à l'écran.

  
Nom|Type|Description  
--- | --- | ---  
`attenuation`|`ArgType`|Valeur d'atténuation du raffraichissement de l'écran, de 0 à 200  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :InLinear par défaut.  
##### camera_move_on(x, y)

> Place la caméra sur un point de la carte

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
##### camera_scroll(direction, distance, speed)

> Fait défiler la caméra dans une direction sur une distance (en cases) à une certaine vitesse

  
Nom|Type|Description  
--- | --- | ---  
`direction`|`Fixnum`|Direction (2=bas, 4=gauche, 6=droite, 8=haut)  
`distance`|`Fixnum`|Nombre de cases à défiler  
`speed`|`Fixnum`|Vitesse du défilement  
##### camera_scroll_on(x, y, speed)

> Fait défiler la carte vers un point donné

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`speed`|`Fixnum`|Vitesse de défilement  
##### camera_scroll_towards(x, y, nb_steps, *easing_function, *position)

> Fait défiler la caméra vers le point de coordonnées (x, y). (Par défaut, ce point sera celui situé dans le coin haut-gauche de l'écran une fois le défilement terminé)

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|L'abscisse du point cible  
`y`|`Fixnum`|L'ordonnée du point cible  
`nb_steps`|`Fixnum`|Le nombre d'étapes lors du défilement (plus il y en a, plus le temps de défilement sera long)  
`*easing_function`|`Symbol`|Fonction à utiliser pour effectuer la transition. :InLinear par défaut.  
`*position`|`Symbol`|Position finale du point cible, par rapport à la caméra (valeurs possibles: {:centered, :centered_left, :centered_right, :centered_top, :centered_bottom, :top_left, :top_right, :bottom_left, :bottom_right}).:top_left par défaut  
##### camera_scroll_towards_event(id, nb_steps, *easing_function, *position)

> Fait défiler la caméra vers l'événement spécifié. (Par défaut, l'événement sera situé dans le coin haut-gauche de l'écran une fois le défilement terminé)

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'évènement (0 pour héros)  
`nb_steps`|`Fixnum`|Le nombre d'étapes lors du défilement (plus il y en a, plus le temps de défilement sera long)  
`*easing_function`|`Symbol`|Fonction à utiliser pour effectuer la transition. :InLinear par défaut.  
`*position`|`Symbol`|Position finale du point cible, par rapport à la caméra (valeurs possibles: {:centered, :centered_left, :centered_right, :centered_top, :centered_bottom, :top_left, :top_right, :bottom_left, :bottom_right}).:top_left par défaut  
##### camera_scroll_towards_player(nb_steps, *easing_function, *position)

> Fait défiler la caméra vers le joueur. (Par défaut, le joueur sera situé dans le coin haut-gauche de l'écran une fois le défilement terminé)

  
Nom|Type|Description  
--- | --- | ---  
`nb_steps`|`Fixnum`|Le nombre d'étapes lors du défilement (plus il y en a, plus le temps de défilement sera long)  
`*easing_function`|`Symbol`|Fonction à utiliser pour effectuer la transition. :InLinear par défaut.  
`*position`|`Symbol`|Position finale joueur, par rapport à la caméra (valeurs possibles: {:centered, :centered_left, :centered_right, :centered_top, :centered_bottom, :top_left, :top_right, :bottom_left, :bottom_right}).:top_left par défaut  
##### camera_scrolling?

> Renvoie true si la camera est en train de défiler, false sinon

  
##### camera_unlock

> Déverrouille la position de la caméra (et reprend le héros comme plan de référence)

  
##### camera_unlock_x

> Déverrouille la position de la caméra sur l'axe X

  
##### camera_unlock_y

> Déverrouille la position de la caméra sur l'axe Y

  
##### camera_x_locked?

> Renovie true si la camera est verrouillée en X

  
##### camera_y_locked?

> Renovie true si la camera est verrouillée en Y

  
##### camera_zoom(zoom, *duration, *wait_flag, *ease)

> Zoom tout l'écran en temps réel, sauf les windows (dialogues, etc.)

  
Nom|Type|Description  
--- | --- | ---  
`zoom`|`ArgType`|Valeur de zoom, supérieur à 100  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :InLinear par défaut.  
