#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](__command_list.md) > **Commandes standards**  
- - -  
#Commandes standards
Commandes standards

##Liste des commandes
*    [apply_percent(percent, max)](#apply_percentpercent-max)
*    [color(red, green, blue, *alpha)](#colorred-green-blue-alpha)
*    [fadeout(*time)](#fadeouttime)
*    [get(array, index)](#getarray-index)
*    [length(array)](#lengtharray)
*    [max(a, b)](#maxa-b)
*    [min(a, b)](#mina-b)
*    [percent(value, max)](#percentvalue-max)
*    [qte(key, time)](#qtekey-time)
*    [random(min, max)](#randommin-max)
*    [random_figures(x)](#random_figuresx)
*    [rm_kill](#rm_kill)
*    [session_username](#session_username)
*    [tone(red, green, blue, *gray)](#tonered-green-blue-gray)
*    [wait(duration)](#waitduration)
*    [wait_release(key)](#wait_releasekey)
*    [wait_trigger(key)](#wait_triggerkey)
*    [wait_with(time, &block)](#wait_withtime-&block)


##Description des commandes
##### apply_percent(percent, max)

> Applique percent à max

  
> Nom|Type|Description  
--- | --- | ---  
`percent`|`Fixnum`|Valeur à appliquer  
`max`|`Fixnum`|Valeur maximum  


##### color(red, green, blue, *alpha)

> Renvoie une couleur

  
> Nom|Type|Description  
--- | --- | ---  
`red`|`Fixnum`|Valeur de rouge  
`green`|`Fixnum`|Valeur de vert  
`blue`|`Fixnum`|Valeur de bleu  
`*alpha`|`Fixnum`|Opacité, par défaut 255!  


##### fadeout(*time)

> Fondu noir (et sonore) du jeu pendant la durée passée en argument

  
> Nom|Type|Description  
--- | --- | ---  
`*time`|`Fixnum`|Durée de fondu  


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


##### qte(key, time)

> Attend la saisie d'une touche pendant une durée donnée. La commande renvoie true si la touche a été saisie, false sinon.

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche qu'il faut presser avant la fin  
`time`|`Fixnum`|Durée  


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


##### rm_kill

> Quitte le jeu... d'un coup sec... TCHAK

  
> 

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


##### wait_release(key)

> Attend le relâchement d'une touche

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche à attendre  


##### wait_trigger(key)

> Attend l'appui d'une touche

  
> Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche à attendre  


##### wait_with(time, &block)

> Attend en exécutant une action

  
> Nom|Type|Description  
--- | --- | ---  
`time`|`Fixnum`|Temps d'attente  
`&block`|`Block`|Action a exécuter ({action})  


