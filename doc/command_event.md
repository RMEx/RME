#Commandes évènements
[Retourner à l'index](__command_list.md)

Commandes relatives aux évènements

##Liste des commandes
**fresh_event_id**

> Renvoie un ID libre (utile en cas d'invocation d'évènement)

  
> 

**include_page(`map_id`, `event_id`, `page_id`)**

> Invoque une page (comme s'il s'agissait d'un évènement commun) d'un autre évènement

  
> Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à inclure  
`event_id`|`Fixnum`|ID de l'évènement où chercher la page à inclure  
`page_id`|`Fixnum`|ID de la page à inclure  


**invoke_event(`map_id`, `event_id`, `new_id`, `x`, `y`)**

> Invoque un évènement d'une autre map (ou de la même) sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à invoquer  
`event_id`|`Fixnum`|ID de l'évènement à invoquer  
`new_id`|`Fixnum`|Nouvel ID de l'évènement fraîchement invoqué  
`x`|`Fixnum`|Position X où placer l'évènement invoqué  
`y`|`Fixnum`|Position Y où placer l'évènement invoqué  


**max_event_id**

> Renvoie le plus grand ID d'évènement occupé sur la carte

  
> 

