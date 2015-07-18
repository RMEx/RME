#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Images**  
- - -  
#Images
Commandes relatives à la manipulation des images

##Liste des commandes
*    [picture_angle(id, angle, *duration, *wait_flag, *ease)](#picture_angleid-angle-duration-wait_flag-ease)
*    [picture_blend(id, mode)](#picture_blendid-mode)
*    [picture_dimension(id, w, h, *duration, *wait_flag, *ease)](#picture_dimensionid-w-h-duration-wait_flag-ease)
*    [picture_erase(id)](#picture_eraseid)
*    [picture_erased?(id)](#picture_erasedid)
*    [picture_flip(id)](#picture_flipid)
*    [picture_height(id, *v, *duration, *wait_flag, *ease)](#picture_heightid-v-duration-wait_flag-ease)
*    [picture_move(id, x, y, zoom_x, zoom_y, duration, *wait_flag, *opacity, *blend_type, *origin, *ease)](#picture_moveid-x-y-zoom_x-zoom_y-duration-wait_flag-opacity-blend_type-origin-ease)
*    [picture_move?(id)](#picture_moveid)
*    [picture_name(id, *name)](#picture_nameid-name)
*    [picture_opacity(id, opacity, *duration, *wait_flag, *ease)](#picture_opacityid-opacity-duration-wait_flag-ease)
*    [picture_origin(id, origin)](#picture_originid-origin)
*    [picture_pin(id, *x, *y)](#picture_pinid-x-y)
*    [picture_position(id, x, y, *duration, *wait_flag, *ease)](#picture_positionid-x-y-duration-wait_flag-ease)
*    [picture_rotate(id, speed)](#picture_rotateid-speed)
*    [picture_scroll(id, vitesse)](#picture_scrollid-vitesse)
*    [picture_scroll_x(id, vitesse)](#picture_scroll_xid-vitesse)
*    [picture_scroll_y(id, vitesse)](#picture_scroll_yid-vitesse)
*    [picture_shake(id, power, speed, duration)](#picture_shakeid-power-speed-duration)
*    [picture_show(id, name, *x, *y, *origin, *zoom_x, *zoom_y, *opacity, *blend_type)](#picture_showid-name-x-y-origin-zoom_x-zoom_y-opacity-blend_type)
*    [picture_show_enemy(pic_id, id, position)](#picture_show_enemypic_id-id-position)
*    [picture_showed?(id)](#picture_showedid)
*    [picture_tone(id, tone, *duration, *wait_flag, *ease)](#picture_toneid-tone-duration-wait_flag-ease)
*    [picture_unpin(id)](#picture_unpinid)
*    [picture_wave(id, amplitude, vitesse)](#picture_waveid-amplitude-vitesse)
*    [picture_width(id, *v, *duration, *wait_flag, *ease)](#picture_widthid-v-duration-wait_flag-ease)
*    [picture_x(id, x, *duration, *wait_flag, *ease)](#picture_xid-x-duration-wait_flag-ease)
*    [picture_y(id, y, *duration, *wait_flag, *ease)](#picture_yid-y-duration-wait_flag-ease)
*    [picture_zoom(id, zoom_x, *zoom_y, *duration, *wait_flag, *ease)](#picture_zoomid-zoom_x-zoom_y-duration-wait_flag-ease)
*    [picture_zoom_x(id, zoom, *duration, *wait_flag, *ease)](#picture_zoom_xid-zoom-duration-wait_flag-ease)
*    [picture_zoom_y(id, zoom, *duration, *wait_flag, *ease)](#picture_zoom_yid-zoom-duration-wait_flag-ease)
*    [pictures_clear](#pictures_clear)
*    [pictures_collide?(id, id2)](#pictures_collideid-id2)
*    [pictures_perfect_collide?(idA, idB)](#pictures_perfect_collideida-idb)
*    [pixel_in_picture?(id, x, y, *precise)](#pixel_in_pictureid-x-y-precise)


##Description des commandes
##### picture_angle(id, angle, *duration, *wait_flag, *ease)

> Change l'angle de l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`angle`|`Fixnum`|Angle d'orientation de l'image (En degrés décimaux, sens anti-horaire). Si aucun angle n'est donné, la commande renverra l'angle de l'image  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  


##### picture_blend(id, mode)

> Change le mode de fusion d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`mode`|`Fixnum`|Mode choisi (0, 1 ou 2)  


##### picture_dimension(id, w, h, *duration, *wait_flag, *ease)

> Change la hauteur et la largeur d'une image référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`w`|`Fixnum`|Largeur à modifier  
`h`|`Fixnum`|Hauteur à modifier  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  


##### picture_erase(id)

> Efface l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  


##### picture_erased?(id)

> Renvoie true si l'image est supprimée (ou non affichée), false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  


##### picture_flip(id)

> Applique un effet miroir (axe vertical) sur l'image 

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  


##### picture_height(id, *v, *duration, *wait_flag, *ease)

> Change la hauteur d'une image référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`*v`|`Fixnum`|Valeur à changer, si aucune valeur n'est donnée, la commande renverra la hauteur de l'image  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  


##### picture_move(id, x, y, zoom_x, zoom_y, duration, *wait_flag, *opacity, *blend_type, *origin, *ease)

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
`*opacity`|`Fixnum`|Opacité (de 0 à 255) que l'image devra avoir, si '-1', ou aucun argument n'est donné, l'image conserva son opacité actuelle  
`*blend_type`|`Fixnum`|Mode de fusion (0, 1, 2) que l'image devra avoir, si '-1', ou aucun argument n'est donné, l'image conserva son mode de fusion du moment  
`*origin`|`Fixnum`|Origine que l'image devra avoir, si '-1', ou aucun argument n'est donné, l'image conserva son origine du moment  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  


##### picture_move?(id)

> Renvoie true si l'image référencée par son ID est en mouvement, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  


##### picture_name(id, *name)

> Change le nom de l'image à afficher

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`*name`|`String`|Nom de l'image (sans l'extension, entre guillemets anglais), si aucun argument n'est passé, la commande renverra le nom courrant  


##### picture_opacity(id, opacity, *duration, *wait_flag, *ease)

> Change l'opacité d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`opacity`|`Fixnum`|valeur de l'opacité (de 0 à 255)  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  


##### picture_origin(id, origin)

> Change l'origine d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`origin`|`Fixnum`|Origine de l'image, 0 = Haut gauche, 1 = centré, [x,y] = orienté autour de X,Y, par défaut, zéro, zéro  


##### picture_pin(id, *x, *y)

> Fait défiler une image avec la carte (la fixe à une position)

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`*x`|`Fixnum`|Coordonnées X de la carte en pixels, par défaut la coordonnée convertie de l'écran vers la carte  
`*y`|`Fixnum`|Coordonnées Y de la carte en pixels, par défaut la coordonnée convertie de l'écran vers la carte  


##### picture_position(id, x, y, *duration, *wait_flag, *ease)

> Change la position de l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`x`|`Fixnum`|Position en x de l'image  
`y`|`Fixnum`|Position en y de l'image  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  


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


##### picture_shake(id, power, speed, duration)

> Fait trembler l'image pendant un temps donné

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`power`|`Fixnum`|La puissance du tremblement  
`speed`|`Fixnum`|La vitesse du tremblement  
`duration`|`Fixnum`|La durée en frames du tremblement  


##### picture_show(id, name, *x, *y, *origin, *zoom_x, *zoom_y, *opacity, *blend_type)

> Affiche une image à l'écran

  
> Nom|Type|Description  
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


##### picture_show_enemy(pic_id, id, position)

> Affiche un monstre d'un groupe à sa position définie dans la base de données

  
> Nom|Type|Description  
--- | --- | ---  
`pic_id`|`Fixnum`|ID de l'image dans laquelle afficher le monstre  
`id`|`Fixnum`|ID du groupe de monstre  
`position`|`Fixnum`|Position du monstre  


##### picture_showed?(id)

> Renvoie true si l'image est affichée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  


##### picture_tone(id, tone, *duration, *wait_flag, *ease)

> Change la teinte d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`tone`|`Tone`|Teinte de l'image (utilisez la commande tone)  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut false  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  


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


##### picture_width(id, *v, *duration, *wait_flag, *ease)

> Change la largeur d'une image référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`*v`|`Fixnum`|Valeur à changer, si aucune valeur n'est donnée, la commande renverra la largeur de l'image  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  


##### picture_x(id, x, *duration, *wait_flag, *ease)

> Change l'axe X d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`x`|`Fixnum`|Position en x de l'image, si aucun argument n'est passé, la commande renverra la position X de l'image  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  


##### picture_y(id, y, *duration, *wait_flag, *ease)

> Change l'axe Y d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`y`|`Fixnum`|Position en y de l'image, si aucun argument n'est passé, la commande renverra la position Y de l'image  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  


##### picture_zoom(id, zoom_x, *zoom_y, *duration, *wait_flag, *ease)

> Change la taille d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`zoom_x`|`Fixnum`|Pourcentage d'agrandissement de la largeur de l'image  
`*zoom_y`|`Fixnum`|Pourcentage d'agrandissement de la hauteur de l'image. Si cet argument est ommis, la largeur sera égale à la hauteur.  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  


##### picture_zoom_x(id, zoom, *duration, *wait_flag, *ease)

> Change la largeur d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`zoom`|`Fixnum`|Pourcentage d'agrandissement de la largeur de l'image. Si aucune valeur n'est donnée, la commande renverra le zoom_x de l'image.  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  


##### picture_zoom_y(id, zoom, *duration, *wait_flag, *ease)

> Change la hauteur d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`zoom`|`Fixnum`|Pourcentage d'agrandissement de la hauteur de l'image. Si aucune valeur n'est donnée, la commande renverra le zoom_y de l'image.  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  


##### pictures_clear

> Efface toutes les images

  
> 

##### pictures_collide?(id, id2)

> Vérifie que deux images sont en collision

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`id2`|`Fixnum`|ID de l'autre image  


##### pictures_perfect_collide?(idA, idB)

> Vérifie la collision entre deux images au pixel près. ATTENTION, CETTE COMMANDE LAG ENORMEMENT !IL EST DECONSEILLE DE L'UTILISER !

  
> Nom|Type|Description  
--- | --- | ---  
`idA`|`Fixnum`|ID de la première image  
`idB`|`Fixnum`|ID de la seconde image  


##### pixel_in_picture?(id, x, y, *precise)

> Vérifie que le x, y sont inscrits dans l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`*precise`|`Boolean`|Par défaut, precise vaut false, si precise vaut true, seuls les pixels non transparents seront pris en compte  


