#Commandes de manipulation des panoramas
[Retourner à l'index](__command_list.md)

Commandes relatives à la manipulation des panoramas

##Liste des commandes
*    [parallax_auto_x(`id`, `speed`)](#parallax_auto_x)
*    [parallax_auto_y(`id`, `speed`)](#parallax_auto_y)
*    [parallax_blend(`id`, `blend_type`)](#parallax_blend)
*    [parallax_erase(`id`)](#parallax_erase)
*    [parallax_scroll_x(`id`, `speed`)](#parallax_scroll_x)
*    [parallax_scroll_y(`id`, `speed`)](#parallax_scroll_y)
*    [parallax_show(`id`, `name`, `*z`, `*opacity`, `*auto_x`, `*auto_y`, `*scroll_x`, `*scroll_y`, `*blend_type`, `*zoom_x`, `*zoom_y`, `*tone`)](#parallax_show)
*    [parallax_zoom(`id`, `zoom`)](#parallax_zoom)
*    [parallax_zoom_x(`id`, `zoom`)](#parallax_zoom_x)
*    [parallax_zoom_y(`id`, `zoom`)](#parallax_zoom_y)
*    [parallaxes_clear](#parallaxes_clear)


##Description des commandes
**parallax_auto_x(`id`, `speed`)[parallax_auto_x]**

> Défilement horizontal automatique d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`speed`|`Fixnum`|Vitesse de défilement  


**parallax_auto_y(`id`, `speed`)[parallax_auto_y]**

> Défilement vertical automatique d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`speed`|`Fixnum`|Vitesse de défilement  


**parallax_blend(`id`, `blend_type`)[parallax_blend]**

> Change le mode de fusion d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`blend_type`|`Fixnum`|mode de fusion (0 => normal, 1 => Addition, 2 => Soustraction)  


**parallax_erase(`id`)[parallax_erase]**

> Supprime un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  


**parallax_scroll_x(`id`, `speed`)[parallax_scroll_x]**

> Défilement horizontal d'un panorama par rapport au défilement de la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`speed`|`Fixnum`|Vitesse de défilement  


**parallax_scroll_y(`id`, `speed`)[parallax_scroll_y]**

> Défilement vertical d'un panorama par rapport au défilement de la carte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`speed`|`Fixnum`|Vitesse de défilement  


**parallax_show(`id`, `name`, `*z`, `*opacity`, `*auto_x`, `*auto_y`, `*scroll_x`, `*scroll_y`, `*blend_type`, `*zoom_x`, `*zoom_y`, `*tone`)[parallax_show]**

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


**parallax_zoom(`id`, `zoom`)[parallax_zoom]**

> Zoom sur les deux axes d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`zoom`|`Fixnum`|taille en pourcentage  


**parallax_zoom_x(`id`, `zoom`)[parallax_zoom_x]**

> Zoom horizontal d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`zoom`|`Fixnum`|taille en pourcentage  


**parallax_zoom_y(`id`, `zoom`)[parallax_zoom_y]**

> Zoom vertical d'un panorama

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du panorama  
`zoom`|`Fixnum`|taille en pourcentage  


**parallaxes_clear[parallaxes_clear]**

> Supprime tous les panoramas

  
> 

