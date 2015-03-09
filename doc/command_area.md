#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Commandes de gestion de zones virtuelles**  
- - -  
#Commandes de gestion de zones virtuelles
Commandes pour créer et manipuler des zones virtuelles

##Liste des commandes
*    [create_circle_area(x, y, rayon)](#create_circle_areax-y-rayon)
*    [create_ellipse_area(x, y, width, height)](#create_ellipse_areax-y-width-height)
*    [create_polygon_area(*points)](#create_polygon_areapoints)
*    [create_rect_area(x, y, width, height)](#create_rect_areax-y-width-height)
*    [in_area?(area, x, y)](#in_areaarea-x-y)
*    [mouse_click_area?(area)](#mouse_click_areaarea)
*    [mouse_click_square_area?(area, *key)](#mouse_click_square_areaarea-key)
*    [mouse_hover_area?(area)](#mouse_hover_areaarea)
*    [mouse_hover_square_area?(area)](#mouse_hover_square_areaarea)
*    [mouse_press_area?(area, *key)](#mouse_press_areaarea-key)
*    [mouse_press_square_area?(area, *key)](#mouse_press_square_areaarea-key)
*    [mouse_release_area?(area, *key)](#mouse_release_areaarea-key)
*    [mouse_release_square_area?(area, *key)](#mouse_release_square_areaarea-key)
*    [mouse_repeat_area?(area, *key)](#mouse_repeat_areaarea-key)
*    [mouse_repeat_square_area?(area, *key)](#mouse_repeat_square_areaarea-key)
*    [mouse_trigger_area?(area, *key)](#mouse_trigger_areaarea-key)
*    [mouse_trigger_square_area?(area, *key)](#mouse_trigger_square_areaarea-key)


##Description des commandes
##### create_circle_area(x, y, rayon)

> Crée et renvoi une zone circulaire

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la zone  
`y`|`Fixnum`|Coordonnées Y de la zone  
`rayon`|`Fixnum`|Rayon de la zone  


##### create_ellipse_area(x, y, width, height)

> Crée et renvoi une zone elliptique

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la zone  
`y`|`Fixnum`|Coordonnées Y de la zone  
`width`|`Fixnum`|Largeur de la zone  
`height`|`Fixnum`|Hauteur de la zone  


##### create_polygon_area(*points)

> Crée et renvoi une zone polygonale (le dernier point est relié avec le premier)

  
> Nom|Type|Description  
--- | --- | ---  
`*points`|`ArgType`|Liste de points (create_polygon_area([ax, ay], [bx, by], [cx, cy] etc...))  


##### create_rect_area(x, y, width, height)

> Crée et renvoi une zone rectangulaire

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la zone  
`y`|`Fixnum`|Coordonnées Y de la zone  
`width`|`Fixnum`|Largeur de la zone  
`height`|`Fixnum`|Hauteur de la zone  


##### in_area?(area, x, y)

> Vérifie si le point référencé par X, Y est inscrit dans la zone passée en argument

  
> Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  
`x`|`Fixnum`|Coordonnée X du point  
`y`|`ArgType`|Coordonnée Y du point  


##### mouse_click_area?(area)

> Renvoie true si la souris survol et clique sur la zone passée en argument au moment de l'appel, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  


##### mouse_click_square_area?(area, *key)

> Renvoie true si la souris survol et clique sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en case et non en pixel, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  
`*key`|`Symbol`|Touche à vérifier (par défaut, :mouse_left)  


##### mouse_hover_area?(area)

> Renvoie true si la souris survol la zone passée en argument au moment de l'appel, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  


##### mouse_hover_square_area?(area)

> Renvoie true si la souris survol la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en case et non en pixel, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  


##### mouse_press_area?(area, *key)

> Renvoie true si la souris survol et clique en continu sur la zone passée en argument au moment de l'appel, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  
`*key`|`Symbol`|Touche à vérifier (par défaut, :mouse_left)  


##### mouse_press_square_area?(area, *key)

> Renvoie true si la souris survol et clique en continu sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en case et non en pixel, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  
`*key`|`Symbol`|Touche à vérifier (par défaut, :mouse_left)  


##### mouse_release_area?(area, *key)

> Renvoie true si la souris survol et est relachée sur la zone passée en argument au moment de l'appel, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  
`*key`|`Symbol`|Touche à vérifier (par défaut, :mouse_left)  


##### mouse_release_square_area?(area, *key)

> Renvoie true si la souris survol et est relachée sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en case et non en pixel, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  
`*key`|`Symbol`|Touche à vérifier (par défaut, :mouse_left)  


##### mouse_repeat_area?(area, *key)

> Renvoie true si la souris survol et pressée en répétitivement sur la zone passée en argument au moment de l'appel, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  
`*key`|`Symbol`|Touche à vérifier (par défaut, :mouse_left)  


##### mouse_repeat_square_area?(area, *key)

> Renvoie true si la souris survol et est pressée en répétitivement sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en case et non en pixel, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  
`*key`|`Symbol`|Touche à vérifier (par défaut, :mouse_left)  


##### mouse_trigger_area?(area, *key)

> Renvoie true si la souris survol et clique une fois sur la zone passée en argument au moment de l'appel, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  
`*key`|`Symbol`|Touche à vérifier (par défaut, :mouse_left)  


##### mouse_trigger_square_area?(area, *key)

> Renvoie true si la souris survol et clique une fois sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en case et non en pixel, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`area`|`Area`|Zone à vérifier  
`*key`|`Symbol`|Touche à vérifier (par défaut, :mouse_left)  


