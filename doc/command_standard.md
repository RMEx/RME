#Standards
[Retourner à l'index](__command_list.md)

Commandes standards

##Liste des commandes
**apply_percent(`percent`, `max`)**

> Applique percent à max  
  
> Nom|Type|Description  
--- | --- | ---  
`percent`|`Fixnum`|Valeur à appliquer  
`max`|`Fixnum`|Valeur maximum  
  
**include_page(`map_id`, `event_id`, `page_id`)**

> Invoque une page (comme s'il s'agissait d'un évènement commun) d'un autre évènement  
  
> Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à inclure  
`event_id`|`Fixnum`|ID de l'évènement où chercher la page à inclure  
`page_id`|`Fixnum`|ID de la page à inclure  
  
**percent(`value`, `max`)**

> Renvoie le pourcentage de value par rapport à max  
  
> Nom|Type|Description  
--- | --- | ---  
`value`|`Fixnum`|Valeur à transformer  
`max`|`Fixnum`|Valeur maximum  
  
**random(`min`, `max`)**

> Renvoie un nombre aléatoire compris entre MIN et MAX  
  
> Nom|Type|Description  
--- | --- | ---  
`min`|`Fixnum`|Borne minimale  
`max`|`Fixnum`|Borne maximale (à noter que si cet argument n'est pas spécifié, le résultat sera compris entre 0 et min)  
  
