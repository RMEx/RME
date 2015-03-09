#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Commandes relatives aux groupes**  
- - -  
#Commandes relatives aux groupes
Informations sur les groupes de monstres

##Liste des commandes
*    [troop_member(id, position)](#troop_memberid-position)
*    [troop_member_x(id, position)](#troop_member_xid-position)
*    [troop_member_y(id, position)](#troop_member_yid-position)
*    [troop_members(id)](#troop_membersid)
*    [troop_name(id)](#troop_nameid)
*    [troop_size(id)](#troop_sizeid)


##Description des commandes
##### troop_member(id, position)

> Renvoie l'id d'un monstre d'un groupe de monstre référencé par son ID et par sa position (0 = premier).

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du groupe de monstre  
`position`|`Fixnum`|Position du monstre  


##### troop_member_x(id, position)

> Renvoie la position X d'un monstre d'un groupe de monstre référencé par son ID et par sa position (0 = premier) tel que défini dans la base de données.

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du groupe de monstre  
`position`|`Fixnum`|Position du monstre  


##### troop_member_y(id, position)

> Renvoie la position Y d'un monstre d'un groupe de monstre référencé par son ID et par sa position (0 = premier) tel que défini dans la base de données.

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du groupe de monstre  
`position`|`Fixnum`|Position du monstre  


##### troop_members(id)

> Renvoie un tableau des enemy_id  d'un groupe de monstres référencé par son ID.

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du groupe de monstre  


##### troop_name(id)

> Renvoie le nom d'un groupe de monstres référencé par son ID.

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du groupe de monstre  


##### troop_size(id)

> Renvoie la taille d'un groupe de monstres référencé par son ID.

  
> Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du groupe de monstre  


