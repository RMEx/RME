# -*- coding: utf-8 -*-

# ==============================================================================
# * RPG Maker (VX / VX.ACE) Extender
# ------------------------------------------------------------------------------
# Internal definition of how to document commands.
# ==============================================================================
module RME

  # ============================================================================
  # ** Documentation module
  # ============================================================================
  module Doc

    # Eigenclass
    class << self
      attr_accessor :schema
      Doc.schema ||= Hash.new
    end

    # ==========================================================================
    # ** Representation of a documented commands.
    # --------------------------------------------------------------------------
    # The following structure will be furtherly serialized in order to produce
    # an external documentation.
    # ==========================================================================
    class Command

      # Attributes
      attr_reader :name
      attr_reader :parameters

      # ------------------------------------------------------------------------
      # * Constructs a new `Command` based on the given parameters.
      #   - `name` the command's symbol                            Symbol/String
      #   - `parameters` the command's parameters               Array[Parameter]
      # ------------------------------------------------------------------------
      def initialize(name, parameters)
        @name = name
        @parameters = parameters
      end

    end

    # ==========================================================================
    # ** Representation of a documented command's parameter.
    # --------------------------------------------------------------------------
    # The following structure will be furtherly serialized in order to produce
    # an external documentation.
    # ==========================================================================
    class Parameter

      # Attributes
      attr_reader :name
      attr_reader :type
      attr_reader :description
      attr_reader :default_value

      # ------------------------------------------------------------------------
      # * Constructs a new `Parameter` based on the given parameters.
      #   - `name` the parameters's symbol                         Symbol/String
      #   - `type` the parameter's type               ParameterType::Constructor
      #   - `description` the parameter's description                     String
      #   - `default_value` the parameter's default value if              Object
      #     it is optional
      # ------------------------------------------------------------------------
      def initialize(name, type, description, default_value)
        @name = name
        @type = ParameterType.new(type)
        @description = description
        @default_value = default_value
      end

      # ------------------------------------------------------------------------
      # * Tells whether this parameter is explicetely documented or not.
      # -> `true` if this parameter is correctly documented;
      #    `false` otherwise.
      # TODO: Revise this implementation
      # ------------------------------------------------------------------------
      def documented?
        nil.eql? @description
      end

      # ------------------------------------------------------------------------
      # * Tells whether this parameter is optional or not.
      # -> `true` if this parameter is optional
      #    `false` otherwise.
      # ------------------------------------------------------------------------
      def optional?
        nil.eql? @default_value
      end

    end

    # ==========================================================================
    # ** Representation of a documented command's parameter's type.
    # --------------------------------------------------------------------------
    # The following structure will be furtherly serialized in order to produce
    # an external documentation.
    # ==========================================================================
    class ParameterType

      # Attributes
      attr_reader :raw_type
      attr_reader :description

      # ------------------------------------------------------------------------
      # * Constructs a new `Parameter` based on the given parameters.
      #   - `raw_type` the parameters's concrete      ParameterType::Constructor
      #     type
      # ------------------------------------------------------------------------
      def initialize(raw_type)
        @raw_type = raw_type
        @description = "doc.#{raw_type.name}.description"
      end

    end

    # ----------------------------------------------------------------------------
    # * Describes one method explicitely.
    #   - `namespace` the module under which the command             Symbol/String
    #     should be located
    #   - `command` the documented command                                 Command
    # ----------------------------------------------------------------------------
    def self.describe_method(namespace, command)
      Doc.schema[namespace] ||= Hash.new
      Doc.schema[namespace][command.name] = command
    end

  end

end
