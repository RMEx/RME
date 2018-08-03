# -*- coding: utf-8 -*-

# ==============================================================================
# * RPG Maker (VX / VX.ACE) Extender
# ------------------------------------------------------------------------------
# Internal definition of how to declare a command.
#
# [Dependency]
#   - `internal_documentation.rb`
# ==============================================================================
module RME

  module Command

    # ==========================================================================
    # ** Enumeration of commands' parameters' types.
    # ==========================================================================
    module ParameterType

      # ========================================================================
      # * Domain of definition of one type.
      #   (That is to say the set of valid values for one type)
      # ========================================================================
      class Domain
        attr_reader :predicate

        # ----------------------------------------------------------------------
        # * Initializes this domain with the given `predicate`.
        # ----------------------------------------------------------------------
        def initialize(predicate)
          @predicate = predicate
        end

        # ----------------------------------------------------------------------
        # * Tells whether the given value (`val`) belongs to this domain or not.
        # -> `true` if the value belongs to this domain;
        #    `false` otherwise.
        # ----------------------------------------------------------------------
        def valid?(val)
          @predicate.call val
        end
      end

      # ========================================================================
      # * Enumeration of distinct values (peculiar domain).
      # ========================================================================
      class Set
        attr_reader :elements

        # ----------------------------------------------------------------------
        # * Initializes this set with the given `elements`.
        # ----------------------------------------------------------------------
        def initialize(*elements)
          @elements = elements
        end

        # ----------------------------------------------------------------------
        # * Tells whether the given value (`val`) belongs to this set or not.
        # -> `true` if the value belongs to this set;
        #    `false` otherwise.
        # ----------------------------------------------------------------------
        def valid?(val)
          @elements.include? val
        end

      end

      # Sets are also known as enumerations
      Enum = Set

      # ========================================================================
      # * Closed interval: [`min`, `max`] (peculiar domain).
      # ========================================================================
      class ClosedInterval
        attr_reader :range

        # ----------------------------------------------------------------------
        # * Initializes this closed interval: [`min`, `max`].
        # ----------------------------------------------------------------------
        def initialize(min, max)
          @range = (min..max)
        end

        # ----------------------------------------------------------------------
        # * Tells whether the given value (`val`) is contained within this
        #   interval.
        # -> `true` if the value belongs to this interval;
        #    `false` otherwise.
        # ----------------------------------------------------------------------
        def valid?(val)
          @range.include? val
        end
      end

      # Domain's constructor
      # [! This constructor should not be used: instead use `::declare` !]
      Constructor = Struct.new(:name, :internal_description, :domain)

      # ========================================================================
      # * [Variant type based on `ParameterType`]
      #   Abstract definition of a disjoint union (sum) of parameter's types.
      #   It helps to build a sum of different distinct types, for instance:
      #    "*If `x` is an element which can either be of type `A`, or type `B`;
      #     then, `x`'s type is a variant composed of `A` and `B`*"
      # ========================================================================
      class Variant
        attr_reader :underlying_types

        # ----------------------------------------------------------------------
        # * Initializes this variant parameter's types, with the given enclosed
        #   types (`underlying_types`).
        #   - `underlying_types`                            Array<ParameterType>
        #     the enclosed types that will be sumed-up in order to form this
        #     variant type
        # ----------------------------------------------------------------------
        def initialize(underlying_types)
          @underlying_types = underlying_types
        end

        # ----------------------------------------------------------------------
        # * Tells whether the given (`val`) is valid regarding at least one of
        #   the underlying types which compose this variant type.
        #   - `val`                                                       Object
        #     the value to check
        #   -> `true` if the value is matching one of the `underlying_types`;
        #      `false` otherwise.
        # ----------------------------------------------------------------------
        def valid?(val)
          @underlying_types.any? { |t| t.domain.valid? val }
        end

        # ----------------------------------------------------------------------
        # * Constructs a new type of command's parameter which maps a variant
        #   element (i.e.: an element which is complying with at least one
        #   of the `underlying_types`).
        # ----------------------------------------------------------------------
        def self.of(*underlying_types)
          underlying_types_names = underlying_types.map { |t| t.name }
          underlying_types_hint = underlying_types.map do |t|
            "#{t.internal_description} (#{t.name})"
          end

          type_name = "{#{underlying_types_names.join(",")}}"
          hint_msg = "Either a #{underlying_types_hint.join(", or a ")}"

          Constructor.new(type_name.to_sym,
                          hint_msg,
                          Variant.new(underlying_types))
        end
      end

      # ========================================================================
      # * [Generic based on `ParameterType`]
      #   Abstract definition of an homogeneous list of elements.
      # ========================================================================
      class GenericVectorization
        attr_reader :underlying_type

        # ----------------------------------------------------------------------
        # * Initializes this vectorized parameter with the given enclosed type
        #   (`underlying_type`).
        #   - `underlying_type`                                    ParameterType
        #     the enclosed type, that each of the nested element should
        #     comply with
        # ----------------------------------------------------------------------
        def initialize(underlying_type, *predicates)
          @underlying_type = underlying_type
          @predicates = predicates
          @predicates ||= Array.new
        end

        # ----------------------------------------------------------------------
        # * Tells whether the given (`val`) is indeed a vectorized value
        #   containg elements of the expected `underlying_type`.
        #   - `val`                                                       Object
        #     the value to check
        # -> `true` if the value is a vector of `underlying_type` elements;
        #    `false` otherwise.
        # ----------------------------------------------------------------------
        def valid?(val)
          return false unless val.is_a? Enumerable
          return false unless @predicates.all? { |p| p.call(val) }
          val.all? { |x| @underlying_type.domain.valid? x }
        end

      end

      # ========================================================================
      # * [Generic based on `ParameterType`]
      #   Representation of a variadic parameter
      #   (vectorization of an enclosed type)
      # ========================================================================
      class List < GenericVectorization

        # ----------------------------------------------------------------------
        # * Constructs a new type of command's parameter which maps fixed size
        #   list.
        #   - `type_name`                                                 String
        #     this variadic type's name
        #   - `underlying_type`                                    ParameterType
        #     the type of each of this list's elements
        #   - `hint_msg`                                       String [Optional]
        #     an hint which explains what the following `*predicates` actually
        #     check
        #   - `*predicates`                 Lambda(Object) => Boolean [Variadic]
        #     the additional checks to process on the value to check
        # ----------------------------------------------------------------------
        def self.of(type_name, underlying_type, hint_msg, *predicates)
          Constructor.new(type_name.to_sym,
                          "list of #{hint_msg}, with each element " +
                          "being a #{underlying_type.internal_description}",
                          List.new(underlying_type, *predicates))
        end
        private_class_method :of

        # ----------------------------------------------------------------------
        # * Constructs a new type of command's parameter which maps
        #   a list of elements, with at least `nb_elements`.
        #   - `type`                                               ParameterType
        #     the type of each of this list's elements
        #   - `nb_elements`                                              Integer
        #     the number of elements that the list should at least contain
        # ----------------------------------------------------------------------
        def self.of_at_least(type, nb_elements)
          of("Array[#{nb_elements}+]<#{type.name}>",
             type,
             "at least #{nb_elements} element(s)",
             lambda { |val| (nb_elements <= val.size) })
        end

        # ----------------------------------------------------------------------
        # * Constructs a new type of command's parameter which maps
        #   a list of elements, with exactly `nb_elements`.
        #   - `type`                                               ParameterType
        #     the type of each of this list's elements
        #   - `nb_elements`                                              Integer
        #     the number of elements that the list should at exactly contain
        # ----------------------------------------------------------------------
        def self.of_exactly(type, nb_elements)
          of("Array[#{nb_elements}]<#{type.name}>",
             type,
             "exactly #{nb_elements} element(s)",
             lambda { |val| (nb_elements == val.size) })
        end

        # ----------------------------------------------------------------------
        # * Constructs a new type of command's parameter which maps
        #   a list of elements, with at most `nb_elements`.
        #   - `type`                                               ParameterType
        #     the type of each of this list's elements
        #   - `nb_elements`                                              Integer
        #     the number of elements that the list should at most contain
        # ----------------------------------------------------------------------
        def self.of_at_most(type, nb_elements)
          of("Array[#{nb_elements}-]<#{type.name}>",
             type,
             "at most #{nb_elements} element(s)",
             lambda { |val| (nb_elements >= val.size) })
        end

      end

      # ------------------------------------------------------------------------
      # * Registers a new type of command's parameter under `ParameterType`.
      #   - `name` the type's name                                 Symbol/String
      #   - `internal_description` the type's description                 String
      #     for developers only (not the one documented)
      #   - `domain` the type's domain of definition                      Domain
      # ------------------------------------------------------------------------
      def self.declare(name, internal_description, domain)
        type = Constructor.new(name, internal_description, domain)
        self.const_set(name, type)
      end

      # Common domains' definitions
      ParameterType::declare(:Object,
                             "Object type (it is the default parameter type and means that none were provided)",
                             Domain.new(lambda { |x| true }))
      ParameterType::declare(:Coordinate,
                             "Coordinate of a point in a cartesian coordinate system (i.e.: `x` or `y`)",
                             ClosedInterval.new(0, 999))
      ParameterType::declare(:NullableCoordinate,
                             "Nullable coordinate of a point in a cartesian coordinate system (i.e.: `x` or `y`)",
                             Domain.new(lambda { |x| (x.nil?) or
                                                     (ParameterType::Coordinate.domain.valid? x) }))
      ParameterType::declare(:Boolean,
                             "Boolean value",
                             Set.new(true, false))
      ParameterType::declare(:Integer,
                             "Integer (positive or negative)",
                             Domain.new(lambda { |x| (x.is_a? ::Integer) }))
      ParameterType::declare(:PositiveInteger,
                             "Positive integer",
                             Domain.new(lambda { |x| (x.is_a? ::Integer) and (0 <= x) }))
      ParameterType::declare(:StrictlyPositiveInteger,
                             "Strictly positive integer",
                             Domain.new(lambda { |x| (x.is_a? ::Integer) and (0 < x) }))
      ParameterType::declare(:NullablePositiveInteger,
                             "Nullable positive integer",
                             Domain.new(lambda { |x| (x.nil?) or (PositiveInteger.domain.valid? x) }))
      ParameterType::declare(:Float,
                             "Real number (positive or negative)",
                             Domain.new(lambda { |x| (x.is_a? ::Float) }))
      ParameterType::declare(:PositiveFloat,
                             "Positive real number (Float)",
                             Domain.new(lambda { |x| (x.is_a? ::Float) and (0 <= x) }))
      ParameterType::declare(:NullablePositiveFloat,
                             "Nullable positive real number (Float)",
                             Domain.new(lambda { |x| (x.nil?) or
                                                     (ParameterType::PositiveFloat.domain.valid? x)}))
      ParameterType::declare(:StrictlyPositiveFloat,
                             "Strictly positive real number (Float)",
                             Domain.new(lambda { |x| (x.is_a? ::Float) and (0 < x) }))
      ParameterType::declare(:String,
                             "String value",
                             Domain.new(lambda { |x| (x.is_a? ::String) }))

      ParameterType::declare(:Direction,
                             "Movement direction",
                             Set.new(2, 4, 6, 8))
      ParameterType::declare(:RegionId,
                             "Region's identifier",
                             ClosedInterval.new(0, 63))
      ParameterType::declare(:LayerId,
                             "Layer's identifier",
                             ClosedInterval.new(0, 2))
      ParameterType::declare(:TerrainTag,
                             "Terrain tag",
                             ClosedInterval.new(0, 7))

      AREA_TYPES = [::Area::Rect, ::Area::Circle, ::Area::Ellipse, ::Area::Polygon]
      ParameterType::declare(:Area,
                             "Virtual area",
                             Domain.new(lambda { |x| AREA_TYPES.any? { |t| x.is_a? t }}))
      ParameterType::declare(:Tone,
                             "Color tone",
                             Domain.new(lambda { |x| x.is_a? ::Tone }))
      ParameterType::declare(:NullableTone,
                             "Nullable color tone",
                             Domain.new(lambda { |x| (x.nil?) or (x.is_a? ::Tone) }))
      BLENDING_MODES = {
        :normal      => 0,
        :addition    => 1,
        :subtraction => 2
      }
      ParameterType::declare(:BlendingMode,
                             "Sprites' blending type",
                             Set.new(*BLENDING_MODES.values))
      ParameterType::declare(:Opacity,
                             "Sprites' opacity",
                             ClosedInterval.new(0, 255))
      ParameterType::declare(:NullableOpacity,
                             "Nullable sprites' opacity",
                             Domain.new(lambda { |x| (x.nil?) or (ParameterType::Opacity.domain.valid? x) }))

      ParameterType::declare(:MouseButton,
                             "Mouse button / key",
                             Set.new(:mouse_left, :mouse_right,
                                     :mouse_center,
                                     :mouse_x1, :mouse_x2))

      ParameterType::declare(:EasingFunction,
                             "Easing function",
                             Set.new(*(Easing::FUNCTIONS.keys)))
      ParameterType::declare(:PositionRegardingCamera,
                             "Target's (i.e.: event) position regarding the camera's overall focus",
                             Set.new(:centered,
                                     :centered_left, :centered_right,
                                     :centered_top, :centered_bottom,
                                     :top_left, :top_right,
                                     :bottom_left, :bottom_right))

      ParameterType::declare(:MapId,
                             "Map's identifier",
                             ClosedInterval.new(1, 999))
      ParameterType::declare(:EventId,
                             "Event's identifier",
                             ClosedInterval.new(0, 99999))
      ParameterType::declare(:EventsSelector,
                             "Events' selector",
                             Domain.new(lambda { |x|
                               (ParameterType::EventId.domain.valid? x) or
                               (ParameterType::List::of_at_least(ParameterType::EventId, 1).domain.valid? x)
                             }))

      ParameterType::declare(:EventPageId,
                             "Event's page's identifier",
                             ClosedInterval.new(0, 99))
      ParameterType::declare(:EnemyId,
                             "Enemy's identifier",
                             ClosedInterval.new(1, 99999))

      ParameterType::declare(:ActorId,
                             "Actor's identifier",
                             ClosedInterval.new(1, 999))
      ParameterType::declare(:EquipmentSlot,
                             "Equipment's slot",
                             Set.new(:Weapon, :Head, :Body, :Shield, :Accessory))
      ParameterType::declare(:ItemId,
                             "Item's identifier",
                             ClosedInterval.new(1, 9999))
      ParameterType::declare(:SkillId,
                             "Skill's identifier",
                             ClosedInterval.new(1, 9999))
      ParameterType::declare(:ElementId,
                             "Element's identifier",
                             ClosedInterval.new(1, 99))
      ParameterType::declare(:CharsetIndex,
                             "The index of the actor's charset (walking graphic) within its file",
                             ClosedInterval.new(0, 7))
      ParameterType::declare(:FaceIndex,
                             "The index of actor's face graphic inside the faceset",
                             ClosedInterval.new(0, 7))

      # TODO: add other domains' definition

    end


    # ----------------------------------------------------------------------
    # * Declares a new RME Command.
    # ----------------------------------------------------------------------
    def self.declare(cmd)
      # Selecting section (namespace) under which the command will be declared
      section =
        if cmd[:section].is_a? Module
          cmd[:section]
        else
          self
        end

      # Validating the command's definition
      validate_cmd(cmd)

      # Consolidating command's parameters
      unless cmd[:parameters].nil?
        cmd[:parameters].each do |p|
            similar = RME::Documentation::defined_parameters(section)[p[:name]]

            # Retrieving definition of this parameter, if it is missing and
            # if one with the same name has already been defined before
            unless similar.nil?
              p[:type] = similar.type.raw_type if p[:type].nil?
              p[:description] = similar.description if p[:description].nil?
            end

            p[:type] ||= ParameterType::Object
        end
      end

      # Documenting command
      doc_parameters =
       unless cmd[:parameters].nil?
         cmd[:parameters].map do |p|
           RME::Documentation::Parameter.new(p[:name], p[:type], p[:description], p[:default])
         end
       else
         Hash.new
       end
      Documentation::describe_method(section,
                                     RME::Documentation::Command.new(cmd[:name],
                                                                     cmd[:description],
                                                                     doc_parameters,
                                                                     cmd[:see],
                                                                     cmd[:deprecated_since]))

      # TODO: Handle aliases regarding the documentation process

      # Generating method
      section.send(:define_method, cmd[:name]) do |*args|

        # Parsing parameters
        parsed_args = Command::parse_cmd_args(args, cmd[:parameters])

        # Validating each parameter
        unless cmd[:parameters].nil?
          cmd[:parameters].each_with_index do |expected, i|

            # Handling optional parameter
            unless expected[:default].nil?
              if parsed_args[i].nil?
                parsed_args << expected[:default]
              end
            end

            # Validating provided parameter
            unless expected[:type][:domain].valid? parsed_args[i]
              arg_value = (parsed_args[i].nil?) ? "nil (i.e.: not provided)." : parsed_args[i]
              raise "Wrong usage of command: `#{cmd[:name]}` !\n" +
                    "\tInvalid value for parameter: `#{expected[:name]}`.\n" +
                    "\tIt should be a #{expected[:type][:internal_description]}.\n" +
                    "\tActual value is: `#{arg_value}`."
            end

          end
        end

        # Preparing command's arguments
        cmd_args =
          if not(cmd[:parameters].nil?) and (1 == cmd[:parameters].size)
            parsed_args[0]
          else
            parsed_args
          end

        # Adding the execution context as an additional parameter if requested
        extended_cmd_args =
          if (true == cmd[:add_exec_ctx])
            if (cmd_args.is_a? Array)
              cmd_args << self
            else
              [] << cmd_args << self
            end
          else
            cmd_args
          end

        # Calling the delegated method
        if (cmd[:call].is_a? Proc)
          cmd[:call]
        elsif block_given?
          yield extended_cmd_args
        else
          raise "There is no underlying block or method to call for #{cmd[:name]} !"
        end

       end

       # Generating aliases
       aliases =
         if (cmd[:alias].nil?)
           Array.new
         elsif (cmd[:alias].is_a? Symbol)
           Array.new << cmd[:alias]
         elsif (cmd[:alias].is_a? Array)
           cmd[:alias]
         else
           raise "Invalid alias(es) definition for #{section}::#{cmd[:name]} !"
         end

       aliases.each do |a|
         section.send(:alias_method, a, cmd[:name])
       end

    end

    # ==========================================================================
    # * Error/Exception which maps invalid commands' definitions.
    # ==========================================================================
    class DefinitionError < StandardError

      # ------------------------------------------------------------------------
      # * Constructs a new `DefinitionError`.
      #   - `cmd_name` the name of the command which               Symbol/String
      #     has fired this error
      #   - `message` the underlying message which                        String
      #     explains the error
      # ------------------------------------------------------------------------
      def initialize(cmd_name, message)
        super("Invalid definition for command: #{cmd_name}.\n#{message}")
      end

    end

    # --------------------------------------------------------------------------
    # * Tells whether the given command's parameter is a variadic one or not.
    #   - `cmd_param` the command's parameter's definition                  Hash
    # -> `true` if the parameter is a variadic one;
    #    `false` otherwise.
    # --------------------------------------------------------------------------
    def self.is_variadic_parameter?(cmd_param)
      (not cmd_param[:type].nil?) and
      (cmd_param[:type].domain.is_a? ParameterType::GenericVectorization)
    end

    # --------------------------------------------------------------------------
    # * Checks if the provided command's definition (`cmd`) is a valid one
    #   or not. If it is not, it throws an error to the upper layer.
    #   - `cmd` the command's definition                                    Hash
    # --------------------------------------------------------------------------
    def self.validate_cmd(cmd)

      # Validating command's global data's definition
      if cmd[:name].nil?
         cmd[:name].empty?
         raise DefinitionError.new('{{undefined}}',
                                   "One of the defined command has no name !")
      end

      # Validating parameters' definitions
      unless cmd[:parameters].nil?
        # Checking if there is at most one variadic parameter
        nb_variadic = cmd[:parameters].select { |x| is_variadic_parameter? x }
                                      .size

        if (1 < nb_variadic)
          raise DefinitionError.new(cmd[:name],
                                    "At most one variadic parameter is accepted " +
                                    "(i.e.: 0 or 1 variadic parameter).\n" +
                                    "#{nb_variadic} given !")
        end

        # Checking each parameter's definition
        cmd[:parameters].each_with_index do |param, i|

          if param[:name].nil? or
             param[:name].empty?
            raise DefinitionError.new(cmd[:name],
                                      "One of the parameter (##{i}) has no name !")
          end

        end
      end

    end
    private_class_method :validate_cmd

    # ------------------------------------------------------------------------
    # * Parses the supplied command's arguments (`args`), according to what
    #   is expected (`expected_params`).
    #   (It mainly acts as a proxy to decompose variadic arguments
    #    in an handier way)
    #   - `args`                                                         Array
    #     the command's argument, as provided by the end-user
    #   - `expected_params`                                               Hash
    #     the definition of expected command's arguments
    # -> The array of parsed arguments.
    # ------------------------------------------------------------------------
    def self.parse_cmd_args(args, expected_params)
      return args if expected_params.nil?
      return args if (expected_params.size > args.size)

      first_part = expected_params.take_while { |x| not(is_variadic_parameter? x) }
      last_part = expected_params.reverse
                                 .take_while { |x| not(is_variadic_parameter? x) }

      first = args[0, first_part.size]
      last = args[-1, last_part.size]

      variadic = args[first_part.size, args.size - (first_part.size + last_part.size)]

      first + (Array.new << variadic) + last
    end

  end

end
