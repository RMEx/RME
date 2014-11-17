#Commandes standards
[Retourner à l'index](__command_list.md)

Commandes standards

##Liste des commandes
*    [apply_percent(percent, max)](#apply_percentpercent-max)
*    [percent(value, max)](#percentvalue-max)
*    [random(min, max)](#randommin-max)
*    [random_figures(x)](#random_figuresx)
*    [tone(red, green, blue, *gray)](#tonered-green-blue-gray)
*    [wait(duration)](#waitduration)


##Description des commandes
##### apply_percent(percent, max)

> Applique percent à max

  
> Nom|Type|Description  
--- | --- | ---  
`percent`|`Fixnum`|Valeur à appliquer  
`max`|`Fixnum`|Valeur maximum  


##### percent(value, max)

> Renvoie le pourcentage de value par rapport à max

  
> Nom|Type|Description  
--- | --- | ---  
`value`|`Fixnum`|Valeur à transformer  
`max`|`Fixnum`|Valeur maximum  


##### random(min, max)

> Renvoie un nombre aléatoire compris entre MIN et MAX inclus

  
> Nom|Type|Description  
--- | --- | ---  
`min`|`Fixnum`|Borne minimale  
`max`|`Fixnum`|Borne maximale (à noter que si cet argument n'est pas spécifié, le résultat sera compris entre 0 et min inclus)  


##### random_figures(x)

> Renvoie un nombre à virgule aléatoire compris entre x et x+1

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Valeur de base (si cet argument n'est pas spécifié, le résultat sera compris entre 0 et 1)  


##### tone(red, green, blue, *gray)

> Renvoie une teinte

  
> Nom|Type|Description  
--- | --- | ---  
`red`|`Fixnum`|Valeur de rouge  
`green`|`Fixnum`|Valeur de vert  
`blue`|`Fixnum`|Valeur de bleu  
`*gray`|`Fixnum`|Valeur de gris, par défaut 0!  


##### wait(duration)

> Attend un nombre de frames donné

  
> Nom|Type|Description  
--- | --- | ---  
`duration`|`Fixnum`|Nombre de frames a attendre  


