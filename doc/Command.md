#Command
[Retourner à l'index](README.md)

Collection des commandes EventExtender

##Liste des méthodes
**Command.alt_gr?**

> Renvoie true si la touche ALT_GR (ou la combinaison CTRL+ALT) est appuyée au moment de l'appel, false sinon

  
> 





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



**Command.caps_lock?**

> Renvoie true si le clavier est en mode CAPS_LOCK au moment de l'appel, false sinon

  
> 





**Command.click_time(`key`)**

> Renvoie le nombre de frame pressée d'une touche en cours

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche à vérifier  






**Command.ctrl?(`key`)**

> Renvoie true si la touche CTRL (ou une combinaison CTRL+key) est appuyée au moment de l'appel, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant la touche (cf:attributs) mise en combinaison  






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






**Command.key_current(`method`)**

> Renvoie la touche activée selon la méthode passée en argument, nil si aucune touche n'est activée

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthode d'activation (:press?, :release?, :trigger? etc.)  






**Command.key_current_rgss(`method`)**

> Renvoie la touche du RGSS (:X, :A, :B, :C etc.) activée selon la méthode passée en argument, nil si aucune touche n'est activée

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthode d'activation (:press?, :release?, :trigger? etc.)  






**Command.key_press?(`key`)**

> Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






**Command.key_release?(`key`)**

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être relâchée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






**Command.key_repeat?(`key`)**

> Renvoie true si la touche passée en argument (cf:attributs) est appuyée successivement, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






**Command.key_time(`key`)**

> Renvoie le nombre de frame pressée d'une touche en cours

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche à vérifier  






**Command.key_trigger?(`key`)**

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être pressée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






**Command.keyboard_all?(`method`, `keys`)**

> Renvoie true si toutes les touches passées à keys sont activées selon la méthode passées à method

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.  
`keys`|`Argslist`|Liste des touches qui doivent être activée selon la méthode  






**Command.keyboard_any?(`method`, `keys`)**

> Renvoie true si toutes au moins une touches passée à keys est activée selon la méthode passées à method

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.  
`keys`|`Argslist`|Liste des touches qui doivent être activée selon la méthode, si rien n'est passé, toutes les touches sont prises en compte  






**Command.keyboard_current_char**

> Renvoie le caractère actuel pressé par le clavier

  
> 





**Command.keyboard_current_digit**

> Renvoie le chiffre actuel pressé par le clavier

  
> 





**Command.maj?**

> Renvoie true si la touche Maj du clavier est activée au moment de l'appel, false sinon

  
> 





**Command.map_id**

> Renvoie l'ID de la map en cours

  
> 





**Command.map_name**

> Renvoie le nom de la map en cours

  
> 





**Command.max_event_id**

> Renvoie le plus grand ID d'évènement occupé sur la carte

  
> 





**Command.mouse_all?(`method`, `keys`)**

> Renvoie true si toutes les touches passées à keys sont activées selon la méthode passées à method

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.  
`keys`|`Argslist`|Liste des touches qui doivent être activée selon la méthode  






**Command.mouse_any?(`method`, `keys`)**

> Renvoie true si toutes au moins une touches passée à keys est activée selon la méthode passées à method

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.  
`keys`|`Argslist`|Liste des touches qui doivent être activée selon la méthode, si rien n'est passé, toutes les touches sont prises en compte  






**Command.mouse_click?(`key`)**

> Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon. (Alias de Mouse.press?)

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






**Command.mouse_current_key(`method`)**

> Renvoie la touche activée selon la méthode passée en argument, nil si aucune touche n'est activée

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthode d'activation (:press?, :release?, :trigger? etc.)  






**Command.mouse_dragging?**

> Renvoie true si la souris est en train de sélectionner (cliquer/glisser) à l'écran

  
> 





**Command.mouse_in?(`rectangle`)**

> Renvoie true si la souris se trouve dans le rectangle passé en argument

  
> Nom|Type|Description  
--- | --- | ---  
`rectangle`|`Rect`|Rectangle à vérifier  






**Command.mouse_last_rect**

> Renvoie le dernier rectangle de sélection de la souris effectué

  
> 





**Command.mouse_point**

> Renvoie un point (possédant les attributs x, y) référençant la position de la souris en pixels par rapport à l'écran

  
> 





**Command.mouse_press?(`key`)**

> Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






**Command.mouse_rect**

> Renvoie le rectangle de sélection de la souris (tracé en cours)

  
> 





**Command.mouse_release?(`key`)**

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être relâchée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






**Command.mouse_repeat?(`key`)**

> Renvoie true si la touche passée en argument (cf:attributs) est appuyée successivement, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






**Command.mouse_square_x**

> Renvoie la position (en cases) X de la souris

  
> 





**Command.mouse_square_y**

> Renvoie la position (en cases) Y de la souris

  
> 





**Command.mouse_trigger?(`key`)**

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être pressée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  






**Command.mouse_x**

> Renvoie la position (en pixels) X de la souris

  
> 





**Command.mouse_y**

> Renvoie la position (en pixels) Y de la souris

  
> 





**Command.num_lock?**

> Renvoie true si le clavier est en mode NUM_LOCK au moment de l'appel, false sinon

  
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






**Command.scroll_lock?**

> Renvoie true si le clavier est en mode SCROLL_LOCK au moment de l'appel, false sinon

  
> 





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






