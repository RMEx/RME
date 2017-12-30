# -*- coding: utf-8 -*-
#==============================================================================
#  Event Printer - RPG Maker VXace
#------------------------------------------------------------------------------
#  Version 1.3.2 - 21/05/2015
#      - Fix little lag on the title screen
#  Version 1.3.1 - 06/05/2015
#      - Add class 'event_code' to HTML and BBcode outputs
#  Version 1.3 - 04/11/2013
#      - Bugfix on conditions variable - variable. Second variable wasn't the good one
#  Version 1.2 - 18/05/2013
#      - Changes to BBcode/HTML (for BilouCorp)
#  Version 1.1 - 25/04/2013
#      - Bugfix
#      - BBcode is now 100% BBcode (Thanks to Joke - Biloucorp)
#  Version 1.0 - 23/04/2013
#      - Original Release VXace
#------------------------------------------------------------------------------
#  Special thanks to Nuki, Grim (and the other members of Funkywork)
#------------------------------------------------------------------------------
# This system is designed to transform en event from RPG maker to a textual representation
# Two type of output are usable. You can chose to print it in a file or you can put this into your clipboard
# Three output format are available : raw (only text), BBcode and HTML.
#
#   You can change colors into the Theme module
#   Only accessible in test mode.
#------------------------------------------------------------------------------
# - How to use depending your level :
#      - Newbie            Just launch SceneManager.call(EventPrinter::Scene) or press F5 on title screen
#
#      - Programmer   You can build event with the build method EventPrinter::Event / CommonEvent / BattleEvent
#           Example : EventPrinter::CommonEvent.build(id_event, id_map)
#             (you always need a map id (reference to event names)
#            Then you can use print_raw, print_bbcode, print_html, copy_raw, copy_bbcode, copy_html
#
#      - Nuki                 No. Don't use this Nuki
#==============================================================================
if $TEST
  module EventPrinter
    #==============================================================================
    # ** Theme module
    #==============================================================================
    module Theme
      #--------------------------------------------------------------------------
      # ** Get a certain color
      #--------------------------------------------------------------------------
      def self.get_color(color)
        self.const_get(color.to_s.capitalize.intern)
      end
      #---------------------------------------------------------------------------------------------
      # * Color constants
      #---------------------------------------------------------------------------------------------
      Nothing = "#FFFFFF"
      Standard = "#000000"
      Function = "#0000FF"
      Events = "#800000"
      Comments = "#00A000"
      Musics = "#008080"
      Battle = "#9000D0"
      Game = "#2090FF"
      Parameters = "#A0A0A0"
      Text = "#000080"
      Variables = "#FF0000"
      Pictures = "#800080"
      Manage = "#DC6E00"
      System = "#FF00FF"
      Script = "#808080"
      Graphics = "#FF00A0"
      Wait = "#C03000"
    end
    # End of Theme  ------------------------------------------------------------------------------------------------
    #==============================================================================
    # ** Vocab module
    #==============================================================================
    module Vocab
      #--------------------------------------------------------------------------
      # Commands Vocab
      #--------------------------------------------------------------------------
      # Misc
      Name = "[%s]"
      Group = "%04d..%04d"
      VariableName = "%04d:%s"
      MoreOrLess = ["ou plus", "ou moins"]
      Command = "| >"
      Vehicle = ["Radeau", "Bateau", "Vaisseau"]
      Operators = ["=", "+=", "-=", "*=", "/=", "%="]
      Wait = "Attendre : %d Frames"
      SwitchOnOff = ["Désactiver", "Activer"]
      WaitEnd = ", Attendre"

      # Battlers
      Attributes = ["Niveau", "Expérience", "PV", "PM", "PV Maximum", "PM Maximum",
              "Attaque", "Défense", "Magie", "Déf. Magique", "Agilité", "Chance"]

      # Evenements
      HeroEvent = "Héros"
      ThisEvent = "Cet événement"

      # Dialogues
      Message =  "Message :"
      MessageParams = "%s, %s, %s, %s"
      MessagePosition = ["Bas", "Milleu", "Haut"]
      MessageDisplay = ["Normal", "Transparent", "Sombre"]
      Void = "Ø"

      Choices = "Afficher Choix :"
      Choice = "Si %s - Faire"
      CancelChoice = "Annulation"
      EndChoice = "Fin - Choix"

      GetVar = "Entrer un Nombre - Stocker dans la variable %s, %d Chiffre(s)"

      SelectItem = "Sélection d'un objet : %s"

      DisplayScrollingText = "Afficher un texte défilant :"
      ScrollSpeed = "Vitesse %d"
      DisableFastForward = ", Désactiver l'avance rapide"

      # Operations on variables
      Operation = "Opération :"

      Switch = "Interrupteur"
      LocalSwitch = "Interrupteur local"
      OnOff = ["Activé", "Désactivé"]

      Variable = "Variable"
      ValueOfVariable = "(la valeur de la variable %s)"
      RandomValue = "(valeur aléatoire entre %d et %d)"
      NumberOf = "%s possédés"
      EventParam = ["Coordonée X", "Coordonée Y", "Direction", "Coordonée X à l'écran", "Coordonée Y à l'écran"]
      OtherVariable = ["ID de la carte", "Nombre de personnage dans l'équipe", "Argent possédé",
            "Nombre total de pas", "Temps de jeu", "Chronomètre", "Nombre de sauvegardes", "Nombre de combats"]
      IdOfAMember = "ID du %s membre"
      OrdinalNumber = ["1er", "2ème", "3ème", "4ème", "5ème", "6ème", "7ème", "8ème"]

      Chronometer = "Gestion  du Chronomètre :"
      LeChronometer = "le Chronomètre est"
      Time = "à %d Minutes et %d Secondes"
      Start = "Démarrer (" + Time + ")"
      Stop = "Arrêter"

      # Conditions
      Condition = "Condition :"
      ComparationOperator = ["==", ">=", "<=", ">", "<", "!="]
      HeroConditions = ["est dans l'équipe", "a pour nom '%s'", "a comme classe %s", "a la compétence %s",
          "est équipé avec l'arme %s", "est équipé avec l'armure %s", "est sous l'effet de statut %s"]
      MoneyCondition = "l'argent possédé est de %d %s"
      ItemCondition = "l'objet %s est possédé"
      WeaponCondition = "l'arme %s est possédée%s"
      ArmorCondition = "l'armure %s est possédée%s"
      OrEquipped = ", ou équipée"
      KeyCondition = "la touche %s est pressée"
      VehicleCondition = "le véhicule [%s] est utilisé"
      Present = "est présent"
      ScriptCondition = "Script : %s"
      Else = "Sinon"
      EndCondition = "Fin - Condition"

      # Functions
      CommonEventCall = "Appeler Événement Commun :"

      Loop = "Boucle"
      EndLoop = "Fin - Boucle"
      ExitLoop = "Sortir de la Boucle"

      Goto = "Étiquette :"
      GotoCall = "Aller à l'Étiquette :"

      StopEvents = "Arrêter les évènements"

      Comment = "Commentaire :"


      # Music / Video
      Music = "'%s', Volume : %d, Tempo : %d"
      BGM = "Jouer BGM :"
      MemorizeBGM = "Mémoriser la musique (BGM)"
      RestartBGM = "Reprendre la musique (BGM)"
      BGS = "Jouer BGS :"
      ME = "Jouer ME :"
      SE = "Jouer SE :"
      StopBGM = "Arrêter en fondu de la BGM : %s Secondes"
      StopBGS = "Arrêter en fondu du BGS : %s Secondes"
      StopSE = "Arrêter SE"
      PlayVideo = "Jouer une vidéo : '%s'"

      # Battle
      Battle = "Démarrer un combat : %s"
      BattleIndexed = "(Indexé par [%04d])"
      IfVictory = "Si Victoire - Faire"
      IfFlee = "Si Fuite - Faire"
      IfLoss = "Si Défaite - Faire"
      EndBattle = "Fin - Combat"
      AllEnemies = "Tous les ennemis"
      Enemy = "[%d. %s]"

      # Game
      Shop = "Appeler magasin :"
      EnterName = "Enter le nom d'un personnage : %s, %d Lettres"
      OpenMenu = "Ouvrir le menu principal"
      OpenSave = "Ouvrir le menu de sauvegarde"
      GameOver = "Game Over"
      ToTitle = "Retourner à l'écran titre"

      # System
      ModifyBGM = "Modifier BGM de combat :"
      ModifyME = "Modifier ME de victoire :"
      ModifiySave = "Modifier l'accès aux sauvegardes :"
      ModifiyMenu = "Modifier l'accès au menu :"
      ModifiyEncounter = "Modifier les rencontres :"
      ModifiyFormation = "Formation de l'équipe :"
      WindowColor = "Affichage du nom de la carte : %s"
      ModifyHeroAppearance = "Modifier Apparence Personnage : %s, Charset:'%s', 0, Faceset:'%s', 0"
      ModifyVehicleAppearance = "Modifier Apparence Véhicule : [%s], '%s', 0"

      # Script
      ScriptCall = "Appeler Script :"

      # Manage
      WholeTeam = "Équipe Entière"
      ModifyMoney = "Modifier Argent :"
      ModifyItem = "Modifier Objet :"
      ModifyWeapon = "Modifier Armes :"
      ModifyArmor = "Modifier Armures :"
      ModifyParty = "Modifier l'équipe :"
      ModifyTextWithIncluded = "%s, Inclure l'équipement"
      ModifyPartyTextWithReset = "%s, Démarre au niveau initial"
      ModifyHP = "Modifier PV :"
      ModifyMP = "Modifier PM :"
      ModifyStatus = "Modifier Status : %s,"
      Recover = "Récupération complète :"
      ModifyExperience = "Modifier Expérience : %s,"
      ModifyLevel = "Modifier Niveau : %s,"
      ModifyParameters = "Modifier Caractéristique : %s,"
      ModifySkill = "Modifier Compétence : %s,"
      ModifyEquipement = "Modifier Équipement : %s,"
      ModifyHeroName = "Modifier Nom Personnnage : %s,"
      ModifyHeroAlias = "Modifier Surnom Personnnage : %s,"
      ModifyHeroClass = "Modifier Classe Personnage : %s,"
      RestoreEnemy = "Récupération Complète - "
      PlusOrMinus = ["+", "-"]
      AddOrRemove = ["Ajouter", "Retirer"]
      Equipement = ["Armes", "Bouclier", "Casque", "Armure", "Accessoire"]

      # Battle
      ModifyHPEnemy = "Modifier PV - Ennemi : %s,"
      ModifyMPEnemy = "Modifier PM - Ennemi  : %s,"
      ModifyStatusEnemy = "Modifier Status - Ennemi : %s,"
      RecoverEnemy = "Récupération Complète - Ennemi : %s"
      RevealEnemy = "Apparition ennemi caché : %s"
      MorphEnemy = "Transformer l'ennemi : %s en %s"
      DisplayBattleAnimation = "Afficher animation de combat : %s,"
      Battler = "Personnage n°%d"
      LastTarget = "Dernière Cible"
      RandomTarget = "Cible Aléatoire"
      Target = "Cible n°%d"
      ForceAction = "Forcer action : %s, %s, %s"
      EndTheBattle = "Terminer le combat"

      # Warp
      Warp = "Téléporter l'équipe :"
      PlaceVehicle = "Placer véhicule :"
      PlaceEvent = "Placer événement : %s, %s"
      SwapPositions = "échanger la position avec [%s]"
      Position = ["(X: %03d, Y: %03d)", "X: [%04d], Y: [%04d]", "échanger la position avec %s"]

      # Deplacement
      IsLooking = "Regarde vers"
      Direction = {0 => "", 2 => ", le Bas", 4 => ", la Gauche", 6 => ", la Droite", 8 => ", le Haut"}

      # Input
      Inputs = { 2 =>"Bas", 4 => "Gauche", 6 => "Droite", 8 => "Haut", 11 => "A", 12 => "B", 13 => "C", 14 => "X",
          15 => "Y", 16 => "Z", 17 => "L", 18 => "R" }

      # Move route
      MoveEvent = "Déplacer évènement :"
      MoveRouteParams = ["Répéter", "Ignorer action impossible", "Attendre la fin"]
      MoveRouteCommands = ["", "Un pas vers le Bas", "Un pas vers la Gauche", "Un pas vers la Droite",
      "Un pas vers le Haut", "Un pas vers Bas-Gauche", "Un pas vers Bas-Droite", "Un pas vers Haut-Gauche",
      "Un pas vers Haut-Droite", "Un pas au Hasard", "Un pas vers le Héros",  "Fuis le héros d'un pas",
      "Un pas en Avant",  "Un pas en Arrière", "Saut : %s en X, %s en Y", "Attendre : %d Frames",
      "Regarde vers le Bas", "Regarde vers la Gauche", "Regarde vers la Droite", "Regarde vers le Haut",
      "Quart de tour à Droite", "Quart de tour à Gauche", "Demi tour", "Quart de tour au Hasard",
      "Regarde Direction Aléat.", "Regarde vers le héros", "Se détourne du héros", "Active Inter. : %04d",
      "Désactive Inter. : %04d", "Modifier Vitesse. : %d", "Modifier Fréquence : %d", "Marche animée ON",
      "Marche animée OFF", "Animé à l'arrêt ON", "Animé à l'arrêt OFF", "Direction fixe ON", "Direction fixe OFF",
      "Passe-muraille ON", "Passe-muraille OFF", "Transparent ON", "Transparent OFF", "Modifier charset : %s",
      "Modifier opacité : %d", "Modifier transp. : %s", "Jouer un SE : %s",
      "Appeller Script : %s"]

      # Visual
      Caterpillar = "Chenille :"
      RegroupCaterpillar = "Regrouper la chenille"
      Transparency = ["Normale", "Éclaircie", "Obscurcie"]
      ScrollMap = "Faire défiler la carte vers"
      ScrollMapParams = "de %d carreaux, vitesse %d"
      EnterExitVehicle = "Entrer/Sortir du véhicule"

      Opacity = ["Transparent", "Opaque"]
      SetOpacity = "Transparence du héros :"
      DisplayAnimation = "Afficher une animation : Cible - %s,"
      DisplayEmote = "Afficher une émoticône : Cible - %s,"
      DeleteEvent = "Effacer cet événement"
      Emotes = ["Exclamation", "Interrogation", "Note de Musique", "Coeur", "Colère",
        "Goute", "Toile", "Silence", "Ampoule", "Zzz"]

      # Appearance
      None = "(aucun)"

      # Visual Effects
      Color = ["(R:%d,V:%d,B:%d,I:%d)", "(R:%d,V:%d,B:%d)"]
      Tone = "(R:%d,V:%d,B:%d,G:%d)"
      FadeIn = "Effacer l'écran en fondu"
      FadeOut = "Afficher l'écran en fondu"
      ScreenTone = "Ton de l'écran : %s, %d Frames%s"
      FlashScreen = "Flasher l'écran : %s, %d Frames%s"
      ShakeScreen = "Secouer l'écran : Force %d, Vitesse %d, %d Frames%s"

      # Pictures
      DisplayPicture = "Afficher une image : %d, '%s', %s %s, (%d%%,%d%%), %d, %s"
      MovePicture = "Afficher une image : %d, '%s', %s %s, (%d%%,%d%%), %d, %s, %d Frames%s"
      PositionPicture = [["H.G.", "Ctre"], ["(%d,%d)", "(X:[%04d], Y:[%04d])"]]
      RotatePicture = "Rotation Image : %d, Vitesse %s%d"
      TonePicture = "Ton Image : %d, %s, %d Frames%s"
      DeletePicture = "Effacer Image : %d"
      WeatherEffect = "Effet Météorologique : %s, %d Frames%s"
      Weather = {none: "Aucun", rain: "Pluie, %d", storm: "Orage, %d", snow: "Neige, %d"}

      # Graphics
      DisplayMapName = "Affichage du nom de la carte :"
      ChangeTileset = "Changer de tileset :"
      ChangeBattleBack = ["Changer le fond de combat : %s", "Changer le fond de combat : %s & %s"]
      ChangePanorama = "Changer de panorama : '%s'"
      GetInformation = "Récupérer des informations : [%04d], %s,"
      GetInformationCoord = ["(%03d,%03d)", "Variable [%04d][%04d]"]


      #--------------------------------------------------------------------------
      # Window Vocab
      #--------------------------------------------------------------------------
      module Windows
        # Helper text for scene
        Helper = ["Choisissez la map", "Choisissez le type", "Choisissez l'évènement", "Choisissez la page",
          "Choisissez l'action à effectuer"]
        # WindowType content
        Types = {map: "Events", common: "Events commun", battle: "Events de combat"}
        # WindowMode content
        Modes = {print_raw: "En brut - Dans un fichier", copy_raw: "En brut - Dans le presse-papier",
                print_bbcode: "En BBcode - Dans un fichier", copy_bbcode: "En BBcode - Dans le presse-papier",
                print_html: "En HTML - Dans un fichier", copy_html: "En HTML - Dans le presse-papier"}
        # Page Name for WindowPage
        PageName = "Page n°%03d"
        # Event Name for WindowEvent
        EventName = "[%03d]%s"
      end
    end
    # End of Vocab  ------------------------------------------------------------------------------------------------
    module Utilities
      extend self
      def replace_link(x)
        #DocGenerator::Checker.documented_methods.each do |meth|
        #  x = x.gsub(/(\W)(#{meth.to_s})(\W+)/m, '\1<a data-cmd=\'\2\' class=\'btn_go\' href=\'#\2\'>\2</a>\3')
        #  x = x.gsub(/(#{meth.to_s})/m, '<a data-cmd=\'\1\' class=\'btn_go\' href=\'#\1\'>\1</a>\2')
        #end
        return x
      end

      #--------------------------------------------------------------------------
      # * Get switch name
      #--------------------------------------------------------------------------
      def switch_name(id)
        return name(sprintf("%04d", id))if !$data_system || $data_system.switches[id] == ""
        name(sprintf(Vocab::VariableName, id, $data_system.switches[id]))
      end
      #--------------------------------------------------------------------------
      # * Get variable name
      #--------------------------------------------------------------------------
      def variable_name(id)
        return name(sprintf("%04d", id)) if !$data_system || $data_system.variables[id] == ""
        name(sprintf(Vocab::VariableName, id, $data_system.variables[id]))
      end
      #--------------------------------------------------------------------------
      # * Get the variable name
      #--------------------------------------------------------------------------
      def la_variable(id)
        Vocab::Variable + " " + variable_name(id)
      end
      #--------------------------------------------------------------------------
      # * Get group name
      def group_name(id1, id2)
        name(sprintf(Vocab::Group, id1, id2))
      end
      #--------------------------------------------------------------------------
      # * Get group or uniq variable
      #--------------------------------------------------------------------------
      def group_or_uniq(id1, id2, switch = true)
        if id1 == id2
          switch ? switch_name(id1) : variable_name(id1)
        else
          group_name(id1, id2)
        end
      end
      #--------------------------------------------------------------------------
      # * Get Event Name
      #--------------------------------------------------------------------------
      def event_name(id, map)
        case id
        when -1; Vocab::HeroEvent
        when 0; Vocab::ThisEvent
        else; sprintf(Vocab::Name, map.events[id].name)
        end
      end
      #--------------------------------------------------------------------------
      # * Get the map name
      #--------------------------------------------------------------------------
      def map_name(id)
        (load_data("Data/MapInfos.rvdata2").find { |map| map[1].parent_id = id })[1].name
      end
      #--------------------------------------------------------------------------
      # * Get hero name
      #--------------------------------------------------------------------------
      def tileset_name(id)
        $data_tilesets[id].name
      end
      #--------------------------------------------------------------------------
      # * Get hero name
      #--------------------------------------------------------------------------
      def hero_name(id)
        id == 0 ? Vocab::WholeTeam : name($data_actors[id].name)
      end
      #--------------------------------------------------------------------------
      # * Get class name
      #--------------------------------------------------------------------------
      def class_name(id)
        name($data_classes[id].name)
      end
      #--------------------------------------------------------------------------
      # * Get a foe name (in battle)
      def foe_name(id, event)
        return Vocab::AllEnemies if id == -1
        sprintf(Vocab::Enemy, id + 1, event.troop.empty? ? "" : enemy_name(event.troop[id].enemy_id, false))
      end
      #--------------------------------------------------------------------------
      # * Get a certain type of item name
      #   **(type : 0 => Item, 1 => Weapon, 2 => Armor)
      #--------------------------------------------------------------------------
       def base_item_name(type, id)
        type == 0 ? item_name(id) : equipement_name(type-1, id)
      end
      #--------------------------------------------------------------------------
      # * Get item name
      #--------------------------------------------------------------------------
      def item_name(id)
        name($data_items[id].name)
      end
      #--------------------------------------------------------------------------
      # * Get skill name
      #--------------------------------------------------------------------------
      def skill_name(id)
        name($data_skills[id].name)
      end
      #--------------------------------------------------------------------------
      # * Get an certain type of equipement name
      #--------------------------------------------------------------------------
      def equipement_name(type, id)
        return Vocab::None if id == 0
        type == 0 ? weapon_name(id) : armor_name(id)
      end
      #--------------------------------------------------------------------------
      # * Get weapon name
      #--------------------------------------------------------------------------
      def weapon_name(id)
       name($data_weapons[id].name)
      end
      #--------------------------------------------------------------------------
      # * Get armor name
      #--------------------------------------------------------------------------
      def armor_name(id)
       name($data_armors[id].name)
      end
      #--------------------------------------------------------------------------
      # * Get state name
      #--------------------------------------------------------------------------
      def state_name(id)
        name($data_states[id].name)
      end
      #--------------------------------------------------------------------------
      # * Get common event name
      #--------------------------------------------------------------------------
      def common_event_name(id)
        name($data_common_events[id].name)
      end
      #--------------------------------------------------------------------------
      # * Get animation name
      #--------------------------------------------------------------------------
      def animation_name(id)
        name($data_animations[id].name)
      end
      #--------------------------------------------------------------------------
      # * Get enemy name
      #--------------------------------------------------------------------------
      def enemy_name(id, with_brackets = true)
        with_brackets ? name($data_enemies[id].name)  : $data_enemies[id].name
      end
      #--------------------------------------------------------------------------
      # * Put the string between [ and ]
      #--------------------------------------------------------------------------
      def name(string)
        sprintf(Vocab::Name, string)
      end
      #--------------------------------------------------------------------------
      # * Get a target's name
      #--------------------------------------------------------------------------
      def target_name(id)
        case id
        when -2;  Vocab::LastTarget
        when -1;  Vocab::RandomTarget;
        else;     sprintf(Vocab::Target, id+1); end
      end
    end
    # End of Utilitities  ------------------------------------------------------------------------------------------------
    #==============================================================================
    # ** EventCommand
    #------------------------------------------------------------------------------
    #  Handle the conversion form code, indent and parameters to a representation
    #==============================================================================
    class EventCommand
      #--------------------------------------------------------------------------
      # * Public Instance Variables
      #--------------------------------------------------------------------------
      attr_reader :event
      #--------------------------------------------------------------------------
      # * Hash which convert event command to a array representation
      #     ** Lambdas => should return a array like :
      #        [ true|false (Put the > or not)
      #           {color: :some_color_symbol, text: "Some text" }
      #           {color: :some_other_color_symbol, text: "Some other text" } ]
      #--------------------------------------------------------------------------
      CommandHash = {
        0 => ->(params, event){ [true] },
        101 => ->(params, event){ [true,
          {color: :standard,    text: EventPrinter::Vocab::Message},
          {color: :parameters, text: sprintf(EventPrinter::Vocab::MessageParams,
            params[0].empty? ? EventPrinter::Vocab::Void : "'#{params[0]}'", params[0].empty? ?
            EventPrinter::Vocab::Void : params[1].to_s, EventPrinter::Vocab::MessageDisplay[params[2]],
            EventPrinter::Vocab::MessagePosition[params[3]])}
          ]},
        102 => ->(params, event){ [true,
          {color: :standard, text: EventPrinter::Vocab::Choices},
          {color: :text,           text: params[0].join(", ")}] },
        103 => ->(params, event){ [true,
          {color: :standard, text: sprintf(EventPrinter::Vocab::GetVar,
            EventPrinter::Utilities::variable_name(params[0]), params[1])}] },
        104 => ->(params, event){ [true,
          {color: :standard, text: sprintf(EventPrinter::Vocab::SelectItem,
            EventPrinter::Utilities::variable_name(params[0]))}] },
        105 => ->(params, event){ [true,
          {color: :standard, text: EventPrinter::Vocab::DisplayScrollingText},
          {color: :parameters, text: sprintf(EventPrinter::Vocab::ScrollSpeed, params[0])},
          {color: :parameters, text: (params[1] ? EventPrinter::Vocab::DisableFastForward : "")}] },
        108 => ->(params, event){ [true,
          {color: :comments, text: EventPrinter::Vocab::Comment},
          {color: :comments, text: EventPrinter::Utilities.replace_link(params[0])}] },
        111 => ->(params, event){ [true,
          {color: :function, text: EventPrinter::Vocab::Condition},
          {color: :function, text: ConditionArray[params[0]].call(params[1..-1], event) }]},
        112 => ->(params, event){ [true,
          {color: :function, text: EventPrinter::Vocab::Loop}]},
        113 => ->(params, event){ [true,
          {color: :function, text: EventPrinter::Vocab::ExitLoop}]},
        115 => lambda { |params, event| [true,
          {:color => :function, :text => EventPrinter::Vocab::StopEvents}]},
        117 => ->(params, event){ [true,
          {color: :function, text: EventPrinter::Vocab::CommonEventCall},
          {color: :function, text: EventPrinter::Utilities::common_event_name(params[0])}
          ]},
        118 => ->(params, event){ [true,
          {color: :function, text: EventPrinter::Vocab::Goto},
          {color: :function, text: params[0]}
          ]},
        119 => ->(params, event){ [true,
          {color: :function, text: EventPrinter::Vocab::GotoCall},
          {color: :function, text: params[0]}
          ]},
        121 => ->(params, event){ [true,
          {color: :variables, text: EventPrinter::Vocab::Operation},
          {color: :variables, text: EventPrinter::Vocab::Switch},
          {color: :variables, text: EventPrinter::Utilities::group_or_uniq(params[0], params[1], true)},
          {color: :variables, text: EventPrinter::Vocab::OnOff[params[2]]}] },
        122 => ->(params, event){ [true,
          {color: :variables, text: EventPrinter::Vocab::Operation},
          {color: :variables, text: EventPrinter::Vocab::Variable},
          {color: :variables, text: EventPrinter::Utilities::group_or_uniq(params[0], params[1], false)},
          {color: :variables, text: EventPrinter::Vocab::Operators[params[2]]},
          {color: :variables, text: EventPrinter::Utilities.replace_link(OperandArray[params[3]].call(params[4..-1], event))} ]},
        123 => ->(params, event){ [true,
          {color: :variables, text: EventPrinter::Vocab::Operation},
          {color: :variables, text: EventPrinter::Vocab::LocalSwitch},
          {color: :variables, text: params[0]},
          {color: :variables, text: EventPrinter::Vocab::Operators[0]},
          {color: :variables, text: EventPrinter::Vocab::OnOff[params[1]]}]},
        124 => ->(params, event){ [true,
          {color: :variables, text: EventPrinter::Vocab::Chronometer},
          {color: :variables, text: params[0] == 0 ? sprintf(EventPrinter::Vocab::Start,
            params[1] / 60, params[1] % 60) : EventPrinter::Vocab::Stop
          }] },
        125 => ->(params, event){ [true,
          {color: :manage, text: EventPrinter::Vocab::ModifyMoney},
          {color: :manage, text: EventPrinter::Vocab::PlusOrMinus[params[0]]},
          {color: :manage, text: params[1] == 0 ? params[2].to_s : EventPrinter::Utilities::la_variable(params[2])}
          ] },
        126 => ->(params, event){ [true,
          {color: :manage, text: EventPrinter::Vocab::ModifyItem},
          {color: :manage, text: EventPrinter::Utilities::item_name(params[0])},
          {color: :manage, text: EventPrinter::Vocab::PlusOrMinus[params[1]]},
          {color: :manage, text: params[2] == 0 ? params[3].to_s : EventPrinter::Utilities::la_variable(params[3])}
          ] },
        127 => ->(params, event){ [true,
          {color: :manage, text: EventPrinter::Vocab::ModifyWeapon},
          {color: :manage, text: EventPrinter::Utilities::weapon_name(params[0])},
          {color: :manage, text: EventPrinter::Vocab::PlusOrMinus[params[1]]},
          {color: :manage, text: sprintf(
            params[1] == 1 && params[4] ? EventPrinter::Vocab::ModifyTextWithIncluded : "%s",
            params[2] == 0 ? params[3].to_s : EventPrinter::Utilities::la_variable(params[3]))}
          ] },
        128 => ->(params, event){ [true,
          {color: :manage, text: EventPrinter::Vocab::ModifyArmor},
          {color: :manage, text: EventPrinter::Utilities::armor_name(params[0])},
          {color: :manage, text: EventPrinter::Vocab::PlusOrMinus[params[1]]},
          {color: :manage, text: sprintf(
            params[1] == 1 && params[4] ? EventPrinter::Vocab::ModifyTextWithIncluded : "%s",
            params[2] == 0 ? params[3].to_s : EventPrinter::Utilities::la_variable(params[3]))}
          ] },
        129 => ->(params, event){ [true,
          {color: :manage, text: EventPrinter::Vocab::ModifyParty},
          {color: :manage, text: EventPrinter::Vocab::AddOrRemove[params[1]]},
          {color: :manage, text: sprintf(
            params[1] == 0 && params[2] == 1 ? EventPrinter::Vocab::ModifyPartyTextWithReset : "%s",
            EventPrinter::Utilities::hero_name(params[0]))}
          ] },
        132 => ->(params, event){ [true,
          {color: :system, text: EventPrinter::Vocab::ModifyBGM},
          {color: :system, text: params[0].to_string_params}
          ] },
        133 => ->(params, event){ [true,
          {color: :system, text: EventPrinter::Vocab::ModifyME},
          {color: :system, text: params[0].to_string_params}
          ] },
        134 => ->(params, event){ [true,
          {color: :system, text: EventPrinter::Vocab::ModifiySave},
          {color: :system, text: EventPrinter::Vocab::SwitchOnOff[params[0]]}
          ] },
        135 => ->(params, event){ [true,
          {color: :system, text: EventPrinter::Vocab::ModifiyMenu},
          {color: :system, text: EventPrinter::Vocab::SwitchOnOff[params[0]]}
          ] },
        136 => ->(params, event){ [true,
          {color: :system, text: EventPrinter::Vocab::ModifiyEncounter},
          {color: :system, text: EventPrinter::Vocab::SwitchOnOff[params[0]]}
          ] },
        137 => ->(params, event){ [true,
          {color: :system, text: EventPrinter::Vocab::ModifiyFormation},
          {color: :system, text: EventPrinter::Vocab::SwitchOnOff[params[0]]}
          ] },
        138 => ->(params, event){ [true,
          {color: :system, text: sprintf(EventPrinter::Vocab::WindowColor, params[0].to_string_params)}
          ] },
        201 => ->(params, event){ [true,
          {color: :events, text: EventPrinter::Vocab::Warp},
          {color: :events, text: WarpText[params[0]].call(params[1..-1]) +
            EventPrinter::Vocab::Direction[params[4]] }
          ] },
        202 => ->(params, event){ [true,
          {color: :events, text: EventPrinter::Vocab::PlaceVehicle},
          {color: :events, text: EventPrinter::Vocab::Vehicle[params[0]]},
          {color: :events, text: WarpText[params[1]].call(params[2..-1])}
        ] },
        203 => ->(params, event){ [true,
          {color: :events, text: (sprintf(EventPrinter::Vocab::PlaceEvent,
            EventPrinter::Utilities::event_name(params[0], event.map), PositionArray[params[1]].call(params[2..-1], event)
            ) + EventPrinter::Vocab::Direction[params[4]])}
        ]},
        204 => ->(params, event){ [true,
          {color: :events, text: EventPrinter::Vocab::ScrollMap},
          {color: :events, text: EventPrinter::Vocab::Direction[params[0]]},
          {color: :events, text: sprintf(EventPrinter::Vocab::ScrollMapParams, *params[1..-1])} ]},
        205 => ->(params, event){ [true,
          {color: :events, text: EventPrinter::Vocab::MoveEvent},
          {color: :events, text: EventPrinter::Utilities::event_name(params[0], event.map)},
          {color: :events, text: params[1].to_string_params } ]},
        206 => ->(params, event){ [true,
          {color: :events, text: EventPrinter::Vocab::EnterExitVehicle}
        ]},
        211 => ->(params, event){ [true,
          {color: :events, text: EventPrinter::Vocab::SetOpacity},
          {color: :events, text: EventPrinter::Vocab::Opacity[params[0]]}
        ]},
        212 => ->(params, event){ [true,
          {color: :events, text: sprintf(EventPrinter::Vocab::DisplayAnimation,
            EventPrinter::Utilities::event_name(params[0], event.map))},
          {color: :events, text: EventPrinter::Utilities::animation_name(params[1])}
        ]},
        213 => ->(params, event){ [true,
          {color: :events, text: sprintf(EventPrinter::Vocab::DisplayEmote,
            EventPrinter::Utilities::event_name(params[0], event.map))},
          {color: :events, text: EventPrinter::Vocab::Emotes[params[1]-1]}
        ]},
        214 => ->(params, event){ [true,
          {color: :events, text: EventPrinter::Vocab::DeleteEvent}
        ]},
        216 => ->(params, event){ [true,
          {color: :events, text: EventPrinter::Vocab::Caterpillar},
          {color: :events, text: EventPrinter::Vocab::OnOff[params[0]]}
        ]},
        217 => ->(params, event){ [true,
          {color: :events, text: EventPrinter::Vocab::RegroupCaterpillar}
        ]},
        221 => ->(params, event){ [true,
          {color: :events, text: EventPrinter::Vocab::FadeIn}
        ]},
        222 => ->(params, event){ [true,
          {color: :events, text: EventPrinter::Vocab::FadeOut}
        ]},
        223 => ->(params, event){ [true,
          {color: :events, text: sprintf(EventPrinter::Vocab::ScreenTone, params[0].to_string_params, params[1],
            params[2] ? EventPrinter::Vocab::WaitEnd : "")}
        ]},
        224 => ->(params, event){ [true,
          {color: :events, text: sprintf(EventPrinter::Vocab::FlashScreen, params[0].to_string_params, params[1],
            params[2] ? EventPrinter::Vocab::WaitEnd : "")}
        ]},
        225 => ->(params, event){ [true,
          {color: :events, text: sprintf(EventPrinter::Vocab::ShakeScreen, params[0], params[1],
            params[2], params[3] ? EventPrinter::Vocab::WaitEnd : "")}
        ]},
        230 => ->(params, event){ [true,
          {color: :wait, text: sprintf(EventPrinter::Vocab::Wait, params[0])}
        ]},
        231 => ->(params, event){ [true,
          {color: :pictures, text: sprintf(EventPrinter::Vocab::DisplayPicture, params[0], params[1],
            EventPrinter::Vocab::PositionPicture[0][params[2]], sprintf(EventPrinter::Vocab::PositionPicture[1][params[3]],
            params[4], params[5]), params[6], params[7], params[8], EventPrinter::Vocab::Transparency[params[9]])}
        ]},
        232 => ->(params, event){ [true,
          {color: :pictures, text: sprintf(EventPrinter::Vocab::MovePicture, params[0], params[1],
            EventPrinter::Vocab::PositionPicture[0][params[2]], sprintf(EventPrinter::Vocab::PositionPicture[1][params[3]],
            params[4], params[5]), params[6], params[7], params[8], EventPrinter::Vocab::Transparency[params[9]],
            params[10], params[11] ? EventPrinter::Vocab::WaitEnd : "")}
        ]},
        233 => ->(params, event){ [true,
          {color: :pictures, text: sprintf(EventPrinter::Vocab::RotatePicture, params[0], params[1] > 0 ? "+" : "",
            params[1])}
        ]},
        234 => ->(params, event){ [true,
          {color: :pictures, text: sprintf(EventPrinter::Vocab::TonePicture, params[0], params[1].to_string_params,
            params[2], params[3] ? EventPrinter::Vocab::WaitEnd : "")}
        ]},
        235 => ->(params, event){ [true,
          {color: :pictures, text: sprintf(EventPrinter::Vocab::DeletePicture, params[0])}
        ]},
        236 => ->(params, event){ [true,
          {color: :pictures, text: sprintf(EventPrinter::Vocab::WeatherEffect,
            sprintf(EventPrinter::Vocab::Weather[params[0]], params[1]), params[2],
            params[3] ? EventPrinter::Vocab::WaitEnd : "")}
        ]},
        241 => ->(params, event){ [true,
          {color: :musics, text: EventPrinter::Vocab::BGM },
          {color: :musics, text: params[0].to_string_params },
        ]},
        242 => ->(params, event){ [true,
          {color: :musics, text: sprintf(EventPrinter::Vocab::StopBGM, params[0]) }
        ]},
        243 => ->(params, event){ [true,
          {color: :musics, text: EventPrinter::Vocab::MemorizeBGM }
        ]},
        244 => ->(params, event){ [true,
          {color: :musics, text: EventPrinter::Vocab::RestartBGM }
        ]},
        245 => ->(params, event){ [true,
          {color: :musics, text: EventPrinter::Vocab::BGS },
          {color: :musics, text: params[0].to_string_params },
        ]},
        246 => ->(params, event){ [true,
          {color: :musics, text: sprintf(EventPrinter::Vocab::StopBGS, params[0]) }
        ]},
        249 => ->(params, event){ [true,
          {color: :musics, text: EventPrinter::Vocab::ME },
          {color: :musics, text: params[0].to_string_params },
        ]},
        250 => ->(params, event){ [true,
          {color: :musics, text: EventPrinter::Vocab::SE },
          {color: :musics, text: params[0].to_string_params },
        ]},
        251 => ->(params, event){ [true,
          {color: :musics, text: EventPrinter::Vocab::StopSE }
        ]},
        261 => ->(params, event){ [true,
          {color: :musics, text: sprintf(EventPrinter::Vocab::PlayVideo, params[0]) }
        ]},
        281 => ->(params, event){ [true,
          {color: :graphics, text: EventPrinter::Vocab::DisplayMapName },
          {color: :graphics, text: EventPrinter::Vocab::OnOff[params[0]]}
        ]},
        282 => ->(params, event){ [true,
          {color: :graphics, text: EventPrinter::Vocab::ChangeTileset },
          {color: :graphics, text: EventPrinter::Utilities::tileset_name(params[0]) }
        ]},
        283 => ->(params, event){ [true,
          {color: :graphics, text: sprintf(EventPrinter::Vocab::ChangeBattleBack[params[1].empty? ? 0 : 1], *params)}
        ]},
        284 => ->(params, event){ [true,
          {color: :graphics, text: sprintf(EventPrinter::Vocab::ChangePanorama, *params)}
        ]},
        285 => ->(params, event){ [true,
          {color: :graphics, text: sprintf(EventPrinter::Vocab::GetInformation, *params)},
          {color: :graphics, text: sprintf(EventPrinter::Vocab::GetInformationCoord[params[2]], *params[3..4])}
        ]},
        301 => ->(params, event){ [true,
          {color: :game, text: sprintf(EventPrinter::Vocab::Battle, params[0] == 0 ?
          EventPrinter::Utilities::enemy_name(params[1]) : sprintf(EventPrinter::Vocab::BattleIndexed, params[1]))}
          ] },
        302 => ->(params, event){ [true,
          {color: :game, text: EventPrinter::Vocab::Shop},
          {color: :game, text: EventPrinter::Utilities::base_item_name(*params[0..1])}
          ] },
        303 => ->(params, event){ [true,
          {color: :game, text: sprintf(EventPrinter::Vocab::EnterName,
              EventPrinter::Utilities::hero_name(params[0])[1...-1], params[1])}
          ] },
        311 => ->(params, event){ [true,
          {color: :manage, text: EventPrinter::Vocab::ModifyHP},
          {color: :manage, text: params[0] == 0 ? EventPrinter::Utilities::hero_name(params[1]) :
            [EventPrinter::Vocab::Variable, EventPrinter::Utilities::variable_name(params[1])].join(" ")},
          {color: :manage, text: EventPrinter::Vocab::PlusOrMinus[params[2]]},
          {color: :manage, text: params[3] == 0 ? params[4].to_s : EventPrinter::Utilities::la_variable(params[4])}
          ] },
        312 => ->(params, event){ [true,
          {color: :manage, text: EventPrinter::Vocab::ModifyMP},
          {color: :manage, text: params[0] == 0 ? EventPrinter::Utilities::hero_name(params[1]) :
            [EventPrinter::Vocab::Variable, EventPrinter::Utilities::variable_name(params[1])].join(" ")},
          {color: :manage, text: EventPrinter::Vocab::PlusOrMinus[params[2]]},
          {color: :manage, text: params[3] == 0 ? params[4].to_s : EventPrinter::Utilities::la_variable(params[4])}
          ] },
        313 => ->(params, event){ [true,
          {color: :manage, text: sprintf(EventPrinter::Vocab::ModifyStatus,
            EventPrinter::Utilities::hero_name(params[0]))},
          {color: :manage, text: EventPrinter::Vocab::PlusOrMinus[params[1]]},
          {color: :manage, text: sprintf(EventPrinter::Vocab::Name, EventPrinter::Utilities::state_name(params[2]))}
          ] },
        314 => ->(params, event){ [true,
          {color: :manage, text: EventPrinter::Vocab::Recover},
          {color: :manage, text: params[0] == 0 ? EventPrinter::Utilities::hero_name(params[1]) :
            [EventPrinter::Vocab::Variable, EventPrinter::Utilities::variable_name(params[1])].join(" ")}
          ] },
        315 => ->(params, event){ [true,
          {color: :manage, text: sprintf(EventPrinter::Vocab::ModifyExperience,
            params[0] == 0 ? EventPrinter::Utilities::hero_name(params[1]) :
            [EventPrinter::Vocab::Variable, EventPrinter::Utilities::variable_name(params[1])].join(" "))},
          {color: :manage, text: EventPrinter::Vocab::PlusOrMinus[params[2]]},
          {color: :manage, text: params[3] == 0 ? params[4].to_s : EventPrinter::Utilities::la_variable(params[4])}
          ] },
        316 => ->(params, event){ [true,
          {color: :manage, text: sprintf(EventPrinter::Vocab::ModifyLevel,
            params[0] == 0 ? EventPrinter::Utilities::hero_name(params[1]) :
            [EventPrinter::Vocab::Variable, EventPrinter::Utilities::variable_name(params[1])].join(" "))},
          {color: :manage, text: EventPrinter::Vocab::PlusOrMinus[params[2]]},
          {color: :manage, text: params[3] == 0 ? params[4].to_s : EventPrinter::Utilities::la_variable(params[4])}
          ] },
        317 => ->(params, event){ [true,
          {color: :manage, text: sprintf(EventPrinter::Vocab::ModifyParameters,
            params[0] == 0 ? EventPrinter::Utilities::hero_name(params[1]) :
            [EventPrinter::Vocab::Variable, EventPrinter::Utilities::variable_name(params[1])].join(" "))},
          {color: :manage, text: EventPrinter::Vocab::Attributes[params[2] - 5]},
          {color: :manage, text: EventPrinter::Vocab::PlusOrMinus[params[3]]},
          {color: :manage, text: params[4] == 0 ? params[5].to_s : EventPrinter::Utilities::la_variable(params[5])}
          ] },
        318 => ->(params, event){ [true,
          {color: :manage, text: sprintf(EventPrinter::Vocab::ModifySkill,
            params[0] == 0 ? EventPrinter::Utilities::hero_name(params[1]) :
            [EventPrinter::Vocab::Variable, EventPrinter::Utilities::variable_name(params[1])].join(" "))},
          {color: :manage, text: EventPrinter::Vocab::PlusOrMinus[params[2]]},
          {color: :manage, text: EventPrinter::Utilities::skill_name(params[3])}
          ] },
        319 => ->(params, event){ [true,
          {color: :manage, text: sprintf(EventPrinter::Vocab::ModifyEquipement,
            EventPrinter::Utilities::hero_name(params[0]))},
          {color: :manage, text: EventPrinter::Vocab::Equipement[params[1]]},
          {color: :manage, text: EventPrinter::Vocab::Operators[0]},
          {color: :manage, text: EventPrinter::Utilities::equipement_name(params[1], params[2])}
          ] },
        320 => ->(params, event){ [true,
          {color: :manage, text: sprintf(EventPrinter::Vocab::ModifyHeroName,
            EventPrinter::Utilities::hero_name(params[0]))},
          {color: :manage, text: "'#{params[1]}'"}
          ] },
        321 => ->(params, event){ [true,
          {color: :manage, text: sprintf(EventPrinter::Vocab::ModifyHeroClass,
            EventPrinter::Utilities::hero_name(params[0]))},
          {color: :manage, text: EventPrinter::Utilities::class_name(params[1])}
          ] },
        322 => ->(params, event){ [true,
          {color: :system, text: sprintf(EventPrinter::Vocab::ModifyHeroAppearance,
            EventPrinter::Utilities::hero_name(params[0]), *params[1..-1])}
          ] },
        323 => ->(params, event){ [true,
          {color: :system, text: sprintf(EventPrinter::Vocab::ModifyVehicleAppearance,
            EventPrinter::Vocab::Vehicle[params[0]], *params[1..-1])},
          ] },
        324 => ->(params, event){ [true,
          {color: :manage, text: sprintf(EventPrinter::Vocab::ModifyHeroAlias,
            EventPrinter::Utilities::hero_name(params[0]))},
          {color: :manage, text: "'#{params[1]}'"}
          ] },
        331 => ->(params, event){ [true,
          {color: :battle, text: sprintf(EventPrinter::Vocab::ModifyHPEnemy,
            EventPrinter::Utilities::foe_name(params[0], event))},
          {color: :battle, text: EventPrinter::Vocab::PlusOrMinus[params[1]]},
          {color: :battle, text: params[2] == 0 ? params[3].to_s : EventPrinter::Utilities::la_variable(params[3])}
          ] },
        332 => ->(params, event){ [true,
          {color: :battle, text: sprintf(EventPrinter::Vocab::ModifyMPEnemy,
            EventPrinter::Utilities::foe_name(params[0], event))},
          {color: :battle, text: EventPrinter::Vocab::PlusOrMinus[params[1]]},
          {color: :battle, text: params[2] == 0 ? params[3].to_s : EventPrinter::Utilities::la_variable(params[3])}
          ] },
        333 => ->(params, event){ [true,
          {color: :battle, text: sprintf(EventPrinter::Vocab::ModifyStatusEnemy,
            EventPrinter::Utilities::foe_name(params[0], event))},
          {color: :battle, text: EventPrinter::Vocab::PlusOrMinus[params[1]]},
          {color: :battle, text: EventPrinter::Utilities::state_name(params[2])}
          ] },
        334 => ->(params, event){ [true,
          {color: :battle, text: sprintf(EventPrinter::Vocab::RecoverEnemy,
            EventPrinter::Utilities::foe_name(params[0], event))}
          ] },
        335 => ->(params, event){ [true,
          {color: :battle, text: sprintf(EventPrinter::Vocab::RevealEnemy,
            EventPrinter::Utilities::foe_name(params[0], event))}
          ] },
        336 => ->(params, event){ [true,
          {color: :battle, text: sprintf(EventPrinter::Vocab::MorphEnemy,
            EventPrinter::Utilities::foe_name(params[0], event), EventPrinter::Utilities::enemy_name(params[1]))}
          ] },
        337 => ->(params, event){ [true,
          {color: :battle, text: sprintf(EventPrinter::Vocab::DisplayBattleAnimation,
            EventPrinter::Utilities::foe_name(params[0], event))},
          {color: :battle, text: EventPrinter::Utilities::animation_name(params[1])}
          ] },
        339 => ->(params, event){ [true,
          {color: :battle, text: sprintf(EventPrinter::Vocab::ForceAction, params[0] == 0 ?
            EventPrinter::Utilities::foe_name(params[1], event) :  sprintf(EventPrinter::Vocab::Battler, params[1] + 1),
            EventPrinter::Utilities::skill_name(params[2]), EventPrinter::Utilities::target_name(params[3]))}
        ]},
        340 => ->(params, event){ [true,
          {color: :battle, text: EventPrinter::Vocab::EndTheBattle}]},
        351 => ->(params, event){ [true,
          {color: :system, text: EventPrinter::Vocab::OpenMenu}]},
        352 => ->(params, event){ [true,
          {color: :system, text: EventPrinter::Vocab::OpenSave}]},
        353 => ->(params, event){ [true,
          {color: :system, text: EventPrinter::Vocab::GameOver}]},
        354 => ->(params, event){ [true,
          {color: :system, text: EventPrinter::Vocab::ToTitle}]},
        355 => ->(params, event){ [true,
          {color: :script, text: EventPrinter::Vocab::ScriptCall},
          {color: :script, text: EventPrinter::Utilities.replace_link(params[0])}
          ] },
        401 => ->(params, event){ [false,
          {color: :nothing, text: EventPrinter::Vocab::Message[0...-2]}, # Without the ":" and space
          {color: :standard, text: ":"},
          {color: :text, text: params[0]}] },
        402 => ->(params, event){ [false,
          {color: :standard, text: sprintf(EventPrinter::Vocab::Choice, "[#{params[1]}]")}] },
        403 => ->(params, event){ [false,
          {color: :standard, text: sprintf(EventPrinter::Vocab::Choice, EventPrinter::Vocab::CancelChoice)}] },
        404 => ->(params, event){ [false,
          {color: :standard, text: EventPrinter::Vocab::EndChoice}] },
        405 => ->(params, event){ [false,
          {color: :nothing, text: EventPrinter::Vocab::DisplayScrollingText[0...-2]},
          {color: :standard, text: ":"},
          {color: :text, text: params[0]}] },
        408 => ->(params, event){ [false,
          {color: :nothing, text: EventPrinter::Vocab::Comment[0...-2]},
          {color: :events, text: ":"},
          {color: :comments, text: params[0]}] },
        411 => ->(params, event){ [false,
          {color: :function, text: EventPrinter::Vocab::Else}] },
        412 => ->(params, event){ [false,
          {color: :function, text: EventPrinter::Vocab::EndCondition}] },
        413 => ->(params, event){ [false,
          {color: :function, text: EventPrinter::Vocab::EndLoop}] },
        505 => ->(params, event){ [false,
          {color: :nothing, text: EventPrinter::Vocab::MoveEvent[0...-2]},
          {color: :events, text: ":"},
          {color: :events, text: EventPrinter::Vocab::Command[2]},
          {color: :events, text: sprintf(EventPrinter::Vocab::MoveRouteCommands[params[0].code],
              *params[0].to_params)}
          ]},
        601 => ->(params, event){ [false,
          {color: :function, text: EventPrinter::Vocab::IfVictory}] },
        602 => ->(params, event){ [false,
          {color: :function, text: EventPrinter::Vocab::IfFlee}] },
        603 => ->(params, event){ [false,
          {color: :function, text: EventPrinter::Vocab::IfLoss}] },
        604 => ->(params, event){ [false,
          {color: :function, text: EventPrinter::Vocab::EndBattle}] },
        605 => ->(params, event){ [false,
          {color: :nothing, text: EventPrinter::Vocab::Shop[0...-2]},
          {color: :game, text: ":"},
          {color: :game, text: EventPrinter::Utilities::base_item_name(*params[0..1])}
          ] },
        655 => ->(params, event){ [false,
          {color: :nothing, text: EventPrinter::Vocab::ScriptCall[0...-2]},
          {color: :script, text: ":"},
          {color: :script, text: EventPrinter::Utilities.replace_link(params[0])}
          ] },
      }
      #--------------------------------------------------------------------------
      # * Converts params for variable operation
      #--------------------------------------------------------------------------
      OperandArray = [
        ->(params, event){params[0].to_s},
        ->(params, event){
          sprintf(EventPrinter::Vocab::ValueOfVariable, EventPrinter::Utilities::variable_name(params[0]))},
        ->(params, event){
          sprintf(EventPrinter::Vocab::RandomValue, params[0], params[1]) },
        ->(params, event){[
          ->(params, event){sprintf(EventPrinter::Vocab::NumberOf, EventPrinter::Utilities::item_name(params[0]))},
          ->(params, event){sprintf(EventPrinter::Vocab::NumberOf, EventPrinter::Utilities::weapon_name(params[0]))},
          ->(params, event){sprintf(EventPrinter::Vocab::NumberOf, EventPrinter::Utilities::armor_name(params[0]))},
          ->(params, event){sprintf("%s : %s", EventPrinter::Utilities::hero_name(params[0]),
            EventPrinter::Vocab::Attributes[params[1]])},
          ->(params, event){sprintf("%s : %s", EventPrinter::Utilities::foe_name(params[0], event),
            EventPrinter::Vocab::Attributes[params[1]+2]) },
          ->(params, event){sprintf("%s : %s", EventPrinter::Utilities::event_name(params[0], event.map),
            EventPrinter::Vocab::EventParam[params[1]]) },
          ->(params, event){sprintf(EventPrinter::Vocab::IdOfAMember, EventPrinter::Vocab::OrdinalNumber[params[0]])},
          ->(params, event){EventPrinter::Vocab::OtherVariable[params[0]] }
          ][params[0]].call(params[1..-1], event) },
        ->(params, event) {params[0]}
      ]
      #--------------------------------------------------------------------------
      # * Converts params for conditions
      #--------------------------------------------------------------------------
      ConditionArray = [
        ->(params, event){
          [EventPrinter::Vocab::Switch, EventPrinter::Utilities::switch_name(params[0]),
              EventPrinter::Vocab::ComparationOperator[0],
              EventPrinter::Vocab::OnOff[params[1]]].join(" ")
        },
        ->(params, event){
          [EventPrinter::Vocab::Variable, EventPrinter::Utilities::variable_name(params[0]),
            EventPrinter::Vocab::ComparationOperator[params[3]],
            params[1] == 0 ? params[2].to_s : sprintf("%s %s", EventPrinter::Vocab::Variable,
              EventPrinter::Utilities::variable_name(params[2]))
          ].join(" ")
        },
        ->(params, event){
          [EventPrinter::Vocab::LocalSwitch, params[0],
            EventPrinter::Vocab::ComparationOperator[0],
            EventPrinter::Vocab::OnOff[params[1]]].join(" ")
        },
        ->(params, event){
          [EventPrinter::Vocab::LeChronometer,
            sprintf(EventPrinter::Vocab::Start, params[0] / 60, params[0] % 60) ,
            EventPrinter::Vocab::MoreOrLess[params[1]] ].join(" ")
        },
        ->(params, event){
          [EventPrinter::Utilities::hero_name(params[0]),
            sprintf(EventPrinter::Vocab::HeroConditions[params[1]], HeroConditionString[params[1]].call(params[2]))
          ].join(" ")
        },
        ->(params, event){ [EventPrinter::Utilities::foe_name(params[0], event),
            params[1] == 0 ? EventPrinter::Vocab::Present :
                sprintf(EventPrinter::Vocab::HeroConditions[5], EventPrinter::Utilities::state_name(params[2]))
          ].join(" ")
        },
        ->(params, event){
          [EventPrinter::Utilities::event_name(params[0], event.map), EventPrinter::Vocab::IsLooking,
          EventPrinter::Vocab::Direction[params[1]]].join(" ")
        },
        ->(params, event){
          sprintf(EventPrinter::Vocab::MoneyCondition, params[0], EventPrinter::Vocab::MoreOrLess[params[1]])
        },
        ->(params, event){
          sprintf(EventPrinter::Vocab::ItemCondition, EventPrinter::Utilities::item_name(params[0]))
        },
        ->(params, event){
          sprintf(EventPrinter::Vocab::WeaponCondition, EventPrinter::Utilities::weapon_name(params[0]),
            params[1] ? EventPrinter::Vocab::OrEquipped : "")
        },
        ->(params, event){
          sprintf(EventPrinter::Vocab::ArmorCondition, EventPrinter::Utilities::armor_name(params[0]),
            params[1] ? EventPrinter::Vocab::OrEquipped : "")
        },
        ->(params, event){
          sprintf(EventPrinter::Vocab::KeyCondition, EventPrinter::Vocab::Inputs[params[0]])
        },
        ->(params, event){
          sprintf(EventPrinter::Vocab::ScriptCondition, EventPrinter::Utilities.replace_link(params[0]))
        },
        ->(params, event){
          sprintf(EventPrinter::Vocab::VehicleCondition, EventPrinter::Vocab::Vehicle[params[0]])
        }
      ]
      #--------------------------------------------------------------------------
      # * Converts params for hero conditions
      #--------------------------------------------------------------------------
      HeroConditionString = [ ->(params){""},
          ->(params){ params.to_s },
          ->(params){ EventPrinter::Utilities::skill_name(params)},
          ->(params){ EventPrinter::Utilities::class_name(params)},
          ->(params){ EventPrinter::Utilities::weapon_name(params)},
          ->(params){ EventPrinter::Utilities::armor_name(params)},
          ->(params){ EventPrinter::Utilities::state_name(params)}
      ]
      #--------------------------------------------------------------------------
      # * Converts params for warp
      #--------------------------------------------------------------------------
      WarpText = [
        ->(params){ sprintf("[%03d:%s], (X:%03d, Y:%03d)", params[0],
          EventPrinter::Utilities::map_name(params[0]), params[1], params[2]) },
        ->(params){ sprintf("ID:[%04d], X:[%04d], Y:[%04d]", *params) }
      ]
      #--------------------------------------------------------------------------
      # * Converts params for variable operation
      #--------------------------------------------------------------------------
      PositionArray = [
        ->(params, event){ sprintf(EventPrinter::Vocab::Position[0], *params)},
        ->(params, event){ sprintf(EventPrinter::Vocab::Position[1], *params)},
        ->(params, event){ sprintf(EventPrinter::Vocab::Position[2],
          EventPrinter::Utilities::event_name(params[0], event.map))}
      ]
      #--------------------------------------------------------------------------
      # * Initialization
      #--------------------------------------------------------------------------
      def initialize(code = 0, indent = 0, parameters = [], event = nil)
        @code = code
        @indent = indent
        @parameters = parameters
        @event = event
        @parse_results = parse
        minimize
      end
      #--------------------------------------------------------------------------
      # * Add indent to representation
      #--------------------------------------------------------------------------
      def parse
         {:indent => @indent, :command => parse_command}
      end
      #--------------------------------------------------------------------------
      # * Parse command
      #--------------------------------------------------------------------------
      def parse_command
        CommandHash[@code].call(@parameters, @event)
      end
      #--------------------------------------------------------------------------
      # * From representation to raw
      #--------------------------------------------------------------------------
      def raw
        text = (@parse_results[:command][1..-1].map {|a| a[:text]}).join(" ")
        ((EventPrinter::Vocab::Command + " ") * (@parse_results[:indent] + 1)) + text
      end
      #--------------------------------------------------------------------------
      # * From representation to bbcode
      #--------------------------------------------------------------------------
      def bbcode
        start = sprintf("%s%s%s",
          EventPrinter::BBcode::colorize(:nothing, EventPrinter::Vocab::Command) * @parse_results[:indent],
          EventPrinter::BBcode::colorize(:standard, EventPrinter::Vocab::Command[0..1]),
          EventPrinter::BBcode::colorize(
              @parse_results[:command].first ? :standard : :nothing, EventPrinter::Vocab::Command[2..2] << " "))
        text = (@parse_results[:command][1..-1].map do |hash|
          EventPrinter::BBcode::colorize(hash[:color], hash[:text])
        end).join("")
        EventPrinter::BBcode::line(start + text)
      end
      #--------------------------------------------------------------------------
      # * From representation to html
      #--------------------------------------------------------------------------
      def html
        start = sprintf("%s%s%s",
          EventPrinter::HTML::colorize(:nothing, EventPrinter::Vocab::Command) * @parse_results[:indent],
          EventPrinter::HTML::colorize(:standard, EventPrinter::Vocab::Command[0..1]),
          EventPrinter::HTML::colorize(
              @parse_results[:command].first ? :standard : :nothing, EventPrinter::Vocab::Command[2..2] << " "))
        text = (@parse_results[:command][1..-1].map do |hash|
          EventPrinter::HTML::colorize(hash[:color], hash[:text])
        end).join("")
        EventPrinter::HTML::line(start + text)
      end
      #--------------------------------------------------------------------------
      # * Minimize representation (merge same color texts)
      #--------------------------------------------------------------------------
      def minimize
        return unless @parse_results[:command][2]
        tab = [{color: @parse_results[:command][1][:color], text: ""}]
        @parse_results[:command][1..-1].each do |part|
          tab << {color: part[:color], text: ""} if tab.last[:color] != part[:color]
          tab.last[:text] << part[:text] << " "
        end
        @parse_results[:command][1..-1] = tab
      end
    end
    # End of Command  ------------------------------------------------------------------------------------------------
    #==============================================================================
    # ** EventPage
    #------------------------------------------------------------------------------
    #  Handle access to an event's page.
    #==============================================================================
    class Page
      #--------------------------------------------------------------------------
      # * Public Instance Variables
      #--------------------------------------------------------------------------
      attr_reader :list
      #--------------------------------------------------------------------------
      # * Initialization
      #   ** list         list from a RPG::Event::Page list
      #   ** event     EventPrinter::Event
      #--------------------------------------------------------------------------
      def initialize(list, event)
        @list = list.collect do |command|
          EventPrinter::EventCommand.new(command.code, command.indent, command.parameters, event)
        end
        @event = event
      end
      #--------------------------------------------------------------------------
      # * Prints in a file raw conversion of commands
      #--------------------------------------------------------------------------
      def print_raw(filename = @event.printed_name)
        confirm_filename(filename)
        filename << "_raw.txt"
        File.open(filename, "w+") do |file|
          file.puts @event.printed_name
          @list.map do |elt|
            file.puts elt.raw
          end
        end
      end
      #--------------------------------------------------------------------------
      # * Prints in a file BBcode conversion of commands
      #--------------------------------------------------------------------------
      def print_bbcode(filename = @event.printed_name)
        confirm_filename(filename)
        filename << "_bbcode.txt"
        File.open(filename, "w+") do |file|
          file.write EventPrinter::BBcode::head(@event.printed_name)
          @list.map do |elt|
            file.puts elt.bbcode
          end
          file.write EventPrinter::BBcode::foot
        end
      end
      #--------------------------------------------------------------------------
      # * Prints in a file HTML conversion of commands
      #--------------------------------------------------------------------------
      def print_html(filename = @event.printed_name)
        confirm_filename(filename)
        filename << "_html.txt"
        File.open(filename, "w+") do |file|
          file.write EventPrinter::HTML::head(@event.printed_name)
          @list.map do |elt|
            file.write elt.html
          end
          file.write EventPrinter::HTML::foot
        end
      end
      #--------------------------------------------------------------------------
      # * Copy the raw conversion of commands
      #--------------------------------------------------------------------------
      def copy_raw
        Win32API.push_text_in_clipboard(((@list.map {|e| e.raw}).join("\n") + "\0").to_ascii)
      end
      #--------------------------------------------------------------------------
      # * Copy the BBcode conversion of commands
      #--------------------------------------------------------------------------
      def copy_bbcode
        str = EventPrinter::BBcode::head(@event.printed_name)
        str << (@list.map { |e| e.bbcode }).join("\n")
        str << EventPrinter::BBcode::foot
        Win32API.push_text_in_clipboard(str.to_ascii << "\0")
      end
      #--------------------------------------------------------------------------
      # * Return in HTML
      #--------------------------------------------------------------------------
      def return_html(process = nil)
        str = EventPrinter::HTML::head(@event.printed_name)
        if process
          str << process.call((@list.map { |e| e.html }).join)
        else
          str << (@list.map { |e| e.html }).join
        end
        str << EventPrinter::HTML::foot
        return str
      end
      #--------------------------------------------------------------------------
      # * Copy the HTML conversion of commands
      #--------------------------------------------------------------------------
      def copy_html
        str = EventPrinter::HTML::head(@event.printed_name)
        str << (@list.map { |e| e.html }).join
        str << EventPrinter::HTML::foot
        Win32API.push_text_in_clipboard(str.to_ascii << "\0")
      end
      #--------------------------------------------------------------------------
      # * Make an okay filename
      #--------------------------------------------------------------------------
      def confirm_filename(filename)
        filename.gsub!(/[<>:"\/\\|?*]/) { "" }
      end
    end
    # End of Page  ------------------------------------------------------------------------------------------------
    #==============================================================================
    # ** Event
    #------------------------------------------------------------------------------
    #  Handle access to an event
    #==============================================================================
    class Event
      #--------------------------------------------------------------------------
      # * Public Instance Variables
      #--------------------------------------------------------------------------
      attr_reader :map
      attr_reader :pages
      attr_reader :troop
      #--------------------------------------------------------------------------
      # * Initialization
      #   ** event     EventPrinter::Event
      #   ** map       RPG::Map
      #--------------------------------------------------------------------------
      def initialize(event, map)
        @id = event.id
        @name = event.name
        @event = event
        @map = map
        @troop ||= []
        @pages ||= @event.pages.collect do |page|
          EventPrinter::Page.new(page.list, self)
        end
      end
      #--------------------------------------------------------------------------
      # * Build an event from its id and its map id
      #--------------------------------------------------------------------------
      def self.build(id_event, id_map)
        map = load_data(sprintf("Data/Map%03d.rvdata2", id_map))
        event = map.events[id_event]
        self.new(event, map)
      end
      #--------------------------------------------------------------------------
      # * Prints in a file a page to raw format
      #--------------------------------------------------------------------------
      def print_raw(no_page = 0)
        @pages[no_page].print_raw
      end
      #--------------------------------------------------------------------------
      # * Prints in a file a page to BBcode format
      #--------------------------------------------------------------------------
      def print_bbcode(no_page = 0)
        @pages[no_page].print_bbcode
      end
      #--------------------------------------------------------------------------
      # * Prints in a file a page to HTML format
      #--------------------------------------------------------------------------
      def print_html(no_page = 0)
        @pages[no_page].print_html
      end
      #--------------------------------------------------------------------------
      # * Copy a page to raw format
      #--------------------------------------------------------------------------
      def copy_raw(no_page = 0)
        @pages[no_page].copy_raw
      end
      #--------------------------------------------------------------------------
      # * Copy a page to BBcode format
      #--------------------------------------------------------------------------
      def copy_bbcode(no_page = 0)
        @pages[no_page].copy_bbcode
      end
      #--------------------------------------------------------------------------
      # * Return to HTML format
      #--------------------------------------------------------------------------
      def return_html(no_page = 0, proc = nil)
        @pages[no_page].return_html(proc)
      end
      #--------------------------------------------------------------------------
      # * Copy a page to HTML format
      #--------------------------------------------------------------------------
      def copy_html(no_page = 0)
        @pages[no_page].copy_html
      end
      #--------------------------------------------------------------------------
      # * String name
      #--------------------------------------------------------------------------
      def printed_name
        "Event - #{@name}"
      end
    end
    #==============================================================================
    # ** CommonEvent
    #------------------------------------------------------------------------------
    #  Handle access to a common event
    #==============================================================================
    class CommonEvent < Event
      #--------------------------------------------------------------------------
      # * Initialization
      #   ** event     EventPrinter::Event
      #   ** map       RPG::Map
      #--------------------------------------------------------------------------
      def initialize(event, map)
        @map = map
        @pages = [EventPrinter::Page.new(event.list, self)]
        super
      end
      #--------------------------------------------------------------------------
      # * Build an event from its id and its map id
      #--------------------------------------------------------------------------
      def self.build(id_event, id_map = 0)
        map = load_data(sprintf("Data/Map%03d.rvdata2", id_map))
        event = load_data("Data/CommonEvents.rvdata2")[id_event]
        self.new(event, map)
      end
      #--------------------------------------------------------------------------
      # * String name
      #--------------------------------------------------------------------------
      def printed_name
        ""
      end
    end
    #==============================================================================
    # ** BattleEvent
    #------------------------------------------------------------------------------
    #  Handle access to a battle event
    #==============================================================================
    class BattleEvent < Event
      #--------------------------------------------------------------------------
      # * Initialization
      #   ** event     EventPrinter::Event
      #   ** map       RPG::Map
      #--------------------------------------------------------------------------
      def initialize(event, map)
        @troop = event.members
        super
      end
      #--------------------------------------------------------------------------
      # * Build an event from its id and its map id
      #--------------------------------------------------------------------------
      def self.build(id_event, id_map = 0)
        map = load_data(sprintf("Data/Map%03d.rvdata2", id_map))
        event = load_data("Data/Troops.rvdata2")[id_event]
        self.new(event, map)
      end
      #--------------------------------------------------------------------------
      # * String name
      #--------------------------------------------------------------------------
      def printed_name
        "BattleEvent - #{@name}"
      end
    end
    # End of Event  ------------------------------------------------------------------------------------------------
    #==============================================================================
    # ** BBcode helper methods
    #==============================================================================
    module BBcode
      #---------------------------------------------------------------------------------------------
      # * Public module methods
      #---------------------------------------------------------------------------------------------
      extend self
      #--------------------------------------------------------------------------
      # ** Head
      #--------------------------------------------------------------------------
      def head(string_name = "foo")
        sprintf("[table style='background-color:%s;border:1px solid; padding: 5px;text-shadow:none' class='event_code']%s",
          EventPrinter::Theme::Nothing, name(string_name))
      end
      #--------------------------------------------------------------------------
      # ** Name
      #--------------------------------------------------------------------------
      def name(string)
        sprintf("[b]%s[/b]", string)
      end
      #--------------------------------------------------------------------------
      # ** Colorization
      #--------------------------------------------------------------------------
      def colorize(color, string)
        sprintf("[color=%s]%s[/color]", EventPrinter::Theme::get_color(color), string)
      end
      #--------------------------------------------------------------------------
      # ** Line
      #--------------------------------------------------------------------------
      def line(string)
        sprintf("[tr][td]%s[/td][/tr]", string)
      end
      #--------------------------------------------------------------------------
      # ** Footer
      #--------------------------------------------------------------------------
      def foot
        "[/table]"
      end
    end
    #==============================================================================
    # ** HTML helper methods
    #==============================================================================
    module HTML
      #---------------------------------------------------------------------------------------------
      # * Public module methods
      #---------------------------------------------------------------------------------------------
      extend self
      #--------------------------------------------------------------------------
      # ** Head
      #--------------------------------------------------------------------------
      def head(string_name = "foo")
        sprintf("%s<div style='background-color:%s; border: #94a4be 1px solid; padding: 5px;text-shadow:none' class='event_code'>",
          name(string_name), EventPrinter::Theme::Nothing)
      end
      #--------------------------------------------------------------------------
      # ** Name
      #--------------------------------------------------------------------------
      def name(string)
        sprintf("<span style='font-weight: bold; padding: 0px'\>%s</span>", string)
      end
      #--------------------------------------------------------------------------
      # ** Colorization
      #--------------------------------------------------------------------------
      def colorize(color, string)
        sprintf("<span style='color:%s'>%s</span>", EventPrinter::Theme::get_color(color), string)
      end
      #--------------------------------------------------------------------------
      # ** Line
      #--------------------------------------------------------------------------
      def line(string)
        sprintf("<p style='margin: 0'>%s</p>", string)
      end
      #--------------------------------------------------------------------------
      # ** Footer
      #--------------------------------------------------------------------------
      def foot
        "</div>"
      end
    end
    #==============================================================================
    # ** EventPrinter Scene
    #------------------------------------------------------------------------------
    #  This class handle mode selection for EventPrinter
    #==============================================================================
    class Scene < Scene_Base
      #--------------------------------------------------------------------------
      # * Start processing
      #      ** from =>  :title (returns to Scene_Title)
      #                  :map (returns to Scene_Map)
      #--------------------------------------------------------------------------
      def start
        DataManager.load_database
        super
        initialize_data
        @title_window = Window_Help.new(1)
        @event_window = EventPrinter::Windows::Events.new @title_window
        @page_window = EventPrinter::Windows::Pages.new @title_window
        @map_window = EventPrinter::Windows::Maps.new @title_window
        create_type_window
        create_mode_window
      end
      #--------------------------------------------------------------------------
      # ** Create type window
      #--------------------------------------------------------------------------
      def create_type_window
        @type_window = EventPrinter::Windows::Types.new @title_window
        lam = ->(type){fill_event_window(type)}
        EventPrinter::Vocab::Windows::Types.each do |symbol, _|
          @type_window.set_handler(symbol, ->{lam.curry.(symbol)})
        end
        @type_window.set_handler(:cancel, -> {Sound.play_cancel;@type_window.hide;@map_window.activate})
      end
      #--------------------------------------------------------------------------
      # ** Create mode window
      # ** Create mode window
      #--------------------------------------------------------------------------
      def create_mode_window
        @mode_window = EventPrinter::Windows::Modes.new @title_window
        lam = ->(action){do_action(action)}
        EventPrinter::Vocab::Windows::Modes.each do |symbol, _|
          @mode_window.set_handler(symbol, ->{lam.curry.(symbol)})
        end
        @mode_window.set_handler(:cancel, -> {
          Sound.play_cancel
          (@type_window.index == 1 ? @event_window : @page_window).activate
          @mode_window.hide
        })
      end
      #--------------------------------------------------------------------------
      # * Frame Update
      #--------------------------------------------------------------------------
      def update
        super
        if @map_window.active
          update_map_window
        elsif @event_window.active
          update_event_window
        elsif @page_window.active
          update_page_window
        end
      end
      #--------------------------------------------------------------------------
      # ** Update for map window
      #--------------------------------------------------------------------------
      def update_map_window
        if Input.trigger?(Input::B)
          Sound.play_cancel
          return_scene
        elsif Input.trigger?(Input::C)
          Sound.play_ok
          @type_window.show.activate
          @map_window.deactivate
        end
      end
      #--------------------------------------------------------------------------
      # ** Update for event window
      #--------------------------------------------------------------------------
      def update_event_window
        if Input.trigger?(Input::B)
          Sound.play_cancel
          @map_window.show
          @type_window.show.activate
          @event_window.hide.deactivate
        elsif Input.trigger?(Input::C)
          Sound.play_ok
          unless @type_window.index == 1
            fill_page_window
            @event_window.hide.deactivate
          else
            @mode_window.show.activate
            @event_window.deactivate
          end
        end
      end
      #--------------------------------------------------------------------------
      # ** Update for page window
      #--------------------------------------------------------------------------
      def update_page_window
        if Input.trigger?(Input::B)
          Sound.play_cancel
          @event_window.show.activate
          @page_window.hide.deactivate
        elsif Input.trigger?(Input::C)
          Sound.play_ok
          @mode_window.show.activate
          @page_window.deactivate
        end
      end
      #--------------------------------------------------------------------------
      # ** Filling event window
      #--------------------------------------------------------------------------
      def fill_event_window(type)
        case type
        when :map
          map = get_map(@map_window.current_map_id)
          @event_window.fill_with map.events.map { |e| {id: e[1].id, name: e[1].name }}
        when :common
          @event_window.fill_with(@data[:common_event][1..-1].map do |e|
            {id: e.id, name: e.name }
          end)
        when :battle
          @event_window.fill_with @data[:troops][1..-1].map { |e| {id: e.id, name: e.name }}
        end
        @event_window.show.activate.refresh
        @type_window.hide
        @map_window.hide
      end
      #--------------------------------------------------------------------------
      # ** Filling page window
      #--------------------------------------------------------------------------
      def fill_page_window
        case @type_window.index
        when 0
          map = get_map(@map_window.current_map_id)
          @page_window.item_max = map.events[@event_window.current_event_id].pages.size
        when 2
          @page_window.item_max = @data[:troops][@event_window.current_event_id].pages.size
        end
        @page_window.show.activate.refresh
        @page_window.select 0
      end
      #--------------------------------------------------------------------------
      # ** Execute action
      #--------------------------------------------------------------------------
      def do_action(action)
        event_classes = {map: EventPrinter::Event, common: EventPrinter::CommonEvent, battle: EventPrinter::BattleEvent}
        event_class = event_classes[@type_window.current_symbol]
        event = event_class.build(@event_window.current_event_id, @map_window.current_map_id)
        event.send(action, @page_window.index)
        @mode_window.activate
      end
      #--------------------------------------------------------------------------
      # ** Load useful data
      #--------------------------------------------------------------------------
      def initialize_data
        @data = {
          :troops => load_data("Data/Troops.rvdata2"),
          :common_event => load_data("Data/CommonEvents.rvdata2"),
          :maps => {}
        }
      end
      #--------------------------------------------------------------------------
      # ** Load useful data
      #--------------------------------------------------------------------------
      def get_map(id)
        @data[:maps][id] ||= load_data(sprintf("Data/Map%03d.rvdata2", id))
      end
    end
    # End of Scene  ------------------------------------------------------------------------------------------------
    #==============================================================================
    # ** Windows for EventPrinter Scene
    #==============================================================================
    module Windows
      #===============================================================
      class Maps < Window_Selectable
        #--------------------------------------------------------------------------
        # * Object Initialization
        #-------------------------------------------------------------------------
        def initialize(help_window)
          @help_window = help_window
          fill
          super(0, line_height + (standard_padding*2), Graphics.width,
            Graphics.height - (line_height + (standard_padding*2)))
          activate.refresh
          select(0)
        end
        #--------------------------------------------------------------------------
        # * Fill window
        #-------------------------------------------------------------------------
        def fill
          @data = []
          load_data("Data/MapInfos.rvdata2").map do |key, map|
            @data.push name: sprintf("[%03d]%s", key, map.name), id: key
          end
        end
        #--------------------------------------------------------------------------
        # * Get Number of Items
        #--------------------------------------------------------------------------
        def item_max
          return @data.size
        end
        #--------------------------------------------------------------------------
        # * Get Digit Count
        #--------------------------------------------------------------------------
        def col_max
          return 3
        end
        #--------------------------------------------------------------------------
        # * Get current map id
        #--------------------------------------------------------------------------
        def current_map_id
          return @data[@index][:id]
        end
        #--------------------------------------------------------------------------
        # * Draw Item
        #--------------------------------------------------------------------------
        def draw_item(index)
          change_color(normal_color)
          draw_text(item_rect_for_text(index), @data[index][:name])
        end
        #--------------------------------------------------------------------------
        # * Update help Window
        #--------------------------------------------------------------------------
        def update_help
          @help_window.set_text(EventPrinter::Vocab::Windows::Helper[0])
        end
      end
      #===============================================================
      class Types < Window_Command
        #--------------------------------------------------------------------------
        # * Object Initialization
        #-------------------------------------------------------------------------
        def initialize(help_window)
          @help_window = help_window
          super((Graphics.width - window_width) / 2, Graphics.height / 3)
          hide.deactivate
        end
        #--------------------------------------------------------------------------
        # * Create Command List
        #--------------------------------------------------------------------------
        def make_command_list
          EventPrinter::Vocab::Windows::Types.each do |symbol, name|
            add_command(name, symbol)
          end
        end
        #--------------------------------------------------------------------------
        # * Get Window Width
        #--------------------------------------------------------------------------
        def window_width
          return Graphics.width / 2
        end
        #--------------------------------------------------------------------------
        # * Update help Window
        #--------------------------------------------------------------------------
        def update_help
          @help_window.set_text(EventPrinter::Vocab::Windows::Helper[1])
        end
      end
      #===============================================================
      class Events < Window_Selectable
        #--------------------------------------------------------------------------
        # * Object Initialization
        #-------------------------------------------------------------------------
        def initialize(help_window)
          @help_window = help_window
          @data = []
          super(0, line_height + (standard_padding*2), Graphics.width,
            Graphics.height - (line_height + (standard_padding*2)))
          hide.deactivate
        end
        #--------------------------------------------------------------------------
        # * Fill window
        #-------------------------------------------------------------------------
        def fill_with(data)
          @data = data
          select 0
        end
        #--------------------------------------------------------------------------
        # * Get Number of Items
        #--------------------------------------------------------------------------
        def item_max
          return @data.size
        end
        #--------------------------------------------------------------------------
        # * Get Digit Count
        #--------------------------------------------------------------------------
        def col_max
          return 3
        end
        #--------------------------------------------------------------------------
        # * Get current map id
        #--------------------------------------------------------------------------
        def current_event_id
          return @data[@index][:id]
        end
        #--------------------------------------------------------------------------
        # * Draw Item
        #--------------------------------------------------------------------------
        def draw_item(index)
          elt = @data[index]
          change_color(normal_color)
          draw_text(item_rect_for_text(index), sprintf(EventPrinter::Vocab::Windows::EventName, elt[:id], elt[:name] ))
        end
        #--------------------------------------------------------------------------
        # * Update help Window
        #--------------------------------------------------------------------------
        def update_help
          @help_window.set_text(EventPrinter::Vocab::Windows::Helper[2])
        end
      end
      #===============================================================
      class Pages < Window_Selectable
        #--------------------------------------------------------------------------
        # * Object Initialization
        #-------------------------------------------------------------------------
        def initialize(help_window)
          @help_window = help_window
          @item_max = 0
          super(0, line_height + (standard_padding*2), Graphics.width,
            Graphics.height - (line_height + (standard_padding*2)))
          hide.deactivate
        end
        #--------------------------------------------------------------------------
        # * Get Number of Items
        #--------------------------------------------------------------------------
        def item_max
          @item_max
        end
        #--------------------------------------------------------------------------
        # * Set Number of Items
        #--------------------------------------------------------------------------
        def item_max=(value)
          @item_max = value
        end
        #--------------------------------------------------------------------------
        # * Get Digit Count
        #--------------------------------------------------------------------------
        def col_max
          return 3
        end
        #--------------------------------------------------------------------------
        # * Draw Item
        #--------------------------------------------------------------------------
        def draw_item(index)
          change_color(normal_color)
          draw_text(item_rect_for_text(index), sprintf(EventPrinter::Vocab::Windows::PageName, index+1))
        end
        #--------------------------------------------------------------------------
        # * Update help Window
        #--------------------------------------------------------------------------
        def update_help
          @help_window.set_text(EventPrinter::Vocab::Windows::Helper[3])
        end
      end
      #===============================================================
      class Modes < Window_Command
        #--------------------------------------------------------------------------
        # * Object Initialization
        #-------------------------------------------------------------------------
        def initialize(help_window)
          @help_window = help_window
          super(0, Graphics.height / 4)
          hide.deactivate
        end
        #--------------------------------------------------------------------------
        # * Create Command List
        #--------------------------------------------------------------------------
        def make_command_list
          EventPrinter::Vocab::Windows::Modes.each do |symbol, name|
            add_command(name, symbol)
          end
        end
        #--------------------------------------------------------------------------
        # * Get Window Width
        #--------------------------------------------------------------------------
        def window_width
          return Graphics.width
        end
        #--------------------------------------------------------------------------
        # * Calculate Height of Window Suited to Specified Number of Lines
        #--------------------------------------------------------------------------
        def fitting_height(line_number)
          (line_number/2) * line_height + standard_padding * 2
        end
        #--------------------------------------------------------------------------
        # * Get Digit Count
        #--------------------------------------------------------------------------
        def col_max
          return 2
        end
        #--------------------------------------------------------------------------
        # * Update help Window
        #--------------------------------------------------------------------------
        def update_help
          @help_window.set_text(EventPrinter::Vocab::Windows::Helper[4])
        end
      end
    end
    # End of Windows  ------------------------------------------------------------------------------------------------
  end
  #==============================================================================
  # ** RPG::AudioFile
  #==============================================================================
  class RPG::AudioFile
    #--------------------------------------------------------------------------
    # * From RPG::AudioFile to string
    #--------------------------------------------------------------------------
    def to_string_params
      name.empty? ? EventPrinter::Vocab::None : sprintf(EventPrinter::Vocab::Music, *[name, volume, pitch])
    end
  end
  #==============================================================================
  # ** RPG::MoveRoute
  #==============================================================================
  class RPG::MoveRoute
    #--------------------------------------------------------------------------
    # * From RPG::MoveRoute to string
    #--------------------------------------------------------------------------
    def to_string_params
        params = []
        params << EventPrinter::Vocab::MoveRouteParams[0] if @repeat
        params << EventPrinter::Vocab::MoveRouteParams[1] if @skippable
        params << EventPrinter::Vocab::MoveRouteParams[2] if @wait
        params.empty? ? "" : sprintf("(%s)", params.join(", "))
    end
  end
  #==============================================================================
  # ** RPG::MoveCommand
  #==============================================================================
  class RPG::MoveCommand
    #--------------------------------------------------------------------------
    # * Hash for special moving commands
    #--------------------------------------------------------------------------
    SpecialMoveCommand = {
      41 => ->(params){ params[0] == "" ? [EventPrinter::Vocab::None] : "'#{params[0]}', #{params[1]}"},
      43 => ->(params){ [EventPrinter::Vocab::Transparency[params[0]]] },
      44 => ->(params){ params[0].to_string_params }
    }
    #--------------------------------------------------------------------------
    # * From RPG::MoveCommand to array
    #--------------------------------------------------------------------------
    def to_params
      (SpecialMoveCommand.fetch(@code) { ->(params){ params } }).call(@parameters)
    end
  end
  #==============================================================================
  # ** Color
  #==============================================================================
  class Color
    #--------------------------------------------------------------------------
    # * From Color to string
    #--------------------------------------------------------------------------
    def to_string_params(with_alpha = true)
      sprintf(EventPrinter::Vocab::Color[with_alpha ? 0 : 1], red, green, blue, alpha)
    end
  end
  #==============================================================================
  # ** Tone
  #==============================================================================
  class Tone
    #--------------------------------------------------------------------------
    # * From Tone to string
    #--------------------------------------------------------------------------
    def to_string_params
      sprintf(EventPrinter::Vocab::Tone, red, green, blue, gray)
    end
  end
  #==============================================================================
  # ** Win32API (Thx Grim)
  #==============================================================================
  class Win32API
    #--------------------------------------------------------------------------
    # * Librairy
    #--------------------------------------------------------------------------
    CloseClipboard = self.new('user32', 'CloseClipboard', 'v', 'i')
    EmptyClipboard = self.new('user32', 'EmptyClipboard', 'v', 'i')
    EnumClipboardFormats = self.new('user32', 'EnumClipboardFormats','i', 'i')
    GetClipboardData = self.new('user32', 'GetClipboardData', 'i', 'i')
    GetClipboardFormatName = self.new('user32', 'GetClipboardFormatName', 'ipi', 'i')
    GlobalAlloc = self.new('kernel32', 'GlobalAlloc', 'ii', 'i')
    GlobalFree = self.new('kernel32', 'GlobalFree', 'i', 'i')
    GlobalLock = self.new('kernel32', 'GlobalLock', 'i', 'l')
    Memcpy = self.new('msvcrt','memcpy', 'ipi', 'i')
    MultiByteToWideChar = self.new('kernel32', 'MultiByteToWideChar', 'ilpipi', 'i')
    OpenClipboard = self.new('user32', 'OpenClipboard', 'i', 'i')
    RegisterClipboardFormat = self.new('user32', 'RegisterClipboardFormat', 'p', 'i')
    SetClipboardData = self.new('user32', 'SetClipboardData', 'ii', 'i')
    WideCharToMultiByte = self.new('kernel32', 'WideCharToMultiByte', 'ilpipipp', 'i')
    #--------------------------------------------------------------------------
    # * Singleton
    #--------------------------------------------------------------------------
    class << self
      #--------------------------------------------------------------------------
      # * convert text
      #--------------------------------------------------------------------------
      def convert_text(text, from, to)
        size = MultiByteToWideChar.call(from, 0, text, -1, nil, 0)
        buffer = [].pack("x#{size*2}")
        MultiByteToWideChar.call(from, 0, text, -1, buffer, buffer.size/2)
        size = WideCharToMultiByte.call(to, 0, buffer, -1, nil, 0, nil, nil)
        second_buffer = [].pack("x#{size}")
        WideCharToMultiByte.call(to, 0, buffer, -1, second_buffer, second_buffer.size, nil, nil)
        second_buffer.delete!("\000") if to == 65001
        second_buffer.delete!("\x00") if to == 0
        return second_buffer
      end
      #--------------------------------------------------------------------------
      # * Push text in clipboard
      #--------------------------------------------------------------------------
      def push_text_in_clipboard(text)
        OpenClipboard.call(0)
        EmptyClipboard.call()
        hmem = GlobalAlloc.call(0x42, text.length)
        mem = GlobalLock.call(hmem)
        Memcpy.call(mem, text, text.length)
        SetClipboardData.call(1, hmem) # Format CF_TEXT = 1
        GlobalFree.call(hmem)
        CloseClipboard.call()
        self
      end
    end
  end
  #==============================================================================
  # ** String
  #------------------------------------------------------------------------------
  #  A String object holds and manipulates an arbitrary sequence of bytes,
  #  typically representing characters.
  #==============================================================================
  class String
    #--------------------------------------------------------------------------
    # * return self in ASCII-8BIT
    #--------------------------------------------------------------------------
    def to_ascii; Win32API.convert_text(self, 65001, 0);end
    #--------------------------------------------------------------------------
    # * convert self in ASCII-8BIT
    #--------------------------------------------------------------------------
    def to_ascii!; self.replace(self.to_ascii); end
  end
  #==============================================================================
  # ** Scene_Title
  #------------------------------------------------------------------------------
  #  This class performs the title screen processing.
  #==============================================================================
  class Scene_Title
    #--------------------------------------------------------------------------
    # * Frame Update
    #--------------------------------------------------------------------------
    alias old_update update
    def update
      old_update
      if Input.trigger?(Input::F5)
        SceneManager.call(EventPrinter::Scene)
      end
    end
  end
end