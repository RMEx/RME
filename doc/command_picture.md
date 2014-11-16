#Commandes de manipulation des images
[Retourner à l'index](__command_list.md)

Commandes relatives à la manipulation des images

##Liste des commandes
*    [picture_angle(`id`, `angle`)](#picture_angle)
*    [picture_blend(`id`, `mode`)](#picture_blend)
*    [picture_erase(`id`)](#picture_erase)
*    [picture_flip(`id`)](#picture_flip)
*    [picture_move(`id`, `x`, `y`, `zoom_x`, `zoom_y`, `duration`, `*wait_flag`, `*opacity`, `*blend_type`, `*origin`)](#picture_move)
*    [picture_opacity(`id`, `opacity`)](#picture_opacity)
*    [picture_origin(`id`, `origin`)](#picture_origin)
*    [picture_pin(`id`)](#picture_pin)
*    [picture_rotate(`id`, `speed`)](#picture_rotate)
*    [picture_scroll(`id`, `vitesse`)](#picture_scroll)
*    [picture_scroll_x(`id`, `vitesse`)](#picture_scroll_x)
*    [picture_scroll_y(`id`, `vitesse`)](#picture_scroll_y)
*    [picture_show(`id`, `name`, `*x`, `*y`, `*origin`, `*zoom_x`, `*zoom_y`, `*opacity`, `*blend_type`)](#picture_show)
*    [picture_tone(`id`, `R`, `V`, `B`, `*G`)](#picture_tone)
*    [picture_unpin(`id`)](#picture_unpin)
*    [picture_wave(`id`, `amplitude`, `vitesse`)](#picture_wave)
*    [picture_x(`id`, `x`)](#picture_x)
*    [picture_y(`id`, `x`)](#picture_y)
*    [picture_zoom(`id`, `zoom_x`, `zoom_y`)](#picture_zoom)
*    [picture_zoom_x(`id`, `zoom`)](#picture_zoom_x)
*    [picture_zoom_y(`id`, `zoom`)](#picture_zoom_y)
*    [pixel_in_picture?(`id`, `x`, `y`, `*precise`)](#pixel_in_picture?)
##Description des commandes
[**picture_angle(`id`, `angle`)**](#picture_angle)

> Change l'angle de l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`angle`|`Fixnum`|Angle d'orientation de l'image. Si aucun angle n'est donné, la commande renverra l'angle de l'image  


[**picture_blend(`id`, `mode`)**](#picture_blend)

> Change le mode de fusion d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`mode`|`Fixnum`|Mode choisi (0, 1 ou 2)  


[**picture_erase(`id`)**](#picture_erase)

> Efface l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  


[**picture_flip(`id`)**](#picture_flip)

> Applique un effet miroir sur l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  


[**picture_move(`id`, `x`, `y`, `zoom_x`, `zoom_y`, `duration`, `*wait_flag`, `*opacity`, `*blend_type`, `*origin`)**](#picture_move)

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


[**picture_opacity(`id`, `opacity`)**](#picture_opacity)

> Change l'opacité d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`opacity`|`Fixnum`|valeur de l'opacité (de 0 à 255)  


[**picture_origin(`id`, `origin`)**](#picture_origin)

> Change l'origine d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`origin`|`Fixnum`|Origine de l'image, 0 = Haut gauche, 1 = centré, [x,y] = orienté autours de X,Y, par défaut, zéro  


[**picture_pin(`id`)**](#picture_pin)

> Fait défiler une image avec la carte (la fixe à une position)

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  


[**picture_rotate(`id`, `speed`)**](#picture_rotate)

> Fait tourner l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`speed`|`Fixnum`|Vitesse de rotation de l'image  


[**picture_scroll(`id`, `vitesse`)**](#picture_scroll)

> Change la vitesse de défilement (vertical et horizontal) d'une image fixée sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`vitesse`|`Fixnum`|Vitesse de défilement  


[**picture_scroll_x(`id`, `vitesse`)**](#picture_scroll_x)

> Change la vitesse de défilement horizontal d'une image fixée sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`vitesse`|`Fixnum`|Vitesse de défilement  


[**picture_scroll_y(`id`, `vitesse`)**](#picture_scroll_y)

> Change la vitesse de défilement vertical d'une image fixée sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`vitesse`|`Fixnum`|Vitesse de défilement  


[**picture_show(`id`, `name`, `*x`, `*y`, `*origin`, `*zoom_x`, `*zoom_y`, `*opacity`, `*blend_type`)**](#picture_show)

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


[**picture_tone(`id`, `R`, `V`, `B`, `*G`)**](#picture_tone)

> Change la teinte d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`R`|`Fixnum`|Valeur de rouge (de -255 a +255)  
`V`|`Fixnum`|Valeur de verte (de -255 a +255)  
`B`|`Fixnum`|Valeur de bleu (de -255 a +255)  
`*G`|`Fixnum`|Valeur de Gris (de 0 a +255), par défaut, cette valeur vaut 0  


[**picture_unpin(`id`)**](#picture_unpin)

> Arrête de faire défiler une image avec la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  


[**picture_wave(`id`, `amplitude`, `vitesse`)**](#picture_wave)

> Fait onduler l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`amplitude`|`Fixnum`|Amplitude (taille de l'ondulation)  
`vitesse`|`Fixnum`|Vitesse de l'ondulation  


[**picture_x(`id`, `x`)**](#picture_x)

> Change l'axe X d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`x`|`Fixnum`|Position en x de l'image, si aucun argument n'est passé, la commande renverra la position X de l'image  


[**picture_y(`id`, `x`)**](#picture_y)

> Change l'axe Y d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`x`|`Fixnum`|Position en y de l'image, si aucun argument n'est passé, la commande renverra la position Y de l'image  


[**picture_zoom(`id`, `zoom_x`, `zoom_y`)**](#picture_zoom)

> Change la taille d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`zoom_x`|`Fixnum`|Pourcentage d'agrandissement de la largeur de l'image  
`zoom_y`|`Fixnum`|Pourcentage d'agrandissement de la hauteur de l'image. Si cet argument est ommis, la largeur sera égal à la hauteur.  


[**picture_zoom_x(`id`, `zoom`)**](#picture_zoom_x)

> Change la largeur d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`zoom`|`Fixnum`|Pourcentage d'agrandissement de la largeur de l'image. Si aucun angle n'est donné, la commande renverra le zoom_x de l'image.  


[**picture_zoom_y(`id`, `zoom`)**](#picture_zoom_y)

> Change la hauteur d'une image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`zoom`|`Fixnum`|Pourcentage d'agrandissement de la hauteur de l'image. Si aucun angle n'est donné, la commande renverra le zoom_y de l'image.  


[**pixel_in_picture?(`id`, `x`, `y`, `*precise`)**](#pixel_in_picture?)

> Vérifie que le x, y sont inscrit dans l'image

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'image  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`*precise`|`Boolean`|Par défaut, precise vaut false, si precise vaut true, seuls les pixels non transparent seront prit en compte  


