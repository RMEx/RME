#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Commande de manipulation des sauvegardes**  
- - -  
#Commande de manipulation des sauvegardes
Commandes pour gerer et naviguer entre les sauvegardes

##Liste des commandes
*    [a_save_exists?](#a_save_exists)
*    [import_label(index, idlabel)](#import_labelindex-idlabel)
*    [import_switch(index, idswitch)](#import_switchindex-idswitch)
*    [import_variable(index, idvar)](#import_variableindex-idvar)
*    [load_game(index, *time)](#load_gameindex-time)
*    [save_delete(index)](#save_deleteindex)
*    [save_exists?(index)](#save_existsindex)
*    [save_game(index)](#save_gameindex)
*    [start_new_game](#start_new_game)


##Description des commandes
##### a_save_exists?

> Renvoie true si au moins une sauvegade a été faite, false sinon

  
> 

##### import_label(index, idlabel)

> Renvoi la valeur d'un label issu d'une autre sauvegarde

  
> Nom|Type|Description  
--- | --- | ---  
`index`|`Fixnum`|Numéro de la sauvegarde  
`idlabel`|`Fixnum`|Identifiant du label  


##### import_switch(index, idswitch)

> Renvoi la valeur d'un interrupteur issu d'une autre sauvegarde

  
> Nom|Type|Description  
--- | --- | ---  
`index`|`Fixnum`|Numéro de la sauvegarde  
`idswitch`|`Fixnum`|Numéro de l'interrupteur  


##### import_variable(index, idvar)

> Renvoi la valeur d'une variable issue d'une autre sauvegarde

  
> Nom|Type|Description  
--- | --- | ---  
`index`|`Fixnum`|Numéro de la sauvegarde  
`idvar`|`Fixnum`|Numéro de la variable  


##### load_game(index, *time)

> Charge la partie référencée par l'ID de sauvegarde donné

  
> Nom|Type|Description  
--- | --- | ---  
`index`|`Fixnum`|Numéro de la sauvegarde  
`*time`|`Fixnum`|Durée du fadeout  


##### save_delete(index)

> Supprime la sauvegarde référencée par son numéro

  
> Nom|Type|Description  
--- | --- | ---  
`index`|`Fixnum`|Numéro de la sauvegarde  


##### save_exists?(index)

> Renvoie true si la sauvegarde référencée par son numéro existe

  
> Nom|Type|Description  
--- | --- | ---  
`index`|`Fixnum`|Numéro de la sauvegarde  


##### save_game(index)

> Sauvegarde la partie sur la sauvegardé référencée par l'ID donné

  
> Nom|Type|Description  
--- | --- | ---  
`index`|`Fixnum`|Numéro de la sauvegarde  


##### start_new_game

> Démarre une nouvelle partie

  
> 

