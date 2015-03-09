#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Commandes des acteurs**  
- - -  
#Commandes des acteurs
Offre des commandes pour obtenir des informations sur les acteurs

##Liste des commandes
*    [actor_accessory(id)](#actor_accessoryid)
*    [actor_agility(id)](#actor_agilityid)
*    [actor_armors(id)](#actor_armorsid)
*    [actor_attack(id)](#actor_attackid)
*    [actor_body(id)](#actor_bodyid)
*    [actor_change_appear(id, character_name, character_index, face_name, face_index)](#actor_change_appearid-character_name-character_index-face_name-face_index)
*    [actor_change_character(id, character_name, character_index)](#actor_change_characterid-character_name-character_index)
*    [actor_change_equip(id, slot, object_id)](#actor_change_equipid-slot-object_id)
*    [actor_change_face(id, face_name, face_index)](#actor_change_faceid-face_name-face_index)
*    [actor_character_index(id)](#actor_character_indexid)
*    [actor_character_name(id)](#actor_character_nameid)
*    [actor_class(id)](#actor_classid)
*    [actor_counter_attack_rate(id)](#actor_counter_attack_rateid)
*    [actor_critical_evasion_rate(id)](#actor_critical_evasion_rateid)
*    [actor_critical_rate(id)](#actor_critical_rateid)
*    [actor_defense(id)](#actor_defenseid)
*    [actor_description(id)](#actor_descriptionid)
*    [actor_equip(id, slot)](#actor_equipid-slot)
*    [actor_equip_accessory(id, object_id)](#actor_equip_accessoryid-object_id)
*    [actor_equip_body(id, object_id)](#actor_equip_bodyid-object_id)
*    [actor_equip_head(id, object_id)](#actor_equip_headid-object_id)
*    [actor_equip_shield(id, object_id)](#actor_equip_shieldid-object_id)
*    [actor_equip_weapon(id, object_id)](#actor_equip_weaponid-object_id)
*    [actor_evasion_rate(id)](#actor_evasion_rateid)
*    [actor_exp(id)](#actor_expid)
*    [actor_exp_for_next_level(id)](#actor_exp_for_next_levelid)
*    [actor_exp_rate(id)](#actor_exp_rateid)
*    [actor_face_index(id)](#actor_face_indexid)
*    [actor_face_name(id)](#actor_face_nameid)
*    [actor_floor_damage_rate(id)](#actor_floor_damage_rateid)
*    [actor_forget(id, skill_id)](#actor_forgetid-skill_id)
*    [actor_give_exp(id, exp)](#actor_give_expid-exp)
*    [actor_guard_effect_rate(id)](#actor_guard_effect_rateid)
*    [actor_has_accessory?(id)](#actor_has_accessoryid)
*    [actor_has_body?(id)](#actor_has_bodyid)
*    [actor_has_head?(id)](#actor_has_headid)
*    [actor_has_shield?(id)](#actor_has_shieldid)
*    [actor_has_weapon?(id)](#actor_has_weaponid)
*    [actor_head(id)](#actor_headid)
*    [actor_hit_rate(id)](#actor_hit_rateid)
*    [actor_hp(id)](#actor_hpid)
*    [actor_hp_regeneration_rate(id)](#actor_hp_regeneration_rateid)
*    [actor_knowns?(id, skill_id)](#actor_knownsid-skill_id)
*    [actor_learn(id, skill_id)](#actor_learnid-skill_id)
*    [actor_level(id)](#actor_levelid)
*    [actor_level_down(id)](#actor_level_downid)
*    [actor_level_max(id)](#actor_level_maxid)
*    [actor_level_up(id)](#actor_level_upid)
*    [actor_luck(id)](#actor_luckid)
*    [actor_magic_attack(id)](#actor_magic_attackid)
*    [actor_magic_defense(id)](#actor_magic_defenseid)
*    [actor_magical_damage_rate(id)](#actor_magical_damage_rateid)
*    [actor_magical_evasion_rate(id)](#actor_magical_evasion_rateid)
*    [actor_magical_reflection_rate(id)](#actor_magical_reflection_rateid)
*    [actor_max_hp(id)](#actor_max_hpid)
*    [actor_max_mp(id)](#actor_max_mpid)
*    [actor_mp(id)](#actor_mpid)
*    [actor_mp_cost_rate(id)](#actor_mp_cost_rateid)
*    [actor_mp_regeneration_rate(id)](#actor_mp_regeneration_rateid)
*    [actor_name(id)](#actor_nameid)
*    [actor_nickname(id)](#actor_nicknameid)
*    [actor_note(id)](#actor_noteid)
*    [actor_optimize_equipement(id)](#actor_optimize_equipementid)
*    [actor_pharmacology(id)](#actor_pharmacologyid)
*    [actor_physical_damage_rate(id)](#actor_physical_damage_rateid)
*    [actor_recovery_effect_rate(id)](#actor_recovery_effect_rateid)
*    [actor_set_graphic(id, character_name, character_index, face_name, face_index)](#actor_set_graphicid-character_name-character_index-face_name-face_index)
*    [actor_shield(id)](#actor_shieldid)
*    [actor_skills(id)](#actor_skillsid)
*    [actor_target_rate(id)](#actor_target_rateid)
*    [actor_tp(id)](#actor_tpid)
*    [actor_tp_charge_rate(id)](#actor_tp_charge_rateid)
*    [actor_tp_regeneration_rate(id)](#actor_tp_regeneration_rateid)
*    [actor_weapon(id)](#actor_weaponid)
*    [actor_weapons(id)](#actor_weaponsid)
*    [set_actor_name(id, new_name)](#set_actor_nameid-new_name)
*    [set_actor_nickname(id, new_name)](#set_actor_nicknameid-new_name)


##Description des commandes
##### actor_accessory(id)

> renvoie l'id l' accessoire équipé du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_agility(id)

> renvoie les points d'agilité du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_armors(id)

> renvoie le tableau des ID's des armures équipées du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_attack(id)

> renvoie les points d'attaque du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_body(id)

> renvoie l'id de l'armure équipée du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_change_appear(id, character_name, character_index, face_name, face_index)

> Change l'apparence et la face du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du héros  
`character_name`|`String`|Nom du caractère  
`character_index`|`Fixnum`|ID du caractère  
`face_name`|`String`|Nom du face  
`face_index`|`Fixnum`|ID du face  


##### actor_change_character(id, character_name, character_index)

> Change l'aparence du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du héros  
`character_name`|`String`|Nom du caractère  
`character_index`|`Fixnum`|ID du caractère  


##### actor_change_equip(id, slot, object_id)

> Change l'équipement du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`slot`|`Symbol`|Slot d'équipement (:Weapon, :Body, :Shield, : Head, :Accessory)  
`object_id`|`Fixnum`|ID de l'Arme ou de l'Armure (La commande déduira s'il doit s'agir d'une arme ou d'une armure)  


##### actor_change_face(id, face_name, face_index)

> Change la face du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du héros  
`face_name`|`String`|Nom du face  
`face_index`|`Fixnum`|ID du face  


##### actor_character_index(id)

> renvoie l'index du charset du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_character_name(id)

> renvoie le nom du charset du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_class(id)

> renvoie l'ID de la classe du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_counter_attack_rate(id)

> renvoie la probabilité d'un contre (sur une attaque physique) du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_critical_evasion_rate(id)

> renvoie la probabilité de faire un coup critique en préemptif du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_critical_rate(id)

> renvoie la probabilité de coup critique du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_defense(id)

> renvoie les points de défense du héros référencé par son ID

  
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
`slot`|`Symbol`|Slot d'équipement soit :Weapon, :Head, :Body, :Shield ou :Accessory  


##### actor_equip_accessory(id, object_id)

> Change l'accessoire du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`object_id`|`Fixnum`|ID de l'Armure  


##### actor_equip_body(id, object_id)

> Change l'armure du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`object_id`|`Fixnum`|ID de l'Armure  


##### actor_equip_head(id, object_id)

> Change le casque du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`object_id`|`Fixnum`|ID de l'Armure  


##### actor_equip_shield(id, object_id)

> Change le bouclier du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`object_id`|`Fixnum`|ID de l'Armure  


##### actor_equip_weapon(id, object_id)

> Change l'arme du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`object_id`|`Fixnum`|ID de l'Arme  


##### actor_evasion_rate(id)

> renvoie la probabilité d'esquiver une attaque physique du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_exp(id)

> renvoie les points d'expériences du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_exp_for_next_level(id)

> renvoie le nombre d'expérience nécéssaire pour passer au niveau suivant du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_exp_rate(id)

> renvoie le pourcentage de la variation d'acquisition d'expérience du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_face_index(id)

> renvoie l'index du faceset du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_face_name(id)

> renvoie le nom du faceset du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_floor_damage_rate(id)

> renvoie le pourcentage de dommage des terrains reçu du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_forget(id, skill_id)

> Oublie la technique passée en argument au héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`skill_id`|`Fixnum`|ID de le technique  


##### actor_give_exp(id, exp)

> fait gagner de l'expérience au héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`exp`|`Fixnum`|Expérience donnée  


##### actor_guard_effect_rate(id)

> renvoie la force de défense (diminution de l'attaque subie) du héros référencé par son ID

  
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


##### actor_hit_rate(id)

> renvoie la probabilité de toucher du héros référencé par son ID sur un ennemi

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_hp(id)

> renvoie les points de vie du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_hp_regeneration_rate(id)

> renvoie le pourcentage de régénration de HP à chaque tour du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_knowns?(id, skill_id)

> Renvoie true si le héros référencé par son ID connait la technique référencée par son ID, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`skill_id`|`Fixnum`|ID de le technique  


##### actor_learn(id, skill_id)

> Apprend la technique passée en argument au héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`skill_id`|`Fixnum`|ID de le technique  


##### actor_level(id)

> renvoie le niveau du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_level_down(id)

> fait perdre un niveau au héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_level_max(id)

> renvoie le niveau maximum du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_level_up(id)

> fait gagner un niveau au héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_luck(id)

> renvoie les points de chance du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_magic_attack(id)

> renvoie les points d'attaque magique du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_magic_defense(id)

> renvoie les points de défense magique du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_magical_damage_rate(id)

> renvoie le pourcentage de dommage magique reçu du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_magical_evasion_rate(id)

> renvoie la probabilité d'une esquiver une attaque magique du héros référencé par son ID par un ennemi

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_magical_reflection_rate(id)

> renvoie la probabilité d'une réflexion magique du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_max_hp(id)

> renvoie le nombre de points de vie maximum du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_max_mp(id)

> renvoie le nombre de points de magie du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_mp(id)

> renvoie les points de magie du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_mp_cost_rate(id)

> renvoie le facteur d'un cout de MP (pour une attaque faisant varier la consommation de MP) du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_mp_regeneration_rate(id)

> renvoie le pourcentage de régénration MP à chaque tour du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_name(id)

> renvoie le nom du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_nickname(id)

> renvoie le surnom du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_note(id)

> renvoie le commentaire de la base de données du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_optimize_equipement(id)

> Optimise l'équipement du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_pharmacology(id)

> renvoie le pourcentage de HP/MP récupéré via un objet du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_physical_damage_rate(id)

> renvoie le pourcentage de dommage physique reçu du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_recovery_effect_rate(id)

> renvoie le pourcentage de MP/HP recu, du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_set_graphic(id, character_name, character_index, face_name, face_index)

> Change les graphisme du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`character_name`|`String`|Charset  
`character_index`|`Fixnum`|index du Charset  
`face_name`|`String`|Faceset  
`face_index`|`Fixnum`|Index du faceset  


##### actor_shield(id)

> renvoie l'id du bouclier équipé du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_skills(id)

> renvoie le tableau des ID's des techniques connues du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_target_rate(id)

> renvoie la probabilité d'être ciblé par un ennemi, du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_tp(id)

> renvoie les points de temps du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_tp_charge_rate(id)

> renvoie le facteur de cout de TP (pour une attaque faisant varier la consommation de TP) du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_tp_regeneration_rate(id)

> renvoie le pourcentage de régénration de TP par tour du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_weapon(id)

> renvoie l'id de l'arme équipée du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### actor_weapons(id)

> renvoie le tableau des ID's des armes équipées du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  


##### set_actor_name(id, new_name)

> modifie le nom du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`new_name`|`String`|Nouveau nom  


##### set_actor_nickname(id, new_name)

> modifie le surnom du héros référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID de l'acteur  
`new_name`|`String`|Nouveau surnom  


