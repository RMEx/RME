#Commandes d'affichage de textes
[Retourner à l'index](__command_list.md)

Commandes pour afficher du texte à l'écran

##Liste des commandes
*    [text_show(id, text, profile, x, y, *zoom_x, *zoom_y, *opacity, *blend_type, *origin)](#text_showid-text-profile-x-y-zoom_x-zoom_y-opacity-blend_type-origin)


##Description des commandes
##### text_show(id, text, profile, x, y, *zoom_x, *zoom_y, *opacity, *blend_type, *origin)

> Affiche un texte à l'écran

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant de l'image  
`text`|`String`|Texte a afficher  
`profile`|`String`|Profil du texte (voir Base de données)  
`x`|`Fixnum`|Position X  
`y`|`Fixnum`|Position Y  
`*zoom_x`|`Fixnum`|Zoom sur la largeur du texte par défaut 100 (pour 100%)  
`*zoom_y`|`Fixnum`|Zoom sur la hauteur du text par défaut 100 (pour 100%)  
`*opacity`|`Fixnum`|Opacité de l'image, par défaut 255 (de 0 à 255)  
`*blend_type`|`Fixnum`|Mode de fusion, par défaut 0, 0=Normal, 1=Addition, 2=Soustraction  
`*origin`|`Fixnum`|Origine du texte, 0 = Haut gauche, 1 = centré par défaut, zéro  


