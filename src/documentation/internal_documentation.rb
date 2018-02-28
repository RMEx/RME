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

        # Serializing specific types {Predicate-based, Set@Enum, Intervals}
        domain = @raw_type.domain
        additional_info =
          if domain.is_a? RME::Command::ParameterType::Domain
            # TODO
            ""
          elsif domain.is_a? RME::Command::ParameterType::Set
            available_values = domain.elements.map {|x| "\"#{x}\""}.join(",")
            "," + "\"availableValues\": [#{available_values}]"
          elsif domain.is_a? RME::Command::ParameterType::ClosedInterval
            "," + "\"min\":\"#{domain.range.min}\"" + "," + "\"max\": \"#{domain.range.max}\""
          else
            ""
          end


        "{" +
          "\"description\":\"#{translator[@description]}\"," +
          "\"name\":\"#{@raw_type.name}\"" +
          additional_info +
        "}"

      end

    end

    # ----------------------------------------------------------------------------
    # * Describes one method explicitely.
    #   - `section` the module under which the command               Symbol/String
    #     should be located
    #   - `command` the documented command                                 Command
    # ----------------------------------------------------------------------------
    def self.describe_method(section, command)
      Doc.schema[section] ||= Hash.new
      Doc.schema[section][command.name] = command
    end

    # --------------------------------------------------------------------------
    # * Generates the JSON documentation which corresponds to the given
    #   section.
    # --------------------------------------------------------------------------
    def self.generate_section_documentation(section_name, commands, translator)
      section_description_key = "doc.section.#{section_name}"
      commands_name = commands.keys.map {|c| "\"#{c}\""}.join(",")

      "{" +
        "\"name\": \"#{section_name}\"," +
        "\"description\": \"#{translator[section_description_key]}\"," +
        "\"commands\": [#{commands_name}]" +
      "}"
    end
    private_class_method :generate_section_documentation

    # --------------------------------------------------------------------------
    # * Mimics `FileTools.mkdir_p` which is available          [Internal method]
    #   in newer Ruby versions (>= 1.9.3).
    #   - `path` the full directory's path to create if                   String
    #     if it does not exist yet
    # --------------------------------------------------------------------------
    def self.full_mkdir(path)
      fragments = path.split(/[\/\\]/)

      1.upto(fragments.size) do |i|
        current_directory = fragments[0...i].join("/")
        Dir.mkdir(current_directory) unless Dir.exist?(current_directory)
      end
    end
    private_class_method :full_mkdir

    # --------------------------------------------------------------------------
    # * Generates the JSON documentation of commands into files.
    #   - `output_dir` the directory under which the produced             String
    #     documentation files should be placed
    #   - `lang` the language in which the documentation                  String
    #     should be written
    # --------------------------------------------------------------------------
    def self.generate(output_dir, lang = "en")
      # Selecting properties' file for translations
      translator =
        unless "en".eql? lang
          Configuration.new("doc_#{lang}.properties.rb", Doc.default_translation)
        else
          Doc.default_translation
        end

      # Generating sections' related documentation
      Doc.schema.each do |section, commands|

        # TODO: Revise this way of removing a prefix
        section_name = section.name.reverse.chomp("RME::Command::".reverse).reverse

        section_dir = "#{output_dir}/#{section_name}"
        full_mkdir(section_dir)

        # Generating section's documentation file
        section_documentation = generate_section_documentation(section_name,
                                                               commands,
                                                               translator)
        File.open("#{section_dir}.json", 'w') do |f|
          f.write(section_documentation)
        end

        # Generating section's commands' documentation files
        commands.each do |name, c|
          File.open("#{section_dir}/#{name}.json", 'w') do |f|
            f.write(c.to_json(translator))
          end
        end
      end

    end

  end

end
