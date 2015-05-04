#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Commandes de manipulation de fenêtre**  
- - -  
#Commandes de manipulation de fenêtre
Commandes pour créer/modifier des fenêtres

##Liste des commandes
*    [close_window(id)](#close_windowid)
*    [create_text_window(id, content, profile, x, y, *w, *h)](#create_text_windowid-content-profile-x-y-w-h)
*    [open_window(id)](#open_windowid)
*    [remove_all_windows](#remove_all_windows)
*    [remove_window(id)](#remove_windowid)
*    [window_closed?(id)](#window_closedid)
*    [window_content(id, content, *resize)](#window_contentid-content-resize)
*    [window_dimension(id, width, height, *duration, *wait_flag)](#window_dimensionid-width-height-duration-wait_flag)
*    [window_move(id, x, y, w, h, opacity, *duration, *wait_flag)](#window_moveid-x-y-w-h-opacity-duration-wait_flag)
*    [window_moveto(id, x, y, *duration, *wait_flag)](#window_movetoid-x-y-duration-wait_flag)
*    [window_opacity(id, *value, *duration, *wait_flag)](#window_opacityid-value-duration-wait_flag)
*    [window_opened?(id)](#window_openedid)
*    [window_tone(id, *tone, *duration, *wait_flag)](#window_toneid-tone-duration-wait_flag)


##Description des commandes
##### close_window(id)

> Ferme la fenêtre référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  


##### create_text_window(id, content, profile, x, y, *w, *h)

> Crée une fenêtre pouvant contenir du texte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Numéro de la fenêtre  
`content`|`String`|Texte (ou tableau séparé par des virgules) à afficher  
`profile`|`String`|Profile de la fenêtre (IWindowProfile)  
`x`|`Fixnum`|Position X de la fenêtre  
`y`|`Fixnum`|Position Y de la fenêtre  
`*w`|`Fixnum`|Largeur de la fenêtre, utilisez 'nil' pour que la largeur de la fenêtre soit calculée  
`*h`|`Fixnum`|Hauteur de la fenêtre, utilisez 'nil' pour que la hauteur de la fenêtre soit calculée  


##### open_window(id)

> Ouvre la commande référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  


##### remove_all_windows

> Supprime toutes les fenêtres

  
> 

##### remove_window(id)

> Supprime la fenêtre référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  


##### window_closed?(id)

> Renvoi true si la fenêtre référencée par son ID est fermée, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  


##### window_content(id, content, *resize)

> Change le contenu de la fenêtre référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  
`content`|`Object`|Valeur affichée de la fenêtre  
`*resize`|`Boolean`|Si cet argument vaut true, la taille de la fenêtre est recalculée  


##### window_dimension(id, width, height, *duration, *wait_flag)

> Change la dimension de la fenêtre

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  
`width`|`Fixnum`|Largeur de la fenêtre  
`height`|`Fixnum`|Hauteur de la fenêtre  
`*duration`|`Fixnum`|Durée du déplacement  
`*wait_flag`|`Boolean`|si cet argument vaut true, on attendra la fin du déplacement  


##### window_move(id, x, y, w, h, opacity, *duration, *wait_flag)

> Déplacement sur tous les paramètres

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`w`|`Fixnum`|Largeur  
`h`|`Fixnum`|Hauteur  
`opacity`|`Fixnum`|Opacité  
`*duration`|`Fixnum`|Durée du déplacement  
`*wait_flag`|`Boolean`|si cet argument vaut true, on attendra la fin du déplacement  


##### window_moveto(id, x, y, *duration, *wait_flag)

> Change les coordonées X et Y de la fenêtre

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  
`x`|`Fixnum`|Coordonnée X  
`y`|`Fixnum`|Coordonnée Y  
`*duration`|`Fixnum`|Durée du déplacement  
`*wait_flag`|`Boolean`|si cet argument vaut true, on attendra la fin du déplacement  


##### window_opacity(id, *value, *duration, *wait_flag)

> Change l'opacité de la fenêtre, si aucune valeur n'est spécifié, la commande renvoi la valeur de l'opacité

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  
`*value`|`Fixnum`|Valeur de l'opacité à changer  
`*duration`|`Fixnum`|Durée du déplacement  
`*wait_flag`|`Boolean`|si cet argument vaut true, on attendra la fin du déplacement  


##### window_opened?(id)

> Renvoi true si la fenêtre référencée par son ID est ouverte, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  


##### window_tone(id, *tone, *duration, *wait_flag)

> Modifie la teinte de la fenêtre. Si aucune teinte n'est passée en argument, la commande renvoi sa teinte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  
`*tone`|`Tone`|Nouvelle teinte  
`*duration`|`Fixnum`|Durée du déplacement  
`*wait_flag`|`Boolean`|si cet argument vaut true, on attendra la fin du déplacement  


