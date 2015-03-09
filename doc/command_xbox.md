#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Commandes de gestion de la vibration des pads Xbox360**  
- - -  
#Commandes de gestion de la vibration des pads Xbox360
Permet de manipuler la vibration des manettes de la XBOX360

##Liste des commandes
*    [pad360_plugged?(*id)](#pad360_pluggedid)
*    [pad360_stop_vibration(*id)](#pad360_stop_vibrationid)
*    [pad360_stop_vibration_left(*id)](#pad360_stop_vibration_leftid)
*    [pad360_stop_vibration_right(*id)](#pad360_stop_vibration_rightid)
*    [pad360_vibrate(*id, *left, *right)](#pad360_vibrateid-left-right)
*    [pad360_vibrate_left(*id, *s)](#pad360_vibrate_leftid-s)
*    [pad360_vibrate_right(*id, *s)](#pad360_vibrate_rightid-s)


##Description des commandes
##### pad360_plugged?(*id)

> Renvoie true si une manette est branchée dans le port référencée par son ID, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`*id`|`Fixnum`|Port de la manette, par défaut 0, soit la première manette branchée  


##### pad360_stop_vibration(*id)

> Arrête la vibration des deux moteurs de la manette référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`*id`|`Fixnum`|Port de la manette, par défaut 0, soit la première manette branchée  


##### pad360_stop_vibration_left(*id)

> Arrête la vibration du moteur gauche de la manette référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`*id`|`Fixnum`|Port de la manette, par défaut 0, soit la première manette branchée  


##### pad360_stop_vibration_right(*id)

> Arrête la vibration du moteur droit de la manette référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`*id`|`Fixnum`|Port de la manette, par défaut 0, soit la première manette branchée  


##### pad360_vibrate(*id, *left, *right)

> Fait vibrer la manette référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`*id`|`Fixnum`|Port de la manette, par défaut 0, soit la première manette branchée  
`*left`|`Fixnum`|Force dans le moteur gauche, par défaut, 100  
`*right`|`Fixnum`|Force dans le moteur droit, par défaut, 100  


##### pad360_vibrate_left(*id, *s)

> Fait vibrer le moteur gauche de la manette référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`*id`|`Fixnum`|Port de la manette, par défaut 0, soit la première manette branchée  
`*s`|`Fixnum`|Force de la vibration, par défaut, 100  


##### pad360_vibrate_right(*id, *s)

> Fait vibrer le moteur droit de la manette référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`*id`|`Fixnum`|Port de la manette, par défaut 0, soit la première manette branchée  
`*s`|`Fixnum`|Force de la vibration, par défaut, 100  


