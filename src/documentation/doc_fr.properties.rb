# coding: utf-8
{
  # Parameters' types
  'doc.Coordinate.description'      => "Coordonées d'un point dans un repère cartésien",
  'doc.Boolean.description'         => 'Valeur booléenne (deux états : vrai ou faux)',
  'doc.PositiveInteger.description' => 'Entier positif',
  'doc.NullablePositiveInteger.description' => 'Entier positif (peut-être nul)',
  'doc.Direction.description' => "Direction du mouvement (`2` pour le bas, `4` pour la gauche, `6` pour la droite et `8` pour le haut)",

  # Sections
  'doc.section.Map' => "Commandes relatives aux informations des cartes",

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
  'doc.parameter.Map.switch_tileset.tileset_id' => "ID du nouveau tileset"
}
