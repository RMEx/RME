# -*- coding: utf-8 -*-
#==============================================================================
# ** Compiler
#------------------------------------------------------------------------------
#  Product and RVDATA2
#==============================================================================

module Compiler

  EMPTY = "x\x9C\u{3 0 0 0 0 1}"

  extend self

  attr_accessor :output
  attr_accessor :source_tree
  attr_accessor :compiled_lib
  attr_accessor :compiled_file
  attr_accessor :max_id
  attr_accessor :junction
  attr_accessor :after
  attr_accessor :before

  def empty_line?(o); o[1] == "" && o[2] == EMPTY; end
  def in_dev?; ARGV.include?("DEV"); end
  def deflate(content)
    docker  = Zlib::Deflate.new(Zlib::BEST_COMPRESSION)
    data    = docker.deflate(content, Zlib::FINISH)
    docker.close
    data
  end
  def empty_script_line
    self.max_id += 1
    [self.max_id, "", EMPTY]
  end
  def start
    self.output       = Library.project_dir + 'Data/Scripts.rvdata2'
    self.source_tree  = load_data(self.output)
    self.max_id       = self.source_tree.max_by { |s| s[0] }[0]
    self.junction     = self.source_tree.index {|s| s[1] == Library.insert_after}
  end
  def purge_source
    self.source_tree.reject! do |script|
      Library.each_keys.include?(script[1].dup.force_encoding('utf-8'))
    end
  end
  def make_junction
    self.before = self.source_tree[0 .. self.junction]
    k = self.source_tree[self.junction.succ .. -1]
    i = k.index{|o| !empty_line?(o)} + self.junction
    self.after  = self.source_tree[i .. -1]
  end
  def make_description(obj)
    ln = ("="*78) + "\n"
    l  = ("-"*78) + "\n"
    desc = "=begin\n"
    desc += ln + obj.name.to_s + " " + obj.version.to_s + "\n"
    desc += l
    desc += "\n"
    desc += obj.description + "\n" if obj.description
    desc += ln + "Authors :\n" + l if obj.authors.length > 0
    obj.authors.each do |n, m|
      desc += "* " + n
      desc += " <#{m}>" if m 
      desc += "\n"
    end
    desc += ln
    desc += "=end\n"
    return desc.dup.force_encoding('utf-8')
  end
  def src(obj, f)
    obj.dir + f
  end
  def get(obj, path)
    filename = src(obj, path)
    if in_dev?
      "Kernel.send(:require, '#{filename}')".dup.force_encoding('utf-8')
    else
      File.open(filename, 'rb') { |f| f.read }.dup.force_encoding('utf-8')
    end
  end
  def compile_lib
    self.compiled_lib = [self.empty_script_line]
    Library.all.each do |name, object|
      self.max_id += 1
      if object.inline?
        title = "■ #{object.name}"
        o = [make_description(object)] + object.childs.values.collect{|k| get(object, k)}
        self.compiled_lib << [self.max_id, title, deflate(o.join("\n"))]
        p "SUCCESS: #{name} builded"
      else
        title = "▼ #{object.name}"
        self.compiled_lib << [self.max_id, title, deflate(make_description(object))]
        object.childs.each do |name, value|
          self.max_id += 1
          self.compiled_lib << [self.max_id, name, deflate(get(object, value))]
          p "SUCCESS: #{name} builded"
        end
        p "SUCCESS: #{name} builded"
      end
      self.compiled_lib << empty_script_line
    end
    self.compiled_file = self.before + self.compiled_lib + self.after
    p "SUCCESS: File merged"
  end
  def move_compiled_file
    save_data(self.compiled_file, self.output)
    p "SUCCESS: File saved"
  end
  def general_process
    if Library.compilable?
      self.start
      self.purge_source
      self.make_junction
      self.compile_lib
      self.move_compiled_file
      p "PROCESS FINISHED WITH SUCCESS"
    else
      Library.stack_error.each{|e| p "ERROR: #{e}"}
      p "PROCESS FINISHED WITH FAIL"
    end
  end

end