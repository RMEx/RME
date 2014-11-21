#Commandes des acteurs
[Retourner à l'index](__command_list.md)

Offre des commandes pour obtenir des informations sur les acteurs

##Liste des commandes
*    [actor_accessory(id)](#actor_accessoryid)
*    [actor_body(id)](#actor_bodyid)
*    [actor_description(id)](#actor_descriptionid)
*    [actor_equip(id, slot)](#actor_equipid-slot)
*    [actor_exp(id)](#actor_expid)
*    [actor_has_accessory?(id)](#actor_has_accessoryid)
*    [actor_has_body?(id)](#actor_has_bodyid)
*    [actor_has_head?(id)](#actor_has_headid)
*    [actor_has_shield?(id)](#actor_has_shieldid)
*    [actor_has_weapon?(id)](#actor_has_weaponid)
*    [actor_head(id)](#actor_headid)
*    [actor_hp(id)](#actor_hpid)
*    [actor_level(id)](#actor_levelid)
*    [actor_level_max(id)](#actor_level_maxid)
*    [actor_mp(id)](#actor_mpid)
*    [actor_note(id)](#actor_noteid)
*    [actor_shield(id)](#actor_shieldid)
*    [actor_tp(id)](#actor_tpid)
*    [actor_weapon(id)](#actor_weaponid)


##Description des commandes
##### actor_accessory(id)

> renvoie l'id l' accessoire équipé du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_body(id)

> renvoie l'id de l'armure équipée du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_description(id)

> renvoie la déscription du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_equip(id, slot)

> Renvoie l'id de l'équipement du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`slot`|`Fixnum`|Slot d'équipement soit :Weapon, :Head, :Body, :Shield ou :Accessory  


##### actor_exp(id)

> renvoie les points d'expériences du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_has_accessory?(id)

> renvoie true si le héros référencé par son ID est équipé d'un accessoire, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_has_body?(id)

> renvoie true si le héros référencé par son ID est équipé d'une armure, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_has_head?(id)

> renvoie true si le héros référencé par son ID est équipé d'une casque, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_has_shield?(id)

> renvoie true si le héros référencé par son ID est équipé d'un bouclier, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_has_weapon?(id)

> renvoie true si le héros référencé par son ID est équipé d'une arme, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_head(id)

> renvoie l'id du casque équipée du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_hp(id)

> renvoie les points de vie du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_level(id)

> renvoie le niveau du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_level_max(id)

> renvoie le niveau maximum du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_mp(id)

> renvoie les points de magie du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_note(id)

> renvoie le commentaire de la base de données du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_shield(id)

> renvoie l'id du bouclier équipé du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_tp(id)

> renvoie les points de temps du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_weapon(id)

> renvoie l'id de l'arme équipée du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


