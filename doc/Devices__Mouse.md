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
**Mouse.click?(`key`)**

> Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon. (Alias de Mouse.press?)

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






**Mouse.dragging?**

> Renvoie true si la souris est en train de sélectionner (cliquer/glisser) à l'écran

  
> 





**Mouse.in?(`rectangle`)**

> Renvoie true si la souris se trouve dans le rectangle passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`rectangle`|`Rect`|Rectangle à vérifier  






**Mouse.last_rect**

> Renvoie le dernier rectangle de sélection de la souris effectué

  
> 





**Mouse.point**

> Renvoie un point (possédant les attributs x, y) référençant la position de la souris en carrés (cases) par rapport à l'écran

  
> 





**Mouse.press?(`key`)**

> Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






**Mouse.rect**

> Renvoie le rectangle de sélection de la souris (tracé en cours)

  
> 





**Mouse.release?(`key`)**

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être relâchée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






**Mouse.repeat?(`key`)**

> Renvoie true si la touche passée en argument (cf:attributs) est appuyée successivement, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






**Mouse.square_x**

> Renvoie la position (en cases) X de la souris

  
> 





**Mouse.square_y**

> Renvoie la position (en cases) Y de la souris

  
> 





**Mouse.trigger?(`key`)**

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être pressée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






**Mouse.x**

> Renvoie la position (en pixels) X de la souris

  
> 





**Mouse.y**

> Renvoie la position (en pixels) Y de la souris

  
> 





