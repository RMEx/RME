#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Commandes des techniques**  
- - -  
#Commandes des techniques
Offre des commandes pour obtenir des informations sur les techniques

##Liste des commandes
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


##Description des commandes
##### skill_always_usable?(id)

> Renvoie true si la technique référencé par son ID est utilisable partout

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_battle_usable?(id)

> Renvoie true si la technique référencé par son ID est utilisable en combat

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_certain?(id)

> Renvoie true si une technique référencée par son ID a une garantie de réussite total, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_description(id)

> Renvoie la description la technique référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_for_all?(id)

> Renvoie true si une technique référencée par son ID cible tout le groupe, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_for_all_allies?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise tous les alliés, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_for_all_dead_allies?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise tous les alliés morts, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_for_all_enemies?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise tous les ennemis, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_for_caller?(id)

> Renvoie true si la cible d'une technique référencée par son ID l'utilisateur, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_for_dead_friend?(id)

> Renvoie true si une technique référencée par son ID cible (un ou) les alliés morts, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_for_four_random_enemies?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise quatre ennemis au hasard, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_for_friend?(id)

> Renvoie true si une technique référencée par son ID cible (un ou) les alliés, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_for_one?(id)

> Renvoie true si une technique référencée par son ID cible une cible, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_for_one_ally?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise un allié, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_for_one_dead_ally?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise un allié mort, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_for_one_enemy?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise un ennemi, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_for_one_random_enemy?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise un ennemi au hasard, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_for_opponent?(id)

> Renvoie true si une technique référencée par son ID cible les ennemis, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_for_random?(id)

> Renvoie true si une technique référencée par son ID cible aléatoirement, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_for_three_random_enemies?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise trois ennemis au hasard, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_for_two_random_enemies?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise deux ennemis au hasard, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_has_no_scope?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise personne, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_icon(id)

> Renvoie l'index de l'icone de la technique référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_magical?(id)

> Renvoie true si une technique référencée par son ID produit un dommage magique, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_menu_usable?(id)

> Renvoie true si la technique référencé par son ID est utilisable dans le menu

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_name(id)

> Renvoie le nom de la technique référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_nb_hits(id)

> Renvoie le nombre de coup porté par la technique référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_need_selection?(id)

> Renvoie true si une technique référencée par son ID requiert la sélection de l'ennemi, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_never_usable?(id)

> Renvoie true si la technique référencé par son ID n'est jamais utilisable

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_note(id)

> Renvoie le commentaire de la base de données de la technique référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_number_of_targets(id)

> Renvoie le nombre de cibles d'une technique référencée par son ID produit un dommage magique, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_occasion(id)

> Renvoie un entier correspondant au droit d'utilisation de la technique

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_physical?(id)

> Renvoie true si une technique référencée par son ID produit un dommage physique, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_scope(id)

> Renvoie la portée (en Entier) d'une technique référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la techinuqe  


##### skill_speed(id)

> Renvoie l'apport de vitesse de la technique référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_success_rate(id)

> Renvoie la probabilité de succès de la technique référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_tp_gain(id)

> Renvoie le gain de TP que la technique référencé par son ID apporte une fois utilisé en combat

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


