#Commandes du clavier
[Retourner à l'index](__command_list.md)

Commandes relatives au clavier

##Liste des commandes
*    [alt_gr?](#alt_gr?)
*    [caps_lock?](#caps_lock?)
*    [ctrl?(`key`)](#ctrl?)
*    [key_current(`method`)](#key_current)
*    [key_current_rgss(`method`)](#key_current_rgss)
*    [key_press?(`key`)](#key_press?)
*    [key_release?(`key`)](#key_release?)
*    [key_repeat?(`key`)](#key_repeat?)
*    [key_time(`key`)](#key_time)
*    [key_trigger?(`key`)](#key_trigger?)
*    [keyboard_current_char](#keyboard_current_char)
*    [keyboard_current_digit](#keyboard_current_digit)
*    [num_lock?](#num_lock?)
*    [scroll_lock?](#scroll_lock?)
*    [shift?](#shift?)
##Description des commandes
[**alt_gr?**](#alt_gr?)

> Renvoie true si la touche ALT_GR (ou la combinaison CTRL+ALT) est appuyée au moment de l'appel, false sinon

  
> 

[**caps_lock?**](#caps_lock?)

> Renvoie true si le clavier est en mode CAPS_LOCK au moment de l'appel, false sinon

  
> 

[**ctrl?(`key`)**](#ctrl?)

> Renvoie true si la touche CTRL (ou une combinaison CTRL+key) est appuyée au moment de l'appel, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant la touche (cf:attributs) mise en combinaison  


[**key_current(`method`)**](#key_current)

> Renvoie la touche activée selon la méthode passée en argument, nil si aucune touche n'est activée

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthode d'activation (:press?, :release?, :trigger? etc.)  


[**key_current_rgss(`method`)**](#key_current_rgss)

> Renvoie la touche du RGSS (:X, :A, :B, :C etc.) activée selon la méthode passée en argument, nil si aucune touche n'est activée

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthode d'activation (:press?, :release?, :trigger? etc.)  


[**key_press?(`key`)**](#key_press?)

> Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  


[**key_release?(`key`)**](#key_release?)

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être relâchée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  


[**key_repeat?(`key`)**](#key_repeat?)

> Renvoie true si la touche passée en argument (cf:attributs) est appuyée successivement, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  


[**key_time(`key`)**](#key_time)

> Renvoie le nombre de frame pressée d'une touche en cours

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche à vérifier  


[**key_trigger?(`key`)**](#key_trigger?)

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être pressée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  


[**keyboard_current_char**](#keyboard_current_char)

> Renvoie le caractère actuel pressé par le clavier

  
> 

[**keyboard_current_digit**](#keyboard_current_digit)

> Renvoie le chiffre actuel pressé par le clavier

  
> 

[**num_lock?**](#num_lock?)

> Renvoie true si le clavier est en mode NUM_LOCK au moment de l'appel, false sinon

  
> 

[**scroll_lock?**](#scroll_lock?)

> Renvoie true si le clavier est en mode SCROLL_LOCK au moment de l'appel, false sinon

  
> 

[**shift?**](#shift?)

> Renvoie true si la touche Maj du clavier est activée au moment de l'appel, false sinon

  
> 

