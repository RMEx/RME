# -*- coding: utf-8 -*-

# ==============================================================================
# * RPG Maker (VX / VX.ACE) Extender
# ------------------------------------------------------------------------------
# Internal definition of how to document commands.
# ==============================================================================
module RME

  # ============================================================================
  # ** Simple representation of a properties' file, in a Ruby context.
  # ============================================================================
  class Configuration

    # --------------------------------------------------------------------------
    # * Constructs a new `Configuration object` based on the properties
    #   written down in the given file.
    #   - `filename` the properties' filename                             String
    #   - `fallback` a configuration object to use as fallback     Configuration
    # --------------------------------------------------------------------------
    def initialize(filename, fallback = nil)
      @properties = eval(File.open(filename) { |f| f.read })
      @fallback = fallback
    end

    # --------------------------------------------------------------------------
    # * Returns the value registered under the given `key` in the associated
    #   configuration file. If this configuration has been initialized with
    #   a fallback, the latter will be looked after if the `key` was not
    #   registered.
    #   - `key` the property whose value should be retrived               String
    # -> the value registered under the given `key`;
    #    `nil` otherwise.
    # --------------------------------------------------------------------------
    def [](key)
      return @properties[key] if (@properties.key? key)
      return @fallback[key] if fallback?
      nil
    end

    # --------------------------------------------------------------------------
    # * Tells whether this configuration object has been initialized with
    #   a fallback one or not.
    # -> `true` if a fallback has been registred;
    #    `false` otherwise.
    # --------------------------------------------------------------------------
    def fallback?
      not @fallback.nil?
    end

  end


  # ============================================================================
  # ** Documentation module
  # ============================================================================
  module Doc

    # Eigenclass
    class << self
      attr_accessor :schema
      attr_accessor :default_translation

      Doc.schema ||= Hash.new
      Doc.default_translation ||= Configuration.new('doc.properties.rb')
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
      attr_reader :description
      attr_reader :parameters

      # ------------------------------------------------------------------------
      # * Constructs a new `Command` based on the given parameters.
      #   - `name` the command's symbol                            Symbol/String
      #   - `description` the command's description                       String
      #   - `parameters` the command's parameters               Array[Parameter]
      # ------------------------------------------------------------------------
      def initialize(name, description, parameters)
        @name = name
        @description = description
        @parameters = parameters
      end

      # ------------------------------------------------------------------------
      # * Tells whether this command is explicetely documented or not.
      # -> `true` if this command is correctly documented;
      #    `false` otherwise.
      # TODO: Revise this implementation
      # ------------------------------------------------------------------------
      def documented?
        not @description.nil?
      end

      # ------------------------------------------------------------------------
      # * Serializes this `Command` into JSON.
      # ------------------------------------------------------------------------
      def to_json(translator)
        parameters = @parameters.map{|p| p.to_json(translator)}.join(",")
        description_key = "doc.cmd.#{@description}"

        "{" +
          "\"name\": \"#{@name}\"," +
          "\"description\": \"#{translator[description_key]}\"," +
          "\"parameters\": [#{parameters}]" +
        "}"
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
        not @description.nil?
      end

      # ------------------------------------------------------------------------
      # * Tells whether this parameter is optional or not.
      # -> `true` if this parameter is optional
      #    `false` otherwise.
      # ------------------------------------------------------------------------
      def optional?
        not @default_value.nil?
      end

      # ------------------------------------------------------------------------
      # * Serializes this `Parameter` into JSON.
      # ------------------------------------------------------------------------
      def to_json(translator)
        default_value_property =
          if optional?
            ",\"defaultValue\": \"#{@default_value}\""
          else
            ""
          end

        description_key = "doc.parameter.#{@description}.description"

        "{" +
          "\"name\": \"#{@name}\"," +
          "\"description\": \"#{translator[description_key]}\"," +
          "\"type\": #{@type.to_json(translator)}" +
          default_value_property +
        "}"
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

      # ------------------------------------------------------------------------
      # * Serializes this `ParameterType` into JSON.
      # ------------------------------------------------------------------------
      def to_json(translator)
        "{" +
          "\"description\":\"#{translator[@description]}\"," +
          "\"name\":\"#{@raw_type.name}\"" +
        "}"

        # TODO: Serializes specific types {Predicate-based, Set@Enum, Intervals}
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


    # --------------------------------------------------------------------------
    # * Generates the JSON documentation of commands.
    #   - `lang` the language in which the documentation                  String
    #     should be written
    # --------------------------------------------------------------------------
    def self.generate(lang = "en")
      # Selecting properties' file for translations
      translator =
        unless "en".eql? lang
          Configuration.new("doc_#{lang}.properties.rb", Doc.default_translation)
        else
          Doc.default_translation
        end

      # Generating modules' documentation
      documented_namespaces = Doc.schema.map do |namespace, commands|
        documented_commands = commands.map{|name, c| c.to_json(translator)}.join(",")
        "\"#{namespace}\": [#{documented_commands}]"
      end

      "{#{documented_namespaces.join(",")}}"
    end

  end

end
