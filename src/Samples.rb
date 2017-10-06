# -*- coding: utf-8 -*-
# Contient la liste des exemples

if $STAGING

ASample.new('Parcourir simplement un tableau en événement',
['length', 'get'], 27)

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
  ['region_id'], 14)

ASample.new('QTE extrèmement simple', ['qte'], 17)

ASample.new('QTE généré aléatoirement avec choix de la taille de la combinaison',
  ['random_combination', 'get', 'qte'], 15)

ASample.new('QTE infini généré aléatoirement',
  ['pick_random', 'qte'], 16)

ASample.new('Système de saisie de nom customisé',
['event_screen_x', 'event_screen_y', 'actor_name', 'textfield_text_show', 'textfield_activate',
  'key_press?', 'textfield_erase', 'textfield_get_value', 'set_actor_name'], 18)

ASample.new('Jauges en événements',
['actor_hp', 'actor_max_hp', 'percent', 'picture_zoom_x'], 19)

ASample.new('Clignotement de la case pointée par la souris en fonction de son type',
['mouse_square_x', 'mouse_square_y', 'flash_square', 'unflash_square', 'square_passable?', 'player_direction', 'damage_floor?', 'color'], 20)

ASample.new('Renvoyer l"id du tileset courant, et le changer',
['get_tileset_id', 'switch_tileset'], 21)

ASample.new('Afficher progressivement du texte',
['text_show', 'text_progressive'], 22)

ASample.new('Afficher progressivement du texte en jouant un son à chaque caractère',
['text_show', 'text_progressive', 'se_play'], 23)


ASample.new('Faire apparaitre des événéments dans une région',
['get_random_square', 'id_at', 'invoke_event', 'fresh_event_id'], 24)

ASample.new('Flash des tile du même ID sur une carte',
['get_squares_by_tile', 'mouse_click?', 'tile_id', 'mouse_square_x', 'mouse_square_y', 'length', 'get', 'flash_rect', 'unflash_rect'], 25)

ASample.new('Flash des cases du même terrain_tag',
['get_squares_by_terrain', 'length', 'get', 'flash_square'], 26)

ASample.new('Une téléportation stylée',
['perform_transition', 'tone', 'screen_tone', 'wait'], 28)

ASample.new('Une téléportation stylée',
['player_teleport_with_transition'], 29)

ASample.new('Crée un effet de réflexion sur les événements (eau et glace)',
['use_reflection', 'tone'], 30)

ASample.new('Un choix',
['choice'], 31)

ASample.new('Choix + Message',
['choice', 'last_choice'], 32)

ASample.new('Désactive la course quand le joueur est sur la zone 7',
['dash_activate', 'dash_deactivate', 'dash_activate?', 'dash_deactivate?'], 33)

end