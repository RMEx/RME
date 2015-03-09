#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Commandes relatives aux armures**  
- - -  
#Commandes relatives aux armures
Commandes permettant de manipuler les armures

##Liste des commandes
*    [armor_agility(id)](#armor_agilityid)
*    [armor_attack_power(id)](#armor_attack_powerid)
*    [armor_count(id)](#armor_countid)
*    [armor_defense_power(id)](#armor_defense_powerid)
*    [armor_description(id)](#armor_descriptionid)
*    [armor_equiped?(id, *member_id)](#armor_equipedid-member_id)
*    [armor_icon(id)](#armor_iconid)
*    [armor_luck(id)](#armor_luckid)
*    [armor_magic_attack_power(id)](#armor_magic_attack_powerid)
*    [armor_magic_defense_power(id)](#armor_magic_defense_powerid)
*    [armor_max_hit_points(id)](#armor_max_hit_pointsid)
*    [armor_max_magic_points(id)](#armor_max_magic_pointsid)
*    [armor_name(id)](#armor_nameid)
*    [armor_note(id)](#armor_noteid)
*    [armor_price(id)](#armor_priceid)
*    [armor_type(id)](#armor_typeid)
*    [give_armor(id, amount, *include_equipement)](#give_armorid-amount-include_equipement)
*    [has_armor?(id, *include_equipement)](#has_armorid-include_equipement)


##Description des commandes
##### armor_agility(id)

> Renvoie l'apport d'agilité d'une armure référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### armor_attack_power(id)

> Renvoie la puissance d'attaque d'une armure référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### armor_count(id)

> Renvoie le nombre d'armures référencées par son ID possédées par l'équipe

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure à compter  


##### armor_defense_power(id)

> Renvoie la puissance de défense d'une armure référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### armor_description(id)

> Renvoie la description de l'armure référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  


##### armor_equiped?(id, *member_id)

> Renvoie true si l'armure référencé par son ID est équipée par un des membres de l'équipe, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  
`*member_id`|`Fixnum`|Id du membre de l'équipe. Si aucun membre_id n'est spécifié, la commande vérifiera pour toute l'équipe   


##### armor_icon(id)

> Renvoie l'index de l'icone  de l'armure référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  


##### armor_luck(id)

> Renvoie l'apport de chance d'une armure référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### armor_magic_attack_power(id)

> Renvoie la puissance d'attaque magique d'une armure référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### armor_magic_defense_power(id)

> Renvoie la puissance de défense magique d'une armure référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### armor_max_hit_points(id)

> Renvoie le maximum des points de vie d'une armure référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### armor_max_magic_points(id)

> Renvoie le maximum des points de magie d'une armure référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### armor_name(id)

> Renvoie le nom de l'armure référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  


##### armor_note(id)

> Renvoie le commentaire de l'armure référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  


##### armor_price(id)

> Renvoie le prix  de l'armure référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  


##### armor_type(id)

> Renvoie le type de l'armure référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  


##### give_armor(id, amount, *include_equipement)

> Fait gagner à l'équipe l'armure référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  
`amount`|`Fixnum`|Nombre à donner. Si le nombre est négatif, l'objet sera retiré  
`*include_equipement`|`Boolean`|Ce paramètre n'est utile que si on supprime des objets (ammount négatif). Si cette variable vaut true, les objets équipés seront déséquipés si l'inventaire n'en possède pas assez. Par défaut, il vaut false. Donc pas de déséquipement  


##### has_armor?(id, *include_equipement)

> Renvoie true si l'armure référencé par son ID est possédée par l'équipe, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  
`*include_equipement`|`Boolean`|Si ce paramètre vaut true, la commande prend en compte l'équipement, sinon (false), elle ne le prend pas en compte (par défaut: false)  


