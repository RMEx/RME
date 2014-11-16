#Devices::Mouse
[Retourner à l'index](README.md)

Représentation de la souris, est accessible via Mouse

##Attributs
Nom|Description  
--- | ---  
`:mouse_left`|Pointe la touche Keys::Mouse_left (comme argument à passer)  
`:mouse_right`|Pointe la touche Keys::Mouse_right (comme argument à passer)  
`:mouse_center`|Pointe la touche Keys::Mouse_center (comme argument à passer)  
`:mouse_x1`|Pointe la touche Keys::Mouse_x1 (comme argument à passer)  
`:mouse_x2`|Pointe la touche Keys::Mouse_x2 (comme argument à passer)  
##Liste des méthodes
*    [Mouse.all?(method, keys)](#Mouse.all?(method, keys))
*    [Mouse.any?(method, keys)](#Mouse.any?(method, keys))
*    [Mouse.click?(key)](#Mouse.click?(key))
*    [Mouse.current_key(method)](#Mouse.current_key(method))
*    [Mouse.dragging?](#Mouse.dragging?)
*    [Mouse.in?(rectangle)](#Mouse.in?(rectangle))
*    [Mouse.last_rect](#Mouse.last_rect)
*    [Mouse.point](#Mouse.point)
*    [Mouse.press?(key)](#Mouse.press?(key))
*    [Mouse.rect](#Mouse.rect)
*    [Mouse.release?(key)](#Mouse.release?(key))
*    [Mouse.repeat?(key)](#Mouse.repeat?(key))
*    [Mouse.square_x](#Mouse.square_x)
*    [Mouse.square_y](#Mouse.square_y)
*    [Mouse.time(key)](#Mouse.time(key))
*    [Mouse.trigger?(key)](#Mouse.trigger?(key))
*    [Mouse.x](#Mouse.x)
*    [Mouse.y](#Mouse.y)


##Description des méthodes
##### Mouse.all?(method, keys)

> Renvoie true si toutes les touches passées à keys sont activées selon la méthode passées à method

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.  
`keys`|`Argslist`|Liste des touches qui doivent être activée selon la méthode  




Exemple  
```ruby  
p 'souris gauche et souris droit sont pressées' if Mouse.all?(:press?, :mouse_left, :mouse_right)  
```



##### Mouse.any?(method, keys)

> Renvoie true si toutes au moins une touches passée à keys est activée selon la méthode passées à method

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.  
`keys`|`Argslist`|Liste des touches qui doivent être activée selon la méthode, si rien n'est passé, toutes les touches sont prises en compte  






##### Mouse.click?(key)

> Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon. (Alias de Mouse.press?)

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






##### Mouse.current_key(method)

> Renvoie la touche activée selon la méthode passée en argument, nil si aucune touche n'est activée

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthode d'activation (:press?, :release?, :trigger? etc.)  






##### Mouse.dragging?

> Renvoie true si la souris est en train de sélectionner (cliquer/glisser) à l'écran

  
> 





##### Mouse.in?(rectangle)

> Renvoie true si la souris se trouve dans le rectangle passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`rectangle`|`Rect`|Rectangle à vérifier  






##### Mouse.last_rect

> Renvoie le dernier rectangle de sélection de la souris effectué

  
> 





##### Mouse.point

> Renvoie un point (possédant les attributs x, y) référençant la position de la souris en pixels par rapport à l'écran

  
> 





##### Mouse.press?(key)

> Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






##### Mouse.rect

> Renvoie le rectangle de sélection de la souris (tracé en cours)

  
> 





##### Mouse.release?(key)

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être relâchée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






##### Mouse.repeat?(key)

> Renvoie true si la touche passée en argument (cf:attributs) est appuyée successivement, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






##### Mouse.square_x

> Renvoie la position (en cases) X de la souris

  
> 





##### Mouse.square_y

> Renvoie la position (en cases) Y de la souris

  
> 





##### Mouse.time(key)

> Renvoie le nombre de frame pressée d'une touche en cours

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche à vérifier  






##### Mouse.trigger?(key)

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être pressée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






##### Mouse.x

> Renvoie la position (en pixels) X de la souris

  
> 





##### Mouse.y

> Renvoie la position (en pixels) Y de la souris

  
> 





