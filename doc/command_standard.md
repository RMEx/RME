#Commandes standards
[Retourner à l'index](__command_list.md)

Commandes standards

##Liste des commandes
*    [apply_percent(percent, max)](#apply_percentpercent-max)
*    [get(array, index)](#getarray-index)
*    [length(array)](#lengtharray)
*    [max(a, b)](#maxa-b)
*    [min(a, b)](#mina-b)
*    [percent(value, max)](#percentvalue-max)
*    [random(min, max)](#randommin-max)
*    [random_figures(x)](#random_figuresx)
*    [session_username](#session_username)
*    [tone(red, green, blue, *gray)](#tonered-green-blue-gray)
*    [wait(duration)](#waitduration)


##Description des commandes
##### apply_percent(percent, max)

> Applique percent à max

  
> Nom|Type|Description  
--- | --- | ---  
`percent`|`Fixnum`|Valeur à appliquer  
`max`|`Fixnum`|Valeur maximum  


##### get(array, index)

> Renvoie la cellule à la valeur donné d'un tableau

  
> Nom|Type|Description  
--- | --- | ---  
`array`|`Array`|Tableau dont il faut renvoyer la taille  
`index`|`Fixnum`|Index à trouver  


##### length(array)

> Renvoie la taille d'un tableau

  
> Nom|Type|Description  
--- | --- | ---  
`array`|`Array`|Tableau dont il faut renvoyer la taille  


##### max(a, b)

> Renvoie la plus grande des deux valeurs A, B

  
> Nom|Type|Description  
--- | --- | ---  
`a`|`Object`|Valeur de A  
`b`|`Object`|Valeur de B  


##### min(a, b)

> Renvoie la plus petite des deux valeurs A, B

  
> Nom|Type|Description  
--- | --- | ---  
`a`|`Object`|Valeur de A  
`b`|`Object`|Valeur de B  


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


##### session_username

> Renvoie le nom d'utilisateur de la session Windows

  
> 

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


