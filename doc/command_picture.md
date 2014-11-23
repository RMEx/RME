#Commandes de manipulation des images
[Retourner à l'index](__command_list.md)

Commandes relatives à la manipulation des images

##Liste des commandes
*    [picture_angle(id, angle)](#picture_angleid-angle)
*    [picture_blend(id, mode)](#picture_blendid-mode)
*    [picture_erase(id)](#picture_eraseid)
*    [picture_flip(id)](#picture_flipid)
*    [picture_move(id, x, y, zoom_x, zoom_y, duration, *wait_flag, *opacity, *blend_type, *origin)](#picture_moveid-x-y-zoom_x-zoom_y-duration-wait_flag-opacity-blend_type-origin)
*    [picture_opacity(id, opacity)](#picture_opacityid-opacity)
*    [picture_origin(id, origin)](#picture_originid-origin)
*    [picture_pin(id, x, y)](#picture_pinid-x-y)
*    [picture_rotate(id, speed)](#picture_rotateid-speed)
*    [picture_scroll(id, vitesse)](#picture_scrollid-vitesse)
*    [picture_scroll_x(id, vitesse)](#picture_scroll_xid-vitesse)
*    [picture_scroll_y(id, vitesse)](#picture_scroll_yid-vitesse)
*    [picture_show(id, name, *x, *y, *origin, *zoom_x, *zoom_y, *opacity, *blend_type)](#picture_showid-name-x-y-origin-zoom_x-zoom_y-opacity-blend_type)
*    [picture_tone(id, tone, *duration, *wait_flag)](#picture_toneid-tone-duration-wait_flag)
*    [picture_unpin(id)](#picture_unpinid)
*    [picture_wave(id, amplitude, vitesse)](#picture_waveid-amplitude-vitesse)
*    [picture_x(id, x)](#picture_xid-x)
*    [picture_y(id, x)](#picture_yid-x)
*    [picture_zoom(id, zoom_x, *zoom_y)](#picture_zoomid-zoom_x-zoom_y)
*    [picture_zoom_x(id, zoom)](#picture_zoom_xid-zoom)
*    [picture_zoom_y(id, zoom)](#picture_zoom_yid-zoom)
*    [pictures_clear](#pictures_clear)
*    [pixel_in_picture?(id, x, y, *precise)](#pixel_in_pictureid-x-y-precise)


##Description des commandes
##### picture_angle(id, angle)

> Change l'angle de l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`angle`|`Fixnum`|Angle d'orientation de l'image (En degrés décimaux, sens anti-horaire). Si aucun angle n'est donné, la commande renverra l'angle de l'image  


##### picture_blend(id, mode)

> Change le mode de fusion d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`mode`|`Fixnum`|Mode choisi (0, 1 ou 2)  


##### picture_erase(id)

> Efface l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  


##### picture_flip(id)

> Applique un effet miroir sur l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  


##### picture_move(id, x, y, zoom_x, zoom_y, duration, *wait_flag, *opacity, *blend_type, *origin)

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


##### picture_opacity(id, opacity)

> Change l'opacité d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`opacity`|`Fixnum`|valeur de l'opacité (de 0 à 255)  


##### picture_origin(id, origin)

> Change l'origine d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`origin`|`Fixnum`|Origine de l'image, 0 = Haut gauche, 1 = centré, [x,y] = orienté autours de X,Y, par défaut, zéro  


##### picture_pin(id, x, y)

> Fait défiler une image avec la carte (la fixe à une position)

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`x`|`Fixnum`|Coordonnées X de la carte en pixel  
`y`|`Fixnum`|Coordonnées X de la carte en pixel  


##### picture_rotate(id, speed)

> Fait tourner l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`speed`|`Fixnum`|Vitesse de rotation de l'image  


##### picture_scroll(id, vitesse)

> Change la vitesse de défilement (vertical et horizontal) d'une image fixée sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`vitesse`|`Fixnum`|Vitesse de défilement  


##### picture_scroll_x(id, vitesse)

> Change la vitesse de défilement horizontal d'une image fixée sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`vitesse`|`Fixnum`|Vitesse de défilement  


##### picture_scroll_y(id, vitesse)

> Change la vitesse de défilement vertical d'une image fixée sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`vitesse`|`Fixnum`|Vitesse de défilement  


##### picture_show(id, name, *x, *y, *origin, *zoom_x, *zoom_y, *opacity, *blend_type)

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


##### picture_tone(id, tone, *duration, *wait_flag)

> Change la teinte d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`tone`|`Tone`|Teinte de l'image  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut false  


##### picture_unpin(id)

> Arrête de faire défiler une image avec la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  


##### picture_wave(id, amplitude, vitesse)

> Fait onduler l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`amplitude`|`Fixnum`|Amplitude (taille de l'ondulation)  
`vitesse`|`Fixnum`|Vitesse de l'ondulation  


##### picture_x(id, x)

> Change l'axe X d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`x`|`Fixnum`|Position en x de l'image, si aucun argument n'est passé, la commande renverra la position X de l'image  


##### picture_y(id, x)

> Change l'axe Y d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`x`|`Fixnum`|Position en y de l'image, si aucun argument n'est passé, la commande renverra la position Y de l'image  


##### picture_zoom(id, zoom_x, *zoom_y)

> Change la taille d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`zoom_x`|`Fixnum`|Pourcentage d'agrandissement de la largeur de l'image  
`*zoom_y`|`Fixnum`|Pourcentage d'agrandissement de la hauteur de l'image. Si cet argument est ommis, la largeur sera égal à la hauteur.  


##### picture_zoom_x(id, zoom)

> Change la largeur d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`zoom`|`Fixnum`|Pourcentage d'agrandissement de la largeur de l'image. Si aucune valeur n'est donné, la commande renverra le zoom_x de l'image.  


##### picture_zoom_y(id, zoom)

> Change la hauteur d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`zoom`|`Fixnum`|Pourcentage d'agrandissement de la hauteur de l'image. Si aucune valeur n'est donné, la commande renverra le zoom_y de l'image.  


##### pictures_clear

> Efface toutes les images

  
> 

##### pixel_in_picture?(id, x, y, *precise)

> Vérifie que le x, y sont inscrit dans l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`*precise`|`Boolean`|Par défaut, precise vaut false, si precise vaut true, seuls les pixels non transparent seront prit en compte  


