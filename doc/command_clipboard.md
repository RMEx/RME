#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Commandes de gestion du presse-papier**  
- - -  
#Commandes de gestion du presse-papier
Permet d'envoyer des données dans le presse-papier ou de récupérer le texte stocké dans le presse papier

##Liste des commandes
*    [clipboard_get_text](#clipboard_get_text)
*    [clipboard_push_command(cmd)](#clipboard_push_commandcmd)
*    [clipboard_push_text(text)](#clipboard_push_texttext)


##Description des commandes
##### clipboard_get_text

> Renvoi le texte contenu dans le presse-papier

  
> 

##### clipboard_push_command(cmd)

> Place une commande évènement dans le presse-papier

  
> Nom|Type|Description  
--- | --- | ---  
`cmd`|`RPGCommand`|Commande à placer dans le presse-papier  


##### clipboard_push_text(text)

> Place un texte dans le presse-papier

  
> Nom|Type|Description  
--- | --- | ---  
`text`|`String`|Texte à sauvegarder dans le presse-papier  


