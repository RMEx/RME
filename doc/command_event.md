#Commandes évènements
[Retourner à l'index](__command_list.md)

Commandes relatives aux évènements

##Liste des commandes
*    [fresh_event_id](#fresh_event_id)
*    [include_page(`map_id`, `event_id`, `page_id`, `*runnable`, `*context`)](#include_page)
*    [invoke_event(`map_id`, `event_id`, `new_id`, `*x`, `*y`)](#invoke_event)
*    [max_event_id](#max_event_id)
*    [page_runnable?(`map_id`, `event_id`, `page_id`, `*context`)](#page_runnable?)

l
l##Description des commandes
**fresh_event_id**(#fresh_event_id)

> Renvoie un ID libre (utile en cas d'invocation d'évènement)

  
> 

**include_page(`map_id`, `event_id`, `page_id`, `*runnable`, `*context`)**(#include_page)

> Invoque une page (comme s'il s'agissait d'un évènement commun) d'un autre évènement

  
> Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à inclure  
`event_id`|`Fixnum`|ID de l'évènement où chercher la page à inclure  
`page_id`|`Fixnum`|ID de la page à inclure  
`*runnable`|`Boolean`|Par défaut, cette variable a pour valeur `false`. Si elle vaut `true`, la page ne sera incluse que si la condition de lancement de la page est respectée. Par défaut, elle utilise le contexte (les interrupteurs locaux) de l'évènement appelant.  
`*context`|`Boolean`|Par défaut, cette variable a pour valeur `false`. Si `runnable` et `context` valent `true`, la condition de lancement de la page utilisera le contexte (les interrupteurs locaux) de l'évènement d'origine à la place de celui de l'évènement appelant.  


**invoke_event(`map_id`, `event_id`, `new_id`, `*x`, `*y`)**(#invoke_event)

> Invoque un évènement d'une autre map (ou de la même) sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à invoquer  
`event_id`|`Fixnum`|ID de l'évènement à invoquer  
`new_id`|`Fixnum`|Nouvel ID de l'évènement fraîchement invoqué  
`*x`|`Fixnum`|Position X où placer l'évènement invoqué, par défaut, conserve la valeur de l'évènement invoqué  
`*y`|`Fixnum`|Position Y où placer l'évènement invoqué, par défaut conserve la valeur de l'évènement invoqué  


**max_event_id**(#max_event_id)

> Renvoie le plus grand ID d'évènement occupé sur la carte

  
> 

**page_runnable?(`map_id`, `event_id`, `page_id`, `*context`)**(#page_runnable?)

> Vérifie si la page est exécutable dans le contexte de l'évènement appelant.

  
> Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à tester  
`event_id`|`Fixnum`|ID de l'évènement où chercher la page à tester  
`page_id`|`Fixnum`|ID de la page à tester  
`*context`|`Boolean`|Par défaut, cette variable a pour valeur `false`. Si elle vaut `true`, la condition de lancement de la page utilisera le contexte (les interrupteurs locaux) de l'évènement d'origine à la place de celui de l'évènement appelant.  


