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
                            "Délègue à une méthode ou un attribut une méthode",
                            {
                              :obj      => ["Attribut ou méthode à pointer", :Symbol], 
                              :method   => ["Méthode à appeler", :Symbol],
                              :m_alias  => ["Alias de la méthode, peut être ommis", :Symbol]
                            }
  link_method_documentation :"Object.delegate_accessor", 
                            "Délègue à une méthode les accesseurs, mutateurs d'un attribut",
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
                            et la valeur est la valeur de l'attribut",
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
                            "Renvoie tous les entier d'une chaine de caractère",
                            {}, true
  link_method_documentation :"self.damerau_levenshtein",  
                            "Renvoie la distance de Damerau Levenshtein avec 
                            une autre chaine",
                            {:oth => ["Autre chaine à comparer", :String]}, true

  link_method_documentation :"self.stretch", 
                            "Injecte des retours à la ligne dans la chaine", 
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
                            "Change les coordonnées du point ", 
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
                          "Renvoie true si le clavier est au moment de l'appel en majuscule, false sinon",
                          {}, true
  link_method_documentation "Keyboard.caps_lock?", 
                          "Renvoie true si le clavier est au moment de l'appel en mode CAPS_LOCK, false sinon",
                          {}, true
  link_method_documentation "Keyboard.num_lock?", 
                          "Renvoie true si le clavier est au moment de l'appel en mode NUM_LOCK, false sinon",
                          {}, true
  link_method_documentation "Keyboard.scroll_lock?", 
                          "Renvoie true si le clavier est au moment de l'appel en mode SCROLL_LOCK, false sinon",
                          {}, true
  link_method_documentation "Keyboard.alt_gr?", 
                          "Renvoie true si la combinaison ALT_GR est en cours au moment de l'appel, false sinon",
                          {}, true
  link_method_documentation "Keyboard.ctrl?", 
                          "Renvoie true si une combinaison CTRL+key est exécutée, false sinon",
                          {:key => ["Symbole référençant la touche (cf:attributs) mise en combinaison", :Symbol]}, 
                          true

end

## Documentation generator
DocGenerator.markdown("../doc") if $TEST
exit
