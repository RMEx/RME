#Rect
[Retourner à l'index](README.md)

Extension des rectangles

##Liste des méthodes
*    [self.click?](#self.click?)
*    [self.hover?](#self.hover?)
*    [self.in?(x, y)](#self.in?x-y)
*    [self.mouse_x](#self.mouse_x)
*    [self.mouse_y](#self.mouse_y)
*    [self.press?(key)](#self.press?key)
*    [self.release?(key)](#self.release?key)
*    [self.repeat?(key)](#self.repeat?key)
*    [self.trigger?(key)](#self.trigger?key)


##Description des méthodes
##### self.click?

> Vérifie si le rectangle est cliqué

  
> 





##### self.hover?

> Vérifie si la souris passe au dessus du rectangle

  
> 





##### self.in?(x, y)

> Vérifie si le point passé en argument (via (x, y), ou via une instance de Point) est inscrite dans le rectangle

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X du point  
`y`|`Fixnum`|Coordonnées Y du point  






##### self.mouse_x

> Retourne la position x de la souris relative au rectangle

  
> 





##### self.mouse_y

> Retourne la position y de la souris relative au rectangle

  
> 





##### self.press?(key)

> Vérifie si le rectangle est enfoncé par la touche passée en argument

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche d'activation  






##### self.release?(key)

> Vérifie si le rectangle est relaché par la touche passée en argument

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche d'activation  






##### self.repeat?(key)

> Vérifie si le rectangle est clické de manière répétée par la touche passée en argument

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche d'activation  






##### self.trigger?(key)

> Vérifie si le rectangle est clické une fois par la touche passée en argument

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche d'activation  






