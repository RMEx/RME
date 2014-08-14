#==============================================================================
# ** RME V1.0.0 Doc
#------------------------------------------------------------------------------
#  With : 
# Nuki
# Raho 
# Grim
# Hiino
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
  link_method_documentation "Keyboard.current_char", 
                          "Renvoie le caractère actuel pressé par le clavier",
                          {}, true
  link_method_documentation "Keyboard.current_digit", 
                          "Renvoie le chiffre actuel pressé par le clavier",
                          {}, true
  link_method_documentation "Keyboard.maj?", 
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
  link_method_documentation "Mouse.point", 
                          "Renvoie un point (possédant les attributs x, y) référençant la position de la souris en carrés (cases) par rapport à l'écran",
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
  link_class_documentation "Collection des commandes EventExtender"
    link_method_documentation "Command.random", 
                          "Renvoie un nombre aléatoire compris entre MIN et MAX",
                          {
                            :min => ["Borne minimale", :Fixnum],
                            :max => ["Borne maximale (à noter que si cet argument n'est pas spécifié, le résultat sera compris entre 0 et min)", :Fixnum]
                          }, true
    link_method_documentation "Command.map_id", 
                          "Renvoie l'ID de la map en cours",
                          {}, true
    link_method_documentation "Command.map_name", 
                          "Renvoie le nom de la map en cours",
                          {}, true
    link_method_documentation "Command.id_at", 
                          "Renvoie l'ID de l'évènement pointé par les coordonnées X,Y (0 si c'est le héros, -1 s'il n'y en a pas)",
                          {
                            :x => ["Coordonnées X de la case", :Fixnum],
                            :y => ["Coordonnées Y de la case", :Fixnum]
                          }, true
    link_method_documentation "Command.terrain_tag", 
                          "Renvoie le tag du terrain de la case pointée par les coordonnées X,Y",
                          {
                            :x => ["Coordonnées X de la case", :Fixnum],
                            :y => ["Coordonnées Y de la case", :Fixnum]
                          }, true
    link_method_documentation "Command.tile_id", 
                          "Renvoie l'ID de la tile pointée par les coordonnées X,Y",
                          {
                            :x => ["Coordonnées X de la case", :Fixnum],
                            :y => ["Coordonnées Y de la case", :Fixnum]
                          }, true
    link_method_documentation "Command.region_id", 
                          "Renvoie l'ID de la région pointée par les coordonnées X,Y",
                          {
                            :x => ["Coordonnées X de la case", :Fixnum],
                            :y => ["Coordonnées Y de la case", :Fixnum]
                          }, true
    link_method_documentation "Command.square_passable?", 
                          "Renvoie true si la case référencée par X, Y est passable dans la direction référencée par direction, false sinon",
                          {
                            :x => ["Coordonnées X de la case", :Fixnum],
                            :y => ["Coordonnées Y de la case", :Fixnum],
                            :direction => ["Direction (2,4,6,8)", :Fixnum]
                          }, true
    link_method_documentation "Command.percent", 
                          "Renvoie le pourcentage de value par rapport à max",
                          {
                            :value => ["Valeur à transformer", :Fixnum],
                            :max => ["Valeur maximum", :Fixnum]
                          }, true
    link_snippet("Command.percent", "Command.percent(40, 80) # Renvoie 50 (parce que 40 = 50% de 80)")
    link_method_documentation "Command.apply_percent", 
                          "Applique percent à max",
                          {
                            :percent => ["Valeur à appliquer", :Fixnum],
                            :max => ["Valeur maximum", :Fixnum]
                          }, true
    link_snippet("Command.apply_percent", "Command.apply_percent(50, 80) # Renvoie 40 (parce que 50% de 80 = 40)")


end

## Documentation generator
DocGenerator.markdown("../doc") if $TEST

