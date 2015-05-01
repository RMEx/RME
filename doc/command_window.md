#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Commandes de manipulation de fenêtre**  
- - -  
#Commandes de manipulation de fenêtre
Commandes pour créer/modifier des fenêtres

##Liste des commandes
*    [create_text_window(id, content, profile, x, y, *w, *h)](#create_text_windowid-content-profile-x-y-w-h)


##Description des commandes
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


