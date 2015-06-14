#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Commandes de manipulation de la caméra**  
- - -  
#Commandes de manipulation de la caméra
Commandes relatives à la manipulation de la caméra (scrolling de la carte)

##Liste des commandes
*    [camera_change_focus(event_id)](#camera_change_focusevent_id)
*    [camera_lock](#camera_lock)
*    [camera_move_on(x, y)](#camera_move_onx-y)
*    [camera_scroll(direction, distance, speed)](#camera_scrolldirection-distance-speed)
*    [camera_scroll_on(x, y, speed)](#camera_scroll_onx-y-speed)
*    [camera_unlock](#camera_unlock)


##Description des commandes
##### camera_change_focus(event_id)

> Change la cible du scrolling (par défaut, le scrolling suit le héros) pour un autre évènement

  
> Nom|Type|Description  
--- | --- | ---  
`event_id`|`Fixnum`|ID de l'évènement à suivre par la caméra  


##### camera_lock

> Verrouille la position de la caméra

  
> 

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

