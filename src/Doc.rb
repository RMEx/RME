# -*- coding: utf-8 -*-
#==============================================================================
# ** RME Doc
#------------------------------------------------------------------------------
# With:
#  Nuki
#  Raho
#  Grim
#  Hiino
#
#==============================================================================

#==============================================================================
# ** Doc
#------------------------------------------------------------------------------
#  Documentation representation.
#==============================================================================

module Doc
  documentation_define :vocab,
  {
    #doc
    :title     => "RME : RPG Maker Extender",
    :desc      => "Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)",
    :index     => "Documentation",
    #class
    :cl_title  => "Classes et modules",
    #methods
    :m_desc    => "Description des méthodes",
    :m_list    => "Liste des méthodes",
    #commands
    :cmd_title => "Index des commandes",
    :cmd_desc  => "Description des commandes",
    :cmd_list  => "Liste des commandes",
    #labels
    :l_attr    => "Attributs",
    :l_name    => "Nom",
    :l_type    => "Type",
    :l_desc    => "Description",
    :l_sample  => "Exemple",
    #other
    :links     => "Liens utiles",
    :documented   => "Commandes documentées",
    :undocumented => "Commandes non documentées",
    :orphans      => "Commandes inconnues",
    :suggest      => "Suggestion",
    :ease_desc    => "Fonction à utiliser pour effectuer la transition. :InLinear par défaut."
  }
  documentation_add_link "GitHub", "https://github.com/RMEx/RME"
  documentation_add_link "Manuel d'utilisation (Wiki)", "https://github.com/RMEx/RME/wiki"
end


#==============================================================================
# ** Object
#------------------------------------------------------------------------------
#  The superclass of all classes. Defines the general behavior of objects.
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
# ** Array
#------------------------------------------------------------------------------
#  The Array class
#==============================================================================

class Array
  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Extension des arrays"
  link_method_documentation :"self.to_point",
                            "Retourne l'objet Point, que le tableau ait la forme [x, y] ou [Point]",
                            {}, true
  link_method_documentation :"self.to_xy",
                            "Retourne les valeurs 'x, y', que le tableau ait la forme [x, y] ou [Point]",
                            {}, true
  link_snippet "self.to_xy",
"def foo?(*p)
  x, y = p.to_xy
  bar(x, y)
end
# La méthode foo? pourra recevoir soit (x, y), soit une instance de point en argument"
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
                            "Vérifie si le point passé en argument (via (x, y), ou via une instance de Point) est inscrit dans le rectangle du sprite",
                            {
                              :x=> ["Coordonnées X du point", :Fixnum],
                              :y=> ["Coordonnées Y du point", :Fixnum]
                            }, true
  link_method_documentation :"self.precise_in?",
                            "Vérifie si le point passé en argument (via (x, y), ou via une instance de Point) est inscrit dans le bitmap du sprite, en tenant compte de la transparence",
                            {
                              :x=> ["Coordonnées X du point", :Fixnum],
                              :y=> ["Coordonnées Y du point", :Fixnum]
                            }, true
  link_method_documentation :"self.hover?",
                            "Vérifie si la souris passe au dessus du rectangle du sprite",
                            {}, true
  link_method_documentation :"self.click?",
                            "Vérifie si la souris clique sur le rectangle du sprite",
                            {}, true
  link_method_documentation :"self.press?",
                            "Vérifie si l'utilisateur a enfoncé la touche de la souris passée en argument au-dessus du rectangle du sprite",
                            {:key => ["Touche d'activation", :Symbol]}, true
  link_method_documentation :"self.trigger?",
                            "Vérifie si l'utilisateur a cliqué une fois avec la touche de la souris passée en argument au-dessus du rectangle du sprite",
                            {:key => ["Touche d'activation", :Symbol]}, true
  link_method_documentation :"self.repeat?",
                            "Vérifie si l'utilisateur a cliqué de manière répétée la touche de la souris passée en argument au-dessus du rectangle du sprite",
                            {:key => ["Touche d'activation", :Symbol]}, true
  link_method_documentation :"self.release?",
                            "Vérifie si l'utilisateur a relâché la touche de la souris passée en argument au-dessus du rectangle du sprite",
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
                            "Vérifie si le point passé en argument (via (x, y), ou via une instance de Point) est inscrit dans le rectangle",
                            {
                              :x=> ["Coordonnées X du point", :Fixnum],
                              :y=> ["Coordonnées Y du point", :Fixnum]
                            }, true
  link_method_documentation :"self.hover?",
                            "Vérifie si la souris passe au dessus du rectangle",
                            {}, true
  link_method_documentation :"self.click?",
                            "Vérifie si l'utilisateur a cliqué sur le rectangle",
                            {}, true
  link_method_documentation :"self.press?",
                            "Vérifie si l'utilisateur a enfoncé la touche de la souris passée en argument au-dessus du rectangle",
                            {:key => ["Touche d'activation", :Symbol]}, true
  link_method_documentation :"self.trigger?",
                            "Vérifie si l'utilisateur a cliqué une fois avec la touche de la souris passée en argument au-dessus du rectangle",
                            {:key => ["Touche d'activation", :Symbol]}, true
  link_method_documentation :"self.repeat?",
                            "Vérifie si l'utilisateur a cliqué une fois avec la touche de la souris passée en argument au-dessus du rectangle",
                            {:key => ["Touche d'activation", :Symbol]}, true
  link_method_documentation :"self.release?",
                            "Vérifie si l'utilisateur a relâché la touche de la souris passée en argument au-dessus du rectangle",
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
                            "Retourne l'objet Color correspondant au point passé en argument (via (x, y), ou via une instance de Point) de manière très rapide",
                            {
                              :x => ["Coordonnées X", :Fixnum],
                              :y => ["Coordonnées Y", :Fixnum]
                            }, true
  link_method_documentation :"self.is_transparent?",
                            "Vérifie si le point passé en argument (via (x, y), ou via une instance de Point) est sur un pixel transparent",
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
  link_class_documentation "Extension des chaînes de caractères"
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
                            {:rect => ["Rectangle à vérifier", :Rect]}, true
  link_method_documentation :"self.null!",
                            "Replace le X et le Y du point à zéro",
                            {}
  link_method_documentation :"self.rotate",
                            "Rotation du point par rapport au point passé en argument (via (x, y), ou via une instance de Point)",
                            {
                              :angle => ["Angle de rotation en degrés décimaux (sens positif = sens trigonométrique)", :Fixnum],
                              :x => ["Coordonnées X du point à l'origine de la rotation", :Fixnum],
                              :y => ["Coordonnées Y du point à l'origine de la rotation", :Fixnum]
                            }
  link_method_documentation :"self.screen_to_sprite",
                            "Transforme les coordonnées du point, de l'écran vers le référentiel du sprite",
                            {:sprite => ["Sprite à vérifier", :Sprite]}
  link_method_documentation :"self.screen_to_bitmap",
                            "Transforme les coordonnées du point, de l'écran vers le référentiel du bitmap en fonction des paramètres du sprite",
                            {:sprite => ["Sprite à vérifier", :Sprite]}
  link_method_documentation :"self.bitmap_to_screen",
                            "Transforme les coordonnées du point, du référentiel du bitmap vers l'écran en fonction des paramètres du sprite",
                            {:sprite => ["Sprite à vérifier", :Sprite]}
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
                          "Renvoie true si la touche est pressée de manière répétée, false sinon",
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
                          "Renvoie true si la touche passée en argument (cf:attributs) est appuyée de manière répétée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  link_method_documentation "Keyboard.release?",
                          "Renvoie true si la touche passée en argument (cf:attributs) vient d'être relâchée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  link_method_documentation "Keyboard.all?",
                          "Renvoie true si toutes les touches passées à keys sont activées selon la méthode passée à method",
                          {
                            :method => ["Méthode pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activées selon la méthode", :Argslist]
                          }, true
  link_snippet "Keyboard.all?", "p 'A, B et C sont pressées' if Keyboard.all?(:press?, :a, :b, :c)"
  link_method_documentation "Keyboard.any?",
                          "Renvoie true si au moins une touche passée à keys est activée selon la méthode passées à method",
                          {
                            :method => ["Méthode pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activée selon la méthode, si rien n'est passé, toutes les touches sont prises en compte", :Argslist]
                          }, true
  link_snippet "Keyboard.all?", "p 'A, B et C sont pressées' if Keyboard.all?(:press?, :a, :b, :c)"
  link_method_documentation "Keyboard.current_char",
                          "Renvoie le caractère pressé sur clavier au moment de l'appel",
                          {}, true
  link_method_documentation "Keyboard.current_digit",
                          "Renvoie le chiffre pressé sur le clavier au moment de l'appel",
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
                          "Renvoie, en nombre de frames, le temps de pression de la touche du clavier choisie",
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
                          "Renvoie true si la touche passée en argument (cf:attributs) est appuyée de manière répétée, false sinon",
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
                            :method => ["Méthode pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activée selon la méthode", :Argslist]
                          }, true
  link_snippet "Mouse.all?", "p 'souris gauche et souris droit sont pressées' if Mouse.all?(:press?, :mouse_left, :mouse_right)"
  link_method_documentation "Mouse.any?",
                          "Renvoie true si au moins une touche passée à keys est activée selon la méthode passée à method",
                          {
                            :method => ["Méthode pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activées selon la méthode, si rien n'est passé, toutes les touches sont prises en compte", :Argslist]
                          }, true
  link_method_documentation "Mouse.current_key",
                          "Renvoie la touche activée selon la méthode passée en argument, nil si aucune touche n'est activée",
                          {:method => ["Méthode d'activation (:press?, :release?, :trigger? etc.)", :Symbol]}, true
  link_method_documentation "Mouse.time",
                          "Renvoie, en nombre de frames, le temps de pression de la touche de la souris choisie, au moment de l'appel",
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

  register_command_category :mapinfo, "Carte", "Commandes relatives aux informations des cartes"
  register_command_category :standard, "Standards", "Commandes standards"
  register_command_category :event, "Evénements", "Commandes relatives aux évènements"
  register_command_category :keyboard, "Clavier", "Commandes relatives au clavier"
  register_command_category :mouse, "Souris", "Commande relatives à la gestion de la souris"
  register_command_category :picture, "Images", "Commandes relatives à la manipulation des images"
  register_command_category :spritesheet, "Spritesheet", "Commandes relatives à la manipulation des feuilles de Sprites"
  register_command_category :parallax, "Panoramas", "Commandes relatives à la manipulation des panoramas"
  register_command_category :micro, "Micro-événements", "Commandes relatives à la gestion des micro events"
  register_command_category :party, "Equipes", "Commande associées à la gestion de l'équipe de héros"
  register_command_category :items, "Objets", "Commandes permettant d'obtenir ou de manipuler les objets"
  register_command_category :armors, "Armures", "Commandes permettant de manipuler les armures"
  register_command_category :weapons, "Armes", "Commandes permettant de manipuler les armes"
  register_command_category :system, "Systèmes", "Offre une collection d'informations sur le système"
  register_command_category :actors, "Acteurs", "Offre des commandes pour obtenir des informations sur les acteurs"
  register_command_category :skills, "Techniques", "Offre des commandes pour obtenir des informations sur les techniques"
  register_command_category :math, "Mathématiques", "Outils de traitement mathématiques un peu avancé"
  register_command_category :troop, "Groupes", "Informations sur les groupes de monstres"
  register_command_category :enemy, "Ennemis", "Informations sur les monstres rencontrables tels que définis dans la base de données, donc utilisables partout."
  register_command_category :in_battle, "En combat", "Commandes d'informations en combat (en plus de la base de données). Uniquement valide en combat"
  register_command_category :text, "Textes", "Commandes pour afficher du texte à l'écran, les textes sont référencés par des ID, comme les images."
  register_command_category :date, "Date/Heure", "Commandes pour récupérer des informations sur la date et l'heure"
  register_command_category :socket, "Client-Serveur", "Commandes pour communiquer avec un serveur TCP/IP"
  register_command_category :scene, "Scenes", "Commandes pour naviguer entre les scenes de jeu (et de systèmes)"
  register_command_category :save, "Sauvegardes", "Commandes pour gérer et naviguer entre les sauvegardes"
  register_command_category :area, "Zones virtuelles", "Commandes pour créer et manipuler des zones virtuelles"
  register_command_category :textfield, "Champs de texte", "Commande pour manipuler des champs de texte saisissables au clavier"
  register_command_category :clipboard, "Presse-papier", "Permet d'envoyer des données dans le presse-papier ou de récupérer le texte stocké dans le presse-papier"
  register_command_category :xbox, "Vibrations (XBOX360)", "Permet de manipuler la vibration des manettes de la XBOX360"
  register_command_category :sound, "Sons", "Commandes relatives à la manipulation des sons"
  register_command_category :camera, "Caméra", "Commandes relatives à la manipulation de la caméra (scrolling de la carte)"
  register_command_category :screen, "Ecran", "Commandes pour manipuler l'écran (teintes, vibrations etc)"
  register_command_category :window, "Fenêtres", "Commandes pour créer/modifier des fenêtres. Attention, lorsque vous utilisez du texte, utilisez de préférence les apostrophes comme séparateur. Cette collection de commande est documentée dans le Wiki!"
  register_command_category :game_window, "Fenêtre de jeu", "Commandes de manipulation de la fenêtre de jeu"
  register_command_category :fx, "Effets spéciaux", "Effets spéciaux sur la carte"

  link_class_documentation "Collection des commandes EventExtender"

  add_internals :enemy, :troop, :monster_battler_dimension, :distance_between, :bind, :unbind
  add_internals :type_equip, :sys, :spriteset, :sprite_picture, :screen, :picture
  add_internals :scene, :event, :method_missing, :pictures, :scene, :follower

  # EE4 Fixture
  add_internals :windows_username, :parallax_scrollspeed, :picture_origine
  add_internals :picture_detach, :key_number, :key_char, :key_char?, :maj?
  add_internals :mouse_x_square, :mouse_y_square, :show_cursor_system, :delete_save
  add_internals :monster_attack, :monster_magic_attack, :monster_defense
  add_internals :monster_hp, :monster_mp, :troop_member_id, :actor_experience
  add_internals :actor_magic, :collide?, :look_at, :look_at?
  add_internals :actor_experience_rate, :mouse_clicked_event?, :mouse_clicked_player?
  add_internals :monster_magic_defense, :server_single_close_connection
  add_internals :server_single_connect,:server_single_recv,:server_single_send
  add_internals :server_single_wait_recv, :buzz, :tilemap

  add_internals :mouse_square_hover_area?,:mouse_clicked_area?,:mouse_square_clicked_area?
  add_internals :mouse_triggered_area?,:mouse_square_triggered_area?,:mouse_pressed_area?
  add_internals :mouse_square_pressed_area?,:mouse_released_area?,:mouse_square_released_area?
  add_internals :mouse_repeated_area?, :mouse_square_repeated_area?

  # AUTOGenerated for message
link_method_documentation 'Command.message',
	'Affiche un message à l\'écran',
 	{
		:value => ["Message à afficer", :String],
		:"*face_name" => ["Nom du faceset (peut être remplacé par nil pour ne pas en afficher), il faut utiliser \\n pour afficher plusieurs lignes", :String],
		:"*face_index" => ["Index du faceset (ne sert à rien si aucun faceset n'est donnée)", :Fixnum],
		:"*position" => ["Position de la fenêtre de message (0 = en haut, 1 au centre, 2 en bas), par défaut vaut 2", :Fixnum],
		:"*background" => ["Fond du message, 0 normal, 1 sombre, 2 transparent", :Fixnum],

	}
register_command :standard, 'Command.message'

# AUTOGenerated for choice
link_method_documentation 'Command.choice',
'Affiche un choix (potentiellement de plus de 4 options) et retourne la valeur du choix (1 pour le premier)',
 {
  :array => ["List des possibilité, par exemple ['oui', 'non', 'autre']", :Array],
  :index_if_cancelled => ["Valeur a attribuer si l'utilisateur annule, si ce paramètre vaut 0, il sera impossible d'annuler le choix et ça peut être une autre valeur, par exemple 100 :)", :Fixnum],
  :"*value" => ["Message à afficer", :String],
  :"*face_name" => ["Nom du faceset (peut être remplacé par nil pour ne pas en afficher), il faut utiliser \\n pour afficher plusieurs lignes", :String],
  :"*face_index" => ["Index du faceset (ne sert à rien si aucun faceset n'est donnée)", :Fixnum],
  :"*position" => ["Position de la fenêtre de message (0 = en haut, 1 au centre, 2 en bas), par défaut vaut 2", :Fixnum],
  :"*background" => ["Fond du message, 0 normal, 1 sombre, 2 transparent", :Fixnum],

}, true # Maybe changed
register_command :standard, 'Command.choice'

# AUTOGenerated for last_choice
link_method_documentation 'Command.last_choice',
'Commande pour récupérer le dernier choix effectué',
 {}, true # Maybe changed
register_command :standard, 'Command.last_choice'

link_method_documentation 'Command.game_window_rect',
	'Renvoie le rectangle correspondant à la fenêtre de jeu',
 	{}, true # Maybe changed
register_command :game_window, 'Command.game_window_rect'

# AUTOGenerated for flash_square
link_method_documentation 'Command.flash_square',
	'Fait clignoter une case selon une couleur',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],
		:color => ["Couleur du flash (utilisez la commande color)", :Color],

	}
register_command :standard, 'Command.flash_square'

# AUTOGenerated for unflash_square
link_method_documentation 'Command.unflash_square',
	'Arrête le clignotement',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}
register_command :standard, 'Command.unflash_square'

# AUTOGenerated for flash_rect
link_method_documentation 'Command.flash_rect',
	'Fait clignoter un rectangle de cases',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],
		:width => ["Largeur du rectangle", :Fixnum],
		:height => ["Largeur du rectangle", :Fixnum],
		:color => ["Couleur du flash (utilisez la commande color)", :Color],

	}
register_command :standard, 'Command.flash_rect'

# AUTOGenerated for unflash_rect
link_method_documentation 'Command.unflash_rect',
	'Arrête de faire clignoter les cases référencées par le rectangle',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],
		:width => ["Largeur du rectangle", :Fixnum],
		:height => ["Largeur du rectangle", :Fixnum],

	}
register_command :standard, 'Command.unflash_rect'

  link_method_documentation 'Command.call_common_event',
  	'Exécute l\'événement commun référencé par son ID',
   	{
  		:id => ["ID de l'événement commun à exécuter", :Fixnum],

  	}, false
  register_command :standard, 'Command.call_common_event'

  link_method_documentation "Command.max",
                        "Renvoie la plus grande des deux valeurs A, B",
                        {
                          :a => ["Valeur de A", :Object],
                          :b => ["Valeur de B", :Object]
                        }, true
  register_command :standard, "Command.max"

  link_method_documentation "Command.min",
                        "Renvoie la plus petite des deux valeurs A, B",
                        {
                          :a => ["Valeur de A", :Object],
                          :b => ["Valeur de B", :Object]
                        }, true
  register_command :standard, "Command.min"

  link_method_documentation "Command.tone",
                        "Renvoie une teinte",
                        {
                          :red => ["Valeur de rouge, entre -255 et 255", :Fixnum],
                          :green => ["Valeur de vert, entre -255 et 255", :Fixnum],
                          :blue => ["Valeur de bleu, entre -255 et 255", :Fixnum],
                          :"*gray" => ["Valeur de gris, entre 0 et 255, par défaut 0 !", :Fixnum]
                        }, true
  register_command :standard, "Command.tone"

  link_method_documentation "Command.get",
                        "Renvoie la cellule à la valeur donnée d'un tableau",
                        {:array =>["Tableau", :Array], :index => ["Index à trouver", :Fixnum]}, true
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
  register_command :standard, "Command.color"

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
                          :duration => ["Nombre de frames à attendre", :Fixnum],
                        }
  register_command :standard, "Command.wait"

  link_method_documentation "Command.random_figures",
                        "Renvoie un nombre à virgule aléatoire compris entre x et x+1",
                        {
                          :x => ["Valeur de base (si cet argument n'est pas spécifié, le résultat sera compris entre 0 et 1)", :Fixnum]
                        }, true
  register_command :standard, "Command.random_figures"

  link_method_documentation "Command.map_id",
                        "Renvoie l'ID de la map en cours. Idéalement, utiliser c(:map_id) qui est plus sur!",
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
                          :y => ["Coordonnées Y de la case", :Fixnum],
                          :layer => ["Numéro de la couche", :Fixnum],
                          :"*map_id" => ["ID d'une carte, si aucun argument n'est donné, map_id vaut l'id de la map courante", :Fixnum],
                        }, true
  register_command :mapinfo, "Command.tile_id"

  link_method_documentation 'Command.set_tile_where',
  	'Change tous les tile d\'une carte selon un ID et un layer',
   	{
  		:layer => ["Numero de la couche", :Fixnum],
  		:id => ["Id du tile à remplacer", :Fixnum],
  		:new_id => ["Nouvel Id du tile", :Fixnum],

  	}
  register_command :mapinfo, 'Command.set_tile_where'

  # AUTOGenerated for delete_tiles
  link_method_documentation 'Command.delete_tiles',
  	'Supprime tous les tiles référencés par un ID et un layer',
   	{
  		:layer => ["Numéro de la couche", :Fixnum],
  		:id => ["Id du tile à supprimer", :Fixnum],

  	}
  register_command :mapinfo, 'Command.delete_tiles'

  # AUTOGenerated for set_tile
  link_method_documentation 'Command.set_tile',
  	'Change une case de tile',
   	{
  		:value => ["Valeur du tile (utilisez éventuellement la commande tile_id)", :Fixnum],
  		:x => ["Coordonnées X", :Fixnum],
  		:y => ["Coordonnées Y", :Fixnum],
  		:layer => ["Couche de la carte (1,2 ou 3)", :Fixnum],

  	}, true # Maybe changed
  register_command :mapinfo, 'Command.set_tile'

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

  # AUTOGenerated for event_moving?
  link_method_documentation 'Command.event_moving?',
  	'Renvoie true si l\'évènement est en mouvement, false sinon.',
   	{
  		:id => ["Id de l'événement", :Fixnum],

  	}, true # Maybe changed
  register_command :event, 'Command.event_moving?'

  # AUTOGenerated for player_moving?
  link_method_documentation 'Command.player_moving?',
  	'Renvoie true si le héros est en mouvement, false sinon',
   	{}, true # Maybe changed
  register_command :event, 'Command.player_moving?'

  # AUTOGenerated for event_trail
  link_method_documentation 'Command.event_trail',
  	'Applique une traînée sur un sélecteur d\'évènements',
   	{
  		:ids => ["Sélecteur d'évènements à qui attribuer une traînée", :Selector],
  		:len => ["Taille de la trainée", :Fixnum],
  		:"*mode" => ["Mode de fusion de la traînée (0, 1 ou 2), par défaut: 0", :Fixnum],
  		:"*mode" => ["Teinte de la trainée (utilisez la commande tone)", :Tone],

  	}
  register_command :event, 'Command.event_trail'

  # AUTOGenerated for pixel_in_event?
  link_method_documentation 'Command.pixel_in_event?',
  	'Renvoie true si le pixel (x, y) est inclu dans l\'événement, false sinon',
   	{
  		:id => ["Args description", :ArgType],
  		:x => ["Coordonnées X du point à vérifier", :Fixnum],
  		:y => ["Coordonnées Y du point à vérifier", :Fixnum],
  		:"*precise" => ["Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut true ", :Boolean],

  	}, true # Maybe changed
  register_command :event, 'Command.pixel_in_event?'

  # AUTOGenerated for pixel_in_player?
  link_method_documentation 'Command.pixel_in_player?',
  	'Renvoie true si le pixel (x, y) est inclu dans le joueur, false sinon',
   	{
  		:x => ["Coordonnées X du point à vérifier", :Fixnum],
  		:y => ["Coordonnées Y du point à vérifier", :Fixnum],
  		:"*precise" => ["Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut true ", :Boolean],

  	}, true # Maybe changed
  register_command :event, 'Command.pixel_in_player?'

  # AUTOGenerated for event_opacity
  link_method_documentation 'Command.event_opacity',
  	'Modifie (ou retourne) l\'opacité d\'un évènement ',
   	{
  		:ids => ["Id de l'évènement (ne pas utiliser de selecteur pour renvoyer l'opacité)", :Selector],
  		:"*value" => ["Valeur de l'opacité, entre 0 et 255. Si aucune valeur n'est donnée, la commande retourne l'opacité de l'évènement ciblé.", :Fixnum],

  	}, true # Maybe changed
  register_command :event, 'Command.event_opacity'

  # AUTOGenerated for event_tone
link_method_documentation 'Command.event_tone',
'Change la teinte d\'un événement référencé par son ID',
 {
  :ids => ["Id de l'évènement", :Selector],
  :tone => ["Teinte de l'évènement (utilisez la commande tone)", :Tone],
  :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
  :"*wait_flag" => ["Attend la fin du déplacement, par défaut false", :Boolean],
  :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],

}, false # Maybe changed
register_command :event, 'Command.event_tone'

# AUTOGenerated for player_tone
link_method_documentation 'Command.player_tone',
'Change la teinte du joueur',
 {
  :tone => ["Teinte de l'évènement (utilisez la commande tone)", :Tone],
  :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
  :"*wait_flag" => ["Attend la fin du déplacement, par défaut false", :Boolean],
  :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],

}, false # Maybe changed
register_command :event, 'Command.player_tone'


  # AUTOGenerated for player_opacity
  link_method_documentation 'Command.player_opacity',
  	'Modifie (ou retourne) l\'opacité du héros',
   	{
  		:"*value" => ["Valeur de l'opacité, entre 0 et 255. Si aucune valeur n'est donnée. La commande retourne l'opacité du héros.", :Fixnum],

  	}, true # Maybe changed
  register_command :event, 'Command.player_opacity'

  # AUTOGenerated for event_ox
  link_method_documentation 'Command.event_ox',
  	'Modifie (ou retourne) la coordonnée X du point de départ d\'un événement (le point d\'accroche)',
   	{
  		:id => ["ID de l'événement", :Fixnum],
  		:"*value" => ["Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante", :Fixnum],

  	}, true # Maybe changed
  register_command :event, 'Command.event_ox'

  # AUTOGenerated for event_oy
  link_method_documentation 'Command.event_oy',
  'Modifie (ou retourne) la coordonnée y du point de départ d\'un événement (le point d\'accroche)',
   	{
  		:id => ["ID de l'événement", :Fixnum],
  		:"*value" => ["Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante", :Fixnum],

  	}, true # Maybe changed
  register_command :event, 'Command.event_oy'

  # AUTOGenerated for player_ox
  link_method_documentation 'Command.player_ox',
  'Modifie (ou retourne) la coordonnée X du point de départ du héros (le point d\'accroche)',
   	{
  		:"*value" => ["Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante", :Fixnum],

  	}, true # Maybe changed
  register_command :event, 'Command.player_ox'

  # AUTOGenerated for player_oy
  link_method_documentation 'Command.player_oy',
  'Modifie (ou retourne) la coordonnée Y du point de départ du héros (le point d\'accroche)',
   	{
  		:"*value" => ["Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante", :Fixnum],

  	}, true # Maybe changed
  register_command :event, 'Command.player_oy'

  # AUTOGenerated for event_zoom_x
  link_method_documentation 'Command.event_zoom_x',
  'Modifie (ou retourne) la valeur du zoom horizontal d\'un événement',
   	{
  		:id => ["ID de l'événement", :Fixnum],
  		:"*value" => ["Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante", :Fixnum],

  	}, true # Maybe changed
  register_command :event, 'Command.event_zoom_x'

  # AUTOGenerated for event_zoom_y
  link_method_documentation 'Command.event_zoom_y',
  'Modifie (ou retourne) la valeur du zoom vertical d\'un événement',
   	{
  		:id => ["ID de l'événement", :Fixnum],
  		:"*value" => ["Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante", :Fixnum],

  	}, true # Maybe changed
  register_command :event, 'Command.event_zoom_y'

  # AUTOGenerated for event_zoom
  link_method_documentation 'Command.event_zoom',
  'Modifie le zoom d\'un événement',
   	{
  		:id => ["ID de l'événement", :Fixnum],
  		:value => ["Valeur du zoom", :Fixnum],

  	}
  register_command :event, 'Command.event_zoom'

  # AUTOGenerated for event_restore_origin
  link_method_documentation 'Command.event_restore_origin',
  	'Restore l\'origine de l\'événement référencé par son ID',
   	{
  		:id => ["ID de l'événement", :Fixnum],

  	}
  register_command :event, 'Command.event_restore_origin'

  # AUTOGenerated for player_restore_origin
  link_method_documentation 'Command.player_restore_origin',
  	'Restore l\'origine du héros',
   	{}
  register_command :event, 'Command.player_restore_origin'

  # AUTOGenerated for player_zoom_x
  link_method_documentation 'Command.player_zoom_x',
  'Modifie (ou retourne) la valeur du zoom horizontal du héros',
   	{
  		:"*value" => ["Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante", :Fixnum],

  	}, true # Maybe changed
  register_command :event, 'Command.player_zoom_x'

  # AUTOGenerated for player_zoom_y
  link_method_documentation 'Command.player_zoom_y',
  'Modifie (ou retourne) la valeur du zoom vertical du héros',
   	{
  		:"*value" => ["Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante", :Fixnum],

  	}, true # Maybe changed
  register_command :event, 'Command.player_zoom_y'

  # AUTOGenerated for player_zoom
  link_method_documentation 'Command.player_zoom',
  'Modifie le zoom du héros',
   	{
  		:value => ["Valeur du zoom", :Fixnum],

  	}
  register_command :event, 'Command.player_zoom'



  # AUTOGenerated for player_trail
  link_method_documentation 'Command.player_trail',
  	'Applique une traînée sur le joueur',
   	{
  		:len => ["Taille de la traînée", :Fixnum],
  		:"*mode" => ["Mode de fusion de la traînée (0, 1 ou 2), par défaut: 0", :Fixnum],
  		:"*tone" => ["Teinte de la traînée (utilisez la commande tone)", :Tone],

  	}
  register_command :event, 'Command.player_trail'

  # AUTOGenerated for event_stop_trail
  link_method_documentation 'Command.event_stop_trail',
  	'Arrête la trainée sur un sélecteur d\'évènements',
   	{
  		:ids => ["Sélecteur d'évènements à qui attribuer une traînée", :Selector],

  	}
  register_command :event, 'Command.event_stop_trail'

  # AUTOGenerated for player_stop_trail
  link_method_documentation 'Command.player_stop_trail',
  	'Arrête la traînée sur le joueur',
   	{}
  register_command :event, 'Command.player_stop_trail'

  # AUTOGenerated for event_brutal_stop_trail
  link_method_documentation 'Command.event_brutal_stop_trail',
  	'Arrête brutalement la traînée sur un sélecteur d\'évènements',
   	{
  		:ids => ["Sélecteur d'évènements à qui attribuer une traînée", :Selector],

  	}
  register_command :event, 'Command.event_brutal_stop_trail'

  # AUTOGenerated for player_brutal_stop_trail
  link_method_documentation 'Command.player_brutal_stop_trail',
  	'Arrête brutalement la traînée sur le joueur',
   	{}
  register_command :event, 'Command.player_brutal_stop_trail'


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
                        {"*erased".to_sym => ["Si cette valeur vaut true, la commande renverra le plus petit ID d'un événement supprimé", :Boolean]}, true
  register_command :event, "Command.fresh_event_id"

  link_method_documentation "Command.mouse_hover_event?",
                        "Renvoie true si la souris survole un évènement du sélecteur passé en argument",
                        {:events => ["Selecteur d'évènements", :Selectors],
                          :"*precise" => ["Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut true ", :Boolean],}, true
  register_command :event, "Command.mouse_hover_event?"

  link_method_documentation "Command.mouse_click_event?",
                        "Renvoie true si la souris clique sur un évènement du sélecteur passé en argument",
                        {:events => ["Selecteur d'évènements", :Selectors],
                          :"*precise" => ["Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut false ", :Boolean],}, true
  register_command :event, "Command.mouse_click_event?"

  link_method_documentation "Command.mouse_press_event?",
                        "Renvoie true si la souris reste pressée sur un évènement du sélecteur passé en argument",
                        {
                          :events => ["Selecteur d'évènements", :Selectors],
                          :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left)", :Symbol],
                          :"*precise" => ["Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut false ", :Boolean],
                        }, true
  register_command :event, "Command.mouse_press_event?"

  link_method_documentation "Command.mouse_trigger_event?",
                        "Renvoie true si la souris vient de cliquer un évènement du sélecteur passé en argument",
                        {
                          :events => ["Selecteur d'évènements", :Selectors],
                          :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left)", :Symbol],
                          :"*precise" => ["Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut false ", :Boolean],
                        }, true
  register_command :event, "Command.mouse_trigger_event?"

  link_method_documentation "Command.mouse_repeat_event?",
                        "Renvoie true si la souris clique de manière répétée un évènement du sélecteur passé en argument",
                        {
                          :events => ["Selecteur d'évènements", :Selectors],
                          :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left)", :Symbol],
                          :"*precise" => ["Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut false ", :Boolean],
                        }, true
  register_command :event, "Command.mouse_repeat_event?"

  link_method_documentation "Command.mouse_release_event?",
                        "Renvoie true si la souris est relâchée sur un évènement du sélecteur passé en argument",
                        {
                          :events => ["Selecteur d'évènements", :Selectors],
                          :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left)", :Symbol],
                          :"*precise" => ["Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut false ", :Boolean],
                        }, true
  register_command :event, "Command.mouse_release_event?"

  link_method_documentation "Command.event_x",
                        "Renvoie la coordonnées X de la case sur laquelle se trouve l'évènement référencé par son ID",
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
                        "Renvoie la coordonnée Y de la case sur laquelle se trouve l'évènement référencé par son ID",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum]}, true
  register_command :event, "Command.event_y"

  link_method_documentation "Command.event_screen_x",
                        "Renvoie la coordonnée X de l'évènement référencé par son ID par rapport à l'écran",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum]}, true
  register_command :event, "Command.event_screen_x"

  link_method_documentation "Command.event_screen_y",
                        "Renvoie la coordonnée Y de l'évènement référencé par son ID par rapport à l'écran",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum]}, true
  register_command :event, "Command.event_screen_y"

  link_method_documentation "Command.event_pixel_x",
                        "Renvoie la coordonnée X de l'évènement référencé par son ID en pixel sur la carte",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum]}, true
  register_command :event, "Command.event_pixel_x"

  link_method_documentation "Command.event_pixel_y",
                        "Renvoie la coordonnée Y de l'évènement référencé par son ID en pixel sur la carte",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum]}, true
  register_command :event, "Command.event_pixel_y"

  link_method_documentation "Command.event_change_character",
                        "Change l\'apparence d'un évènement référencé par son ID",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum],
                         :character_name => ["Nom du caractère", :String],
                         :character_index => ["ID du caractère", :Fixnum]}, true
  register_command :event, 'Command.event_change_character'

  link_method_documentation "Command.event_character_name",
                        "Renvoie le nom du charset utilisé pour l'apparence de l'évènement référencé par son ID",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum]}, true
  register_command :event, "Command.event_character_name"

  link_method_documentation "Command.event_character_index",
                        "Renvoie l'ID du character sur le charset l'évènement référencé par son ID",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum]}, true
  register_command :event, "Command.event_character_index"

  link_method_documentation "Command.current_event_id",
                        "Renvoie l'ID de l'évènement en cours, alias : me", {}, true
  register_command :event, "Command.current_event_id"

  link_method_documentation "Command.me",
                        "Renvoie l'ID de l'évènement en cours, alias : current_event_id", {}, true
  register_command :event, "Command.me"

  link_method_documentation "Command.event_direction",
                        "Renvoie (ou change) la direction (2 pour le bas, 8, pour le haut, 4 pour la gauche , 6 pour la droite ) de l'évènement référencé par son ID",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum],
                          :"*value" => ["Valeur de la direction, 2,4,6,8. Si aucune valeur n'est donnée, la commande retourne la direction de l'évènement ciblé.", :Fixnum]}, true
  register_command :event, "Command.event_direction"

  link_method_documentation "Command.player_x",
                        "Renvoie la coordonnée X de la case sur laquelle est le joueur",
                         {}, true
  register_command :event, "Command.player_x"

  link_method_documentation "Command.player_y",
                        "Renvoie la coordonnée Y de la case sur laquelle est le joueur",
                       {}, true
  register_command :event, "Command.player_y"

  link_method_documentation "Command.player_screen_x",
                        "Renvoie la coordonnée X du joueur par rapport à l'écran",
                        {}, true
  register_command :event, "Command.player_screen_x"

  link_method_documentation "Command.player_screen_y",
                        "Renvoie la coordonnée Y du joueur par rapport à l'écran",
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
                        "Renvoie (ou change) la direction (2 pour le bas, 8, pour le haut, 4 pour la gauche , 6 pour la droite ) du joueur",
                        {:"*value" => ["Valeur de la direction, 2,4,6,8. Si aucune valeur n'est donnée, la commande retourne la direction du héros", :Fixnum]}, true
  register_command :event, "Command.player_direction"

  link_method_documentation "Command.squares_between",
                        "Renvoie le nombre de cases entre deux évènements référencés par leurs ID",
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
                        "Renvoie true si l'évènement A regarde dans la direction de l'évènement B et que celui ci est dans son périmètre, false sinon",
                        {
                          :idA => ["ID de l'évènement A (0 pour héros)", :Fixnum],
                          :idB => ["ID de l'évènement B (0 pour héros)", :Fixnum],
                          :scope => ["Nombre de cases ou de pixels", :Fixnum],
                          :"*metric" => ["par défaut :square pour en cases, mettre :pixels pour en pixels", :Fixnum],

                        },
                        true
  register_command :event, "Command.event_look_at?"

  # AUTOGenerated for event_move_with
  link_method_documentation 'Command.event_move_with',
  	'Applique un déplacement (selon un code) à un événement',
   	{
  		:id => ["Id de l'événement", :Fixnum],
  		:code => ["Liste des codes de déplacement", :Fixnum],

  	}
  register_command :event, 'Command.event_move_with'

  # AUTOGenerated for player_move_with
  link_method_documentation 'Command.player_move_with',
  	'Applique un déplacement (selon un code) au héros',
   	{
  		:code => ["Liste des codes de déplacement", :Fixnum],

  	}
  register_command :event, 'Command.player_move_with'

  link_method_documentation "Command.events_collide?",
                        "Renvoie true si l'evenement A est en collision avec l'évènement B, false sinon",
                        {
                          :idA => ["ID de l'évènement A (0 pour héros)", :Fixnum],
                          :idB => ["ID de l'évènement B (0 pour héros)", :Fixnum],

                        },
                        true
  register_command :event, "Command.events_collide?"



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
                          "Renvoie true si la touche passée en argument (cf:attributs) est appuyée de manière répétée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  register_command :keyboard, "Command.key_repeat?"

  link_method_documentation "Command.key_release?",
                          "Renvoie true si la touche passée en argument (cf:attributs) vient d'être relâchée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  register_command :keyboard, "Command.key_release?"

  link_method_documentation "Command.keyboard_all?",
                          "Renvoie true si toutes les touches passées à keys sont activées selon la méthode passée à method",
                          {
                            :method => ["Méthode pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activées selon la méthode", :Argslist]
                          }, true
  register_command :keyboard, "Command.keyboard_all?"

  link_method_documentation "Command.keyboard_any?",
                          "Renvoie true si  au moins une touche passée à keys est activée selon la méthode passée à method",
                          {
                            :method => ["Méthode pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activée selon la méthode, si rien n'est passé, toutes les touches sont prises en compte", :Argslist]
                          }, true
  register_command :keyboard, "Command.keyboard_any?"

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
                          "Renvoie, en nombre de frames, le temps de pression d'une touche de clavier choisie",
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
                          "Renvoie true lorsqu'on effectue un clic gauche",
                          {},
                          true
  register_command :mouse, "Command.mouse_click?"

  link_method_documentation "Command.mouse_repeat?",
                          "Renvoie true si la touche passée en argument (cf:attributs) est appuyée de manière répétée, false sinon",
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
                          "Renvoie true si toutes les touches passées à keys sont activées selon la méthode passée à method",
                          {
                            :method => ["Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activées selon la méthode", :Argslist]
                          }, true
  register_command :mouse, "Command.mouse_all?"

  link_method_documentation "Command.mouse_any?",
                          "Renvoie true si au moins une touche passée à keys est activée selon la méthode passée à method",
                          {
                            :method => ["Méthode pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activée selon la méthode, si rien n'est passé, toutes les touches sont prises en compte", :Argslist]
                          }, true
  register_command :mouse, "Command.mouse_any?"

  link_method_documentation "Command.mouse_current_key",
                          "Renvoie la touche activée selon la méthode passée en argument, nil si aucune touche n'est activée",
                          {:method => ["Méthode d'activation (:press?, :release?, :trigger? etc.)", :Symbol]}, true
  register_command :mouse, "Command.mouse_current_key"

  link_method_documentation "Command.click_time",
                          "Renvoie, en nombre de frames, la durée de pression d'une touche de souris choisie",
                          {:key => ["Touche à vérifier",:Symbol]}, true
  register_command :mouse, "Command.click_time"

  # AUTOGenerated for picture_mouse_hover?
  link_method_documentation 'Command.picture_mouse_hover?',
  	'Renvoie true si la souris survol l\'image référencée par son ID',
   	{
  		:id => ["ID de l'image", :Fixnum],
  		:"*precise" => ["si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false", :Boolean],

  	}, true # Maybe changed
  register_command :picture, 'Command.picture_mouse_hover?'

  # AUTOGenerated for picture_mouse_click?
  link_method_documentation 'Command.picture_mouse_click?',
  	'Renvoie true si la souris survol et est cliquée l\'image référencée par son ID',
   	{
  		:id => ["ID de l'image", :Fixnum],
  		:"*precise" => ["si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false", :Boolean],

  	}, true # Maybe changed
  register_command :picture, 'Command.picture_mouse_click?'

  # AUTOGenerated for picture_mouse_press?
  link_method_documentation 'Command.picture_mouse_press?',
  	'Renvoie true si la souris survol et presse en continu la touche référencée sur l\'image référencée par son ID',
   	{
  		:id => ["ID de l'image", :Fixnum],
  		:"*key" => ["Touche de la souris (par défaut, :mouse_left)", :Symbol],
  		:"*precise" => ["si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false", :Boolean],

  	}, true # Maybe changed
  register_command :picture, 'Command.picture_mouse_press?'

  # AUTOGenerated for picture_mouse_trigger?
  link_method_documentation 'Command.picture_mouse_trigger?',
  	'Renvoie true si la souris survol et presse la touche référencée sur l\'image référencée par son ID',
   	{
  		:id => ["ID de l'image", :Fixnum],
  		:"*key" => ["Touche de la souris (par défaut, :mouse_left)", :Symbol],
  		:"*precise" => ["si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false", :Boolean],

  	}, true # Maybe changed
  register_command :picture, 'Command.picture_mouse_trigger?'

  # AUTOGenerated for picture_mouse_repeat?
  link_method_documentation 'Command.picture_mouse_repeat?',
  	'Renvoie true si la souris survol et presse successivement la touche référencée sur l\'image référencée par son ID',
   	{
  		:id => ["ID de l'image", :Fixnum],
  		:"*key" => ["Touche de la souris (par défaut, :mouse_left)", :Symbol],
  		:"*precise" => ["si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false", :Boolean],

  	}, true # Maybe changed
  register_command :picture, 'Command.picture_mouse_repeat?'

  # AUTOGenerated for picture_mouse_release?
  link_method_documentation 'Command.picture_mouse_release?',
  	'Renvoie true si la souris survol et relâche la touche référencée sur l\'image référencée par son ID',
   	{
  		:id => ["ID de l'image", :Fixnum],
  		:"*key" => ["Touche de la souris (par défaut, :mouse_left)", :Symbol],
  		:"*precise" => ["si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false", :Boolean],

  	}, true # Maybe changed
  register_command :picture, 'Command.picture_mouse_release?'


  # AUTOGenerated for picture_erased?
  link_method_documentation 'Command.picture_erased?',
  	'Renvoie true si l\'image est supprimée (ou non affichée), false sinon',
   	{
  		:id => ["ID de l'image", :Fixnum],

  	}, true # Maybe changed
  register_command :picture, 'Command.picture_erased?'

  # AUTOGenerated for picture_showed?
  link_method_documentation 'Command.picture_showed?',
  'Renvoie true si l\'image est affichée, false sinon',
   	{
  		:id => ["ID de l'image", :Fixnum],

  	}, true # Maybe changed
  register_command :picture, 'Command.picture_showed?'

  link_method_documentation "Command.picture_show",
                          "Affiche une image à l'écran",
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :name => ["Nom de l'image (sans l'extension, entre guillemets anglais)", :String],
                            :"*x" => ["Position en X de l'image (par défaut 0)", :Fixnum],
                            :"*y" => ["Position en Y de l'image (par défaut 0)", :Fixnum],
                            :"*origin" => ["Origine de l'image, 0 = Haut gauche, 1 = centré, [x,y] = orienté autours de X,Y, par défaut, zéro", :Fixnum],
                            :"*zoom_x" => ["Zoom sur la largeur de l'image par défaut 100 (pour 100%)", :Fixnum],
                            :"*zoom_y" => ["Zoom sur la hauteur de l'image par défaut 100 (pour 100%)", :Fixnum],
                            :"*opacity" => ["Opacité de l'image, par défaut 255 (de 0 à 255)", :Fixnum],
                            :"*blend_type" => ["Mode de fusion, par défaut 0, 0=Normal, 1=Addition, 2=Soustraction", :Fixnum],
                          }
  register_command :picture, "Command.picture_show"

  link_method_documentation "Command.picture_show_screenshot",
                            "Affiche une capture d'écran (comme une image normale)",
                            {
                              :id => ["ID de l'image", :Fixnum],
                             :"*x" => ["Position en X de l'image (par défaut 0)", :Fixnum],
                             :"*y" => ["Position en Y de l'image (par défaut 0)", :Fixnum],
                             :"*origin" => ["Origine de l'image, 0 = Haut gauche, 1 = centré, [x,y] = orienté autours de X,Y, par défaut, zéro", :Fixnum],
                             :"*zoom_x" => ["Zoom sur la largeur de l'image par défaut 100 (pour 100%)", :Fixnum],
                             :"*zoom_y" => ["Zoom sur la hauteur de l'image par défaut 100 (pour 100%)", :Fixnum],
                             :"*opacity" => ["Opacité de l'image, par défaut 255 (de 0 à 255)", :Fixnum],
                             :"*blend_type" => ["Mode de fusion, par défaut 0, 0=Normal, 1=Addition, 2=Soustraction", :Fixnum],
                            }
  register_command :picture, "Command.picture_show_screenshot"

  # AUTOGenerated for picture_move?
  link_method_documentation 'Command.picture_move?',
  	'Renvoie true si l\'image référencée par son ID est en mouvement, false sinon',
   	{
  		:id => ["ID de l'image", :Fixnum],
  	}, true # Maybe changed
  register_command :picture, 'Command.picture_move?'

  # AUTOGenerated for picture_name
  link_method_documentation 'Command.picture_name',
  	"Change le nom de l'image à afficher",
   	{
  		:id => ["ID de l'image", :Fixnum],
  		:"*name" => ["Nom de l'image (sans l'extension, entre guillemets anglais), si aucun argument n'est passé, la commande renverra le nom courrant", :String],
  	}, true # Maybe changed
  register_command :picture, 'Command.picture_name'

  link_method_documentation "Command.picture_origin",
                          "Change l'origine d'une image",
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :origin => ["Origine de l'image, 0 = Haut gauche, 1 = centré, [x,y] = orienté autour de X,Y, par défaut, zéro, zéro", :Fixnum],
                          }
  register_command :picture, "Command.picture_origin"

  link_method_documentation "Command.picture_x",
                          "Change l'axe X d'une image",
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :x => ["Position en x de l'image, si aucun argument n'est passé, la commande renverra la position X de l'image", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }, true
  register_command :picture, "Command.picture_x"

  link_method_documentation "Command.picture_y",
                          "Change l'axe Y d'une image",
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :y => ["Position en y de l'image, si aucun argument n'est passé, la commande renverra la position Y de l'image", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }, true
  register_command :picture, "Command.picture_y"
  link_method_documentation "Command.picture_position",
                          "Change la position de l'image",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :x => ["Position en x de l'image", :Fixnum],
                            :y => ["Position en y de l'image", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }
  register_command :picture, "Command.picture_position"
  link_method_documentation "Command.picture_move",
                          "Déplace une image",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :x => ["Position en x de l'image où l'image doit se rendre", :Fixnum],
                            :y => ["Position en y de l'image où l'image doit se rendre", :Fixnum],
                            :zoom_x => ["Zoom de la largeur (en %)", :Fixnum],
                            :zoom_y => ["Zoom de la hauteur (en %)", :Fixnum],
                            :duration => ["Durée du déplacement en frames", :Fixnum],
                            :"*wait_flag" => ["Attendre la fin du déplacement, par défaut, true", :Boolean],
                            :"*opacity" => ["Opacité (de 0 à 255) que l'image devra avoir, si '-1', ou aucun argument n'est donné, l'image conserva son opacité actuelle", :Fixnum],
                            :"*blend_type" => ["Mode de fusion (0, 1, 2) que l'image devra avoir, si '-1', ou aucun argument n'est donné, l'image conserva son mode de fusion du moment", :Fixnum],
                            :"*origin" => ["Origine que l'image devra avoir, si '-1', ou aucun argument n'est donné, l'image conserva son origine du moment", :Fixnum],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],

                          }
  register_command :picture, "Command.picture_move"
  link_method_documentation "Command.picture_wave",
                          "Fait onduler l'image",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :amplitude => ["Amplitude (taille de l'ondulation)", :Fixnum],
                            :vitesse => ["Vitesse de l'ondulation", :Fixnum],
                          }
  register_command :picture, "Command.picture_wave"
  link_method_documentation "Command.picture_flip",
                          "Applique un effet miroir (axe vertical) sur l'image ",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                          }
  register_command :picture, "Command.picture_flip"
  link_method_documentation "Command.picture_angle",
                          "Change l'angle de l'image",
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :angle => ["Angle d'orientation de l'image (En degrés décimaux, sens anti-horaire). Si aucun angle n'est donné, la commande renverra l'angle de l'image", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }, true
  register_command :picture, "Command.picture_angle"
  link_method_documentation "Command.picture_rotate",
                          "Fait tourner l'image",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :speed => ["Vitesse de rotation de l'image", :Fixnum],
                          }
  register_command :picture, "Command.picture_rotate"
  link_method_documentation "Command.picture_zoom_x",
                          "Change la largeur d'une image",
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :zoom => ["Pourcentage d'agrandissement de la largeur de l'image. Si aucune valeur n'est donnée, la commande renverra le zoom_x de l'image.", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }, true
  register_command :picture, "Command.picture_zoom_x"
  link_method_documentation "Command.picture_zoom_y",
                          "Change la hauteur d'une image",
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :zoom => ["Pourcentage d'agrandissement de la hauteur de l'image. Si aucune valeur n'est donnée, la commande renverra le zoom_y de l'image.", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }, true
  register_command :picture, "Command.picture_zoom_y"
  link_method_documentation "Command.picture_zoom",
                          "Change la taille d'une image",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :zoom_x => ["Pourcentage d'agrandissement de la largeur de l'image", :Fixnum],
                            :"*zoom_y" => ["Pourcentage d'agrandissement de la hauteur de l'image. Si cet argument est ommis, la largeur sera égale à la hauteur.", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }, true
  register_command :picture, "Command.picture_zoom"
  link_method_documentation "Command.picture_tone",
                          "Change la teinte d'une image",
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :tone => ["Teinte de l'image (utilisez la commande tone)", :Tone],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut false", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }
  register_command :picture, "Command.picture_tone"

  # AUTOGenerated for windowskin_tone
link_method_documentation 'Command.windowskin_tone',
'Change la teinte du windowSkin. Si aucune valeur n\'est donnée, la commande renverra la teinte',
 {
  :"*tone" => ["Teinte du WindowSkin (utilisez la commande tone)", :Tone],

}, true # Maybe changed
register_command :standard, 'Command.windowskin_tone'

# AUTOGenerated for windowskin_opacity
link_method_documentation 'Command.windowskin_opacity',
'Change l\'opacité du windowSkin. Si aucune valeur n\'est donnée, la commande renverra l\'opacité',
 {
  :"*value" => ["Valeur de l'opacité, entre 0 et 255. Si aucune valeur n'est donnée, la commande retourne l'opacité de l'évènement ciblé.", :Fixnum],

}, true # Maybe changed
register_command :standard, 'Command.windowskin_opacity'



  link_method_documentation "Command.picture_blend",
                          "Change le mode de fusion d'une image",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :mode => ["Mode choisi (0, 1 ou 2)", :Fixnum],
                          }
  register_command :picture, "Command.picture_blend"
  link_method_documentation "Command.picture_pin",
                          "Fait défiler une image avec la carte (la fixe à une position)",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :"*x" => ["Coordonnées X de la carte en pixels, par défaut la coordonnée convertie de l'écran vers la carte", :Fixnum],
                            :"*y" => ["Coordonnées Y de la carte en pixels, par défaut la coordonnée convertie de l'écran vers la carte", :Fixnum]
                          }
  register_command :picture, "Command.picture_pin"


  link_method_documentation "Command.picture_erase",
                          "Efface l'image",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
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
                            :Selector => ["Sélécteur de l'image", :Selector],
                          }
  register_command :picture, "Command.picture_unpin"
  link_method_documentation "Command.picture_opacity",
                          "Change l'opacité d'une image",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :opacity => ["valeur de l'opacité (de 0 à 255)", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }
  register_command :picture, "Command.picture_opacity"
  link_method_documentation "Command.picture_shake",
                          "Fait trembler l'image pendant un temps donné",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :power => ["La puissance du tremblement", :Fixnum],
                            :speed => ["La vitesse du tremblement", :Fixnum],
                            :duration => ["La durée en frames du tremblement", :Fixnum],
                          }
  register_command :picture, "Command.picture_shake"

  link_method_documentation "Command.pixel_in_picture?",
                          "Vérifie que le x, y sont inscrits dans l'image",
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :x => ["Coordonnées X", :Fixnum],
                            :y => ["Coordonnées Y", :Fixnum],
                            :"*precise" => ["Par défaut, precise vaut false, si precise vaut true, seuls les pixels non transparents seront pris en compte", :Boolean]
                          }, true
  register_command :picture, "Command.pixel_in_picture?"

  link_method_documentation "Command.pictures_collide?",
                          "Vérifie que deux images sont en collision",
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :id2 => ["ID de l'autre image", :Fixnum],
                          }, true
  register_command :picture, "Command.pictures_collide?"

  link_method_documentation "Command.picture_scroll_x",
                          "Change la vitesse de défilement horizontal d'une image fixée sur la carte, si aucune vitesse n'est donnée (et que le selector est un simple ID) alors la commande renverra simplement la valeur de défilement.",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :"*vitesse" => ["Vitesse de défilement", :Fixnum],
                          }
  register_command :picture, "Command.picture_scroll_x"
  link_method_documentation "Command.picture_scroll_y",
                          "Change la vitesse de défilement vertical d'une image fixée sur la carte, si aucune vitesse n'est donnée (et que le selector est un simple ID) alors la commande renverra simplement la valeur de défilement.",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :"*vitesse" => ["Vitesse de défilement", :Fixnum],
                          }
  register_command :picture, "Command.picture_scroll_y"
  link_method_documentation "Command.picture_scroll",
                          "Change la vitesse de défilement (vertical et horizontal) d'une image fixée sur la carte",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :vitesse => ["Vitesse de défilement", :Fixnum],
                          }
  register_command :picture, "Command.picture_scroll"

  # AUTOGenerated for picture_width
  link_method_documentation 'Command.picture_width',
    'Change la largeur d\'une image référencée par son ID',
    {
      :id => ["ID de l'image", :Fixnum],
      :"*v" => ["Valeur à changer, si aucune valeur n'est donnée, la commande renverra la largeur de l'image", :Fixnum],
      :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
      :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
      :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
    }, true # Maybe changed
  register_command :picture, 'Command.picture_width'

  # AUTOGenerated for picture_height
  link_method_documentation 'Command.picture_height',
    'Change la hauteur d\'une image référencée par son ID',
    {
      :id => ["ID de l'image", :Fixnum],
      :"*v" => ["Valeur à changer, si aucune valeur n'est donnée, la commande renverra la hauteur de l'image", :Fixnum],
      :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
      :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
      :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
    }, true # Maybe changed
  register_command :picture, 'Command.picture_height'

  # AUTOGenerated for picture_dimension
  link_method_documentation 'Command.picture_dimension',
    'Change la hauteur et la largeur d\'une image référencée par son ID',
    {
      :id => ["ID de l'image", :Fixnum],
      :w => ["Largeur à modifier", :Fixnum],
      :h => ["Hauteur à modifier", :Fixnum],
      :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
      :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
      :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
    }
  register_command :picture, 'Command.picture_dimension'

  link_method_documentation "Command.parallax_show",
                          "Affiche un panorama",
                          {
                            :id => ["ID du panorama", :Fixnum],
                            :name => ["Nom du panorama", :String],
                            :"*z" => ["Axe Z (par défaut - 100)", :Fixnum],
                            :"*opacity" => ["Opacité, entre 0 et 255. (par défaut 255)", :Fixnum],
                            :"*auto_x" => ["Défilement automatique horizontal (par défaut 0, ne défile pas)", :Fixnum],
                            :"*auto_y" => ["Défilement automatique vertical (par défaut 0, ne défile pas)", :Fixnum],
                            :"*scroll_x" => ["Défilement horizontal (par défaut 2, à la même vitesse que la carte. 1 = vitesse du panorama de VXace)", :Fixnum],
                            :"*scroll_y" => ["Défilement vertical (par défaut 2, à la même vitesse que la carte. 1 = vitesse du panorama de VXace)", :Fixnum],
                            :"*blend_type" => ["Mode de fusion (par défaut 0), mode normal", :Fixnum],
                            :"*zoom_x" => ["Zoom horizontal (par défaut 100)", :Fixnum],
                            :"*zoom_y" => ["Zoom vertical (par défaut 100)", :Fixnum],
                            :"*tone" => ["Teinte, utilisez la commande tone (rubrique Standard), par défaut aucun changement de teinte", :Tone]
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
                            :"*opacity" => ["Opacité, entre 0 et 255. (par défaut 255)", :Fixnum],
                            :"*tone" => ["Teinte, utilisez la commande tone (rubrique Standard), par défaut aucun changement de teinte", :Tone],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
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
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }
  register_command :parallax, "Command.parallax_autoscroll_x"
  link_method_documentation "Command.parallax_autoscroll_y",
                          "Défilement vertical automatique d'un panorama",
                          {
                            :id => ["ID du panorama", :Fixnum],
                            :speed => ["Vitesse de défilement", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
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
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }
  register_command :parallax, "Command.parallax_zoom_x"
  link_method_documentation "Command.parallax_zoom_y",
                          "Zoom vertical d'un panorama",
                          {
                            :id => ["ID du panorama", :Fixnum],
                            :zoom => ["taille en pourcentage", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }
  register_command :parallax, "Command.parallax_zoom_y"
  link_method_documentation "Command.parallax_zoom",
                          "Zoom sur les deux axes d'un panorama",
                          {
                            :id => ["ID du panorama", :Fixnum],
                            :zoom => ["taille en pourcentage", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }
  register_command :parallax, "Command.parallax_zoom"
  link_method_documentation "Command.parallax_tone",
                          "Change la teinte d'un panorama",
                          {
                            :id => ["ID du panorama", :Fixnum],
                            :tone => ["teinte du panorama (utilisez la commande tone des commandes standards)", :Tone],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }
  register_command :parallax, "Command.parallax_tone"
  link_method_documentation "Command.parallax_opacity",
                        "Change l'opacité d'un panorama",
                        {
                          :id => ["ID du panorama", :Fixnum],
                          :opacity => ["valeur de l'opacité (0 à 255)", :Fixnum],
                          :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                          :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
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

link_method_documentation "Command.team_members",
                        "Renvoie un tableau avec les id de tous les membres de l'équipe",
                        {}, true
register_command :party, "Command.team_members"

link_method_documentation "Command.team_member",
                        "Renvoie l'id du membre de l'équipe à la position spécifiée (1 pour le premier membre)",
                        {
                          :pos => ["Position du membre de l'équipe", :Fixnum]
                        }, true
register_command :party, "Command.team_member"

link_method_documentation "Command.gold",
                        "Renvoie l'argent possédé",
                        {}, true
register_command :party, "Command.gold"

link_method_documentation "Command.steps",
                        "Renvoie le nombre de pas effectués par l'équipe",
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
                        "Renvoie le nombre de sauvegardes effectuées par partie",
                        {}, true
register_command :party, "Command.save_count"

link_method_documentation "Command.battle_count",
                        "Renvoie le nombre de combats effectués par partie",
                        {}, true
register_command :party, "Command.battle_count"

link_method_documentation 'Command.last_used_item',
	'Renvoie l\'id du dernier objet utilisé',
 	{}, true
register_command :items, 'Command.last_used_item'

link_method_documentation "Command.use_item",
                        "Utilise un objet sur un héros, renvoie true ou false selon si l'utilisation a réussi ou échoué",
                        {:item_id => ["ID de l'objet à utiliser", :Fixnum],
                         :actor_id => ["ID du héros sur lequel l'objet sera utilisé", :Fixnum]}, true
register_command :items, "Command.use_item"

link_method_documentation "Command.test_item",
                        "Renvoie true ou false selon si l'utilisation d'un objet sur un héros va réussir ou échouer",
                        {:item_id => ["ID de l'objet à utiliser", :Fixnum],
                         :actor_id => ["ID du héros sur lequel l'objet sera utilisé", :Fixnum]}, true
register_command :items, "Command.test_item"

# AUTOGenerated for items_possessed
link_method_documentation 'Command.items_possessed',
	'Renvoie la liste des objets possédés',
 	{}, true # Maybe changed
register_command :items, 'Command.items_possessed'

# AUTOGenerated for armors_possessed
link_method_documentation 'Command.armors_possessed',
'Renvoie la liste des armures possédées',
 	{}, true # Maybe changed
register_command :armors, 'Command.armors_possessed'

# AUTOGenerated for weapons_possessed
link_method_documentation 'Command.weapons_possessed',
'Renvoie la liste des armes possédées',
 	{}, true # Maybe changed
register_command :weapons, 'Command.weapons_possessed'


link_method_documentation "Command.item_count",
                        "Renvoie le nombre d'objets (référencés par un ID) possédés par l'équipe",
                        {:id => ["Id de l'objet à compter", :Fixnum]}, true
register_command :items, "Command.item_count"

link_method_documentation "Command.weapon_count",
                        "Renvoie le nombre d'armes (référencées par un ID) possédées par l'équipe",
                        {:id => ["Id de l'arme à compter", :Fixnum]}, true
register_command :weapons, "Command.weapon_count"

link_method_documentation "Command.armor_count",
                        "Renvoie le nombre d'armures (référencées par un ID) possédées par l'équipe",
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
                        "Renvoie le nom de l'armure référencée par son ID",
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
                        "Renvoie le commentaire de l'armure référencée par son ID",
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
                        "Renvoie l'index de l'icone de l'armure référencée par son ID",
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
                        "Renvoie le prix  de l'armure référencée par son ID",
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
                        "Fait gagner à l'équipe l'armure référencée par son ID",
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
                        "Renvoie true si l'arme référencée par son ID est possédée par l'équipe, false sinon",
                        {
                          :id => ["Id de l'arme", :Fixnum],
                           :"*include_equipement" => ["Si ce paramètre vaut true, la commande prend en compte l'équipement, sinon (false), elle ne le prend pas en compte (par défaut: false)", :Boolean]

                        }, true
register_command :weapons, "Command.has_weapon?"

link_method_documentation "Command.has_armor?",
                        "Renvoie true si l'armure référencée par son ID est possédée par l'équipe, false sinon",
                        {
                          :id => ["Id de l'armure", :Fixnum],
                           :"*include_equipement" => ["Si ce paramètre vaut true, la commande prend en compte l'équipement, sinon (false), elle ne le prend pas en compte (par défaut: false)", :Boolean]

                        }, true
register_command :armors, "Command.has_armor?"
link_method_documentation "Command.weapon_equiped?",
                        "Renvoie true si l'arme référencée par son ID est équipée par un des membres de l'équipe, false sinon",
                        {
                          :id => ["Id de l'arme", :Fixnum],
                          :"*member_id" => ["Id du membre de l'équipe. Si aucun membre_id n'est spécifié, la commande vérifiera pour toute l'équipe ", :Fixnum],
                        }, true
register_command :weapons, "Command.weapon_equiped?"
link_method_documentation "Command.armor_equiped?",
                        "Renvoie true si l'armure référencée par son ID est équipée par un des membres de l'équipe, false sinon",
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
                        "Renvoie la portée (en Entier) d'un objet référencé par son ID",
                        {
                          :id => ["Id de l'armure", :Fixnum],
                        }, true
register_command :items, "Command.item_scope"

link_method_documentation "Command.item_has_no_scope?",
                        "Renvoie true si l'objet référencé par son ID ne cible personne, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_has_no_scope?"

link_method_documentation "Command.item_for_one_enemy?",
                        "Renvoie true si l'objet référencé par son ID cible un ennemi, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_one_enemy?"

link_method_documentation "Command.item_for_all_enemies?",
                        "Renvoie true si l'objet référencé par son ID cible tous les ennemis, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_all_enemies?"

link_method_documentation "Command.item_for_one_random_enemy?",
                        "Renvoie true si l'objet référencé par son ID cible un ennemi au hasard, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_one_random_enemy?"

link_method_documentation "Command.item_for_two_random_enemies?",
                        "Renvoie true si l'objet référencé par son ID cible deux ennemis au hasard, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_two_random_enemies?"

link_method_documentation "Command.item_for_three_random_enemies?",
                        "Renvoie true si l'objet référencé par son ID cible trois ennemis au hasard, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_three_random_enemies?"

link_method_documentation "Command.item_for_four_random_enemies?",
                        "Renvoie true si l'objet référencé par son ID cible quatre ennemis au hasard, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_four_random_enemies?"

link_method_documentation "Command.item_for_one_ally?",
                        "Renvoie true si l'objet référencé par son ID cible un allié vivant, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_one_ally?"

link_method_documentation "Command.item_for_all_allies?",
                        "Renvoie true si l'objet référencé par son ID cible tous les alliés vivants, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_all_allies?"

link_method_documentation "Command.item_for_one_dead_ally?",
                        "Renvoie true si l'objet référencé par son ID cible un allié mort, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_one_dead_ally?"

link_method_documentation "Command.item_for_all_dead_allies?",
                        "Renvoie true si l'objet référencé par son ID cible tous les alliés morts, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_all_dead_allies?"

link_method_documentation "Command.item_for_caller?",
                        "Renvoie true si l'objet référencé par son ID est utilisable sur le personnage du moment, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_caller?"

link_method_documentation "Command.item_for_opponent?",
                        "Renvoie true si l'objet référencé par son ID cible les ennemis, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_opponent?"

link_method_documentation "Command.item_for_friend?",
                        "Renvoie true si la cible de l'objet référencé par son ID est du côté allié, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_friend?"

link_method_documentation "Command.item_for_dead_friend?",
                        "Renvoie true si l'objet référencé par son ID cible un (ou les) allié(s) mort(s), false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_dead_friend?"

link_method_documentation "Command.item_for_one?",
                        "Renvoie true si l'objet référencé par son ID a une seule cible, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_one?"

link_method_documentation "Command.item_for_random?",
                        "Renvoie true si l'objet référencé par son ID cible aléatoirement, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_random?"

link_method_documentation "Command.item_for_all?",
                        "Renvoie true si l'objet référencé par son ID cible tout un groupe (tous les alliés ou tous les ennemis), false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_all?"

link_method_documentation "Command.item_need_selection?",
                        "Renvoie true si un objet référencé par son ID requiert la sélection d'une cible, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_need_selection?"


link_method_documentation "Command.item_certain?",
                        "Renvoie true si un objet référencé par son ID a une garantie de réussite totale, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_certain?"

link_method_documentation "Command.item_physical?",
                        "Renvoie true si un objet référencé par son ID endommage les PV, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_physical?"

link_method_documentation "Command.item_magical?",
                        "Renvoie true si un objet référencé par son ID endommage les PM, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_magical?"

link_method_documentation "Command.item_number_of_targets",
                        "Renvoie le nombre de cibles d'un objet référencé par son ID, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_number_of_targets"



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
                        "Renvoie true si l'objet référencé par son ID est utilisable en combat seulement ",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_battle_usable?"

link_method_documentation "Command.item_menu_usable?",
                        "Renvoie true si l'objet référencé par son ID est utilisable dans le menu seulement",
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

link_method_documentation "Command.item_speed",
                        "Renvoie l'apport de vitesse de l'objet référencé par son ID",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_speed"

link_method_documentation "Command.item_nb_hits",
                        "Renvoie le nombre de coups portés par l'objet référencé par son ID",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_nb_hits"

link_method_documentation "Command.item_success_rate",
                        "Renvoie la probabilité de succès de l'objet référencé par son ID",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_success_rate"

link_method_documentation "Command.item_tp_gain",
                        "Renvoie le gain de TP que l'objet référencé par son ID apporte une fois utilisé en combat",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_tp_gain"

link_method_documentation 'Command.camera_scrolling?',
	'Renvoie true si la camera est en train de défiler, false sinon',
 	{}, true # Maybe changed
register_command :camera, 'Command.camera_scrolling?' 

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
                        {:amount => "Total d'argent à faire gagner"}
register_command :party, "Command.gain_gold"

link_method_documentation "Command.lose_gold",
                        "Fait perdre de l'argent à l'équipe",
                        {:amount => "Total d'argent à faire perdre"}
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
                        "Renvoie l'id de l'équipement (dans le slot indiqué) du héros (référencé par son ID)",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                          :slot => ["Slot d'équipement soit :Weapon, :Head, :Body, :Shield ou :Accessory", :Symbol]
                        }, true
register_command :actors, "Command.actor_equip"

link_method_documentation "Command.actor_weapon",
                        "renvoie l'id de l'arme équipée par le héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_weapon"

link_method_documentation "Command.actor_shield",
                        "renvoie l'id du bouclier équipé par le héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_shield"

link_method_documentation "Command.actor_head",
                        "renvoie l'id du casque équipé par le héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_head"

link_method_documentation "Command.actor_body",
                        "renvoie l'id de l'armure équipée par le héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_body"

link_method_documentation "Command.actor_description",
                        "renvoie la description du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_description"

link_method_documentation "Command.actor_accessory",
                        "renvoie l'id l'accessoire équipé par le héros référencé par son ID",
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
                        "renvoie les points d'expérience du héros référencé par son ID",
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
                        "renvoie le nombre de points de magie maximum du héros référencé par son ID",
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
                        "renvoie la probabilité de toucher un ennemi pour le héros référencé par son ID",
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
                        "renvoie la probabilité d'une esquiver une attaque magique d'un ennemi pour le héros référencé par son ID ",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_magical_evasion_rate"

link_method_documentation "Command.actor_magical_reflection_rate",
                        "renvoie la probabilité d'une réflexion magique du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_magical_reflection_rate"

link_method_documentation "Command.actor_counter_attack_rate",
                        "renvoie la probabilité d'un contre (sur une attaque physique) du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_counter_attack_rate"

link_method_documentation "Command.actor_hp_regeneration_rate",
                        "renvoie le pourcentage de régénération de PV à chaque tour du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_hp_regeneration_rate"

link_method_documentation "Command.actor_mp_regeneration_rate",
                        "renvoie le pourcentage de régénration de MP à chaque tour du héros référencé par son ID",
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
                        "renvoie le pourcentage de PV/PM reçu, du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_recovery_effect_rate"

link_method_documentation "Command.actor_pharmacology",
                        "renvoie le pourcentage de PV/PM récupéré via un objet du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_pharmacology"

link_method_documentation "Command.actor_mp_cost_rate",
                        "renvoie le facteur d'un coût de MP (pour une attaque faisant varier la consommation de MP) du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_mp_cost_rate"

link_method_documentation "Command.actor_tp_charge_rate",
                        "renvoie le facteur de coût de TP (pour une attaque faisant varier la consommation de TP) du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_tp_charge_rate"

link_method_documentation "Command.actor_physical_damage_rate",
                        "renvoie le pourcentage de dommage physique reçu par le héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_physical_damage_rate"

link_method_documentation "Command.actor_magical_damage_rate",
                        "renvoie le pourcentage de dommage magique reçu par le héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_magical_damage_rate"

link_method_documentation "Command.actor_floor_damage_rate",
                        "renvoie le pourcentage de dommage des terrains reçu par le héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_floor_damage_rate"

link_method_documentation "Command.actor_exp_rate",
                        "renvoie le pourcentage de la variation d'acquisition d'expérience du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_exp_rate"

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
                        "renvoie le nombre de points d'expérience nécéssaires pour passer au niveau suivant pour le héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_exp_for_next_level"

link_method_documentation "Command.actor_change_equip",
                        "Change l'équipement du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                          :slot => ["Slot d'équipement (:Weapon, :Body, :Shield, : Head, :Accessory)", :Symbol],
                          :object_id => ["ID de l'Arme ou de l'Armure à mettre (La commande déduira s'il doit s'agir d'une arme ou d'une armure)", :Fixnum]
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

link_method_documentation "Command.actor_knowns?",
                        "Renvoie true si le héros référencé par son ID connait la technique référencée par son ID, false sinon",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                          :skill_id => ["ID de le technique", :Fixnum],
                        }
register_command :actors, "Command.actor_knowns?"

link_method_documentation "Command.actor_set_graphic",
                        "Change les graphismes du héros référencé par son ID",
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
                        "Renvoie true si la technique référencée par son ID ne cible personne, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_has_no_scope?"

link_method_documentation "Command.skill_for_one_enemy?",
                        "Renvoie true si la technique référencée par son ID cible un ennemi, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_one_enemy?"

link_method_documentation "Command.skill_for_all_enemies?",
                        "Renvoie true si la technique référencée par son ID cible tous les ennemis, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_all_enemies?"

link_method_documentation "Command.skill_for_one_random_enemy?",
                        "Renvoie true si la technique référencée par son ID cible un ennemi au hasard, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_one_random_enemy?"

link_method_documentation "Command.skill_for_two_random_enemies?",
                        "Renvoie true si la technique référencée par son ID cible deux ennemis au hasard, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_two_random_enemies?"

link_method_documentation "Command.skill_for_three_random_enemies?",
                        "Renvoie true si la technique référencée par son ID cible trois ennemis au hasard, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_three_random_enemies?"

link_method_documentation "Command.skill_for_four_random_enemies?",
                        "Renvoie true si la technique référencée par son ID cible quatre ennemis au hasard, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_four_random_enemies?"

link_method_documentation "Command.skill_for_one_ally?",
                        "Renvoie true si la technique référencée par son ID cible un allié, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_one_ally?"

link_method_documentation "Command.skill_for_all_allies?",
                        "Renvoie true si la technique référencée par son ID cible tous les alliés, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_all_allies?"

link_method_documentation "Command.skill_for_one_dead_ally?",
                        "Renvoie true si la technique référencée par son ID cible un allié mort, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_one_dead_ally?"

link_method_documentation "Command.skill_for_all_dead_allies?",
                        "Renvoie true si la technique référencée par son ID cible tous les alliés morts, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_all_dead_allies?"

link_method_documentation "Command.skill_for_caller?",
                        "Renvoie true si la technique référencée par son ID cible l'utilisateur, false sinon",
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
                        "Renvoie true si la technique référencé par son ID est utilisable en combat seulement",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_battle_usable?"

link_method_documentation "Command.skill_menu_usable?",
                        "Renvoie true si la technique référencé par son ID est utilisable dans le menu seulement",
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

link_method_documentation "Command.skill_for_opponent?",
                        "Renvoie true si une technique référencée par son ID cible les ennemis, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_opponent?"

link_method_documentation "Command.skill_for_friend?",
                        "Renvoie true si une technique référencée par son ID cible un (ou les) allié(s), false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_friend?"

link_method_documentation "Command.skill_for_dead_friend?",
                        "Renvoie true si une technique référencée par son ID cible un (ou les) allié(s) mort(s), false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_dead_friend?"

link_method_documentation "Command.skill_for_one?",
                        "Renvoie true si une technique référencée par son ID a une cible unique, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_one?"

link_method_documentation "Command.skill_for_random?",
                        "Renvoie true si une technique référencée par son ID cible aléatoirement, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_random?"

link_method_documentation "Command.skill_for_all?",
                        "Renvoie true si une technique référencée par son ID cible tout le groupe allié, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_all?"

link_method_documentation "Command.skill_need_selection?",
                        "Renvoie true si une technique référencée par son ID requiert la sélection de l'ennemi, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_need_selection?"


link_method_documentation "Command.skill_certain?",
                        "Renvoie true si une technique référencée par son ID a une garantie de réussite totale, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_certain?"

link_method_documentation "Command.skill_physical?",
                        "Renvoie true si une technique référencée par son ID endommage les PV, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_physical?"

link_method_documentation "Command.skill_magical?",
                        "Renvoie true si une technique référencée par son ID endommage les PM, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_magical?"

link_method_documentation "Command.skill_number_of_targets",
                        "Renvoie le nombre de cibles d'une technique référencée par son ID, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_number_of_targets"

link_method_documentation "Command.skill_speed",
                        "Renvoie l'apport de vitesse de la technique référencée par son ID",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_speed"

link_method_documentation "Command.skill_nb_hits",
                        "Renvoie le nombre de coups portés par la technique référencée par son ID",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_nb_hits"

link_method_documentation "Command.skill_success_rate",
                        "Renvoie la probabilité de succès de la technique référencée par son ID",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_success_rate"

link_method_documentation "Command.skill_tp_gain",
                        "Renvoie le gain de TP que la technique référencée par son ID apporte une fois utilisée en combat",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_tp_gain"

link_method_documentation "Command.skill_name",
                        "Renvoie le nom de la technique référencée par son ID",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_name"

link_method_documentation "Command.skill_note",
                        "Renvoie le commentaire de la base de données de la technique référencée par son ID",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_note"

link_method_documentation "Command.skill_description",
                        "Renvoie la description la technique référencée par son ID",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_description"

link_method_documentation "Command.skill_icon",
                        "Renvoie l'index de l'icone de la technique référencée par son ID",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_icon"

link_method_documentation "Command.pi",
                        "Renvoie une approximation de PI",
                        { }, true
register_command :math, "Command.pi"

link_method_documentation "Command.acos",
                        "Renvoie l'arc cosinus de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.acos"

# AUTOGenerated for mantissa
link_method_documentation 'Command.mantissa',
	'Renvoi la partie flottante d\'un nombre à virgule',
 	{
		:x => ["Nombre à virgule", :Float],

	}, true # Maybe changed
register_command :math, 'Command.mantissa'

link_method_documentation "Command.acosh",
                        "Renvoie l'inverse hyperbolique cosinus de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.acosh"


link_method_documentation "Command.asin",
                        "Renvoie l'arc sinus de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.asin"

link_method_documentation "Command.asinh",
                        "Renvoie l'inverse hyperbolique sinus de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.asinh"

link_method_documentation "Command.atan",
                        "Renvoie l'arc tangent de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.atan"

link_method_documentation "Command.atan2",
                        "Renvoie l'arc tangent pour x et y",
                        { :x => ["Valeur numérique", :Numeric],  :y => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.atan2"

link_method_documentation "Command.atanh",
                        "Renvoie l'inverse hyperbolique tangent de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.atanh"

link_method_documentation "Command.cos",
                        "Renvoie le cosinus de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.cos"

link_method_documentation "Command.cosh",
                        "Renvoie le cosinus hyperbolique de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.cosh"


link_method_documentation "Command.sin",
                        "Renvoie le sinus de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.sin"

link_method_documentation "Command.sinh",
                        "Renvoie le sinus hyperbolique de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.sinh"

link_method_documentation "Command.hypot",
                        "Renvoie l'hypothénuse de x et y",
                        { :x => ["Valeur numérique", :Numeric],  :y => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.hypot"

link_method_documentation "Command.sqrt",
                        "Renvoie la racine carrée de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.sqrt"

link_method_documentation "Command.tan",
                        "Renvoie la tangente de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.tan"

link_method_documentation "Command.tanh",
                        "Renvoie la tangente hyperbolique de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.tanh"

link_method_documentation "Command.to_deg",
                        "Renvoie x (supposé radian) converti en degrés",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.to_deg"

link_method_documentation "Command.to_rad",
                        "Renvoie x (supposé degré) converti en radians",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.to_rad"

link_method_documentation "Command.troop_size",
                        "Renvoie la taille d'un groupe de monstres référencé par son ID.",
                        { :id => ["ID du groupe de monstre", :Fixnum] }, true
register_command :troop, "Command.troop_size"

link_method_documentation "Command.troop_name",
                        "Renvoie le nom d'un groupe de monstres référencé par son ID.",
                        { :id => ["ID du groupe de monstre", :Fixnum] }, true
register_command :troop, "Command.troop_name"

link_method_documentation "Command.troop_members",
                        "Renvoie un tableau des enemy_id d'un groupe de monstres référencé par son ID.",
                        { :id => ["ID du groupe de monstre", :Fixnum] }, true
register_command :troop, "Command.troop_members"

link_method_documentation "Command.troop_member",
                        "Renvoie l'id d'un monstre d'un groupe de monstres référencé par son ID et par sa position (0 = premier).",
                        { :id => ["ID du groupe de monstre", :Fixnum], :position => ["Position du monstre", :Fixnum]  }, true
register_command :troop, "Command.troop_member"

link_method_documentation "Command.troop_member_x",
                        "Renvoie la position X d'un monstre d'un groupe de monstres référencé par son ID et par sa position (0 = premier) tel que défini dans la base de données.",
                        { :id => ["ID du groupe de monstre", :Fixnum], :position => ["Position du monstre", :Fixnum]  }, true
register_command :troop, "Command.troop_member_x"

link_method_documentation "Command.troop_member_y",
                        "Renvoie la position Y d'un monstre d'un groupe de monstres référencé par son ID et par sa position (0 = premier) tel que défini dans la base de données.",
                        { :id => ["ID du groupe de monstre", :Fixnum], :position => ["Position du monstre", :Fixnum]  }, true
register_command :troop, "Command.troop_member_y"


link_method_documentation "Command.picture_show_enemy",
                        "Affiche un monstre d'un groupe à sa position définie dans la base de données",
                        {
                          :pic_id => ["ID de l'image dans laquelle afficher le monstre", :Fixnum],
                          :id => ["ID du groupe de monstre", :Fixnum],
                          :position => ["Position du monstre", :Fixnum]
                        }, false
register_command :picture, "Command.picture_show_enemy"

link_method_documentation "Command.monster_name",
                        "renvoie le nom d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_name"

link_method_documentation "Command.monster_icon",
                        "renvoie l'icone index d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_icon"

link_method_documentation "Command.monster_description",
                        "renvoie la description d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_description"

link_method_documentation "Command.monster_note",
                        "renvoie la note/commentaire d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_note"

link_method_documentation "Command.monster_battler_name",
                        "renvoie le nom du fichier battler d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_battler_name"

link_method_documentation "Command.monster_battler_hue",
                        "renvoie la teinte d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_battler_hue"

link_method_documentation "Command.monster_max_hp",
                        "renvoie le maximum de points de vie d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_max_hp"

link_method_documentation "Command.monster_max_mp",
                        "renvoie le maximum de points de magie d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_max_mp"

link_method_documentation "Command.monster_attack_power",
                        "renvoie les points d'attaque d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_attack_power"

link_method_documentation "Command.monster_defense_power",
                        "renvoie les points de défense d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_defense_power"

link_method_documentation "Command.monster_magic_attack_power",
                        "renvoie les points d'attaque magique d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_magic_attack_power"

link_method_documentation "Command.monster_magic_defense_power",
                        "renvoie les points de défense magique d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_magic_defense_power"

link_method_documentation "Command.monster_agility",
                        "renvoie l'agilité d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_agility"

link_method_documentation "Command.monster_luck",
                        "renvoie la chance d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_luck"

link_method_documentation "Command.monster_give_exp",
                        "renvoie l'experience donnée par un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_give_exp"

link_method_documentation "Command.monster_give_gold",
                        "renvoie l'or donné par un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_give_gold"


link_method_documentation "Command.current_troop",
                        "Renvoie l'identifiant du groupe en cours de combat",
                        {}, true
register_command :in_battle, "Command.current_troop"

link_method_documentation "Command.current_enemies",
                        "Renvoie un tableau contenant les ID des ennemis en cours de combat",
                        {}, true
register_command :in_battle, "Command.current_enemies"

link_method_documentation "Command.total_enemies",
                        "Renvoie le nombre d'enemis en combat (mort ou vivant)",
                        {}, true
register_command :in_battle, "Command.total_enemies"


link_method_documentation "Command.enemy_hp",
                        "renvoie les points de vie de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum],
                        }, true
register_command :in_battle, "Command.enemy_hp"

link_method_documentation "Command.enemy_mp",
                        "renvoie les points de magie de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum],
                        }, true
register_command :in_battle, "Command.enemy_mp"

link_method_documentation "Command.enemy_tp",
                        "renvoie les points de temps de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum],
                        }, true
register_command :in_battle, "Command.enemy_tp"

link_method_documentation "Command.enemy_max_hp",
                        "renvoie le nombre de points de vie maximum de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_max_hp"

link_method_documentation "Command.enemy_max_mp",
                        "renvoie le nombre de points de magie de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_max_mp"

link_method_documentation "Command.enemy_attack",
                        "renvoie les points d'attaque de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_attack"

link_method_documentation "Command.enemy_defense",
                        "renvoie les points de défense de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_defense"

link_method_documentation "Command.enemy_magic_attack",
                        "renvoie les points d'attaque magique de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_magic_attack"

link_method_documentation "Command.enemy_magic_defense",
                        "renvoie les points de défense magique de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_magic_defense"

link_method_documentation "Command.enemy_agility",
                        "renvoie les points d'agilité de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_agility"

link_method_documentation "Command.enemy_luck",
                        "renvoie les points de chance de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_luck"

link_method_documentation "Command.enemy_hit_rate",
                        "renvoie la probabilité de toucher de l'ennemi en combat référencé par sa position en combat sur un ennemi",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_hit_rate"

link_method_documentation "Command.enemy_evasion_rate",
                        "renvoie la probabilité d'esquiver une attaque physique de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_evasion_rate"

link_method_documentation "Command.enemy_critical_rate",
                        "renvoie la probabilité de coup critique de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_critical_rate"

link_method_documentation "Command.enemy_critical_evasion_rate",
                        "renvoie la probabilité de faire un coup critique en préemptif de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_critical_evasion_rate"

link_method_documentation "Command.enemy_magical_evasion_rate",
                        "renvoie la probabilité d'une esquiver une attaque magique de l'ennemi en combat référencé par sa position en combat par un ennemi",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_magical_evasion_rate"

link_method_documentation "Command.enemy_magical_reflection_rate",
                        "renvoie la probabilité d'une réflexion magique de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_magical_reflection_rate"

link_method_documentation "Command.enemy_counter_attack_rate",
                        "renvoie la probabilité d'un contre (sur une attaque physique) de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_counter_attack_rate"

link_method_documentation "Command.enemy_hp_regeneration_rate",
                        "renvoie le pourcentage de régénération de PV à chaque tour de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_hp_regeneration_rate"

link_method_documentation "Command.enemy_mp_regeneration_rate",
                        "renvoie le pourcentage de régénération PM à chaque tour de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_mp_regeneration_rate"

link_method_documentation "Command.enemy_tp_regeneration_rate",
                        "renvoie le pourcentage de régénération de TP par tour de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_tp_regeneration_rate"

link_method_documentation "Command.enemy_target_rate",
                        "renvoie la probabilité d'être ciblé par un ennemi, de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_target_rate"


link_method_documentation "Command.monster_battler_width",
                        "renvoie la largeur du battler de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.monster_battler_width"

link_method_documentation "Command.monster_battler_height",
                        "renvoie la largeur du battler de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.monster_battler_height"


link_method_documentation "Command.enemy_guard_effect_rate",
                        "renvoie la force de défense (diminution de l'attaque subie) de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_guard_effect_rate"

link_method_documentation "Command.enemy_recovery_effect_rate",
                        "renvoie le pourcentage de PV/PM reçus, de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_recovery_effect_rate"

link_method_documentation "Command.enemy_pharmacology",
                        "renvoie le pourcentage de PV/PM récupéré via un objet de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_pharmacology"

link_method_documentation "Command.enemy_mp_cost_rate",
                        "renvoie le facteur d'un coût de MP (pour une attaque faisant varier la consommation de MP) de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_mp_cost_rate"

link_method_documentation "Command.enemy_tp_charge_rate",
                        "renvoie le facteur de coût de TP (pour une attaque faisant varier la consommation de TP) de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_tp_charge_rate"

link_method_documentation "Command.enemy_physical_damage_rate",
                        "renvoie le pourcentage de dommage physique reçu par l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_physical_damage_rate"

link_method_documentation "Command.enemy_magical_damage_rate",
                        "renvoie le pourcentage de dommage magique reçu par l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_magical_damage_rate"

link_method_documentation "Command.enemy_hidden?",
                        "renvoie true si l'ennemi en combat référencé par sa position en combat est invisble, false sinon",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_hidden?"

link_method_documentation "Command.enemy_floor_damage_rate",
                        "renvoie le pourcentage de dommage des terrains reçu par l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_floor_damage_rate"

link_method_documentation "Command.enemy_experience_rate",
                        "renvoie le pourcentage de la variation d'acquisition d'expérience de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_experience_rate"

link_method_documentation "Command.enemy_die?",
                        "renvoie true si l'ennemi en combat référencé par sa position en combat est mort, false sinon",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_die?"

link_method_documentation "Command.active_actor?",
                        "renvoie true si un acteur est en train de choisir une action, false sinon",
                        {

                        }, true
register_command :in_battle, "Command.active_actor?"

link_method_documentation "Command.active_actor",
                        "renvoie l'identifiant d'un acteur si il est en train de sélectionner une action, nil sinon",
                        {

                        }, true
register_command :in_battle, "Command.active_actor"


link_method_documentation "Command.text_show",
                          "Affiche un texte à l'écran",
                          {
                            :id => ["Identifiant du texte",:Fixnum],
                            :text => ["Texte a afficher",:String],
                            :profile => ["Profil du texte (voir Base de données)",:String],
                            :x => ["Position X",:Fixnum],
                            :y => ["Position Y",:Fixnum],
                            :"*zoom_x" => ["Zoom sur la largeur du texte par défaut 100 (pour 100%)", :Fixnum],
                            :"*zoom_y" => ["Zoom sur la hauteur du text par défaut 100 (pour 100%)", :Fixnum],
                            :"*opacity" => ["Opacité de l'image, par défaut 255 (de 0 à 255)", :Fixnum],
                            :"*blend_type" => ["Mode de fusion, par défaut 0, 0=Normal, 1=Addition, 2=Soustraction", :Fixnum],
                            :"*origin" => ["Origine du texte, 0 = Haut gauche, 1 = centré, par défaut, zéro", :Fixnum],
                          }
register_command :text, "Command.text_show"

# AUTOGenerated for text_move?
link_method_documentation 'Command.text_move?',
	'Retourne true sur le texte référencé par son ID est en mouvement, false sinon',
 	{
		:id => ["ID du texte", :Fixnum],

	}, true # Maybe changed
register_command :text, 'Command.text_move?'

# AUTOGenerated for text_angle
link_method_documentation 'Command.text_angle',
	'Change l\'angle d\'un texte, si aucun angle n\'est donné, la commande renverra la valeur de l\'angle du texte',
 	{
		:id => ["Id du texte", :Fixnum],
		:"*value" => ["Nouvel angle (peut être vide)", :Fixnum],

	}, true # Maybe changed
register_command :standard, 'Command.text_angle'

# AUTOGenerated for text_value
link_method_documentation 'Command.text_value',
	'Renvoie la valeur d\'un texte',
 	{
		:id => ["ID du texte", :Fixnum],

	}, true # Maybe changed
register_command :text, 'Command.text_value'

link_method_documentation "Command.text_move",
                          "Déplace un texte affiché à l'écran",
                          {
                            :id => ["Identifiant du texte", :Fixnum],
                            :duration => ["Durée du déplacement en frames", :Fixnum],
                            :"wait_flag" => ["Attendre la fin du déplacement, par défaut, true", :Boolean],
                            :x => ["Position en x où le texte doit se rendre", :Fixnum],
                            :y => ["Position en y ou le texte doit se rendre", :Fixnum],
                            :zoom_x => ["Zoom de la largeur (en %)", :Fixnum],
                            :zoom_y => ["Zoom de la hauteur (en %)", :Fixnum],
                            :"opacity" => ["Opacité (de 0 à 255)", :Fixnum],
                            :"blend_type" => ["Mode de fusion (0, 1, 2) ", :Fixnum],
                            :"origin" => ["Origine", :Fixnum],

                          }
register_command :text, "Command.text_move"

link_method_documentation "Command.text_erase",
                          "Supprime le texte affiché à l'écran",
                          {
                            :id => ["Identifiant du texte", :Fixnum],
                          }
register_command :text, "Command.text_erase"

link_method_documentation "Command.text_change",
                          "Change le texte affiché à l'écran",
                          {
                            :id => ["Identifiant du texte", :Fixnum],
                            :text => ["Nouveau texte", :String]
                          }
register_command :text, "Command.text_change"

link_method_documentation "Command.text_profile",
                          "Change le profil du texte, si aucun profile n'est donné, la commande renverra le profil du texte",
                          {
                            :id => ["Identifiant du texte", :Fixnum],
                            :"*profile" => ["Nouveau profil", :String]
                          }
register_command :text, "Command.text_profile"

link_method_documentation "Command.text_rotate",
                          "Fait tourner le texte (mettez une vitesse négative pour changer le sens de rotation)",
                          {
                            :id => ["Identifiant du texte", :Fixnum],
                            :speed => ["Vitesse de rotation", :Fixnum],
                          }
register_command :text, "Command.text_rotate"

link_method_documentation "Command.text_opacity",
                          "Change l'opacité du texte, si aucune opacité n'est donnée, la commande renverra l'opacité du texte",
                          {
                            :id => ["Identifiant du texte", :Fixnum],
                            :"*opacity" => ["valeur de l'opacité, entre 0 et 255.", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }
register_command :text, "Command.text_opacity"

link_method_documentation "Command.text_x",
                          "Change l'axe X d'un texte",
                          {
                            :id => ["ID du texte", :Fixnum],
                            :x => ["Position en x du texte, si aucun argument n'est passé, la commande renverra la position X du texte", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }, true
register_command :text, "Command.text_x"

link_method_documentation "Command.text_y",
                          "Change l'axe Y d'un texte",
                          {
                            :id => ["ID du texte", :Fixnum],
                            :y => ["Position en y du texte, si aucun argument n'est passé, la commande renverra la position X du texte", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }, true
register_command :text, "Command.text_y"

link_method_documentation "Command.text_position",
                          "Change la position d'un texte",
                          {
                            :id => ["ID du texte", :Fixnum],
                            :x => ["Position en x du texte", :Fixnum],
                            :y => ["Position en y du texte", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }, true
register_command :text, "Command.text_position"

link_method_documentation "Command.text_zoom_x",
                          "Change le zoom X d'un texte",
                          {
                            :id => ["ID du texte", :Fixnum],
                            :zoom_x => ["zoom x du texte, si aucun argument n'est passé, la commande renverra le zoom X du texte", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }, true
register_command :text, "Command.text_zoom_x"

link_method_documentation "Command.text_zoom_y",
                          "Change le zoom y d'un texte",
                          {
                            :id => ["ID du texte", :Fixnum],
                            :zoom_y => ["zoom y du texte, si aucun argument n'est passé, la commande renverra le zoom X du texte", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }, true
register_command :text, "Command.text_zoom_y"

link_method_documentation "Command.text_zoom",
                          "Change le zoom d'un texte",
                          {
                            :id => ["ID du texte", :Fixnum],
                            :zoom_x => ["zoom x du texte", :Fixnum],
                            :zoom_y => ["zoom y du texte", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }, true
register_command :text, "Command.text_zoom"

link_method_documentation 'Command.pictures_perfect_collide?',
  'Vérifie la collision entre deux images au pixel près. ATTENTION, CETTE COMMANDE LAG ENORMEMENT !IL EST DECONSEILLE DE L\'UTILISER !',
  {
    :idA => ["ID de la première image", :Fixnum],
    :idB => ["ID de la seconde image", :Fixnum],

  }
register_command :picture, 'Command.pictures_perfect_collide?'

# AUTOGenerated for time_year
link_method_documentation 'Command.time_year',
  'Renvoie l\'année actuelle',
  {}, true # Maybe changed
register_command :date, 'Command.time_year'

# AUTOGenerated for time_month
link_method_documentation 'Command.time_month',
  'Renvoie le mois actuel',
  {}, true # Maybe changed
register_command :date, 'Command.time_month'

# AUTOGenerated for time_day
link_method_documentation 'Command.time_day',
  'Renvoie le jour actuel',
  {}, true # Maybe changed
register_command :date, 'Command.time_day'

# AUTOGenerated for time_hour
link_method_documentation 'Command.time_hour',
  'Renvoie l\' heure actuelle',
  {}, true # Maybe changed
register_command :date, 'Command.time_hour'

# AUTOGenerated for time_min
link_method_documentation 'Command.time_min',
  'Renvoie la minute actuelle',
  {}, true # Maybe changed
register_command :date, 'Command.time_min'

# AUTOGenerated for time_sec
link_method_documentation 'Command.time_sec',
  'Renvoie la seconde actuelle',
  {}, true # Maybe changed
register_command :date, 'Command.time_sec'

# AUTOGenerated for socket_connected?
link_method_documentation 'Command.socket_connected?',
  'Renvoie true si la connexion est en cours, false, sinon',
  {}, true # Maybe changed
register_command :socket, 'Command.socket_connected?'

# AUTOGenerated for socket_connect
link_method_documentation 'Command.socket_connect',
  'Se connecte à un serveur, renvoie true si la connexion a réussi, false sinon.',
  {
    :address => ["Adresse du serveur", :String],
    :port => ["Port d'écoute", :Fixnum],

  }, true # Maybe changed
register_command :socket, 'Command.socket_connect'

# AUTOGenerated for socket_disconnect
link_method_documentation 'Command.socket_disconnect',
  'Déconnecte la connexion courante',
  {}
register_command :socket, 'Command.socket_disconnect'

# AUTOGenerated for socket_send
link_method_documentation 'Command.socket_send',
  'Envoie un message au serveur connecté, renvoie true en cas de réussite, false en cas d\'échec',
  {
    :data => ["Message à envoyer", :String],

  }, true # Maybe changed
register_command :socket, 'Command.socket_send'

# AUTOGenerated for socket_recv
link_method_documentation 'Command.socket_recv',
  'Renvoie le message envoyé par le serveur au client, false si aucun message n\' est reçu',
  {
    :"*len" => ["Taille maximale du message à recevoir, par défaut 1024", :Fixnum],

  }, true # Maybe changed
register_command :socket, 'Command.socket_recv'

# AUTOGenerated for socket_wait_recv
link_method_documentation 'Command.socket_wait_recv',
  'Attend une réponse du serveur, se termine quand une réponse a été reçue (et la renvoie)',
  {
    :"*len" => ["Taille maximale du message à recevoir, par défaut 1024", :Fixnum],

  }, true # Maybe changed
register_command :socket, 'Command.socket_wait_recv'

# AUTOGenerated for angle_xy
link_method_documentation 'Command.angle_xy',
  'Renvoie l\' angle entre deux points, dans le sens anti-horaire, défini entre 0 et 360 degrés',
  {
    :xa => ["Coordonnée X du point A", :Fixnum],
    :ya => ["Coordonnée Y du point A", :Fixnum],
    :xb => ["Coordonnée X du point B", :Fixnum],
    :yb => ["Coordonnée Y du point B", :Fixnum],
  }, true
register_command :math, 'Command.angle_xy'

# AUTOGenerated for wait_with
link_method_documentation 'Command.wait_with',
  'Attend en exécutant une action',
  {
    :time => ["Temps d'attente", :Fixnum],
    :"&block" => ["Action à exécuter ({action})", :Block],

  }
register_command :standard, 'Command.wait_with'

# AUTOGenerated for split_each_char
link_method_documentation 'Command.split_each_char',
	'Transforme une chaîne de caractères en un tableau de caractères',
 	{
		:str => ["Chaine a transformer", :String],

	}, true # Maybe changed
register_command :standard, 'Command.split_each_char'

# AUTOGenerated for qte
link_method_documentation 'Command.qte',
  'Attend la saisie d\'une touche pendant une durée donnée. La commande renvoie true si la touche a été saisie, false sinon.',
  {
    :key => ["Touche qu'il faut presser avant la fin", :Symbol],
    :time => ["Durée", :Fixnum],
    :"*strict" => ["Difficulté, si elle vaut true, aucune erreur admise, sinon erreurs admises. Par défaut vaut true", :Boolean]

  }, true # Maybe changed
register_command :standard, 'Command.qte'

# AUTOGenerated for wait_trigger
link_method_documentation 'Command.wait_trigger',
  'Attend l\'appui d\'une touche',
  {
    :key => ["Touche à attendre", :Symbol],

  }
register_command :standard, 'Command.wait_trigger'

# AUTOGenerated for wait_release
link_method_documentation 'Command.wait_release',
  'Attend le relâchement d\'une touche',
  {
    :key => ["Touche à attendre", :Symbol],

  }, true # Maybe changed
register_command :standard, 'Command.wait_release'


# AUTOGenerated for call_title_screen
link_method_documentation 'Command.call_title_screen',
  'Renvoie à l\'écran titre',
  {}
register_command :scene, 'Command.call_title_screen'

# AUTOGenerated for call_load_screen
link_method_documentation 'Command.call_load_screen',
  'Renvoie à la scene de chargement de partie',
  {}
register_command :scene, 'Command.call_load_screen'

# AUTOGenerated for scene_call
link_method_documentation 'Command.scene_call',
  'Appelle une scene (et la place dans la pile de scene)',
  {
    :scene => ["Scene à appeler", :Scene],

  }, true # Maybe changed
register_command :scene, 'Command.scene_call'

# AUTOGenerated for scene_goto
link_method_documentation 'Command.scene_goto',
  'Appelle une scene (sans la placer dans la pile de scene)',
  {
    :scene => ["Scene à appeler", :Scene],

  }
register_command :scene, 'Command.scene_goto'

# AUTOGenerated for scene_return
link_method_documentation 'Command.scene_return',
  'Renvoie à la dernière scene dans la pile d\'appel',
  {}
register_command :scene, 'Command.scene_return'

# AUTOGenerated for scene_clear_history
link_method_documentation 'Command.scene_clear_history',
  'Vide la pile d\'appel des scenes',
  {}
register_command :scene, 'Command.scene_clear_history'

# AUTOGenerated for fadeout
link_method_documentation 'Command.fadeout',
  'Fondu noir (et sonore) du jeu pendant la durée passée en argument',
  {
    :"*time" => ["Durée de fondu", :Fixnum],

  }
register_command :standard, 'Command.fadeout'

# AUTOGenerated for rm_kill
link_method_documentation 'Command.rm_kill',
  'Quitte le jeu... d\'un coup sec... TCHAK',
  {}
register_command :standard, 'Command.rm_kill'

# AUTOGenerated for start_new_game
link_method_documentation 'Command.start_new_game',
  'Démarre une nouvelle partie',
  {}
register_command :save, 'Command.start_new_game'

# AUTOGenerated for save_game
link_method_documentation 'Command.save_game',
  'Sauvegarde la partie sur la sauvegardé référencée par l\'ID donné',
  {
    :index => ["Numéro de la sauvegarde", :Fixnum],

  }
register_command :save, 'Command.save_game'

# AUTOGenerated for load_game
link_method_documentation 'Command.load_game',
  'Charge la partie référencée par l\'ID de sauvegarde donné',
  {
    :index => ["Numéro de la sauvegarde", :Fixnum],
    :"*time" => ["Durée du fadeout", :Fixnum],

  }
register_command :save, 'Command.load_game'

# AUTOGenerated for a_save_exists?
link_method_documentation 'Command.a_save_exists?',
  'Renvoie true si au moins une sauvegade a été faite, false sinon',
  {}, true
register_command :save, 'Command.a_save_exists?'

# AUTOGenerated for save_exists?
link_method_documentation 'Command.save_exists?',
  'Renvoie true si la sauvegarde référencée par son numéro existe',
  {
    :index => ["Numéro de la sauvegarde", :Fixnum],

  }, true # Maybe changed
register_command :save, 'Command.save_exists?'

# AUTOGenerated for save_delete
link_method_documentation 'Command.save_delete',
  'Supprime la sauvegarde référencée par son numéro',
  {
    :index => ["Numéro de la sauvegarde", :Fixnum],

  }, true # Maybe changed
register_command :save, 'Command.save_delete'

# AUTOGenerated for import_variable
link_method_documentation 'Command.import_variable',
  'Renvoie la valeur d\'une variable issue d\'une autre sauvegarde',
  {
    :index => ["Numéro de la sauvegarde", :Fixnum],
    :idvar => ["Numéro de la variable", :Fixnum],

  }, true # Maybe changed
register_command :save, 'Command.import_variable'

# AUTOGenerated for import_switch
link_method_documentation 'Command.import_switch',
  'Renvoie la valeur d\'un interrupteur issu d\'une autre sauvegarde',
  {
    :index => ["Numéro de la sauvegarde", :Fixnum],
    :idswitch => ["Numéro de l'interrupteur", :Fixnum],

  }, true # Maybe changed
register_command :save, 'Command.import_switch'

# AUTOGenerated for import_label
link_method_documentation 'Command.import_label',
  'Renvoie la valeur d\'un label issu d\'une autre sauvegarde',
  {
    :index => ["Numéro de la sauvegarde", :Fixnum],
    :idlabel => ["Identifiant du label", :Fixnum],

  }, true # Maybe changed
register_command :save, 'Command.import_label'

# AUTOGenerated for random_combination
link_method_documentation 'Command.random_combination',
  'Renvoie une combinaison (tableau itérable) aléatoire de la taille spécifiée en argument, composée des paramètres des touches passées en arguments. (par exemple : random_combination(5, :UP, :DOWN, :LEFT, :RIGHT) )',
  {
    :len => ["Args description", :Fixnum],
    :"*keys" => ["Liste des touches pouvant constituer la combinaison", :Argslist],

  }, true # Maybe changed
register_command :standard, 'Command.random_combination'

# AUTOGenerated for pick_random
link_method_documentation 'Command.pick_random',
  'Renvoie un élément au hasard du tableau (ou de la liste d\'arguments)',
  {
    :"*elts" => ["éléments dans lesquels piocher un élément aléatoire. Soit pick_random(a, b, c, d...etc.) soit pick_random([a,b,c,d...etc])", :ArgsList],
  }, true # Maybe changed
register_command :standard, 'Command.pick_random'

# AUTOGenerated for event_name
link_method_documentation 'Command.event_name',
  'Renvoie le nom d\'un évènement, renvoie nil s\' il s\'agit du héros',
  {
    :id => ["ID de l'évènement (0 pour le héros)", :Fixnum],

  }, true # Maybe changed
register_command :event, 'Command.event_name'

# AUTOGenerated for event_through?
link_method_documentation 'Command.event_through?',
	"Renvoie true si l'évènement est en mode 'traverse tout', false sinon",
 	{
		:id => ["ID de l'évènement", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_through?'

# AUTOGenerated for player_through?
link_method_documentation 'Command.player_through?',
	"Renvoie true si le joueur est en mode 'traverse tout', false sinon",
 	{}, true # Maybe changed
register_command :event, 'Command.player_through?'

# AUTOGenerated for event_through
link_method_documentation 'Command.event_through',
	'Change le mode de traversée de l\'évènement',
 	{
		:id => ["ID de l'évènement", :Fixnum],
		:"*flag" => ["true pour 'traverse tout', false pour 'ne traverse pas tout', par défaut vaut true ", :Boolean],

	}
register_command :event, 'Command.event_through'

# AUTOGenerated for player_through
link_method_documentation 'Command.player_through',
	'Change le mode de traversée du joueur',
 	{
		:"*flag" => ["true pour 'traverse tout', false pour 'ne traverse pas tout', par défaut vaut true ", :Boolean],

	}
register_command :event, 'Command.player_through'

link_method_documentation 'Command.event_erased?',
  "Renvoie true si l'évènement référencé par son ID à été supprimé, false sinon",
  {
    :id => ["ID de l'évènement (0 pour le héro)", :Fixnum],

  }, true # Maybe changed
register_command :event, 'Command.event_erased?'

# AUTOGenerated for cursor_system
link_method_documentation 'Command.cursor_system',
  'Affiche ou masque le curseur Windows sur la fenêtre de jeu',
  {
    :flag => ["true pour visible, false pour invisible", :Boolean],

  }
register_command :mouse, 'Command.cursor_system'

# AUTOGenerated for parallax_autoscroll
link_method_documentation 'Command.parallax_autoscroll',
  "Défilement horizontal et vertical automatique d'un panorama",
    {
      :id => ["ID du panorama", :Fixnum],
      :speed_x => ["Vitesse de défilement horizontal", :Fixnum],
      :speed_x => ["Vitesse de défilement vertical", :Fixnum],
      :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
      :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
    }
register_command :parallax, 'Command.parallax_autoscroll'

# AUTOGenerated for parallax_z
link_method_documentation 'Command.parallax_z',
  'Change l\'axe Z du panorama',
  {
    :id => ["Identifiant du panorama", :Fixnum],
    :z => ["Axe Z", :Fixnum],

  }
register_command :parallax, 'Command.parallax_z'

# AUTOGenerated for parallax_scroll
link_method_documentation 'Command.parallax_scroll',
  'Change la vitesse de défilement d\' un panorama référencé par son ID',
  {
    :id => ["Identifiant du panorama", :Fixnum],
    :x => ["vitesse horizontale", :Fixnum],
    :y => ["vitesse verticale", :Fixnum],

  }
register_command :parallax, 'Command.parallax_scroll'

# AUTOGenerated for mouse_hover_player?
link_method_documentation 'Command.mouse_hover_player?',
  'Renvoie true si la souris survole l\'image du joueur',
  {}, true # Maybe changed
register_command :event, 'Command.mouse_hover_player?'

# AUTOGenerated for mouse_click_player?
link_method_documentation 'Command.mouse_click_player?',
  'Renvoie true si la souris clique sur l\'image du joueur',
  {}, true # Maybe changed
register_command :event, 'Command.mouse_click_player?'

# AUTOGenerated for mouse_press_player?
link_method_documentation 'Command.mouse_press_player?',
  'Renvoie true si la souris presse en continu la touche passée en argument sur le joueur',
  {
    :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left)", :ArgType],

  }, true # Maybe changed
register_command :event, 'Command.mouse_press_player?'

# AUTOGenerated for mouse_trigger_player?
link_method_documentation 'Command.mouse_trigger_player?',
  'Renvoie true si la souris appuie une fois la touche passée en argument sur le joueur',
  {
    :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left)", :ArgType],

  }, true # Maybe changed
register_command :event, 'Command.mouse_trigger_player?'

# AUTOGenerated for mouse_repeat_player?
link_method_documentation 'Command.mouse_repeat_player?',
  'Renvoie true si la souris appuie de manière répétée sur la touche passée en argument sur l\'image du joueur',
  {
    :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left)", :ArgType],

  }, true # Maybe changed
register_command :event, 'Command.mouse_repeat_player?'

# AUTOGenerated for mouse_release_player?
link_method_documentation 'Command.mouse_release_player?',
  'Renvoie true si la souris relâche la touche passée en argument sur le joueur',
  {
    :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left)", :ArgType],

  }, true # Maybe changed
register_command :event, 'Command.mouse_release_player?'

# AUTOGenerated for last_clicked_event
link_method_documentation 'Command.last_clicked_event',
  "Renvoie le dernier event cliqué par la souris, nil si aucun évènement n'a été cliqué",
  {}, true # Maybe changed
register_command :event, 'Command.last_clicked_event'

# AUTOGenerated for last_pressed_event
link_method_documentation 'Command.last_pressed_event',
  "Renvoie le dernier event pressé (avec :mouse_left) par la souris, nil si aucun évènement n'a été pressé",
  {}, true # Maybe changed
register_command :event, 'Command.last_pressed_event'

# AUTOGenerated for last_triggered_event
link_method_documentation 'Command.last_triggered_event',
  "Renvoie le dernier event appuyé une fois (avec :mouse_left) par la souris, nil si aucun évènement n'a été triggeré",
  {}, true # Maybe changed
register_command :event, 'Command.last_triggered_event'

# AUTOGenerated for last_released_event
link_method_documentation 'Command.last_released_event',
  "Renvoie le dernier event relâché (avec mouse_left) par la souris, nil si aucun évènement n'a été relâché",
  {}, true # Maybe changed
register_command :event, 'Command.last_released_event'

# AUTOGenerated for last_repeated_event
link_method_documentation 'Command.last_repeated_event',
  "Renvoie le dernier event cliqué en continu (avec :mouse_left) par la souris, nil si aucun évènement n'a été cliqué en continu",
  {}, true # Maybe changed
register_command :event, 'Command.last_repeated_event'

# AUTOGenerated for last_hovered_event
link_method_documentation 'Command.last_hovered_event',
  "Renvoie le dernier event survolé par la souris, nil si aucun évènement n'a été survolé",
  {}, true # Maybe changed
register_command :event, 'Command.last_hovered_event'

# AUTOGenerated for events_buzzer_properties
link_method_documentation 'Command.events_buzzer_properties',
  "Change les propriétés de tressaillement d'évènements",
  {
    :e => ["Selecteurs d'évènements", :Selector],
    :amplitude => ["Amplitude du tressaillement", :ArgType],
    :length => ["Taille du tressaillement", :Fixnum],

  }
register_command :event, 'Command.events_buzzer_properties'

# AUTOGenerated for followers_buzzer_properties
link_method_documentation 'Command.followers_buzzer_properties',
  "Change les propriétés de tressaillement des membres de la chenille (followers_buzzer_properties(0,1,2,3, amplitude, length))",
  {
    :"*ids" => ["Liste des positions des suiveurs. Si cet argument est occulté, ces paramètres s'appliquent à tous les suiveurs.", :ArgsList],
    :amplitude => ["Amplitude du tressaillement", :ArgType],
    :length => ["Taille du tressaillement", :Fixnum],

  }
register_command :event, 'Command.followers_buzzer_properties'

# AUTOGenerated for events_buzz
link_method_documentation 'Command.events_buzz',
  'Fait tressaillir les évènements',
  {
    :e => ["Selecteur d'évènements", :Selector],
    :"*duration" => ["Durée du dressaillement (en frames), par défaut, 16", :Fixnum],

  }
register_command :event, 'Command.events_buzz'

# AUTOGenerated for followers_buzz
link_method_documentation 'Command.followers_buzz',
  'Fait tressaillir les suiveurs (followers_buzz([1,2,3], *duration), par exemple, si la liste des suiveurs n\'est pas renseignée, ça s\'applique à tous les followers)',
  {
    :ids => ["Tableau des identifiants des suiveurs à faire tressaillir, utiliser [] pour appliquer à tous les suiveurs", :Selector],
    :"*duration" => ["Durée du dressaillement (en frame), par défaut, 16", :Fixnum]

  }
register_command :event, 'Command.followers_buzz'

# AUTOGenerated for create_rect_area
link_method_documentation 'Command.create_rect_area',
  "Crée et renvoie une zone rectangulaire",
  {
    :x => ["Coordonnées X de la zone", :Fixnum],
    :y => ["Coordonnées Y de la zone", :Fixnum],
    :width => ["Largeur de la zone", :Fixnum],
    :height => ["Hauteur de la zone", :Fixnum],

  }, true # Maybe changed
register_command :area, 'Command.create_rect_area'

# AUTOGenerated for create_circle_area
link_method_documentation 'Command.create_circle_area',
  'Crée et renvoie une zone circulaire',
  {
    :x => ["Coordonnées X de la zone", :Fixnum],
    :y => ["Coordonnées Y de la zone", :Fixnum],
    :rayon => ["Rayon de la zone", :Fixnum],

  }, true # Maybe changed
register_command :area, 'Command.create_circle_area'

# AUTOGenerated for create_ellipse_area
link_method_documentation 'Command.create_ellipse_area',
  'Crée et renvoie une zone elliptique',
  {
    :x => ["Coordonnées X de la zone", :Fixnum],
    :y => ["Coordonnées Y de la zone", :Fixnum],
    :width => ["Largeur de la zone", :Fixnum],
    :height => ["Hauteur de la zone", :Fixnum],

  }, true # Maybe changed
register_command :area, 'Command.create_ellipse_area'

# AUTOGenerated for create_polygon_area
link_method_documentation 'Command.create_polygon_area',
  'Crée et renvoie une zone polygonale (le dernier point est relié avec le premier)',
  {
    :"points" => ["Liste de points. Exemple : create_polygon_area([[ax, ay], [bx, by], [cx, cy]])", :ArgType],

  }, true # Maybe changed
register_command :area, 'Command.create_polygon_area'

# AUTOGenerated for in_area?
link_method_documentation 'Command.in_area?',
  'Vérifie si le point référencé par X, Y est inscrit dans la zone passée en argument',
  {
    :area => ["Zone à vérifier", :Area],
    :x => ["Coordonnée X du point", :Fixnum],
    :y => ["Coordonnée Y du point", :ArgType],

  }, true # Maybe changed
register_command :area, 'Command.in_area?'

# AUTOGenerated for mouse_hover_area?
link_method_documentation 'Command.mouse_hover_area?',
  "Renvoie true si la souris survole la zone passée en argument au moment de l'appel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],

  }, true # Maybe changed
register_command :area, 'Command.mouse_hover_area?'

# AUTOGenerated for mouse_hover_square_area?
link_method_documentation 'Command.mouse_hover_square_area?',
  "Renvoie true si la souris survole la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en cases et non en pixels, false sinon",
  {
    :area => ["Zone à vérifier", :Area],

  }, true # Maybe changed
register_command :area, 'Command.mouse_hover_square_area?'

# AUTOGenerated for mouse_click_area?
link_method_documentation 'Command.mouse_click_area?',
  "Renvoie true si la souris survole et clique sur la zone passée en argument au moment de l'appel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],

  }, true # Maybe changed
register_command :area, 'Command.mouse_click_area?'

# AUTOGenerated for mouse_click_square_area?
link_method_documentation 'Command.mouse_click_square_area?',
  "Renvoie true si la souris survole et clique sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en cases et non en pixels, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_click_square_area?'

# AUTOGenerated for mouse_trigger_area?
link_method_documentation 'Command.mouse_trigger_area?',
  "Renvoie true si la souris survole et clique une fois sur la zone passée en argument au moment de l'appel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_trigger_area?'

# AUTOGenerated for mouse_trigger_square_area?
link_method_documentation 'Command.mouse_trigger_square_area?',
  "Renvoie true si la souris survole et clique une fois sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en cases et non en pixels, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_trigger_square_area?'

# AUTOGenerated for mouse_press_area?
link_method_documentation 'Command.mouse_press_area?',
  "Renvoie true si la souris survole et clique en continu sur la zone passée en argument au moment de l'appel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_press_area?'

# AUTOGenerated for mouse_press_square_area?
link_method_documentation 'Command.mouse_press_square_area?',
  "Renvoie true si la souris survole et clique en continu sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en cases et non en pixels, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_press_square_area?'

# AUTOGenerated for mouse_release_area?
link_method_documentation 'Command.mouse_release_area?',
  "Renvoie true si la souris survole et est relâchée sur la zone passée en argument au moment de l'appel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_release_area?'

# AUTOGenerated for mouse_release_square_area?
link_method_documentation 'Command.mouse_release_square_area?',
  "Renvoie true si la souris survole et est relâchée sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en cases et non en pixels, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_release_square_area?'

# AUTOGenerated for mouse_repeat_area?
link_method_documentation 'Command.mouse_repeat_area?',
  "Renvoie true si la souris survole et pressée de manière répétée sur la zone passée en argument au moment de l'appel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_repeat_area?'

# AUTOGenerated for mouse_repeat_square_area?
link_method_documentation 'Command.mouse_repeat_square_area?',
  "Renvoie true si la souris survole et est pressée de manière répétée sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en cases et non en pixels, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_repeat_square_area?'

# AUTOGenerated for angle_between
link_method_documentation 'Command.angle_between',
  'Renvoie l\'angle entre deux événements référencés par leurs ID\'s',
  {
    :idA => ["ID de l'évènement A (0 pour héros)", :Fixnum],
    :idB => ["ID de l'évènement B (0 pour héros)", :Fixnum],

  }, true # Maybe changed
register_command :event, 'Command.angle_between'

# AUTOGenerated for textfield_text_show
link_method_documentation 'Command.textfield_text_show',
  'Affiche un champ de texte permettant de saisir du texte',
  {
    :id => ["ID du champ de texte", :Fixnum],
    :text => ["Texte du champ à afficher par défaut", :String],
    :x => ["Position X du champ", :Fixnum],
    :y => ["Position Y du champ", :Fixnum],
    :w => ["Largeur du champ de texte", :Fixnum],
    :profile => ["Référence du profile du champ de texte", :Fixnum],
    :"*range" => ["Intervalle du nombre de caractères autorisés, peut être occulté", :Range],
    :"*active" => ["Défini si le textfield est actif à sa création (true oui, false non). Par défaut: true", :Boolean],
    :"*opacity" => ["Défini l'opacité du textfield, par défaut, 255", :Fixnum]

  }
register_command :textfield, 'Command.textfield_text_show'

# AUTOGenerated for textfield_int_show
link_method_documentation 'Command.textfield_int_show',
  'Affiche un champ de texte permettant de saisir des nombres entiers',
  {
    :id => ["ID du champ de texte", :Fixnum],
    :number => ["Nombre à afficher par défaut", :Fixnum],
    :x => ["Position X du champ", :Fixnum],
    :y => ["Position Y du champ", :Fixnum],
    :w => ["Largeur du champ de texte", :Fixnum],
    :profile => ["Référence du profile du champ de texte", :Fixnum],
    :"*range" => ["Intervalle des nombres autorisés, peut être occulté", :Range],
    :"*active" => ["Défini si le textfield est actif à sa création (true oui, false non). Par défaut: true", :Boolean],
    :"*opacity" => ["Défini l'opacité du textfield, par défaut, 255", :Fixnum]

  }
register_command :textfield, 'Command.textfield_int_show'

# AUTOGenerated for textfield_float_show
link_method_documentation 'Command.textfield_float_show',
  'Affiche un champ de texte permettant de saisir des nombres à virgule',
  {
    :id => ["ID du champ de texte", :Fixnum],
    :number => ["Nombre à afficher par défaut du champ", :Float],
    :x => ["Position X du champ", :Fixnum],
    :y => ["Position Y du champ", :Fixnum],
    :w => ["Largeur du champ de texte", :Fixnum],
    :profile => ["Référence du profile du champ de texte", :Fixnum],
    :"*range" => ["Intervalle des nombres autorisés, peut être occulté", :Range],
    :"*active" => ["Défini si le textfield est actif à sa création (true oui, false non). Par défaut: true", :Boolean],
    :"*opacity" => ["Défini l'opacité du textfield, par défaut, 255", :Fixnum]

  }
register_command :textfield, 'Command.textfield_float_show'

# AUTOGenerated for textfield_erase
link_method_documentation 'Command.textfield_erase',
  'Supprime le champ de texte référencé par son ID',
  {
    :"*id" => ["ID de la zone de texte, si aucun ID n'est spécifié, toutes les zones de textes seront supprimées", :Fixnum],

  }
register_command :textfield, 'Command.textfield_erase'

# AUTOGenerated for textfield_activate
link_method_documentation 'Command.textfield_activate',
  'Active la zone de texte référencée par son ID',
  {
    :id => ["ID de la zone de texte", :Fixnum],

  }
register_command :textfield, 'Command.textfield_activate'

# AUTOGenerated for textfield_deactivate
link_method_documentation 'Command.textfield_deactivate',
  'désactive la zone de texte référencée par son ID',
  {
    :"*id" => ["ID du champ de texte, si aucun ID n'est spécifié, toutes les zones de textes seront désactivés", :Fixnum],

  }
register_command :textfield, 'Command.textfield_deactivate'

# AUTOGenerated for textfield_active?
link_method_documentation 'Command.textfield_active?',
  'Renvoie true si le champ de texte référencé par son ID est activé',
  {
    :id => ["ID de la zone de texte", :Fixnum],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_active?'

# AUTOGenerated for textfield_get_value
link_method_documentation 'Command.textfield_get_value',
  'Renvoie la valeur de la zone de texte référencé par son ID',
  {
    :id => ["ID de la zone de texte", :Fixnum],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_get_value'

# AUTOGenerated for textfield_set_value
link_method_documentation 'Command.textfield_set_value',
  'Attribue une valeur à un champ de texte référencé par son ID',
  {
    :id => ["ID de la zone de texte", :Fixnum],
    :value => ["Valeur à attribuer", :TextfieldType],

  }
register_command :textfield, 'Command.textfield_set_value'

# AUTOGenerated for textfield_hover?
link_method_documentation 'Command.textfield_hover?',
  'Renvoie true si la souris survole le champ de texte référencé par son ID, false sinon',
  {
    :id => ["ID de la zone de texte", :Fixnum],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_hover?'

# AUTOGenerated for textfield_click?
link_method_documentation 'Command.textfield_click?',
  'Renvoie true si la souris clique sur le champ de texte référencé par son ID, false sinon',
  {
    :id => ["ID de la zone de texte", :Fixnum],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_click?'

# AUTOGenerated for textfield_press?
link_method_documentation 'Command.textfield_press?',
  'Renvoie true si la souris est pressée en continu sur le champ de texte référencé par son ID, false sinon',
  {
    :id => ["ID de la zone de texte", :Fixnum],
    :"*key" => ["Bouton de la souris, par défaut :mouse_left", :Key],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_press?'

# AUTOGenerated for textfield_release?
link_method_documentation 'Command.textfield_release?',
  'Renvoie true si la souris est relâchée sur le champ de texte référencé par son ID, false sinon',
  {
    :id => ["ID de la zone de texte", :Fixnum],
    :"*key" => ["Bouton de la souris, par défaut :mouse_left", :Key],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_release?'

# AUTOGenerated for textfield_trigger?
link_method_documentation 'Command.textfield_trigger?',
  'Renvoie true si la souris clique une fois sur le champ de texte référencé par son ID, false sinon',
  {
    :id => ["ID de la zone de texte", :Fixnum],
    :"*key" => ["Bouton de la souris, par défaut :mouse_left", :Key],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_trigger?'

# AUTOGenerated for textfield_repeat?
link_method_documentation 'Command.textfield_repeat?',
  'Renvoie true si la souris clique de manière répétée sur le champ de texte référencé par son ID, false sinon',
  {
    :id => ["ID de la zone de texte", :Fixnum],
    :"*key" => ["Bouton de la souris, par défaut :mouse_left", :Key],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_repeat?'

# AUTOGenerated for textfield_visible
link_method_documentation 'Command.textfield_visible',
  'Change la visibilité du champ de texte référencé par son ID',
  {
    :id => ["ID de la zone de texte", :Fixnum],
    :flag => ["True pour visible, false pour invisible", :Boolean],

  }
register_command :textfield, 'Command.textfield_visible'

# AUTOGenerated for textfield_visible
link_method_documentation 'Command.textfield_visible?',
  'Renvoie true si le champ de texte référencé par son ID est visible, false sinon',
  {
    :id => ["ID de la zone de texte", :Fixnum],

  }, true
register_command :textfield, 'Command.textfield_visible?'

# AUTOGenerated for textfield_opacity
link_method_documentation 'Command.textfield_opacity',
  'Change l\'opacité du champ de texte référencé par son ID',
  {
    :id => ["ID de la zone de texte", :Fixnum],
    :opacity => ["Opacité, entre 0 et 255. Si aucune opacité n'est donnée, la commande renverra la valeur de l'opacité du champ", :Fixnum],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_opacity'

# AUTOGenerated for message_height
link_method_documentation 'Command.message_height',
  'Change le nombre de lignes affichées dans les messages (Commande Event Afficher message)',
  {
    :n => ["Nombre de lignes visibles", :Fixnum],

  }
register_command :standard, 'Command.message_height'

# # AUTOGenerated for bind
# link_method_documentation 'Command.bind',
#   'Associe un micro_event à un sélecteur',
#   {
#     :e => ["Sélecteur d'évènements", :Selecteur],
#     :"*args" => ["Voir l'explication référente aux micro_event dans la documentation", :Args],
#     :"&block" => ["Action à exécuter", :Block],

#   }
# register_command :micro, 'Command.bind'

# # AUTOGenerated for unbind
# link_method_documentation 'Command.unbind',
#   'Dissocie un micro_evenement d\'un sélecteur d`\'évènements',
#   {
#     :e => ["Sélecteur d'évènements", :Selecteur],
#     :"*k" => ["Voir l'explication référente aux micro_event dans la documentation", :Args],

#   }, true # Maybe changed
# register_command :micro, 'Command.unbind'


# AUTOGenerated for clipboard_push_text
link_method_documentation 'Command.clipboard_push_text',
  'Place un texte dans le presse-papier',
  {
    :text => ["Texte à sauvegarder dans le presse-papier", :String],

  }
register_command :clipboard, 'Command.clipboard_push_text'

# AUTOGenerated for clipboard_get_text
link_method_documentation 'Command.clipboard_get_text',
  'Renvoie le texte contenu dans le presse-papier',
  {}, true # Maybe changed
register_command :clipboard, 'Command.clipboard_get_text'

# AUTOGenerated for clipboard_push_command
link_method_documentation 'Command.clipboard_push_command',
  'Place une commande évènement dans le presse-papier',
  {
    :cmd => ["Commande à placer dans le presse-papier", :RPGCommand],

  }
register_command :clipboard, 'Command.clipboard_push_command'

# AUTOGenerated for pad360_plugged?
link_method_documentation 'Command.pad360_plugged?',
  'Renvoie true si une manette est branchée dans le port référencé par son ID, false sinon',
  {
    :"*id" => ["Port de la manette, par défaut 0, soit la première manette branchée", :Fixnum],

  }, true
register_command :xbox, 'Command.pad360_plugged?'

# AUTOGenerated for pad360_stop_vibration_left
link_method_documentation 'Command.pad360_stop_vibration_left',
  'Arrête la vibration du moteur gauche de la manette référencée par son ID',
  {
    :"*id" => ["Port de la manette, par défaut 0, soit la première manette branchée", :Fixnum],

  }
register_command :xbox, 'Command.pad360_stop_vibration_left'

# AUTOGenerated for pad360_stop_vibration_right
link_method_documentation 'Command.pad360_stop_vibration_right',
  'Arrête la vibration du moteur droit de la manette référencée par son ID',
  {
    :"*id" => ["Port de la manette, par défaut 0, soit la première manette branchée", :Fixnum],

  }
register_command :xbox, 'Command.pad360_stop_vibration_right'

# AUTOGenerated for pad360_vibrate
link_method_documentation 'Command.pad360_vibrate',
  'Fait vibrer la manette référencée par son ID',
  {
    :"*id" => ["Port de la manette, par défaut 0, soit la première manette branchée", :Fixnum],
    :"*left" => ["Force dans le moteur gauche, par défaut, 100", :Fixnum],
    :"*right" => ["Force dans le moteur droit, par défaut, 100", :Fixnum],

  }
register_command :xbox, 'Command.pad360_vibrate'

# AUTOGenerated for pad360_stop_vibration
link_method_documentation 'Command.pad360_stop_vibration',
  'Arrête la vibration des deux moteurs de la manette référencée par son ID',
  {
    :"*id" => ["Port de la manette, par défaut 0, soit la première manette branchée", :Fixnum],

  }
register_command :xbox, 'Command.pad360_stop_vibration'

# AUTOGenerated for pad360_vibrate_left
link_method_documentation 'Command.pad360_vibrate_left',
  'Fait vibrer le moteur gauche de la manette référencée par son ID',
  {
    :"*id" => ["Port de la manette, par défaut 0, soit la première manette branchée", :Fixnum],
    :"*s" => ["Force de la vibration, par défaut, 100", :Fixnum],

  }
register_command :xbox, 'Command.pad360_vibrate_left'

# AUTOGenerated for pad360_vibrate_right
link_method_documentation 'Command.pad360_vibrate_right',
  'Fait vibrer le moteur droit de la manette référencée par son ID',
  {
    :"*id" => ["Port de la manette, par défaut 0, soit la première manette branchée", :Fixnum],
    :"*s" => ["Force de la vibration, par défaut, 100", :Fixnum],

  }
register_command :xbox, 'Command.pad360_vibrate_right'

# AUTOGenerated for actor_change_appear
link_method_documentation 'Command.actor_change_appear',
	'Change l\'apparence et la face du héros référencé par son ID',
 	{
		:id => ["ID du héros", :Fixnum],
		:character_name => ["Nom du caractère", :String],
		:character_index => ["ID du caractère", :Fixnum],
		:face_name => ["Nom du face", :String],
		:face_index => ["ID du face", :Fixnum],

	}
register_command :actors, 'Command.actor_change_appear'

# AUTOGenerated for actor_change_character
link_method_documentation 'Command.actor_change_character',
	'Change l\'apparence du héros référencé par son ID',
 	{
		:id => ["ID du héros", :Fixnum],
		:character_name => ["Nom du caractère", :String],
		:character_index => ["ID du caractère", :Fixnum],

	}
register_command :actors, 'Command.actor_change_character'

# AUTOGenerated for actor_change_face
link_method_documentation 'Command.actor_change_face',
	'Change la face du héros référencé par son ID',
 	{
		:id => ["ID du héros", :Fixnum],
		:face_name => ["Nom du face", :String],
		:face_index => ["ID du face", :Fixnum],

	}
register_command :actors, 'Command.actor_change_face'

 # AUTOGenerated for event_erase
link_method_documentation 'Command.event_erase',
	'Efface de la map les événements référencés par le sélécteur ID',
 	{
		:id => ["ID des événements", :Selector],

	}
register_command :event, 'Command.event_erase'

# AUTOGenerated for show_animation
link_method_documentation 'Command.show_animation',
	'Joue une animation sur les événements référencés par le selecteur ID',
 	{
		:ids => ["IDS des événements", :Selector],
		:id_animation => ["ID de l'animation", :Fixnum],
		:"*wait_flag" => ["attend la fin si true", :string],

	}
register_command :event, 'Command.show_animation'

# AUTOGenerated for show_balloon
link_method_documentation 'Command.show_balloon',
	'Joue une émoticone sur les événements référencés par le selecteur ID',
 	{
		:ids => ["IDS des événements", :Selector],
		:id_balloon => ["ID de l'émoticone", :Fixnum],
		:"*wait_flag" => ["attend la fin si true", :String],

	}
register_command :event, 'Command.show_balloon'


# AUTOGenerated for website
link_method_documentation 'Command.website',
  'Ouvre la page web passée en argument',
  {
    :url => ["Url à charger", :String],

  }
register_command :standard, 'Command.website'

# AUTOGenerated for event_move_speed
link_method_documentation 'Command.event_move_speed',
  'Modifie la vitesse des événements référencés par leurs Id',
  {
    :ids => ["ID des événements", :Selector],
    :v => ["Vitesse des événements,si aucune priorité n'est donnée, la commande renverra la valeur de la vitesse de l'évènement référencé par son ID", :Fixnum],

  }
register_command :event, 'Command.event_move_speed'

# AUTOGenerated for player_move_speed
link_method_documentation 'Command.player_move_speed',
  'Modifie la vitesse du joueur',
  {
    :v => ["Vitesse du joueur à donner,si aucune priorité n'est donnée, la commande renverra la valeur de la vitesse du héros", :Fixnum],

  }
register_command :event, 'Command.player_move_speed'

# AUTOGenerated for event_move_frequency
link_method_documentation 'Command.event_move_frequency',
  'Modifie la fréquence des événements référencés par leurs Id',
  {
    :ids => ["ID des événements", :Selector],
    :f => ["Fréquence des événements, si aucune priorité n'est donnée, la commande renverra la valeur de la fréquence de l'évènement référencé par son ID", :Fixnum],

  }
register_command :event, 'Command.event_move_frequency'

# AUTOGenerated for player_move_frequency
link_method_documentation 'Command.player_move_frequency',
  'Modifie la fréquence du joueur',
  {
    :f => ["Fréquence du joueur, si aucune priorité n'est donnée, la commande renverra la valeur de la fréquence du héros", :Fixnum],

  }
register_command :event, 'Command.player_move_frequency'

# AUTOGenerated for event_transfert
link_method_documentation 'Command.event_transfert',
	'Téléporte l\'évènement référencé par son ID à une nouvelle coordonnées de la carte',
 	{
		:id => ["ID de l'évènement", :Fixnum],
		:new_x => ["Coordonnées X", :Fixnum],
		:new_y => ["Coordonnées Y", :Fixnum],

	}
register_command :event, 'Command.event_transfert'
# AUTOGenerated for player_transfert
link_method_documentation 'Command.player_transfert',
	'Téléporte instanément le héros à une autre position de la carte',
 	{
		:new_x => ["Coordonnée X", :Fixnum],
		:new_y => ["Coordonnée Y", :Fixnum],

	}
register_command :event, 'Command.player_transfert'

# AUTOGenerated for player_transfert
link_method_documentation 'Command.player_teleport',
	'Téléporte le héros à une nouvelle coordonnées sur une nouvelle map (potentiellement)',
 	{
		:map_id => ["ID de la carte. Utiliser c(:map_id) pour téléporter sur la même carte", :Fixnum],
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],
		:"*direction" => ["Nouvelle direction pour le héro (2,4,6 ou 8). Si aucune direction n'est spécifiée, le joueur gardera sa direction", :Fixnum],
    :"*fade_type" => ["Le mode de téléport (par défaut 0), 0 = fondu noir, 1 = fondu blanc, 2 = instantanné", :Fixnum]

	}
register_command :event, 'Command.player_teleport'

# AUTOGenerated for player_teleport_with_transition
link_method_documentation 'Command.player_teleport_with_transition',
	'Effectue une téléportation avec une image comme transition',
 	{
		:map_id => ["ID de la carte. Utiliser c(:map_id) pour téléporter sur la même carte", :Fixnum],
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],
		:transition => ["Image où se trouve la transition", :String],
		:duration => ["Durée de la transition", :Fixnum],
		:"*vague" => ["Ambiguité (par défaut, 40)", :Fixnum],
		:"*direction" => ["Nouvelle direction pour le héro (2,4,6 ou 8). Si aucune direction n'est spécifiée, le joueur gardera sa direction", :Fixnum],

	}
register_command :event, 'Command.player_teleport_with_transition'

# AUTOGenerated for perform_transition
link_method_documentation 'Command.perform_transition',
	'Effectue une transition à l\'écran',
 	{
		:transition => ["Image où se trouve la transition", :String],
		:duration => ["Durée de la transition", :Fixnum],
		:before => ["Fonction à exécuter avant la transition", :Block],
		:during => ["Fonction à exécuter pendant la transition", :Block],
		:after => ["Fonction à exécuter après la transition", :Block],
		:"*vague" => ["Ambiguité (par défaut, 40)", :Fixnum],

	}
register_command :screen, 'Command.perform_transition'

link_method_documentation 'Command.use_reflection',
	'Active la réflexion sur une surface. Regardez l\'exemple pour comprendre son fonctionnement',
 	{
		:properties => ["L'ensemble des propriétés", :Hash],

	}
register_command :fx, 'Command.use_reflection'

link_method_documentation 'Command.disable_weather_dimness',
'Désactive l\'obscurité lors d\'un changement climatique', {}
register_command :fx, 'Command.disable_weather_dimness'

link_method_documentation 'Command.enable_weather_dimness',
'Active l\'obscurité lors d\'un changement climatique', {}
register_command :fx, 'Command.enable_weather_dimness'

# AUTOGenerated for event_move_speed_frequency
link_method_documentation 'Command.event_move_speed_frequency',
  'Change la vitesse et la fréquence des événements référencés par leurs ID',
  {
    :ids => ["IDs des événements", :Selector],
    :v => ["Vitesse des événements", :Fixnum],
    :f => ["Fréquence des événements", :Fixnum],

  }
register_command :event, 'Command.event_move_speed_frequency'

# AUTOGenerated for player_move_speed_frequency
link_method_documentation 'Command.player_move_speed_frequency',
  'Change la vitesse et la fréquence de déplacement du joueur',
  {
    :v => ["Vitesse du joueur", :Fixnum],
    :f => ["Fréquence du joueur", :Fixnum],

  }
register_command :event, 'Command.player_move_speed_frequency'

# AUTOGenerated for sound_BGM_play
link_method_documentation 'Command.bgm_play',
  'Joue un BGM',
  {
    :name => ["Nom du BGM", :String],
    :"*volume" => ["Volume du BGM. Pourcentage entre 0 et 100. Par défaut : 100", :Fixnum],
    :"*pitch" => ["Vitesse du BGM. Pourcentage entre 1 et 453. Par défaut : 100", :Fixnum],
  }
register_command :sound, 'Command.bgm_play'

# AUTOGenerated for sound_BGS_play
link_method_documentation 'Command.bgs_play',
  'Joue un BGS',
  {
    :name => ["Nom du BGS", :String],
    :"*volume" => ["Volume du BGS. Pourcentage entre 0 et 100. Par défaut : 80", :Fixnum],
    :"*pitch" => ["Vitesse du BGS. Pourcentage entre 1 et 453. Par défaut : 100", :Fixnum],
  }
register_command :sound, 'Command.bgs_play'

# AUTOGenerated for sound_SE_play
link_method_documentation 'Command.se_play',
  'Joue un SE',
  {
    :name => ["Nom du SE", :String],
    :"*volume" => ["Volume du SE. Pourcentage entre 0 et 100. Par défaut : 80", :Fixnum],
    :"*pitch" => ["Vitesse du SE. Pourcentage entre 1 et 453. Par défaut : 100", :Fixnum],
  }
register_command :sound, 'Command.se_play'

# AUTOGenerated for sound_ME_play
link_method_documentation 'Command.me_play',
  'Joue un ME',
  {
    :name => ["Nom du ME", :String],
    :"*volume" => ["Volume du ME. Pourcentage entre 0 et 100. Par défaut : 100", :Fixnum],
    :"*pitch" => ["Vitesse du ME. Pourcentage entre 1 et 453. Par défaut : 100", :Fixnum],
  }
register_command :sound, 'Command.me_play'

# AUTOGenerated for sound_BGM_volume
link_method_documentation 'Command.bgm_volume',
  'Change le volume du BGM en cours',
  {
    :volume => ["Volume du BGM. Pourcentage entre 0 et 100", :Fixnum],

  }
register_command :sound, 'Command.bgm_volume'

# AUTOGenerated for sound_BGS_volume
link_method_documentation 'Command.bgs_volume',
  'Change le volume du BGS en cours',
  {
    :volume => ["Volume du BGS. Pourcentage entre 0 et 100", :Fixnum],

  }
register_command :sound, 'Command.bgs_volume'

# AUTOGenerated for sound_BGM_stop
link_method_documentation 'Command.bgm_stop',
  'Stoppe le BGM en cours',
  {}
register_command :sound, 'Command.bgm_stop'

# AUTOGenerated for sound_BGS_stop
link_method_documentation 'Command.bgs_stop',
  'Stoppe le BGS en cours',
  {}
register_command :sound, 'Command.bgs_stop'

# AUTOGenerated for sound_SE_stop
link_method_documentation 'Command.se_stop',
  'Stoppe le SE en cours',
  {}
register_command :sound, 'Command.se_stop'

# AUTOGenerated for sound_ME_stop
link_method_documentation 'Command.me_stop',
  'Stoppe le ME en cours',
  {}
register_command :sound, 'Command.me_stop'

# AUTOGenerated for sound_stop
link_method_documentation 'Command.sound_stop',
  'Stoppe tous les sons en cours',
  {}
register_command :sound, 'Command.sound_stop'

# AUTOGenerated for sound_BGM_fade
link_method_documentation 'Command.bgm_fade',
  'Arrêt en fondu du BGM en cours',
  {
    :wait => ["Temps du fondu, par défaut en secondes", :Fixnum],
    :"*frame" => ["Spécifiez 'true' si vous renseignez un temps en frames plutôt qu'en secondes", :Boolean],
  }
register_command :sound, 'Command.bgm_fade'

# AUTOGenerated for sound_BGS_fade
link_method_documentation 'Command.bgs_fade',
  'Arrêt en fondu du BGS en cours',
  {
    :wait => ["Temps du fondu (en secondes)", :Fixnum],
    :"*frame" => ["Spécifiez 'true' si vous renseignez un temps en frames plutôt qu'en secondes", :Boolean],
  }
register_command :sound, 'Command.bgs_fade'

link_method_documentation 'Command.me_fade',
  'Arrêt en fondu du ME en cours',
  {
    :wait => ["Temps du fondu, par défaut en secondes", :Fixnum],
    :"*frame" => ["Spécifiez 'true' si vous renseignez un temps en frames plutôt qu'en secondes", :Boolean],
  }
register_command :sound, 'Command.me_fade'

# AUTOGenerated for sound_BGM_pitch
link_method_documentation 'Command.bgm_pitch',
  'Change la vitesse du BGM en cours',
  {
    :pitch => ["Vitesse du BGM. Pourcentage entre 1 et 453", :Fixnum],
  }
register_command :sound, 'Command.bgm_pitch'

# AUTOGenerated for sound_BGS_pitch
link_method_documentation 'Command.bgs_pitch',
  'Change la vitesse du BGS en cours',
  {
    :pitch => ["Vitesse du BGS. Pourcentage entre 1 et 453", :Fixnum],
  }
register_command :sound, 'Command.bgs_pitch'

# AUTOGenerated for sound_fade
link_method_documentation 'Command.sound_fade',
  'Stoppe les BGM et BGS en fondu',
  {
    :wait => ["Temps du fondu, par défaut en secondes", :Fixnum],
    :"*frame" => ["Spécifiez 'true' si vous renseignez un temps en frames plutôt qu'en secondes", :Boolean],
  }
register_command :sound, 'Command.sound_fade'

link_method_documentation 'Command.save_bgm',
  'Mémorise le BGM en cours',
  {}
register_command :sound, 'Command.save_bgm'

link_method_documentation 'Command.replay_bgm',
  'Reprend le BGM mémorisé',
  {}
register_command :sound, 'Command.replay_bgm'

# AUTOGenerated for actor_slot
link_method_documentation 'Command.actor_slot',
  'Renvoie l\'ID d\'un acteur en fonction de sa position dans l\'équipe. Renvoie 0 si le slot est vide.',
  {
    :id => ["Position de l'acteur dans l'équipe", :Fixnum],

  }
register_command :actors, 'Command.actor_slot'


link_method_documentation 'Command.player_path_length',
	                        'Renvoie la taille du chemin nécéssaire au pathfinder pour se rendre a un point',
 	                        {
		                        :x => ["Coordonnées X", :Fixnum],
		                        :y => ["Coordonnées Y", :Fixnum],
		                       :"*wait_flag" => ["Par défaut, false, cette valeur définit le blocage durant le déplacement ou non", :Boolean],
                           :"*no_through" => ["Par défaut, false, si cette valeur vaut true, même en mode fantôme, l'évènement utilisera un chemin passable", :Boolean],

	                        } # Maybe changed
register_command :event, 'Command.player_path_length'

link_method_documentation 'Command.event_path_length',
	                        'Renvoie la taille du chemin nécéssaire au pathfinder pour se rendre a un point',
 	                        {
		                        :id => ["Id de l'évènement (0 pour le héros)", :Fixnum],
		                        :x => ["Coordonnées X", :Fixnum],
		                        :y => ["Coordonnées Y", :Fixnum],
		                       :"*wait_flag" => ["Par défaut, false, cette valeur définit le blocage durant le déplacement ou non", :Boolean],
                           :"*no_through" => ["Par défaut, false, si cette valeur vaut true, même en mode fantôme, l'évènement utilisera un chemin passable", :Boolean],

	                        } # Maybe changed
register_command :event, 'Command.event_path_length'

# AUTOGenerated for move_to
link_method_documentation 'Command.move_to',
	'Déplace l\'évènement référencé par son ID (0 pour le héros) vers les coordonnées données en argument',
 	{
		:id => ["Id de l'évènement (0 pour le héros)", :Fixnum],
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],
		:"*wait_flag" => ["Par défaut, false, cette valeur définit le blocage durant le déplacement ou non", :Boolean],
    :"*no_throug" => ["Par défaut, false, si cette valeur vaut true, même en mode fantôme, l'évènement utilisera un chemin passable", :Boolean],

	} # Maybe changed
register_command :event, 'Command.move_to'

# AUTOGenerated for jump_to
link_method_documentation 'Command.jump_to',
'Déplace l\'évènement, en sautant, référencé par son ID (0 pour le héros) vers les coordonnées données en argument',
 {
  :id => ["Id de l'évènement (0 pour le héros)", :Fixnum],
  :x => ["Coordonnées X", :Fixnum],
  :y => ["Coordonnées Y", :Fixnum],
  :"*wait_flag" => ["Par défaut, false, cette valeur définit le blocage durant le déplacement ou non", :Boolean],

} # Maybe changed
register_command :event, 'Command.jump_to'

# # AUTOGenerated for monster_element_rate
# link_method_documentation 'Command.monster_element_rate',
# 	'Renvoie la résistance élémentaire (par son ID d\'élément) d\'un monstre référencé par son ID',
#  	{
# 		:id => ["Id du monstre", :Fixnum],
# 		:element_id => ["Id de l'élément", :Fixnum],
#
# 	}, true # Maybe changed
# register_command :enemy, 'Command.monster_element_rate'

# AUTOGenerated for actor_element_rate
link_method_documentation 'Command.actor_element_rate',
  'Renvoie la résistance élémentaire (par son ID d\'élément) d\'un acteur référencé par son ID',
 	{
		:id => ["Id de l'acteur", :Fixnum],
    :element_id => ["Id de l'élément", :Fixnum],

	}, true # Maybe changed
register_command :actors, 'Command.actor_element_rate'

# # AUTOGenerated for armor_element_rate
# link_method_documentation 'Command.armor_element_rate',
#   'Renvoie la résistance élémentaire (par son ID d\'élément) d\'une armure référencée par son ID par rapport à un acteur',
#  	{
# 		:i => ["Id de l'armure", :Fixnum],
# 		:actor_id => ["Id de l'acteur", :Fixnum],
# 		:element_id => ["Id de l'élément", :Fixnum],
#
# 	}, true # Maybe changed
# register_command :armors, 'Command.armor_element_rate'
#
# # AUTOGenerated for weapon_element_rate
# link_method_documentation 'Command.weapon_element_rate',
# 'Renvoie la résistance élémentaire (par son ID d\'élement) d\'une arme référencée par son ID par rapport à un acteur',
#  	{
#      :i => ["Id de l'arme", :Fixnum],
#  		:actor_id => ["Id de l'acteur", :Fixnum],
#  		:element_id => ["Id de l'élément", :Fixnum],
#
# 	}, true # Maybe changed
# register_command :weapons, 'Command.weapon_element_rate'
#
# # AUTOGenerated for item_element_rate
# link_method_documentation 'Command.item_element_rate',
# 'Renvoie la résistance élémentaire (par son ID d\'élement) d\'un objet référencé par son ID par rapport à un acteur',
#  	{
#      :i => ["Id de l'objet", :Fixnum],
#  		:actor_id => ["Id de l'acteur", :Fixnum],
#  		:element_id => ["Id de l'élément", :Fixnum],
#
# 	}, true # Maybe changed
# register_command :items, 'Command.item_element_rate'

# AUTOGenerated for event_priority
link_method_documentation 'Command.event_priority',
  'Change la priorité d\'affichage des événements référencés par leurs ID (0: sous le héros, 1: même niveau que le héros, 2: au dessus du héros)',
  {
    :ids => ["ID des événements", :Selector],
    :priority => ["Priorité d'affichage, si aucune priorité n'est donnée, la commande renverra la valeur de la priorité de l'évènement référencé par son ID", :Fixnum],

  }
register_command :event, 'Command.event_priority'

# AUTOGenerated for event_trigger
link_method_documentation 'Command.event_trigger',
  'Change le type de déclenchement des événements référencés par leurs ID (0: touche action, 1: contact du héros, 2: contact de l\'event, 3: automatique, 4: processus paralléle).',
  {
    :ids => ["ID des événements", :Selector],
    :trigger => ["Type de déclenchement, si aucune priorité n'est donnée, la commande renverra la valeur du déclencheur de l'évènement référencé par son ID", :Fixnum],

  }
register_command :event, 'Command.event_trigger'

# AUTOGenerated for camera_scroll
link_method_documentation 'Command.camera_scroll',
	'Fait défiler la caméra dans une direction sur une distance (en cases) à une certaine vitesse',
 	{
		:direction => ["Direction (2=bas, 4=gauche, 6=droite, 8=haut)",  :Fixnum],
		:distance => ["Nombre de cases à défiler",  :Fixnum],
		:speed => ["Vitesse du défilement",  :Fixnum],

	}
register_command :camera,'Command.camera_scroll'

#AUTOGenerated for camera_scroll_towards
link_method_documentation 'Command.camera_scroll_towards',
	'Fait défiler la caméra vers le point de coordonnées (x, y). (Par défaut, ce point sera celui situé dans le coin haut-gauche de l\'écran une fois le défilement terminé)',
	{
		:x => ["L'abscisse du point cible", :Fixnum],
		:y => ["L'ordonnée du point cible", :Fixnum],
		:nb_steps => ["Le nombre d'étapes lors du défilement (plus il y en a, plus le temps de défilement sera long)", :Fixnum],
		:"*easing_function" => [RME::Doc.vocab[:ease_desc], :Symbol],
		:"*position" => ["Position finale du point cible, par rapport à la caméra (valeurs possibles: {:centered, :centered_left, :centered_right, :centered_top, :centered_bottom, :top_left, :top_right, :bottom_left, :bottom_right}).:top_left par défaut", :Symbol]

	}
register_command :camera,'Command.camera_scroll_towards'

#AUTOGenerated for camera_scroll_towards_event
link_method_documentation 'Command.camera_scroll_towards_event',
	'Fait défiler la caméra vers l\'événement spécifié. (Par défaut, l\'événement sera situé dans le coin haut-gauche de l\'écran une fois le défilement terminé)',
	{
		:id => ["ID de l'évènement (0 pour héros)", :Fixnum],
		:nb_steps => ["Le nombre d'étapes lors du défilement (plus il y en a, plus le temps de défilement sera long)", :Fixnum],
		:"*easing_function" => [RME::Doc.vocab[:ease_desc], :Symbol],
		:"*position" => ["Position finale du point cible, par rapport à la caméra (valeurs possibles: {:centered, :centered_left, :centered_right, :centered_top, :centered_bottom, :top_left, :top_right, :bottom_left, :bottom_right}).:top_left par défaut", :Symbol]

	}
register_command :camera,'Command.camera_scroll_towards_event'

#AUTOGenerated for camera_scroll_towards_player
link_method_documentation 'Command.camera_scroll_towards_player',
	'Fait défiler la caméra vers le joueur. (Par défaut, le joueur sera situé dans le coin haut-gauche de l\'écran une fois le défilement terminé)',
	{
		:nb_steps => ["Le nombre d'étapes lors du défilement (plus il y en a, plus le temps de défilement sera long)", :Fixnum],
		:"*easing_function" => [RME::Doc.vocab[:ease_desc], :Symbol],
		:"*position" => ["Position finale joueur, par rapport à la caméra (valeurs possibles: {:centered, :centered_left, :centered_right, :centered_top, :centered_bottom, :top_left, :top_right, :bottom_left, :bottom_right}).:top_left par défaut", :Symbol]

	}
register_command :camera,'Command.camera_scroll_towards_player'

# AUTOGenerated for camera_move_on
link_method_documentation 'Command.camera_move_on',
	'Place la caméra sur un point de la carte',
 	{
		:x => ["Coordonnées X",  :Fixnum],
		:y => ["Coordonnées Y",  :Fixnum],

	}
register_command :camera,'Command.camera_move_on'

# AUTOGenerated for camera_scroll_on
link_method_documentation 'Command.camera_scroll_on',
	'Fait défiler la carte vers un point donné',
 	{
		:x => ["Coordonnées X",  :Fixnum],
		:y => ["Coordonnées Y",  :Fixnum],
		:speed => ["Vitesse de défilement",  :Fixnum],

	}
register_command :camera,'Command.camera_scroll_on'

# AUTOGenerated for camera_lock
link_method_documentation 'Command.camera_lock',
	'Verrouille la position de la caméra',
 	{}
register_command :camera,'Command.camera_lock'

# AUTOGenerated for camera_unlock
link_method_documentation 'Command.camera_unlock',
	'Déverrouille la position de la caméra (et reprend le héros comme plan de référence)',
 	{}
register_command :camera,'Command.camera_unlock'

link_method_documentation 'Command.camera_locked?',
	'Renovie true si la camera est verrouillée',
 	{}
register_command :camera,'Command.camera_locked?'

link_method_documentation 'Command.camera_lock_x',
	'Verrouille la position de la caméra sur l\'axe X',
 	{}
register_command :camera,'Command.camera_lock_x'

link_method_documentation 'Command.camera_unlock_x',
	'Déverrouille la position de la caméra sur l\'axe X',
 	{}
register_command :camera,'Command.camera_unlock_x'

link_method_documentation 'Command.camera_x_locked?',
	'Renovie true si la camera est verrouillée en X',
 	{}
register_command :camera,'Command.camera_x_locked?'

link_method_documentation 'Command.camera_lock_y',
	'Verrouille la position de la caméra sur l\'axe Y',
 	{}
register_command :camera,'Command.camera_lock_y'

link_method_documentation 'Command.camera_unlock_y',
	'Déverrouille la position de la caméra sur l\'axe Y',
 	{}
register_command :camera,'Command.camera_unlock_y'

link_method_documentation 'Command.camera_y_locked?',
	'Renovie true si la camera est verrouillée en Y',
 	{}
register_command :camera,'Command.camera_y_locked?'

# AUTOGenerated for camera_change_focus
link_method_documentation 'Command.camera_change_focus',
	'Change la cible du scrolling (par défaut, le scrolling suit le héros) pour un autre évènement',
 	{
		:event_id => ["ID de l'évènement à suivre par la caméra",  :Fixnum],

	}
register_command :camera,'Command.camera_change_focus'

# AUTOGenerated for fadein
link_method_documentation 'Command.fadein',
	'Affiche l\'écran en fondu',
 	{
		:"*time" => ["Durée de la transition", :Fixnum],

	}
register_command :standard, 'Command.fadein'

# AUTOGenerated for screen_fadeout
link_method_documentation 'Command.screen_fadeout',
	'Efface l\'écran en fondu (de manière moins radicale que la commande fadeout)',
 	{
		:duration => ["Durée en frame", :Fixnum],

	}
register_command :screen, 'Command.screen_fadeout'

# AUTOGenerated for screen_fadein
link_method_documentation 'Command.screen_fadein',
'Affiche l\'écran en fondu (de manière moins radicale que la commande fadein)',
 	{
		:duration => ["Durée en frame", :Fixnum],

	}
register_command :screen, 'Command.screen_fadein'

# AUTOGenerated for screen_tone
link_method_documentation 'Command.screen_tone',
	'Change la teinte de l\'écran',
 	{
		:tone => ["Teinte (utilisez la commande 'tone')", :Tone],
		:duration => ["Durée en frame", :Fixnum],
		:"*wait_flag" => ["Attend la fin de l'effet (true), n'attend pas (false). Par défaut cet argument vaut false", :Boolean],

	}
register_command :screen, 'Command.screen_tone'

# AUTOGenerated for screen_flash
link_method_documentation 'Command.screen_flash',
	'Envoie un flash à l\'écran',
 	{
		:color => ["Couleur du flash (utilisez la commande 'color')", :Color],
		:duration => ["Durée en frames", :Fixnum],
		:"*wait_flag" => ["Attend la fin de l'effet (true), n'attend pas (false). Par défaut cet argument vaut false", :Boolean],

	}
register_command :screen, 'Command.screen_flash'

# AUTOGenerated for screen_width
link_method_documentation 'Command.screen_width',
	'Renvoie la largeur de l\'écran (en pixels)',
 	{}, true # Maybe changed
register_command :screen, 'Command.screen_width'

# AUTOGenerated for screen_height
link_method_documentation 'Command.screen_height',
	'Renvoie la hauteur de l\'écran (en pixels)',
 	{}, true # Maybe changed
register_command :screen, 'Command.screen_height'


# AUTOGenerated for screen_shake
link_method_documentation 'Command.screen_shake',
	'Fait trembler l\'écran pendant une durée déterminée',
 	{
		:power => ["Puissance du tremblement", :Fixnum],
		:speed => ["Vitesse du tremblement", :Fixnum],
		:duration => ["Durée en frames", :Fixnum],
		:"*wait_flag" => ["Attend la fin de l'effet (true), n'attend pas (false). Par défaut cet argument vaut false", :Boolean],

	}
register_command :screen, 'Command.screen_shake'
# AUTOGenerated for screen_zoom
link_method_documentation 'Command.camera_zoom',
	'Zoom tout l\'écran en temps réel, sauf les windows (dialogues, etc.)',
 	{
		:zoom => ["Valeur de zoom, supérieur à 100", :ArgType],
    :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
    :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
    :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],

	}
register_command :camera, 'Command.camera_zoom'

# AUTOGenerated for screen_pixelation
link_method_documentation 'Command.screen_pixelation',
	'Pixélise tout l\'écran en temps réel, sauf les windows (dialogues, etc.)',
 	{
		:pixelation => ["Valeur de pixélisation (exemple: si 2, la taille des pixels est multipliée par deux)", :ArgType],
    :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
    :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
    :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],

	}
register_command :screen, 'Command.screen_pixelation'

# AUTOGenerated for screen_blur
link_method_documentation 'Command.screen_blur',
	'Applique un flou gaussien sur tout l\'écran en temps réel, sauf les windows (dialogues, etc.). Attention, cette commande peut faire baisser le FPS.',
 	{
		:radius => ["Radius du flou gaussien. (0 = pas de flou)", :ArgType],
    :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
    :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
    :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],

	}
register_command :screen, 'Command.screen_blur'

# AUTOGenerated for screen_motion_blur
link_method_documentation 'Command.camera_motion_blur',
	'Atténue le raffraichissement de l\'écran. Rend plus diffus les mouvements de caméra, et mouvements à l\'écran.',
 	{
		:attenuation => ["Valeur d'atténuation du raffraichissement de l'écran, de 0 à 200", :ArgType],
    :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
    :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
    :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],

	}
register_command :camera, 'Command.camera_motion_blur'

# AUTOGenerated for event_transparent?
link_method_documentation 'Command.event_transparent?',
	'Renvoie true si l\'évènement est transparent (false sinon)',
 	{
		:id => ["ID de l'évènement", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_transparent?'

# AUTOGenerated for player_transparent?
link_method_documentation 'Command.player_transparent?',
	'Renvoi true si le joueur est transparent (false sinon)',
 	{

	}, true # Maybe changed
register_command :event, 'Command.player_transparent?'

# AUTOGenerated for event_transparent
link_method_documentation 'Command.event_transparent',
	'Rend l\'évènement référencé par son ID transparent',
 	{
		:id => ["ID de l'évènement", :Fixnum],

	}
register_command :event, 'Command.event_transparent'

# AUTOGenerated for player_transparent
link_method_documentation 'Command.player_transparent',
	'Rend le joueur transparent',
 	{}
register_command :event, 'Command.player_transparent'

# AUTOGenerated for event_opaque
link_method_documentation 'Command.event_opaque',
	'Rend l\'évènement référencé par son ID opaque',
 	{
		:id => ["ID de l'évènement", :Fixnum],

	}
register_command :event, 'Command.event_opaque'

# AUTOGenerated for player_opaque
link_method_documentation 'Command.player_opaque',
	'Rend le joueur opaque',
 	{}
register_command :event, 'Command.player_opaque'

# AUTOGenerated for mouse_moving?
link_method_documentation 'Command.mouse_moving?',
	'Renvoie true si la souris bouge, false sinon',
 	{}, true # Maybe changed
register_command :mouse, 'Command.mouse_moving?'

# AUTOGenerated for get_tileset_id
link_method_documentation 'Command.get_tileset_id',
	'Renvoie l\' ID du tileset de la carte en cours',
 	{}, true # Maybe changed
register_command :mapinfo, 'Command.get_tileset_id'

# AUTOGenerated for dash_activate?
link_method_documentation 'Command.dash_activate?',
'Renvoie true si la course est activée pour la map en cours, false sinon',
 {}, true # Maybe changed
register_command :mapinfo, 'Command.dash_activate?'

# AUTOGenerated for dash_deactivate?
link_method_documentation 'Command.dash_deactivate?',
'Renvoie true si la course est désactivée pour la map en cours, false sinon',
 {}, true # Maybe changed
register_command :mapinfo, 'Command.dash_deactivate?'

# AUTOGenerated for dash_activation
link_method_documentation 'Command.dash_activation',
'Active ou désactive la course sur la map en cours',
 {
  :flag => ["true pour l'activer, false pour la désactiver", :Boolean],

}
register_command :mapinfo, 'Command.dash_activation'

# AUTOGenerated for dash_activate
link_method_documentation 'Command.dash_activate',
'Active la course sur la map en cours',
 {}
register_command :mapinfo, 'Command.dash_activate'

# AUTOGenerated for dash_deactivate
link_method_documentation 'Command.dash_deactivate',
'Désactive la course pour la map en cours',
 {}
register_command :mapinfo, 'Command.dash_deactivate'

# AUTOGenerated for switch_tileset
link_method_documentation 'Command.switch_tileset',
	'Change le tileset de la carte en cours',
 	{
		:tileset_id => ["ID du nouveau tileset", :Fixnum],

	}
register_command :mapinfo, 'Command.switch_tileset'

# AUTOGenerated for wall?
link_method_documentation 'Command.wall?',
	'Renvoie true si les coordonnées sont sur un mur, false sinon',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}, true # Maybe changed
register_command :mapinfo, 'Command.wall?'

# AUTOGenerated for roof?
link_method_documentation 'Command.roof?',
	'Renvoie true si les coordonnées sont sur un toit, false sinon',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}, true # Maybe changed
register_command :mapinfo, 'Command.roof?'

# AUTOGenerated for stair?
link_method_documentation 'Command.stair?',
	'Renvoie true si les coordonnées sont sur une marche, false sinon',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}, true # Maybe changed
register_command :mapinfo, 'Command.stair?'

# AUTOGenerated for table?
link_method_documentation 'Command.table?',
	'Renvoie true si les coordonnées sont sur une table, false sinon',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}, true # Maybe changed
register_command :mapinfo, 'Command.table?'

# AUTOGenerated for map_width
link_method_documentation 'Command.map_width',
	'Retourne la largeur de la carte',
 	{}, true # Maybe changed
register_command :mapinfo, 'Command.map_width'

# AUTOGenerated for map_height
link_method_documentation 'Command.map_height',
	'Retourne la hauteur de la carte',
 	{}, true # Maybe changed
register_command :mapinfo, 'Command.map_height'


# AUTOGenerated for ground?
link_method_documentation 'Command.ground?',
	'Renvoie true si les coordonnées sont sur le sol, false sinon',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}, true # Maybe changed
register_command :mapinfo, 'Command.ground?'

# AUTOGenerated for create_text_window
link_method_documentation 'Command.create_text_window',
	'Crée une fenêtre pouvant contenir du texte',
 	{
		:id => ["Numéro de la fenêtre", :Fixnum],
		:content => ["Texte (ou tableau séparé par des virgules) à afficher", :String],
		:x => ["Position X de la fenêtre", :Fixnum],
		:y => ["Position Y de la fenêtre", :Fixnum],
		:"*w" => ["Largeur de la fenêtre, utilisez 'nil' pour que la largeur de la fenêtre soit calculée", :Fixnum],
		:"*h" => ["Hauteur de la fenêtre, utilisez 'nil' pour que la hauteur de la fenêtre soit calculée", :Fixnum],

	} # Maybe changed
register_command :window, 'Command.create_text_window'

# AUTOGenerated for remove_window
link_method_documentation 'Command.remove_window',
	'Supprime la fenêtre référencée par son ID',
 	{
		:id => ["ID de la fenêtre", :Fixnum],

	}
register_command :window, 'Command.remove_window'

# AUTOGenerated for remove_all_windows
link_method_documentation 'Command.remove_all_windows',
	'Supprime toutes les fenêtres',
 	{}
register_command :window, 'Command.remove_all_windows'

# AUTOGenerated for close_window
link_method_documentation 'Command.close_window',
	'Ferme la fenêtre référencée par son ID',
 	{
		:id => ["ID de la fenêtre", :Fixnum],

	}
register_command :window, 'Command.close_window'

# AUTOGenerated for open_window
link_method_documentation 'Command.open_window',
	'Ouvre la fenêtre référencée par son ID',
 	{
		:id => ["ID de la fenêtre", :Fixnum],

	}, true # Maybe changed
register_command :window, 'Command.open_window'

# AUTOGenerated for window_closed?
link_method_documentation 'Command.window_closed?',
	'Renvoie true si la fenêtre référencée par son ID est fermée, false sinon',
 	{
		:id => ["ID de la fenêtre", :Fixnum],

	}, true # Maybe changed
register_command :window, 'Command.window_closed?'

# AUTOGenerated for window_opened?
link_method_documentation 'Command.window_opened?',
	'Renvoie true si la fenêtre référencée par son ID est ouverte, false sinon',
 	{
		:id => ["ID de la fenêtre", :Fixnum],

	}, true # Maybe changed
register_command :window, 'Command.window_opened?'

# AUTOGenerated for window_exists?
link_method_documentation 'Command.window_exists?',
	'Renvoie true si la fenêtre référencée par son ID a été créée, false sinon',
 	{
		:id => ["ID de la fenêtre", :Fixnum],

	}, true # Maybe changed
register_command :window, 'Command.window_exists?'

# AUTOGenerated for window_exists?
link_method_documentation 'Command.window_exists?',
	'Renvoie true si la fenêtre référencée par son ID a été créée, false sinon',
 	{
		:id => ["ID de la fenêtre", :Fixnum],

	}, true # Maybe changed
register_command :window, 'Command.window_exists?'

# AUTOGenerated for window_content
link_method_documentation 'Command.window_content',
	'Change le contenu de la fenêtre référencée par son ID, si aucun contenu n\'est donné, la commande renverra le contenu de la fenêtre',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
		:"*content" => ["Valeur affichée de la fenêtre", :Object],
		:"*resize" => ["Si cet argument vaut true, la taille de la fenêtre est recalculée", :Boolean],

	}, true # Maybe changed
register_command :window, 'Command.window_content'


# AUTOGenerated for window_moveto
link_method_documentation 'Command.window_moveto',
	'Change les coordonnées X et Y de la fenêtre',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
		:x => ["Coordonnée X", :Fixnum],
		:y => ["Coordonnée Y", :Fixnum],
		:"*duration" => ["Durée du déplacement", :Fixnum],
		:"*wait_flag" => ["si cet argument vaut true, on attendra la fin du déplacement", :Boolean],

	}
register_command :window, 'Command.window_moveto'

# AUTOGenerated for window_dimension
link_method_documentation 'Command.window_dimension',
	'Change la dimension de la fenêtre',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
		:width => ["Largeur de la fenêtre", :Fixnum],
		:height => ["Hauteur de la fenêtre", :Fixnum],
		:"*duration" => ["Durée du déplacement", :Fixnum],
		:"*wait_flag" => ["si cet argument vaut true, on attendra la fin du déplacement", :Boolean],

	}
register_command :window, 'Command.window_dimension'

# AUTOGenerated for window_opacity
link_method_documentation 'Command.window_opacity',
	'Change l\'opacité de la fenêtre, si aucune valeur n\'est spécifiée, la commande renvoie la valeur de l\'opacité',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
		:"*value" => ["Valeur de l'opacité à changer", :Fixnum],
		:"*duration" => ["Durée du déplacement", :Fixnum],
		:"*wait_flag" => ["si cet argument vaut true, on attendra la fin du déplacement", :Boolean],

	}, true # Maybe changed
register_command :window, 'Command.window_opacity'

# AUTOGenerated for window_moveto
link_method_documentation 'Command.window_moveto',
	'Change les coordonnées X et Y de la fenêtre',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
		:x => ["Coordonnée X", :Fixnum],
		:y => ["Coordonnée Y", :Fixnum],
		:"*duration" => ["Durée du déplacement", :Fixnum],
		:"*wait_flag" => ["si cet argument vaut true, on attendra la fin du déplacement", :Boolean],

	}
register_command :window, 'Command.window_moveto'

# AUTOGenerated for window_dimension
link_method_documentation 'Command.window_dimension',
	'Change la dimension de la fenêtre',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
		:width => ["Largeur de la fenêtre", :Fixnum],
		:height => ["Hauteur de la fenêtre", :Fixnum],
		:"*duration" => ["Durée du déplacement", :Fixnum],
		:"*wait_flag" => ["si cet argument vaut true, on attendra la fin du déplacement", :Boolean],

	}
register_command :window, 'Command.window_dimension'

# AUTOGenerated for window_opacity
link_method_documentation 'Command.window_opacity',
	'Change l\'opacité de la fenêtre, si aucune valeur n\'est spécifiée, la commande renvoie la valeur de l\'opacité',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
		:"*value" => ["Valeur de l'opacité à changer, entre 0 et 255.", :Fixnum],
		:"*duration" => ["Durée du déplacement", :Fixnum],
		:"*wait_flag" => ["si cet argument vaut true, on attendra la fin du déplacement", :Boolean],

	}, true # Maybe changed
register_command :window, 'Command.window_opacity'


# AUTOGenerated for window_move
link_method_documentation 'Command.window_move',
	'Déplacement sur tous les paramètres',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],
		:w => ["Largeur", :Fixnum],
		:h => ["Hauteur", :Fixnum],
		:opacity => ["Opacité", :Fixnum],
		:"*duration" => ["Durée du déplacement", :Fixnum],
		:"*wait_flag" => ["si cet argument vaut true, on attendra la fin du déplacement", :Boolean],

	}
register_command :window, 'Command.window_move'

# AUTOGenerated for create_commands_window
link_method_documentation 'Command.create_commands_window',
	'Crée une fenêtre de sélection verticale',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
		:x => ["Coordonnées X de la fenêtre", :Fixnum],
		:y => ["Coordonnées Y de la fenêtre", :Fixnum],
		:w => ["Largeur de la fenêtre", :Fixnum],
		:hash => ["Hash décrivant les différentes sections de la fenêtre", :Hash],
		:"*h" => ["Hauteur de la fenêtre (en nombre de ligne), si aucun argument n'est donné, la hauteur sera calculée", :Fixnum],

	}
register_command :window, 'Command.create_commands_window'

# AUTOGenerated for create_horizontal_commands_window
link_method_documentation 'Command.create_horizontal_commands_window',
	'Crée une fenêtre de sélection horizontale',
 	{
     :id => ["ID de la fenêtre", :Fixnum],
 		:x => ["Coordonnées X de la fenêtre", :Fixnum],
 		:y => ["Coordonnées Y de la fenêtre", :Fixnum],
    :hash => ["Hash décrivant les différentes sections de la fenêtre", :Hash],
    :"row" => ["Nombre de colonnes. Si aucun argument n'est spécifié, la fenêtre prendra le nombre correct de colonnes", :Fixnum],
	}
register_command :window, 'Command.create_horizontal_commands_window'

# AUTOGenerated for window_current_symbol
link_method_documentation 'Command.window_current_symbol',
	'Renvoie, pour une fenêtre de sélection, le symbole sélectionné',
 	{
		:id => ["ID de la fenêtre", :Fixnum],

	}, true # Maybe changed
register_command :window, 'Command.window_current_symbol'

# AUTOGenerated for window_activate
link_method_documentation 'Command.window_activate',
	'Rend la fenêtre référencée par son ID active',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
	}
register_command :window, 'Command.window_activate'

# AUTOGenerated for window_deactivate
link_method_documentation 'Command.window_deactivate',
'Rend la fenêtre référencée par son ID inactive',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
	}
register_command :window, 'Command.window_deactivate'

# AUTOGenerated for create_selectable_window
link_method_documentation 'Command.create_selectable_window',
	'Crée une fenêtre de sélection complexe',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
		:x => ["Coordonnée X", :Fixnum],
		:y => ["Coordonnée Y", :Fixnum],
		:width => ["Largeur de la fenêtre", :Fixnum],
		:height => ["Hauteur de la fenêtre", :Fixnum],
		:hash => ["Description des callbacks de la fenêtre (CF Wiki)", :Hash],

	}
register_command :window, 'Command.create_selectable_window'

# AUTOGenerated for window_width
link_method_documentation 'Command.window_width',
	'Renvoie la largeur de la fenêtre référencée par son ID',
 	{
		:id => ["ID de la fenêtre", :Fixnum],

	}, true # Maybe changed
register_command :window, 'Command.window_width'

# AUTOGenerated for window_height
link_method_documentation 'Command.window_height',
	'Renvoie la hauteur de la fenêtre référencée par son ID',
 	{
		:id => ["ID de la fenêtre", :Fixnum],

	}, true # Maybe changed
register_command :window, 'Command.window_height'

# AUTOGenerated for window_x
link_method_documentation 'Command.window_x',
	'Change la coordonnée X de la fenêtre référencée par son ID, si aucun X n\'est donné, la commande renverra la valeur actuelle de x',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
    :"*x" => ["Coordonnée X de la fenêtre", :Fixnum],
	}, true # Maybe changed
register_command :window, 'Command.window_x'

# AUTOGenerated for window_y
link_method_documentation 'Command.window_y',
	'Change la coordonnée Y de la fenêtre référencée par son ID, si aucun Y n\'est donné, la commande renverra la valeur actuelle de y',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
    :"*y" => ["Coordonnée Y de la fenêtre", :Fixnum],
	}, true # Maybe changed
register_command :window, 'Command.window_y'

link_method_documentation 'Command.mouse_hover_window?',
	'Renvoie true si la souris survole la fenêtre, false sinon.',
 	{:id => ["ID de la fenêtre", :Fixnum]}, true
register_command :window, 'Command.mouse_hover_window?'

link_method_documentation 'Command.between',
	'Donne la distance entre deux points',
 	{
		:x1 => ["Valeur X du premier point", :Fixnum],
		:y1 => ["Valeur Y du premier point", :Fixnum],
		:x2 => ["Valeur X du second point", :Fixnum],
		:y2 => ["Valeur Y du second point", :Fixnum],

	}, true
register_command :math, 'Command.between'

# AUTOGenerated for damage_floor?
link_method_documentation 'Command.damage_floor?',
  'Renvoie true si la case référencée par X, Y est blessante, false sinon',
  {
    :x => ["Coordonnées X de la case", :Fixnum],
    :y => ["Coordonnées Y de la case", :Fixnum],

  }, true
register_command :mapinfo, 'Command.damage_floor?'

# AUTOGenerated for text_clear
link_method_documentation 'Command.texts_clear',
  'Supprime tous les textes',
  {}, true
register_command :text, 'Command.texts_clear'


# AUTOGenerated for event_move_down
link_method_documentation 'Command.event_move_down',
	'Fait bouger l\'événement référencé par son ID d\'une case vers le bas. Renvoie true si le déplacement s\'est effectué, false sinon.',
 	{
    :id => ["Id de l'événement", :Fixnum],
    :"*turn_ok" => ["En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)", :Boolean],
	}
register_command :event, 'Command.event_move_down'

# AUTOGenerated for event_move_left
link_method_documentation 'Command.event_move_left',
	'Fait bouger l\'événement référencé par son ID d\'une case vers la gauche. Renvoie true si le déplacement s\'est effectué, false sinon.',
 	{
		:id => ["Id de l'événement", :Fixnum],
    :"*turn_ok" => ["En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)", :Boolean],
	}
register_command :event, 'Command.event_move_left'

# AUTOGenerated for event_move_right
link_method_documentation 'Command.event_move_right',
	'Fait bouger l\'événement référencé par son ID d\'une case vers la droite. Renvoie true si le déplacement s\'est effectué, false sinon.',
 	{
		:id => ["Id de l'événement", :Fixnum],
    :"*turn_ok" => ["En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)", :Boolean],
	}
register_command :event, 'Command.event_move_right'

# AUTOGenerated for event_move_up
link_method_documentation 'Command.event_move_up',
  'Fait bouger l\'événement référencé par son ID d\'une case vers le haut. Renvoie true si le déplacement s\'est effectué, false sinon.',
 	{
		:id => ["Id de l'événement", :Fixnum],
    :"*turn_ok" => ["En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)", :Boolean],
	}
register_command :event, 'Command.event_move_up'

# AUTOGenerated for player_move_down
link_method_documentation 'Command.player_move_down',
	'Fait bouger le joueur d\'une case vers le bas',
 	{:"*turn_ok" => ["En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)", :Boolean]}
register_command :event, 'Command.player_move_down'

# AUTOGenerated for player_move_left
link_method_documentation 'Command.player_move_left',
	'Fait bouger le joueur d\'une case vers la gauche. Renvoie true si le déplacement s\'est effectué, false sinon.',
 	{:"*turn_ok" => ["En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)", :Boolean]}
register_command :event, 'Command.player_move_left'

# AUTOGenerated for player_move_right
link_method_documentation 'Command.player_move_right',
	'Fait bouger le joueur d\'une case vers la droite. Renvoie true si le déplacement s\'est effectué, false sinon.',
 	{:"*turn_ok" => ["En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)", :Boolean]}
register_command :event, 'Command.player_move_right'

# AUTOGenerated for player_move_up
link_method_documentation 'Command.player_move_up',
	'Fait bouger le joueur d\'une case vers le haut. Renvoie true si le déplacement s\'est effectué, false sinon.',
 	{:"*turn_ok" => ["En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)", :Boolean]}
register_command :event, 'Command.player_move_up'

# AUTOGenerated for event_move_straight
link_method_documentation 'Command.event_move_straight',
	'Déplace un événement référencé par son ID d\'une case dans une direction. La commande renvoie true ou false si le déplacement a réussi ou non.',
 	{
		:id => ["Id de l'événement", :Fixnum],
		:value => ["Valeur, 2 pour bas, 4 pour gauche, 6 pour droite et 8 pour bas", :Fixnum],
		:"*turn_ok" => ["En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)", :Boolean],

	}, true # Maybe changed
register_command :event, 'Command.event_move_straight'

# AUTOGenerated for player_move_straight
link_method_documentation 'Command.player_move_straight',
	'Déplace un événement référencé par son ID d\'une case dans une direction. La commande renvoie true ou false si le déplacement a réussi ou non.',
 	{
		:value => ["Valeur, 2 pour bas, 4 pour gauche, 6 pour droite et 8 pour bas", :Fixnum],
		:"*turn_ok" => ["En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)", :Boolean],

	}, true # Maybe changed
register_command :event, 'Command.player_move_straight'

# AUTOGenerated for event_move_random
link_method_documentation 'Command.event_move_random',
	'Déplace un événement d\' une case aléatoire.',
 	{
		:id => ["Id de l'événement", :Fixnum],
	}
register_command :event, 'Command.event_move_random'

# AUTOGenerated for player_move_random
link_method_documentation 'Command.player_move_random',
	'Déplacele héro d\' une case aléatoire.',
 	{}
register_command :event, 'Command.player_move_random'

# AUTOGenerated for event_move_diagonal
link_method_documentation 'Command.event_move_diagonal',
	"Déplace un événement référencé par son ID d'une case en diagonale. Renvoie true si le mouvement à réussi, false sinon.",
 	{
		:id => ["Id de l'événement", :Fixnum],
		:horizontal => ["Direction horizontale (4 pour gauche, 6 pour droite)", :Fixnum],
		:vertical => ["Direction verticale (2 pour bas, 8 pour haut)", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_diagonal'

# AUTOGenerated for player_move_diagonal
link_method_documentation 'Command.player_move_diagonal',
	"Déplace le héro d'une case en diagonale. Renvoie true si le mouvement à réussi, false sinon.",
 	{
		:horizontal => ["Direction horizontale (4 pour gauche, 6 pour droite)", :Fixnum],
		:vertical => ["Direction verticale (2 pour bas, 8 pour haut)", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.player_move_diagonal'

# AUTOGenerated for event_move_lower_left
link_method_documentation 'Command.event_move_lower_left',
	"Déplacement l'événement référencé par son ID d'une case en diagonale bas-gauche. Renvoie true si le déplacement à réussi, false sinon.",
 	{
		:id => ["ID de l'événement", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_lower_left'

# AUTOGenerated for event_move_lower_right
link_method_documentation 'Command.event_move_lower_right',
	"Déplacement l'événement référencé par son ID d'une case en diagonale bas-droite. Renvoie true si le déplacement à réussi, false sinon.",
 	{
		:id => ["ID de l'événement", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_lower_right'

# AUTOGenerated for event_move_upper_left
link_method_documentation 'Command.event_move_upper_left',
	"Déplacement l'événement référencé par son ID d'une case en diagonale haut-gauche. Renvoie true si le déplacement à réussi, false sinon.",
 	{
		:id => ["ID de l'événement", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_upper_left'

# AUTOGenerated for event_move_upper_right
link_method_documentation 'Command.event_move_upper_right',
	"Déplacement l'événement référencé par son ID d'une case en diagonale haut-droite. Renvoie true si le déplacement à réussi, false sinon.",
 	{
		:id => ["ID de l'événement", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_upper_right'

# AUTOGenerated for player_move_lower_left
link_method_documentation 'Command.player_move_lower_left',
	"Déplacement  le héro d'une case en diagonale bas-gauche. Renvoie true si le déplacement à réussi, false sinon.",
 	{}, true # Maybe changed
register_command :event, 'Command.player_move_lower_left'

# AUTOGenerated for player_move_lower_right
link_method_documentation 'Command.player_move_lower_right',
	"Déplacement  le héro d'une case en diagonale bas-droite. Renvoie true si le déplacement à réussi, false sinon.",
 	{}, true # Maybe changed
register_command :event, 'Command.player_move_lower_right'

# AUTOGenerated for player_move_upper_left
link_method_documentation 'Command.player_move_upper_left',
	"Déplacement  le héro d'une case en diagonale haut-gauche. Renvoie true si le déplacement à réussi, false sinon.",
 	{}, true # Maybe changed
register_command :event, 'Command.player_move_upper_left'

# AUTOGenerated for player_move_upper_right
link_method_documentation 'Command.player_move_upper_right',
	"Déplacement  le héro d'une case en diagonale haut-droite. Renvoie true si le déplacement à réussi, false sinon.",
 	{}, true # Maybe changed
register_command :event, 'Command.player_move_upper_right'

# AUTOGenerated for event_move_toward_position
link_method_documentation 'Command.event_move_toward_position',
	'Déplace un événement référencé par son ID d\'une case en direction d\'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["ID de l'événement", :Fixnum],
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_toward_position'

# AUTOGenerated for player_move_toward_position
link_method_documentation 'Command.player_move_toward_position',
	'Déplace le héro d\'une case en direction d\'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.player_move_toward_position'

# AUTOGenerated for event_move_toward_event
link_method_documentation 'Command.event_move_toward_event',
	'Déplace un événement référencé par son ID d\'une case en direction d\'un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement devant effectuer le déplacement", :Fixnum],
		:target => ["Id de l'événement cible", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_toward_event'

# AUTOGenerated for event_move_toward_player
link_method_documentation 'Command.event_move_toward_player',
	'Déplace un événement référencé par son ID d\'une case en direction du héro. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement devant effectuer le déplacement", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_toward_player'

# AUTOGenerated for player_move_toward_event
link_method_documentation 'Command.player_move_toward_event',
	'Déplace le héro d\'une case en direction d\'un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement cible", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.player_move_toward_event'


# AUTOGenerated for event_move_away_from_position
link_method_documentation 'Command.event_move_away_from_position',
	'Déplace un événement référencé par son ID d\'une case dans la direction opposée à une coordonnée. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["ID de l'événement", :Fixnum],
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_away_from_position'

# AUTOGenerated for player_move_away_from_position
link_method_documentation 'Command.player_move_away_from_position',
	'Déplace le héro d\'une case dans la direction opposée d\'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.player_move_away_from_position'

# AUTOGenerated for event_move_away_from_event
link_method_documentation 'Command.event_move_away_from_event',
	'Déplace un événement référencé par son ID d\'une case dans la direction opposée à un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement devant effectuer le déplacement", :Fixnum],
		:target => ["Id de l'événement cible", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_away_from_event'

# AUTOGenerated for event_move_away_from_player
link_method_documentation 'Command.event_move_away_from_player',
	'Déplace un événement référencé par son ID d\'une case en direction opposée au héro. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement devant effectuer le déplacement", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_away_from_player'

# AUTOGenerated for player_move_away_from_event
link_method_documentation 'Command.player_move_away_from_event',
	'Déplace le héro d\'une case dans la direction opposée à un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement cible", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.player_move_away_from_event'

# AUTOGenerated for event_move_forward
link_method_documentation 'Command.event_move_forward',
	"Déplace l'événement référencé par son ID d'une case en avant. Renvoie true si le mouvement a réussi, false sinon.",
 	{
		:id => ["Id de l'événement devant effectuer le déplacement", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_forward'

# AUTOGenerated for player_move_forward
link_method_documentation 'Command.player_move_forward',
	"Déplace le héro d'une case en avant. Renvoie true si le mouvement a réussi, false sinon.",
 	{}, true # Maybe changed
register_command :event, 'Command.player_move_forward'

# AUTOGenerated for event_move_backward
link_method_documentation 'Command.event_move_backward',
	"Déplace l'événement référencé par son ID d'une case en arrière. Renvoie true si le mouvement a réussi, false sinon.",
 	{
		:id => ["Id de l'événement devant effectuer le déplacement", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_backward'

# AUTOGenerated for player_move_backward
link_method_documentation 'Command.player_move_backward',
	"Déplace le héro d'une case en arrière. Renvoie true si le mouvement a réussi, false sinon.",
 	{}, true # Maybe changed
register_command :event, 'Command.player_move_backward'

# AUTOGenerated for event_turn_down
link_method_documentation 'Command.event_turn_down',
	"Fait tourner un événement vers le bas",
 	{
		:id => ["ID de l'événement", :Fixnum],

	}
register_command :event, 'Command.event_turn_down'

# AUTOGenerated for player_turn_down
link_method_documentation 'Command.player_turn_down',
	"Fait tourner le héro vers le bas",
 	{}
register_command :event, 'Command.player_turn_down'

# AUTOGenerated for event_turn_left
link_method_documentation 'Command.event_turn_left',
	"Fait tourner un événement à gauche",
 	{
		:id => ["ID de l'événement", :Fixnum],

	}
register_command :event, 'Command.event_turn_left'

# AUTOGenerated for player_turn_left
link_method_documentation 'Command.player_turn_left',
	"Fait tourner le héro à gauche",
 	{}
register_command :event, 'Command.player_turn_left'

# AUTOGenerated for event_turn_right
link_method_documentation 'Command.event_turn_right',
	"Fait tourner un événement à droite",
 	{
		:id => ["ID de l'événement", :Fixnum],

	}
register_command :event, 'Command.event_turn_right'

# AUTOGenerated for player_turn_right
link_method_documentation 'Command.player_turn_right',
	"Fait tourner le héro à droite",
 	{}
register_command :event, 'Command.player_turn_right'

# AUTOGenerated for event_turn_up
link_method_documentation 'Command.event_turn_up',
	"Fait tourner un événement vers le bas",
 	{
		:id => ["ID de l'événement", :Fixnum],

	}
register_command :event, 'Command.event_turn_up'

# AUTOGenerated for player_turn_up
link_method_documentation 'Command.player_turn_up',
	"Fait tourner le héro vers le bas",
 	{}
register_command :event, 'Command.player_turn_up'


# AUTOGenerated for event_turn_90_left
link_method_documentation 'Command.event_turn_90_left',
	'Fait tourner un événement référencé par son ID de 90° par la gauche',
 	{
		:id => ["ID de l'événement", :Fixnum],

	}
register_command :event, 'Command.event_turn_90_left'

# AUTOGenerated for player_turn_90_left
link_method_documentation 'Command.player_turn_90_left',
	'Fait tourner le joueur de 90° par la gauche',
 	{}
register_command :event, 'Command.player_turn_90_left'

# AUTOGenerated for event_turn_90_right
link_method_documentation 'Command.event_turn_90_right',
	'Fait tourner un événement référencé par son ID de 90° par la droite',
 	{
		:id => ["ID de l'événement", :Fixnum],

	}
register_command :event, 'Command.event_turn_90_right'

# AUTOGenerated for player_turn_90_right
link_method_documentation 'Command.player_turn_90_right',
	'Fait tourner le joueur de 90° par la droite',
 	{}
register_command :event, 'Command.player_turn_90_right'

# AUTOGenerated for event_turn_180
link_method_documentation 'Command.event_turn_180',
	'Fait tourner un événement référencé par son ID de 180°',
 	{
		:id => ["ID de l'événement", :Fixnum],

	}
register_command :event, 'Command.event_turn_180'

# AUTOGenerated for player_turn_180
link_method_documentation 'Command.player_turn_180',
	'Fait tourner le héro de 180°',
 	{}
register_command :event, 'Command.player_turn_180'

# AUTOGenerated for event_turn_90_right_or_left
link_method_documentation 'Command.event_turn_90_right_or_left',
	'Fait tourner un événement référencé par son ID de 90° par la gauche ou par la droite (aléatoirement)',
 	{
		:id => ["ID de l'événement", :Fixnum],

	}
register_command :event, 'Command.event_turn_90_right_or_left'

# AUTOGenerated for player_turn_90_right_or_left
link_method_documentation 'Command.player_turn_90_right_or_left',
	'Fait tourner le héro de 90° par la gauche ou par la droite (aléatoirement)',
 	{}
register_command :event, 'Command.player_turn_90_right_or_left'

# AUTOGenerated for event_turn_random
link_method_documentation 'Command.event_turn_random',
	'Fait tourner un événement référencé par son ID dans une direction aléatoire',
 	{
		:id => ["ID de l'événement", :Fixnum],

	}
register_command :event, 'Command.event_turn_random'

# AUTOGenerated for player_turn_random
link_method_documentation 'Command.player_turn_random',
	'Fait tourner le héro dans une direction aléatoire',
 	{}
register_command :event, 'Command.player_turn_random'


# AUTOGenerated for event_turn_toward_position
link_method_documentation 'Command.event_turn_toward_position',
	'Tourne un événement référencé par son ID d\'une case en direction d\'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["ID de l'événement", :Fixnum],
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}
register_command :event, 'Command.event_turn_toward_position'

# AUTOGenerated for player_turn_toward_position
link_method_documentation 'Command.player_turn_toward_position',
	'Tourne le héro d\'une case en direction d\'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}
register_command :event, 'Command.player_turn_toward_position'

# AUTOGenerated for event_turn_toward_event
link_method_documentation 'Command.event_turn_toward_event',
	'Tourne un événement référencé par son ID d\'une case en direction d\'un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement devant effectuer le déplacement", :Fixnum],
		:target => ["Id de l'événement cible", :Fixnum],

	}
register_command :event, 'Command.event_turn_toward_event'

# AUTOGenerated for event_turn_toward_player
link_method_documentation 'Command.event_turn_toward_player',
	'Tourne un événement référencé par son ID d\'une case en direction du héro. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement devant effectuer le déplacement", :Fixnum],

	}
register_command :event, 'Command.event_turn_toward_player'

# AUTOGenerated for player_turn_toward_event
link_method_documentation 'Command.player_turn_toward_event',
	'Tourne le héro d\'une case en direction d\'un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement cible", :Fixnum],

	}
register_command :event, 'Command.player_turn_toward_event'


# AUTOGenerated for event_turn_away_from_position
link_method_documentation 'Command.event_turn_away_from_position',
	'Tourne un événement référencé par son ID d\'une case dans la direction opposée à une coordonnée. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["ID de l'événement", :Fixnum],
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}
register_command :event, 'Command.event_turn_away_from_position'

# AUTOGenerated for player_turn_away_from_position
link_method_documentation 'Command.player_turn_away_from_position',
	'Tourne le héro d\'une case dans la direction opposée d\'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}
register_command :event, 'Command.player_turn_away_from_position'

# AUTOGenerated for event_turn_away_from_event
link_method_documentation 'Command.event_turn_away_from_event',
	'Tourne un événement référencé par son ID d\'une case dans la direction opposée à un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement devant effectuer le déplacement", :Fixnum],
		:target => ["Id de l'événement cible", :Fixnum],

	}
register_command :event, 'Command.event_turn_away_from_event'

# AUTOGenerated for event_turn_away_from_player
link_method_documentation 'Command.event_turn_away_from_player',
	'Tourne un événement référencé par son ID d\'une case en direction opposée au héro. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement devant effectuer le déplacement", :Fixnum],

	}
register_command :event, 'Command.event_turn_away_from_player'

# AUTOGenerated for player_turn_away_from_event
link_method_documentation 'Command.player_turn_away_from_event',
	'Tourne le héro d\'une case dans la direction opposée à un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement cible", :Fixnum],

	}
register_command :event, 'Command.player_turn_away_from_event'

# AUTOGenerated for text_progressive
link_method_documentation 'Command.text_progressive',
	'Affiche progressivement un texte (caractère par caractère)',
 	{
		:id => ["Id du champ de texte", :Fixnum],
		:value => ["Texte a afficher", :String],
		:delay => ["Durée (délai) entre chaque apparition de caractères", :Fixnum],
		:"*block" => ["Vous pouvez passer du code entre accolades qui va s'exécuter à chaque caractère (facultatif)", :Block]

	}
register_command :text, 'Command.text_progressive'

# AUTOGenerated for get_random_square
link_method_documentation 'Command.get_random_square',
	'Renvoie un point aléatoire sur la carte, dont la région est référencée par son ID',
 	{
		:"*region_id" => ["L'id de la région dans laquelle chercher une case aléatoire. Par défaut, elle vaut 0", :Fixnum],

	}, true # Maybe changed
register_command :mapinfo, 'Command.get_random_square'

# AUTOGenerated for get_squares_by_region
link_method_documentation 'Command.get_squares_by_region',
	'Renvoie un tableau de cases pour une région donnée.',
 	{
		:region_id => ["l'ID de la région (entre 0 et 63)", :Fixnum],

	}, true # Maybe changed
register_command :mapinfo, 'Command.get_squares_by_region'

# AUTOGenerated for get_squares_by_tile
link_method_documentation 'Command.get_squares_by_tile',
	'Renvoie un tableau de cases pour un tile (et une couche) donnés.',
 	{
		:layer => ["La couche (entre 0 et 2)", :Fixnum],
		:tile_id => ["L'ID du tile", :Fixnum],

	}, true # Maybe changed
register_command :mapinfo, 'Command.get_squares_by_tile'

# AUTOGenerated for has_prefix?
link_method_documentation 'Command.has_prefix?',
	'Renvoie true si une chaine à le préfix donné, false sinon.',
 	{
		:string => ["La chaine de caractère à vérifier", :String],
		:prefix => ["Le préfix devant être contenu dans la chaine", :String],

	}, true # Maybe changed
register_command :standard, 'Command.has_prefix?'

# AUTOGenerated for has_suffix?
link_method_documentation 'Command.has_suffix?',
	'Renvoie true si une chaine à le suffix donné, false sinon.',
 	{
		:string => ["La chaine de caractère à vérifier", :String],
		:suffix => ["Le suffix devant être contenu dans la chaine", :String],

	}, true # Maybe changed
register_command :standard, 'Command.has_suffix?'

# AUTOGenerated for has_substring?
link_method_documentation 'Command.has_substring?',
	'Renvoie true si une chaine contient une autre chaine donnée, false sinon.',
 	{
		:string => ["La chaine de caractère à vérifier", :String],
		:substring => ["La chaine devant être contenue dans la chaine", :String],

	}, true # Maybe changed
register_command :standard, 'Command.has_substring?'

# AUTOGenerated for event_flash
link_method_documentation 'Command.event_flash',
	'Flash un événement (référencé par son ID) dans une couleur',
 	{
		:id => ["l'ID de l'événement cible", :Fixnum],
		:color => ["La couleur du flash (vous pouvez utiliser la commande color ou via son profil dans la base de données)", :Color],
		:duration => ["La durée du flash en frames", :Fixnum],

	}
register_command :event, 'Command.event_flash'

# AUTOGenerated for player_flash
link_method_documentation 'Command.player_flash',
	'Flash le hér dans une couleur',
 	{
		:color => ["La couleur du flash (vous pouvez utiliser la commande color ou via son profil dans la base de données)", :Color],
		:duration => ["La durée du flash en frames", :Fixnum],

	}
register_command :event, 'Command.player_flash'

# AUTOGenerated for get_squares_by_terrain
link_method_documentation 'Command.get_squares_by_terrain',
	'Renvoie un tableau de cases pour un terrain_tag donné donnée.',
 	{
		:terrain_tag => ["Le terrain tag (entre 0 et 7)", :Fixnum],

	}, true # Maybe changed
register_command :mapinfo, 'Command.get_squares_by_terrain'

# AUTOGenerated for pixel_in_text?
link_method_documentation 'Command.pixel_in_text?',
	'Vérifie que le x, y sont inscrit dans le texte',
 	{
		:id => ["ID du texte", :Fixnum],
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],
		:"*precise" => ["Si false, détecte via le rectangle du texte, si true, détecte au pixel près. Par défaut, false", :Boolean],

	}, true # Maybe changed
register_command :text, 'Command.pixel_in_text?'

# AUTOGenerated for text_mouse_hover?
link_method_documentation 'Command.text_mouse_hover?',
	'Renvoie true si la souris survole le texte référencé par son ID',
 	{
		:id => ["ID du texte", :Fixnum],
		:"*precise" => ["Si false, détecte via le rectangle du texte, si true, détecte au pixel près. Par défaut, false", :Boolean],

	}, true # Maybe changed
register_command :text, 'Command.text_mouse_hover?'

# AUTOGenerated for text_mouse_click?
link_method_documentation 'Command.text_mouse_click?',
	'Renvoie true si la souris survole et clique le texte référencé par son ID',
 	{
		:id => ["ID du texte", :Fixnum],
		:"*precise" => ["Si false, détecte via le rectangle du texte, si true, détecte au pixel près. Par défaut, false", :Boolean],

	}, true # Maybe changed
register_command :text, 'Command.text_mouse_click?'

# AUTOGenerated for text_mouse_press?
link_method_documentation 'Command.text_mouse_press?',
	'Renvoie true si la souris survole et presse en continu la touche référencée sur le texte référencé par son ID',
 	{
		:id => ["ID du texte", :Fixnum],
		:"*key" => ["Touche de la souris (par défaut, :mouse_left", :Symbol],
		:"*precise" => ["Si false, détecte via le rectangle du texte, si true, détecte au pixel près. Par défaut, false", :Boolean],

	}, true # Maybe changed
register_command :text, 'Command.text_mouse_press?'

# AUTOGenerated for text_mouse_trigger?
link_method_documentation 'Command.text_mouse_trigger?',
	'Renvoie true si la souris survole et presse la touche référencée sur le texte référencé par son ID',
 	{
		:id => ["ID du texte", :Fixnum],
		:"*key" => ["Touche de la souris (par défaut, :mouse_left", :Symbol],
		:"*precise" => ["Si false, détecte via le rectangle du texte, si true, détecte au pixel près. Par défaut, false", :Boolean],

	}, true # Maybe changed
register_command :text, 'Command.text_mouse_trigger?'

# AUTOGenerated for text_mouse_repeat?
link_method_documentation 'Command.text_mouse_repeat?',
	'Renvoie true si la souris survole et presse successivement la touche référencée sur le texte référencé par son ID',
 	{
		:id => ["ID du texte", :Fixnum],
		:"*key" => ["Touche de la souris (par défaut, :mouse_left", :Symbol],
		:"*precise" => ["Si false, détecte via le rectangle du texte, si true, détecte au pixel près. Par défaut, false", :Boolean],

	}, true # Maybe changed
register_command :text, 'Command.text_mouse_repeat?'

# AUTOGenerated for text_mouse_release?
link_method_documentation 'Command.text_mouse_release?',
	'Renvoie true si la souris survole et relâche la touche référencée sur le texte référencé par son ID',
 	{
		:id => ["ID du texte", :Fixnum],
		:"*key" => ["Touche de la souris (par défaut, :mouse_left", :Symbol],
		:"*precise" => ["Si false, détecte via le rectangle du texte, si true, détecte au pixel près. Par défaut, false", :Boolean],

	}, true # Maybe changed
register_command :text, 'Command.text_mouse_release?'

# AUTOGenerated for fresh_text_id
link_method_documentation 'Command.fresh_text_id',
	'Génère un ID non utilisé pour un texte',
 	{}, true # Maybe changed
register_command :text, 'Command.fresh_text_id'

# AUTOGenerated for fresh_picture_id
link_method_documentation 'Command.fresh_picture_id',
	'Génère un ID non utilisé pour une picture',
 	{}, true # Maybe changed
register_command :picture, 'Command.fresh_picture_id'

# AUTOGenerated for fresh_parallax_id
link_method_documentation 'Command.fresh_parallax_id',
	'Génère un ID non utilisé pour une panorama',
 	{}, true # Maybe changed
register_command :parallax, 'Command.fresh_parallax_id'

# AUTOGenerated for parallax_erased?
link_method_documentation 'Command.parallax_erased?',
	'Renvoie true si le panorama référencé par son ID a été supprimé, false sinon',
 	{
		:id => ["ID du panorama", :Fixnum],

	}
register_command :parallax, 'Command.parallax_erased?'

# AUTOGenerated for create_light_emitters
link_method_documentation 'Command.create_light_emitters',
	'Your description',
 	{
		:hash => ["Args description", :ArgType],

	}, true # Maybe changed
register_command :standard, 'Command.create_light_emitters'

# AUTOGenerated for menu_disabled?
link_method_documentation 'Command.menu_disabled?',
	'Renvoie true si les accès aux menus sont désactivés, false sinon',
 	{}, true # Maybe changed
register_command :standard, 'Command.menu_disabled?'

# AUTOGenerated for menu_enabled?
link_method_documentation 'Command.menu_enabled?',
'Renvoie true si les accès aux menus sont activés, false sinon',
 	{}, true # Maybe changed
register_command :standard, 'Command.menu_enabled?'

# AUTOGenerated for save_enabled?
link_method_documentation 'Command.save_enabled?',
  'Renvoie true si les accès aux sauvegardes sont activés, false sinon',
 	{}, true # Maybe changed
register_command :standard, 'Command.save_enabled?'

# AUTOGenerated for save_disabled?
link_method_documentation 'Command.save_disabled?',
  'Renvoie true si les accès aux sauvegardes sont désactivés, false sinon',
 	{}, true # Maybe changed
register_command :standard, 'Command.save_disabled?'

# AUTOGenerated for encounter_disabled?
link_method_documentation 'Command.encounter_disabled?',
  'Renvoie true si les rencontres sont désactivés, false sinon',
 	{}, true # Maybe changed
register_command :standard, 'Command.encounter_disabled?'

# AUTOGenerated for encounter_enabled?
link_method_documentation 'Command.encounter_enabled?',
  'Renvoie true si les rencontres sont activés, false sinon',
 	{}, true # Maybe changed
register_command :standard, 'Command.encounter_enabled?'

# AUTOGenerated for formation_disabled?
link_method_documentation 'Command.formation_disabled?',
'Renvoie true si les formations sont désactivés, false sinon',
 	{}, true # Maybe changed
register_command :standard, 'Command.formation_disabled?'

# AUTOGenerated for formation_enabled?
link_method_documentation 'Command.formation_enabled?',
  'Renvoie true si les formations sont activés, false sinon',
 	{}, true # Maybe changed
register_command :standard, 'Command.formation_enabled?'





end
