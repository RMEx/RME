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
      #   Static list / tuples (static vectorization of an enclosed type).
      # ========================================================================
      class List < GenericVectorization

        # ----------------------------------------------------------------------
        # * Constructs a new type of command's parameter which maps fixed size
        #   list.
        #   - `type`                                               ParameterType
        #     the type of each of this list's elements
        #   - `hint_msg`                                       String [Optional]
        #     an hint which explains what the following `*predicates` actually
        #     check
        #   - `*predicates`                 Lambda(Object) => Boolean [Variadic]
        #     the additional checks to process on the value to check
        # ----------------------------------------------------------------------
        def self.of(type, hint_msg, *predicates)
          Constructor.new("List_of_#{type.name}".to_sym,
                          "list of #{hint_msg}, with each element " +
                          "being a #{type.internal_description}",
                          List.new(type, *predicates))
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
          of(type,
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
          of(type,
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
          of(type,
             "at most #{nb_elements} element(s)",
             lambda { |val| (nb_elements >= val.size) })
        end

      end

      # ========================================================================
      # * [Generic based on `ParameterType`]
      #   Variadic parameter (dynamic vectorization of an enclosed type).
      # ========================================================================
      class Variadic < GenericVectorization

        # ----------------------------------------------------------------------
        # * Constructs a new type of command's parameter which maps
        #   variadic ones.
        #   - `type`                                               ParameterType
        #     the underlying type of this variadic parameter
        #   - `hint_msg`                                       String [Optional]
        #     an hint which explains what the following `*predicates` actually
        #     check
        #   - `*predicates`                 Lambda(Object) => Boolean [Variadic]
        #     the additional checks to process on the value to check
        # ----------------------------------------------------------------------
        def self.of(type, hint_msg = "", *predicates)
          Constructor.new("Variadic_of_#{type.name}".to_sym,
                          "variadic of #{hint_msg}, with each element " +
                          "being a #{type.internal_description}",
                          Variadic.new(type, *predicates))
        end

        # ----------------------------------------------------------------------
        # * Constructs a new type of command's parameter which maps
        #   variadic ones, with at least `nb_elements`.
        #   - `type`                                               ParameterType
        #     the underlying type of this variadic parameter
        #   - `nb_elements`                                              Integer
        #     the number of elements that the variadic value should at least
        #     contain
        # ----------------------------------------------------------------------
        def self.of_at_least(type, nb_elements)
          of(type,
             "at least #{nb_elements} element(s)",
             lambda { |val| (nb_elements <= val.size) })
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

      # Validating command
      unless cmd[:parameters].nil?
        cmd[:parameters].each do |p|

          if p[:name].nil? or p[:name].empty?
            raise "Invalid parameter's definition for command: #{cmd[:name]} !"
          else
            similar = RME::Documentation::defined_parameters(section)[p[:name]]

            unless similar.nil?
              p[:type] = similar.type.raw_type if p[:type].nil?
              p[:description] = similar.description if p[:description].nil?
            end

            p[:type] ||= ParameterType::Object
          end
        end
      end

      # Documenting method
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

        # Validating each parameter
        unless cmd[:parameters].nil?
          cmd[:parameters].each_with_index do |expected, i |

            # Handling optional parameter
            unless expected[:default].nil?
              if args[i].nil?
                args << expected[:default]
              end
            end

            # Validating provided parameter
            unless expected[:type][:domain].valid? args[i]
              arg_value = (args[i].nil?) ? "nil (i.e.: not provided)." : args[i]
              raise "Invalid parameter: #{expected[:name]} " +
                    "(should be a #{expected[:type][:internal_description]}). " +
                    "Actual value is #{arg_value}"
            end

          end
        end

        # Preparing command's arguments
        cmd_args =
          if not(cmd[:parameters].nil?) and (1 == cmd[:parameters].size)
            args[0]
          else
            args
          end

        # Calling the delegated method
        if (cmd[:call].is_a? Proc)
          cmd[:call]
        elsif block_given?
          yield cmd_args
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

  end

end
