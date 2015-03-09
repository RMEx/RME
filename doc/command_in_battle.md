#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Commandes en combat**  
- - -  
#Commandes en combat
Commandes d'informations en combat (en plus de la base de données). Uniquement valide en combat

##Liste des commandes
*    [active_actor](#active_actor)
*    [active_actor?](#active_actor)
*    [current_enemies](#current_enemies)
*    [current_troop](#current_troop)
*    [enemy_agility(position)](#enemy_agilityposition)
*    [enemy_attack(position)](#enemy_attackposition)
*    [enemy_counter_attack_rate(position)](#enemy_counter_attack_rateposition)
*    [enemy_critical_evasion_rate(position)](#enemy_critical_evasion_rateposition)
*    [enemy_critical_rate(position)](#enemy_critical_rateposition)
*    [enemy_defense(position)](#enemy_defenseposition)
*    [enemy_die?(position)](#enemy_dieposition)
*    [enemy_evasion_rate(position)](#enemy_evasion_rateposition)
*    [enemy_experience_rate(position)](#enemy_experience_rateposition)
*    [enemy_floor_damage_rate(position)](#enemy_floor_damage_rateposition)
*    [enemy_guard_effect_rate(position)](#enemy_guard_effect_rateposition)
*    [enemy_hidden?(position)](#enemy_hiddenposition)
*    [enemy_hit_rate(position)](#enemy_hit_rateposition)
*    [enemy_hp(position)](#enemy_hpposition)
*    [enemy_hp_regeneration_rate(position)](#enemy_hp_regeneration_rateposition)
*    [enemy_luck(position)](#enemy_luckposition)
*    [enemy_magic_attack(position)](#enemy_magic_attackposition)
*    [enemy_magic_defense(position)](#enemy_magic_defenseposition)
*    [enemy_magical_damage_rate(position)](#enemy_magical_damage_rateposition)
*    [enemy_magical_evasion_rate(position)](#enemy_magical_evasion_rateposition)
*    [enemy_magical_reflection_rate(position)](#enemy_magical_reflection_rateposition)
*    [enemy_max_hp(position)](#enemy_max_hpposition)
*    [enemy_max_mp(position)](#enemy_max_mpposition)
*    [enemy_mp(position)](#enemy_mpposition)
*    [enemy_mp_cost_rate(position)](#enemy_mp_cost_rateposition)
*    [enemy_mp_regeneration_rate(position)](#enemy_mp_regeneration_rateposition)
*    [enemy_pharmacology(position)](#enemy_pharmacologyposition)
*    [enemy_physical_damage_rate(position)](#enemy_physical_damage_rateposition)
*    [enemy_recovery_effect_rate(position)](#enemy_recovery_effect_rateposition)
*    [enemy_target_rate(position)](#enemy_target_rateposition)
*    [enemy_tp(position)](#enemy_tpposition)
*    [enemy_tp_charge_rate(position)](#enemy_tp_charge_rateposition)
*    [enemy_tp_regeneration_rate(position)](#enemy_tp_regeneration_rateposition)
*    [monster_battler_height(position)](#monster_battler_heightposition)
*    [monster_battler_width(position)](#monster_battler_widthposition)
*    [total_enemies](#total_enemies)


##Description des commandes
##### active_actor

> renvoie l'identifiant d'un acteur si il est entrain de sélectionner une action, nil sinon

  
> 

##### active_actor?

> renvoie true si un acteur est entrain de choisir une action, false sinon

  
> 

##### current_enemies

> Renvoie un tableau contenant les ennemis en cours de combat

  
> 

##### current_troop

> Renvoie l'identifiant du groupe en cours de combat

  
> 

##### enemy_agility(position)

> renvoie les points d'agilité de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_attack(position)

> renvoie les points d'attaque de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_counter_attack_rate(position)

> renvoie la probabilité d'un contre (sur une attaque physique) de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_critical_evasion_rate(position)

> renvoie la probabilité de faire un coup critique en préemptif de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_critical_rate(position)

> renvoie la probabilité de coup critique de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_defense(position)

> renvoie les points de défense de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_die?(position)

> renvoie true si l'ennemi en combat référencé par sa position en combat est mort, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_evasion_rate(position)

> renvoie la probabilité d'esquiver une attaque physique de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_experience_rate(position)

> renvoie le pourcentage de la variation d'acquisition d'expérience de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_floor_damage_rate(position)

> renvoie le pourcentage de dommage des terrains reçu de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_guard_effect_rate(position)

> renvoie la force de défense (diminution de l'attaque subie) de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_hidden?(position)

> renvoie true si l'ennemi en combat référencé par sa position en combat est invisble, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_hit_rate(position)

> renvoie la probabilité de toucher de l'ennemi en combat référencé par sa position en combat sur un ennemi

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_hp(position)

> renvoie les points de vie de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_hp_regeneration_rate(position)

> renvoie le pourcentage de régénration de HP à chaque tour de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_luck(position)

> renvoie les points de chance de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_magic_attack(position)

> renvoie les points d'attaque magique de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_magic_defense(position)

> renvoie les points de défense magique de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_magical_damage_rate(position)

> renvoie le pourcentage de dommage magique reçu de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_magical_evasion_rate(position)

> renvoie la probabilité d'une esquiver une attaque magique de l'ennemi en combat référencé par sa position en combat par un ennemi

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_magical_reflection_rate(position)

> renvoie la probabilité d'une réflexion magique de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_max_hp(position)

> renvoie le nombre de points de vie maximum de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_max_mp(position)

> renvoie le nombre de points de magie de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_mp(position)

> renvoie les points de magie de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_mp_cost_rate(position)

> renvoie le facteur d'un cout de MP (pour une attaque faisant varier la consommation de MP) de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_mp_regeneration_rate(position)

> renvoie le pourcentage de régénration MP à chaque tour de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_pharmacology(position)

> renvoie le pourcentage de HP/MP récupéré via un objet de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_physical_damage_rate(position)

> renvoie le pourcentage de dommage physique reçu de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_recovery_effect_rate(position)

> renvoie le pourcentage de MP/HP recu, de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_target_rate(position)

> renvoie la probabilité d'être ciblé par un ennemi, de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_tp(position)

> renvoie les points de temps de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_tp_charge_rate(position)

> renvoie le facteur de cout de TP (pour une attaque faisant varier la consommation de TP) de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### enemy_tp_regeneration_rate(position)

> renvoie le pourcentage de régénration de TP par tour de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### monster_battler_height(position)

> renvoie la largeur du battler de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### monster_battler_width(position)

> renvoie la largeur du battler de l'ennemi en combat référencé par sa position en combat

  
> Nom|Type|Description  
--- | --- | ---  
`position`|`Fixnum`|Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)  


##### total_enemies

> Renvoie le nombre d'enemis en combat (mort ou vivant)

  
> 

