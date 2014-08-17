#Informations cartes
[Retourner à l'index](__command_list.md)

Commandes relatives aux informations des cartes

##Liste des commandes
**id_at(`x`, `y`)**

> Renvoie l'ID de l'évènement pointé par les coordonnées X,Y (0 si c'est le héros, -1 s'il n'y en a pas)

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  


**map_id**

> Renvoie l'ID de la map en cours

  
> 

**map_name**

> Renvoie le nom de la map en cours

  
> 

**region_id(`x`, `y`)**

> Renvoie l'ID de la région pointée par les coordonnées X,Y

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  


**square_passable?(`x`, `y`, `direction`)**

> Renvoie true si la case référencée par X, Y est passable dans la direction référencée par direction, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  
`direction`|`Fixnum`|Direction (2,4,6,8)  


**terrain_tag(`x`, `y`)**

> Renvoie le tag du terrain de la case pointée par les coordonnées X,Y

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  


**tile_id(`x`, `y`)**

> Renvoie l'ID de la tile pointée par les coordonnées X,Y

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  


