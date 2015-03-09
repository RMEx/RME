#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Commandes relatives aux objets**  
- - -  
#Commandes relatives aux objets
Commandes permettant d'obtenir ou de manipuler les objets

##Liste des commandes
*    [give_item(id, amount)](#give_itemid-amount)
*    [has_item?(id)](#has_itemid)
*    [is_key_item?(id)](#is_key_itemid)
*    [item_always_usable?(id)](#item_always_usableid)
*    [item_battle_usable?(id)](#item_battle_usableid)
*    [item_certain?(id)](#item_certainid)
*    [item_consumable?(id)](#item_consumableid)
*    [item_count(id)](#item_countid)
*    [item_description(id)](#item_descriptionid)
*    [item_for_all?(id)](#item_for_allid)
*    [item_for_all_allies?(id)](#item_for_all_alliesid)
*    [item_for_all_dead_allies?(id)](#item_for_all_dead_alliesid)
*    [item_for_all_enemies?(id)](#item_for_all_enemiesid)
*    [item_for_caller?(id)](#item_for_callerid)
*    [item_for_dead_friend?(id)](#item_for_dead_friendid)
*    [item_for_four_random_enemies?(id)](#item_for_four_random_enemiesid)
*    [item_for_friend?(id)](#item_for_friendid)
*    [item_for_one?(id)](#item_for_oneid)
*    [item_for_one_ally?(id)](#item_for_one_allyid)
*    [item_for_one_dead_ally?(id)](#item_for_one_dead_allyid)
*    [item_for_one_enemy?(id)](#item_for_one_enemyid)
*    [item_for_one_random_enemy?(id)](#item_for_one_random_enemyid)
*    [item_for_opponent?(id)](#item_for_opponentid)
*    [item_for_random?(id)](#item_for_randomid)
*    [item_for_three_random_enemies?(id)](#item_for_three_random_enemiesid)
*    [item_for_two_random_enemies?(id)](#item_for_two_random_enemiesid)
*    [item_has_no_scope?(id)](#item_has_no_scopeid)
*    [item_icon(id)](#item_iconid)
*    [item_magical?(id)](#item_magicalid)
*    [item_menu_usable?(id)](#item_menu_usableid)
*    [item_name(id)](#item_nameid)
*    [item_nb_hits(id)](#item_nb_hitsid)
*    [item_need_selection?(id)](#item_need_selectionid)
*    [item_never_usable?(id)](#item_never_usableid)
*    [item_note(id)](#item_noteid)
*    [item_number_of_targets(id)](#item_number_of_targetsid)
*    [item_occasion(id)](#item_occasionid)
*    [item_physical?(id)](#item_physicalid)
*    [item_price(id)](#item_priceid)
*    [item_scope(id)](#item_scopeid)
*    [item_speed(id)](#item_speedid)
*    [item_success_rate(id)](#item_success_rateid)
*    [item_tp_gain(id)](#item_tp_gainid)


##Description des commandes
##### give_item(id, amount)

> Fait gagner à l'équipe l'objet référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  
`amount`|`Fixnum`|Nombre à donner. Si le nombre est négatif, l'objet sera retiré  


##### has_item?(id)

> Renvoie true si l'objet référencé par son ID est possédé par l'équipe, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


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


##### item_certain?(id)

> Renvoie true si un objet référencée par son ID a une garantie de réussite total, false sinon

  
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


##### item_for_all?(id)

> Renvoie true si un objet référencée par son ID cible tout le groupe, false sinon

  
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

> Renvoie true si la cible d'un objet référencée par son ID , false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_for_dead_friend?(id)

> Renvoie true si un objet référencée par son ID cible (un ou) les alliés morts, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_for_four_random_enemies?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise quatre ennemis au hasard, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_for_friend?(id)

> Renvoie true si un objet référencée par son ID cible (un ou) les alliés, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_for_one?(id)

> Renvoie true si un objet référencée par son ID cible une cible, false sinon

  
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


##### item_for_opponent?(id)

> Renvoie true si un objet référencée par son ID cible les ennemis, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_for_random?(id)

> Renvoie true si un objet référencée par son ID cible aléatoirement, false sinon

  
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


##### item_has_no_scope?(id)

> Renvoie true si la cible d'un objet référencée par son ID vise personne, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_icon(id)

> Renvoie l'index de l'icone de l'objet référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_magical?(id)

> Renvoie true si un objet référencée par son ID produit un dommage magique, false sinon

  
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


##### item_nb_hits(id)

> Renvoie le nombre de coup porté par l'objet référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_need_selection?(id)

> Renvoie true si un objet référencée par son ID requiert la sélection de l'ennemi, false sinon

  
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


##### item_number_of_targets(id)

> Renvoie le nombre de cibles d'un objet référencée par son ID produit un dommage magique, false sinon

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_occasion(id)

> Renvoie un entier correspondant au droit d'utilisation de l'objet

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_physical?(id)

> Renvoie true si un objet référencée par son ID produit un dommage physique, false sinon

  
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


##### item_speed(id)

> Renvoie l'apport de vitesse de l'objet référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_success_rate(id)

> Renvoie la probabilité de succès de l'objet référencé par son ID

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


##### item_tp_gain(id)

> Renvoie le gain de TP que l'objet référencé par son ID apporte une fois utilisé en combat

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id de l'objet  


