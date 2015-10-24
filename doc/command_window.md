#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Fenêtres**  
- - -  
#Fenêtres
Commandes pour créer/modifier des fenêtres. Attention, lorsque vous utilisez du texte, utilisez de préférence les apostrophes comme séparateur. Cette collection de commande est documentée dans le Wiki!

##Liste des commandes
*    [close_window(id)](#close_windowid)
*    [create_commands_window(id, x, y, w, hash, *h)](#create_commands_windowid-x-y-w-hash-h)
*    [create_horizontal_commands_window(id, x, y, hash, row)](#create_horizontal_commands_windowid-x-y-hash-row)
*    [create_selectable_window(id, x, y, width, height, hash)](#create_selectable_windowid-x-y-width-height-hash)
*    [create_text_window(id, content, x, y, *w, *h)](#create_text_windowid-content-x-y-w-h)
*    [open_window(id)](#open_windowid)
*    [remove_all_windows](#remove_all_windows)
*    [remove_window(id)](#remove_windowid)
*    [window_activate(id)](#window_activateid)
*    [window_closed?(id)](#window_closedid)
*    [window_content(id, content, *resize)](#window_contentid-content-resize)
*    [window_current_symbol(id)](#window_current_symbolid)
*    [window_deactivate(id)](#window_deactivateid)
*    [window_dimension(id, width, height, *duration, *wait_flag)](#window_dimensionid-width-height-duration-wait_flag)
*    [window_height(id)](#window_heightid)
*    [window_move(id, x, y, w, h, opacity, *duration, *wait_flag)](#window_moveid-x-y-w-h-opacity-duration-wait_flag)
*    [window_moveto(id, x, y, *duration, *wait_flag)](#window_movetoid-x-y-duration-wait_flag)
*    [window_opacity(id, *value, *duration, *wait_flag)](#window_opacityid-value-duration-wait_flag)
*    [window_opened?(id)](#window_openedid)
*    [window_width(id)](#window_widthid)
*    [window_x(id)](#window_xid)
*    [window_y(id)](#window_yid)


##Description des commandes
##### close_window(id)

> Ferme la fenêtre référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  


##### create_commands_window(id, x, y, w, hash, *h)

> Crée une fenêtre de sélection verticale

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  
`x`|`Fixnum`|Coordonnées X de la fenêtre  
`y`|`Fixnum`|Coordonnées Y de la fenêtre  
`w`|`Fixnum`|Largeur de la fenêtre  
`hash`|`Hash`|Hash décrivant les différentes sections de la fenêtre  
`*h`|`Fixnum`|Hauteur de la fenêtre (en nombre de ligne), si aucun argument n'est donné, la hauteur sera calculée  


##### create_horizontal_commands_window(id, x, y, hash, row)

> Crée une fenêtre de sélection horizontale

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  
`x`|`Fixnum`|Coordonnées X de la fenêtre  
`y`|`Fixnum`|Coordonnées Y de la fenêtre  
`hash`|`Hash`|Hash décrivant les différentes sections de la fenêtre  
`row`|`Fixnum`|Nombre de colonnes. Si aucun argument n'est spécifié, la fenêtre prendra le nombre correct de colonnes  


##### create_selectable_window(id, x, y, width, height, hash)

> Crée une fenêtre de sélection complexe

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  
`x`|`Fixnum`|Coordonnée X  
`y`|`Fixnum`|Coordonnée Y  
`width`|`Fixnum`|Largeur de la fenêtre  
`height`|`Fixnum`|Hauteur de la fenêtre  
`hash`|`Hash`|Description des callbacks de la fenêtre (CF Wiki)  


##### create_text_window(id, content, x, y, *w, *h)

> Crée une fenêtre pouvant contenir du texte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Numéro de la fenêtre  
`content`|`String`|Texte (ou tableau séparé par des virgules) à afficher  
`x`|`Fixnum`|Position X de la fenêtre  
`y`|`Fixnum`|Position Y de la fenêtre  
`*w`|`Fixnum`|Largeur de la fenêtre, utilisez 'nil' pour que la largeur de la fenêtre soit calculée  
`*h`|`Fixnum`|Hauteur de la fenêtre, utilisez 'nil' pour que la hauteur de la fenêtre soit calculée  


##### open_window(id)

> Ouvre la fenêtre référencée par son ID

  
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


##### window_activate(id)

> Rend la fenêtre référencée par son ID active

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  


##### window_closed?(id)

> Renvoie true si la fenêtre référencée par son ID est fermée, false sinon

  
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


##### window_current_symbol(id)

> Renvoie, pour une fenêtre de sélection, le symbole sélectionné

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  


##### window_deactivate(id)

> Rend la fenêtre référencée par son ID inactive

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  


##### window_dimension(id, width, height, *duration, *wait_flag)

> Change la dimension de la fenêtre

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  
`width`|`Fixnum`|Largeur de la fenêtre  
`height`|`Fixnum`|Hauteur de la fenêtre  
`*duration`|`Fixnum`|Durée du déplacement  
`*wait_flag`|`Boolean`|si cet argument vaut true, on attendra la fin du déplacement  


##### window_height(id)

> Renvoie la hauteur de la fenêtre référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  


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

> Change les coordonnées X et Y de la fenêtre

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  
`x`|`Fixnum`|Coordonnée X  
`y`|`Fixnum`|Coordonnée Y  
`*duration`|`Fixnum`|Durée du déplacement  
`*wait_flag`|`Boolean`|si cet argument vaut true, on attendra la fin du déplacement  


##### window_opacity(id, *value, *duration, *wait_flag)

> Change l'opacité de la fenêtre, si aucune valeur n'est spécifiée, la commande renvoie la valeur de l'opacité

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  
`*value`|`Fixnum`|Valeur de l'opacité à changer, entre 0 et 255.  
`*duration`|`Fixnum`|Durée du déplacement  
`*wait_flag`|`Boolean`|si cet argument vaut true, on attendra la fin du déplacement  


##### window_opened?(id)

> Renvoie true si la fenêtre référencée par son ID est ouverte, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  


##### window_width(id)

> Renvoie la largeur de la fenêtre référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  


##### window_x(id)

> Renvoie la coordonnée X de la fenêtre référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  


##### window_y(id)

> Renvoie la coordonnée Y de la fenêtre référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de la fenêtre  


