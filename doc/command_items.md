#Commandes relatives aux objets
[Retourner à l'index](__command_list.md)

Commandes permettant d'obtenir ou de manipuler les objets

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
*    [give_item(id, amount)](#give_itemid-amount)
*    [give_weapon(id, amount, *include_equipement)](#give_weaponid-amount-include_equipement)
*    [has_armor?(id, *include_equipement)](#has_armorid-include_equipement)
*    [has_item?(id)](#has_itemid)
*    [has_weapon?(id, *include_equipement)](#has_weaponid-include_equipement)
*    [is_key_item?(id)](#is_key_itemid)
*    [item_always_usable?(id)](#item_always_usableid)
*    [item_battle_usable?(id)](#item_battle_usableid)
*    [item_consumable?(id)](#item_consumableid)
*    [item_count(id)](#item_countid)
*    [item_description(id)](#item_descriptionid)
*    [item_for_all_allies?(id)](#item_for_all_alliesid)
*    [item_for_all_dead_allies?(id)](#item_for_all_dead_alliesid)
*    [item_for_all_enemies?(id)](#item_for_all_enemiesid)
*    [item_for_caller?(id)](#item_for_callerid)
*    [item_for_four_random_enemies?(id)](#item_for_four_random_enemiesid)
*    [item_for_one_ally?(id)](#item_for_one_allyid)
*    [item_for_one_dead_ally?(id)](#item_for_one_dead_allyid)
*    [item_for_one_enemy?(id)](#item_for_one_enemyid)
*    [item_for_one_random_enemy?(id)](#item_for_one_random_enemyid)
*    [item_for_three_random_enemies?(id)](#item_for_three_random_enemiesid)
*    [item_for_two_random_enemies?(id)](#item_for_two_random_enemiesid)
*    [item_icon(id)](#item_iconid)
*    [item_menu_usable?(id)](#item_menu_usableid)
*    [item_name(id)](#item_nameid)
*    [item_never_usable?(id)](#item_never_usableid)
*    [item_note(id)](#item_noteid)
*    [item_occasion(id)](#item_occasionid)
*    [item_price(id)](#item_priceid)
*    [item_scope(id)](#item_scopeid)
*    [weapon_agility(id)](#weapon_agilityid)
*    [weapon_attack_power(id)](#weapon_attack_powerid)
*    [weapon_count(id)](#weapon_countid)
*    [weapon_defense_power(id)](#weapon_defense_powerid)
*    [weapon_description(id)](#weapon_descriptionid)
*    [weapon_equiped?(id, *member_id)](#weapon_equipedid-member_id)
*    [weapon_icon(id)](#weapon_iconid)
*    [weapon_luck(id)](#weapon_luckid)
*    [weapon_magic_attack_power(id)](#weapon_magic_attack_powerid)
*    [weapon_magic_defense_power(id)](#weapon_magic_defense_powerid)
*    [weapon_max_hit_points(id)](#weapon_max_hit_pointsid)
*    [weapon_max_magic_points(id)](#weapon_max_magic_pointsid)
*    [weapon_name(id)](#weapon_nameid)
*    [weapon_note(id)](#weapon_noteid)
*    [weapon_price(id)](#weapon_priceid)
*    [weapon_type(id)](#weapon_typeid)


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

> Renvoie le maximum des points de dégat d'une armure référencée par son ID

  
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


##### give_item(id, amount)

> Fait gagner à l'équipe l'objet référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  
`amount`|`Fixnum`|Nombre à donner. Si le nombre est négatif, l'objet sera retiré  


##### give_weapon(id, amount, *include_equipement)

> Fait gagner à l'équipe l'arme référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  
`amount`|`Fixnum`|Nombre à donner. Si le nombre est négatif, l'objet sera retiré  
`*include_equipement`|`Boolean`|Ce paramètre n'est utile que si on supprime des objets (ammount négatif). Si cette variable vaut true, les objets équipés seront déséquipés si l'inventaire n'en possède pas assez. Par défaut, il vaut false. Donc pas de déséquipement  


##### has_armor?(id, *include_equipement)

> Renvoie true si l'armure référencé par son ID est possédée par l'équipe, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  
`*include_equipement`|`Boolean`|Si ce paramètre vaut true, la commande prend en compte l'équipement, sinon (false), elle ne le prend pas en compte (par défaut: false)  


##### has_item?(id)

> Renvoie true si l'objet référencé par son ID est possédé par l'équipe, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### has_weapon?(id, *include_equipement)

> Renvoie true si l'arme référencé par son ID est possédée par l'équipe, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  
`*include_equipement`|`Boolean`|Si ce paramètre vaut true, la commande prend en compte l'équipement, sinon (false), elle ne le prend pas en compte (par défaut: false)  


##### is_key_item?(id)

> Renvoie true si l'objet référencé par son ID est un objet clé, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_always_usable?(id)

> Renvoie true si l'objet référencé par son ID est utilisable partout

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_battle_usable?(id)

> Renvoie true si l'objet référencé par son ID est utilisable en combat

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_consumable?(id)

> Renvoie true si l'objet référencé par son ID est consommable, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_count(id)

> Renvoie le nombre d'objet référencé par son ID possédés par l'équipe

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet à compter  


##### item_description(id)

> Renvoie la description de l'objet référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_for_all_allies?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise tous les alliés, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_for_all_dead_allies?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise tous les alliés morts, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_for_all_enemies?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise tous les ennemis, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_for_caller?(id)

> Renvoie true si la cible d'un objet référencée par son ID l'utilisateur, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_for_four_random_enemies?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise quatre ennemis au hasard, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_for_one_ally?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise un allié, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_for_one_dead_ally?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise un allié mort, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_for_one_enemy?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise un ennemi, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_for_one_random_enemy?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise un ennemi au hasard, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_for_three_random_enemies?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise trois ennemis au hasard, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_for_two_random_enemies?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise deux ennemis au hasard, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_icon(id)

> Renvoie l'index de l'icone de l'objet référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_menu_usable?(id)

> Renvoie true si l'objet référencé par son ID est utilisable dans le menu

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_name(id)

> Renvoie le nom de l'objet référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_never_usable?(id)

> Renvoie true si l'objet référencé par son ID n'est jamais utilisable

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_note(id)

> Renvoie le commentaire de l'objet référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_occasion(id)

> Renvoie un entier correspondant au droit d'utilisation de l'objet

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_price(id)

> Renvoie le prix de l'objet référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_scope(id)

> Renvoie la portée (en Entier) d'un objet référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'armure  


##### weapon_agility(id)

> Renvoie l'apport d'agilité d'une arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### weapon_attack_power(id)

> Renvoie la puissance d'attaque d'une arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### weapon_count(id)

> Renvoie le nombre d'armes référencées par son ID possédées par l'équipe

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme à compter  


##### weapon_defense_power(id)

> Renvoie la puissance de défense d'une arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### weapon_description(id)

> Renvoie la description de l'arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  


##### weapon_equiped?(id, *member_id)

> Renvoie true si l'arme référencé par son ID est équipée par un des membres de l'équipe, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  
`*member_id`|`Fixnum`|Id du membre de l'équipe. Si aucun membre_id n'est spécifié, la commande vérifiera pour toute l'équipe   


##### weapon_icon(id)

> Renvoie l'index de l'icone de l'arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  


##### weapon_luck(id)

> Renvoie l'apport de chance d'une arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### weapon_magic_attack_power(id)

> Renvoie la puissance d'attaque magique d'une arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### weapon_magic_defense_power(id)

> Renvoie la puissance de défense magique d'une arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### weapon_max_hit_points(id)

> Renvoie le maximum des points de dégat d'une arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### weapon_max_magic_points(id)

> Renvoie le maximum des points de magie d'une arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### weapon_name(id)

> Renvoie le nom de l'arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  


##### weapon_note(id)

> Renvoie le commentaire de l'arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  


##### weapon_price(id)

> Renvoie le prix de l'arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  


##### weapon_type(id)

> Renvoie le type de l'arme référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'arme  


