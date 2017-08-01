# RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste%20des%20commandes.md) > **Standards**  
- - -  
# Standards
Commandes standards

## Liste des commandes
*    [apply_percent(percent, max)](#apply_percentpercent-max)
*    [call_common_event(id)](#call_common_eventid)
*    [color(red, green, blue, *alpha)](#colorred-green-blue-alpha)
*    [fadein(*time)](#fadeintime)
*    [fadeout(*time)](#fadeouttime)
*    [flash_rect(x, y, width, height, color)](#flash_rectx-y-width-height-color)
*    [flash_square(x, y, color)](#flash_squarex-y-color)
*    [get(array, index)](#getarray-index)
*    [length(array)](#lengtharray)
*    [max(a, b)](#maxa-b)
*    [message(value, *face_name, *face_index, *position, *background)](#messagevalue-face_name-face_index-position-background)
*    [message_height(n)](#message_heightn)
*    [min(a, b)](#mina-b)
*    [percent(value, max)](#percentvalue-max)
*    [pick_random(*elts)](#pick_randomelts)
*    [qte(key, time, *strict)](#qtekey-time-strict)
*    [random(min, max)](#randommin-max)
*    [random_combination(len, *keys)](#random_combinationlen-keys)
*    [random_figures(x)](#random_figuresx)
*    [rm_kill](#rm_kill)
*    [session_username](#session_username)
*    [split_each_char(str)](#split_each_charstr)
*    [text_angle(id, *value)](#text_angleid-value)
*    [tone(red, green, blue, *gray)](#tonered-green-blue-gray)
*    [unflash_rect(x, y, width, height)](#unflash_rectx-y-width-height)
*    [unflash_square(x, y)](#unflash_squarex-y)
*    [wait(duration)](#waitduration)
*    [wait_release(key)](#wait_releasekey)
*    [wait_trigger(key)](#wait_triggerkey)
*    [wait_with(time, &block)](#wait_withtime-&block)
*    [website(url)](#websiteurl)


## Description des commandes
##### apply_percent(percent, max)

> Applique percent à max

  
Nom|Type|Description  
--- | --- | ---  
`percent`|`Fixnum`|Valeur à appliquer  
`max`|`Fixnum`|Valeur maximum  
##### call_common_event(id)

> Exécute l'événement commun référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'événement commun à exécuter  
##### color(red, green, blue, *alpha)

> Renvoie une couleur

  
Nom|Type|Description  
--- | --- | ---  
`red`|`Fixnum`|Valeur de rouge  
`green`|`Fixnum`|Valeur de vert  
`blue`|`Fixnum`|Valeur de bleu  
`*alpha`|`Fixnum`|Opacité, par défaut 255!  
##### fadein(*time)

> Affiche l'écran en fondu

  
Nom|Type|Description  
--- | --- | ---  
`*time`|`Fixnum`|Durée de la transition  
##### fadeout(*time)

> Fondu noir (et sonore) du jeu pendant la durée passée en argument

  
Nom|Type|Description  
--- | --- | ---  
`*time`|`Fixnum`|Durée de fondu  
##### flash_rect(x, y, width, height, color)

> Fait clignoter un rectangle de cases

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`width`|`Fixnum`|Largeur du rectangle  
`height`|`Fixnum`|Largeur du rectangle  
`color`|`Color`|Couleur du flash (utilisez la commande color)  
##### flash_square(x, y, color)

> Fait clignoter une case selon une couleur

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`color`|`Color`|Couleur du flash (utilisez la commande color)  
##### get(array, index)

> Renvoie la cellule à la valeur donnée d'un tableau

  
Nom|Type|Description  
--- | --- | ---  
`array`|`Array`|Tableau  
`index`|`Fixnum`|Index à trouver  
##### length(array)

> Renvoie la taille d'un tableau

  
Nom|Type|Description  
--- | --- | ---  
`array`|`Array`|Tableau dont il faut renvoyer la taille  
##### max(a, b)

> Renvoie la plus grande des deux valeurs A, B

  
Nom|Type|Description  
--- | --- | ---  
`a`|`Object`|Valeur de A  
`b`|`Object`|Valeur de B  
##### message(value, *face_name, *face_index, *position, *background)

> Affiche un message à l'écran

  
Nom|Type|Description  
--- | --- | ---  
`value`|`String`|Message à afficer  
`*face_name`|`String`|Nom du faceset (peut être remplacé par nil pour ne pas en afficher), il faut utiliser \n pour afficher plusieurs lignes  
`*face_index`|`Fixnum`|Index du faceset (ne sert à rien si aucun faceset n'est donnée)  
`*position`|`Fixnum`|Position de la fenêtre de message (0 = en haut, 1 au centre, 2 en bas), par défaut vaut 2  
`*background`|`Fixnum`|Fond du message, 0 normal, 1 sombre, 2 transparent  
##### message_height(n)

> Change le nombre de lignes affichées dans les messages (Commande Event Afficher message)

  
Nom|Type|Description  
--- | --- | ---  
`n`|`Fixnum`|Nombre de lignes visibles  
##### min(a, b)

> Renvoie la plus petite des deux valeurs A, B

  
Nom|Type|Description  
--- | --- | ---  
`a`|`Object`|Valeur de A  
`b`|`Object`|Valeur de B  
##### percent(value, max)

> Renvoie le pourcentage de value par rapport à max

  
Nom|Type|Description  
--- | --- | ---  
`value`|`Fixnum`|Valeur à transformer  
`max`|`Fixnum`|Valeur maximum  
##### pick_random(*elts)

> Renvoie un élément au hasard du tableau (ou de la liste d'arguments)

  
Nom|Type|Description  
--- | --- | ---  
`*elts`|`ArgsList`|éléments dans lesquels piocher un élément aléatoire. Soit pick_random(a, b, c, d...etc.) soit pick_random([a,b,c,d...etc])  
##### qte(key, time, *strict)

> Attend la saisie d'une touche pendant une durée donnée. La commande renvoie true si la touche a été saisie, false sinon.

  
Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche qu'il faut presser avant la fin  
`time`|`Fixnum`|Durée  
`*strict`|`Boolean`|Difficulté, si elle vaut true, aucune erreur admise, sinon erreurs admises. Par défaut vaut true  
##### random(min, max)

> Renvoie un nombre aléatoire compris entre MIN et MAX inclus

  
Nom|Type|Description  
--- | --- | ---  
`min`|`Fixnum`|Borne minimale  
`max`|`Fixnum`|Borne maximale (à noter que si cet argument n'est pas spécifié, le résultat sera compris entre 0 et min inclus)  
##### random_combination(len, *keys)

> Renvoie une combinaison (tableau itérable) aléatoire de la taille spécifiée en argument, composée des paramètres des touches passées en arguments. (par exemple : random_combination(5, :UP, :DOWN, :LEFT, :RIGHT) )

  
Nom|Type|Description  
--- | --- | ---  
`len`|`Fixnum`|Args description  
`*keys`|`Argslist`|Liste des touches pouvant constituer la combinaison  
##### random_figures(x)

> Renvoie un nombre à virgule aléatoire compris entre x et x+1

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Valeur de base (si cet argument n'est pas spécifié, le résultat sera compris entre 0 et 1)  
##### rm_kill

> Quitte le jeu... d'un coup sec... TCHAK

  
##### session_username

> Renvoie le nom d'utilisateur de la session Windows

  
##### split_each_char(str)

> Transforme une chaîne de caractères en un tableau de caractères

  
Nom|Type|Description  
--- | --- | ---  
`str`|`String`|Chaine a transformer  
##### text_angle(id, *value)

> Change l'angle d'un texte, si aucun angle n'est donné, la commande renverra la valeur de l'angle du texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id du texte  
`*value`|`Fixnum`|Nouvel angle (peut être vide)  
##### tone(red, green, blue, *gray)

> Renvoie une teinte

  
Nom|Type|Description  
--- | --- | ---  
`red`|`Fixnum`|Valeur de rouge, entre -255 et 255  
`green`|`Fixnum`|Valeur de vert, entre -255 et 255  
`blue`|`Fixnum`|Valeur de bleu, entre -255 et 255  
`*gray`|`Fixnum`|Valeur de gris, entre 0 et 255, par défaut 0 !  
##### unflash_rect(x, y, width, height)

> Arrête de faire clignoter les cases référencées par le rectangle

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`width`|`Fixnum`|Largeur du rectangle  
`height`|`Fixnum`|Largeur du rectangle  
##### unflash_square(x, y)

> Arrête le clignotement

  
Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
##### wait(duration)

> Attend un nombre de frames donné

  
Nom|Type|Description  
--- | --- | ---  
`duration`|`Fixnum`|Nombre de frames à attendre  
##### wait_release(key)

> Attend le relâchement d'une touche

  
Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche à attendre  
##### wait_trigger(key)

> Attend l'appui d'une touche

  
Nom|Type|Description  
--- | --- | ---  
`key`|`Symbol`|Touche à attendre  
##### wait_with(time, &block)

> Attend en exécutant une action

  
Nom|Type|Description  
--- | --- | ---  
`time`|`Fixnum`|Temps d'attente  
`&block`|`Block`|Action à exécuter ({action})  
##### website(url)

> Ouvre la page web passée en argument

  
Nom|Type|Description  
--- | --- | ---  
`url`|`String`|Url à charger  
