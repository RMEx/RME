# -*- coding: utf-8 -*-
#==============================================================================
# ** RME V1.0.0 Doc
#------------------------------------------------------------------------------
# With: 
#  Nuki
#  Raho 
#  Grim
#  Hiino
#
#==============================================================================

#==============================================================================
# ** Fixnum
#------------------------------------------------------------------------------
#  Integer representation
#==============================================================================

class Object
  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Extension de la classe Object"
  link_method_documentation :"Object.delegate", 
                            "Délègue une méthode à une autre méthode ou à un attribut",
                            {
                              :obj      => ["Attribut ou méthode à pointer", :Symbol], 
                              :method   => ["Méthode à appeler", :Symbol],
                              :m_alias  => ["Alias de la méthode, peut être omis", :Symbol]
                            }
  link_method_documentation :"Object.delegate_accessor", 
                            "Délègue les accesseurs, mutateurs d'un attribut à une méthode",
                            {
                              :obj      => ["Attribut ou méthode à pointer", :Symbol], 
                              :field    => ["Attribut de l'obj à déléguer", :Symbol]
                            }
  link_method_documentation :"Object.externalize", 
                            "Transforme un object 'callable' en méthode",
                            {
                              :obj      => ["Objet callable", :Proc], 
                              :m_alias  => ["Nom de la méthode", :Symbol]
                            }
  link_method_documentation :"self.identity", 
                            "Renvoie l'instance pointée",
                            {}, true
  link_method_documentation :"self.attr_values", 
                            "Renvoie un hash des attributs où la clé est le nom de l'attribut
                            et la valeur est celle de l'attribut",
                            {}, true
  link_method_documentation :"self.buffer", 
                            "Renvoie un buffer (pour les Win32API's)",
                            {:size => ["Taille du buffer", :Fixnum]}, true

end

#==============================================================================
# ** Sprite
#------------------------------------------------------------------------------
#  The Sprite class
#==============================================================================

class Sprite
  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Extension des sprites"
  link_method_documentation :"self.rect", 
                            "Retourne le rectangle relatif d'un sprite", 
                            {}, true
  link_method_documentation :"self.in?", 
                            "Vérifie si le point passé en argument (via (x, y), ou via une instance de Point) est inscrite dans le rectangle du sprite", 
                            {
                              :x=> ["Coordonnées X du point", :Fixnum], 
                              :y=> ["Coordonnées Y du point", :Fixnum]
                            }, true
  link_method_documentation :"self.hover?", 
                            "Vérifie si la souris passe au dessus du rectangle du sprite", 
                            {}, true
  link_method_documentation :"self.click?", 
                            "Vérifie si le rectangle du sprite est cliqué", 
                            {}, true
  link_method_documentation :"self.press?", 
                            "Vérifie si le rectangle du sprite est enfoncé par la touche passée en argument", 
                            {:key => ["Touche d'activation", :Symbol]}, true
  link_method_documentation :"self.trigger?", 
                            "Vérifie si le rectangle du sprite est clické une fois par la touche passée en argument", 
                            {:key => ["Touche d'activation", :Symbol]}, true
  link_method_documentation :"self.repeat?", 
                            "Vérifie si le rectangle du sprite est clické de manière répétée par la touche passée en argument", 
                            {:key => ["Touche d'activation", :Symbol]}, true
  link_method_documentation :"self.release?", 
                            "Vérifie si le rectangle du sprite est relaché par la touche passée en argument", 
                            {:key => ["Touche d'activation", :Symbol]}, true
  link_method_documentation :"self.mouse_x", 
                            "Retourne la position x de la souris relative au rectangle du sprite", 
                            {}, true
  link_method_documentation :"self.mouse_y", 
                            "Retourne la position y de la souris relative au rectangle du sprite", 
                            {}, true

end

#==============================================================================
# ** Rect
#------------------------------------------------------------------------------
#  The rectangle class
#==============================================================================

class Rect
  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Extension des rectangles"
  link_method_documentation :"self.in?", 
                            "Vérifie si le point passé en argument (via (x, y), ou via une instance de Point) est inscrite dans le rectangle", 
                            {
                              :x=> ["Coordonnées X du point", :Fixnum], 
                              :y=> ["Coordonnées Y du point", :Fixnum]
                            }, true
  link_method_documentation :"self.hover?", 
                            "Vérifie si la souris passe au dessus du rectangle", 
                            {}, true
  link_method_documentation :"self.click?", 
                            "Vérifie si le rectangle est cliqué", 
                            {}, true
  link_method_documentation :"self.press?", 
                            "Vérifie si le rectangle est enfoncé par la touche passée en argument", 
                            {:key => ["Touche d'activation", :Symbol]}, true
  link_method_documentation :"self.trigger?", 
                            "Vérifie si le rectangle est clické une fois par la touche passée en argument", 
                            {:key => ["Touche d'activation", :Symbol]}, true
  link_method_documentation :"self.repeat?", 
                            "Vérifie si le rectangle est clické de manière répétée par la touche passée en argument", 
                            {:key => ["Touche d'activation", :Symbol]}, true
  link_method_documentation :"self.release?", 
                            "Vérifie si le rectangle est relaché par la touche passée en argument", 
                            {:key => ["Touche d'activation", :Symbol]}, true
  link_method_documentation :"self.mouse_x", 
                            "Retourne la position x de la souris relative au rectangle", 
                            {}, true
  link_method_documentation :"self.mouse_y", 
                            "Retourne la position y de la souris relative au rectangle", 
                            {}, true

end

#==============================================================================
# ** Bitmap
#------------------------------------------------------------------------------
#  Image representation
#==============================================================================

class Bitmap
  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Extension des Bitmaps"
  link_method_documentation :"self.fast_get_pixel", 
                            "Retourne l'objet Color correspondant aux coordonnées données de manière très rapide", 
                            {

                              :x => ["Coordonnées X", :Fixnum],
                              :y => ["Coordonnées Y", :Fixnum]
                            }, true
end

#==============================================================================
# ** Fixnum
#------------------------------------------------------------------------------
#  Integer representation
#==============================================================================

class Fixnum
  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Extension des entiers"
  link_method_documentation :"self.to_digit",  
                            "Renvoie la représentation textuelle d'un chiffre",
                            {}, true

  link_snippet "self.to_digit", "9.to_digit # :nine"
end

#==============================================================================
# ** String
#------------------------------------------------------------------------------
#  String char extension
#==============================================================================

class String

  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Extension des chaines de caractère"
  link_method_documentation :"self.extract_numbers",  
                            "Renvoie tous les entiers d'une chaîne de caractères",
                            {}, true
  link_method_documentation :"self.damerau_levenshtein",  
                            "Renvoie la distance de Damerau–Levenshtein avec 
                            une autre chaîne",
                            {:oth => ["Autre chaîne à comparer", :String]}, true

  link_method_documentation :"self.stretch", 
                            "Injecte des retours à la ligne dans la chaîne", 
                            {:lin_len => ["Taille des lignes", :Fixnum]}, true

end

#==============================================================================
# ** Point
#------------------------------------------------------------------------------
#  Point(x, y) representation
#==============================================================================

class Point
  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Représente un point dans un plan cartésien"
  link_method_documentation :"Point.new", 
                            "Constructeur de point", 
                            {
                              :x => ["Coordonnées X du point", :Fixnum],
                              :y => ["Coordonnées Y du point", :Fixnum]
                            }, true
  link_method_documentation :"self.set", 
                            "Change les coordonnées du point", 
                            {
                              :x => ["Coordonnées X du point", :Fixnum],
                              :y => ["Coordonnées Y du point", :Fixnum]
                            }
  link_method_documentation :"self.in?", 
                            "Vérifie si un point est inscrit dans un rectangle", 
                            {:rect => ["Rectangle", :Rect]}, true
  link_method_documentation :"self.null!", 
                            "Replace le X et le Y du point à zéro", 
                            {}

  end

#==============================================================================
# ** Keys
#------------------------------------------------------------------------------
#  Keys representation
#==============================================================================

class Devices::Keys
  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Représentation des touches clavier/souris, est accessible via Keys, Key, ou Devices::Keys"

  All.select{|x| x!= :none}.each do |key|
    kname = key.to_s
    kcons = "Keys::#{kname.capitalize}"
    link_attr_documentation kcons.to_sym, "Pointe la touche #{kname}"
  end

  link_method_documentation "self.trigger?", 
                          "Renvoie true si la touche vient d'être pressée, false sinon",
                          {}, true
  link_method_documentation "self.press?", 
                          "Renvoie true si la touche est pressée, false sinon",
                          {}, true
  link_method_documentation "self.release?", 
                          "Renvoie true si la touche vient d'être relâchée, false sinon",
                          {}, true
  link_method_documentation "self.repeat?", 
                          "Renvoie true si la touche est pressée successivement, false sinon",
                          {}, true

  link_snippet("self.trigger?",
  "if Keys::Mouse_left.trigger?
    p :mouse_pressed
  end")

end

#==============================================================================
# ** Keyboard
#------------------------------------------------------------------------------
#  Keyboard representation
#==============================================================================

class Devices::Keyboard
  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Représentation du clavier, est accessible via Keyboard"
  Devices::Keys::All.select{|x| x!= :none}.each do |key|
    kname = key.to_s
    sname = ":"+kname
    kcons = "Keys::#{kname.capitalize}"
    link_attr_documentation sname.to_sym, "Pointe la touche #{kcons} (comme argument à passer)"
  end
  link_method_documentation "Keyboard.trigger?", 
                          "Renvoie true si la touche passée en argument (cf:attributs) vient d'être pressée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  link_method_documentation "Keyboard.press?", 
                          "Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  link_method_documentation "Keyboard.repeat?", 
                          "Renvoie true si la touche passée en argument (cf:attributs) est appuyée successivement, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  link_method_documentation "Keyboard.release?", 
                          "Renvoie true si la touche passée en argument (cf:attributs) vient d'être relâchée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  link_method_documentation "Keyboard.all?", 
                          "Renvoie true si toutes les touches passées à keys sont activées selon la méthode passées à method", 
                          {
                            :method => ["Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activée selon la méthode", :Argslist]
                          }, true
  link_snippet "Keyboard.all?", "p 'A, B et C sont pressées' if Keyboard.all?(:press?, :a, :b, :c)"
  link_method_documentation "Keyboard.any?", 
                          "Renvoie true si toutes au moins une touches passée à keys est activée selon la méthode passées à method", 
                          {
                            :method => ["Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activée selon la méthode, si rien n'est passé, toutes les touches sont prises en compte", :Argslist]
                          }, true
  link_snippet "Keyboard.all?", "p 'A, B et C sont pressées' if Keyboard.all?(:press?, :a, :b, :c)"
  link_method_documentation "Keyboard.current_char", 
                          "Renvoie le caractère actuel pressé par le clavier",
                          {}, true
  link_method_documentation "Keyboard.current_digit", 
                          "Renvoie le chiffre actuel pressé par le clavier",
                          {}, true
  link_method_documentation "Keyboard.shift?", 
                          "Renvoie true si la touche Maj du clavier est activée au moment de l'appel, false sinon",
                          {}, true
  link_method_documentation "Keyboard.caps_lock?", 
                          "Renvoie true si le clavier est en mode CAPS_LOCK au moment de l'appel, false sinon",
                          {}, true
  link_method_documentation "Keyboard.num_lock?", 
                          "Renvoie true si le clavier est en mode NUM_LOCK au moment de l'appel, false sinon",
                          {}, true
  link_method_documentation "Keyboard.scroll_lock?", 
                          "Renvoie true si le clavier est en mode SCROLL_LOCK au moment de l'appel, false sinon",
                          {}, true
  link_method_documentation "Keyboard.alt_gr?", 
                          "Renvoie true si la touche ALT_GR (ou la combinaison CTRL+ALT) est appuyée au moment de l'appel, false sinon",
                          {}, true
  link_method_documentation "Keyboard.ctrl?", 
                          "Renvoie true si la touche CTRL (ou une combinaison CTRL+key) est appuyée au moment de l'appel, false sinon",
                          {:key => ["Symbole référençant la touche (cf:attributs) mise en combinaison", :Symbol]}, 
                          true
  link_method_documentation "Keyboard.current_key", 
                          "Renvoie la touche activée selon la méthode passée en argument, nil si aucune touche n'est activée", 
                          {:method => ["Méthode d'activation (:press?, :release?, :trigger? etc.)", :Symbol]}, true
  link_method_documentation "Keyboard.rgss_current_key", 
                          "Renvoie la touche du RGSS (:X, :A, :B, :C etc.) activée selon la méthode passée en argument, nil si aucune touche n'est activée", 
                          {:method => ["Méthode d'activation (:press?, :release?, :trigger? etc.)", :Symbol]}, true
  link_method_documentation "Keyboard.time", 
                          "Renvoie le nombre de frame pressée d'une touche en cours", 
                          {:key => ["Touche à vérifier",:Symbol]}, true

end

#==============================================================================
# ** Mouse
#------------------------------------------------------------------------------
#  Keyboard representation
#==============================================================================

class Devices::Mouse
  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Représentation de la souris, est accessible via Mouse"
  [:mouse_left, :mouse_right, :mouse_center, :mouse_x1, :mouse_x2].select{|x| x!= :none}.each do |key|
    kname = key.to_s
    sname = ":"+kname
    kcons = "Keys::#{kname.capitalize}"
    link_attr_documentation sname.to_sym, "Pointe la touche #{kcons} (comme argument à passer)"
  end

  link_method_documentation "Mouse.trigger?", 
                          "Renvoie true si la touche passée en argument (cf:attributs) vient d'être pressée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  link_method_documentation "Mouse.press?", 
                          "Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  link_method_documentation "Mouse.click?", 
                          "Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon. (Alias de Mouse.press?)",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  link_method_documentation "Mouse.repeat?", 
                          "Renvoie true si la touche passée en argument (cf:attributs) est appuyée successivement, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  link_method_documentation "Mouse.release?", 
                          "Renvoie true si la touche passée en argument (cf:attributs) vient d'être relâchée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  link_method_documentation "Mouse.point", 
                          "Renvoie un point (possédant les attributs x, y) référençant la position de la souris en pixels par rapport à l'écran",
                          {}, true
  link_method_documentation "Mouse.x", 
                          "Renvoie la position (en pixels) X de la souris",
                          {}, true
  link_method_documentation "Mouse.y", 
                          "Renvoie la position (en pixels) Y de la souris",
                          {}, true
  link_method_documentation "Mouse.square_x", 
                          "Renvoie la position (en cases) X de la souris",
                          {}, true
  link_method_documentation "Mouse.square_y", 
                          "Renvoie la position (en cases) Y de la souris",
                          {}, true
  link_method_documentation "Mouse.rect", 
                          "Renvoie le rectangle de sélection de la souris (tracé en cours)",
                          {}, true
  link_method_documentation "Mouse.last_rect", 
                          "Renvoie le dernier rectangle de sélection de la souris effectué",
                          {}, true
  link_method_documentation "Mouse.dragging?", 
                          "Renvoie true si la souris est en train de sélectionner (cliquer/glisser) à l'écran",
                          {}, true
  link_method_documentation "Mouse.in?", 
                          "Renvoie true si la souris se trouve dans le rectangle passé en argument",
                          {:rectangle => ["Rectangle à vérifier", :Rect]}, true
  link_method_documentation "Mouse.all?", 
                          "Renvoie true si toutes les touches passées à keys sont activées selon la méthode passées à method", 
                          {
                            :method => ["Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activée selon la méthode", :Argslist]
                          }, true
  link_snippet "Mouse.all?", "p 'souris gauche et souris droit sont pressées' if Mouse.all?(:press?, :mouse_left, :mouse_right)"
  link_method_documentation "Mouse.any?", 
                          "Renvoie true si toutes au moins une touches passée à keys est activée selon la méthode passées à method", 
                          {
                            :method => ["Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activée selon la méthode, si rien n'est passé, toutes les touches sont prises en compte", :Argslist]
                          }, true
  link_method_documentation "Mouse.current_key", 
                          "Renvoie la touche activée selon la méthode passée en argument, nil si aucune touche n'est activée", 
                          {:method => ["Méthode d'activation (:press?, :release?, :trigger? etc.)", :Symbol]}, true
  link_method_documentation "Mouse.time", 
                          "Renvoie le nombre de frame pressée d'une touche en cours", 
                          {:key => ["Touche à vérifier",:Symbol]}, true

end

#==============================================================================
# ** Kernel
#------------------------------------------------------------------------------
#  Object class methods are defined in this module. 
#  This ensures compatibility with top-level method redefinition.
#==============================================================================

module Kernel
  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Module référençant les outils génériques"
  link_attr_documentation :HWND, "Renvoie la fenêtre courante de jeu (pour les WIN32API's)"
  link_attr_documentation :IDENTITY, "Renvoie la lambda identité"
end

#==============================================================================
# ** Generative
#------------------------------------------------------------------------------
#  Mixins collection
#==============================================================================

module Generative

  link_class_documentation "Collection de modules MIXINS pour généraliser des comportements"

  #==============================================================================
  # ** BitmapRect
  #------------------------------------------------------------------------------
  #  Rect API
  #==============================================================================

  module BitmapRect
    link_class_documentation "Module pour les classes dérivant un attribut Bitmap. Il ajoute une méthode rect à la classe
    où il est inclus, permettant d'accéder directement au rectangle du bitmap, tenant compte du viewport (si viewport il y a)"
    link_method_documentation "self.rect", 
                          "Renvoie le rectangle référant à l'instance",
                          {}, true
  end

  module CommandAPI
    link_class_documentation "Rend accessibles les commandes EventExtender"
    link_method_documentation "self.command", 
                          "Appel d'une commande, alias : c, cmd",
                          {
                            :name => ["Nom de la commande à appeler", :Symbol],
                            :args => ["Suite d'arguments", :Argslist]
                          }, true
    link_snippet("self.command", "command(:test, 1, 2, 3) #Appel Command.test(1,2,3) (ou : c(:test, 1,2,3) ou cmd(:test, 1,2,3)")
  end

end

#==============================================================================
# ** Viewport
#------------------------------------------------------------------------------
#  Used when displaying sprites on one portion of the screen
#==============================================================================

class Viewport
  link_class_documentation "Représente une portion de l'écran"
  link_attr_documentation :elts, "Renvoie la liste des éléments inclus dans le Viewport"
  link_attr_documentation :x, "(Lecture/écriture) Coordonnées X du coin supérieur gauche"
  link_attr_documentation :y, "(Lecture/écriture) Coordonnées Y du coin supérieur gauche"
  link_attr_documentation :width, "(Lecture/écriture) Largeur du rectangle"
  link_attr_documentation :height, "(Lecture/écriture) Hauteur du rectangle"
  link_method_documentation "self.append", 
                          "Méthode (idéalement) privée d'ajout d'un élément dans le viewport (et à @elts)",
                          {:obj => ["Objet répondant aux méthodes x, y, width, height", :Object]}, false
  link_method_documentation "self.calc_width", 
                          "Renvoie la largeur minimum requise pour afficher tous les éléments du viewport",
                          {}, true
  link_method_documentation "self.calc_height", 
                          "Renvoie la hauteur minimum requise pour afficher tous les éléments du viewport",
                          {}, true

end


#==============================================================================
# ** Command
#------------------------------------------------------------------------------
#  EvEx Command description
#==============================================================================

module Command

  register_command_category :mapinfo, "Informations cartes", "Commandes relatives aux informations des cartes"
  register_command_category :standard, "Commandes standards", "Commandes standards"
  register_command_category :event, "Commandes évènements", "Commandes relatives aux évènements"
  register_command_category :keyboard, "Commandes du clavier", "Commandes relatives au clavier"
  register_command_category :mouse, "Commandes de la souris", "Commande relatives à la gestion de la souris"
  register_command_category :picture, "Commandes de manipulation des images", "Commandes relatives à la manipulation des images"
  register_command_category :parallax, "Commandes de manipulation des panoramas", "Commandes relatives à la manipulation des panoramas"
  register_command_category :micro, "Commandes de manipulation des micros events", "Commandes relatives à la gestion des micro events"
  register_command_category :party, "Commandes relatives à la gestion de partie", "Commande associées à la gestion de la partie"
  register_command_category :items, "Commandes relatives aux objets", "Commandes permettant d'obtenir ou de manipuler les objets"
  register_command_category :armors, "Commandes relatives aux armures", "Commandes permettant de manipuler les armures"
  register_command_category :weapons, "Commandes relatives aux armes", "Commandes permettant de manipuler les armes" 
  register_command_category :system, "Commandes systèmes", "Offre une collection d'informations sur le système"
  register_command_category :actors, "Commandes des acteurs", "Offre des commandes pour obtenir des informations sur les acteurs"
  register_command_category :skills, "Commandes des techniques", "Offre des commandes pour obtenir des informations sur les techniques"
  
  link_class_documentation "Collection des commandes EventExtender"

  link_method_documentation "Command.tone", 
                        "Renvoie une teinte",
                        {
                          :red => ["Valeur de rouge", :Fixnum],
                          :green => ["Valeur de vert", :Fixnum], 
                          :blue => ["Valeur de bleu", :Fixnum],
                          :"*gray" => ["Valeur de gris, par défaut 0!", :Fixnum]
                        }, true
  register_command :standard, "Command.tone"

  link_method_documentation "Command.get", 
                        "Renvoie la cellule à la valeur donné d'un tableau",
                        {:array =>["Tableau dont il faut renvoyer la taille", :Array], :index => ["Index à trouver", :Fixnum]}, true
  register_command :standard, "Command.get"
  link_snippet("Command.get", "Command.get([0, 1, 2, 17], 2) # Renvoie 2 (parce que c'est la deuxième cellule et que l'indexation des tableaux commence à 0)")

  link_method_documentation "Command.session_username", 
                        "Renvoie le nom d'utilisateur de la session Windows",
                        {}, true
  register_command :standard, "Command.session_username"

  link_method_documentation "Command.length", 
                        "Renvoie la taille d'un tableau",
                        {:array =>["Tableau dont il faut renvoyer la taille", :Array]}, true
  register_command :standard, "Command.length"

  link_method_documentation "Command.color", 
                        "Renvoie une couleur",
                        {
                          :red => ["Valeur de rouge", :Fixnum],
                          :green => ["Valeur de vert", :Fixnum], 
                          :blue => ["Valeur de bleu", :Fixnum],
                          :"*alpha" => ["Opacité, par défaut 255!", :Fixnum]
                        }, true
  register_command :standard, "Command.tone"

  link_method_documentation "Command.random", 
                        "Renvoie un nombre aléatoire compris entre MIN et MAX inclus",
                        {
                          :min => ["Borne minimale", :Fixnum],
                          :max => ["Borne maximale (à noter que si cet argument n'est pas spécifié, le résultat sera compris entre 0 et min inclus)", :Fixnum]
                        }, true
  register_command :standard, "Command.random"
  link_method_documentation "Command.wait", 
                        "Attend un nombre de frames donné",
                        {
                          :duration => ["Nombre de frames a attendre", :Fixnum],
                        }
  register_command :standard, "Command.wait"

  link_method_documentation "Command.random_figures", 
                        "Renvoie un nombre à virgule aléatoire compris entre x et x+1",
                        {
                          :x => ["Valeur de base (si cet argument n'est pas spécifié, le résultat sera compris entre 0 et 1)", :Fixnum]
                        }, true
  register_command :standard, "Command.random_figures"

  link_method_documentation "Command.map_id", 
                        "Renvoie l'ID de la map en cours",
                        {}, true
  register_command :mapinfo, "Command.map_id"

  link_method_documentation "Command.map_name", 
                        "Renvoie le nom de la map en cours",
                        {}, true
  register_command :mapinfo, "Command.map_name"

  link_method_documentation "Command.id_at", 
                        "Renvoie l'ID de l'évènement pointé par les coordonnées X,Y (0 si c'est le héros, -1 s'il n'y en a pas)",
                        {
                          :x => ["Coordonnées X de la case", :Fixnum],
                          :y => ["Coordonnées Y de la case", :Fixnum]
                        }, true
  register_command :mapinfo, "Command.id_at"

  link_method_documentation "Command.terrain_tag", 
                        "Renvoie le tag du terrain de la case pointée par les coordonnées X,Y",
                        {
                          :x => ["Coordonnées X de la case", :Fixnum],
                          :y => ["Coordonnées Y de la case", :Fixnum]
                        }, true
  register_command :mapinfo, "Command.terrain_tag"

  link_method_documentation "Command.tile_id", 
                        "Renvoie l'ID de la tile pointée par les coordonnées X,Y",
                        {
                          :x => ["Coordonnées X de la case", :Fixnum],
                          :y => ["Coordonnées Y de la case", :Fixnum]
                        }, true
  register_command :mapinfo, "Command.tile_id"

  link_method_documentation "Command.region_id", 
                        "Renvoie l'ID de la région pointée par les coordonnées X,Y",
                        {
                          :x => ["Coordonnées X de la case", :Fixnum],
                          :y => ["Coordonnées Y de la case", :Fixnum]
                        }, true
  register_command :mapinfo, "Command.region_id"

  link_method_documentation "Command.square_passable?", 
                        "Renvoie true si la case référencée par X, Y est passable dans la direction référencée par direction, false sinon",
                        {
                          :x => ["Coordonnées X de la case", :Fixnum],
                          :y => ["Coordonnées Y de la case", :Fixnum],
                          :direction => ["Direction (2,4,6,8)", :Fixnum]
                        }, true

  register_command :mapinfo, "Command.square_passable?"

  link_method_documentation "Command.percent", 
                        "Renvoie le pourcentage de value par rapport à max",
                        {
                          :value => ["Valeur à transformer", :Fixnum],
                          :max => ["Valeur maximum", :Fixnum]
                        }, true
  register_command :standard, "Command.percent"

  link_snippet("Command.percent", "Command.percent(40, 80) # Renvoie 50 (parce que 40 = 50% de 80)")
  link_method_documentation "Command.apply_percent", 
                        "Applique percent à max",
                        {
                          :percent => ["Valeur à appliquer", :Fixnum],
                          :max => ["Valeur maximum", :Fixnum]
                        }, true
  link_snippet("Command.apply_percent", "Command.apply_percent(50, 80) # Renvoie 40 (parce que 50% de 80 = 40)")
  register_command :standard, "Command.apply_percent"

  link_method_documentation "Command.include_page", 
                        "Invoque une page (comme s'il s'agissait d'un évènement commun) d'un autre évènement",
                        {
                          :map_id => ["ID de la map où chercher l'évènement à inclure", :Fixnum],
                          :event_id => ["ID de l'évènement où chercher la page à inclure", :Fixnum],
                          :page_id => ["ID de la page à inclure", :Fixnum],
                          "*runnable".to_sym => ["Par défaut, cette variable a pour valeur `false`. Si elle vaut `true`, la page ne sera incluse que si la condition de lancement de la page est respectée. Par défaut, elle utilise le contexte (les interrupteurs locaux) de l'évènement appelant.", :Boolean],
                          "*context".to_sym => ["Par défaut, cette variable a pour valeur `false`. Si `runnable` et `context` valent `true`, la condition de lancement de la page utilisera le contexte (les interrupteurs locaux) de l'évènement d'origine à la place de celui de l'évènement appelant.", :Boolean]
                        }
  register_command :event, "Command.include_page"

  link_method_documentation "Command.page_runnable?", 
                        "Vérifie si la page est exécutable dans le contexte de l'évènement appelant.",
                        {
                          :map_id => ["ID de la map où chercher l'évènement à tester", :Fixnum],
                          :event_id => ["ID de l'évènement où chercher la page à tester", :Fixnum],
                          :page_id => ["ID de la page à tester", :Fixnum],
                          "*context".to_sym => ["Par défaut, cette variable a pour valeur `false`. Si elle vaut `true`, la condition de lancement de la page utilisera le contexte (les interrupteurs locaux) de l'évènement d'origine à la place de celui de l'évènement appelant.", :Boolean]
                          }, true
  register_command :event, "Command.page_runnable?"

  link_method_documentation "Command.invoke_event", 
                        "Invoque un évènement d'une autre map (ou de la même) sur la carte",
                        {
                          :map_id => ["ID de la map où chercher l'évènement à invoquer", :Fixnum],
                          :event_id => ["ID de l'évènement à invoquer", :Fixnum],
                          :new_id => ["Nouvel ID de l'évènement fraîchement invoqué", :Fixnum],
                          "*x".to_sym => ["Position X où placer l'évènement invoqué, par défaut, conserve la valeur de l'évènement invoqué", :Fixnum],
                          "*y".to_sym => ["Position Y où placer l'évènement invoqué, par défaut conserve la valeur de l'évènement invoqué", :Fixnum]
                        }
  register_command :event, "Command.invoke_event"

  link_method_documentation "Command.max_event_id", 
                        "Renvoie le plus grand ID d'évènement occupé sur la carte",
                        {}, true
  register_command :event, "Command.max_event_id"

  link_method_documentation "Command.fresh_event_id", 
                        "Renvoie un ID libre (utile en cas d'invocation d'évènement)",
                        {}, true
  register_command :event, "Command.fresh_event_id"

  link_method_documentation "Command.mouse_hover_event?", 
                        "Renvoie true si la souris survol un évènement du sélecteur passé en argument",
                        {:events => ["Selecteur d'évènements", :Selectors]}, true
  register_command :event, "Command.mouse_hover_event?"

  link_method_documentation "Command.mouse_click_event?", 
                        "Renvoie true si la souris clique un évènement du sélecteur passé en argument",
                        {:events => ["Selecteur d'évènements", :Selectors]}, true
  register_command :event, "Command.mouse_click_event?"

  link_method_documentation "Command.mouse_press_event?", 
                        "Renvoie true si la souris presse un évènement du sélecteur passé en argument",
                        {
                          :events => ["Selecteur d'évènements", :Selectors],
                          :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left", :Selector]
                        }, true
  register_command :event, "Command.mouse_press_event?"

  link_method_documentation "Command.mouse_trigger_event?", 
                        "Renvoie true si la souris vient de cliquer un évènement du sélecteur passé en argument",
                        {
                          :events => ["Selecteur d'évènements", :Selectors],
                          :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left", :Selector]
                        }, true
  register_command :event, "Command.mouse_trigger_event?"

  link_method_documentation "Command.mouse_repeat_event?", 
                        "Renvoie true si la souris clique de manière répétée un évènement du sélecteur passé en argument",
                        {
                          :events => ["Selecteur d'évènements", :Selectors],
                          :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left", :Selector]
                        }, true
  register_command :event, "Command.mouse_repeat_event?"

  link_method_documentation "Command.mouse_release_event?", 
                        "Renvoie true si la souris est relâchée sur un évènement du sélecteur passé en argument",
                        {
                          :events => ["Selecteur d'évènements", :Selectors],
                          :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left", :Selector]
                        }, true
  register_command :event, "Command.mouse_release_event?"

  link_method_documentation "Command.event_x", 
                        "Renvoie la coordonnées X de la case sur laquelle est l'évènement référencé par son ID",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum]}, true
  register_command :event, "Command.event_x"

  link_method_documentation "Command.event_in_screen?", 
                        "Renvoie true si l'évènement référencé par son ID est visible à l'écran, false sinon",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum]}, true
  register_command :event, "Command.event_in_screen?"

   link_method_documentation "Command.player_in_screen?", 
                        "Renvoie true si le joueur est visible à l'écran, false sinon",
                        {}, true
  register_command :event, "Command.player_in_screen?"


  link_method_documentation "Command.event_y", 
                        "Renvoie la coordonnées Y de la case sur laquelle est l'évènement référencé par son ID",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum]}, true
  register_command :event, "Command.event_y"

  link_method_documentation "Command.event_screen_x", 
                        "Renvoie la coordonnées X de l'évènement référencé par son ID par rapport à l'écran",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum]}, true
  register_command :event, "Command.event_screen_x"

  link_method_documentation "Command.event_screen_y", 
                        "Renvoie la coordonnées Y de l'évènement référencé par son ID par rapport à l'écran",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum]}, true
  register_command :event, "Command.event_screen_y"

  link_method_documentation "Command.event_pixel_x", 
                        "Renvoie la coordonnées X de l'évènement référencé par son ID en pixel sur la carte",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum]}, true
  register_command :event, "Command.event_pixel_x"

  link_method_documentation "Command.event_pixel_y", 
                        "Renvoie la coordonnées Y de l'évènement référencé par son ID en pixel sur la carte",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum]}, true
  register_command :event, "Command.event_pixel_y"

  link_method_documentation "Command.event_direction", 
                        "Renvoie la direction (2 pour le haut, 8, pour le bas, 4 pour la gauche , 6 pour la droite ) de l'évènement référencé par son ID en pixel sur la carte",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum]}, true
  register_command :event, "Command.event_direction"

  link_method_documentation "Command.player_x", 
                        "Renvoie la coordonnées X de la case sur laquelle est le joueur",
                         {}, true
  register_command :event, "Command.player_x"

  link_method_documentation "Command.player_y", 
                        "Renvoie la coordonnées Y de la case sur laquelle est le joueur",
                       {}, true
  register_command :event, "Command.player_y"

  link_method_documentation "Command.player_screen_x", 
                        "Renvoie la coordonnées X du joueur par rapport à l'écran",
                        {}, true
  register_command :event, "Command.player_screen_x"

  link_method_documentation "Command.player_screen_y", 
                        "Renvoie la coordonnées Y du joueur par rapport à l'écran",
                        {}, true
  register_command :event, "Command.player_screen_y"

  link_method_documentation "Command.player_pixel_x", 
                        "Renvoie la coordonnées X du joueur en pixel sur la carte",
                        {}, true
  register_command :event, "Command.player_pixel_x"

  link_method_documentation "Command.player_pixel_y", 
                        "Renvoie la coordonnées Y du joueur en pixel sur la carte",
                        {}, true
  register_command :event, "Command.player_pixel_y"

  link_method_documentation "Command.player_direction", 
                        "Renvoie la direction (2 pour le haut, 8, pour le bas, 4 pour la gauche , 6 pour la droite ) du joueur en pixel sur la carte",
                        {}, true
  register_command :event, "Command.player_direction"

  link_method_documentation "Command.squares_between", 
                        "Renvoie le nombre de cases entre deux évènements référencés par leurs ID's",
                        {
                          :idA => ["ID de l'évènement A (0 pour héros)", :Fixnum],
                          :idB => ["ID de l'évènement B (0 pour héros)", :Fixnum],

                        },
                        true
  register_command :event, "Command.squares_between"

  link_method_documentation "Command.pixels_between", 
                        "Renvoie le nombre de pixels entre deux évènements référencés par leurs ID's",
                        {
                          :idA => ["ID de l'évènement A (0 pour héros)", :Fixnum],
                          :idB => ["ID de l'évènement B (0 pour héros)", :Fixnum],

                        },
                        true
  register_command :event, "Command.pixels_between"

  link_method_documentation "Command.event_look_at?", 
                        "Renvoie true si l'evenement A regarde dans la direction de l'évènement B et que celui ci est dans son périmètre, false sinon",
                        {
                          :idA => ["ID de l'évènement A (0 pour héros)", :Fixnum],
                          :idB => ["ID de l'évènement B (0 pour héros)", :Fixnum],
                          :scope => ["Nombre de case ou de pixels", :Fixnum],
                          :"*metric" => ["par défaut :square, pour en case, :pixels pour en pixels", :Fixnum],

                        },
                        true
  register_command :event, "Command.event_look_at?"

  link_method_documentation "Command.event_collide?", 
                        "Renvoie true si l'evenement A est en collision avec l'évènement B, false sinon",
                        {
                          :idA => ["ID de l'évènement A (0 pour héros)", :Fixnum],
                          :idB => ["ID de l'évènement B (0 pour héros)", :Fixnum],

                        },
                        true
  register_command :event, "Command.event_collide?"

  link_method_documentation "Command.key_trigger?", 
                          "Renvoie true si la touche passée en argument (cf:attributs) vient d'être pressée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  register_command :keyboard, "Command.key_trigger?"

  link_method_documentation "Command.key_press?", 
                          "Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  register_command :keyboard, "Command.key_press?"

  link_method_documentation "Command.key_repeat?", 
                          "Renvoie true si la touche passée en argument (cf:attributs) est appuyée successivement, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  register_command :keyboard, "Command.key_repeat?"

  link_method_documentation "Command.key_release?", 
                          "Renvoie true si la touche passée en argument (cf:attributs) vient d'être relâchée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  register_command :keyboard, "Command.key_release?"

  link_method_documentation "Command.keyboard_all?", 
                          "Renvoie true si toutes les touches passées à keys sont activées selon la méthode passées à method", 
                          {
                            :method => ["Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activée selon la méthode", :Argslist]
                          }, true
  register_command :keyboard, "Command.keyboard_all"

  link_method_documentation "Command.keyboard_any?", 
                          "Renvoie true si toutes au moins une touches passée à keys est activée selon la méthode passées à method", 
                          {
                            :method => ["Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activée selon la méthode, si rien n'est passé, toutes les touches sont prises en compte", :Argslist]
                          }, true
  register_command :keyboard, "Command.keyboard_any"

  link_method_documentation "Command.keyboard_current_char", 
                          "Renvoie le caractère actuel pressé par le clavier",
                          {}, true
  register_command :keyboard, "Command.keyboard_current_char"

  link_method_documentation "Command.keyboard_current_digit", 
                          "Renvoie le chiffre actuel pressé par le clavier",
                          {}, true
  register_command :keyboard, "Command.keyboard_current_digit"

  link_method_documentation "Command.shift?", 
                          "Renvoie true si la touche Maj du clavier est activée au moment de l'appel, false sinon",
                          {}, true
  register_command :keyboard, "Command.shift?"

  link_method_documentation "Command.caps_lock?", 
                          "Renvoie true si le clavier est en mode CAPS_LOCK au moment de l'appel, false sinon",
                          {}, true
  register_command :keyboard, "Command.caps_lock?"

  link_method_documentation "Command.num_lock?", 
                          "Renvoie true si le clavier est en mode NUM_LOCK au moment de l'appel, false sinon",
                          {}, true
  register_command :keyboard, "Command.num_lock?"

  link_method_documentation "Command.scroll_lock?", 
                          "Renvoie true si le clavier est en mode SCROLL_LOCK au moment de l'appel, false sinon",
                          {}, true
  register_command :keyboard, "Command.scroll_lock?"

  link_method_documentation "Command.alt_gr?", 
                          "Renvoie true si la touche ALT_GR (ou la combinaison CTRL+ALT) est appuyée au moment de l'appel, false sinon",
                          {}, true
  register_command :keyboard, "Command.alt_gr?"

  link_method_documentation "Command.ctrl?", 
                          "Renvoie true si la touche CTRL (ou une combinaison CTRL+key) est appuyée au moment de l'appel, false sinon",
                          {:key => ["Symbole référençant la touche (cf:attributs) mise en combinaison", :Symbol]}, 
                          true
  register_command :keyboard, "Command.ctrl?"

  link_method_documentation "Command.key_current", 
                          "Renvoie la touche activée selon la méthode passée en argument, nil si aucune touche n'est activée", 
                          {:method => ["Méthode d'activation (:press?, :release?, :trigger? etc.)", :Symbol]}, true
  register_command :keyboard, "Command.key_current"

  link_method_documentation "Command.key_current_rgss", 
                          "Renvoie la touche du RGSS (:X, :A, :B, :C etc.) activée selon la méthode passée en argument, nil si aucune touche n'est activée", 
                          {:method => ["Méthode d'activation (:press?, :release?, :trigger? etc.)", :Symbol]}, true
  register_command :keyboard, "Command.key_current_rgss"

  link_method_documentation "Command.key_time", 
                          "Renvoie le nombre de frame pressée d'une touche en cours", 
                          {:key => ["Touche à vérifier",:Symbol]}, true
  register_command :keyboard, "Command.key_time"

  link_method_documentation "Command.mouse_trigger?", 
                          "Renvoie true si la touche passée en argument (cf:attributs) vient d'être pressée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  register_command :mouse, "Command.mouse_trigger?"

  link_method_documentation "Command.mouse_press?", 
                          "Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  register_command :mouse, "Command.mouse_press?"

  link_method_documentation "Command.mouse_click?", 
                          "Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon. (Alias de Mouse.press?)",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  register_command :mouse, "Command.mouse_click?"

  link_method_documentation "Command.mouse_repeat?", 
                          "Renvoie true si la touche passée en argument (cf:attributs) est appuyée successivement, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  register_command :mouse, "Command.mouse_repeat?"

  link_method_documentation "Command.mouse_release?", 
                          "Renvoie true si la touche passée en argument (cf:attributs) vient d'être relâchée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  register_command :mouse, "Command.mouse_release?"

  link_method_documentation "Command.mouse_point", 
                          "Renvoie un point (possédant les attributs x, y) référençant la position de la souris en pixels par rapport à l'écran",
                          {}, true
  register_command :mouse, "Command.mouse_point"

  link_method_documentation "Command.mouse_x", 
                          "Renvoie la position (en pixels) X de la souris",
                          {}, true
  register_command :mouse, "Command.mouse_x"

  link_method_documentation "Command.mouse_y", 
                          "Renvoie la position (en pixels) Y de la souris",
                          {}, true
  register_command :mouse, "Command.mouse_y"

  link_method_documentation "Command.mouse_square_x", 
                          "Renvoie la position (en cases) X de la souris",
                          {}, true
  register_command :mouse, "Command.mouse_square_x"

  link_method_documentation "Command.mouse_square_y", 
                          "Renvoie la position (en cases) Y de la souris",
                          {}, true
  register_command :mouse, "Command.mouse_square_y"

  link_method_documentation "Command.mouse_rect", 
                          "Renvoie le rectangle de sélection de la souris (tracé en cours)",
                          {}, true
  register_command :mouse, "Command.mouse_rect"

  link_method_documentation "Command.mouse_last_rect", 
                          "Renvoie le dernier rectangle de sélection de la souris effectué",
                          {}, true
  register_command :mouse, "Command.mouse_last_rect"

  link_method_documentation "Command.mouse_dragging?", 
                          "Renvoie true si la souris est en train de sélectionner (cliquer/glisser) à l'écran",
                          {}, true
  register_command :mouse, "Command.mouse_dragging?"

  link_method_documentation "Command.mouse_in?", 
                          "Renvoie true si la souris se trouve dans le rectangle passé en argument",
                          {:rectangle => ["Rectangle à vérifier", :Rect]}, true
  register_command :mouse, "Command.mouse_in?"

  link_method_documentation "Command.mouse_all?", 
                          "Renvoie true si toutes les touches passées à keys sont activées selon la méthode passées à method", 
                          {
                            :method => ["Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activée selon la méthode", :Argslist]
                          }, true
  register_command :mouse, "Command.mouse_all?"

  link_method_documentation "Command.mouse_any?", 
                          "Renvoie true si toutes au moins une touches passée à keys est activée selon la méthode passées à method", 
                          {
                            :method => ["Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activée selon la méthode, si rien n'est passé, toutes les touches sont prises en compte", :Argslist]
                          }, true
  register_command :mouse, "Command.mouse_any?"

  link_method_documentation "Command.mouse_current_key", 
                          "Renvoie la touche activée selon la méthode passée en argument, nil si aucune touche n'est activée", 
                          {:method => ["Méthode d'activation (:press?, :release?, :trigger? etc.)", :Symbol]}, true
  register_command :mouse, "Command.mouse_current_key?"

  link_method_documentation "Command.click_time", 
                          "Renvoie le nombre de frame pressée d'une touche en cours", 
                          {:key => ["Touche à vérifier",:Symbol]}, true
  register_command :mouse, "Command.click_time"

  link_method_documentation "Command.picture_show", 
                          "Affiche une image à l'écran", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :name => ["Nom de l'image (sans l'extension)", :String],
                            :"*x" => ["Position en X de l'image (par défaut 0)", :Fixnum],
                            :"*y" => ["Position en X de l'image (par défaut 0)", :Fixnum],
                            :"*origin" => ["Origine de l'image, 0 = Haut gauche, 1 = centré, [x,y] = orienté autours de X,Y, par défaut, zéro", :Fixnum],
                            :"*zoom_x" => ["Zoom sur la largeur de l'image par défaut 100 (pour 100%)", :Fixnum],
                            :"*zoom_y" => ["Zoom sur la hauteur de l'image par défaut 100 (pour 100%)", :Fixnum],
                            :"*opacity" => ["Opacité de l'image, par défaut 255 (de 0 à 255)", :Fixnum],
                            :"*blend_type" => ["Mode de fusion, par défaut 0, 0=Normal, 1=Addition, 2=Soustraction", :Fixnum],
                          }
  register_command :picture, "Command.picture_show"

  link_method_documentation "Command.picture_origin", 
                          "Change l'origine d'une image", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :origin => ["Origine de l'image, 0 = Haut gauche, 1 = centré, [x,y] = orienté autours de X,Y, par défaut, zéro", :Fixnum],
                          }
  register_command :picture, "Command.picture_origin"

  link_method_documentation "Command.picture_x", 
                          "Change l'axe X d'une image", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :x => ["Position en x de l'image, si aucun argument n'est passé, la commande renverra la position X de l'image", :Fixnum],
                          }, true
  register_command :picture, "Command.picture_x"

  link_method_documentation "Command.picture_y", 
                          "Change l'axe Y d'une image", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :x => ["Position en y de l'image, si aucun argument n'est passé, la commande renverra la position Y de l'image", :Fixnum],
                          }, true
  register_command :picture, "Command.picture_y"
  link_method_documentation "Command.picture_position", 
                          "Change la position de l'image", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :x => ["Position en x de l'image", :Fixnum],
                            :y => ["Position en y de l'image", :Fixnum],
                          }, true
  register_command :picture, "Command.picture_move"
  link_method_documentation "Command.picture_move", 
                          "Déplace une image", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :x => ["Position en x de l'image où l'image doit se rendre", :Fixnum],
                            :y => ["Position en y de l'image où l'image doit se rendre", :Fixnum],
                            :zoom_x => ["Zoom de la largeur (en %)", :Fixnum],
                            :zoom_y => ["Zoom de la hauteur (en %)", :Fixnum],
                            :duration => ["Durée du déplacement en frames", :Fixnum],
                            :"*wait_flag" => ["Attendre la fin du déplacement, par défaut, true", :Boolean],
                            :"*opacity" => ["Opacitée (de 0 à 255) que l'image devra avoir, si aucun argument n'est donné, l'image conserva son opacité actuelle", :Fixnum],
                            :"*blend_type" => ["Mode de fusion (0, 1, 2) que l'image devra avoir, si aucun argument n'est donné, l'image conserva son mode de fusion actuel", :Fixnum],
                            :"*origin" => ["Origine que l'image devra avoir, si aucun argument n'est donné, l'image conserva son origine actuelle", :Fixnum],

                          }
  register_command :picture, "Command.picture_move"
  link_method_documentation "Command.picture_wave", 
                          "Fait onduler l'image", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :amplitude => ["Amplitude (taille de l'ondulation)", :Fixnum],
                            :vitesse => ["Vitesse de l'ondulation", :Fixnum],
                          }
  register_command :picture, "Command.picture_wave"
  link_method_documentation "Command.picture_flip", 
                          "Applique un effet miroir sur l'image", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                          }
  register_command :picture, "Command.picture_flip"
  link_method_documentation "Command.picture_angle", 
                          "Change l'angle de l'image", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :angle => ["Angle d'orientation de l'image. Si aucun angle n'est donné, la commande renverra l'angle de l'image", :Fixnum],
                          }, true
  register_command :picture, "Command.picture_angle"
  link_method_documentation "Command.picture_rotate", 
                          "Fait tourner l'image", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :speed => ["Vitesse de rotation de l'image", :Fixnum],
                          }
  register_command :picture, "Command.picture_rotate"
  link_method_documentation "Command.picture_zoom_x", 
                          "Change la largeur d'une image", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :zoom => ["Pourcentage d'agrandissement de la largeur de l'image. Si aucun angle n'est donné, la commande renverra le zoom_x de l'image.", :Fixnum],
                          }, true
  register_command :picture, "Command.picture_zoom_x"
  link_method_documentation "Command.picture_zoom_y", 
                          "Change la hauteur d'une image", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :zoom => ["Pourcentage d'agrandissement de la hauteur de l'image. Si aucun angle n'est donné, la commande renverra le zoom_y de l'image.", :Fixnum],
                          }, true
  register_command :picture, "Command.picture_zoom_y"
  link_method_documentation "Command.picture_zoom", 
                          "Change la taille d'une image", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :zoom_x => ["Pourcentage d'agrandissement de la largeur de l'image", :Fixnum],
                            :zoom_y => ["Pourcentage d'agrandissement de la hauteur de l'image. Si cet argument est ommis, la largeur sera égal à la hauteur.", :Fixnum],
                          }, true
  register_command :picture, "Command.picture_zoom"
  link_method_documentation "Command.picture_tone", 
                          "Change la teinte d'une image", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :tone => ["Teinte de l'image", :Tone],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut false", :Boolean],
                          }
  register_command :picture, "Command.picture_tone"

  link_method_documentation "Command.picture_blend", 
                          "Change le mode de fusion d'une image", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :mode => ["Mode choisi (0, 1 ou 2)", :Fixnum],
                          }
  register_command :picture, "Command.picture_blend"
  link_method_documentation "Command.picture_pin", 
                          "Fait défiler une image avec la carte (la fixe à une position)", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :x => ["Coordonnées X de la carte en pixel", :Fixnum],
                            :y => ["Coordonnées X de la carte en pixel", :Fixnum]
                          }
  register_command :picture, "Command.picture_pin"
  link_method_documentation "Command.picture_erase", 
                          "Efface l'image", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                          }
  register_command :picture, "Command.picture_erase"
  link_method_documentation "Command.pictures_clear", 
                          "Efface toutes les images", 
                          {
                          }
  register_command :picture, "Command.pictures_clear"
  link_method_documentation "Command.picture_unpin", 
                          "Arrête de faire défiler une image avec la carte", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                          }
  register_command :picture, "Command.picture_unpin"
  link_method_documentation "Command.picture_opacity", 
                          "Change l'opacité d'une image", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :opacity => ["valeur de l'opacité (de 0 à 255)", :Fixnum],
                          }
  register_command :picture, "Command.picture_opacity"
  link_method_documentation "Command.picture_shake", 
                          "Fait trembler l'image pendant un temps donné", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :power => ["La puissance du tremblement", :Fixnum],
                            :speed => ["La vitesse du tremblement", :Fixnum],
                            :duration => ["La durée en frame du tremblement", :Fixnum],
                          }
  register_command :picture, "Command.picture_opacity"
  link_method_documentation "Command.pixel_in_picture?", 
                          "Vérifie que le x, y sont inscrit dans l'image", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :x => ["Coordonnées X", :Fixnum],
                            :y => ["Coordonnées Y", :Fixnum],
                            :"*precise" => ["Par défaut, precise vaut false, si precise vaut true, seuls les pixels non transparent seront prit en compte", :Boolean]
                          }, true
  register_command :picture, "Command.pixel_in_picture?"

  link_method_documentation "Command.pictures_collide?", 
                          "Vérifie que deux images sont en collisions", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :id2 => ["ID de l'autre image", :Fixnum],
                          }, true
  link_method_documentation "Command.picture_scroll_x", 
                          "Change la vitesse de défilement horizontal d'une image fixée sur la carte", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :vitesse => ["Vitesse de défilement", :Fixnum],
                          }
  register_command :picture, "Command.picture_scroll_x"
  link_method_documentation "Command.picture_scroll_y", 
                          "Change la vitesse de défilement vertical d'une image fixée sur la carte", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :vitesse => ["Vitesse de défilement", :Fixnum],
                          }
  register_command :picture, "Command.picture_scroll_y"
  link_method_documentation "Command.picture_scroll", 
                          "Change la vitesse de défilement (vertical et horizontal) d'une image fixée sur la carte", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :vitesse => ["Vitesse de défilement", :Fixnum],
                          }
  register_command :picture, "Command.picture_scroll"
  link_method_documentation "Command.parallax_show", 
                          "Affiche un panorama", 
                          {
                            :id => ["ID du panorama", :Fixnum],
                            :name => ["Nom du panorama", :String],
                            :"*z" => ["Axe Z (par défaut - 100)", :Fixnum],
                            :"*opacity" => ["Opacité (par défaut 255)", :Fixnum],
                            :"*auto_x" => ["Défilement automatique horizontal (par défaut 0, ne défile pas)", :Fixnum],
                            :"*auto_y" => ["Défilement automatique vertical (par défaut 0, ne défile pas)", :Fixnum],
                            :"*scroll_x" => ["Défilement horizontal (par défaut 2, à la même vitesse que la carte. 1 = vitesse du panorama de VXace)", :Fixnum],
                            :"*scroll_y" => ["Défilement vertical (par défaut 2, à la même vitesse que la carte. 1 = vitesse du panorama de VXace)", :Fixnum],
                            :"*blend_type" => ["Mode de fusion (par défaut 0), mode normal", :Fixnum],
                            :"*zoom_x" => ["Zoom horizontal (par défaut 100)", :Fixnum],
                            :"*zoom_y" => ["Zoom vertical (par défaut 100)", :Fixnum],
                            :"*tone" => ["Teinte, utilisez la commande tone (rubrique Standard), par défaut teinte normale", :Tone]
                          }
  register_command :parallax, "Command.parallax_show"
  link_method_documentation "Command.parallax_transform", 
                          "Transforme un panorama durant une période", 
                          {
                            :id => ["ID du panorama", :Fixnum],
                            :duration => ["Durée en frame du déplacement", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut false", :Boolean],
                            :"*zoom_x" => ["Zoom horizontal (par défaut 100)", :Fixnum],
                            :"*zoom_y" => ["Zoom vertical (par défaut 100)", :Fixnum],
                            :"*opacity" => ["Opacité (par défaut 255)", :Fixnum],
                            :"*tone" => ["Teinte, utilisez la commande tone (rubrique Standard), par défaut aucun changement de teinte", :Tone]
                          }
  register_command :parallax, "Command.parallax_transform"
  link_method_documentation "Command.parallax_erase", 
                          "Supprime un panorama", 
                          {
                            :id => ["ID du panorama", :Fixnum]
                          }
  register_command :parallax, "Command.parallax_erase"
  link_method_documentation "Command.parallaxes_clear", 
                          "Supprime tous les panoramas", 
                          {}
  register_command :parallax, "Command.parallaxes_clear"
  link_method_documentation "Command.parallax_blend", 
                          "Change le mode de fusion d'un panorama", 
                          {
                            :id => ["ID du panorama", :Fixnum], 
                            :blend_type => ["mode de fusion (0 => normal, 1 => Addition, 2 => Soustraction)", :Fixnum]
                          }
  register_command :parallax, "Command.parallax_blend"
  link_method_documentation "Command.parallax_autoscroll_x", 
                          "Défilement horizontal automatique d'un panorama", 
                          {
                            :id => ["ID du panorama", :Fixnum], 
                            :speed => ["Vitesse de défilement", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }
  register_command :parallax, "Command.parallax_autoscroll_x"
  link_method_documentation "Command.parallax_autoscroll_y", 
                          "Défilement vertical automatique d'un panorama", 
                          {
                            :id => ["ID du panorama", :Fixnum], 
                            :speed => ["Vitesse de défilement", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }
  register_command :parallax, "Command.parallax_autoscroll_y"
  link_method_documentation "Command.parallax_scroll_x", 
                          "Défilement horizontal d'un panorama par rapport au défilement de la carte", 
                          {
                            :id => ["ID du panorama", :Fixnum], 
                            :speed => ["Vitesse de défilement", :Fixnum]
                          }
  register_command :parallax, "Command.parallax_scroll_x"
  link_method_documentation "Command.parallax_scroll_y", 
                          "Défilement vertical d'un panorama par rapport au défilement de la carte", 
                          {
                            :id => ["ID du panorama", :Fixnum], 
                            :speed => ["Vitesse de défilement", :Fixnum]
                          }
  register_command :parallax, "Command.parallax_scroll_y"
  link_method_documentation "Command.parallax_zoom_x", 
                          "Zoom horizontal d'un panorama", 
                          {
                            :id => ["ID du panorama", :Fixnum], 
                            :zoom => ["taille en pourcentage", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }
  register_command :parallax, "Command.parallax_zoom_x"
  link_method_documentation "Command.parallax_zoom_y", 
                          "Zoom vertical d'un panorama", 
                          {
                            :id => ["ID du panorama", :Fixnum], 
                            :zoom => ["taille en pourcentage", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }
  register_command :parallax, "Command.parallax_zoom_y"
  link_method_documentation "Command.parallax_zoom", 
                          "Zoom sur les deux axes d'un panorama", 
                          {
                            :id => ["ID du panorama", :Fixnum], 
                            :zoom => ["taille en pourcentage", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }
  register_command :parallax, "Command.parallax_zoom"
  link_method_documentation "Command.parallax_tone", 
                          "Change la teinte d'un panorama", 
                          {
                            :id => ["ID du panorama", :Fixnum], 
                            :tone => ["teinte du panorama (utilisez la commande tone des commandes standars)", :Tone],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }
  register_command :parallax, "Command.parallax_tone"
  link_method_documentation "Command.parallax_opacity", 
                        "Change l'opacité d'un panorama", 
                        {
                          :id => ["ID du panorama", :Fixnum], 
                          :opacity => ["valeur de l'opacité (0 à 255)", :Fixnum],
                          :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                          :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                        }
  register_command :parallax, "Command.parallax_opacity"


  # # Retirée car trop peu performante en ce moment :)
  # register_command :picture, "Command.pictures_collide?"
  # link_method_documentation "Command.pictures_perfect_collide?", 
  #                         "Vérifie que deux images sont en collisions en tenant compte de la transparence (Attention, actuellement cette commande lag beaucoup)", 
  #                         {
  #                           :id => ["ID de l'image", :Fixnum],
  #                           :id2 => ["ID de l'autre image", :Fixnum],
  #                         }, true
  # register_command :picture, "Command.pictures_perfect_collide?"



link_method_documentation "Command.team_size", 
                        "Renvoie la taille de l'équipe",
                        {}, true
register_command :party, "Command.team_size"

link_method_documentation "Command.gold", 
                        "Renvoie l'argent possédé",
                        {}, true
register_command :party, "Command.gold"

link_method_documentation "Command.steps", 
                        "Renvoie le nombre de pas effectué par l'équipe",
                        {}, true
register_command :party, "Command.steps"

link_method_documentation "Command.play_time", 
                        "Renvoie le temps de jeu en secondes",
                        {}, true
register_command :party, "Command.play_time"

link_method_documentation "Command.timer", 
                        "Renvoie la valeur du chronomètre",
                        {}, true
register_command :party, "Command.timer"

link_method_documentation "Command.save_count", 
                        "Renvoie le nombre de sauvegarde effectuées par partie",
                        {}, true
register_command :party, "Command.save_count"

link_method_documentation "Command.battle_count", 
                        "Renvoie le nombre de combat effectués par partie",
                        {}, true
register_command :party, "Command.battle_count"

link_method_documentation "Command.item_count", 
                        "Renvoie le nombre d'objet référencé par son ID possédés par l'équipe",
                        {:id => ["Id de l'objet à compter", :Fixnum]}, true
register_command :items, "Command.item_count"

link_method_documentation "Command.weapon_count", 
                        "Renvoie le nombre d'armes référencées par son ID possédées par l'équipe",
                        {:id => ["Id de l'arme à compter", :Fixnum]}, true
register_command :weapons, "Command.weapon_count"

link_method_documentation "Command.armor_count", 
                        "Renvoie le nombre d'armures référencées par son ID possédées par l'équipe",
                        {:id => ["Id de l'armure à compter", :Fixnum]}, true
register_command :armors, "Command.armor_count"

link_method_documentation "Command.item_name", 
                        "Renvoie le nom de l'objet référencé par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :items, "Command.item_name"

link_method_documentation "Command.weapon_name", 
                        "Renvoie le nom de l'arme référencée par son ID",
                        {:id => ["Id de l'arme", :Fixnum]}, true
register_command :weapons, "Command.weapon_name"

link_method_documentation "Command.armor_name", 
                        "Renvoie le nom de l'armure référencé par son ID",
                        {:id => ["Id de l'armure", :Fixnum]}, true
register_command :armors, "Command.armor_name"

link_method_documentation "Command.item_note", 
                        "Renvoie le commentaire de l'objet référencé par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :items, "Command.item_note"

link_method_documentation "Command.weapon_note", 
                        "Renvoie le commentaire de l'arme référencée par son ID",
                        {:id => ["Id de l'arme", :Fixnum]}, true
register_command :weapons, "Command.weapon_note"

link_method_documentation "Command.armor_note", 
                        "Renvoie le commentaire de l'armure référencé par son ID",
                        {:id => ["Id de l'armure", :Fixnum]}, true
register_command :armors, "Command.armor_note"

link_method_documentation "Command.item_description", 
                        "Renvoie la description de l'objet référencé par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :items, "Command.item_description"

link_method_documentation "Command.weapon_description", 
                        "Renvoie la description de l'arme référencée par son ID",
                        {:id => ["Id de l'arme", :Fixnum]}, true
register_command :weapons, "Command.weapon_description"

link_method_documentation "Command.armor_description", 
                        "Renvoie la description de l'armure référencé par son ID",
                        {:id => ["Id de l'armure", :Fixnum]}, true
register_command :armors, "Command.armor_description"

link_method_documentation "Command.item_icon", 
                        "Renvoie l'index de l'icone de l'objet référencé par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :items, "Command.item_icon"

link_method_documentation "Command.weapon_icon", 
                        "Renvoie l'index de l'icone de l'arme référencée par son ID",
                        {:id => ["Id de l'arme", :Fixnum]}, true
register_command :weapons, "Command.weapon_icon"

link_method_documentation "Command.armor_icon", 
                        "Renvoie l'index de l'icone  de l'armure référencé par son ID",
                        {:id => ["Id de l'armure", :Fixnum]}, true
register_command :armors, "Command.armor_icon"

link_method_documentation "Command.item_price", 
                        "Renvoie le prix de l'objet référencé par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :items, "Command.item_price"

link_method_documentation "Command.weapon_price", 
                        "Renvoie le prix de l'arme référencée par son ID",
                        {:id => ["Id de l'arme", :Fixnum]}, true
register_command :weapons, "Command.weapon_price"

link_method_documentation "Command.armor_price", 
                        "Renvoie le prix  de l'armure référencé par son ID",
                        {:id => ["Id de l'armure", :Fixnum]}, true
register_command :armors, "Command.armor_price"

link_method_documentation "Command.item_consumable?", 
                        "Renvoie true si l'objet référencé par son ID est consommable, false sinon",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :items, "Command.item_consumable?"

link_method_documentation "Command.is_key_item?", 
                        "Renvoie true si l'objet référencé par son ID est un objet clé, false sinon",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :items, "Command.is_key_item?"

link_method_documentation "Command.weapon_max_hit_points", 
                        "Renvoie le maximum des points de vie d'une arme référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :weapons, "Command.weapon_max_hit_points"

link_method_documentation "Command.weapon_max_magic_points", 
                        "Renvoie le maximum des points de magie d'une arme référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :weapons, "Command.weapon_max_magic_points"

link_method_documentation "Command.weapon_attack_power", 
                        "Renvoie la puissance d'attaque d'une arme référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :weapons, "Command.weapon_attack_power"

link_method_documentation "Command.weapon_defense_power", 
                        "Renvoie la puissance de défense d'une arme référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :weapons, "Command.weapon_defense_power"

link_method_documentation "Command.weapon_magic_attack_power", 
                        "Renvoie la puissance d'attaque magique d'une arme référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :weapons, "Command.weapon_magic_attack_power"

link_method_documentation "Command.weapon_magic_defense_power", 
                        "Renvoie la puissance de défense magique d'une arme référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :weapons, "Command.weapon_magic_defense_power"

link_method_documentation "Command.weapon_agility", 
                        "Renvoie l'apport d'agilité d'une arme référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :weapons, "Command.weapon_agility"

link_method_documentation "Command.weapon_luck", 
                        "Renvoie l'apport de chance d'une arme référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :weapons, "Command.weapon_luck"

link_method_documentation "Command.armor_max_hit_points", 
                        "Renvoie le maximum des points de vie d'une armure référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :armors, "Command.armor_max_hit_points"

link_method_documentation "Command.armor_max_magic_points", 
                        "Renvoie le maximum des points de magie d'une armure référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :armors, "Command.armor_max_magic_points"

link_method_documentation "Command.armor_attack_power", 
                        "Renvoie la puissance d'attaque d'une armure référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :armors, "Command.armor_attack_power"

link_method_documentation "Command.armor_defense_power", 
                        "Renvoie la puissance de défense d'une armure référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :armors, "Command.armor_defense_power"

link_method_documentation "Command.armor_magic_attack_power", 
                        "Renvoie la puissance d'attaque magique d'une armure référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :armors, "Command.armor_magic_attack_power"

link_method_documentation "Command.armor_magic_defense_power", 
                        "Renvoie la puissance de défense magique d'une armure référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :armors, "Command.armor_magic_defense_power"

link_method_documentation "Command.armor_agility", 
                        "Renvoie l'apport d'agilité d'une armure référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :armors, "Command.armor_agility"

link_method_documentation "Command.armor_luck", 
                        "Renvoie l'apport de chance d'une armure référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :armors, "Command.armor_luck"

link_method_documentation "Command.give_item", 
                        "Fait gagner à l'équipe l'objet référencé par son ID",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                          :amount => ["Nombre à donner. Si le nombre est négatif, l'objet sera retiré", :Fixnum], 

                        }
register_command :items, "Command.give_item"

link_method_documentation "Command.give_weapon", 
                        "Fait gagner à l'équipe l'arme référencé par son ID",
                        {
                          :id => ["Id de l'arme", :Fixnum], 
                          :amount => ["Nombre à donner. Si le nombre est négatif, l'objet sera retiré", :Fixnum], 
                          :"*include_equipement" => ["Ce paramètre n'est utile que si on supprime des objets (ammount négatif). Si cette variable vaut true, les objets équipés seront déséquipés si l'inventaire n'en possède pas assez. Par défaut, il vaut false. Donc pas de déséquipement", :Boolean]

                        }
register_command :weapons, "Command.give_weapon"

link_method_documentation "Command.give_armor", 
                        "Fait gagner à l'équipe l'armure référencé par son ID",
                        {
                          :id => ["Id de l'armure", :Fixnum], 
                          :amount => ["Nombre à donner. Si le nombre est négatif, l'objet sera retiré", :Fixnum], 
                          :"*include_equipement" => ["Ce paramètre n'est utile que si on supprime des objets (ammount négatif). Si cette variable vaut true, les objets équipés seront déséquipés si l'inventaire n'en possède pas assez. Par défaut, il vaut false. Donc pas de déséquipement", :Boolean]

                        }
register_command :armors, "Command.give_armor"

link_method_documentation "Command.has_item?", 
                        "Renvoie true si l'objet référencé par son ID est possédé par l'équipe, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 

                        }, true
register_command :items, "Command.has_item?"

link_method_documentation "Command.has_weapon?", 
                        "Renvoie true si l'arme référencé par son ID est possédée par l'équipe, false sinon",
                        {
                          :id => ["Id de l'arme", :Fixnum], 
                           :"*include_equipement" => ["Si ce paramètre vaut true, la commande prend en compte l'équipement, sinon (false), elle ne le prend pas en compte (par défaut: false)", :Boolean]

                        }, true
register_command :weapons, "Command.has_weapon?"

link_method_documentation "Command.has_armor?", 
                        "Renvoie true si l'armure référencé par son ID est possédée par l'équipe, false sinon",
                        {
                          :id => ["Id de l'armure", :Fixnum], 
                           :"*include_equipement" => ["Si ce paramètre vaut true, la commande prend en compte l'équipement, sinon (false), elle ne le prend pas en compte (par défaut: false)", :Boolean]

                        }, true
register_command :armors, "Command.has_armor?"
link_method_documentation "Command.weapon_equiped?", 
                        "Renvoie true si l'arme référencé par son ID est équipée par un des membres de l'équipe, false sinon",
                        {
                          :id => ["Id de l'arme", :Fixnum], 
                          :"*member_id" => ["Id du membre de l'équipe. Si aucun membre_id n'est spécifié, la commande vérifiera pour toute l'équipe ", :Fixnum], 
                        }, true
register_command :weapons, "Command.weapon_equiped?"
link_method_documentation "Command.armor_equiped?", 
                        "Renvoie true si l'armure référencé par son ID est équipée par un des membres de l'équipe, false sinon",
                        {
                          :id => ["Id de l'armure", :Fixnum], 
                          :"*member_id" => ["Id du membre de l'équipe. Si aucun membre_id n'est spécifié, la commande vérifiera pour toute l'équipe ", :Fixnum],
                        }, true
register_command :armors, "Command.armor_equiped?"

link_method_documentation "Command.weapon_type", 
                        "Renvoie le type de l'arme référencée par son ID",
                        {
                          :id => ["Id de l'arme", :Fixnum], 
                        }, true
register_command :weapons, "Command.weapon_type"

link_method_documentation "Command.armor_type", 
                        "Renvoie le type de l'armure référencée par son ID",
                        {
                          :id => ["Id de l'armure", :Fixnum], 
                        }, true
register_command :armors, "Command.armor_type"

link_method_documentation "Command.item_scope", 
                        "Renvoie la portée (en Entier) d'un objet référencée par son ID",
                        {
                          :id => ["Id de l'armure", :Fixnum], 
                        }, true
register_command :items, "Command.item_scope"

link_method_documentation "Command.item_has_no_scope?", 
                        "Renvoie true si la cible d'un objet référencée par son ID vise personne, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_has_scope?"

link_method_documentation "Command.item_for_one_enemy?", 
                        "Renvoie true si la cible d'un objet référencée par son ID vise un ennemi, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_for_one_enemy?"

link_method_documentation "Command.item_for_all_enemies?", 
                        "Renvoie true si la cible d'un objet référencée par son ID vise tous les ennemis, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_for_all_enemies?"

link_method_documentation "Command.item_for_one_random_enemy?", 
                        "Renvoie true si la cible d'un objet référencée par son ID vise un ennemi au hasard, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_for_one_random_enemy?"

link_method_documentation "Command.item_for_two_random_enemies?", 
                        "Renvoie true si la cible d'un objet référencée par son ID vise deux ennemis au hasard, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_for_two_random_enemies?"

link_method_documentation "Command.item_for_three_random_enemies?", 
                        "Renvoie true si la cible d'un objet référencée par son ID vise trois ennemis au hasard, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_for_three_random_enemies?"

link_method_documentation "Command.item_for_four_random_enemies?", 
                        "Renvoie true si la cible d'un objet référencée par son ID vise quatre ennemis au hasard, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_for_four_random_enemies?"

link_method_documentation "Command.item_for_one_ally?", 
                        "Renvoie true si la cible d'un objet référencée par son ID vise un allié, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_for_one_ally?"

link_method_documentation "Command.item_for_all_allies?", 
                        "Renvoie true si la cible d'un objet référencée par son ID vise tous les alliés, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_for_all_allies?"

link_method_documentation "Command.item_for_one_dead_ally?", 
                        "Renvoie true si la cible d'un objet référencée par son ID vise un allié mort, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_for_one_dead_ally?"

link_method_documentation "Command.item_for_all_dead_allies?", 
                        "Renvoie true si la cible d'un objet référencée par son ID vise tous les alliés morts, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_for_all_dead_allies?"

link_method_documentation "Command.item_for_caller?", 
                        "Renvoie true si la cible d'un objet référencée par son ID l'utilisateur, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_for_caller?"

link_method_documentation "Command.item_occasion", 
                        "Renvoie un entier correspondant au droit d'utilisation de l'objet",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_occasion"

link_method_documentation "Command.item_always_usable?", 
                        "Renvoie true si l'objet référencé par son ID est utilisable partout",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_always_usable?"

link_method_documentation "Command.item_battle_usable?", 
                        "Renvoie true si l'objet référencé par son ID est utilisable en combat",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_battle_usable?"

link_method_documentation "Command.item_menu_usable?", 
                        "Renvoie true si l'objet référencé par son ID est utilisable dans le menu",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_menu_usable?"

link_method_documentation "Command.item_never_usable?", 
                        "Renvoie true si l'objet référencé par son ID n'est jamais utilisable",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_never_usable?"

link_method_documentation "Command.game_title", 
                        "Renvoie le titre du jeu",
                        {}, true
register_command :system, "Command.game_title"

link_method_documentation "Command.version_id", 
                        "Renvoie l'ID de la version du jeu",
                        {}, true
register_command :system, "Command.version_id"

link_method_documentation "Command.currency", 
                        "Renvoie la monnaie du jeu",
                        {}, true
register_command :system, "Command.currency"

link_method_documentation "Command.start_map_id", 
                        "Renvoie l'ID de la map de départ",
                        {}, true
register_command :system, "Command.start_map_id"

link_method_documentation "Command.start_x", 
                        "Renvoie la position X de départ du joueur",
                        {}, true
register_command :system, "Command.start_x"

link_method_documentation "Command.start_y", 
                        "Renvoie la position Y de départ du joueur",
                        {}, true
register_command :system, "Command.start_y"


link_method_documentation "Command.gain_gold", 
                        "Fait gagner de l'argent à l'équipe",
                        {:amount => "Total d'argent a faire gagner"}
register_command :party, "Command.gain_gold"

link_method_documentation "Command.lose_gold", 
                        "Fait perdre de l'argent à l'équipe",
                        {:amount => "Total d'argent a faire perdre"}
register_command :party, "Command.lose_gold"
=begin
link_method_documentation "Command.actor_", 
                        "héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }
register_command :actors, "Command.actor_"
=end

link_method_documentation "Command.actor_equip", 
                        "Renvoie l'id de l'équipement du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                          :slot => ["Slot d'équipement soit :Weapon, :Head, :Body, :Shield ou :Accessory", :Symbol]
                        }, true
register_command :actors, "Command.actor_equip"

link_method_documentation "Command.actor_weapon", 
                        "renvoie l'id de l'arme équipée du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                        }, true
register_command :actors, "Command.actor_weapon"

link_method_documentation "Command.actor_shield", 
                        "renvoie l'id du bouclier équipé du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                        }, true
register_command :actors, "Command.actor_shield"

link_method_documentation "Command.actor_head", 
                        "renvoie l'id du casque équipée du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                        }, true 
register_command :actors, "Command.actor_head"

link_method_documentation "Command.actor_body", 
                        "renvoie l'id de l'armure équipée du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                        }, true
register_command :actors, "Command.actor_body"

link_method_documentation "Command.actor_description", 
                        "renvoie la déscription du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                        }, true
register_command :actors, "Command.actor_description"

link_method_documentation "Command.actor_accessory", 
                        "renvoie l'id l' accessoire équipé du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                        }, true
register_command :actors, "Command.actor_accessory"

link_method_documentation "Command.actor_has_weapon?", 
                        "renvoie true si le héros référencé par son ID est équipé d'une arme, false sinon",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                        }, true
register_command :actors, "Command.actor_has_weapon?"

link_method_documentation "Command.actor_has_shield?", 
                        "renvoie true si le héros référencé par son ID est équipé d'un bouclier, false sinon",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                        }, true
register_command :actors, "Command.actor_has_shield?"

link_method_documentation "Command.actor_has_head?", 
                        "renvoie true si le héros référencé par son ID est équipé d'une casque, false sinon",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                        }, true
register_command :actors, "Command.actor_has_head?"

link_method_documentation "Command.actor_has_body?", 
                        "renvoie true si le héros référencé par son ID est équipé d'une armure, false sinon",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                        }, true
register_command :actors, "Command.actor_has_body?"

link_method_documentation "Command.actor_has_accessory?", 
                        "renvoie true si le héros référencé par son ID est équipé d'un accessoire, false sinon",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                        }, true
register_command :actors, "Command.actor_has_accessory?"

link_method_documentation "Command.actor_level", 
                        "renvoie le niveau du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                        }, true
register_command :actors, "Command.actor_level"

link_method_documentation "Command.actor_level_max", 
                        "renvoie le niveau maximum du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                        }, true
register_command :actors, "Command.actor_level_max"

link_method_documentation "Command.actor_exp", 
                        "renvoie les points d'expériences du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                        }, true
register_command :actors, "Command.actor_exp"

link_method_documentation "Command.actor_note", 
                        "renvoie le commentaire de la base de données du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                        }, true
register_command :actors, "Command.actor_note"

link_method_documentation "Command.actor_hp", 
                        "renvoie les points de vie du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                        }, true
register_command :actors, "Command.actor_hp"

link_method_documentation "Command.actor_mp", 
                        "renvoie les points de magie du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                        }, true
register_command :actors, "Command.actor_mp"

link_method_documentation "Command.actor_tp", 
                        "renvoie les points de temps du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                        }, true
register_command :actors, "Command.actor_tp"

link_method_documentation "Command.actor_max_hp", 
                        "renvoie le nombre de points de vie maximum du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_max_hp"

link_method_documentation "Command.actor_max_mp", 
                        "renvoie le nombre de points de magie du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_max_mp"

link_method_documentation "Command.actor_attack", 
                        "renvoie les points d'attaque du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_attack"

link_method_documentation "Command.actor_defense", 
                        "renvoie les points de défense du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_defense"

link_method_documentation "Command.actor_magic_attack", 
                        "renvoie les points d'attaque magique du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_magic_attack"

link_method_documentation "Command.actor_magic_defense", 
                        "renvoie les points de défense magique du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_magic_defense"

link_method_documentation "Command.actor_agility", 
                        "renvoie les points d'agilité du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_agility"

link_method_documentation "Command.actor_luck", 
                        "renvoie les points de chance du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_luck"

link_method_documentation "Command.actor_hit_rate", 
                        "renvoie la probabilité de toucher du héros référencé par son ID sur un ennemi",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_hit_rate"

link_method_documentation "Command.actor_evasion_rate", 
                        "renvoie la probabilité d'esquiver une attaque physique du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_evasion_rate"

link_method_documentation "Command.actor_critical_rate", 
                        "renvoie la probabilité de coup critique du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_critical_rate"

link_method_documentation "Command.actor_critical_evasion_rate", 
                        "renvoie la probabilité de faire un coup critique en préemptif du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_critical_evasion_rate"

link_method_documentation "Command.actor_magical_evasion_rate", 
                        "renvoie la probabilité d'une esquiver une attaque magique du héros référencé par son ID par un ennemi",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_magical_evasion_rate"

link_method_documentation "Command.actor_magical_reflection_rate", 
                        "renvoie la probabilité d'une réflexion magique du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_magical_reflexion_rate"

link_method_documentation "Command.actor_counter_attack_rate", 
                        "renvoie la probabilité d'un contre (sur une attaque physique) du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_counter_attack_rate"

link_method_documentation "Command.actor_hp_regeneration_rate", 
                        "renvoie le pourcentage de régénration de HP à chaque tour du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_hp_regeneration_rate"

link_method_documentation "Command.actor_mp_regeneration_rate", 
                        "renvoie le pourcentage de régénration MP à chaque tour du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_mp_regeneration_rate"

link_method_documentation "Command.actor_tp_regeneration_rate", 
                        "renvoie le pourcentage de régénration de TP par tour du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_tp_regeneration_rate"

link_method_documentation "Command.actor_target_rate", 
                        "renvoie la probabilité d'être ciblé par un ennemi, du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_target_rate"

link_method_documentation "Command.actor_guard_effect_rate", 
                        "renvoie la force de défense (diminution de l'attaque subie) du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_guard_effect_rate"

link_method_documentation "Command.actor_recovery_effect_rate", 
                        "renvoie le pourcentage de MP/HP recu, du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_recovery_effect_rate"

link_method_documentation "Command.actor_pharmacology", 
                        "renvoie le pourcentage de HP/MP récupéré via un objet du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_pharmacology"

link_method_documentation "Command.actor_mp_cost_rate", 
                        "renvoie le facteur d'un cout de MP (pour une attaque faisant varier la consommation de MP) du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_mp_cost_rate"

link_method_documentation "Command.actor_tp_charge_rate", 
                        "renvoie le facteur de cout de TP (pour une attaque faisant varier la consommation de TP) du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_tp_charge_rate"

link_method_documentation "Command.actor_physical_damage_rate", 
                        "renvoie le pourcentage de dommage physique reçu du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_physical_damage_rate"

link_method_documentation "Command.actor_magical_damage_rate", 
                        "renvoie le pourcentage de dommage magique reçu du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_magical_damage_rate"

link_method_documentation "Command.actor_floor_damage_rate", 
                        "renvoie le pourcentage de dommage des terrains reçu du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_floor_damage_rate"

link_method_documentation "Command.actor_experience_rate", 
                        "renvoie le pourcentage de la variation d'acquisition d'expérience du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_experience_rate"

link_method_documentation "Command.actor_name", 
                        "renvoie le nom du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_name"

link_method_documentation "Command.set_actor_name", 
                        "modifie le nom du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                          :new_name => ["Nouveau nom", :String]
                        }
register_command :actors, "Command.set_actor_name"

link_method_documentation "Command.actor_nickname", 
                        "renvoie le surnom du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }
register_command :actors, "Command.actor_nickname"

link_method_documentation "Command.set_actor_nickname", 
                        "modifie le surnom du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                          :new_name => ["Nouveau surnom", :String]
                        }
register_command :actors, "Command.set_actor_nickname"

link_method_documentation "Command.actor_character_name", 
                        "renvoie le nom du charset du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_character_name"

link_method_documentation "Command.actor_character_index", 
                        "renvoie l'index du charset du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_character_index"

link_method_documentation "Command.actor_face_name", 
                        "renvoie le nom du faceset du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_face_name"

link_method_documentation "Command.actor_face_index", 
                        "renvoie l'index du faceset du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_face_index"

link_method_documentation "Command.actor_class", 
                        "renvoie l'ID de la classe du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_class"

link_method_documentation "Command.actor_exp_for_next_level", 
                        "renvoie le nombre d'expérience nécéssaire pour passer au niveau suivant du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_exp_for_next_level"

link_method_documentation "Command.actor_change_equip", 
                        "Change l'équipement du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                          :slot => ["Slot d'équipement (:Weapon, :Body, :Shield, : Head, :Accessory)", :Symbol], 
                          :object_id => ["ID de l'Arme ou de l'Armure (La commande déduira s'il doit s'agir d'une arme ou d'une armure)", :Fixnum]
                        }
register_command :actors, "Command.actor_change_equip"

link_method_documentation "Command.actor_equip_weapon", 
                        "Change l'arme du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                          :object_id => ["ID de l'Arme", :Fixnum]
                        }
register_command :actors, "Command.actor_equip_weapon"

link_method_documentation "Command.actor_equip_shield", 
                        "Change le bouclier du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                          :object_id => ["ID de l'Armure", :Fixnum]
                        }
register_command :actors, "Command.actor_equip_shield"

link_method_documentation "Command.actor_equip_head", 
                        "Change le casque du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                          :object_id => ["ID de l'Armure", :Fixnum]
                        }
register_command :actors, "Command.actor_equip_head"

link_method_documentation "Command.actor_equip_body", 
                        "Change l'armure du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                          :object_id => ["ID de l'Armure", :Fixnum]
                        }
register_command :actors, "Command.actor_equip_body"

link_method_documentation "Command.actor_equip_accessory", 
                        "Change l'accessoire du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                          :object_id => ["ID de l'Armure", :Fixnum]
                        }
register_command :actors, "Command.actor_equip_accessory"

link_method_documentation "Command.actor_optimize_equipement", 
                        "Optimise l'équipement du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }
register_command :actors, "Command.actor_optimize_equipement"

link_method_documentation "Command.actor_level_up", 
                        "fait gagner un niveau au héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }
register_command :actors, "Command.actor_level_up"

link_method_documentation "Command.actor_level_down", 
                        "fait perdre un niveau au héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }
register_command :actors, "Command.actor_level_down"

link_method_documentation "Command.actor_give_exp", 
                        "fait gagner de l'expérience au héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum], 
                          :exp => ["Expérience donnée", :Fixnum]
                        }
register_command :actors, "Command.actor_give_exp"

link_method_documentation "Command.actor_learn", 
                        "Apprend la technique passée en argument au héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                          :skill_id => ["ID de le technique", :Fixnum],
                        }
register_command :actors, "Command.actor_learn"

link_method_documentation "Command.actor_forget", 
                        "Oublie la technique passée en argument au héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                          :skill_id => ["ID de le technique", :Fixnum],
                        }
register_command :actors, "Command.actor_forget"

link_method_documentation "Command.actor_knowns", 
                        "Renvoie true si le héros référencé par son ID connait la technique référencée par son ID, false sinon",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                          :skill_id => ["ID de le technique", :Fixnum],
                        }
register_command :actors, "Command.actor_knowns"

link_method_documentation "Command.actor_set_graphic", 
                        "Change les graphisme du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                          :character_name => ["Charset", :String],
                          :character_index => ["index du Charset", :Fixnum],
                          :face_name => ["Faceset", :String],
                          :face_index => ["Index du faceset", :Fixnum],
                        }
register_command :actors, "Command.actor_set_graphic"

link_method_documentation "Command.actor_weapons", 
                        "renvoie le tableau des ID's des armes équipées du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_weapons"


link_method_documentation "Command.actor_armors", 
                        "renvoie le tableau des ID's des armures équipées du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_armors"

link_method_documentation "Command.actor_skills", 
                        "renvoie le tableau des ID's des techniques connues du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_skills"

link_method_documentation "Command.skill_scope", 
                        "Renvoie la portée (en Entier) d'une technique référencée par son ID",
                        {
                          :id => ["Id de la techinuqe", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_scope"

link_method_documentation "Command.skill_has_no_scope?", 
                        "Renvoie true si la cible d'une technique référencée par son ID vise personne, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_has_scope?"

link_method_documentation "Command.skill_for_one_enemy?", 
                        "Renvoie true si la cible d'une technique référencée par son ID vise un ennemi, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_for_one_enemy?"

link_method_documentation "Command.skill_for_all_enemies?", 
                        "Renvoie true si la cible d'une technique référencée par son ID vise tous les ennemis, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_for_all_enemies?"

link_method_documentation "Command.skill_for_one_random_enemy?", 
                        "Renvoie true si la cible d'une technique référencée par son ID vise un ennemi au hasard, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_for_one_random_enemy?"

link_method_documentation "Command.skill_for_two_random_enemies?", 
                        "Renvoie true si la cible d'une technique référencée par son ID vise deux ennemis au hasard, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_for_two_random_enemies?"

link_method_documentation "Command.skill_for_three_random_enemies?", 
                        "Renvoie true si la cible d'une technique référencée par son ID vise trois ennemis au hasard, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_for_three_random_enemies?"

link_method_documentation "Command.skill_for_four_random_enemies?", 
                        "Renvoie true si la cible d'une technique référencée par son ID vise quatre ennemis au hasard, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_for_four_random_enemies?"

link_method_documentation "Command.skill_for_one_ally?", 
                        "Renvoie true si la cible d'une technique référencée par son ID vise un allié, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_for_one_ally?"

link_method_documentation "Command.skill_for_all_allies?", 
                        "Renvoie true si la cible d'une technique référencée par son ID vise tous les alliés, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_for_all_allies?"

link_method_documentation "Command.skill_for_one_dead_ally?", 
                        "Renvoie true si la cible d'une technique référencée par son ID vise un allié mort, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_for_one_dead_ally?"

link_method_documentation "Command.skill_for_all_dead_allies?", 
                        "Renvoie true si la cible d'une technique référencée par son ID vise tous les alliés morts, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_for_all_dead_allies?"

link_method_documentation "Command.skill_for_caller?", 
                        "Renvoie true si la cible d'une technique référencée par son ID l'utilisateur, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_for_caller?"

link_method_documentation "Command.skill_occasion", 
                        "Renvoie un entier correspondant au droit d'utilisation de la technique",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_occasion"

link_method_documentation "Command.skill_always_usable?", 
                        "Renvoie true si la technique référencé par son ID est utilisable partout",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_always_usable?"

link_method_documentation "Command.skill_battle_usable?", 
                        "Renvoie true si la technique référencé par son ID est utilisable en combat",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_battle_usable?"

link_method_documentation "Command.skill_menu_usable?", 
                        "Renvoie true si la technique référencé par son ID est utilisable dans le menu",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_menu_usable?"

link_method_documentation "Command.skill_never_usable?", 
                        "Renvoie true si la technique référencé par son ID n'est jamais utilisable",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_never_usable?"



end

## Documentation generator
if $TEST
  DocGenerator.markdown("../doc") 
  DocGenerator.html("../doc/HTML") 
end
