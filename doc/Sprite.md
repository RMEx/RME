#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Classes et modules](Classes et modules.md) > **Sprite**  
- - -  
#Sprite
Extension des sprites

##Liste des méthodes
*    [self.click?](#selfclick)
*    [self.hover?](#selfhover)
*    [self.in?(x, y)](#selfinx-y)
*    [self.mouse_x](#selfmouse_x)
*    [self.mouse_y](#selfmouse_y)
*    [self.precise_in?(x, y)](#selfprecise_inx-y)
*    [self.press?(key)](#selfpresskey)
*    [self.rect](#selfrect)
*    [self.release?(key)](#selfreleasekey)
*    [self.repeat?(key)](#selfrepeatkey)
*    [self.trigger?(key)](#selftriggerkey)


##Description des méthodes
##### self.click?

> Vérifie si la souris clique sur le rectangle du sprite

  
> 





##### self.hover?

> Vérifie si la souris passe au dessus du rectangle du sprite

  
> 





##### self.in?(x, y)

> Vérifie si le point passé en argument (via (x, y), ou via une instance de Point) est inscrit dans le rectangle du sprite

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X du point  
`y`|`Fixnum`|Coordonnées Y du point  






##### self.mouse_x

> Retourne la position x de la souris relative au rectangle du sprite

  
> 





##### self.mouse_y

> Retourne la position y de la souris relative au rectangle du sprite

  
> 





##### self.precise_in?(x, y)

> Vérifie si le point passé en argument (via (x, y), ou via une instance de Point) est inscrit dans le bitmap du sprite, en tenant compte de la transparence

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X du point  
`y`|`Fixnum`|Coordonnées Y du point  






##### self.press?(key)

> Vérifie si l'utilisateur a enfoncé la touche de la souris passée en argument au-dessus du rectangle du sprite

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche d'activation  






##### self.rect

> Retourne le rectangle relatif d'un sprite

  
> 





##### self.release?(key)

> Vérifie si l'utilisateur a relâché la touche de la souris passée en argument au-dessus du rectangle du sprite

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche d'activation  






##### self.repeat?(key)

> Vérifie si l'utilisateur a cliqué de manière répétée la touche de la souris passée en argument au-dessus du rectangle du sprite

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche d'activation  






##### self.trigger?(key)

> Vérifie si l'utilisateur a cliqué une fois avec la touche de la souris passée en argument au-dessus du rectangle du sprite

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche d'activation  






