#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Classes et modules](Classes et modules.md) > **Rect**  
- - -  
#Rect
Extension des rectangles

##Liste des méthodes
*    [self.click?](#selfclick)
*    [self.hover?](#selfhover)
*    [self.in?(x, y)](#selfinx-y)
*    [self.mouse_x](#selfmouse_x)
*    [self.mouse_y](#selfmouse_y)
*    [self.press?(key)](#selfpresskey)
*    [self.release?(key)](#selfreleasekey)
*    [self.repeat?(key)](#selfrepeatkey)
*    [self.trigger?(key)](#selftriggerkey)


##Description des méthodes
##### self.click?

> Vérifie si le rectangle est cliqué

  
> 





##### self.hover?

> Vérifie si la souris passe au dessus du rectangle

  
> 





##### self.in?(x, y)

> Vérifie si le point passé en argument (via (x, y), ou via une instance de Point) est inscrit dans le rectangle

  
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






