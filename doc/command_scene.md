# RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste%20des%20commandes.md) > **Scenes**  
- - -  
# Scenes
Commandes pour naviguer entre les scenes de jeu (et de systèmes)

## Liste des commandes
*    [call_load_screen](#call_load_screen)
*    [call_title_screen](#call_title_screen)
*    [scene_call(scene)](#scene_callscene)
*    [scene_clear_history](#scene_clear_history)
*    [scene_goto(scene)](#scene_gotoscene)
*    [scene_return](#scene_return)


## Description des commandes
##### call_load_screen

> Renvoie à la scene de chargement de partie

  
##### call_title_screen

> Renvoie à l'écran titre

  
##### scene_call(scene)

> Appelle une scene (et la place dans la pile de scene)

  
Nom|Type|Description  
--- | --- | ---  
`scene`|`Scene`|Scene à appeler  
##### scene_clear_history

> Vide la pile d'appel des scenes

  
##### scene_goto(scene)

> Appelle une scene (sans la placer dans la pile de scene)

  
Nom|Type|Description  
--- | --- | ---  
`scene`|`Scene`|Scene à appeler  
##### scene_return

> Renvoie à la dernière scene dans la pile d'appel

  
