#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Images**  
- - -  
#Images
Commandes relatives à la manipulation des images

##Liste des commandes
*    [picture_angle(id, angle, *duration, *wait_flag, *ease)](#picture_angleid-angle-duration-wait_flag-ease)
*    [picture_blend(Selector, mode)](#picture_blendselector-mode)
*    [picture_dimension(id, w, h, *duration, *wait_flag, *ease)](#picture_dimensionid-w-h-duration-wait_flag-ease)
*    [picture_erase(Selector)](#picture_eraseselector)
*    [picture_erased?(id)](#picture_erasedid)
*    [picture_flip(Selector)](#picture_flipselector)
*    [picture_height(id, *v, *duration, *wait_flag, *ease)](#picture_heightid-v-duration-wait_flag-ease)
*    [picture_mouse_click?(id, *precise)](#picture_mouse_clickid-precise)
*    [picture_mouse_hover?(id, *precise)](#picture_mouse_hoverid-precise)
*    [picture_mouse_press?(id, *key, *precise)](#picture_mouse_pressid-key-precise)
*    [picture_mouse_release?(id, *key, *precise)](#picture_mouse_releaseid-key-precise)
*    [picture_mouse_repeat?(id, *key, *precise)](#picture_mouse_repeatid-key-precise)
*    [picture_mouse_trigger?(id, *key, *precise)](#picture_mouse_triggerid-key-precise)
*    [picture_move(Selector, x, y, zoom_x, zoom_y, duration, *wait_flag, *opacity, *blend_type, *origin, *ease)](#picture_moveselector-x-y-zoom_x-zoom_y-duration-wait_flag-opacity-blend_type-origin-ease)
*    [picture_move?(id)](#picture_moveid)
*    [picture_name(id, *name)](#picture_nameid-name)
*    [picture_opacity(Selector, opacity, *duration, *wait_flag, *ease)](#picture_opacityselector-opacity-duration-wait_flag-ease)
*    [picture_origin(id, origin)](#picture_originid-origin)
*    [picture_pin(Selector, *x, *y)](#picture_pinselector-x-y)
*    [picture_position(Selector, x, y, *duration, *wait_flag, *ease)](#picture_positionselector-x-y-duration-wait_flag-ease)
*    [picture_rotate(Selector, speed)](#picture_rotateselector-speed)
*    [picture_scroll(Selector, vitesse)](#picture_scrollselector-vitesse)
*    [picture_scroll_x(Selector, vitesse)](#picture_scroll_xselector-vitesse)
*    [picture_scroll_y(Selector, vitesse)](#picture_scroll_yselector-vitesse)
*    [picture_shake(Selector, power, speed, duration)](#picture_shakeselector-power-speed-duration)
*    [picture_show(id, name, *x, *y, *origin, *zoom_x, *zoom_y, *opacity, *blend_type)](#picture_showid-name-x-y-origin-zoom_x-zoom_y-opacity-blend_type)
*    [picture_show_enemy(pic_id, id, position)](#picture_show_enemypic_id-id-position)
*    [picture_showed?(id)](#picture_showedid)
*    [picture_tone(id, tone, *duration, *wait_flag, *ease)](#picture_toneid-tone-duration-wait_flag-ease)
*    [picture_unpin(Selector)](#picture_unpinselector)
*    [picture_wave(Selector, amplitude, vitesse)](#picture_waveselector-amplitude-vitesse)
*    [picture_width(id, *v, *duration, *wait_flag, *ease)](#picture_widthid-v-duration-wait_flag-ease)
*    [picture_x(id, x, *duration, *wait_flag, *ease)](#picture_xid-x-duration-wait_flag-ease)
*    [picture_y(id, y, *duration, *wait_flag, *ease)](#picture_yid-y-duration-wait_flag-ease)
*    [picture_zoom(Selector, zoom_x, *zoom_y, *duration, *wait_flag, *ease)](#picture_zoomselector-zoom_x-zoom_y-duration-wait_flag-ease)
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


##### picture_blend(Selector, mode)

> Change le mode de fusion d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
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


##### picture_erase(Selector)

> Efface l'image

  
> Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  


##### picture_erased?(id)

> Renvoie true si l'image est supprimée (ou non affichée), false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  


##### picture_flip(Selector)

> Applique un effet miroir (axe vertical) sur l'image 

  
> Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  


##### picture_height(id, *v, *duration, *wait_flag, *ease)

> Change la hauteur d'une image référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`*v`|`Fixnum`|Valeur à changer, si aucune valeur n'est donnée, la commande renverra la hauteur de l'image  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  


##### picture_mouse_click?(id, *precise)

> Renvoie true si la souris survol et est cliquée l'image référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`*precise`|`Boolean`|si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false  


##### picture_mouse_hover?(id, *precise)

> Renvoie true si la souris survol l'image référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`*precise`|`Boolean`|si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false  


##### picture_mouse_press?(id, *key, *precise)

> Renvoie true si la souris survol et presse en continu la touche référencée sur l'image référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`*key`|`Symbol`|Touche de la souris (par défaut, :mouse_left)  
`*precise`|`Boolean`|si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false  


##### picture_mouse_release?(id, *key, *precise)

> Renvoie true si la souris survol et relâche la touche référencée sur l'image référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`*key`|`Symbol`|Touche de la souris (par défaut, :mouse_left)  
`*precise`|`Boolean`|si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false  


##### picture_mouse_repeat?(id, *key, *precise)

> Renvoie true si la souris survol et presse successivement la touche référencée sur l'image référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`*key`|`Symbol`|Touche de la souris (par défaut, :mouse_left)  
`*precise`|`Boolean`|si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false  


##### picture_mouse_trigger?(id, *key, *precise)

> Renvoie true si la souris survol et presse la touche référencée sur l'image référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`*key`|`Symbol`|Touche de la souris (par défaut, :mouse_left)  
`*precise`|`Boolean`|si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false  


##### picture_move(Selector, x, y, zoom_x, zoom_y, duration, *wait_flag, *opacity, *blend_type, *origin, *ease)

> Déplace une image

  
> Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
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


##### picture_opacity(Selector, opacity, *duration, *wait_flag, *ease)

> Change l'opacité d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
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


##### picture_pin(Selector, *x, *y)

> Fait défiler une image avec la carte (la fixe à une position)

  
> Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
`*x`|`Fixnum`|Coordonnées X de la carte en pixels, par défaut la coordonnée convertie de l'écran vers la carte  
`*y`|`Fixnum`|Coordonnées Y de la carte en pixels, par défaut la coordonnée convertie de l'écran vers la carte  


##### picture_position(Selector, x, y, *duration, *wait_flag, *ease)

> Change la position de l'image

  
> Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
`x`|`Fixnum`|Position en x de l'image  
`y`|`Fixnum`|Position en y de l'image  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
`*ease`|`Symbol`|Fonction à utiliser pour effectuer la transition. :linear par défaut.  


##### picture_rotate(Selector, speed)

> Fait tourner l'image

  
> Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
`speed`|`Fixnum`|Vitesse de rotation de l'image  


##### picture_scroll(Selector, vitesse)

> Change la vitesse de défilement (vertical et horizontal) d'une image fixée sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
`vitesse`|`Fixnum`|Vitesse de défilement  


##### picture_scroll_x(Selector, vitesse)

> Change la vitesse de défilement horizontal d'une image fixée sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
`vitesse`|`Fixnum`|Vitesse de défilement  


##### picture_scroll_y(Selector, vitesse)

> Change la vitesse de défilement vertical d'une image fixée sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
`vitesse`|`Fixnum`|Vitesse de défilement  


##### picture_shake(Selector, power, speed, duration)

> Fait trembler l'image pendant un temps donné

  
> Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
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


##### picture_unpin(Selector)

> Arrête de faire défiler une image avec la carte

  
> Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  


##### picture_wave(Selector, amplitude, vitesse)

> Fait onduler l'image

  
> Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
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


##### picture_zoom(Selector, zoom_x, *zoom_y, *duration, *wait_flag, *ease)

> Change la taille d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`Selector`|`Selector`|Sélécteur de l'image  
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


