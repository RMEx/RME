#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Caméra**  
- - -  
#Caméra
Commandes relatives à la manipulation de la caméra (scrolling de la carte)

##Liste des commandes
*    [camera_change_focus(event_id)](#camera_change_focusevent_id)
*    [camera_lock](#camera_lock)
*    [camera_motion_blur(v, *duration, *wait_flag, *ease)](#camera_motion_blurv-duration-wait_flag-ease)
*    [camera_move_on(x, y)](#camera_move_onx-y)
*    [camera_scroll(direction, distance, speed)](#camera_scrolldirection-distance-speed)
*    [camera_scroll_on(x, y, speed)](#camera_scroll_onx-y-speed)
*    [camera_unlock](#camera_unlock)
*    [camera_zoom(zoom, *duration, *wait_flag, *ease)](#camera_zoomzoom-duration-wait_flag-ease)


##Description des commandes
##### camera_change_focus(event_id)

> Change la cible du scrolling (par défaut, le scrolling suit le héros) pour un autre évènement

  
> Nom|Type|Description  
--- | --- | ---  
`event_id`|`Fixnum`|ID de l'évènement à suivre par la caméra  


##### camera_lock

> Verrouille la position de la caméra

  
> 

##### camera_motion_blur(v, *duration, *wait_flag, *ease)

> Atténue le raffraichissement de l'écran : rend les mouvements mouvements de caméra, et mouvements à l'écran, plus diffus

  
> Nom|Type|Description  
--- | --- | ---  
`v`|`ArgType`|Valeur d'atténuation du raffraichissement de l'écran, de 0 à 200  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  


##### camera_move_on(x, y)

> Place la caméra sur un point de la carte

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  


##### camera_scroll(direction, distance, speed)

> Fait défiler la carte dans une direction sur une distance (en cases) à une certaine vitesse

  
> Nom|Type|Description  
--- | --- | ---  
`direction`|`Fixnum`|Direction (2=bas, 4=gauche, 6=droite, 8=haut)  
`distance`|`Fixnum`|Nombre de case à défiler  
`speed`|`Fixnum`|Vitesse du défilement  


##### camera_scroll_on(x, y, speed)

> Fait défiler la carte vers un point donné

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`speed`|`Fixnum`|Vitesse de défilement  


##### camera_unlock

> Déverrouille la position de la caméra (et reprend le héros comme plan de référence)

  
> 

##### camera_zoom(zoom, *duration, *wait_flag, *ease)

> Zoom tout l'écran en temps réel, sauf les windows (dialogues, etc.)

  
> Nom|Type|Description  
--- | --- | ---  
`zoom`|`ArgType`|Valeur de zoom, supérieur à 100  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  


