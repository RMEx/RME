# -*- coding: utf-8 -*-
# Contient la liste des exemples
ASample.new('Informations sur la carte',
  ['map_id', 'map_name', 'map_width', 'map_height'], 9)

ASample.new('Un événement à une position aléatoire',
  ['map_id', 'random', 'id_at', 'map_width', 'map_height', 'event_name'], 10)

ASample.new('Le joueur marchant dans le sable',
  ['player_x', 'player_y', 'terrain_tag'], 11)

ASample.new('Afficher les tiles_id de chaque couche',
  ['player_x', 'player_y', 'tile_id', 'text_show', 'text_change'], 12)

ASample.new('Affiche des buisson aléatoirement toutes les 300 frames sur la carte',
  ['map_width', 'map_height', 'random', 'set_tile'], 13)

  ASample.new('Le joueur est sur la zone 2',
    ['terrain_tag'], 14)
