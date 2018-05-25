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
      ParameterType::declare(:PositiveInteger,
                             "Positive integer",
                             Domain.new(lambda { |x| (x.is_a? Integer) and (0 <= x) }))
      ParameterType::declare(:NullablePositiveInteger,
                             "Nullable positive integer",
                             Domain.new(lambda { |x| (x.nil?) or (PositiveInteger.domain.valid? x) }))

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

        # Calling the delegated method
        if (cmd[:call].is_a? Proc)
          cmd[:call]
        elsif block_given?
          yield args
        else
          raise "There is no underlying block or method to call for #{cmd[:name]} !"
        end

      end
    end

  end

end
