#Sprite
[Retourner à l'index](README.md)

Extension des sprites

##Liste des méthodes
*    [self.click?](#self.click?)
*    [self.hover?](#self.hover?)
*    [self.in?(`x`, `y`)](#self.in?)
*    [self.mouse_x](#self.mouse_x)
*    [self.mouse_y](#self.mouse_y)
*    [self.press?(`key`)](#self.press?)
*    [self.rect](#self.rect)
*    [self.release?(`key`)](#self.release?)
*    [self.repeat?(`key`)](#self.repeat?)
*    [self.trigger?(`key`)](#self.trigger?)


##Description des méthodes
**self.click?**

> Vérifie si le rectangle du sprite est cliqué

  
> 





**self.hover?**

> Vérifie si la souris passe au dessus du rectangle du sprite

  
> 





**self.in?(`x`, `y`)**

> Vérifie si le point passé en argument (via (x, y), ou via une instance de Point) est inscrite dans le rectangle du sprite

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X du point  
`y`|`Fixnum`|Coordonnées Y du point  






**self.mouse_x**

> Retourne la position x de la souris relative au rectangle du sprite

  
> 





**self.mouse_y**

> Retourne la position y de la souris relative au rectangle du sprite

  
> 





**self.press?(`key`)**

> Vérifie si le rectangle du sprite est enfoncé par la touche passée en argument

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche d'activation  






**self.rect**

> Retourne le rectangle relatif d'un sprite

  
> 





**self.release?(`key`)**

> Vérifie si le rectangle du sprite est relaché par la touche passée en argument

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche d'activation  






**self.repeat?(`key`)**

> Vérifie si le rectangle du sprite est clické de manière répétée par la touche passée en argument

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche d'activation  






**self.trigger?(`key`)**

> Vérifie si le rectangle du sprite est clické une fois par la touche passée en argument

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche d'activation  






