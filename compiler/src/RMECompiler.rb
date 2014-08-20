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
  # * Constants
  #--------------------------------------------------------------------------
  ARGV            = Win32API.new("Kernel32", "GetCommandLine", "", "P").call
  COMPILERINFO    = '../CompilerInfo.rb'
  EMPTY           = "x\x9C\u{3 0 0 0 0 1}"
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self

    #--------------------------------------------------------------------------
    # * Attributes
    #--------------------------------------------------------------------------
    attr_accessor :paths
    attr_accessor :libs
    attr_accessor :compilerInfo
    attr_accessor :sourceTree 
    attr_accessor :maxId
    attr_accessor :junction
    attr_accessor :after
    attr_accessor :before
    attr_accessor :compiledLib
    attr_accessor :compiledFile

    RMECompiler.paths = Hash.new
    RMECompiler.libs  = Hash.new

    #--------------------------------------------------------------------------
    # * Description API
    #--------------------------------------------------------------------------
    def src_directory(f);     self.paths[:src]    = f;          end
    def project_directory(f); self.paths[:dir]    = f;          end
    def insert_after(s);      self.paths[:after]  = s;          end
    def backup_name(n);       self.paths[:backup] = n;          end
    def project_to_src(n);    self.paths[:project_to_src] = n;  end
    def define_lib(n, f)    
      self.libs[n.dup.force_encoding('utf-8')] = f       
    end

    #--------------------------------------------------------------------------
    # * Parse command Line
    #--------------------------------------------------------------------------
    def command_line
      ARGV.split
    end

    #--------------------------------------------------------------------------
    # * Build complete name
    #--------------------------------------------------------------------------
    def src(file);  self.paths[:src] + file;                    end
    def out;        self.paths[:dir] + "Data/Scripts.rvdata2";  end 
    def req(f);        self.paths[:project_to_src] + f;         end
    def outb
      backup_name = self.paths[:backup] || "ScriptsBackup.rvdata2"
      self.paths[:dir] + "Data/" + backup_name
    end
    
    #--------------------------------------------------------------------------
    # * Init file to compile
    #--------------------------------------------------------------------------
    def init_file
      self.sourceTree   = load_data(self.out)
      self.maxId        = self.sourceTree.max_by { |s| s[0] }[0]
      self.junction     = self.sourceTree.index {|s| s[1] == self.paths[:after]}
    end

    #--------------------------------------------------------------------------
    # * Purge SourceTree
    #--------------------------------------------------------------------------
    def purge_sourcetree
      self.sourceTree.reject! do |script|
        self.libs.keys.include?(script[1].dup.force_encoding('utf-8'))
      end
    end

    #--------------------------------------------------------------------------
    # * Empty line
    #--------------------------------------------------------------------------
    def empty_line?(o)
      o[1] == "" && o[2] == EMPTY
    end

    #--------------------------------------------------------------------------
    # * Make Junction
    #--------------------------------------------------------------------------
    def make_junction
      self.before = self.sourceTree[0 .. self.junction]
      k = self.sourceTree[self.junction.succ .. -1]
      i = k.index{|o| !empty_line?(o)} + self.junction
      self.after  = self.sourceTree[i .. -1]
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
    # * Empty script line
    #--------------------------------------------------------------------------
    def empty_script_line
      self.maxId += 1
      [self.maxId, "", EMPTY]
    end

    #--------------------------------------------------------------------------
    # * Is in dev
    #--------------------------------------------------------------------------
    def in_dev?
      self.command_line.include?("DEV")
    end

    #--------------------------------------------------------------------------
    # * Compile LIB
    #--------------------------------------------------------------------------
    def compile_lib
      self.compiledLib = [self.empty_script_line]
      self.libs.each do |name, filename|
        self.maxId += 1 
        data = (in_dev?) ? compile_dev(name, filename) : compile_prod(name, filename)
        self.compiledLib << [self.maxId, name.dup.force_encoding('utf-8'), data]
      end
      self.compiledLib << empty_script_line
      self.compiledFile = self.before + self.compiledLib + self.after
    end

    #--------------------------------------------------------------------------
    # * Process compilation in dev
    #--------------------------------------------------------------------------
    def compile_dev(name, filename)
      deflate("Kernel.send(:require, '#{self.req(filename)}')")
    end

    #--------------------------------------------------------------------------
    # * Process compilation in prod
    #--------------------------------------------------------------------------
    def compile_prod(name, filename)
      raw = File.open(src(filename), 'rb') { |f| f.read }
      deflate(raw)
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

end

#==============================================================================
# ** Kernel
#------------------------------------------------------------------------------
# Public API
#==============================================================================

module Kernel

  #--------------------------------------------------------------------------
  # * Description API
  #--------------------------------------------------------------------------
  def src_directory(f);     RMECompiler.src_directory(f);     end
  def backup_name(f);       RMECompiler.backup_name(f);       end
  def project_directory(f); RMECompiler.project_directory(f); end
  def insert_after(s);      RMECompiler.insert_after(s);      end
  def define_lib(n, f);     RMECompiler.define_lib(n, f);     end
  def project_to_src(f);    RMECompiler.project_to_src(f);    end

  #--------------------------------------------------------------------------
  # * Run compilation
  #--------------------------------------------------------------------------
  def compile
    compilerInfo = File.open(RMECompiler::COMPILERINFO, 'rb') { |f| f.read }
    eval(compilerInfo)
    RMECompiler.run
  end

end

#--------------------------------------------------------------------------
# * Run compilation
#--------------------------------------------------------------------------
compile