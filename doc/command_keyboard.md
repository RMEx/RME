#Commandes du clavier
[Retourner à l'index](__command_list.md)

Commandes relatives au clavier

##Liste des commandes
**alt_gr?**

> Renvoie true si la touche ALT_GR (ou la combinaison CTRL+ALT) est appuyée au moment de l'appel, false sinon

  
> 

**caps_lock?**

> Renvoie true si le clavier est en mode CAPS_LOCK au moment de l'appel, false sinon

  
> 

**ctrl?(`key`)**

> Renvoie true si la touche CTRL (ou une combinaison CTRL+key) est appuyée au moment de l'appel, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant la touche (cf:attributs) mise en combinaison  


**key_current(`method`)**

> Renvoie la touche activée selon la méthode passée en argument, nil si aucune touche n'est activée

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthode d'activation (:press?, :release?, :trigger? etc.)  


**key_current_rgss(`method`)**

> Renvoie la touche du RGSS (:X, :A, :B, :C etc.) activée selon la méthode passée en argument, nil si aucune touche n'est activée

  
> Nom|Type|Description  
--- | --- | ---  
`method`|`Symbol`|Méthode d'activation (:press?, :release?, :trigger? etc.)  


**key_press?(`key`)**

> Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  


**key_release?(`key`)**

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être relâchée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  


**key_repeat?(`key`)**

> Renvoie true si la touche passée en argument (cf:attributs) est appuyée successivement, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  


**key_time(`key`)**

> Renvoie le nombre de frame pressée d'une touche en cours

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche à vérifier  


**key_trigger?(`key`)**

> Renvoie true si la touche passée en argument (cf:attributs) vient d'être pressée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Symbole référençant une touche (cf:attributs)  


**keyboard_current_char**

> Renvoie le caractère actuel pressé par le clavier

  
> 

**keyboard_current_digit**

> Renvoie le chiffre actuel pressé par le clavier

  
> 

**maj?**

> Renvoie true si la touche Maj du clavier est activée au moment de l'appel, false sinon

  
> 

**num_lock?**

> Renvoie true si le clavier est en mode NUM_LOCK au moment de l'appel, false sinon

  
> 

**scroll_lock?**

> Renvoie true si le clavier est en mode SCROLL_LOCK au moment de l'appel, false sinon

  
> 

