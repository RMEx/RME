#Informations cartes
[Retourner à l'index](README.md)

Commandes relatives aux informations des cartes

##Méthodes
**Command.id_at(`x`, `y`)**

> Renvoie l'ID de l'évènement pointé par les coordonnées X,Y (0 si c'est le héros, -1 s'il n'y en a pas)  
  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  
  
**Command.map_id**

> Renvoie l'ID de la map en cours  
  
>   
**Command.map_name**

> Renvoie le nom de la map en cours  
  
>   
**Command.region_id(`x`, `y`)**

> Renvoie l'ID de la région pointée par les coordonnées X,Y  
  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  
  
**Command.square_passable?(`x`, `y`, `direction`)**

> Renvoie true si la case référencée par X, Y est passable dans la direction référencée par direction, false sinon  
  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  
`direction`|`Fixnum`|Direction (2,4,6,8)  
  
**Command.terrain_tag(`x`, `y`)**

> Renvoie le tag du terrain de la case pointée par les coordonnées X,Y  
  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  
  
**Command.tile_id(`x`, `y`)**

> Renvoie l'ID de la tile pointée par les coordonnées X,Y  
  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  
  
