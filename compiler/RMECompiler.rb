#==============================================================================
# ** RME V1.0.0 Compiler
#------------------------------------------------------------------------------
#  With : 
# Nuki
# Grim
#------------------------------------------------------------------------------
# An RPGMaker's Compiler
#==============================================================================

module RMECompiler
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  extend self
  #--------------------------------------------------------------------------
  # * Constants
  #--------------------------------------------------------------------------
  COMPILERINFO = '../CompilerInfo.rb'
  EMPTY = "x\x9C\u{3 0 0 0 0 1}"

  #--------------------------------------------------------------------------
  # * Attributes
  #--------------------------------------------------------------------------
  attr_accessor :compilerInfo
  attr_accessor :sourceTree 
  attr_accessor :maxId
  attr_accessor :junction
  attr_accessor :after
  attr_accessor :before
  attr_accessor :compiledLib
  attr_accessor :compiledFile

  #--------------------------------------------------------------------------
  # * Build complete name
  #--------------------------------------------------------------------------
  def src(file);  PATHS[:src] + file;                         end
  def out;        PATHS[:output_dir] + PATHS[:output_file];   end 
  def outb;       PATHS[:output_dir] + PATHS[:output_backup]; end
  
  #--------------------------------------------------------------------------
  # * Init file to compile
  #--------------------------------------------------------------------------
  def init_file
    self.compilerInfo = File.open(COMPILERINFO, 'rb') { |f| f.read }
    Kernel.eval(self.compilerInfo)
    self.sourceTree   = load_data(PATHS[:raw_compiled])
    self.maxId        = self.sourceTree.max_by { |s| s[0] }[0]
    self.junction     = self.sourceTree.index {|s| s[1] == PATHS[:after]}
  end

  #--------------------------------------------------------------------------
  # * Purge SourceTree
  #--------------------------------------------------------------------------
  def purge_sourcetree
    self.sourceTree.reject! do |script|
      LIB.keys.collect do |k|
        k.dup.force_encoding('utf-8')
      end.include?(script[1].dup.force_encoding('utf-8'))
    end
  end

  #--------------------------------------------------------------------------
  # * Make Junction
  #--------------------------------------------------------------------------
  def make_junction
    self.before = self.sourceTree[0 .. self.junction]
    self.after  = self.sourceTree[self.junction.succ .. -1]
  end

  #--------------------------------------------------------------------------
  # * Deflate (ZLib)
  #--------------------------------------------------------------------------
  def deflate(content)
    docker  = Zlib::Deflate.new(Zlib::BEST_COMPRESSION)
    data    = docker.deflate(content, Zlib::FINISH)
    docker.close
    data
  end

  #--------------------------------------------------------------------------
  # * Compile LIB
  #--------------------------------------------------------------------------
  def compile_lib
    self.compiledLib = []
    if self.after[0][2] != EMPTY && self.after[1][2] != EMPTY
      self.compiledLib << [self.maxId, "", EMPTY] 
    end
    LIB.each do |name, filename|
      self.maxId += 1 
      raw   = File.open(src(filename), 'rb') { |f| f.read }
      data  = deflate(raw)
      self.compiledLib << [maxId, name.dup.force_encoding('utf-8'), data]
    end
    self.compiledFile = self.before + self.compiledLib + self.after
  end

  #--------------------------------------------------------------------------
  # * Move compiled file
  #--------------------------------------------------------------------------
  def move_compiled_file 
    save_data(load_data(self.out), self.outb)
    save_data(self.compiledFile, self.out)
  end

  #--------------------------------------------------------------------------
  # * Final Alert
  #--------------------------------------------------------------------------
  def prompt
    msgbox("Compilation succeeded!")
  end

  #--------------------------------------------------------------------------
  # * Run
  #--------------------------------------------------------------------------
  def run 
    self.init_file
    self.purge_sourcetree
    self.make_junction
    self.compile_lib
    self.move_compiled_file
    self.prompt
  end

end

#--------------------------------------------------------------------------
# * Run compilation
#--------------------------------------------------------------------------
RMECompiler.run