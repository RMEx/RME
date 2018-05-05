# coding: utf-8
{
  # Parameters' types
  'doc.Coordinate.description'      => "Coordonées d'un point dans un repère cartésien",
  'doc.Boolean.description'         => 'Valeur booléenne (deux états : vrai ou faux)',
  'doc.PositiveInteger.description' => 'Entier positif',
  'doc.NullablePositiveInteger.description' => 'Entier positif (peut-être nul)',

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

  # Parameters
  ## Map
  'doc.parameter.Map.x' => "Coordonnée X de la case",
  'doc.parameter.Map.y' => "Coordonnée Y de la case",
  'doc.parameter.Map.layer' => "Numéro de la couche",
  'doc.parameter.Map.map_id' => "ID d'une carte, si aucun argument n'est donné, map_id vaut l'id de la map courante",
  'doc.parameter.Map.set_tile_where.id' => "Id du tile à remplacer",
  'doc.parameter.Map.set_tile_where.new_id' => "Nouvel Id du tile"
}
