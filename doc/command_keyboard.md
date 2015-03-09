#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Commandes du clavier**  
- - -  
#Commandes du clavier
Commandes relatives au clavier

##Liste des commandes
*    [alt_gr?](#alt_gr)
*    [caps_lock?](#caps_lock)
*    [ctrl?(key)](#ctrlkey)
*    [key_current(method)](#key_currentmethod)
*    [key_current_rgss(method)](#key_current_rgssmethod)
*    [key_press?(key)](#key_presskey)
*    [key_release?(key)](#key_releasekey)
*    [key_repeat?(key)](#key_repeatkey)
*    [key_time(key)](#key_timekey)
*    [key_trigger?(key)](#key_triggerkey)
*    [keyboard_all?(method, keys)](#keyboard_allmethod-keys)
*    [keyboard_any?(method, keys)](#keyboard_anymethod-keys)
*    [keyboard_current_char](#keyboard_current_char)
*    [keyboard_current_digit](#keyboard_current_digit)
*    [num_lock?](#num_lock)
*    [scroll_lock?](#scroll_lock)
*    [shift?](#shift)


##Description des commandes
##### alt_gr?

> Renvoie true si la touche ALT_GR (ou la combinaison CTRL+ALT) est appuyée au moment de l'appel, false sinon

  
> 

##### caps_lock?

> Renvoie true si le clavier est en mode CAPS_LOCK au moment de l'appel, false sinon

  
> 

##### ctrl?(key)

> Renvoie true si la touche CTRL (ou une combinaison CTRL+key) est appuyée au moment de l'appel, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant la touche (cf:attributs) mise en combinaison  


##### key_current(method)

> Renvoie la touche activée selon la méthode passée en argument, nil si aucune touche n'est activée

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthode d'activation (:press?, :release?, :trigger? etc.)  


##### key_current_rgss(method)

> Renvoie la touche du RGSS (:X, :A, :B, :C etc.) activée selon la méthode passée en argument, nil si aucune touche n'est activée

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthode d'activation (:press?, :release?, :trigger? etc.)  


##### key_press?(key)

> Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  


##### key_release?(key)

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être relâchée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  


##### key_repeat?(key)

> Renvoie true si la touche passée en argument (cf:attributs) est appuyée successivement, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  


##### key_time(key)

> Renvoie le nombre de frame pressée d'une touche en cours

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche à vérifier  


##### key_trigger?(key)

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être pressée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  


##### keyboard_all?(method, keys)

> Renvoie true si toutes les touches passées à keys sont activées selon la méthode passées à method

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.  
`keys`|`Argslist`|Liste des touches qui doivent être activée selon la méthode  


##### keyboard_any?(method, keys)

> Renvoie true si toutes au moins une touches passée à keys est activée selon la méthode passées à method

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.  
`keys`|`Argslist`|Liste des touches qui doivent être activée selon la méthode, si rien n'est passé, toutes les touches sont prises en compte  


##### keyboard_current_char

> Renvoie le caractère actuel pressé par le clavier

  
> 

##### keyboard_current_digit

> Renvoie le chiffre actuel pressé par le clavier

  
> 

##### num_lock?

> Renvoie true si le clavier est en mode NUM_LOCK au moment de l'appel, false sinon

  
> 

##### scroll_lock?

> Renvoie true si le clavier est en mode SCROLL_LOCK au moment de l'appel, false sinon

  
> 

##### shift?

> Renvoie true si la touche Maj du clavier est activée au moment de l'appel, false sinon

  
> 

