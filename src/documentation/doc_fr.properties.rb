# coding: utf-8
{
  # Parameters' types
  'doc.Coordinate.description'      => "Coordonées d'un point dans un repère cartésien",
  'doc.Boolean.description'         => 'Valeur booléenne (deux états : vrai ou faux)',
  'doc.PositiveInteger.description' => 'Entier positif',
  'doc.NullablePositiveInteger.description' => 'Entier positif (peut-être nul)',
  'doc.String.description' => "Chaîne de caractères",
  'doc.Direction.description' => "Direction du mouvement (`2` pour le bas, `4` pour la gauche, `6` pour la droite et `8` pour le haut)",
  'doc.RegionId.description' => "Identifiant de région (tiles)",
  'doc.LayerId.description' => "Identifiant de la couche (tiles)",
  'doc.TerrainTag.description' => "Étiquette de terrain (tiles)",
  'doc.ActorId.description' => "Identifiant d'un héros",
  'doc.EquipmentSlot.description' => "Type d'emplacement pour un équipement (Arme => `:Weapon`, Casque => `:Head`, Torse => `:Body`, Bouclier => `:Shield`, Accessoire => `:Accessory`)",
  'doc.ItemId.description' => "Identifiant d'un item (objets, consommables ou pièces d'équipement)",

  # Sections
  'doc.section.Map' => "Commandes relatives aux informations des cartes",
  'doc.section.Actors' => "Offre des commandes pour obtenir des informations sur les acteurs (héros) ",

  # Commands
  ## Map
  'doc.cmd.Map.map_id' => "Renvoie l'ID de la map en cours. Idéalement, utiliser c(:map_id) qui est plus sur!",
  'doc.cmd.Map.map_name' => "Renvoie le nom de la map en cours",
  'doc.cmd.Map.event_at' => "Renvoie l'ID de l'évènement pointé par les coordonnées X,Y (O si c'est le héros, -1 s'il n'y en a pas)",
  'doc.cmd.Map.terrain_tag' => "Renvoie le tag du terrain de la case pointée par les coordonnées X,Y",
  'doc.cmd.Map.tile_id' => "Renvoie l'ID de la tile pointée par les coordonnées X,Y",
  'doc.cmd.Map.set_tile_where' => "Change tous les tile d'une carte selon un ID et un layer",
  'doc.cmd.Map.delete_tiles' => "Supprime tous les tiles référencés par un ID et un layer",
  'doc.cmd.Map.set_tile' => "Change une case de tile",
  'doc.cmd.Map.region_id' => "Renvoie l'ID de la région pointée par les coordonnées X,Y",
  'doc.cmd.Map.square_passable?' => "Renvoie `true` si la case référencée par X, Y est passable dans la direction référencée par `direction`; `false` sinon",
  'doc.cmd.Map.get_tileset_id' => "Renvoie l'ID du tileset de la carte en cours",
  'doc.cmd.Map.dash_activate?' => "Renvoie `true` si la course est activée pour la map en cours, `false` sinon",
  'doc.cmd.Map.dash_deactivate?' => "Renvoie `true` si la course est désactivée pour la map en cours, `true` sinon",
  'doc.cmd.Map.dash_activation' => "Active ou désactive la course sur la map en cours",
  'doc.cmd.Map.dash_activate' => "Active la course sur la map en cours",
  'doc.cmd.Map.dash_deactivate' => "Désactive la course pour la map en cours",
  'doc.cmd.Map.switch_tileset' => "Change le tileset de la carte en cours",
  'doc.cmd.Map.wall?' => "Renvoie `true` si les coordonnées sont sur un mur, `false` sinon",
  'doc.cmd.Map.roof?' => "Renvoie `true` si les coordonnées sont sur un toit, `false` sinon",
  'doc.cmd.Map.stair?' => "Renvoie `true` si les coordonnées sont sur une marche, `false` sinon",
  'doc.cmd.Map.table?' => "Renvoie `true` si les coordonnées sont sur une table, `false` sinon",
  'doc.cmd.Map.ground?' => "Renvoie `true` si les coordonnées sont sur le sol, `false` sinon",
  'doc.cmd.Map.map_width' => "Retourne la largeur de la carte",
  'doc.cmd.Map.map_height' => "Retourne la hauteur de la carte",
  'doc.cmd.Map.boat_passable?' => "Renvoie `true` si l'on peut traverser la case avec le radeau",
  'doc.cmd.Map.ship_passable?' => "Renvoie `true` si l'on peut traverser la case avec le bateau",
  'doc.cmd.Map.autotile_type' => "Renvoie l'ID qui correspond au tile d'autotile aux coordonnées passées en paramètre",
  'doc.cmd.Map.damage_floor?' => "Renvoie `true` si la case référencée par (`x`, `y`) est blessante, `false` sinon",
  'doc.cmd.Map.get_random_square' => "Renvoie un point aléatoire sur la carte, dont la région est référencée par son ID",
  'doc.cmd.Map.get_squares_by_region' => "Renvoie un tableau de cases pour une région donnée",
  'doc.cmd.Map.get_squares_by_tile' => "Renvoie un table de cases pour un tile (et une couche) donnés",
  'doc.cmd.Map.get_squares_by_terrain' => "Renvoie un tableau de cases pour un `terrain_tag` donné",
  ## Actors
  'doc.cmd.Actors.actor_equip' => "Renvoie l'id de l'équipement (dans le slot indiqué) du héros (référencé par son ID)",
  'doc.cmd.Actors.actor_weapon' => "Renvoie l'id de l'arme équipée par le héros référencé par son ID",
  'doc.cmd.Actors.actor_shield' => "Renvoie l'id du bouclier équipé par le héros référencé par son ID",
  'doc.cmd.Actors.actor_head' => "Renvoie l'id du casque équipé par le héros référencé par son ID",
  'doc.cmd.Actors.actor_body' => "Renvoie l'id de l'armure équipée par le héros référencé par son ID",
  'doc.cmd.Actors.actor_description' => "Renvoie la description du héros référencé par son ID",
  'doc.cmd.Actors.actor_accessory' => "Renvoie l'id de l'accessoire équipé par le héros référencé par son ID",
  'doc.cmd.Actors.actor_has_weapon?' => "Renvoie `true` si le héros référencé par son ID est équipé d'une arme; `false` sinon",
  'doc.cmd.Actors.actor_has_shield?' => "Renvoie `true` si le héros référencé par son ID est équipé d'un bouclier; `false` sinon",
  'doc.cmd.Actors.actor_has_head?' => "Renvoie `true` si le héros référencé par son ID est équipé d'un casque; `false` sinon",
  'doc.cmd.Actors.actor_has_body?' => "Renvoie `true` si le héros référencé par son ID est équipé d'une armure; `false` sinon",
  'doc.cmd.Actors.actor_has_accessory?' => "Renvoie `true` si le héros référencé par son ID est équipé d'un accessoire; `false` sinon",
  'doc.cmd.Actors.actor_level' => "Renvoie le niveau du héros référencé par son ID",
  'doc.cmd.Actors.actor_level_max' => "Renvoie le niveau maximum du héros référencé par son ID",
  'doc.cmd.Actors.actor_exp' => "Renvoie les points d'expérience du héros référencé par son ID",
  'doc.cmd.Actors.actor_note' => "Renvoie le commentaire de la base de données du héros référencé par son ID",
  'doc.cmd.Actors.actor_hp' => "Renvoie les points de vie du héros référencé par son ID",
  'doc.cmd.Actors.actor_mp' => "Renvoie les points de magie (mana) du héros référencé par son ID",
  'doc.cmd.Actors.actor_tp' => "Renvoie les points de temps du héros référencé par son ID",
  'doc.cmd.Actors.actor_max_hp' => "Renvoie le nombre de points de vie maximum du héros référencé par son ID",
  'doc.cmd.Actors.actor_max_mp' => "Renvoie le nombre de points de magie (mana) maximum du héros référencé par son ID",
  'doc.cmd.Actors.actor_attack' => "Renvoie les points d'attaque du héros référencé par son ID",
  'doc.cmd.Actors.actor_defense' => "Renvoie les points de défense du héros référencé par son ID",
  'doc.cmd.Actors.actor_magic_attack' => "Renvoie les points d'attaque magique du héros référencé par son ID",
  'doc.cmd.Actors.actor_magic_defense' => "Renvoie les points de défense magique du héros référencé par son ID",
  'doc.cmd.Actors.actor_agility' => "Renvoie les points d'agilité du héros référencé par son ID",
  'doc.cmd.Actors.actor_luck' => "Renvoie les points de chance du héros référencé par son ID",
  'doc.cmd.Actors.actor_hit' => "Renvoie la probabilité de toucher un ennemi pour le héros référencé par son ID",
  'doc.cmd.Actors.actor_evasion_rate' => "Renvoie la probabilité d'esquiver une attaque physique du héros référencé par son ID",
  'doc.cmd.Actors.actor_critical_rate' => "Renvoie la probabilité de coup critique du héros référencé par son ID",
  'doc.cmd.Actors.actor_critical_evasion_rate' => "Renvoie la probabilité de faire un coup critique en préemptif du héros référencé par son ID",
  'doc.cmd.Actors.actor_magical_evasion_rate' => "Renvoie la probabilité d'esquiver une attaque magique pour le héros référencé par son ID",
  'doc.cmd.Actors.actor_magical_reflection_rate' => "Renvoie la probabilité de renvoyer une attaque magique pour le héros référencé par son ID",
  'doc.cmd.Actors.actor_counter_attack_rate' => "Renvoie la probabilité d'un contre (sur une attaque physique) du héros référencé par son ID",
  'doc.cmd.Actors.actor_hp_regeneration_rate' => "Renvoie le pourcentage de régénération de PV à chaque tour du héros référencé par son ID",
  'doc.cmd.Actors.actor_mp_regeneration_rate' => "Renvoie le pourcentage de régénération de MP à chaque tour du héros référencé par son ID",
  'doc.cmd.Actors.actor_tp_regeneration_rate' => "Renvoie le pourcentage de régénération de TP à chaque tour du héros référencé par son ID",
  'doc.cmd.Actors.actor_target_rate' => "Renvoie la probabilité qu'à le héros (référencé par son ID) d'être ciblé par un ennemi",
  'doc.cmd.Actors.actor_guard_effect_rate' => "Renvoie la force de défense (diminution de l'attaque subie) du héros référencé par son ID",
  'doc.cmd.Actors.actor_recovery_effect_rate' => "Renvoie le pourcentage de PV/PM reçu, du héros référencé par son ID",
  'doc.cmd.Actors.actor_pharmacology' => "Renvoie le pourcentrage de PV/PM récupéré via un objet par le héros référencé par son ID",
  'doc.cmd.Actors.actor_mp_cost_rate' => "Renvoie le facteur d'un coût de MP (pour une attaque faisant varier la consommation de MP) du héros référencé par son ID",
  'doc.cmd.Actors.actor_tp_charge_rate' => "Renvoie le facteur de coût de TP (pour une attaque faisant varier la consommation de TP) du héros référencé par son ID",
  'doc.cmd.Actors.actor_physical_damage_rate' => "Renvoie le pourcentage de dégâts physiques reçus par le héros référencé par son ID",
  'doc.cmd.Actors.actor_magical_damage_rate' => "Renvoie le pourcentage de dégâts magiques reçus par le héros référencé par son ID",
  'doc.cmd.Actors.actor_floor_damage_rate' => "Renvoie le pourcentage de dégâts de terrain reçus par le héros référencé par son ID",
  'doc.cmd.Actors.actor_experience_rate' => "Renvoie le pourcentage correspondant à la croissance en points d'expérience du héros référencé par son ID",
  'doc.cmd.Actors.actor_name' => "Renvoie le nom du héros référencé par son ID",
  'doc.cmd.Actors.set_actor_name' => "Modifie le nom du héros référencé par son ID",
  'doc.cmd.Actors.actor_nickname' => "Renvoie le surnom du héros référencé par son ID",
  'doc.cmd.Actors.set_actor_nickname' => "Modifie le surnom du héros référencé par son ID",
  'doc.cmd.Actors.actor_character_name' => "Renvoie le nom du charset du héros référencé par son ID",
  'doc.cmd.Actors.actor_character_index' => "Renvoie l'index du charset du héros référencé par son ID",
  'doc.cmd.Actors.actor_face_name' => "Renvoie le nom du faceset du héros référencé par son ID",
  'doc.cmd.Actors.actor_face_index' => "Renvoie l'index du faceset du héros référencé par son ID",
  'doc.cmd.Actors.actor_class' => "Renvoie l'ID de la classe du héros référencé par son ID",
  'doc.cmd.Actors.actor_exp_for_next_level' => "Renvoie le nombre de points d'expérience nécessaires pour que le héros (référencé par son ID) passe au niveau suivant",

  # Parameters
  ## Map
  'doc.parameter.Map.x' => "Coordonnée X de la case",
  'doc.parameter.Map.y' => "Coordonnée Y de la case",
  'doc.parameter.Map.layer' => "Numéro de la couche",
  'doc.parameter.Map.map_id' => "ID d'une carte, si aucun argument n'est donné, map_id vaut l'id de la map courante",
  'doc.parameter.Map.direction' => "Direction depuis laquelle on souhaite atteindre la case",
  'doc.parameter.Map.set_tile_where.id' => "Id du tile à remplacer",
  'doc.parameter.Map.set_tile_where.new_id' => "Nouvel Id du tile",
  'doc.parameter.Map.delete_tiles.id' => "Id du tile à supprimer",
  'doc.parameter.Map.set_tile.value' => "Valeur du tile (utilisez éventuellement la commande `tile_id`)",
  'doc.parameter.Map.dash_activation.flag' => "`true` pour l'activer, `false` pour la désactiver",
  'doc.parameter.Map.switch_tileset.tileset_id' => "ID du nouveau tileset",
  'doc.parameter.Map.autotile_type.z' => "Couche du tileset",
  'doc.parameter.Map.get_random_square.region_id' => "L'id de la région dans laquelle chercher une case aléatoire. Par défaut, elle vaut 0",
  'doc.parameter.Map.get_squares_by_region.region_id' => "l'ID de la région (entre 0 et 63)",
  'doc.parameter.Map.get_squares_by_tile.tile_id' => "L'ID du tile",
  'doc.parameter.Map.get_squares_by_terrain.terrain_tag' => "Le terrain tag (entre 0 et 7)",
  ## Actors
  'doc.parameter.Actors.actor_id' => "ID de l'acteur",
  'doc.parameter.Actors.slot' => "Slot d'équipement",
  'doc.parameter.Actors.set_actor_name.name' => "Nouveau nom du héros",
  'doc.parameter.Actors.set_actor_nickname.name' => "Nouveau surnom du héros"
}
