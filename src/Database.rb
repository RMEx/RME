# -*- coding: utf-8 -*-
#==============================================================================
# ** RME V1.0.0 Database
#------------------------------------------------------------------------------
#  With : 
# Nuki
#------------------------------------------------------------------------------
# Provide two customs databases
#==============================================================================


#==============================================================================
# ** Object
#------------------------------------------------------------------------------
#  Add coersion stuff
#==============================================================================

class Object
  #--------------------------------------------------------------------------
  # * identity
  #--------------------------------------------------------------------------
  def nothing; self; end
  alias_method :noth, :nothing
  alias_method :to_poly, :nothing
  #--------------------------------------------------------------------------
  # * Magic coersion
  #--------------------------------------------------------------------------
  def db_cast_boolean
    return self if self.is_a?(TrueClass) || self.is_a?(FalseClass)
    return false unless self.respond_to?(:to_s)
    value = begin !!eval(self.to_s)
      rescue Exception => exc
        false
      end
  end
  alias_method :ptbo, :db_cast_boolean
  alias_method :magic_to_bool, :ptbo
end

#==============================================================================
# ** String
#------------------------------------------------------------------------------
#  Coersion stuff
#==============================================================================

class String
  #--------------------------------------------------------------------------
  # * Polymorphism cast
  #--------------------------------------------------------------------------
  def to_poly
    begin
      eval(self)
    rescue Exception => exc
      nil
    end
  end
  #--------------------------------------------------------------------------
  # * bool cast
  #--------------------------------------------------------------------------
  def magic_to_bool
    !!to_poly
  end
end

#==============================================================================
# ** Types
#------------------------------------------------------------------------------
#  Minimalist types
#==============================================================================

module Types

  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    #--------------------------------------------------------------------------
    # * Build a type
    #--------------------------------------------------------------------------
    def make(type)
      return CommonDB::TYPES.find{|t|t.match(type)} if type.is_a?(Symbol)
      if type.is_a?(Array)
        return Types::Complex.new(:list, (make(type[1])))
      end
    end
    #--------------------------------------------------------------------------
    # * Infer a type
    #--------------------------------------------------------------------------
    def inference(value)
      return :integer   if value.is_a?(Fixnum)
      return :float     if value.is_a?(Float)
      return :string    if value.is_a?(String)
      return :boolean   if value.is_a?(FalseClass) || value.is_a?(TrueClass)
      if value.is_a?(Array)
        v = value.compact
        return [:list, :poly] if v.length == 0 
        t = inference(v.first)
        return [:list, t] if v.all?{|x| inference(x) == t}
        return [:list, :poly]
      end
      return :poly
    end
  end

  #==============================================================================
  # ** Abstract
  #------------------------------------------------------------------------------
  #  Abstract type representation
  #==============================================================================
  
  class Abstract
    #--------------------------------------------------------------------------
    # * Public instance variable
    #--------------------------------------------------------------------------
    attr_accessor :coersion
    attr_accessor :name
    attr_accessor :names
    #--------------------------------------------------------------------------
    # * Constructor
    #--------------------------------------------------------------------------
    def initialize(name, names, coer)
      @name     = name
      @names    = names 
      coersion  = coer
      if coer.is_a?(Symbol)
        coersion = Proc.new {|x| x.send(coer)}
      end
      @coersion = coersion
    end
    #--------------------------------------------------------------------------
    # * Produce coersion
    #--------------------------------------------------------------------------
    def cast(x)
      self.coersion.call(x)
    end
    #--------------------------------------------------------------------------
    # * Check type name
    #--------------------------------------------------------------------------
    def match(label)
      return true if label.to_sym ==  @name.to_sym
      return @names.include?(label)
    end
  end

  #==============================================================================
  # ** Simple
  #------------------------------------------------------------------------------
  #  Simple type representation
  #==============================================================================

  class Simple < Abstract
    #--------------------------------------------------------------------------
    # * Public instance variables
    #--------------------------------------------------------------------------
    attr_accessor :is_rgss
    #--------------------------------------------------------------------------
    # * Constructor
    #--------------------------------------------------------------------------
    def initialize(name, names, coer, rgss = false)
      super(name, names, coer)
      @is_rgss = rgss
    end
    alias_method :rgss?, :is_rgss
  end

  #==============================================================================
  # ** Complex
  #------------------------------------------------------------------------------
  #  Complex type representation
  #==============================================================================

  class Complex < Abstract
    #--------------------------------------------------------------------------
    # * Instances variables
    #--------------------------------------------------------------------------
    attr_accessor :subtype
    #--------------------------------------------------------------------------
    # * Constructor
    #--------------------------------------------------------------------------
    def initialize(name, subtype)
      @subtype = subtype
      coersion = ->(subtype,x){x.collect{|y|subtype.cast(y)}}
      super(name, [], coersion.curry.call(@subtype))
    end
  end

end 

#==============================================================================
# ** CommonDB
#------------------------------------------------------------------------------
#  Common Database utils
#==============================================================================

module CommonDB
  #--------------------------------------------------------------------------
  # * Configuration
  #--------------------------------------------------------------------------
  RGSS_PREFIX = "VXACE_"
  #--------------------------------------------------------------------------
  # * Micro Structures
  #--------------------------------------------------------------------------
  EmbedData = Struct.new(:name, :const, :container)
  #--------------------------------------------------------------------------
  # * Types infos
  #--------------------------------------------------------------------------
  TYPES = [
    Types::Simple.new(:integer,   [:int, :integer, :natural, :fixnum],    :to_i),
    Types::Simple.new(:float,     [:float, :double, :real, :numeric],     :to_f),
    Types::Simple.new(:string,    [:string, :text, :raw],                 :to_s),
    Types::Simple.new(:boolean,   [:bool, :boolean, :switch],             :magic_to_bool),
    Types::Simple.new(:poly,      [:poly, :polymorphic, :script, :rgss],  :to_poly),
    # Types spéciaux (issu du RGSS)
    Types::Simple.new(:actor,     [:actor, :actors, :heroes, :people],    :to_i, true),
    Types::Simple.new(:map,       [:map, :maps, :game_map, :gamemap],     :to_i, true),
    Types::Simple.new(:klass,     [:klass, :actor_type, :classes, :klasses],:to_i, true),
    Types::Simple.new(:skill,     [:kill, :skills, :jutsu],               :to_i, true),
    Types::Simple.new(:item,      [:item, :items, :usable_item],          :to_i, true),
    Types::Simple.new(:weapon,    [:weapon, :weapons],                    :to_i, true),
    Types::Simple.new(:armor,     [:armor, :armors],                      :to_i, true),
    Types::Simple.new(:enemy,     [:enemy, :enemies, :opposant],          :to_i, true),
    Types::Simple.new(:troop,     [:troop, :group, :troops],              :to_i, true),
    Types::Simple.new(:state,     [:state, :statement, :states],          :to_i, true),
    Types::Simple.new(:animtation,[:animtation, :anim],                   :to_i, true),
    Types::Simple.new(:tileset,   [:tileset, :tilesets, :tile, :tiles],   :to_i, true),
    Types::Simple.new(:mapinfo,   [:mapinfo, :mapinfos, :infomap],        :to_i, true)
  ]
  #--------------------------------------------------------------------------
  # * Embeded structs
  #--------------------------------------------------------------------------
  RGSS_EMBEDABLE = [
    EmbedData.new(:actor,       RPG::Actor,       load_data("Data/Actors.rvdata2")),
    EmbedData.new(:klass,       RPG::Class,       load_data("Data/Classes.rvdata2")),
    EmbedData.new(:skill,       RPG::Skill,       load_data("Data/Skills.rvdata2")),
    EmbedData.new(:item,        RPG::Item,        load_data("Data/Items.rvdata2")),
    EmbedData.new(:weapon,      RPG::Weapon,      load_data("Data/Weapons.rvdata2")),
    EmbedData.new(:armor,       RPG::Armor,       load_data("Data/Armors.rvdata2")),
    EmbedData.new(:enemy,       RPG::Enemy,       load_data("Data/Enemies.rvdata2")),
    EmbedData.new(:troop,       RPG::Troop,       load_data("Data/Troops.rvdata2")),
    EmbedData.new(:state,       RPG::State,       load_data("Data/States.rvdata2")),
    EmbedData.new(:animtation,  RPG::Animation,   load_data("Data/Animations.rvdata2")),
    EmbedData.new(:tileset,     RPG::Tileset,     load_data("Data/Tilesets.rvdata2")),
    EmbedData.new(:mapinfo,     RPG::MapInfo,     load_data("Data/MapInfos.rvdata2")),
  ]
  RGSS_TYPES = [
    :actor, :map, :klass, :item, :weapon, :armor, :enemy, :troop,
    :state, :animtation, :tileset, :mapinfo, :skills
  ]
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    #--------------------------------------------------------------------------
    # * Get table path
    #--------------------------------------------------------------------------
    def path
      "Database"
    end
    #--------------------------------------------------------------------------
    # * Get a RGSS ressource
    #--------------------------------------------------------------------------
    def rgss_access(data, id)
      return load_data(sprintf("Data/Map%03d.rvdata2", id)) if data == :map
      ctn = RGSS_EMBEDABLE.find{|d|d.name == data}
      raise(RuntimeError, "Invalid container") unless ctn
      ctn.container[id]
    end
  end

  #==============================================================================
  # ** Table
  #------------------------------------------------------------------------------
  #  Generic Table representation
  #==============================================================================

  class Table
    #--------------------------------------------------------------------------
    # * Singleton
    #--------------------------------------------------------------------------
    class << self
      #--------------------------------------------------------------------------
      # * Public instance variable
      #--------------------------------------------------------------------------
      attr_accessor :fields
      attr_accessor :classname
      attr_accessor :records
      attr_reader   :primary_key
      alias :schema :fields
      #--------------------------------------------------------------------------
      # * Inherit views
      #--------------------------------------------------------------------------
      def inherit(klass)
        unless klass.respond_to?(:schema)
          raise(ArgumentError, "Class isn't a Table")
        end
        klass.schema.each do |field, type|
          if type.is_a?(Symbol)
            self.send(type, field)
          else
            self.send(type[0], type[1], field)
          end
        end
        define_primary_key (klass.primary_key)
      end
      #--------------------------------------------------------------------------
      # * Insertion
      #--------------------------------------------------------------------------
      def insert(*args); self.new(*args); end
      #--------------------------------------------------------------------------
      # * Build a typed field
      #--------------------------------------------------------------------------
      def handle_field(type, name)
        @records    ||= Hash.new
        @classname  ||= self.to_s.to_sym
        @fields     ||= Hash.new
        @fields[name] = type
        self.instance_variable_set("@#{name}".to_sym, nil)
        if RGSS_TYPES.include?(type)
          accessor = Proc.new do
            instance_var = self.instance_variable_get("@#{name}".to_sym)
            CommonDB.rgss_access(type, instance_var) if instance_var
          end
          self.send(:define_method, name.to_sym, &accessor)
        else
          self.send(:attr_reader, name.to_sym)
        end
        self.send(:attr_writer, name.to_sym)
        return name
      end
      #--------------------------------------------------------------------------
      # * Embed list
      #--------------------------------------------------------------------------
      def list(subtype, name)
        return self.handle_field([:list, subtype], name) if subtype.is_a?(Symbol)
        return self.handle_field(subtype, name)
      end
      #--------------------------------------------------------------------------
      # * Define primary key
      #--------------------------------------------------------------------------
      def define_primary_key(key)
        if !@fields.has_key?(key)
          raise(ArgumentError, "Unknown field")
        elsif RGSS_TYPES.include?(@fields[key])
          raise(ArgumentError, "RGSS fields couldnt be Primary Key") 
        else
          @primary_key = key
        end
      end
      alias :pk         :define_primary_key
      alias :define_pk  :define_primary_key
      #--------------------------------------------------------------------------
      # * Enumerable
      #--------------------------------------------------------------------------
      def length; @records.length; end
      def [](prk); @records[prk]; end
      def each(&block); @records.each(&block); end
      alias   :count  :length
      alias   :size   :length
      alias   :all    :records
      include Enumerable
      #--------------------------------------------------------------------------
      # * Construct types by field
      #--------------------------------------------------------------------------
      TYPES.each do |type|
        self.send(:define_method, type.name, &->(x){handle_field(type.name, x)})
        type.names.select{|u|u != type.name}.each do |name|
          self.send(:alias_method, name, type.name)
        end
      end 
    end 
    #--------------------------------------------------------------------------
    # * Initialize a data
    #--------------------------------------------------------------------------
    def initialize(*args)
      self.class.records  ||= hash.new
      if args.length != self.class.fields.length
        msg = "#{self.class.classname}:
          #{args.length} donnés, #{self.class.fields.length} requis"
        raise(ArgumentError, msg) 
      end
      arr_fields = self.class.fields.to_a
      (0...args.length).each do |i|
        current     = args[i]
        name, typen = *arr_fields[i]
        type        = Types.make(typen)
        value       = type.cast(current)
        self.instance_variable_set("@#{name}".to_sym, value)
        index = self.send(self.class.primary_key)
        self.class.records[index] = self
      end
    end
  end 
end

#==============================================================================
# ** Static
#------------------------------------------------------------------------------
#  Static Database
#==============================================================================

module Static 
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    #--------------------------------------------------------------------------
    # * Public instance variables
    #--------------------------------------------------------------------------
    attr_accessor :tables
    Static.tables ||= Hash.new
    #--------------------------------------------------------------------------
    # * Easy table access
    #--------------------------------------------------------------------------
    def method_missing(*args)
      name = args[0]
      return Static.tables[name] if Static.tables[name]
      super(*args)
    end 
    #--------------------------------------------------------------------------
    # * Get user tables
    #--------------------------------------------------------------------------
    def user_tables
      Static.tables.select do |k, o|
        !(k.to_s =~ /^VXACE_/)
      end
    end
  end 

  #==============================================================================
  # ** Table
  #------------------------------------------------------------------------------
  #  Static Table
  #==============================================================================
  class Table < CommonDB::Table
    #--------------------------------------------------------------------------
    # * Singleton
    #--------------------------------------------------------------------------
    class << self
      #--------------------------------------------------------------------------
      # * Build a field from an instance variable
      #--------------------------------------------------------------------------
      def dynamic_from_ivar(name, value)
        sym_name = name[1 .. -1].to_sym
        subtype = Types.inference(value)
        return handle_field(subtype, sym_name) if subtype.is_a?(Symbol)
        return list(subtype, sym_name) if subtype.is_a?(Array) && subtype.length == 2 
        return (poly sym_name)
      end
      #--------------------------------------------------------------------------
      # * define primary key
      #--------------------------------------------------------------------------
      def define_primary_key(key)
        super(key)
        Static.tables[self.classname] ||= self
      end
      alias :pk         :define_primary_key
      alias :define_pk  :define_primary_key
    end
  end # == Fin de Table ==

  #--------------------------------------------------------------------------
  # * Map original Database
  #--------------------------------------------------------------------------
  CommonDB::RGSS_EMBEDABLE.select{|g|![:map,:mapinfo].include?(g.name)}.each do
    |rgss_struct|
    # mappingb
    const   = rgss_struct.const
    datas   = rgss_struct.container
    datas   = datas.compact if datas.respond_to?(:compact)
    datas   ||= []
    prefix  = CommonDB::RGSS_PREFIX
    name  = "#{prefix}#{rgss_struct.name.upcase}".to_sym
    if datas.length > 0 
      elt = datas.max{|e| e.instance_variables.length}
      temp_class = Class.new(Static::Table) do 
        @classname = name
        elt.instance_variables.each do |value|
          ivar = elt.instance_variable_get(value)
          dynamic_from_ivar(value, ivar)
        end
        define_pk :id
      end
      storage = Object.const_set(name, temp_class)
      # remplissage
      datas.each do |r| 
        entries = Array.new
        storage.fields.each do |iv, t|
          val = r.instance_variable_get("@#{iv}")
          entries << val
        end
        storage.insert(*entries)
      end
    end 
  end
  #--------------------------------------------------------------------------
  # * Map case
  #--------------------------------------------------------------------------
  rgss_mapinfo  = RPG::MapInfo.new
  rgss_map      = RPG::Map.new(100, 100)
  name          = "#{CommonDB::RGSS_PREFIX}MAP".to_sym
  temp_class    = Class.new(Static::Table) do
    @classname = name
    define_pk integer :id
    [rgss_mapinfo,rgss_map].each do |elt|
      elt.instance_variables.each do |value|
        ivar = elt.instance_variable_get(value)
        dynamic_from_ivar(value, ivar)
      end
    end
  end 
  storage = Object.const_set(name, temp_class)
  # Fill
  mapinfos = CommonDB::RGSS_EMBEDABLE.find{|d|d.name == :mapinfo}
  mapinfos.container.each do |i, v|
    entries = [i]
    [v, load_data(sprintf("Data/Map%03d.rvdata2", i))].each do |r|
      r.instance_variables.each do |iv|
        entries << r.instance_variable_get(iv)
      end
    end
    storage.insert(*entries)
  end

end

#==============================================================================
# ** Dynamic
#------------------------------------------------------------------------------
#  Dynamic DB
#==============================================================================

module Dynamic

  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    #--------------------------------------------------------------------------
    # * Public instance variables
    #--------------------------------------------------------------------------
    attr_accessor :tables
    Dynamic.tables  ||= Hash.new
    #--------------------------------------------------------------------------
    # * Cast Table to Hash
    #--------------------------------------------------------------------------
    def to_hash
      data = Hash.new
      Dynamic.tables.each do |name, value|
        data[name] = Hash.new
        value.all.each do |primary, instance|
          data[name][primary] = instance.to_array
        end
      end
      data
    end
    #--------------------------------------------------------------------------
    # * Convienent Table access
    #--------------------------------------------------------------------------
    def method_missing(*args)
      name = args[0]
      return Dynamic.tables[name] if Dynamic.tables[name]
      super(*args)
    end 
  end

  #==============================================================================
  # ** Table
  #------------------------------------------------------------------------------
  #  Dynamic table
  #==============================================================================
  class Table < CommonDB::Table
    #--------------------------------------------------------------------------
    # * Singleton
    #--------------------------------------------------------------------------
    class << self
      #--------------------------------------------------------------------------
      # * Erease a field
      #--------------------------------------------------------------------------
      def delete(pkvalue)
        self.records.delete(pkvalue)
      end
      #--------------------------------------------------------------------------
      # * Erease by a predicat
      #--------------------------------------------------------------------------
      def delete_if(&block)
        self.records.delete_if(&block)
      end
      #--------------------------------------------------------------------------
      # * Drop the table
      #--------------------------------------------------------------------------
      def drop
        self.records = Hash.new
      end
      #--------------------------------------------------------------------------
      # * Define primary key
      #--------------------------------------------------------------------------
      def define_primary_key(key)
        super(key)
        Dynamic.tables[self.classname] ||= self
      end
      alias :pk         :define_primary_key
      alias :define_pk  :define_primary_key
    end
    #--------------------------------------------------------------------------
    # * Cast to array
    #--------------------------------------------------------------------------
    def to_array
      data = Array.new
      self.class.fields.each do |name, type|
        data << self.instance_variable_get("@#{name}".to_sym)
      end
      data
    end
  end

end 

#==============================================================================
# ** DataManager
#------------------------------------------------------------------------------
#  Save data
#==============================================================================

module DataManager
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    #--------------------------------------------------------------------------
    # * Alias
    #--------------------------------------------------------------------------
    alias :db_make_save_contents    :make_save_contents
    alias :db_extract_save_contents :extract_save_contents
    alias :db_create_game_objects   :create_game_objects
    alias :db_init                  :init
    #--------------------------------------------------------------------------
    # * Init
    #--------------------------------------------------------------------------
    def init 
      create_cst_views
      purge_database
      set_db_rvdata
      db_init
    end
    #--------------------------------------------------------------------------
    # * Get persistent layout
    #--------------------------------------------------------------------------
    def set_db_rvdata
      t = load_data("Data/StaticDB.rvdata2")
      t.each do |table_sym, v|
        v.each do |fields|
          Object.const_get(table_sym).insert(*fields)
        end
      end
    end
    #--------------------------------------------------------------------------
    # * Purge Database
    #--------------------------------------------------------------------------
    def purge_database
      return unless $TEST
      Dir["#{CommonDB.path}/tables/*.csv"].each do |f|
        fname = File.basename(f, File.extname(f)).to_sym
        unless Static.user_tables.include?(fname)
          FileTools.move(f, "#{CommonDB.path}/backups/#{fname}_#{Time.now.to_i}.csv")
        end
      end
      Dir["#{CommonDB.path}/views/*.rvdata2"].each do |f|
        fname = File.basename(f, File.extname(f)).to_sym
        File.delete(f) unless Static.user_tables.include?(fname)
      end
    end
    #--------------------------------------------------------------------------
    # * Create views
    #--------------------------------------------------------------------------
    def create_cst_views
      return unless $TEST
      hashed = {}
      Static.user_tables.each do |table_sym, const|
        hashed[table_sym] = []
        ref = CommonDB.path+"/views/#{table_sym.to_s}.rvdata2"
        schema = const.schema
        old_schema = (File.exists?(ref)) ? load_data(ref) : {}
        if schema != old_schema
          save_data(schema, ref)
          clone_table_to_backup(table_sym)
        end
        unless File.exists?(CommonDB.path+"/tables/#{table_sym.to_s}.csv")
          create_table_layout(table_sym, schema, const) 
        else 
          # retreive datas
          content = FileTools.read(CommonDB.path+"/tables/#{table_sym.to_s}.csv")
          content = content.split("\n")[1..-1]
          content.each do |line|
            fields = line.split(";")
            hashed[table_sym] << fields
          end
        end
      end
      save_data(hashed, "Data/StaticDB.rvdata2") 
    end
    #--------------------------------------------------------------------------
    # * Create table layout
    #--------------------------------------------------------------------------
    def create_table_layout(t, schema, const)
      return unless $TEST
      fname = CommonDB.path+"/tables/#{t.to_s}.csv"
      contn = schema.keys.join(";")
      if const.count > 0 
        const.each do |pk, r|
          ll = schema.keys.collect {|mth| r.send(mth)}
          contn += "\n" + ll.join(";")
        end
      end
      FileTools.write(fname, contn)
    end
    #--------------------------------------------------------------------------
    # * Create backup
    #--------------------------------------------------------------------------
    def clone_table_to_backup(t)
      return unless $TEST
      fname = CommonDB.path+"/tables/#{t.to_s}.csv"
      bname = CommonDB.path+"/backups/#{t.to_s}_#{Time.now.to_i}.csv"
      return unless File.exists?(fname)
      FileTools.move(fname, bname)
    end
    #--------------------------------------------------------------------------
    # * Create Game Objects
    #--------------------------------------------------------------------------
    def create_game_objects
      db_create_game_objects
      Dynamic.tables.each do |k, t|
        t.drop
      end
    end
    #--------------------------------------------------------------------------
    # * Ajout de sauvegarde de la base de données
    #--------------------------------------------------------------------------
    def make_save_contents
      contents = db_make_save_contents
      contents[:database] = Dynamic.to_hash
      contents
    end
    #--------------------------------------------------------------------------
    # * Ajout du chargement de la base de données
    #--------------------------------------------------------------------------
    def extract_save_contents(contents)
      db_extract_save_contents(contents)
      contents[:database].each do |k, f|
        f.each do |key, a|
          Object.const_get(k).insert(*a)
        end
      end
    end
  end
end

#==============================================================================
# ** Create Base
#------------------------------------------------------------------------------
#  Create folders
#==============================================================================

if $TEST 
  path = CommonDB.path
  Dir.mkdir(path, 0777) unless Dir.exists?(path+"/")
  Dir.mkdir(path+"/views/", 0777) unless Dir.exists?(path+"/views/")
  Dir.mkdir(path+"/backups/", 0777) unless Dir.exists?(path+"/backups/")
  Dir.mkdir(path+"/tables/", 0777) unless Dir.exists?(path+"/tables/")
end



