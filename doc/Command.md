#Command
[Retourner à l'index](README.md)

Collection des commandes EventExtender

##Liste des méthodes
**Command.apply_percent(`percent`, `max`)**

> Applique percent à max  
  
> Nom|Type|Description  
--- | --- | ---  
`percent`|`Fixnum`|Valeur à appliquer  
`max`|`Fixnum`|Valeur maximum  
  


Exemple  
```ruby  
Command.apply_percent(50, 80) # Renvoie 40 (parce que 50% de 80 = 40)  
```



**Command.fresh_event_id**

> Renvoie un ID libre (utile en cas d'invocation d'évènement)  
  
>   




**Command.id_at(`x`, `y`)**

> Renvoie l'ID de l'évènement pointé par les coordonnées X,Y (0 si c'est le héros, -1 s'il n'y en a pas)  
  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X de la case  
`y`|`Fixnum`|Coordonnées Y de la case  
  




**Command.include_page(`map_id`, `event_id`, `page_id`)**

> Invoque une page (comme s'il s'agissait d'un évènement commun) d'un autre évènement  
  
> Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à inclure  
`event_id`|`Fixnum`|ID de l'évènement où chercher la page à inclure  
`page_id`|`Fixnum`|ID de la page à inclure  
  




**Command.invoke_event(`map_id`, `event_id`, `new_id`, `x`, `y`)**

> Invoque un évènement d'une autre map (ou de la même) sur la carte  
  
> Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à invoquer  
`event_id`|`Fixnum`|ID de l'évènement à invoquer  
`new_id`|`Fixnum`|Nouvel ID de l'évènement fraîchement invoqué  
`x`|`Fixnum`|Position X où placer l'évènement invoqué  
`y`|`Fixnum`|Position Y où placer l'évènement invoqué  
  




**Command.map_id**

> Renvoie l'ID de la map en cours  
  
>   




**Command.map_name**

> Renvoie le nom de la map en cours  
  
>   




**Command.max_event_id**

> Renvoie le plus grand ID d'évènement occupé sur la carte  
  
>   




**Command.percent(`value`, `max`)**

> Renvoie le pourcentage de value par rapport à max  
  
> Nom|Type|Description  
--- | --- | ---  
`value`|`Fixnum`|Valeur à transformer  
`max`|`Fixnum`|Valeur maximum  
  


Exemple  
```ruby  
Command.percent(40, 80) # Renvoie 50 (parce que 40 = 50% de 80)  
```



**Command.random(`min`, `max`)**

> Renvoie un nombre aléatoire compris entre MIN et MAX  
  
> Nom|Type|Description  
--- | --- | ---  
`min`|`Fixnum`|Borne minimale  
`max`|`Fixnum`|Borne maximale (à noter que si cet argument n'est pas spécifié, le résultat sera compris entre 0 et min)  
  




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
  




