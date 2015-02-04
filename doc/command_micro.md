#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](__command_list.md) > **Commandes de manipulation des micros events**  
- - -  
#Commandes de manipulation des micros events
Commandes relatives à la gestion des micro events

##Liste des commandes
*    [bind(e, *args, &block)](#binde-args-&block)
*    [unbind(e, *k)](#unbinde-k)


##Description des commandes
##### bind(e, *args, &block)

> Associe un micro_event à un sélecteur

  
> Nom|Type|Description  
--- | --- | ---  
`e`|`Selecteur`|Sélecteur d'évènements  
`*args`|`Args`|Voir l'explication référente aux micro_event dans la documentation  
`&block`|`Block`|Action a exécuter  


##### unbind(e, *k)

> Désassocie un micro_evenement d'un sélecteur d`'évènements

  
> Nom|Type|Description  
--- | --- | ---  
`e`|`Selecteur`|Sélecteur d'évènements  
`*k`|`Args`|Voir l'explication référente aux micro_event dans la documentation  


