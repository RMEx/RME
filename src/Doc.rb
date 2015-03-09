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
  }
  documentation_add_link "GitHub", "https://github.com/funkywork/RME"
  documentation_add_link "Manuel d'utilisation (Wiki)", "https://github.com/funkywork/RME/wiki"
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
                            "Vérifie si le point passé en argument (via (x, y), ou via une instance de Point) est inscrit dans le rectangle", 
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
  register_command_category :math, "Commandes mathématiques et arithmétiques", "Outils de traitement mathématiques un peu avancé"
  register_command_category :troop, "Commandes relatives aux groupes", "Informations sur les groupes de monstres"
  register_command_category :enemy, "Commandes relatives aux ennemis (tels que défini dans la base de données)", "Informations sur les monstres rencontrables tels que défini dans la base de données, donc utilisable partout."
  register_command_category :in_battle, "Commandes en combat", "Commandes d'informations en combat (en plus de la base de données). Uniquement valide en combat"
  register_command_category :text, "Commandes d'affichage de textes", "Commandes pour afficher du texte à l'écran, les textes sont référencés par des ID's, comme les images."
  register_command_category :date, "Commandes de temps", "Commandes pour récupérer des informations sur la date et l'heure"
  register_command_category :socket, "Commandes de communication client-serveur", "Commandes pour communiquer avec un serveur TCP/IP"
  register_command_category :scene, "Commande de navigation dans les scenes", "Commandes pour naviguer entre les scenes de jeu (et de systèmes)"
  register_command_category :save, "Commande de manipulation des sauvegardes", "Commandes pour gerer et naviguer entre les sauvegardes"
  register_command_category :area, "Commandes de gestion de zones virtuelles", "Commandes pour créer et manipuler des zones virtuelles"
  register_command_category :textfield, "Commandes de gestion des champs de texte", "Commande pour manipuler des champs de texte saisissable au clavier"
  register_command_category :clipboard, "Commandes de gestion du presse-papier", "Permet d'envoyer des données dans le presse-papier ou de récupérer le texte stocké dans le presse papier"
  register_command_category :xbox, "Commandes de gestion de la vibration des pads Xbox360", "Permet de manipuler la vibration des manettes de la XBOX360"

  link_class_documentation "Collection des commandes EventExtender"

  add_internals :enemy, :troop, :monster_battler_dimension, :distance_between
  add_internals :type_equip, :sys, :spriteset, :sprite_picture, :screen, :picture
  add_internals :scene, :event, :method_missing, :pictures, :scene

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
  add_internals :server_single_wait_recv, :buzz

  add_internals :mouse_square_hover_area?,:mouse_clicked_area?,:mouse_square_clicked_area?
  add_internals :mouse_triggered_area?,:mouse_square_triggered_area?,:mouse_pressed_area?
  add_internals :mouse_square_pressed_area?,:mouse_released_area?,:mouse_square_released_area?
  add_internals :mouse_repeated_area?, :mouse_square_repeated_area?

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
                          :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left", :Symbol]
                        }, true
  register_command :event, "Command.mouse_press_event?"

  link_method_documentation "Command.mouse_trigger_event?", 
                        "Renvoie true si la souris vient de cliquer un évènement du sélecteur passé en argument",
                        {
                          :events => ["Selecteur d'évènements", :Selectors],
                          :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left", :Symbol]
                        }, true
  register_command :event, "Command.mouse_trigger_event?"

  link_method_documentation "Command.mouse_repeat_event?", 
                        "Renvoie true si la souris clique de manière répétée un évènement du sélecteur passé en argument",
                        {
                          :events => ["Selecteur d'évènements", :Selectors],
                          :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left", :Symbol]
                        }, true
  register_command :event, "Command.mouse_repeat_event?"

  link_method_documentation "Command.mouse_release_event?", 
                        "Renvoie true si la souris est relâchée sur un évènement du sélecteur passé en argument",
                        {
                          :events => ["Selecteur d'évènements", :Selectors],
                          :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left", :Symbol]
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
  register_command :keyboard, "Command.keyboard_all?"

  link_method_documentation "Command.keyboard_any?", 
                          "Renvoie true si toutes au moins une touches passée à keys est activée selon la méthode passées à method", 
                          {
                            :method => ["Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
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
                          "Renvoie true lorsqu'on effectue un clic gauche",
                          {},
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
  register_command :mouse, "Command.mouse_current_key"

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
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }, true
  register_command :picture, "Command.picture_x"

  link_method_documentation "Command.picture_y", 
                          "Change l'axe Y d'une image", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :x => ["Position en y de l'image, si aucun argument n'est passé, la commande renverra la position Y de l'image", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }, true
  register_command :picture, "Command.picture_y"
  link_method_documentation "Command.picture_position", 
                          "Change la position de l'image", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :x => ["Position en x de l'image", :Fixnum],
                            :y => ["Position en y de l'image", :Fixnum],
                             :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }
  register_command :picture, "Command.picture_position"
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
                            :angle => ["Angle d'orientation de l'image (En degrés décimaux, sens anti-horaire). Si aucun angle n'est donné, la commande renverra l'angle de l'image", :Fixnum],
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
                            :zoom => ["Pourcentage d'agrandissement de la largeur de l'image. Si aucune valeur n'est donné, la commande renverra le zoom_x de l'image.", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],                        
                          }, true
  register_command :picture, "Command.picture_zoom_x"
  link_method_documentation "Command.picture_zoom_y", 
                          "Change la hauteur d'une image", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :zoom => ["Pourcentage d'agrandissement de la hauteur de l'image. Si aucune valeur n'est donné, la commande renverra le zoom_y de l'image.", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],                          
                          }, true
  register_command :picture, "Command.picture_zoom_y"
  link_method_documentation "Command.picture_zoom", 
                          "Change la taille d'une image", 
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :zoom_x => ["Pourcentage d'agrandissement de la largeur de l'image", :Fixnum],
                            :"*zoom_y" => ["Pourcentage d'agrandissement de la hauteur de l'image. Si cet argument est ommis, la largeur sera égal à la hauteur.", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],                         
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
                            :"*x" => ["Coordonnées X de la carte en pixel, par défaut la coordonnée convertie de l'écran vers la carte", :Fixnum],
                            :"*y" => ["Coordonnées Y de la carte en pixel, par défaut la coordonnée convertie de l'écran vers la carte", :Fixnum]
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
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
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
  register_command :picture, "Command.picture_shake"

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
  register_command :picture, "Command.pictures_collide?"

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

  # AUTOGenerated for picture_width
  link_method_documentation 'Command.picture_width', 
    'Change la largeur d\'une image référencée par son ID',
    {
      :id => ["ID de l'image", :Fixnum],
      :"*v" => ["Valeur à changer, si aucune valeur n'est donnée, la commande renverra la largeur de l'image", :Fixnum],
      :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
      :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],  

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

    }
  register_command :picture, 'Command.picture_dimension' 

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
register_command :items, "Command.item_has_no_scope?"

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
                        "Renvoie true si la cible d'un objet référencée par son ID , false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_for_caller?"

link_method_documentation "Command.item_for_opponent?", 
                        "Renvoie true si un objet référencée par son ID cible les ennemis, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_for_opponent?"

link_method_documentation "Command.item_for_friend?", 
                        "Renvoie true si un objet référencée par son ID cible (un ou) les alliés, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_for_friend?"

link_method_documentation "Command.item_for_dead_friend?", 
                        "Renvoie true si un objet référencée par son ID cible (un ou) les alliés morts, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_for_dead_friend?"

link_method_documentation "Command.item_for_one?", 
                        "Renvoie true si un objet référencée par son ID cible une cible, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_for_one?"

link_method_documentation "Command.item_for_random?", 
                        "Renvoie true si un objet référencée par son ID cible aléatoirement, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_for_random?"

link_method_documentation "Command.item_for_all?", 
                        "Renvoie true si un objet référencée par son ID cible tout le groupe, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_for_all?"

link_method_documentation "Command.item_need_selection?", 
                        "Renvoie true si un objet référencée par son ID requiert la sélection de l'ennemi, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_need_selection?"


link_method_documentation "Command.item_certain?", 
                        "Renvoie true si un objet référencée par son ID a une garantie de réussite total, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_certain?"

link_method_documentation "Command.item_physical?", 
                        "Renvoie true si un objet référencée par son ID produit un dommage physique, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_physical?"

link_method_documentation "Command.item_magical?", 
                        "Renvoie true si un objet référencée par son ID produit un dommage magique, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_magical?"

link_method_documentation "Command.item_number_of_targets", 
                        "Renvoie le nombre de cibles d'un objet référencée par son ID produit un dommage magique, false sinon",
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

link_method_documentation "Command.item_speed", 
                        "Renvoie l'apport de vitesse de l'objet référencé par son ID",
                        {
                          :id => ["Id de l'objet", :Fixnum], 
                        }, true
register_command :items, "Command.item_speed"

link_method_documentation "Command.item_nb_hits", 
                        "Renvoie le nombre de coup porté par l'objet référencé par son ID",
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
register_command :actors, "Command.actor_magical_reflection_rate"

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

link_method_documentation "Command.actor_knowns?", 
                        "Renvoie true si le héros référencé par son ID connait la technique référencée par son ID, false sinon",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                          :skill_id => ["ID de le technique", :Fixnum],
                        }
register_command :actors, "Command.actor_knowns?"

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
register_command :skills, "Command.skill_has_no_scope?"

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

link_method_documentation "Command.skill_for_opponent?", 
                        "Renvoie true si une technique référencée par son ID cible les ennemis, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_for_opponent?"

link_method_documentation "Command.skill_for_friend?", 
                        "Renvoie true si une technique référencée par son ID cible (un ou) les alliés, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_for_friend?"

link_method_documentation "Command.skill_for_dead_friend?", 
                        "Renvoie true si une technique référencée par son ID cible (un ou) les alliés morts, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_for_dead_friend?"

link_method_documentation "Command.skill_for_one?", 
                        "Renvoie true si une technique référencée par son ID cible une cible, false sinon",
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
                        "Renvoie true si une technique référencée par son ID cible tout le groupe, false sinon",
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
                        "Renvoie true si une technique référencée par son ID a une garantie de réussite total, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_certain?"

link_method_documentation "Command.skill_physical?", 
                        "Renvoie true si une technique référencée par son ID produit un dommage physique, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_physical?"

link_method_documentation "Command.skill_magical?", 
                        "Renvoie true si une technique référencée par son ID produit un dommage magique, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_magical?"

link_method_documentation "Command.skill_number_of_targets", 
                        "Renvoie le nombre de cibles d'une technique référencée par son ID produit un dommage magique, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_number_of_targets"

link_method_documentation "Command.skill_speed", 
                        "Renvoie l'apport de vitesse de la technique référencé par son ID",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_speed"

link_method_documentation "Command.skill_nb_hits", 
                        "Renvoie le nombre de coup porté par la technique référencé par son ID",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_nb_hits"

link_method_documentation "Command.skill_success_rate", 
                        "Renvoie la probabilité de succès de la technique référencé par son ID",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_success_rate"

link_method_documentation "Command.skill_tp_gain", 
                        "Renvoie le gain de TP que la technique référencé par son ID apporte une fois utilisé en combat",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_tp_gain"

link_method_documentation "Command.skill_name", 
                        "Renvoie le nom de la technique référencé par son ID",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_name"

link_method_documentation "Command.skill_note", 
                        "Renvoie le commentaire de la base de données de la technique référencé par son ID",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_note"

link_method_documentation "Command.skill_description", 
                        "Renvoie la description la technique référencé par son ID",
                        {
                          :id => ["Id de la technique", :Fixnum], 
                        }, true
register_command :skills, "Command.skill_description"

link_method_documentation "Command.skill_icon", 
                        "Renvoie l'index de l'icone de la technique référencé par son ID",
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
                        "Renvoie l'arc tangeant de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.atan"

link_method_documentation "Command.atan2", 
                        "Renvoie l'arc tangeant pour x et y",
                        { :x => ["Valeur numérique", :Numeric],  :y => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.atan2"

link_method_documentation "Command.atanh", 
                        "Renvoie l'inverse hyperbolique tangeant de x",
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
                        "Renvoie la tangeante de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.tan"

link_method_documentation "Command.tanh", 
                        "Renvoie la tangeante hyperbolique de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.tanh"

link_method_documentation "Command.to_deg", 
                        "Renvoie x (supposé radian) convertit en degré",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.to_deg"

link_method_documentation "Command.to_rad", 
                        "Renvoie x (supposé degré) convertit en radian",
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
                        "Renvoie un tableau des enemy_id  d'un groupe de monstres référencé par son ID.",
                        { :id => ["ID du groupe de monstre", :Fixnum] }, true
register_command :troop, "Command.troop_members"

link_method_documentation "Command.troop_member", 
                        "Renvoie l'id d'un monstre d'un groupe de monstre référencé par son ID et par sa position (0 = premier).",
                        { :id => ["ID du groupe de monstre", :Fixnum], :position => ["Position du monstre", :Fixnum]  }, true
register_command :troop, "Command.troop_member"

link_method_documentation "Command.troop_member_x", 
                        "Renvoie la position X d'un monstre d'un groupe de monstre référencé par son ID et par sa position (0 = premier) tel que défini dans la base de données.",
                        { :id => ["ID du groupe de monstre", :Fixnum], :position => ["Position du monstre", :Fixnum]  }, true
register_command :troop, "Command.troop_member_x"

link_method_documentation "Command.troop_member_y", 
                        "Renvoie la position Y d'un monstre d'un groupe de monstre référencé par son ID et par sa position (0 = premier) tel que défini dans la base de données.",
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
                        "renvoie le maximum de point de magie d'un ennemi référencé par son ID",
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
                        "renvoie l'or donnée par un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_give_gold"


link_method_documentation "Command.current_troop", 
                        "Renvoie l'identifiant du groupe en cours de combat",
                        {}, true
register_command :in_battle, "Command.current_troop"

link_method_documentation "Command.current_enemies", 
                        "Renvoie un tableau contenant les ennemis en cours de combat",
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
                        "renvoie le pourcentage de régénration de HP à chaque tour de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_hp_regeneration_rate"

link_method_documentation "Command.enemy_mp_regeneration_rate", 
                        "renvoie le pourcentage de régénration MP à chaque tour de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_mp_regeneration_rate"

link_method_documentation "Command.enemy_tp_regeneration_rate", 
                        "renvoie le pourcentage de régénration de TP par tour de l'ennemi en combat référencé par sa position en combat",
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
                        "renvoie le pourcentage de MP/HP recu, de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_recovery_effect_rate"

link_method_documentation "Command.enemy_pharmacology", 
                        "renvoie le pourcentage de HP/MP récupéré via un objet de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_pharmacology"

link_method_documentation "Command.enemy_mp_cost_rate", 
                        "renvoie le facteur d'un cout de MP (pour une attaque faisant varier la consommation de MP) de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_mp_cost_rate"

link_method_documentation "Command.enemy_tp_charge_rate", 
                        "renvoie le facteur de cout de TP (pour une attaque faisant varier la consommation de TP) de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_tp_charge_rate"

link_method_documentation "Command.enemy_physical_damage_rate", 
                        "renvoie le pourcentage de dommage physique reçu de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_physical_damage_rate"

link_method_documentation "Command.enemy_magical_damage_rate", 
                        "renvoie le pourcentage de dommage magique reçu de l'ennemi en combat référencé par sa position en combat",
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
                        "renvoie le pourcentage de dommage des terrains reçu de l'ennemi en combat référencé par sa position en combat",
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
                        "renvoie true si un acteur est entrain de choisir une action, false sinon",
                        {
                         
                        }, true
register_command :in_battle, "Command.active_actor?"

link_method_documentation "Command.active_actor", 
                        "renvoie l'identifiant d'un acteur si il est entrain de sélectionner une action, nil sinon",
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
                            :"*origin" => ["Origine du texte, 0 = Haut gauche, 1 = centré par défaut, zéro", :Fixnum],
                          }
register_command :text, "Command.text_show"

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
                            :"opacity" => ["Opacitée (de 0 à 255)", :Fixnum],
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
                          "Change le profil du texte",
                          {
                            :id => ["Identifiant du texte", :Fixnum],
                            :profile => ["Nouveau profil", :String]
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
                          "Change l'opacité du texte",
                          {
                            :id => ["Identifiant du texte", :Fixnum],
                            :opacity => ["valeur de l'opacité", :Fixnum],
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
  'Renvoi l\'année actuelle',
  {}, true # Maybe changed
register_command :date, 'Command.time_year' 

# AUTOGenerated for time_month
link_method_documentation 'Command.time_month', 
  'Renvoi le mois actuel',
  {}, true # Maybe changed
register_command :date, 'Command.time_month' 

# AUTOGenerated for time_day
link_method_documentation 'Command.time_day', 
  'Renvoi le jour actuel',
  {}, true # Maybe changed
register_command :date, 'Command.time_day' 

# AUTOGenerated for time_hour
link_method_documentation 'Command.time_hour', 
  'Renvoi l\' heure actuelle',
  {}, true # Maybe changed
register_command :date, 'Command.time_hour' 

# AUTOGenerated for time_min
link_method_documentation 'Command.time_min', 
  'Renvoi la minute actuelle',
  {}, true # Maybe changed
register_command :date, 'Command.time_min' 

# AUTOGenerated for time_sec
link_method_documentation 'Command.time_sec', 
  'Renvoi la seconde actuelle',
  {}, true # Maybe changed
register_command :date, 'Command.time_sec' 

# AUTOGenerated for socket_connected?
link_method_documentation 'Command.socket_connected?', 
  'Renvoi true si la connexion est en cours, false, sinon',
  {}, true # Maybe changed
register_command :socket, 'Command.socket_connected?' 

# AUTOGenerated for socket_connect
link_method_documentation 'Command.socket_connect', 
  'Se connecte à un serveur, renvoie true si la connexion à réussie, false sinon.',
  {
    :address => ["Adresse du serveur", :String],
    :port => ["Port d'écoute", :Fixnum],

  }, true # Maybe changed
register_command :socket, 'Command.socket_connect' 

# AUTOGenerated for socket_disconnect
link_method_documentation 'Command.socket_disconnect', 
  'Déconnecte la connexion courrante',
  {}
register_command :socket, 'Command.socket_disconnect' 

# AUTOGenerated for socket_send
link_method_documentation 'Command.socket_send', 
  'Envoi un message au serveur connecté, renvoie true en cas de réussite, false en cas d\'échec',
  {
    :data => ["Message à envoyer", :String],

  }, true # Maybe changed
register_command :socket, 'Command.socket_send' 

# AUTOGenerated for socket_recv
link_method_documentation 'Command.socket_recv', 
  'Renvoi le message envoyé par le serveur au client, false si aucun message n\' est reçu',
  {
    :"*len" => ["Taille maximale du message à recevoir, par défaut 1024", :Fixnum],

  }, true # Maybe changed
register_command :socket, 'Command.socket_recv' 

# AUTOGenerated for socket_wait_recv
link_method_documentation 'Command.socket_wait_recv', 
  'Attend une réponse du serveur, se termine quand une réponse a été reçue (et l\'a renvoi)',
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
    :"&block" => ["Action a exécuter ({action})", :Block],

  }
register_command :standard, 'Command.wait_with' 

# AUTOGenerated for qte
link_method_documentation 'Command.qte', 
  'Attend la saisie d\'une touche pendant une durée donnée. La commande renvoie true si la touche a été saisie, false sinon.',
  {
    :key => ["Touche qu'il faut presser avant la fin", :Symbol],
    :time => ["Durée", :Fixnum],
    :"*strict" => ["Difficulté, si elle vaut true, aucune erreur admise, sinon erreur admises. Par défaut vaut true", :Boolean]

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
  'Renvoi à l\'écran titre',
  {}
register_command :scene, 'Command.call_title_screen' 

# AUTOGenerated for call_load_screen
link_method_documentation 'Command.call_load_screen', 
  'Renvoi à la scene de chargement de partie',
  {}
register_command :scene, 'Command.call_load_screen' 

# AUTOGenerated for scene_call
link_method_documentation 'Command.scene_call', 
  'Appel une scene (et la place dans la pile de scene)',
  {
    :scene => ["Scene à appeler", :Scene],

  }, true # Maybe changed
register_command :scene, 'Command.scene_call' 

# AUTOGenerated for scene_goto
link_method_documentation 'Command.scene_goto', 
  'Appel une scene (sans la placer dans la pile de scene)',
  {
    :scene => ["Scene à appeler", :Scene],

  }
register_command :scene, 'Command.scene_goto' 

# AUTOGenerated for scene_return
link_method_documentation 'Command.scene_return', 
  'Renvoi à la dernière scene dans la pile d\'appel',
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
  'Renvoi la valeur d\'une variable issue d\'une autre sauvegarde',
  {
    :index => ["Numéro de la sauvegarde", :Fixnum],
    :idvar => ["Numéro de la variable", :Fixnum],

  }, true # Maybe changed
register_command :save, 'Command.import_variable' 

# AUTOGenerated for import_switch
link_method_documentation 'Command.import_switch', 
  'Renvoi la valeur d\'un interrupteur issu d\'une autre sauvegarde',
  {
    :index => ["Numéro de la sauvegarde", :Fixnum],
    :idswitch => ["Numéro de l'interrupteur", :Fixnum],

  }, true # Maybe changed
register_command :save, 'Command.import_switch' 

# AUTOGenerated for import_label
link_method_documentation 'Command.import_label', 
  'Renvoi la valeur d\'un label issu d\'une autre sauvegarde',
  {
    :index => ["Numéro de la sauvegarde", :Fixnum],
    :idlabel => ["Identifiant du label", :Fixnum],

  }, true # Maybe changed
register_command :save, 'Command.import_label' 

# AUTOGenerated for random_combination
link_method_documentation 'Command.random_combination', 
  'Renvoi une combinaison (tableau itérable) aléatoire de la taille spécifiée en argument, composés des paramètres des touches passées en arguments. (par exemple : random_combination(5, :UP, :DOWN, :LEFT, :RIGHT) )',
  {
    :len => ["Args description", :Fixnum],
    :"*keys" => ["Liste des touches pouvant constituer la combinaison", :Argslist],

  }, true # Maybe changed
register_command :standard, 'Command.random_combination' 

# AUTOGenerated for pick_random
link_method_documentation 'Command.pick_random', 
  'Renvoi un élément au hasard du tableau (ou de la liste d\'argument)',
  {
    :"*elts" => ["éléments dans lequel piocher un élément aléatoire. Soit pick_random(a, b, c, d...etc.) soit pick_random([a,b,c,d...etc])", :ArgsList],
  }, true # Maybe changed
register_command :standard, 'Command.pick_random' 

# AUTOGenerated for event_name
link_method_documentation 'Command.event_name', 
  'Renvoi le nom d\'un évènement, renvoi nil s\' il s\'agit du héros',
  {
    :id => ["ID de l'évènement (0 pour le héro)", :Fixnum],

  }, true # Maybe changed
register_command :event, 'Command.event_name' 

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
  'Renvoie true si la souris survol le joueur',
  {}, true # Maybe changed
register_command :event, 'Command.mouse_hover_player?' 

# AUTOGenerated for mouse_click_player?
link_method_documentation 'Command.mouse_click_player?', 
  'Renvoie true si la souris clique le joueur',
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
  'Renvoie true si la souris appuye successivement sur la touche passée en argument sur le joueur',
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
  "Renvoie le dernier event relaché (avec mouse_left) par la souris, nil si aucun évènement n'a été relaché",
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
    :length => ["Taille du tressaiellement", :Fixnum],

  }
register_command :event, 'Command.events_buzzer_properties' 

# AUTOGenerated for followers_buzzer_properties
link_method_documentation 'Command.followers_buzzer_properties', 
  "Change les propriétés de tressaillement des membre de la chenille (followers_buzzer_properties(0,1,2,3, amplitude, length))",
  {
    :"*ids" => ["Liste des positions des suiveurs. Si cet argument est occulté, ces paramètres s'appliquent à tous les suiveurs.", :ArgsList],
    :amplitude => ["Amplitude du tressaillement", :ArgType],
    :length => ["Taille du tressaiellement", :Fixnum],

  }
register_command :event, 'Command.followers_buzzer_properties' 

# AUTOGenerated for events_buzz
link_method_documentation 'Command.events_buzz', 
  'Fait tressaillir les évènements',
  {
    :e => ["Selecteur d'évènements", :Selector],
    :"*duration" => ["Durée du dressaillement (en frame), par défaut, 16", :Fixnum],

  }
register_command :event, 'Command.events_buzz' 

# AUTOGenerated for followers_buzz
link_method_documentation 'Command.followers_buzz', 
  'Fait tressaillir les suiveurs (followers_buzz([1,2,3], *duration), par exemple, si la liste des suiveurs est vide, ça s\'applique à tous les followers)',
  {
    :ids => ["Tableau des identifiants des suiveurs à faire tressaillir, utiliser [] pour appliquer à tous les suiveurs", :Selector],
    :"*duration" => ["Durée du dressaillement (en frame), par défaut, 16", :Fixnum]

  }
register_command :event, 'Command.followers_buzz' 

# AUTOGenerated for create_rect_area
link_method_documentation 'Command.create_rect_area', 
  "Crée et renvoi une zone rectangulaire",
  {
    :x => ["Coordonnées X de la zone", :Fixnum],
    :y => ["Coordonnées Y de la zone", :Fixnum],
    :width => ["Largeur de la zone", :Fixnum],
    :height => ["Hauteur de la zone", :Fixnum],

  }, true # Maybe changed
register_command :area, 'Command.create_rect_area' 

# AUTOGenerated for create_circle_area
link_method_documentation 'Command.create_circle_area', 
  'Crée et renvoi une zone circulaire',
  {
    :x => ["Coordonnées X de la zone", :Fixnum],
    :y => ["Coordonnées Y de la zone", :Fixnum],
    :rayon => ["Rayon de la zone", :Fixnum],

  }, true # Maybe changed
register_command :area, 'Command.create_circle_area' 

# AUTOGenerated for create_ellipse_area
link_method_documentation 'Command.create_ellipse_area', 
  'Crée et renvoi une zone elliptique',
  {
    :x => ["Coordonnées X de la zone", :Fixnum],
    :y => ["Coordonnées Y de la zone", :Fixnum],
    :width => ["Largeur de la zone", :Fixnum],
    :height => ["Hauteur de la zone", :Fixnum],

  }, true # Maybe changed
register_command :area, 'Command.create_ellipse_area' 

# AUTOGenerated for create_polygon_area
link_method_documentation 'Command.create_polygon_area', 
  'Crée et renvoi une zone polygonale (le dernier point est relié avec le premier)',
  {
    :"*points" => ["Liste de points (create_polygon_area([ax, ay], [bx, by], [cx, cy] etc...))", :ArgType],

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
  "Renvoie true si la souris survol la zone passée en argument au moment de l'appel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],

  }, true # Maybe changed
register_command :area, 'Command.mouse_hover_area?' 

# AUTOGenerated for mouse_hover_square_area?
link_method_documentation 'Command.mouse_hover_square_area?', 
  "Renvoie true si la souris survol la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en case et non en pixel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],

  }, true # Maybe changed
register_command :area, 'Command.mouse_hover_square_area?' 

# AUTOGenerated for mouse_click_area?
link_method_documentation 'Command.mouse_click_area?', 
  "Renvoie true si la souris survol et clique sur la zone passée en argument au moment de l'appel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],

  }, true # Maybe changed
register_command :area, 'Command.mouse_click_area?' 

# AUTOGenerated for mouse_click_square_area?
link_method_documentation 'Command.mouse_click_square_area?', 
  "Renvoie true si la souris survol et clique sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en case et non en pixel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_click_square_area?' 

# AUTOGenerated for mouse_trigger_area?
link_method_documentation 'Command.mouse_trigger_area?', 
  "Renvoie true si la souris survol et clique une fois sur la zone passée en argument au moment de l'appel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_trigger_area?' 

# AUTOGenerated for mouse_trigger_square_area?
link_method_documentation 'Command.mouse_trigger_square_area?', 
  "Renvoie true si la souris survol et clique une fois sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en case et non en pixel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_trigger_square_area?' 

# AUTOGenerated for mouse_press_area?
link_method_documentation 'Command.mouse_press_area?', 
  "Renvoie true si la souris survol et clique en continu sur la zone passée en argument au moment de l'appel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_press_area?' 

# AUTOGenerated for mouse_press_square_area?
link_method_documentation 'Command.mouse_press_square_area?', 
  "Renvoie true si la souris survol et clique en continu sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en case et non en pixel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_press_square_area?' 

# AUTOGenerated for mouse_release_area?
link_method_documentation 'Command.mouse_release_area?', 
  "Renvoie true si la souris survol et est relachée sur la zone passée en argument au moment de l'appel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_release_area?' 

# AUTOGenerated for mouse_release_square_area?
link_method_documentation 'Command.mouse_release_square_area?', 
  "Renvoie true si la souris survol et est relachée sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en case et non en pixel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_release_square_area?' 

# AUTOGenerated for mouse_repeat_area?
link_method_documentation 'Command.mouse_repeat_area?', 
  "Renvoie true si la souris survol et pressée en répétitivement sur la zone passée en argument au moment de l'appel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_repeat_area?' 

# AUTOGenerated for mouse_repeat_square_area?
link_method_documentation 'Command.mouse_repeat_square_area?', 
  "Renvoie true si la souris survol et est pressée en répétitivement sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en case et non en pixel, false sinon",
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
    :text => ["Texte à afficher par défaut du champ", :String],
    :x => ["Position X du champ", :Fixnum],
    :y => ["Position Y du champ", :Fixnum],
    :w => ["Largeur du champ de texte", :Fixnum],
    :profile => ["Référence du profile du champ de texte", :Fixnum],
    :"*range" => ["Interval du nombre de caractère autorisé, peut être occulté", :Range],

  }
register_command :textfield, 'Command.textfield_text_show' 

# AUTOGenerated for textfield_int_show
link_method_documentation 'Command.textfield_int_show', 
  'Affiche un champ de texte permettant de saisir des nombres entiers',
  {
    :id => ["ID du champ de texte", :Fixnum],
    :number => ["Nombre à afficher par défaut du champ", :Fixnum],
    :x => ["Position X du champ", :Fixnum],
    :y => ["Position Y du champ", :Fixnum],
    :w => ["Largeur du champ de texte", :Fixnum],
    :profile => ["Référence du profile du champ de texte", :Fixnum],
    :"*range" => ["Interval des nombres autorisés, peut être occulté", :Range],

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
    :"*range" => ["Interval des nombres autorisés, peut être occulté", :Range],

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
  'Renvoi true si le champ de texte référencé par son ID est activé',
  {
    :id => ["ID de la zone de texte", :Fixnum],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_active?' 

# AUTOGenerated for textfield_get_value
link_method_documentation 'Command.textfield_get_value', 
  'Renvoi la valeur de la zone de texte référencé par son ID',
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
  'Renvoi true si la souris survol le champ de texte référencé par son ID, false sinon',
  {
    :id => ["ID de la zone de texte", :Fixnum],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_hover?' 

# AUTOGenerated for textfield_click?
link_method_documentation 'Command.textfield_click?', 
  'Renvoi true si la souris clique sur le champ de texte référencé par son ID, false sinon',
  {
    :id => ["ID de la zone de texte", :Fixnum],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_click?' 

# AUTOGenerated for textfield_press?
link_method_documentation 'Command.textfield_press?', 
  'Renvoi true si la souris est pressée en continu sur le champ de texte référencé par son ID, false sinon',
  {
    :id => ["ID de la zone de texte", :Fixnum],
    :"*key" => ["Boutton de la souris, par défaut :mouse_left", :Key],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_press?' 

# AUTOGenerated for textfield_release?
link_method_documentation 'Command.textfield_release?', 
  'Renvoi true si la souris est relâchée sur le champ de texte référencé par son ID, false sinon',
  {
    :id => ["ID de la zone de texte", :Fixnum],
    :"*key" => ["Boutton de la souris, par défaut :mouse_left", :Key],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_release?' 

# AUTOGenerated for textfield_trigger?
link_method_documentation 'Command.textfield_trigger?', 
  'Renvoi true si la souris clique une fois sur le champ de texte référencé par son ID, false sinon',
  {
    :id => ["ID de la zone de texte", :Fixnum],
    :"*key" => ["Boutton de la souris, par défaut :mouse_left", :Key],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_trigger?' 

# AUTOGenerated for textfield_repeat?
link_method_documentation 'Command.textfield_repeat?', 
  'Renvoi true si la souris clique répétitivement sur le champ de texte référencé par son ID, false sinon',
  {
    :id => ["ID de la zone de texte", :Fixnum],
    :"*key" => ["Boutton de la souris, par défaut :mouse_left", :Key],

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
  'Renvoi true si le champ de texte référencé par son ID est visible, false sinon',
  {
    :id => ["ID de la zone de texte", :Fixnum],

  }, true
register_command :textfield, 'Command.textfield_visible?' 

# AUTOGenerated for textfield_opacity
link_method_documentation 'Command.textfield_opacity', 
  'Change l\'opacité du champ de texte référencé par son ID',
  {
    :id => ["ID de la zone de texte", :Fixnum],
    :opacity => ["Opacité, si aucune opacité n'est donnée, la commande renverra la valeur de l'opacité du champ", :Fixnum],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_opacity' 

# AUTOGenerated for message_height
link_method_documentation 'Command.message_height', 
  'Change le nombre de ligne affichage dans les messages (Commande Event Afficher message)',
  {
    :n => ["Nombre de ligne visibles", :Fixnum],

  }
register_command :standard, 'Command.message_height' 

# # AUTOGenerated for bind
# link_method_documentation 'Command.bind', 
#   'Associe un micro_event à un sélecteur',
#   {
#     :e => ["Sélecteur d'évènements", :Selecteur],
#     :"*args" => ["Voir l'explication référente aux micro_event dans la documentation", :Args],
#     :"&block" => ["Action a exécuter", :Block],

#   }
# register_command :micro, 'Command.bind' 

# # AUTOGenerated for unbind
# link_method_documentation 'Command.unbind', 
#   'Désassocie un micro_evenement d\'un sélecteur d`\'évènements',
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
  'Renvoi le texte contenu dans le presse-papier',
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
  'Renvoie true si une manette est branchée dans le port référencée par son ID, false sinon',
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
	'Change l\'aparence du héros référencé par son ID',
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
	'Efface les événements de la map référencer par le sélécteur IDS',
 	{
		:id => ["IDS des événements", :Selector],

	}
register_command :event, 'Command.event_erase' 

# AUTOGenerated for show_animation
link_method_documentation 'Command.show_animation', 
	'Joue une animation sur les événements référencé par le selecteur IDS',
 	{
		:ids => ["IDS des événements", :Selector],
		:id_animation => ["ID de l'animation", :Fixnum],
		:"*wait_flag" => ["attend la fin si true", :string],

	}
register_command :event, 'Command.show_animation' 

# AUTOGenerated for show_balloon
link_method_documentation 'Command.show_balloon', 
	'Joue une émoticone sur les événements référencé par le selecteur IDS',
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
  'Modifie la vitesse des événements référencés par leur Ids',
  {
    :ids => ["ID des événements", :Selector],
    :v => ["Vitesse des événements", :Fixnum],

  }
register_command :event, 'Command.event_move_speed' 

# AUTOGenerated for player_move_speed
link_method_documentation 'Command.player_move_speed', 
  'Modifie la vitesse du joueur',
  {
    :v => ["Vitesses du joueur", :Fixnum],

  }
register_command :event, 'Command.player_move_speed' 

# AUTOGenerated for event_move_frequency
link_method_documentation 'Command.event_move_frequency', 
  'Modifie la fréquence des événements référencés par leur Ids',
  {
    :ids => ["ID des événements", :Selector],
    :f => ["Fréquence des événements", :Fixnum],

  }
register_command :event, 'Command.event_move_frequency' 

# AUTOGenerated for player_move_frequency
link_method_documentation 'Command.player_move_frequency', 
  'Modifie la fréquence du joueur',
  {
    :f => ["Fréquence du joueur", :Fixnum],

  }
register_command :event, 'Command.player_move_frequency' 

# AUTOGenerated for event_move_speed_frequency
link_method_documentation 'Command.event_move_speed_frequency', 
  'Change la vitesse et la fréquence des événements référencer par le ids',
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


end

## Documentation generator
if $TEST
  DocGenerator.markdown("../doc") 
  DocGenerator.html("../doc/HTML") 
  DocGenerator::Checker.run("../doc_report.csv", "../doc_generated.rb", "../ee4_report.tsv")
end
