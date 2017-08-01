# RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste%20des%20commandes.md) > **Techniques**  
- - -  
# Techniques
Offre des commandes pour obtenir des informations sur les techniques

## Liste des commandes
*    [skill_always_usable?(id)](#skill_always_usableid)
*    [skill_battle_usable?(id)](#skill_battle_usableid)
*    [skill_certain?(id)](#skill_certainid)
*    [skill_description(id)](#skill_descriptionid)
*    [skill_for_all?(id)](#skill_for_allid)
*    [skill_for_all_allies?(id)](#skill_for_all_alliesid)
*    [skill_for_all_dead_allies?(id)](#skill_for_all_dead_alliesid)
*    [skill_for_all_enemies?(id)](#skill_for_all_enemiesid)
*    [skill_for_caller?(id)](#skill_for_callerid)
*    [skill_for_dead_friend?(id)](#skill_for_dead_friendid)
*    [skill_for_four_random_enemies?(id)](#skill_for_four_random_enemiesid)
*    [skill_for_friend?(id)](#skill_for_friendid)
*    [skill_for_one?(id)](#skill_for_oneid)
*    [skill_for_one_ally?(id)](#skill_for_one_allyid)
*    [skill_for_one_dead_ally?(id)](#skill_for_one_dead_allyid)
*    [skill_for_one_enemy?(id)](#skill_for_one_enemyid)
*    [skill_for_one_random_enemy?(id)](#skill_for_one_random_enemyid)
*    [skill_for_opponent?(id)](#skill_for_opponentid)
*    [skill_for_random?(id)](#skill_for_randomid)
*    [skill_for_three_random_enemies?(id)](#skill_for_three_random_enemiesid)
*    [skill_for_two_random_enemies?(id)](#skill_for_two_random_enemiesid)
*    [skill_has_no_scope?(id)](#skill_has_no_scopeid)
*    [skill_icon(id)](#skill_iconid)
*    [skill_magical?(id)](#skill_magicalid)
*    [skill_menu_usable?(id)](#skill_menu_usableid)
*    [skill_name(id)](#skill_nameid)
*    [skill_nb_hits(id)](#skill_nb_hitsid)
*    [skill_need_selection?(id)](#skill_need_selectionid)
*    [skill_never_usable?(id)](#skill_never_usableid)
*    [skill_note(id)](#skill_noteid)
*    [skill_number_of_targets(id)](#skill_number_of_targetsid)
*    [skill_occasion(id)](#skill_occasionid)
*    [skill_physical?(id)](#skill_physicalid)
*    [skill_scope(id)](#skill_scopeid)
*    [skill_speed(id)](#skill_speedid)
*    [skill_success_rate(id)](#skill_success_rateid)
*    [skill_tp_gain(id)](#skill_tp_gainid)


## Description des commandes
##### skill_always_usable?(id)

> Renvoie true si la technique référencé par son ID est utilisable partout

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_battle_usable?(id)

> Renvoie true si la technique référencé par son ID est utilisable en combat seulement

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_certain?(id)

> Renvoie true si une technique référencée par son ID a une garantie de réussite totale, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_description(id)

> Renvoie la description la technique référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_for_all?(id)

> Renvoie true si une technique référencée par son ID cible tout le groupe allié, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_for_all_allies?(id)

> Renvoie true si la technique référencée par son ID cible tous les alliés, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_for_all_dead_allies?(id)

> Renvoie true si la technique référencée par son ID cible tous les alliés morts, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_for_all_enemies?(id)

> Renvoie true si la technique référencée par son ID cible tous les ennemis, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_for_caller?(id)

> Renvoie true si la technique référencée par son ID cible l'utilisateur, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_for_dead_friend?(id)

> Renvoie true si une technique référencée par son ID cible un (ou les) allié(s) mort(s), false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_for_four_random_enemies?(id)

> Renvoie true si la technique référencée par son ID cible quatre ennemis au hasard, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_for_friend?(id)

> Renvoie true si une technique référencée par son ID cible un (ou les) allié(s), false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_for_one?(id)

> Renvoie true si une technique référencée par son ID a une cible unique, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_for_one_ally?(id)

> Renvoie true si la technique référencée par son ID cible un allié, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_for_one_dead_ally?(id)

> Renvoie true si la technique référencée par son ID cible un allié mort, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_for_one_enemy?(id)

> Renvoie true si la technique référencée par son ID cible un ennemi, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_for_one_random_enemy?(id)

> Renvoie true si la technique référencée par son ID cible un ennemi au hasard, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_for_opponent?(id)

> Renvoie true si une technique référencée par son ID cible les ennemis, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_for_random?(id)

> Renvoie true si une technique référencée par son ID cible aléatoirement, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_for_three_random_enemies?(id)

> Renvoie true si la technique référencée par son ID cible trois ennemis au hasard, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_for_two_random_enemies?(id)

> Renvoie true si la technique référencée par son ID cible deux ennemis au hasard, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_has_no_scope?(id)

> Renvoie true si la technique référencée par son ID ne cible personne, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_icon(id)

> Renvoie l'index de l'icone de la technique référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_magical?(id)

> Renvoie true si une technique référencée par son ID endommage les PM, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_menu_usable?(id)

> Renvoie true si la technique référencé par son ID est utilisable dans le menu seulement

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_name(id)

> Renvoie le nom de la technique référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_nb_hits(id)

> Renvoie le nombre de coups portés par la technique référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_need_selection?(id)

> Renvoie true si une technique référencée par son ID requiert la sélection de l'ennemi, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_never_usable?(id)

> Renvoie true si la technique référencé par son ID n'est jamais utilisable

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_note(id)

> Renvoie le commentaire de la base de données de la technique référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_number_of_targets(id)

> Renvoie le nombre de cibles d'une technique référencée par son ID, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_occasion(id)

> Renvoie un entier correspondant au droit d'utilisation de la technique

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_physical?(id)

> Renvoie true si une technique référencée par son ID endommage les PV, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_scope(id)

> Renvoie la portée (en Entier) d'une technique référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la techinuqe  
##### skill_speed(id)

> Renvoie l'apport de vitesse de la technique référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_success_rate(id)

> Renvoie la probabilité de succès de la technique référencée par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
##### skill_tp_gain(id)

> Renvoie le gain de TP que la technique référencée par son ID apporte une fois utilisée en combat

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  
