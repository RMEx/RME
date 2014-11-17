#Commandes évènements
[Retourner à l'index](__command_list.md)

Commandes relatives aux évènements

##Liste des commandes
*    [fresh_event_id](#fresh_event_id)
*    [include_page(map_id, event_id, page_id, *runnable, *context)](#include_pagemap_id-event_id-page_id-runnable-context)
*    [invoke_event(map_id, event_id, new_id, *x, *y)](#invoke_eventmap_id-event_id-new_id-x-y)
*    [max_event_id](#max_event_id)
*    [mouse_click_event?(events)](#mouse_click_eventevents)
*    [mouse_hover_event?(events)](#mouse_hover_eventevents)
*    [mouse_press_event?(events, *key)](#mouse_press_eventevents-key)
*    [mouse_release_event?(events, *key)](#mouse_release_eventevents-key)
*    [mouse_repeat_event?(events, *key)](#mouse_repeat_eventevents-key)
*    [mouse_trigger_event?(events, *key)](#mouse_trigger_eventevents-key)
*    [page_runnable?(map_id, event_id, page_id, *context)](#page_runnablemap_id-event_id-page_id-context)


##Description des commandes
##### fresh_event_id

> Renvoie un ID libre (utile en cas d'invocation d'évènement)

  
> 

##### include_page(map_id, event_id, page_id, *runnable, *context)

> Invoque une page (comme s'il s'agissait d'un évènement commun) d'un autre évènement

  
> Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à inclure  
`event_id`|`Fixnum`|ID de l'évènement où chercher la page à inclure  
`page_id`|`Fixnum`|ID de la page à inclure  
`*runnable`|`Boolean`|Par défaut, cette variable a pour valeur `false`. Si elle vaut `true`, la page ne sera incluse que si la condition de lancement de la page est respectée. Par défaut, elle utilise le contexte (les interrupteurs locaux) de l'évènement appelant.  
`*context`|`Boolean`|Par défaut, cette variable a pour valeur `false`. Si `runnable` et `context` valent `true`, la condition de lancement de la page utilisera le contexte (les interrupteurs locaux) de l'évènement d'origine à la place de celui de l'évènement appelant.  


##### invoke_event(map_id, event_id, new_id, *x, *y)

> Invoque un évènement d'une autre map (ou de la même) sur la carte

  
> Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à invoquer  
`event_id`|`Fixnum`|ID de l'évènement à invoquer  
`new_id`|`Fixnum`|Nouvel ID de l'évènement fraîchement invoqué  
`*x`|`Fixnum`|Position X où placer l'évènement invoqué, par défaut, conserve la valeur de l'évènement invoqué  
`*y`|`Fixnum`|Position Y où placer l'évènement invoqué, par défaut conserve la valeur de l'évènement invoqué  


##### max_event_id

> Renvoie le plus grand ID d'évènement occupé sur la carte

  
> 

##### mouse_click_event?(events)

> Renvoie true si la souris clique un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  


##### mouse_hover_event?(events)

> Renvoie true si la souris survol un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  


##### mouse_press_event?(events, *key)

> Renvoie true si la souris presse un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Selector`|Touche à presser (par défaut, la touche est :mouse_left  


##### mouse_release_event?(events, *key)

> Renvoie true si la sourisest relâchée sur un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Selector`|Touche à presser (par défaut, la touche est :mouse_left  


##### mouse_repeat_event?(events, *key)

> Renvoie true si la souris clique de manière répétée un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Selector`|Touche à presser (par défaut, la touche est :mouse_left  


##### mouse_trigger_event?(events, *key)

> Renvoie true si la souris vient de cliquer un évènement du sélecteur passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`events`|`Selectors`|Selecteur d'évènements  
`*key`|`Selector`|Touche à presser (par défaut, la touche est :mouse_left  


##### page_runnable?(map_id, event_id, page_id, *context)

> Vérifie si la page est exécutable dans le contexte de l'évènement appelant.

  
> Nom|Type|Description  
--- | --- | ---  
`map_id`|`Fixnum`|ID de la map où chercher l'évènement à tester  
`event_id`|`Fixnum`|ID de l'évènement où chercher la page à tester  
`page_id`|`Fixnum`|ID de la page à tester  
`*context`|`Boolean`|Par défaut, cette variable a pour valeur `false`. Si elle vaut `true`, la condition de lancement de la page utilisera le contexte (les interrupteurs locaux) de l'évènement d'origine à la place de celui de l'évènement appelant.  


