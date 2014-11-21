#Commandes des techniques
[Retourner à l'index](__command_list.md)

Offre des commandes pour obtenir des informations sur les techniques

##Liste des commandes
*    [skill_always_usable?(id)](#skill_always_usableid)
*    [skill_battle_usable?(id)](#skill_battle_usableid)
*    [skill_for_all_allies?(id)](#skill_for_all_alliesid)
*    [skill_for_all_dead_allies?(id)](#skill_for_all_dead_alliesid)
*    [skill_for_all_enemies?(id)](#skill_for_all_enemiesid)
*    [skill_for_caller?(id)](#skill_for_callerid)
*    [skill_for_four_random_enemies?(id)](#skill_for_four_random_enemiesid)
*    [skill_for_one_ally?(id)](#skill_for_one_allyid)
*    [skill_for_one_dead_ally?(id)](#skill_for_one_dead_allyid)
*    [skill_for_one_enemy?(id)](#skill_for_one_enemyid)
*    [skill_for_one_random_enemy?(id)](#skill_for_one_random_enemyid)
*    [skill_for_three_random_enemies?(id)](#skill_for_three_random_enemiesid)
*    [skill_for_two_random_enemies?(id)](#skill_for_two_random_enemiesid)
*    [skill_menu_usable?(id)](#skill_menu_usableid)
*    [skill_never_usable?(id)](#skill_never_usableid)
*    [skill_occasion(id)](#skill_occasionid)
*    [skill_scope(id)](#skill_scopeid)


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


##### skill_for_four_random_enemies?(id)

> Renvoie true si la cible d'une technique référencée par son ID vise quatre ennemis au hasard, false sinon

  
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


##### skill_menu_usable?(id)

> Renvoie true si la technique référencé par son ID est utilisable dans le menu

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_never_usable?(id)

> Renvoie true si la technique référencé par son ID n'est jamais utilisable

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_occasion(id)

> Renvoie un entier correspondant au droit d'utilisation de la technique

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la technique  


##### skill_scope(id)

> Renvoie la portée (en Entier) d'une technique référencée par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de la techinuqe  


