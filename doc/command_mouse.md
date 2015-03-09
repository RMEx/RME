#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Commandes de la souris**  
- - -  
#Commandes de la souris
Commande relatives à la gestion de la souris

##Liste des commandes
*    [click_time(key)](#click_timekey)
*    [cursor_system(flag)](#cursor_systemflag)
*    [mouse_all?(method, keys)](#mouse_allmethod-keys)
*    [mouse_any?(method, keys)](#mouse_anymethod-keys)
*    [mouse_click?](#mouse_click)
*    [mouse_current_key(method)](#mouse_current_keymethod)
*    [mouse_dragging?](#mouse_dragging)
*    [mouse_in?(rectangle)](#mouse_inrectangle)
*    [mouse_last_rect](#mouse_last_rect)
*    [mouse_point](#mouse_point)
*    [mouse_press?(key)](#mouse_presskey)
*    [mouse_rect](#mouse_rect)
*    [mouse_release?(key)](#mouse_releasekey)
*    [mouse_repeat?(key)](#mouse_repeatkey)
*    [mouse_square_x](#mouse_square_x)
*    [mouse_square_y](#mouse_square_y)
*    [mouse_trigger?(key)](#mouse_triggerkey)
*    [mouse_x](#mouse_x)
*    [mouse_y](#mouse_y)


##Description des commandes
##### click_time(key)

> Renvoie le nombre de frame pressée d'une touche en cours

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche à vérifier  


##### cursor_system(flag)

> Affiche ou masque le curseur Windows sur la fenêtre de jeu

  
> Nom|Type|Description  
--- | --- | ---  
`flag`|`Boolean`|true pour visible, false pour invisible  


##### mouse_all?(method, keys)

> Renvoie true si toutes les touches passées à keys sont activées selon la méthode passées à method

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.  
`keys`|`Argslist`|Liste des touches qui doivent être activée selon la méthode  


##### mouse_any?(method, keys)

> Renvoie true si toutes au moins une touches passée à keys est activée selon la méthode passées à method

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.  
`keys`|`Argslist`|Liste des touches qui doivent être activée selon la méthode, si rien n'est passé, toutes les touches sont prises en compte  


##### mouse_click?

> Renvoie true lorsqu'on effectue un clic gauche

  
> 

##### mouse_current_key(method)

> Renvoie la touche activée selon la méthode passée en argument, nil si aucune touche n'est activée

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthode d'activation (:press?, :release?, :trigger? etc.)  


##### mouse_dragging?

> Renvoie true si la souris est en train de sélectionner (cliquer/glisser) à l'écran

  
> 

##### mouse_in?(rectangle)

> Renvoie true si la souris se trouve dans le rectangle passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`rectangle`|`Rect`|Rectangle à vérifier  


##### mouse_last_rect

> Renvoie le dernier rectangle de sélection de la souris effectué

  
> 

##### mouse_point

> Renvoie un point (possédant les attributs x, y) référençant la position de la souris en pixels par rapport à l'écran

  
> 

##### mouse_press?(key)

> Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  


##### mouse_rect

> Renvoie le rectangle de sélection de la souris (tracé en cours)

  
> 

##### mouse_release?(key)

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être relâchée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  


##### mouse_repeat?(key)

> Renvoie true si la touche passée en argument (cf:attributs) est appuyée successivement, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  


##### mouse_square_x

> Renvoie la position (en cases) X de la souris

  
> 

##### mouse_square_y

> Renvoie la position (en cases) Y de la souris

  
> 

##### mouse_trigger?(key)

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être pressée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  


##### mouse_x

> Renvoie la position (en pixels) X de la souris

  
> 

##### mouse_y

> Renvoie la position (en pixels) Y de la souris

  
> 

