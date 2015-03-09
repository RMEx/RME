#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Commande de navigation dans les scenes**  
- - -  
#Commande de navigation dans les scenes
Commandes pour naviguer entre les scenes de jeu (et de systèmes)

##Liste des commandes
*    [call_load_screen](#call_load_screen)
*    [call_title_screen](#call_title_screen)
*    [scene_call(scene)](#scene_callscene)
*    [scene_clear_history](#scene_clear_history)
*    [scene_goto(scene)](#scene_gotoscene)
*    [scene_return](#scene_return)


##Description des commandes
##### call_load_screen

> Renvoi à la scene de chargement de partie

  
> 

##### call_title_screen

> Renvoi à l'écran titre

  
> 

##### scene_call(scene)

> Appel une scene (et la place dans la pile de scene)

  
> Nom|Type|Description  
--- | --- | ---  
`scene`|`Scene`|Scene à appeler  


##### scene_clear_history

> Vide la pile d'appel des scenes

  
> 

##### scene_goto(scene)

> Appel une scene (sans la placer dans la pile de scene)

  
> Nom|Type|Description  
--- | --- | ---  
`scene`|`Scene`|Scene à appeler  


##### scene_return

> Renvoi à la dernière scene dans la pile d'appel

  
> 

