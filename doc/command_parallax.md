#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Commandes de manipulation des panoramas**  
- - -  
#Commandes de manipulation des panoramas
Commandes relatives à la manipulation des panoramas

##Liste des commandes
*    [parallax_autoscroll(id, speed_x, *duration, *wait_flag)](#parallax_autoscrollid-speed_x-duration-wait_flag)
*    [parallax_autoscroll_x(id, speed, *duration, *wait_flag)](#parallax_autoscroll_xid-speed-duration-wait_flag)
*    [parallax_autoscroll_y(id, speed, *duration, *wait_flag)](#parallax_autoscroll_yid-speed-duration-wait_flag)
*    [parallax_blend(id, blend_type)](#parallax_blendid-blend_type)
*    [parallax_erase(id)](#parallax_eraseid)
*    [parallax_opacity(id, opacity, *duration, *wait_flag)](#parallax_opacityid-opacity-duration-wait_flag)
*    [parallax_scroll(id, x, y)](#parallax_scrollid-x-y)
*    [parallax_scroll_x(id, speed)](#parallax_scroll_xid-speed)
*    [parallax_scroll_y(id, speed)](#parallax_scroll_yid-speed)
*    [parallax_show(id, name, *z, *opacity, *auto_x, *auto_y, *scroll_x, *scroll_y, *blend_type, *zoom_x, *zoom_y, *tone)](#parallax_showid-name-z-opacity-auto_x-auto_y-scroll_x-scroll_y-blend_type-zoom_x-zoom_y-tone)
*    [parallax_tone(id, tone, *duration, *wait_flag)](#parallax_toneid-tone-duration-wait_flag)
*    [parallax_transform(id, duration, *wait_flag, *zoom_x, *zoom_y, *opacity, *tone)](#parallax_transformid-duration-wait_flag-zoom_x-zoom_y-opacity-tone)
*    [parallax_z(id, z)](#parallax_zid-z)
*    [parallax_zoom(id, zoom, *duration, *wait_flag)](#parallax_zoomid-zoom-duration-wait_flag)
*    [parallax_zoom_x(id, zoom, *duration, *wait_flag)](#parallax_zoom_xid-zoom-duration-wait_flag)
*    [parallax_zoom_y(id, zoom, *duration, *wait_flag)](#parallax_zoom_yid-zoom-duration-wait_flag)
*    [parallaxes_clear](#parallaxes_clear)


##Description des commandes
##### parallax_autoscroll(id, speed_x, *duration, *wait_flag)

> Défilement horizontal et vertical automatique d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`speed_x`|`Fixnum`|Vitesse de défilement vertical  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  


##### parallax_autoscroll_x(id, speed, *duration, *wait_flag)

> Défilement horizontal automatique d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`speed`|`Fixnum`|Vitesse de défilement  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  


##### parallax_autoscroll_y(id, speed, *duration, *wait_flag)

> Défilement vertical automatique d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`speed`|`Fixnum`|Vitesse de défilement  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  


##### parallax_blend(id, blend_type)

> Change le mode de fusion d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`blend_type`|`Fixnum`|mode de fusion (0 => normal, 1 => Addition, 2 => Soustraction)  


##### parallax_erase(id)

> Supprime un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  


##### parallax_opacity(id, opacity, *duration, *wait_flag)

> Change l'opacité d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`opacity`|`Fixnum`|valeur de l'opacité (0 à 255)  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  


##### parallax_scroll(id, x, y)

> Change la vitesse de défilement d' un panorama référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du panorama  
`x`|`Fixnum`|vitesse horizontale  
`y`|`Fixnum`|vitesse verticale  


##### parallax_scroll_x(id, speed)

> Défilement horizontal d'un panorama par rapport au défilement de la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`speed`|`Fixnum`|Vitesse de défilement  


##### parallax_scroll_y(id, speed)

> Défilement vertical d'un panorama par rapport au défilement de la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`speed`|`Fixnum`|Vitesse de défilement  


##### parallax_show(id, name, *z, *opacity, *auto_x, *auto_y, *scroll_x, *scroll_y, *blend_type, *zoom_x, *zoom_y, *tone)

> Affiche un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`name`|`String`|Nom du panorama  
`*z`|`Fixnum`|Axe Z (par défaut - 100)  
`*opacity`|`Fixnum`|Opacité (par défaut 255)  
`*auto_x`|`Fixnum`|Défilement automatique horizontal (par défaut 0, ne défile pas)  
`*auto_y`|`Fixnum`|Défilement automatique vertical (par défaut 0, ne défile pas)  
`*scroll_x`|`Fixnum`|Défilement horizontal (par défaut 2, à la même vitesse que la carte. 1 = vitesse du panorama de VXace)  
`*scroll_y`|`Fixnum`|Défilement vertical (par défaut 2, à la même vitesse que la carte. 1 = vitesse du panorama de VXace)  
`*blend_type`|`Fixnum`|Mode de fusion (par défaut 0), mode normal  
`*zoom_x`|`Fixnum`|Zoom horizontal (par défaut 100)  
`*zoom_y`|`Fixnum`|Zoom vertical (par défaut 100)  
`*tone`|`Tone`|Teinte, utilisez la commande tone (rubrique Standard), par défaut teinte normale  


##### parallax_tone(id, tone, *duration, *wait_flag)

> Change la teinte d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`tone`|`Tone`|teinte du panorama (utilisez la commande tone des commandes standars)  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  


##### parallax_transform(id, duration, *wait_flag, *zoom_x, *zoom_y, *opacity, *tone)

> Transforme un panorama durant une période

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`duration`|`Fixnum`|Durée en frame du déplacement  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut false  
`*zoom_x`|`Fixnum`|Zoom horizontal (par défaut 100)  
`*zoom_y`|`Fixnum`|Zoom vertical (par défaut 100)  
`*opacity`|`Fixnum`|Opacité (par défaut 255)  
`*tone`|`Tone`|Teinte, utilisez la commande tone (rubrique Standard), par défaut aucun changement de teinte  


##### parallax_z(id, z)

> Change l'axe Z du panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du panorama  
`z`|`Fixnum`|Axe Z  


##### parallax_zoom(id, zoom, *duration, *wait_flag)

> Zoom sur les deux axes d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`zoom`|`Fixnum`|taille en pourcentage  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  


##### parallax_zoom_x(id, zoom, *duration, *wait_flag)

> Zoom horizontal d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`zoom`|`Fixnum`|taille en pourcentage  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  


##### parallax_zoom_y(id, zoom, *duration, *wait_flag)

> Zoom vertical d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`zoom`|`Fixnum`|taille en pourcentage  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  


##### parallaxes_clear

> Supprime tous les panoramas

  
> 

