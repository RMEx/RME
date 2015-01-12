# -*- coding: utf-8 -*-

# Ce script ne sert qu'a générer un comparatif 
# entre les commandes EE4 et RME

module EE4
	#==============================================================================
	# ** Command_Description
	#------------------------------------------------------------------------------
	# Description of commands
	#==============================================================================

	module Command_Description
	  KEYS_ACCESS = [:backspace,:clear,:enter,:shift,:ctrl,:alt,
	    :pause,:caps_lock,:esc,:space,:page_up,:page_down,:end,
	    :home,:left,:up,:right,:down,:select,:print,:execute,
	    :help,:zero,:one,:two,:three,:four,:five,:six,:seven,
	    :eight,:nine,:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,
	    :o,:p,:q,:r,:s,:t,:u,:v,:w,:x,:y,:z,:lwindow,:rwindow,
	    :apps,:num_zero,:num_one,:num_two,:num_three,:num_four,
	    :num_five,:num_six,:num_seven,:num_eight,:num_nine,:add,
	    :substract,:divide,:decimal,:multiply,:separator,:f1,:f2,
	    :f3,:f4,:f5,:f6,:f7,:f8,:f9,:f10,:f11,:f12,:num_lock,
	    :scroll_lock,:lshift,:rshift,:lcontrol,:rcontrol,:lmenu,
	    :rmenu,:circumflex,:dollar,:close_parenthesis,:u_grav,
	    :square,:less_than,:colon,:semicolon,:equal,:comma,:minus,
	    :delete,:snapshot,:insert]
      extend self
	  #--------------------------------------------------------------------------
	  # * Description of standard commands
	  #--------------------------------------------------------------------------
	  
	  def random
	    {description:"Renvoi un nombre aléatoire compris entre Minimum et Maximum",
	      args:[
	         {name:"Minimum", type: :int}, 
	         {name:"Maximum", type: :int}
	      ],
	      returnable: true}
	  end
	  def region_id
	    {description:"Renvoi la région défini sur les coordonnées passées en argument",
	      args:[
	         {name:"X", type: :int}, 
	         {name:"Y", type: :int}
	      ],
	      returnable: true}
	  end

	  def terrain_tag
	    {description:"Renvoi le ta de terrain défini sur les coordonnées passées en argument",
	      args:[
	         {name:"X", type: :int}, 
	         {name:"Y", type: :int}
	      ],
	      returnable: true}
	  end
	  def terrain_tag
	    {description:"Renvoi le ta de terrain défini sur les coordonnées passées en argument",
	      args:[
	         {name:"X", type: :int}, 
	         {name:"Y", type: :int}
	      ],
	      returnable: true}
	  end
	  def id_at
	    {description:"Renvoi l'id de l'évènement à la position donnée. -1 s'il ny en a pas",
	      args:[
	         {name:"X", type: :int}, 
	         {name:"Y", type: :int},
	         {name:"Couche", type: :int}
	      ],
	      returnable: true}
	  end
	  def map_id
	    {description:"Renvoi l'id de la map jouée", returnable: true}
	  end
	  def max_event_id
	    {description:"Renvoi le plus grand ID d'évènement de la carte", returnable: true}
	  end
	  def percent
	    {description:"Renvoi le pourcentage de la valeur1 par rapport à la valeur2",
	      args:[{name:"valeur1", type: :int}, {name:"valeur2", type: :int}],
	      returnable: true}
	  end
	  def color
	    {description:"Renvoi un objet color selon les valeurs passées",
	      args:[{name:"rouge", type: :int}, {name:"vert", type: :int}, 
	        {name:"bleu", type: :int}, {name:"alpha", type: :int, default: 255}],
	      returnable: true}
	  end
	  def square_passable?
	    {description:"Vérifie si une case est passable",
	      args:[{name:"X", type: :int}, {name:"Y", type: :int}, 
	        {name:"direction", type: :int, default: 2}],
	      returnable: true}
	  end
	  def team_size
	    {description:"Renvoi le nombre de membres de l'équipe", returnable: true}
	  end
	  def gold
	    {description:"Renvoi l'argent possédé par l'équipe", returnable: true}
	  end
	  def steps
	    {description:"Renvoi le nombre de pas effectué par l'équipe", returnable: true}
	  end
	  def play_time
	    {description:"Renvoi la durée de la partie", returnable: true}
	  end
	  def timer
	    {description:"Renvoi la valeur du chronomètre", returnable: true}
	  end
	  def save_count
	    {description:"Renvoi le nombre de sauvegarde effectuées", returnable: true}
	  end
	  def battle_count
	    {description:"Renvoi le nombre de combats effectuées", returnable: true}
	  end
	  def item_count
	    {description:"Renvoi le nombre d'objets possédés en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def weapon_count
	    {description:"Renvoi le nombre d'armes possédées en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def armor_count
	    {description:"Renvoi le nombre d'armures possédées en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def item_name
	    {description:"Renvoi le nom d'un objets en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def weapon_name
	    {description:"Renvoi le nom d'une arme en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def armor_name
	    {description:"Renvoi le nom d'une armure en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def actor_level
	    {description:"Renvoi le niveau d'un acteur en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def actor_experience
	    {description:"Renvoi l'expérience' d'un acteur en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def actor_hp
	    {description:"Renvoi le nombre de PV d'un acteur en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def actor_mp
	    {description:"Renvoi le nombre de MP d'un acteur en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def actor_max_hp
	    {description:"Renvoi le nombre maximum de PV d'un acteur en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def actor_max_mp
	    {description:"Renvoi le nombre maximum de MP d'un acteur en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def actor_defense
	    {description:"Renvoi le nombre de points de défense d'un acteur en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def actor_magic
	    {description:"Renvoi le nombre de points de magie d'un acteur en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def actor_magic_defense
	    {description:"Renvoi le nombre de points de magie maximum d'un acteur en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def actor_agility
	    {description:"Renvoi le nombre de points d'agilité' d'un acteur en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def actor_luck
	    {description:"Renvoi le nombre de points de chance d'un acteur en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def set_actor_name
	    {description:"Modifie le nom de l'acteur référencé par son ID par la valeur de Name", 
	      args:[{name:"ID", type: :int}, {name:"Name", type: :string}],
	      returnable: false}
	  end
	  def actor_name
	    {description:"Renvoi le nom de l'acteur référencé par son ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def monster_hp
	    {description:"Renvoi le nombre de PV d'un ennemi en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def monster_mp
	    {description:"Renvoi le nombre de MP d'un ennemi en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def monster_attack
	    {description:"Renvoi le nombre de points d'attaque d'un ennemi en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def monster_defense
	    {description:"Renvoi le nombre de points de défense d'un ennemi en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def monster_magic_attack
	    {description:"Renvoi le nombre de points d'attaque magique d'un ennemi en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def monster_magic_defense
	    {description:"Renvoi le nombre de points de défense magique d'un ennemi en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def monster_agility
	    {description:"Renvoi le nombre de points d'agilité d'un ennemi en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def monster_luck
	    {description:"Renvoi le nombre de points de chance d'un ennemi en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def monster_name
	    {description:"Renvoi le nom d'un ennemi en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def troop_size
	    {description:"Renvoi le nombre d'ennemis d'un groupe en fonction d'un ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def troop_member_id
	    {description:"Renvoi l'ID d'un ennemi en fonction de sa position dans un groupe en fonction d'un ID", 
	      args:[{name:"ID", type: :int}, {name:"Position", type: :int}],
	      returnable: true}
	  end
	  def troop_member_x
	    {description:"Renvoi la position X (tel que défini dans la BDD) d'un ennemi en fonction de sa position dans un groupe en fonction d'un ID", 
	      args:[{name:"ID", type: :int}, {name:"Position", type: :int}],
	      returnable: true}
	  end
	  def troop_member_y
	    {description:"Renvoi la position Y (tel que défini dans la BDD) d'un ennemi en fonction de sa position dans un groupe en fonction d'un ID", 
	      args:[{name:"ID", type: :int}, {name:"Position", type: :int}],
	      returnable: true}
	  end
	  def mouse_x
	    {description:"Renvoi la coordonnées X de la souris (en pixel)", returnable: true}
	  end
	  def mouse_y
	    {description:"Renvoi la coordonnées Y de la souris (en pixel)", returnable: true}
	  end
	  def mouse_x_square
	    {description:"Renvoi la coordonnées X de la souris (en case)", returnable: true}
	  end
	  def mouse_y_square
	    {description:"Renvoi la coordonnées Y de la souris (en case)", returnable: true}
	  end
	  def mouse_click?
	    {description:"Renvoi True si la touche passée en argument est enfoncée, false sinon", 
	      args:[{name:"Touche", type: :enum, enum:[:mouse_left, :mouse_center, :mouse_right]}],
	      returnable: true}
	  end
	  def mouse_trigger?
	    {description:"Renvoi True si la touche passée en argument vient d'être pressée, false sinon", 
	      args:[{name:"Touche", type: :enum, enum:[:mouse_left, :mouse_center, :mouse_right]}],
	      returnable: true}
	  end
	  def mouse_repeat?
	    {description:"Renvoi True si la touche passée en argument est enfoncée de manière répetée, false sinon", 
	      args:[{name:"Touche", type: :enum, enum:[:mouse_left, :mouse_center, :mouse_right]}],
	      returnable: true}
	  end
	  def mouse_release?
	    {description:"Renvoi True si la touche passée en argument vient d'être relachée, false sinon", 
	      args:[{name:"Touche", type: :enum, enum:[:mouse_left, :mouse_center, :mouse_right]}],
	      returnable: true}
	  end
	  def mouse_rect
	    {description:"Renvoi le rectangle de sélection de la souris", returnable: true}
	  end
	  def point_in_mouse_rect?
	    {description:"Renvoi true si un point (référencé par X et Y) est dans le rectangle de sélection, false sinon", 
	      args:[{name:"X", type: :int}, {name:"Y", type: :int}],
	      returnable: true}
	  end
	  def mouse_hover_event?
	    {description:"Renvoi true si la souris survol un évènement (référencé par son ID), false sinon", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def mouse_clicked_event?
	    {description:"Renvoi true si la souris clic sur un évènement (référencé par son ID), false sinon", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def mouse_hover_player?
	    {description:"Renvoi true si la souris survol le joueur", 
	      returnable: true}
	  end
	  def mouse_clicked_player?
	    {description:"Renvoi true si la souris clic le joueur", 
	      returnable: true}
	  end
	  def last_clicked_event
	    {description:"Renvoi l'ID du dernier évènement cliqué", 
	      returnable: true}
	  end
	  def show_cursor_system
	    {description:"Active (true) ou désactive (false) le curseur de Windows", 
	      args:[{name:"Activation?", type: :bool}]}
	  end
	  def key_press?
	    {description:"Renvoi True si la touche passée en argument est enfoncée, false sinon", 
	      args:[{name:"Touche", type: :enum, enum:KEYS_ACCESS}],
	      returnable: true}
	  end
	  def key_trigger?
	    {description:"Renvoi True si la touche passée en argument vient d'être pressée, false sinon", 
	      args:[{name:"Touche", type: :enum, enum:KEYS_ACCESS}],
	      returnable: true}
	  end
	  def key_repeat?
	    {description:"Renvoi True si la touche passée en argument est enfoncée de manière répetée, false sinon", 
	      args:[{name:"Touche", type: :enum, enum:KEYS_ACCESS}],
	      returnable: true}
	  end
	  def key_release?
	    {description:"Renvoi True si la touche passée en argument vient d'être relachée, false sinon", 
	      args:[{name:"Touche", type: :enum, enum:KEYS_ACCESS}],
	      returnable: true}
	  end
	  def caps_lock?
	    {description:"Renvoi true si le clavier est en CAPS LOCK, false sinon", 
	      returnable: true}
	  end
	  def num_lock?
	    {description:"Renvoi true si le clavier est en NUM LOCK, false sinon", 
	      returnable: true}
	  end
	  def scroll_lock?
	    {description:"Renvoi true si le clavier est en SCROLL LOCK, false sinon", 
	      returnable: true}
	  end
	  def maj?
	    {description:"Renvoi true si le clavier est en mode majuscule, false sinon", 
	      returnable: true}
	  end
	  def alt_gr?
	    {description:"Renvoi true si la combinaison ALT+GR est enfoncée, false sinon", 
	      returnable: true}
	  end
	  def key_number
	    {description:"Renvoi le numéro pressé au clavier, nil si aucun chiffre n'est pressé", 
	      returnable: true}
	  end
	  def key_char?
	    {description:"Renvoi le caractère pressé au clavier, ne renvoi aucun caractère sinon", 
	      returnable: true}
	  end
	  def event_x
	    {description:"Renvoi la position X (en case) d'un évènement en fonction de son ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def event_y
	    {description:"Renvoi la position Y (en case) d'un évènement en fonction de son ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def event_screen_x
	    {description:"Renvoi la position X (en pixel par rapport à l'écran) d'un évènement en fonction de son ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def event_pixel_x
	    {description:"Renvoi la position X (en pixel) d'un évènement en fonction de son ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def event_pixel_y
	    {description:"Renvoi la position Y (en pixel) d'un évènement en fonction de son ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def event_screen_y
	    {description:"Renvoi la position Y (en pixel par rapport à l'écran) d'un évènement en fonction de son ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def event_direction
	    {description:"Renvoi la direction (2,4,6,8) d'un évènement en fonction de son ID", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def player_x
	    {description:"Renvoi la position X (en case) du joueur", 
	      returnable: true}
	  end
	  def player_y
	    {description:"Renvoi la position Y (en case) du joueur", 
	      returnable: true}
	  end
	  def player_pixel_x
	    {description:"Renvoi la position X en pixel du joueur", 
	      returnable: true}
	  end
	  def player_pixel_y
	    {description:"Renvoi la position Y en pixel du joueur", 
	      returnable: true}
	  end
	  def player_screen_x
	    {description:"Renvoi la position X (en pixel par rapport à l'écran) du joueur", 
	      returnable: true}
	  end
	  def player_screen_y
	    {description:"Renvoi la position Y (en pixel par rapport à l'écran) du joueur", 
	      returnable: true}
	  end
	  def player_direction
	    {description:"Renvoi la direction (2,4,6,8) du joueur", 
	      returnable: true}
	  end
	  def look_at
	    {description:"Renvoi true si ID 1 regarde ID 2, false sinon", 
	      args:[{name:"ID 1", type: :int},
	        {name:"ID 2", type: :int},
	        {name:"portee", type: :int},
	        {name:"Unites", type: :enum, enum:[:square, :pixel]}],
	      returnable: true}
	  end
	  def squares_between
	    {description:"Renvoi le nombre de cases entre deux évènements (référencés via leurs ID, 0 pour le héros)", 
	      args:[{name:"ID 1", type: :int},{name:"ID 2", type: :int}],
	      returnable: true}
	  end
	  def pixels_between
	    {description:"Renvoi le nombre de pixels entre deux évènements (référencés via leurs ID, 0 pour le héros)", 
	      args:[{name:"ID 1", type: :int},{name:"ID 2", type: :int}],
	      returnable: true}
	  end
	  def move_to
	    {description:"Déplace l'évènement (référencé par son ID, 0 pour le héros) vers la case référencée par X et Y", 
	      args:[{name:"ID", type: :int},{name:"X", type: :int}, {name:"y", type: :int}, {name:"Attendre?", type: :bool}]}
	  end
	  def jump_to
	    {description:"fait sauter l'évènement (référencé par son ID, 0 pour le héros) vers la case référencée par X et Y", 
	      args:[{name:"ID", type: :int},{name:"X", type: :int}, {name:"y", type: :int}, {name:"Attendre?", type: :bool}]}
	  end
	  def buzz
	    {description:"fait tressaillir l'évènement (référencé par son ID, 0 pour le héros) ", 
	      args:[{name:"ID", type: :int}]}
	  end
	  def collide?
	    {description:"Renvoi true si  deux évènements (référencés par leurs ID's, 0 pour le héros) sont en collision, false sinon", 
	      args:[{name:"ID 1", type: :int}, {name:"ID 2", type: :int}],
	      returnable: true}
	  end
	  def event_in_screen?
	    {description:"Renvoi true si l'évènement (référencé par son ID) est dans l'écran", 
	      args:[{name:"ID", type: :int}],
	      returnable: true}
	  end
	  def player_in_screen?
	    {description:"Renvoi true si le joueur est dans l'écran", 
	      returnable: true}
	  end
	  def picture_show
	    {description:"Affiche l'image", 
	      args:[
	        {name:"ID", type: :int}, 
	        {name:"Nom de l'image", type: :string},
	        {name:"X", type: :int, default: 0},
	        {name:"Y", type: :int, default: 0},
	        {name:"Origine (0 = H-G, 1 = centre)", type: :int, default: 0},
	        {name:"zoom X", type: :int, default: 100},
	        {name:"zoom Y", type: :int, default: 100},
	        {name:"Opacité", type: :int, default: 255},
	        {name:"Mode de fusion (0 normal, 1 addition, 2 soustraction)", type: :int, default: 0}
	        ]}
	  end
	  def picture_origine
	    {description:"Modifie l'origine d'une image (référencée par son ID)", 
	      args:[{name:"ID", type: :int}, {name:"Origine", type: :int}]}
	  end
	  def picture_x
	    {description:"Modifie la position X d'une image (référencée par son ID)", 
	      args:[{name:"ID", type: :int}, {name:"X", type: :int}]}
	  end
	  def picture_y
	    {description:"Modifie la position Y d'une image (référencée par son ID)", 
	      args:[{name:"ID", type: :int}, {name:"Y", type: :int}]}
	  end
	  def picture_position
	    {description:"Modifie la position d'une image (référencée par son ID)", 
	      args:[{name:"ID", type: :int}, {name:"X", type: :int}, {name:"Y", type: :int}]}
	  end
	  def picture_move
	    {description:"Déplace l'image (référencée par son ID), les valeurs -1 gardent leurs valeurs initiales", 
	      args:[
	        {name:"ID", type: :int}, 
	        {name:"X", type: :int, default: 0},
	        {name:"Y", type: :int, default: 0},
	        {name:"zoom X", type: :int, default: 100},
	        {name:"zoom Y", type: :int, default: 100},
	        {name:"Durée", type: :int, default: 60},
	        {name:"Opacité", type: :int, default: -1},
	        {name:"Mode de fusion (0 normal, 1 addition, 2 soustraction)", type: :int, default: -1},
	        {name:"Origine (0 = H-G, 1 = centre)", type: :int, default: -1}
	        ]}
	  end
	  def picture_wave
	    {description:"Fait onduler une image (Référencée par son ID) en fonction d'une amplitude et d'une vitesse", 
	      args:[{name:"ID", type: :int}, {name:"Amplitude", type: :int}, {name:"Vitesse", type: :int}]}
	  end
	  def picture_flip
	    {description:"Applique une symétrie orthogonale (Axe vertical) à une image (référencée par son ID)", 
	      args:[{name:"ID", type: :int}]}
	  end
	  def picture_angle
	    {description:"Modifie l'angle d'inclinaison d'une image (référencée par son ID)", 
	      args:[{name:"ID", type: :int}, {name:"Angle", type: :int}]}
	  end
	  def picture_rotate
	    {description:"Fait tourner une image (référencée par son ID) à une certaine vitesse", 
	      args:[{name:"ID", type: :int}, {name:"Vitesse", type: :int}]}
	  end
	  def picture_zoom_x
	    {description:"Modifie le zoom X d'une image (référencée par son ID)", 
	      args:[{name:"ID", type: :int}, {name:"Zoom X", type: :int, default: 100}]}
	  end
	  def picture_zoom_y
	    {description:"Modifie le zoom Y d'une image (référencée par son ID)", 
	      args:[{name:"ID", type: :int}, {name:"Zoom Y", type: :int, default: 100}]}
	  end
	  def picture_zoom
	    {description:"Modifie le zoom d'une image (référencée par son ID), si Zoom Y vaut -1 il prendra la même taille que Zoom X", 
	      args:[{name:"ID", type: :int}, {name:"Zoom X", type: :int, default: 100}, {name:"Zoom Y", type: :int, default: -1}]}
	  end
	  def picture_tone
	    {description:"Modifie la teinte d'une image (référencée par son ID)", 
	      args:[
	        {name:"ID", type: :int}, 
	        {name:"Rouge", type: :int, default: 0},
	        {name:"Vert", type: :int, default: 0},
	        {name:"Bleu", type: :int, default: 0}, 
	        {name:"Gris", type: :int, default: 0}
	        ]}
	  end
	  def picture_blend
	    {description:"Modifie le mode de fusion d'une image (référencée par son ID) (0 => normal, 1 addition, 2 soustraction)", 
	      args:[{name:"ID", type: :int}, {name:"Mode de fusion", type: :int, default: 0}]}
	  end
	  def picture_pin
	    {description:"Fixe le défilement d'une image (référencée par son ID) sur la carte", 
	      args:[{name:"ID", type: :int}]}
	  end
	  def picture_detach
	    {description:"Annule le fixe du défilement d'une image (référencée par son ID) sur la carte", 
	      args:[{name:"ID", type: :int}]}
	  end
	  def picture_shake
	    {description:"Fait trembler une image (référencée par son ID)", 
	      args:[{name:"ID", type: :int}, {name:"Force", type: :int}, {name:"Vitesse", type: :int}, {name:"Durée", type: :int}]}
	  end
	  def picture_show_enemy
	    {description:"Affiche un ennemi en image en fonction de ses positions de la base de données", 
	      args:[
	        {name:"ID Image", type: :int},
	        {name:"ID du groupe", type: :int},
	        {name:"Position du monstre", type: :int}
	        ]}
	  end
	  def picture_text
	    {description:"Affiche un text sur un emplacement image (en fonction de son ID)", 
	      args:[
	        {name:"ID Image", type: :int},
	        {name:"Texte", type: :string},
	        {name:"X", type: :int},
	        {name:"y", type: :int},
	        {name:"Taille", type: :int, default: Font.default_size},
	        {name:"Police", type: :string, default: Font.default_name},
	        {name:"Color (Utilisez le formatage Libre et la commande 'color')", type: :none},
	        {name:"Gras ?", type: :bool},
	        {name:"Italique ?", type: :bool},
	        {name:"Contour ?", type: :bool},
	        {name:"Color contour (Utilisez le formatage Libre et la commande 'color')", type: :none},
	        {name:"Ombre ?", type: :bool}
	        ]}
	  end
	  def picture_screen
	    {description:"Prend une capture d'écran sur une image (référencée par son ID)", 
	      args:[{name:"ID", type: :int}]}
	  end
	  def picture_erase
	    {description:"Supprime une image (référencée par son ID)", 
	      args:[{name:"ID", type: :int}]}
	  end
	  def picture_opacity
	    {description:"Modifie l'opacité d'une image (référencée par son ID)", 
	      args:[{name:"ID", type: :int}, {name:"Valeur", type: :int}]}
	  end
	  def parallax_show
	    {description:"Crée un panorama", 
	      args:[
	        {name:"ID", type: :int},
	        {name:"Nom de l'image", type: :string},
	        {name:"Axe Z", type: :int, default: -100},
	        {name:"Opacité", type: :int, default: 255},
	        {name:"Vitesse automatique X", type: :int},
	        {name:"Vitesse automatique Y", type: :int},
	        {name:"Défilement X", type: :int},
	        {name:"Défilement Y", type: :int}
	        ]}
	  end
	  def parallax_erase
	    {description:"Supprime un panorama (référencée par son ID)", 
	      args:[{name:"ID", type: :int}]}
	  end
	  def parallax_z
	    {description:"change l'axe Z d'un panorama (référencée par son ID)", 
	      args:[{name:"ID", type: :int}, {name:"Axe Z", type: :int}]}
	  end
	  def parallax_opacity
	    {description:"change l'opacité d'un panorama (référencée par son ID)", 
	      args:[{name:"ID", type: :int}, {name:"Opacité", type: :int, default: 255}]}
	  end
	  def parallax_autoscroll
	    {description:"change la vitesse de défilement automatique d'un panorama (référencée par son ID)", 
	      args:[{name:"ID", type: :int}, {name:"Vitesse X", type: :int}, {name:"Vitesse Y", type: :int}]}
	  end
	  def parallax_scrollspeed
	    {description:"change la vitesse de défilement d'un panorama (référencée par son ID)", 
	      args:[{name:"ID", type: :int}, {name:"Vitesse X", type: :int}, {name:"Vitesse Y", type: :int}]}
	  end
	  def parallax_zoom_x
	    {description:"change le zoom X d'un panorama (référencée par son ID)", 
	      args:[{name:"ID", type: :int}, {name:"Zoom X", type: :int}]}
	  end
	  def parallax_zoom_y
	    {description:"change le zoom Y d'un panorama (référencée par son ID)", 
	      args:[{name:"ID", type: :int}, {name:"Zoom Y", type: :int}]}
	  end
	  def parallax_zoom
	    {description:"change le zoom d'un panorama (référencée par son ID), si le Zoom Y vaut -1 il prendra la valeur du Zoom X", 
	      args:[{name:"ID", type: :int}, {name:"Zoom X", type: :int, default: 100}, {name:"Zoom Y", type: :int, default: -1}]}
	  end
	  def parallax_blend
	    {description:"change le mode de fusion d'un panorama (référencée par son ID)", 
	      args:[{name:"ID", type: :int}, {name:"Mode (0: normal, 1:add, 2:sub)", type: :int, default: 0}]}
	  end
	  def parallax_tone
	    {description:"Modifie la teinte d'un panorama (référencé par son ID)", 
	      args:[
	        {name:"ID", type: :int}, 
	        {name:"Rouge", type: :int, default: 0},
	        {name:"Vert", type: :int, default: 0},
	        {name:"Bleu", type: :int, default: 0}, 
	        {name:"Gris", type: :int, default: 0}
	        ]}
	  end
	  def time_year
	    {description:"Renvoi l'année actuelle", 
	      returnable: true}
	  end
	  def time_month
	    {description:"Renvoi le mois actuel (1-12)", 
	      returnable: true}
	  end
	  def time_day
	    {description:"Renvoi le jours du mois actuel (1-31)", 
	      returnable: true}
	  end
	  def time_hour
	    {description:"Renvoi l'heure courante (1->24/0)", 
	      returnable: true}
	  end
	  def time_min
	    {description:"Renvoi la minute courante (0->60)", 
	      returnable: true}
	  end
	  def time_sec
	    {description:"Renvoi la seconde courante (0->60)", 
	      returnable: true}
	  end
	  def save_game
	    {description:"Sauvegarde le jeu sur l'emplacement ID", 
	      args:[{name:"Numéro de sauvegarde", type: :int}]}
	  end
	  def load_game
	    {description:"Charge la partie en fonction d'un ID", 
	      args:[{name:"Numéro de sauvegarde", type: :int},{name:"Durée de transition", type: :int, default: 100}],
	      returnable: true}
	  end
	  def save_exists?
	    {description:"Renvoie true si la sauvegarde numéroté existe, false sinon", 
	      args:[{name:"Numéro de sauvegarde", type: :int}]}
	  end
	  def delete_save
	    {description:"Supprime la sauvegarde via son numéro", 
	      args:[{name:"Numéro de sauvegarde", type: :int}]}
	  end
	  def import_variable
	    {description:"Importe une variable d'une autre sauvegarde", 
	      args:[{name:"Numéro de la sauvegarde", type: :int}, {name:"ID de la variable a importer", type: :int}]}
	  end
	  def import_variable
	    {description:"Importe un interupteur d'une autre sauvegarde", 
	      args:[{name:"Numéro de la sauvegarde", type: :int}, {name:"ID de l'interupteur a importer", type: :int}]}
	  end
	  def create_rect_area
	    {description:"Crée une zone rectangulaire en fonction de deux points", 
	      args:[
	        {name:"Point X1", type: :int}, 
	        {name:"Point Y1", type: :int},
	        {name:"Point X2", type: :int},
	        {name:"Point Y2", type: :int}
	        ],
	      returnable: true}
	  end
	  def create_circle_area
	    {description:"Crée une zone circulaire en fonction d'un point et d'un rayon", 
	      args:[
	        {name:"Point X", type: :int}, 
	        {name:"Point Y", type: :int},
	        {name:"Rayon", type: :int}
	        ],
	      returnable: true}
	  end
	  def create_ellipse_area
	    {description:"Crée une zone circulaire en fonction d'un point, d'une hauteur et d'une largeur", 
	      args:[
	        {name:"Point X", type: :int}, 
	        {name:"Point Y", type: :int},
	        {name:"Largeur", type: :int},
	        {name:"Hauteur", type: :int}
	        ],
	      returnable: true}
	  end
	  def create_polygon_area
	    {description:"Crée une zone polygonale en fonction d'une collection de points", 
	      args:[
	        {name:"Points (sous cette forme [[x,y],[x,y] etc.)", type: :none}
	        ],
	      returnable: true}
	  end
	  def in_area?
	    {description:"Renvoi true si le point X/Y est dans la zone, false sinon", 
	      args:[
	        {name:"Zone", type: :none}, 
	        {name:"Point X", type: :int},
	        {name:"Point Y", type: :int}
	        ],
	      returnable: true}
	  end
	  def mouse_hover_area?
	    {description:"Renvoi true si la souris est dans la zone, false sinon", 
	      args:[
	        {name:"Zone", type: :none}
	        ],
	      returnable: true}
	  end
	  def mouse_square_hover_area?
	    {description:"Renvoi true si la souris est dans la zone, false sinon (pour une zone définie en case)", 
	      args:[
	        {name:"Zone", type: :none}
	        ],
	      returnable: true}
	  end
	  def mouse_clicked_area?
	    {description:"Renvoi true si la souris clic (en continu) la zone, false sinon", 
	      args:[
	        {name:"Zone", type: :none},
	        {name:"Touche", type: :enum, enum:[:mouse_left, :mouse_center, :mouse_right]}
	        ],
	      returnable: true}
	  end
	  def mouse_triggered_area?
	    {description:"Renvoi true si la souris clic ponctuellement la zone, false sinon", 
	      args:[
	        {name:"Zone", type: :none},
	        {name:"Touche", type: :enum, enum:[:mouse_left, :mouse_center, :mouse_right]}
	        ],
	      returnable: true}
	  end
	  def mouse_repeated_area?
	    {description:"Renvoi true si la souris clic (de manière répétée) la zone, false sinon", 
	      args:[
	        {name:"Zone", type: :none},
	        {name:"Touche", type: :enum, enum:[:mouse_left, :mouse_center, :mouse_right]}
	        ],
	      returnable: true}
	  end
	  def mouse_released_area?
	    {description:"Renvoi true si la souris est relâchée sur la zone, false sinon", 
	      args:[
	        {name:"Zone", type: :none},
	        {name:"Touche", type: :enum, enum:[:mouse_left, :mouse_center, :mouse_right]}
	        ],
	      returnable: true}
	  end
	  def mouse_square_clicked_area?
	    {description:"Renvoi true si la souris clic (en continu) la zone, false sinon (pour une zone définie en case)", 
	      args:[
	        {name:"Zone", type: :none},
	        {name:"Touche", type: :enum, enum:[:mouse_left, :mouse_center, :mouse_right]}
	        ],
	      returnable: true}
	  end
	  def mouse_square_triggered_area?
	    {description:"Renvoi true si la souris clic (ponctuellement) la zone, false sinon (pour une zone définie en case)", 
	      args:[
	        {name:"Zone", type: :none},
	        {name:"Touche", type: :enum, enum:[:mouse_left, :mouse_center, :mouse_right]}
	        ],
	      returnable: true}
	  end
	  def mouse_square_repeated_area?
	    {description:"Renvoi true si la souris clic (de manière répétée) la zone, false sinon (pour une zone définie en case)", 
	      args:[
	        {name:"Zone", type: :none},
	        {name:"Touche", type: :enum, enum:[:mouse_left, :mouse_center, :mouse_right]}
	        ],
	      returnable: true}
	  end
	  def mouse_square_released_area?
	    {description:"Renvoi true si la souris est relâchée sur la zone, false sinon (pour une zone définie en case)", 
	      args:[
	        {name:"Zone", type: :none},
	        {name:"Touche", type: :enum, enum:[:mouse_left, :mouse_center, :mouse_right]}
	        ],
	      returnable: true}
	  end
	  def create_textfield
	    {description:"Crée un champs saisissable au clavier", 
	      args:[
	        {name:"Type de contenu", type: :enum, enum:[:integer, :float, :text]},
	        {name:"X", type: :int},
	        {name:"Y", type: :int},
	        {name:"Largeur", type: :int, default: 200},
	        {name:"Texte par défaut", type: :string},
	        {name:"Alignement", type: :enum, enum:[:left, :center, :right]}
	        ],
	      returnable: true}
	  end
	  def erase_textfield
	    {description:"Supprime un champ de texte", 
	      args:[
	        {name:"Champ texte", type: :none}
	        ]}
	  end
	  def get_textfield_value
	    {description:"Récupère la valeur d'un champ de texte", 
	      args:[
	        {name:"Champ texte", type: :none}
	        ],
	      returnable: true}
	  end
	  def set_textfield_value
	    {description:"Attribue une valeur à un champ de texte", 
	      args:[
	        {name:"Champ texte", type: :none},
	        {name:"Valeur", type: :string}
	        ]}
	  end
	  def activate_textfield
	    {description:"Active un champ de texte", 
	      args:[
	        {name:"Champ texte", type: :none}
	        ]}
	  end
	  def unactivate_textfield
	    {description:"désactive un champ de texte", 
	      args:[
	        {name:"Champ texte", type: :none}
	        ]}
	  end
	  def textfield_actived?
	    {description:"Renvoi si un champ est activé (true), ou non (false)", 
	      args:[
	        {name:"Champ texte", type: :none}
	        ],
	      returnable: true}
	  end
	  def unactivate_all_textfield
	    {description:"Désactive tous les champs textes"}
	  end
	  def textfield_hover?
	    {description:"Renvoi true si la souris est sur un champ de texte, false sinon", 
	      args:[
	        {name:"Champ texte", type: :none}
	        ],
	      returnable: true}
	  end
	  def textfield_clicked?
	    {description:"Renvoi true si la souris clic sur un champ de texte, false sinon", 
	      args:[
	        {name:"Champ texte", type: :none},
	        {name:"Touche", type: :enum, enum:[:mouse_left, :mouse_center, :mouse_right]}
	        ],
	      returnable: true}
	  end
	  def textfield_visibility
	    {description:"Affiche (true) ou non (false) un champ de texte", 
	      args:[
	        {name:"Champ texte", type: :none},
	        {name:"Touche", type: :bool}
	        ]}
	  end
	  def textfield_opacity
	    {description:"Change l'opacité d'un champ de texte", 
	      args:[
	        {name:"Champ texte", type: :none},
	        {name:"Opacité", type: :int, default: 255}
	        ]}
	  end
	  def textfield_tone
	    {description:"Change la teinte d'un champ de texte", 
	      args:[
	        {name:"Champ texte", type: :none},
	        {name:"Rouge", type: :int, default: 0},
	        {name:"Vert", type: :int, default: 0},
	        {name:"Bleu", type: :int, default: 0}, 
	        {name:"Gris", type: :int, default: 0}
	        ]}
	  end
	  def server_connect
	    {description:"Se connecte à un serveur, renvoi le socket de la connexion", 
	      args:[
	        {name:"Adresse IP", type: :string},
	        {name:"Port", type: :int, default: 9999}
	        ],
	      returnable: true}
	  end
	  def server_send
	    {description:"Envoi un message au serveur", 
	      args:[
	        {name:"Socket", type: :none},
	        {name:"Message", type: :string}
	        ]}
	  end
	  def server_recv
	    {description:"Reçoit un message du serveur", 
	      args:[
	        {name:"Socket", type: :none}
	        ], 
	    returnable: true}
	  end
	  def server_wait_recv
	    {description:"Attend du serveur une réponse", 
	      args:[
	        {name:"Socket", type: :none}
	        ], 
	    returnable: true}
	  end
	  def server_close_connection
	    {description:"Ferme la connexion au serveur", 
	      args:[
	        {name:"Socket", type: :none}
	        ]}
	  end
	  def server_single_connect
	    {description:"Crée une connexion unique a un serveur (donc sans relais de socket)", 
	      args:[
	       {name:"Adresse IP", type: :string},
	       {name:"Port", type: :int, default: 9999}
	      ]}
	  end
	  def server_single_send
	    {description:"Envoi un message au serveur unique", 
	      args:[
	        {name:"Message", type: :string}
	        ]}
	  end
	  def server_single_recv
	    {description:"Reçoit un message du serveur unique", 
	    returnable: true}
	  end
	  def server_single_wait_recv
	    {description:"Attend du serveur unique une réponse", 
	    returnable: true}
	  end
	  def server_single_close_connection
	    {description:"Ferme la connexion au serveur unique"}
	  end
	  def include_page
	    {description:"Appel une page d'un autre évènement", 
	      args:[
	       {name:"Id de la Map", type: :int},
	       {name:"Id de l'évènement", type: :int},
	       {name:"Id de la page", type: :int}
	      ]}
	  end
	  def invoke_event
	    {description:"Appel une page d'un autre évènement", 
	      args:[
	       {name:"Id de la Map", type: :int},
	       {name:"Id de l'évènement", type: :int},
	       {name:"Nouvel ID", type: :int},
	       {name:"Position en X", type: :int},
	       {name:"Position en Y", type: :int}
	      ]}
	  end
	  def windows_username
	    {description:"Renvoi le nom de la session Windows", 
	    returnable: true}
	  end
	  def angle_xy
	    {description:"Renvoi l'angle par rapport à l'axe horizontal entre deux points", 
	      args:[
	       {name:"Point X1", type: :int},
	       {name:"Point Y1", type: :int},
	       {name:"Point X2", type: :int},
	       {name:"Point Y2", type: :int}
	      ],
	      returnable: true
	     }
	  end
	  def rtp_path
	    {description:"Renvoi le répertoire d'installation du RTP", 
	    returnable: true}
	  end
	  def message_height
	    {description:"Change la hauteur des messages", 
	      args:[
	        {name:"Nombre de ligne", type: :int}
	        ]}
	  end
	end
end