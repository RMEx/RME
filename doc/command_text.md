#Commandes d'affichage de textes
[Retourner à l'index](__command_list.md)

Commandes pour afficher du texte à l'écran

##Liste des commandes
*    [text_change(id, text)](#text_changeid-text)
*    [text_erase(id)](#text_eraseid)
*    [text_move(id, duration, wait_flag, x, y, zoom_x, zoom_y, opacity, blend_type, origin)](#text_moveid-duration-wait_flag-x-y-zoom_x-zoom_y-opacity-blend_type-origin)
*    [text_profile(id, profile)](#text_profileid-profile)
*    [text_rotate(id, speed)](#text_rotateid-speed)
*    [text_show(id, text, profile, x, y, *zoom_x, *zoom_y, *opacity, *blend_type, *origin)](#text_showid-text-profile-x-y-zoom_x-zoom_y-opacity-blend_type-origin)


##Description des commandes
##### text_change(id, text)

> Change le texte affiché à l'écran

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
`text`|`String`|Nouveau texte  


##### text_erase(id)

> Supprime le texte affiché à l'écran

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  


##### text_move(id, duration, wait_flag, x, y, zoom_x, zoom_y, opacity, blend_type, origin)

> Déplace un texte affiché à l'écran

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
`duration`|`Fixnum`|Durée du déplacement en frames  
`wait_flag`|`Boolean`|Attendre la fin du déplacement, par défaut, true  
`x`|`Fixnum`|Position en x où le texte doit se rendre  
`y`|`Fixnum`|Position en y ou le texte doit se rendre  
`zoom_x`|`Fixnum`|Zoom de la largeur (en %)  
`zoom_y`|`Fixnum`|Zoom de la hauteur (en %)  
`opacity`|`Fixnum`|Opacitée (de 0 à 255) que l'image devra avoir, si aucun argument n'est donné, l'image conserva son opacité actuelle  
`blend_type`|`Fixnum`|Mode de fusion (0, 1, 2) que l'image devra avoir, si aucun argument n'est donné, l'image conserva son mode de fusion actuel  
`origin`|`Fixnum`|Origine que l'image devra avoir, si aucun argument n'est donné, l'image conserva son origine actuelle  


##### text_profile(id, profile)

> Change le profil du texte

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
`profile`|`String`|Nouveau profil  


##### text_rotate(id, speed)

> Fait tourner le texte (mettez une vitesse négative pour changer le sens de rotation)

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
`speed`|`Fixnum`|Vitesse de rotation  


##### text_show(id, text, profile, x, y, *zoom_x, *zoom_y, *opacity, *blend_type, *origin)

> Affiche un texte à l'écran

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
`text`|`String`|Texte a afficher  
`profile`|`String`|Profil du texte (voir Base de données)  
`x`|`Fixnum`|Position X  
`y`|`Fixnum`|Position Y  
`*zoom_x`|`Fixnum`|Zoom sur la largeur du texte par défaut 100 (pour 100%)  
`*zoom_y`|`Fixnum`|Zoom sur la hauteur du text par défaut 100 (pour 100%)  
`*opacity`|`Fixnum`|Opacité de l'image, par défaut 255 (de 0 à 255)  
`*blend_type`|`Fixnum`|Mode de fusion, par défaut 0, 0=Normal, 1=Addition, 2=Soustraction  
`*origin`|`Fixnum`|Origine du texte, 0 = Haut gauche, 1 = centré par défaut, zéro  


