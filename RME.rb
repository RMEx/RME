
# -*- coding: utf-8 -*-

#==============================================================================
# ** RME
#------------------------------------------------------------------------------
#  With :
# Grim (original project)
# Nuki (a lot of things)
# Raho (general reformulation)
# Zeus81 (a lot of help)
# Hiino (some help and GUI Components)
# Joke (some help)
# Zangther (some help)
# XHTMLBoy (koffie)
# Fabien (Buzzer)
# Kaelar (Improvement)
#
#==============================================================================

=begin

License coming soon

=end

#==============================================================================
# ** RME
#------------------------------------------------------------------------------
#  Provide information about RME
#==============================================================================

class Package

  attr_accessor :name
  attr_accessor :version
  attr_accessor :components
  attr_accessor :dependancies
  attr_accessor :exclude
  attr_accessor :description
  attr_accessor :authors
  attr_accessor :uri
  attr_accessor :schema
  attr_accessor :assets

  def initialize(hash)
    @name         = hash[:name]
    @version      = hash[:version]      || vsn
    @components   = hash[:components]   || {}
    @dependancies = hash[:dependancies] || []
    @exclude      = hash[:exclude]      || []
    @authors      = hash[:authors]      || {}
    @description  = hash[:description]  || ""
    @assets       = hash[:assets]       || {}
  end

  def serialize
    "Package.new(name:#{@name}, version:#{@version}," +
    " dependancies:#{@dependancies}, authors: #{@authors}," +
    "description: #{@description})"
  end
end

module RME

  module Config

    KEY_EVAL = :f3
    MAP_RELOAD = :f11

  end

  class << self
    #--------------------------------------------------------------------------
    # * Version
    # * With RMEPackage, it's seems useless ?
    #--------------------------------------------------------------------------
    def version; define_version(0,1,0); end
    #--------------------------------------------------------------------------
    # * define Version
    #--------------------------------------------------------------------------
    def define_version(x, y, z)
      return RME::Version_Label.new(x, y, z)
    end
    #--------------------------------------------------------------------------
    # * Check version
    #--------------------------------------------------------------------------
    def check_version(oth)
      version >= oth
    end
    #--------------------------------------------------------------------------
    # * unsafe?
    #--------------------------------------------------------------------------
    def unsafe?
      false
    end
    #--------------------------------------------------------------------------
    # * Enabled Gui components
    #--------------------------------------------------------------------------
    def gui_enabled?
      true
    end
  end

  #==============================================================================
  # ** Doc
  #------------------------------------------------------------------------------
  #  Documentation representation
  #==============================================================================

  module Doc
    #--------------------------------------------------------------------------
    # * Singleton
    #--------------------------------------------------------------------------
    class << self
      attr_accessor :schema
      attr_accessor :header
      attr_accessor :commands
      attr_accessor :links
      attr_accessor :vocab
      attr_accessor :to_fix
      attr_accessor :internals
      Doc.internals ||= Array.new
      Doc.to_fix    ||= Array.new
      Doc.schema    ||= Hash.new
      Doc.links     ||= Hash.new
      Doc.commands  ||= Hash.new
    end
    #--------------------------------------------------------------------------
    # * classname
    #--------------------------------------------------------------------------
    def classname
      self.to_s.to_sym
    end
    #--------------------------------------------------------------------------
    # * add internals
    #--------------------------------------------------------------------------
    def add_internals(*args)
      Doc.internals += args
    end
    #--------------------------------------------------------------------------
    # * Init doc
    #--------------------------------------------------------------------------
    def init_doc_statement
      Doc.schema[classname] ||= Hash.new
      Doc.schema[classname][:attributes] ||= Hash.new
      Doc.schema[classname][:methods] ||= Hash.new
    end
    #--------------------------------------------------------------------------
    # * Register Command Category
    #--------------------------------------------------------------------------
    def register_command_category(key, name, desc)
      Doc.commands[key.to_sym] ||= {:desc => desc, :name => name, :commands => {}}
    end
    #--------------------------------------------------------------------------
    # * Register Command
    #--------------------------------------------------------------------------
    def register_command(cat, name)
      d = Doc.schema[classname][:methods][name.to_sym]
      register_command_category(cat, "undefined", "undefined")
      Doc.commands[cat][:commands][name.to_sym] = d if d
      Doc.to_fix << name.to_sym unless d
    end
    #--------------------------------------------------------------------------
    # * Class documentation
    #--------------------------------------------------------------------------
    def link_class_documentation(descr)
      init_doc_statement
      Doc.schema[classname][:description] = descr
    end
    #--------------------------------------------------------------------------
    # * Attributes documentation
    #--------------------------------------------------------------------------
    def link_attr_documentation(name, descr)
      init_doc_statement
      Doc.schema[classname][:attributes][name.to_sym] = descr
    end
    #--------------------------------------------------------------------------
    # * Method documentation
    #--------------------------------------------------------------------------
    def link_method_documentation(name, descr, attributes, returned = false)
      init_doc_statement
      Doc.schema[classname][:methods][name.to_sym] = Hash.new
      Doc.schema[classname][:methods][name.to_sym][:description] = descr
      Doc.schema[classname][:methods][name.to_sym][:attributes] = attributes
      Doc.schema[classname][:methods][name.to_sym][:returnable] = returned
    end
    #--------------------------------------------------------------------------
    # * Snippet documentation
    #--------------------------------------------------------------------------
    def link_snippet(meth, value)
      init_doc_statement
      Doc.schema[classname][:methods][meth.to_sym][:snippet] = value
    end
    #--------------------------------------------------------------------------
    # * Additional links
    #--------------------------------------------------------------------------
    def documentation_add_link(name, link)
      Doc.links[name] = link
    end
    #--------------------------------------------------------------------------
    # * Vocab
    #--------------------------------------------------------------------------
    def documentation_define(sadly_useless_dude, vocab)
      Doc.vocab = vocab
    end

  end

  #==============================================================================
  # ** Version_Label
  #------------------------------------------------------------------------------
  #  Version representation
  #==============================================================================

  class Version_Label < Struct.new(:major, :sub, :last)
    #--------------------------------------------------------------------------
    # * to_s
    #--------------------------------------------------------------------------
    def to_s
      "#{self.major}.#{self.sub}.#{self.last}"
    end
    #--------------------------------------------------------------------------
    # * Compare operation

    #--------------------------------------------------------------------------
    def cmp(oth)
      if oth.is_a?(Version_Label)
        return -1 if oth.major > self.major
        return  1 if oth.major < self.major
        return -1 if oth.sub > self.sub
        return  1 if oth.sub < self.sub
        return -1 if oth.last > self.last
        return  1 if oth.last < self.last
        return 0
      else raise RuntimeError.new("Must be a Version_Label")
      end
    end
    #--------------------------------------------------------------------------
    # * Operators overloading
    #--------------------------------------------------------------------------
    def ==(o); self.cmp(o) == 0; end
    def >(o);  self.cmp(o) > 0; end
    def <(o);  self.cmp(o) < 0; end
    def >=(o); self.cmp(o) >= 0; end
    def <=(o); self.cmp(o) <= 0; end
  end

end

#--------------------------------------------------------------------------
# * Win32API Extension
#--------------------------------------------------------------------------

#==============================================================================
# ** Externlib
#------------------------------------------------------------------------------
#  win32/registry is registry accessor library for Win32 platform.
#  It uses dl/import to call Win32 Registry APIs.
#==============================================================================

module Externlib
  #--------------------------------------------------------------------------
  # * Library as constants
  #--------------------------------------------------------------------------
  CloseClipboard          = Win32API.new('user32', 'CloseClipboard', 'v', 'i')
  EmptyClipboard          = Win32API.new('user32', 'EmptyClipboard', 'v', 'i')
  CloseSocket             = Win32API.new('ws2_32', 'closesocket', 'p', 'l')
  Connect                 = Win32API.new('ws2_32', 'connect', 'ppl', 'l')
  FindWindow              = Win32API.new('user32', 'FindWindow', 'pp', 'i')
  GetClipboardData        = Win32API.new('user32', 'GetClipboardData', 'i', 'i')
  GetCursorPos            = Win32API.new('user32', 'GetCursorPos', 'p',  'i')
  GetKeyboardState        = Win32API.new('user32', 'GetKeyboardState', 'p', 'i')
  GetPrivateProfileStringA= Win32API.new('kernel32', 'GetPrivateProfileStringA', 'pppplp', 'l')
  GetWindowRect           = Win32API.new('user32', 'GetWindowRect', 'lp', 'i')
  GlobalAlloc             = Win32API.new('kernel32', 'GlobalAlloc', 'ii', 'i')
  GlobalFree              = Win32API.new('kernel32', 'GlobalFree', 'i', 'i')
  GlobalLock              = Win32API.new('kernel32', 'GlobalLock', 'i', 'l')
  GlobalSize              = Win32API.new('kernel32', 'GlobalSize', 'l', 'l')
  GlobalUnlock            = Win32API.new('kernel32', 'GlobalUnlock', 'l', 'v')
  Htons                   = Win32API.new('ws2_32', 'htons', 'l', 'l')
  Inet_Addr               = Win32API.new('ws2_32', 'inet_addr', 'p', 'l')
  LoadLibraryA            = Win32API.new('kernel32', 'LoadLibraryA', 'p', 'i')
  Memcpy                  = Win32API.new('msvcrt', 'memcpy', 'ppi', 'i')
  MessageBox              = Win32API.new('user32','MessageBox','lppl','i')
  MultiByteToWideChar     = Win32API.new('kernel32', 'MultiByteToWideChar', 'ilpipi', 'i')
  OpenClipboard           = Win32API.new('user32', 'OpenClipboard', 'i', 'i')
  Recv                    = Win32API.new('ws2_32', 'recv', 'ppll', 'l')
  RegisterClipboardFormat = Win32API.new('user32', 'RegisterClipboardFormat', 'p', 'i')
  RtlMoveMemory           = Win32API.new('kernel32', 'RtlMoveMemory', 'ppi', 'i')
  ScreenToClient          = Win32API.new('user32', 'ScreenToClient', 'ip', 'i')
  Send                    = Win32API.new('ws2_32', 'send', 'ppll', 'l')
  SetClipboardData        = Win32API.new('user32', 'SetClipboardData', 'ii', 'i')
  ShowCursor              = Win32API.new('user32', 'ShowCursor','i', 'i')
  Shutdown                = Win32API.new('ws2_32', 'shutdown', 'pl', 'l')
  Socket                  = Win32API.new('ws2_32', 'socket', 'lll', 'l')
  ToUnicode               = Win32API.new('user32', 'ToUnicode', 'iippii', 'l')
  WideCharToMultiByte     = Win32API.new('kernel32', 'WideCharToMultiByte', 'iipipipp', 'i')
  #--------------------------------------------------------------------------
  # * 360 Game Pad WIN32API's
  #--------------------------------------------------------------------------
  xinput = ->(dll){ return dll, Win32API.new(dll, 'XInputGetState', 'ip', 'i')}
  xdll, XInputGetState  =   xinput.('xinput1_3') rescue
                            xinput.('xinput1_2') rescue
                            xinput.('xinput1_1') rescue
                            xinput.('xinput8_1_0') rescue
                            [nil, nil]
  XInputSetState =  Win32API.new(xdll, 'XInputSetState', 'ip', 'i') if xdll
  tmpbuff = [].pack('x256')
  GetPrivateProfileStringA.call("Game","Library","",tmpbuff, 256, './Game.ini')
  RGSSDLL = File.expand_path(tmpbuff.delete!("\x00"))
end

#--------------------------------------------------------------------------
# * Ruby Extension
#--------------------------------------------------------------------------

#==============================================================================
# ** Object
#------------------------------------------------------------------------------
#  The superclass of all classes. Defines the general behavior of objects.
#==============================================================================

class Object

  #--------------------------------------------------------------------------
  # * Eeasing functions
  #--------------------------------------------------------------------------
  e = {
    'Quad'    => proc{|t| t**2 },
    'Cubic'   => proc{|t| t**3 },
    'Quart'   => proc{|t| t**4 },
    'Quint'   => proc{|t| t**5 },
    'Sine'    => proc{|t| 1 - Math.cos(t*(Math::PI/2)) },
    'Expo'    => proc{|t| 2**(10*(t - 1)) },
    'Circ'    => proc{|t| -(Math.sqrt(1 - t**2) - 1) },
    'Back'    => proc{|t| t**2*((1.7+1)*t - 1.7) },
    'Elastic' => proc do |t|
      -(2**(-10*(1-t)) * Math.sin(((1-t)-0.3/4)*(2*Math::PI)/0.3))
    end,
    'Bounce'  => proc do |t|
      if (1-t) < 1.0/2.75
        1 - 7.5625*(1-t)**2
      elsif (1-t) < 2.0/2.75
        1 - (7.5625*((1-t)-(1.5/2.75))**2 + 0.75)
      elsif (1-t) < 2.5/2.75
        1 - (7.5625*((1-t)-(2.25/2.75))**2 + 0.9375)
      else
        1 - (7.5625*((1-t)-(2.625/2.75))**2 + 0.984375)
      end
    end
  }
  e.keys.each do |k|
    e[('In'   + k).to_sym] = e[k]
    e[('Out'  + k).to_sym] = proc{|t| 1 - e[k][1 - t] }
    e[('InOut'+ k).to_sym] = proc do |t|
      t < 0.5 ? e[k][t*2]/2 : 1 - e[k][(1-t)*2]/2
    end
  end
  e.default = proc{|t| t }
  EasingFunctions = e

  #--------------------------------------------------------------------------
  # * Eigenclass
  #--------------------------------------------------------------------------
  class << self

    #--------------------------------------------------------------------------
    # * Dynamic definition
    #--------------------------------------------------------------------------
    def dynlink(name, &block); send(:define_method, name, block); end
    private :dynlink

    #--------------------------------------------------------------------------
    # * Define method as delegator instance method with an optional alias name
    # * m_alias. Method calls to alias will be delegated to accessor.method.
    #--------------------------------------------------------------------------
    def delegate(obj, method, m_alias = method)
      dynlink(m_alias) do |*args|
        instance = (obj[0] == "@") ?
          instance_variable_get(obj) :
          send(obj)
        instance.send(method, *args)
      end
    end

    #--------------------------------------------------------------------------
    # * Delegate attr_accessor
    #--------------------------------------------------------------------------
    def delegate_accessor(obj, field)
      delegate(obj, field)
      delegate(obj, "#{field}=")
    end

    #--------------------------------------------------------------------------
    # * Import Callable as a method
    #--------------------------------------------------------------------------
    def externalize(obj, m_alias)
      dynlink(m_alias) do |*args|
        obj.call(*args)
      end
    end

    #--------------------------------------------------------------------------
    # * Calls another method when the instance variable is changing
    #--------------------------------------------------------------------------
    def attr_accessor_callback(to_call, m)
      define_method("#{m}=") do |v|
        if instance_variable_get("@#{m}") != v
          instance_variable_set("@#{m}", v)
          method(to_call).call
        end
      end
    end

  end # End of Object.self

  #--------------------------------------------------------------------------
  # * Identity (Blank operation)
  #--------------------------------------------------------------------------
  def identity
    return self
  end

  #--------------------------------------------------------------------------
  # * Returns an Hash of instance variables :name => value
  #--------------------------------------------------------------------------
  def attr_values
    values = self.instance_variables.collect do |key|
      [key, self.instance_variable_get(key)]
    end
    return Hash[values]
  end

  #--------------------------------------------------------------------------
  # * Create buffer (for Win32API)
  #--------------------------------------------------------------------------
  def buffer(size = 4)
    "\0" * size
  end

  #--------------------------------------------------------------------------
  # * Check type: bool
  #--------------------------------------------------------------------------
  def boolean?
    return false
  end

  #--------------------------------------------------------------------------
  # * Convert to Bool
  #--------------------------------------------------------------------------
  def to_bool
    true
  end

  #--------------------------------------------------------------------------
  # * Deep clone (to be improved)
  #--------------------------------------------------------------------------
  def custom_deep_clone
    value = self.clone 
    return Marshal.load(Marshal.dump(value))
  end


  #--------------------------------------------------------------------------
  # * Setup transition for the given method
  #--------------------------------------------------------------------------
  def set_transition(method, target, duration, easing = :linear)
    m = method
    return method("#{m}=")[target] if duration == 0
    return if (base = method(m).call).nil? || base == target
    instance_variable_set("@trans_b_#{m}", base)
    instance_variable_set("@trans_c_#{m}", target - base)
    instance_variable_set("@trans_f_#{m}", easing)
    instance_variable_set("@trans_d_#{m}", duration)
    instance_variable_set("@trans_t_#{m}", 1.0)
  end

  #--------------------------------------------------------------------------
  # * Update transition for the given method
  #--------------------------------------------------------------------------
  def update_transition(method)
    m = method
    return if (d = instance_variable_get("@trans_d_#{m}")).nil? || d==0
    return if (t = instance_variable_get("@trans_t_#{m}")) > d
    b = instance_variable_get("@trans_b_#{m}")
    c = instance_variable_get("@trans_c_#{m}")
    f = instance_variable_get("@trans_f_#{m}")
    f = EasingFunctions[f]
    v = t==0 ? b : t==d ? b + c : b + c*f[t/d]
    instance_variable_set("@trans_t_#{m}", t + 1)
    method("#{m}=")[v]
  end

  alias_method :rme_method_missing, :method_missing
  def method_missing(*a)
    Exception.last_noMethod = self
    rme_method_missing(*a)
  end

end # End of Object

#==============================================================================
# ** Color
#------------------------------------------------------------------------------
# The RGBA color class. Each component is handled with a floating-point
# value (Float).
#==============================================================================

class Color

  def to_hex
    r = ((self.red / 255.0)   * 15.0).to_i.to_s(16)
    g = ((self.green / 255.0) * 15.0).to_i.to_s(16)
    b = ((self.blue / 255.0)  * 15.0).to_i.to_s(16)
    [r, g, b].join.to_i(16)
  end

end

#==============================================================================
# ** Exception
#------------------------------------------------------------------------------
# Try to retreive last exception
#==============================================================================

class Exception
  class << self
    attr_accessor :last_noMethod
  end
end

#==============================================================================
# ** NilClass
#------------------------------------------------------------------------------
# The Nil class. nil is the only instance of the NilClass class.
# nil, like false, denotes a FALSE condition, while all other objects are TRUE.
#==============================================================================

class NilClass
  #--------------------------------------------------------------------------
  # * Convert to Bool
  #--------------------------------------------------------------------------
  def to_bool
    false
  end
end


#==============================================================================
# ** FalseClass
#------------------------------------------------------------------------------
# The false class. false is the only instance of the FalseClass class.
# false, like nil, denotes a FALSE condition, while all other objects are TRUE.
#==============================================================================

class FalseClass

  #--------------------------------------------------------------------------
  # * Convert to Bool
  #--------------------------------------------------------------------------
  alias_method :to_bool, :identity

  #--------------------------------------------------------------------------
  # * Check type: bool
  #--------------------------------------------------------------------------
  def boolean?
    true
  end

  #--------------------------------------------------------------------------
  # * Cast to integer
  #--------------------------------------------------------------------------
  def to_i
    0
  end

end

#==============================================================================
# ** TrueClass
#------------------------------------------------------------------------------
# The true class. true is the only instance of the TrueClass class.
# true is a representative object that denotes a TRUE condition.
#==============================================================================

class TrueClass

  #--------------------------------------------------------------------------
  # * Convert to Bool
  #--------------------------------------------------------------------------
  alias_method :to_bool, :identity

  #--------------------------------------------------------------------------
  # * Check type: bool
  #--------------------------------------------------------------------------
  def boolean?
    true
  end

  #--------------------------------------------------------------------------
  # * Cast to integer
  #--------------------------------------------------------------------------
  def to_i
    1
  end

end

#==============================================================================
# ** Module
#------------------------------------------------------------------------------
#  Link documentation
#==============================================================================

class Module

  #--------------------------------------------------------------------------
  # * Documentation linking
  #--------------------------------------------------------------------------
  include RME::Doc
  extend RME::Doc
end


#==============================================================================
# ** Fixnum
#------------------------------------------------------------------------------
#  Integer representation
#==============================================================================

class Fixnum

  #--------------------------------------------------------------------------
  # * Number const
  #--------------------------------------------------------------------------
  NUMBER = [
    :zero,
    :one,
    :two,
    :three,
    :four,
    :five,
    :six,
    :seven,
    :eight,
    :nine
  ]

  #--------------------------------------------------------------------------
  # * Cast integer to digit
  #--------------------------------------------------------------------------
  def to_digit
    return NUMBER[self] if self <= 9 && self >= 0
    NUMBER[0]
  end

end

#==============================================================================
# ** Array
#------------------------------------------------------------------------------
# Arrays are ordered, integer-indexed collections of any object.
#==============================================================================

class Array
  #--------------------------------------------------------------------------
  # * Exclude data
  #--------------------------------------------------------------------------
  def not(*ids, &block)
    self.delete_if{|e| ids.include?(e)}.delete_if(&block)
  end
  #--------------------------------------------------------------------------
  # * Extract Point object from array "[x,y]" or "[Point]"
  #--------------------------------------------------------------------------
  def to_point
    if length == 2
      p = Point.new(*self)
    elsif length == 1
      p = self[0].clone
    end
    return p
  end
  #--------------------------------------------------------------------------
  # * Extract x, y from array "[x,y]" or "[Point]"
  #--------------------------------------------------------------------------
  def to_xy
    a = self
    a = [a[0].x, a[0].y] if length == 1
    return *a
  end
end

#==============================================================================
# ** Numeric
#------------------------------------------------------------------------------
# Managing digits separately
#==============================================================================

class Numeric
   #--------------------------------------------------------------------------
   # * handle isoler
   #--------------------------------------------------------------------------
   def isole_int(i); (self%(10**i))/(10**(i-1)).to_i; end
   #--------------------------------------------------------------------------
   # * Int isoler
   #--------------------------------------------------------------------------
   [:units, :tens, :hundreds, :thousands,
     :tens_thousands, :hundreds_thousands,
     :millions, :tens_millions,
     :hundreds_millions ].each.with_index{|m, i|define_method(m){isole_int(i+1)}}
   #--------------------------------------------------------------------------
   # * alias
   #--------------------------------------------------------------------------
   alias :unites              :units
   alias :dizaines            :tens
   alias :centaines           :hundreds
   alias :milliers            :thousands
   alias :dizaines_milliers   :tens_thousands
   alias :centaines_milliers  :hundreds_thousands
   alias :dizaines_millions   :tens_millions
   alias :centaines_millions  :hundreds_millions
   #--------------------------------------------------------------------------
   # * Int Bound value
   #--------------------------------------------------------------------------
   def bound(min, max)
     begin
       b_min = min - ((min-self) & (min-self)>>31)
       b_min + ((max-b_min) & (max-b_min)>>31)
     rescue
       fbound(min, max)
     end
   end
   #--------------------------------------------------------------------------
   # * Float Bound value
   #--------------------------------------------------------------------------
   def fbound(min, max)
     [[min, self].max, max].min
   end
end

#==============================================================================
# ** String
#------------------------------------------------------------------------------
#  String char extension
#==============================================================================

class String
  #--------------------------------------------------------------------------
  # * Import
  #--------------------------------------------------------------------------
  externalize Externlib::WideCharToMultiByte, :to_multibyte
  externalize Externlib::MultiByteToWideChar, :to_widechar
  ASCII8BIT = 0
  UTF8 = 65001
  #--------------------------------------------------------------------------
  # * Convert
  #--------------------------------------------------------------------------
  def convert_format(from, to)
    size = to_widechar(from, 0, self, -1, nil, 0)
    buff = [].pack("x#{size*2}")
    to_widechar(from, 0, self, -1, buff, buff.size/2)
    size = to_multibyte(to, 0, buff, -1, nil, 0, nil, nil)
    sbuf = [].pack("x#{size}")
    to_multibyte(to, 0, buff, -1, sbuf, sbuf.size, nil, nil)
    sbuf.delete!("\000") if to == 65001
    sbuf.delete!("\x00") if to == 0
    sbuf
  end
  #--------------------------------------------------------------------------
  # * return self in ASCII-8BIT
  #--------------------------------------------------------------------------
  def to_ascii; convert_format(UTF8, ASCII8BIT);end
  #--------------------------------------------------------------------------
  # * convert self in ASCII-8BIT
  #--------------------------------------------------------------------------
  def to_ascii!; replace(to_ascii); end
  #--------------------------------------------------------------------------
  # * return self to UTF8
  #--------------------------------------------------------------------------
  def to_utf8; convert_format(ASCII8BIT, UTF8); end
  #--------------------------------------------------------------------------
  # * convert self in UTF8
  #--------------------------------------------------------------------------
  def to_utf8!; replace(to_utf8); end
  #--------------------------------------------------------------------------
  # * Extract number
  #--------------------------------------------------------------------------
  def extract_numbers
    scan(/-*\d+/).collect{|n|n.to_i}
  end
  #--------------------------------------------------------------------------
  # * Calcul the Damerau Levenshtein 's Distance
  #--------------------------------------------------------------------------
  def damerau_levenshtein(other)
    n, m = self.length, other.length
    return m if n == 0
    return n if m == 0
    matrix  = Array.new(n+1) do |i|
      Array.new(m+1) do |j|
        if i == 0 then j
        elsif j == 0 then i
        else 0 end
      end
    end
    (1..n).each do |i|
      (1..m).each do |j|
        cost = (self[i] == other[j]) ? 0 : 1
        delete = matrix[i-1][j] + 1
        insert = matrix[i][j-1] + 1
        substitution = matrix[i-1][j-1] + cost
        matrix[i][j] = [delete, insert, substitution].min
        if (i > 1) && (j > 1) && (self[i] == other[j-1]) && (self[i-1] == other[j])
          matrix[i][j] = [matrix[i][j], matrix[i-2][j-2] + cost].min
        end
      end
    end
    return matrix.last.last
  end
  #--------------------------------------------------------------------------
  # * Autocomplete
  #--------------------------------------------------------------------------
  def auto_complete(words)
    words.sort_by do |wordA|
      placeholder = wordA[0...length]
      (placeholder == self) ? 0 : damerau_levenshtein(placeholder)+1
    end
  end
  #--------------------------------------------------------------------------
  # * Delete at
  #--------------------------------------------------------------------------
  def insert_at(pos, char)
    a = slice(0, pos) || ""
    b = slice(pos, length) || ""
    a + char + b
  end
  #--------------------------------------------------------------------------
  # * Delete at
  #--------------------------------------------------------------------------
  def delete_at(pos)
    a = slice(0, pos) || ""
    b = slice(pos+1, length) || ""
    a + b
  end
  #--------------------------------------------------------------------------
  # * Delete between
  #--------------------------------------------------------------------------
  def delete_between(a, b)
    a = slice(0, a) || ""
    b = slice(b, length) || ""
    a + b
  end
  #--------------------------------------------------------------------------
  # * Split each
  #--------------------------------------------------------------------------
  def split_each(len)
    self.scan(Regexp.new(".{1,#{len}}"))
  end
  #--------------------------------------------------------------------------
  # * Format a string
  #--------------------------------------------------------------------------
  def stretch(len_line)
    n_s = [""]
    i = 0
    self.split(' ').each do |l|
      if (n_s[i].length + l.length) > len_line
        if l.length > len_line
          n_l = l.scan(/.{0,#{len_line-1}}/)
          n_l[0..-3].collect!{|e|e<<'-'}
          n_s += n_l
          i += n_l.length - 1
          next
        else
          i += 1
        end
      end
      n_s[i] ||= ""
      n_s[i] += ' ' << l
    end
    n_s = n_s.join('\n').split('\n')
    n_s.compact.collect(&:strip)
  end

  #--------------------------------------------------------------------------
  # * AST Extract_tokens
  #--------------------------------------------------------------------------
  def extract_tokens(position=nil)
    position ||= length - 1
    substring = self[0..position].gsub(/\s+|;|\(|\)|,|\{|\}|\[|\]/, "\0")
    substring.split(/(\0)/).map do |elt|
      (elt.empty? || elt =~ /^\d+/ || elt == "\0") ? false : elt
    end
  end

  #--------------------------------------------------------------------------
  # * AST Extract_tokens
  #--------------------------------------------------------------------------
  def ast_extract_tokens(at_point = -1)
		substring = self[0, at_point]
		reg = [
			'\(\+?\d+\.\d*\)', '\(\+?\d+\.\d*\)',
			'\+?\d+', '\-?\d+',
      '\w+\[.*\]',
			'\:\w+', '\:\"\w+\"', '\:\'\w+\'',
			 '\'[^\']*\'', '"[\s*\w*]*"',
			 '\!\w+',
			'\.', '::', '\$\w+', '\w+', '\s*'
			]
		scan(Regexp.new(reg.join("|"))).select {|e| not e.empty?}
	end

  #--------------------------------------------------------------------------
  # * AST Complete at point
  # Work in progress /!\ Not finished !
  #--------------------------------------------------------------------------
  def ast_complete_at_point(i)
     tokens = ast_extract_tokens(i-1)
     token = tokens[-1]
     p tokens
     return [nil, []] unless token
     if tokens[-2] == '.' && tokens[-3]
       # Standard receiver case
       begin
         raw_receiver = tokens.reverse.take_while.with_index do |v, i|
          (i%2 != 0) ? v == '.' : true
         end.reverse.join('')
         p raw_receiver
         receiver = eval(raw_receiver) # NEED A RECURSION !
         container = receiver.methods
       rescue Exception => exc
         p exc
         return [nil, []]
       end
     elsif tokens[-2] == '::' && tokens[-3]
       # Static or constant context
       receiver = tokens[-3]
     else
      return [token, tokens[-2].methods[0..7]] if tokens[-2] && token == '.'
      # atomic keyword
      gv = global_variables
      cm = Command.singleton_methods
      co = Object.constants
      pu = Kernel.methods
      container = (gv + cm + co + pu).uniq
     end
     candidates = container.map do |meth|
          [token.damerau_levenshtein(meth[0..(token.length-1)]), meth]
      end.select {|r| r[0] < 2}.sort_by {|r| r[0]}.map {|e| e[1]}
      return (token.length < 4 && candidates.length > 30) ?
        [token, candidates[0..7]] : [token, candidates]
  end

  #--------------------------------------------------------------------------
  # * Complete at point
  #--------------------------------------------------------------------------
  def complete_at_point(i)
    tokens = extract_tokens(i-1).map {|s| (!s) ? [s] : s.split(/\s/)}.flatten
    token = tokens[-1]
    return [] unless token
    container = Command.singleton_methods
    candidates = token.auto_complete(container)
    k = candidates.select { |e| token.damerau_levenshtein(e[0..(token.length-1)]) < 3 }
    return k[0..7].unshift(token)
  end
end


#==============================================================================
# ** Point
#------------------------------------------------------------------------------
#  Point(x, y) representation
#==============================================================================

class Point < Struct.new(:x, :y)

  #--------------------------------------------------------------------------
  # * Set coords
  #--------------------------------------------------------------------------
  def set(x, y)
    self.x = x
    self.y = y
  end

  #--------------------------------------------------------------------------
  # * Translation after a rotation from a point
  #--------------------------------------------------------------------------
  def rotate(angle, *p)
    return if angle == 0
    ox, oy = p.to_xy
    angle *= Math::PI/180
    c, s = Math.cos(angle), Math.sin(angle)
    x, y = self.x, self.y
    x, y = x-ox, y-oy
    x, y = (x*c+y*s), (-x*s+y*c)
    x, y = x+ox, y+oy
    set(x, y)
  end

  #--------------------------------------------------------------------------
  # * Transforms point from screen to rect
  #--------------------------------------------------------------------------
  def screen_to_sprite(spr)
    rotate(-spr.angle, spr.x, spr.y)
  end

  #--------------------------------------------------------------------------
  # * Transforms point from screen to bitmap
  #--------------------------------------------------------------------------
  def screen_to_bitmap(spr)
    rotate(-spr.angle, spr.x, spr.y)
    x, y = self.x-spr.x, self.y-spr.y
    x /= spr.zoom_x if spr.zoom_x != 0
    y /= spr.zoom_y if spr.zoom_y != 0
    x, y = x+spr.ox+spr.src_rect.x, y+spr.oy+spr.src_rect.y
    set(x.round, y.round)
  end

  #--------------------------------------------------------------------------
  # * Transforms point from bitmap to screen
  #--------------------------------------------------------------------------
  def bitmap_to_screen(spr)
    self.x = (self.x-spr.ox)*spr.zoom_x
    self.y = (self.y-spr.oy)*spr.zoom_y
    rotate(spr.angle, 0, 0)
    set(self.x+spr.x, self.y+spr.y)
  end

  #--------------------------------------------------------------------------
  # * In area
  #--------------------------------------------------------------------------
  def in?(rect)
    return rect && (
      a, b = [rect.x, rect.x+rect.width].sort
      c, d = [rect.y, rect.y+rect.height].sort
      check_x = self.x.between?(a, b)
      check_y = self.y.between?(c, d)
      check_x && check_y
    )
  end

  #--------------------------------------------------------------------------
  # * Restart
  #--------------------------------------------------------------------------
  def null!
    self.x = self.y = 0
  end

end

#==============================================================================
# ** Devices
#------------------------------------------------------------------------------
#  Devices collection
#==============================================================================

module Devices

  #==============================================================================
  # ** XBOX360Pad
  #------------------------------------------------------------------------------
  # Xbox360Pad vibration
  #==============================================================================

  module XBOX360Pad
    class << self
      #--------------------------------------------------------------------------
      # * Public instance variables
      #--------------------------------------------------------------------------
      attr_accessor :v_state
      XBOX360Pad.v_state = [0, 0]
      #--------------------------------------------------------------------------
      # * Set Vibration
      #--------------------------------------------------------------------------
      def set_vibration(id, motor, strength)
        XBOX360Pad.v_state[motor] = (strength.to_f)/100.0
        vibration_left = [XBOX360Pad.v_state[0] * 0xFFFF, 0xFFFF].min
        vibration_right = [XBOX360Pad.v_state[1] * 0xFFFF, 0xFFFF].min
        Externlib::XInputSetState.(id, [vibration_left, vibration_right].pack('S2'))
      end
      #--------------------------------------------------------------------------
      # * Set Vibration to motor left
      #--------------------------------------------------------------------------
      def left_vibration(id, strength)
        set_vibration(id, 0, strength)
      end
      #--------------------------------------------------------------------------
      # * Stop Vibration to motor left
      #--------------------------------------------------------------------------
      def stop_left_vibration(id)
        set_vibration(id, 0, 0)
      end
      #--------------------------------------------------------------------------
      # * Stop Vibration to motor right
      #--------------------------------------------------------------------------
      def stop_right_vibration(id)
        set_vibration(id, 1, 0)
      end
      #--------------------------------------------------------------------------
      # * Set Vibration to motor right
      #--------------------------------------------------------------------------
      def right_vibration(id, strength)
        set_vibration(id, 1, strength)
      end
      #--------------------------------------------------------------------------
      # * Check if controller 's plugged
      #--------------------------------------------------------------------------
      def plugged?(id = 0)
        Externlib::XInputGetState.(id, [].pack('x16')) == 0
      end
    end
  end

  #==============================================================================
  # ** Keys
  #------------------------------------------------------------------------------
  # Module relatif aux touches
  #==============================================================================

  class Keys

    #--------------------------------------------------------------------------
    # * Keys list
    #--------------------------------------------------------------------------
    n = :none
    All = [
      n, :mouse_left, :mouse_right, :cancel, :mouse_center, :mouse_x1,
      :mouse_x2, n, :backspace, :tab] + ([n]*2) + [:clear, :enter] + ([n]*2) +
      [:shift, :control, :alt, :pause, :caps_lock, :hangul, n,
      :junja, :final, :kanji, n, :esc, :convert, :nonconvert,
      :accept, :modechange, :space, :page_up, :page_down, :end, :home, :left,
      :up, :right, :down, :select, :print, :execute, :snapshot, :insert,
      :delete, :help] + (0..9).to_a + ([n]*7) + (:a..:z).to_a + [
      :lwindow, :rwindow, :apps, n, :sleep] + (:num_0 .. :num_9).to_a + [
      :multiply, :add, :separator, :substract, :decimal, :divide] + (:f1..:f9).to_a +
      (:f10..:f19).to_a+(:f9..:f19).to_a + (:f20..:f24).to_a + ([n]*8) +
      [:num_lock, :scroll_lock] + ([n]*14) + [:lshift, :rshift, :lcontrol,
      :rcontrol, :lmenu, :rmenu, :browser_back, :browser_forward,
      :browser_refresh, :browser_stop, :browser_search, :browser_favorites,
      :browser_home, :volume_mute, :volume_down, :volume_up, :media_next_track,
      :media_prev_track, :media_stop, :media_play_pause, :launch_mail,
      :launch_media_select, :launch_app1, :launch_app2] + ([n]*2) + [
      :oem_1, :oem_plus, :oem_comma,:oem_minus, :oem_period, :oem_2, :oem_3] +
      ([n]*26) + (:oem_4..:oem_8).to_a + ([n]*2) + [:oem_102] + ([n]*2) +
      [:process, n, :packet] + ([n]*14) + [:attn, :crsel, :exsel, :ereof,
      :play, :zoom, :noname, :pa1, :oem_clear, n, :DOWN, :LEFT, :RIGHT, :UP,
      :A, :B, :C, :X, :Y, :Z, :L, :R, :SHIFT, :CTRL, :ALT] + (:F5..:F9).to_a

    #--------------------------------------------------------------------------
    # * DeadKeys list
    #--------------------------------------------------------------------------
    DEAD_KEYS = {
      "^"=>{"a" => "â", "A" => "Â", "e" => "ê", "E" => "Ê",
        "i" => "î", "I" => "Î","o" => "ô", "O" => "Ô",
        "u" => "û", "U" => "Û"," " => "^"},
      "¨"=>{"a" => "ä", "A" => "Ä","e" => "ë", "E" => "Ë",
        "i" => "ï", "I" => "Ï","o" => "ö", "O" => "Ö",
        "u" => "ü", "U" => "Ü","y" => "ÿ", " " => "¨"},
      "´"=>{"a" => "á", "A" => "Á","e" => "é", "E" => "É",
        "i" => "í", "I" => "Í","o" => "ó", "O" => "Ó",
        "u" => "ú", "U" => "Ú","y" => "ý", "Y" => "Ý"," " => "´"},
      "`"=>{"a" => "à", "A" => "Á","e" => "è", "E" => "É",
        "i" => "ì", "I" => "Í","o" => "ò", "O" => "Ó",
      "u" => "ù", "U" => "Ú"," " => "`"},
      "~"=>{"a" => "ã", "A" => "Ã","o" => "õ", "O" => "Õ",
        "n" => "ñ", "N" => "Ñ"}}

    #--------------------------------------------------------------------------
    # * Digit key
    #--------------------------------------------------------------------------
    DIGITS = ((0 .. 9).to_a + (:num_0 .. :num_9).to_a).collect do |i|
      All.index(i)
    end

    #--------------------------------------------------------------------------
    # * Fast access to key value
    #--------------------------------------------------------------------------
    define_singleton_method(:get){|k| Keys::All.index(k)}
    define_singleton_method(:digits){DIGITS}
    define_singleton_method(:dead_chars){DEAD_KEYS}

    #--------------------------------------------------------------------------
    # * Public instance variables
    #--------------------------------------------------------------------------
    attr_reader :id

    #--------------------------------------------------------------------------
    # * Object initialize
    #--------------------------------------------------------------------------
    def initialize(id)
      @id = id
    end

    #--------------------------------------------------------------------------
    # * Detection methods
    #--------------------------------------------------------------------------
    [:trigger?, :press?, :repeat?, :release?].each do |m|
      define_method(m) do
        ::Keyboard.send("k#{m}", instance_variable_get(:@id))
      end
    end

    #--------------------------------------------------------------------------
    # * Append to Input Const
    #--------------------------------------------------------------------------
    (0..255).each do |i|
      x = All[i]
      if x != :none
        x = x.to_digit if x.is_a?(Fixnum)
        const_set(x.capitalize, self.new(i))
      end
    end

    #--------------------------------------------------------------------------
    # * Singleton Key instance
    #--------------------------------------------------------------------------
    ::Key = ::Keys = self


  end

  #==============================================================================
  # ** Abstract
  #------------------------------------------------------------------------------
  #  Abstract representation of a Device
  #==============================================================================

  class Abstract

    #--------------------------------------------------------------------------
    # * Import
    #--------------------------------------------------------------------------
    externalize Externlib::GetKeyboardState,    :keyboard_state
    externalize Externlib::ToUnicode,           :to_uc
    externalize Externlib::WideCharToMultiByte, :to_multibyte
    externalize Keys.method(:get),              :get_key
    externalize Keys.method(:dead_chars),       :dead_chars
    externalize Keys.method(:digits),           :digits

    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize
      @buffer   = buffer(256)
      @count    = Array.new(Keys::All.length, 0)
      @release  = Array.new
      @keys     = Keys::All
    end

    #--------------------------------------------------------------------------
    # * Get key state
    #--------------------------------------------------------------------------
    def key_active?(code)
      return Input.press?(Keys::All[code]) if code > 255
      @buffer.getbyte(code)[7] == 1
    end

    #--------------------------------------------------------------------------
    # * Statement update
    #--------------------------------------------------------------------------
    def update_statement
      @release.clear
      @keys.each_index do |code|
        if key_active?(code)
          @count[code] += 1
        elsif @count[code] != 0
          @count[code] = 0
          @release << code
        end
      end
    end

    #--------------------------------------------------------------------------
    # * Buffer update
    #--------------------------------------------------------------------------
    def update_buffer
      keyboard_state(@buffer)
    end

    #--------------------------------------------------------------------------
    # * Frame update
    #--------------------------------------------------------------------------
    def update
      update_buffer
      update_statement
    end

    #--------------------------------------------------------------------------
    # * Trigger logic
    #--------------------------------------------------------------------------
    def ktrigger?(code)
      @count[code.to_i] == 1
    end

    #--------------------------------------------------------------------------
    # * Press logic
    #--------------------------------------------------------------------------
    def kpress?(code)
      @count[code.to_i] > 0
    end

    #--------------------------------------------------------------------------
    # * Release logic
    #--------------------------------------------------------------------------
    def krelease?(code)
      @release.include?(code.to_i)
    end

    #--------------------------------------------------------------------------
    # * Repeat logic
    #--------------------------------------------------------------------------
    def krepeat?(code)
      (@count[code.to_i] == 1) ||
        (@count[code.to_i] >= 24 && @count[code.to_i]%6 == 0)
    end

    #--------------------------------------------------------------------------
    # * determine duration
    #--------------------------------------------------------------------------
    def ktime(code)
      @count[code.to_i]
    end

    #--------------------------------------------------------------------------
    # * All
    #--------------------------------------------------------------------------
    def all?(method, *keys)
      keys.all?{|k|self.send(method, k)}
    end
    #--------------------------------------------------------------------------
    # * Any
    #--------------------------------------------------------------------------
    def any?(method, *keys)
      keys = (keys.length == 0) ? Keys::All : keys
      keys.any?{|k|self.send(method, k)}
    end
    #--------------------------------------------------------------------------
    # * Current key
    #--------------------------------------------------------------------------
    def current_key(method = :press?)
      @keys[0..255].each do |k|
        next unless k
        return k if self.send(method, k)
      end
      return nil
    end

    #--------------------------------------------------------------------------
    # * Common API
    #--------------------------------------------------------------------------
    [:trigger?, :press?, :release?, :repeat?, :time].each do |m|
      define_method(m){|k|send("k#{m}", get_key(k))}
    end

  end

  #==============================================================================
  # ** Keyboard
  #------------------------------------------------------------------------------
  #  Concrete Keyboard representation
  #==============================================================================

  class Keyboard < Abstract

    #--------------------------------------------------------------------------
    # * Public instance variables
    #--------------------------------------------------------------------------
    attr_reader :shift
    attr_reader :caps_lock
    attr_reader :num_lock
    attr_reader :scroll_lock
    attr_reader :alt_gr

    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize
      super
      @wait_char    = ""
      @shift          = false
      @caps_lock    = false
      @num_lock     = false
      @scroll_lock  = false
      @alt_gr       = false
    end

    #--------------------------------------------------------------------------
    # * Togglable status
    #--------------------------------------------------------------------------
    def toggle?(key)
      @buffer.getbyte(get_key(key))[0] == 1
    end

    #--------------------------------------------------------------------------
    # * Toggle Status update
    #--------------------------------------------------------------------------
    def update_toggle
      @caps_lock    = toggle?(:caps_lock)
      @scroll_lock  = toggle?(:scroll_lock)
      @num_lock     = toggle?(:num_lock)
    end

    #--------------------------------------------------------------------------
    # * Key state update
    #--------------------------------------------------------------------------
    def update_keystate
      @ctrl   = Key::Lcontrol.press? || Key::Rcontrol.press?
      @shift    = (@caps_lock) ? !Key::Shift.press? : Key::Shift.press?
      @alt_gr = @ctrl && Key::Alt.press?
    end

    #--------------------------------------------------------------------------
    # * Keyboard update
    #--------------------------------------------------------------------------
    def update
      super
      update_toggle
      update_keystate
    end

    #--------------------------------------------------------------------------
    # * Check ctrl combination
    #--------------------------------------------------------------------------
    def ctrl?(k = nil)
      f = (k) ? trigger?(k) : true
      f && @ctrl
    end

    #--------------------------------------------------------------------------
    # * Get char from a key (lol LISP)
    #--------------------------------------------------------------------------
    def char(key)
      return "\n" if key == 0x0D
      return "" if [0x1B, 0x08].include?(key) ||
        to_uc(key, 0, @buffer, chr = buffer(16), 8, 0) == 0
      to_multibyte(65001, 0, chr, 1, output = buffer(4), 4, 0, 0)
      output.delete!("\0")
      @wait_char, output =
        (!@wait_char.empty?) ?
          ((dead_chars[@wait_char].has_key?(output)) ?
            ["", dead_chars[@wait_char][output]] :
              ((dead_chars.has_key?(output)) ?
              [output, @wait_char] : ["", @wait_char + output])) :
            (dead_chars.has_key?(output)) ? [output, ""] : [@wait_char, output]
      output
    end

    #--------------------------------------------------------------------------
    # * Get current char
    #--------------------------------------------------------------------------
    def current_char
      return "" if [:a,:z,:c,:x,:v,:p,:y].any?{|k|ctrl?(k)}
      (0..255).each do |i|
        return char(i) if krepeat?(i)
      end
      ""
    end

    #--------------------------------------------------------------------------
    # * Get current digit
    #--------------------------------------------------------------------------
    def current_digit
      result = nil
      digits.each do |i|
        if krepeat?(i)
          c = char(i)
          result = (c.to_i.to_s == c) ? c.to_i : nil
        end
      end
      result
    end

    #--------------------------------------------------------------------------
    # * Current key from RGSS
    #--------------------------------------------------------------------------
    def rgss_current_key(method = :press?)
      @keys[255..-1].each do |k|
        next unless k
        return k if self.send(method, k)
      end
      return nil
    end

    #--------------------------------------------------------------------------
    # * Extending Interface
    #--------------------------------------------------------------------------
    alias_method :shift?,       :shift
    alias_method :caps_lock?,   :caps_lock
    alias_method :num_lock?,    :num_lock
    alias_method :scroll_lock?, :scroll_lock
    alias_method :alt_gr?,      :alt_gr

    #--------------------------------------------------------------------------
    # * Singleton Keyboard instance
    #--------------------------------------------------------------------------
    ::Keyboard = self.new

  end

  #==============================================================================
  # ** Drag
  #------------------------------------------------------------------------------
  #  Mouse Drag representation
  #==============================================================================

  class Drag < Rect

    #--------------------------------------------------------------------------
    # * Public instance variables
    #--------------------------------------------------------------------------
    attr_accessor :start
    attr_accessor :initiated
    attr_accessor :ox
    attr_accessor :oy

    #--------------------------------------------------------------------------
    # * Alias
    #--------------------------------------------------------------------------
    alias_method :initiated?, :initiated

    #--------------------------------------------------------------------------
    # * Initialize
    #--------------------------------------------------------------------------
    def initialize
      @start = Point.new(0,0)
      @initiated = false
      super(0,0,0,0)
    end

    #--------------------------------------------------------------------------
    # * Subtyping
    #--------------------------------------------------------------------------
    def subtype
      Rect.new(self.x, self.y, self.width, self.height)
    end

    #--------------------------------------------------------------------------
    # * Diagonal
    #--------------------------------------------------------------------------
    def diagonal
      Math.hypot(self.x, self.y, self.x + self.width, self.y + self.height)
    end

  end

  #==============================================================================
  # ** Mouse
  #------------------------------------------------------------------------------
  #  Concret Mouse representation
  #==============================================================================

  class Mouse

    #--------------------------------------------------------------------------
    # * Import
    #--------------------------------------------------------------------------
    externalize Externlib::GetCursorPos,   :cursor_position
    externalize Externlib::ScreenToClient, :screen_to_client
    [
      :trigger?,
      :press?,
      :release?,
      :repeat?,
      :time,
      :all?,
      :any?
    ].each { |m| externalize ::Keyboard.method(m), m }

    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader :point
    attr_reader :square
    attr_reader :last_rect
    attr_reader :dragging
    attr_reader :drag

    #--------------------------------------------------------------------------
    # * Alias
    #--------------------------------------------------------------------------
    alias_method :dragging?, :dragging

    #--------------------------------------------------------------------------
    # * Delegate process
    #--------------------------------------------------------------------------
    delegate :point,     :x
    delegate :point,     :y
    delegate :square,    :x, :square_x
    delegate :square,    :y, :square_y
    delegate :point,     :in?

    #-------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize
      @point        = Point.new(0, 0)
      @square       = Point.new(0, 0)
      @last_rect    = false
      @dragging     = false
      @drag         = Drag.new
    end

    #--------------------------------------------------------------------------
    # * Get current key
    #--------------------------------------------------------------------------
    def current_key(method = :press?)
      [:mouse_left, :mouse_right, :mouse_center, :mouse_x1, :mouse_x2,].each do |k|
        next unless k
        return k if self.send(method, k)
      end
      return nil
    end

    #--------------------------------------------------------------------------
    # * Frame update
    #--------------------------------------------------------------------------
    def update
      update_position
      update_drag
      update_interaction
    end

    #--------------------------------------------------------------------------
    # * Position update
    #--------------------------------------------------------------------------
    def update_position
      buffer = [0,0].pack('l2')
      cursor_position(buffer)
      screen_to_client(HWND, buffer)
      @point.x, @point.y = *buffer.unpack('l2')
      @square.null!
      update_square if SceneManager.scene.is_a?(Scene_Map)
    end

    #--------------------------------------------------------------------------
    # * Position update (by square)
    #--------------------------------------------------------------------------
    def update_square
      @square.x = ((($game_map.display_x * 32) + @point.x)/32).to_i
      @square.y = ((($game_map.display_y * 32) + @point.y)/32).to_i
    end

    #--------------------------------------------------------------------------
    # * Drag update
    #--------------------------------------------------------------------------
    def update_drag
      if Key::Mouse_left.trigger?
        @drag.initiated = true
        @drag.start.x = @point.x
        @drag.start.y = @point.y
        Draggable.find
      elsif @drag.initiated? && Key::Mouse_left.press?
        if dragging? || !(self.x == @drag.start.x && self.y == @drag.start.y)
          @dragging = true
          min_x, max_x  = *[@drag.start.x, @point.x].sort
          min_y, max_y  = *[@drag.start.y, @point.y].sort
          @drag.set(min_x, min_y, max_x-min_x, max_y-min_y)
          @drag.ox = @point.x - @drag.start.x
          @drag.oy = @point.y - @drag.start.y
          Draggable.drag
        end
      elsif @drag.initiated?
        @last_rect    = rect
        @drag.initiated = false
        @dragging     = false
        @drag.empty
        Draggable.drop
      end
    end

    #--------------------------------------------------------------------------
    # * Drag update
    #--------------------------------------------------------------------------
    def update_interaction
      Interactive.update
    end

    #--------------------------------------------------------------------------
    # * Know if the user clicked
    #--------------------------------------------------------------------------
    def click?
      Key::Mouse_left.release?
    end

    #--------------------------------------------------------------------------
    # * Get Drag rect
    #--------------------------------------------------------------------------
    def rect
      dragging? && @drag.subtype
    end

    #--------------------------------------------------------------------------
    # * Singleton Mouse instance
    #--------------------------------------------------------------------------
    ::Mouse = self.new

  end

end

#==============================================================================
# ** Draggable
#------------------------------------------------------------------------------
#  Any Object responding to ":x, :y, :in?" can be draggable.
#  Simply by pushing itself into the Draggable.objects array.
#==============================================================================

module Draggable
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    attr_accessor :objects, :picked
    Draggable.objects = []
    Draggable.picked  = nil
    #--------------------------------------------------------------------------
    # * Drags the picked Object
    #--------------------------------------------------------------------------
    def <<(*obj)
      obj.each do |o|
        @objects << o
        o.extend(Draggable)
      end
    end
    alias :push :<<
    #--------------------------------------------------------------------------
    # * Finds and pick the first Object clicked
    #--------------------------------------------------------------------------
    def find
      return if @picked
      obj = @objects.sort do |a, b|
        @checked = a
        if b.true_z == a.true_z
          b.object_id <=> a.object_id
        else
          b.true_z <=> a.true_z
        end
      end
      @picked = obj.find do |o|
          @checked = o
          o.in?(Mouse.x, Mouse.y)
      end
      return unless @picked
      @x_init = @picked.x
      @y_init = @picked.y
    rescue
      @objects.delete(@checked)
      find
    end
    #--------------------------------------------------------------------------
    # * Drags the picked Object
    #--------------------------------------------------------------------------
    def drag
      return unless @picked
      @picked.drag_viewport_instead ? o = @picked.viewport : o = @picked
      nx, ny = @x_init + Mouse.drag.ox, @y_init + Mouse.drag.oy
      if r = @picked.drag_restriction
        o.x = [[nx, r.x].max, r.x + r.width ].min
        o.y = [[ny, r.y].max, r.y + r.height].min
      else
        o.x, o.y = nx, ny
      end
    end
    #--------------------------------------------------------------------------
    # * Drops the last picked Object
    #--------------------------------------------------------------------------
    def drop
      @picked = nil
    end
  end

  #--------------------------------------------------------------------------
  # * Extend the draggable object's behaviour
  #--------------------------------------------------------------------------
  attr_accessor :drag_viewport_instead
  attr_accessor :drag_restriction

end

#==============================================================================
# ** Draggable
#------------------------------------------------------------------------------
#  Any Object responding to ":x, :y, :in?" can be draggable.
#  Simply by pushing itself into the Draggable.objects array.
#==============================================================================

module Interactive
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    attr_accessor :objects, :picked
    Interactive.objects = []
    Interactive.picked  = nil
    #--------------------------------------------------------------------------
    # * Drags the picked Object
    #--------------------------------------------------------------------------
    def <<(*obj)
      obj.each do |o|
        @objects << o
        o.extend(Interactive)
      end
    end
    alias :push :<<
    #--------------------------------------------------------------------------
    # * Drags the picked Object
    #--------------------------------------------------------------------------
    def update
      @picked = nil
      find
      return unless @picked
      @picked.on_mouse_hover   if @picked.respond_to?(:on_mouse_hover)
      @picked.on_mouse_trigger if @picked.respond_to?(:on_mouse_trigger) &&
        Key::Mouse_left.trigger?
      if Key::Mouse_left.release?
        @picked.on_mouse_release if @picked.respond_to?(:on_mouse_release)
        @picked.on_mouse_click   if @picked.respond_to?(:on_mouse_click)
      end
    end
    #--------------------------------------------------------------------------
    # * Finds and pick the first Object clicked
    #--------------------------------------------------------------------------
    def find
      return if @picked
      obj = @objects.sort do |a, b|
        @checked = a
        if b.true_z == a.true_z
          b.object_id <=> a.object_id
        else
          b.true_z <=> a.true_z
        end
      end
      @picked = obj.find do |o|
        @checked = o
        o.in?(Mouse.x, Mouse.y)
      end
      return unless @picked
      @x_init = @picked.x
      @y_init = @picked.y
    rescue
      @objects.delete(@checked)
      find
    end
  end
end

#==============================================================================
# ** Prompt
#------------------------------------------------------------------------------
#  Display prompt
#==============================================================================

module Prompt
  #--------------------------------------------------------------------------
  # * Extend self
  #--------------------------------------------------------------------------
  extend self
  #--------------------------------------------------------------------------
  # * Yes no
  #--------------------------------------------------------------------------
  def yes_no?(title, message)
    k = Externlib::MessageBox.call(HWND, message, title, 305)
    k == 1
  end
  #--------------------------------------------------------------------------
  # * Yes no cancel
  #--------------------------------------------------------------------------
  def yes_no_cancel?(title, message)
    k = Externlib::MessageBox.call(HWND, message, title, 3)
    return :yes if k == 6
    return :no if k == 7
    :cancel
  end
end

#==============================================================================
# ** Clipboard
#------------------------------------------------------------------------------
#  Module for clipboard handling
#==============================================================================

module Clipboard
  #--------------------------------------------------------------------------
  # * Extend self
  #--------------------------------------------------------------------------
  extend self
  #--------------------------------------------------------------------------
  # * Get a clipboard format
  #--------------------------------------------------------------------------
  def get_format(key)
    Externlib::RegisterClipboardFormat.(key)
  end
  FORMAT = Clipboard.get_format("VX Ace EVENT_COMMAND")
  #--------------------------------------------------------------------------
  # * Copy Text
  #--------------------------------------------------------------------------
  def push_text(clip_data)
    clip_data.to_ascii!.to_utf8!
    Externlib::OpenClipboard.(0)
    Externlib::EmptyClipboard.()
    hmem = Externlib::GlobalAlloc.(0x42, clip_data.length+1)
    mem = Externlib::GlobalLock.(hmem)
    Externlib::Memcpy.(mem, clip_data, clip_data.length+1)
    Externlib::SetClipboardData.(7, hmem)
    Externlib::GlobalFree.(hmem)
    Externlib::CloseClipboard.()
    true
  end
  #--------------------------------------------------------------------------
  # *  Get value from clipboard
  #--------------------------------------------------------------------------
  def get_text
    Externlib::OpenClipboard.(0)
    data = Externlib::GetClipboardData.(7)
    Externlib::CloseClipboard.()
    return "" if data == 0
    mem = Externlib::GlobalLock.(data)
    size = Externlib::GlobalSize.(data)
    final_data = " "*(size-1)
    Externlib::Memcpy.(final_data, mem, size)
    Externlib::GlobalUnlock.(data)
    final_data
  end
  #--------------------------------------------------------------------------
  # *  Push Command in Clipboard
  #--------------------------------------------------------------------------
  def push_command(*commands)
    clip_data = Marshal.dump(commands)
    clip_data.insert(0, [clip_data.size].pack('L'))
    Externlib::OpenClipboard.(0)
    Externlib::EmptyClipboard.()
    hmem = Externlib::GlobalAlloc.(0x42, clip_data.length)
    mem = Externlib::GlobalLock.(hmem)
    Externlib::Memcpy.(mem, clip_data, clip_data.length)
    Externlib::SetClipboardData.(Clipboard::FORMAT, hmem)
    Externlib::GlobalFree.(hmem)
    Externlib::CloseClipboard.()
    true
  end
end

#--------------------------------------------------------------------------
# * RGSS3 Extension
#--------------------------------------------------------------------------

#==============================================================================
# ** Input
#------------------------------------------------------------------------------
#  Extend to devices
#==============================================================================

module Input
  #--------------------------------------------------------------------------
  # * Eigenclass
  #--------------------------------------------------------------------------
  class << self
    #--------------------------------------------------------------------------
    # * Alias
    #--------------------------------------------------------------------------
    alias_method :sdk_update, :update
    #--------------------------------------------------------------------------
    # * Refresh devices
    #--------------------------------------------------------------------------
    def update
      Keyboard.update
      Mouse.update
      sdk_update if Game_Temp.in_game
    end
  end
end

#==============================================================================
# ** Generative
#------------------------------------------------------------------------------
#  Mixins collection
#==============================================================================

module Generative

  #==============================================================================
  # ** BitmapRect
  #------------------------------------------------------------------------------
  #  Rect API
  #==============================================================================

  module BitmapRect
    #--------------------------------------------------------------------------
    # * Rect accessor
    #--------------------------------------------------------------------------
    def rect
      return Rect.new(0,0,0,0) unless self.bitmap
      tx, ty = self.x, self.y
      if viewport
        tx = (viewport.x - viewport.ox + self.x - (self.ox * zoom_x))
        ty = (viewport.y - viewport.oy + self.y - (self.oy * zoom_y))
      end
      Rect.new(tx, ty, src_rect.width*zoom_x, src_rect.height*zoom_y)
    end
  end

  #==============================================================================
  # ** Command::API
  #------------------------------------------------------------------------------
  # Information about commands
  #==============================================================================

  module CommandAPI

    #--------------------------------------------------------------------------
    # * API for command handling
    #--------------------------------------------------------------------------
    def command(name, *args)
      method_name = name.to_sym
      Command.send(method_name, *args)
    end

    #--------------------------------------------------------------------------
    # * Alias
    #--------------------------------------------------------------------------
    alias_method :cmd, :command
    alias_method :c, :command
  end

end

#==============================================================================
# ** Kernel
#------------------------------------------------------------------------------
#  Object class methods are defined in this module.
#  This ensures compatibility with top-level method redefinition.
#==============================================================================

module Kernel
  #--------------------------------------------------------------------------
  # * Constants
  #--------------------------------------------------------------------------
  HWND = Externlib::FindWindow.call('RGSS Player', 0)
  IDENTITY = lambda{|x| x}
  USERNAME = ENV['USERNAME'].dup.to_utf8
  #--------------------------------------------------------------------------
  # * Import CMD API
  #--------------------------------------------------------------------------
  include Generative::CommandAPI
  extend Generative::CommandAPI

  def vsn(a = 1, b = 0, c = 0)
    [a, b, c]
  end

end

#==============================================================================
# ** Rect
#------------------------------------------------------------------------------
#  The rectangle class.
#==============================================================================

class Rect
  #--------------------------------------------------------------------------
  # * check if point 's include in the rect
  #--------------------------------------------------------------------------
  def in?(*p)
    point = p.to_point
    point.in?(self)
  end
  #--------------------------------------------------------------------------
  # * check if the mouse 's hover
  #--------------------------------------------------------------------------
  def hover?; in?(Mouse.point); end
  #--------------------------------------------------------------------------
  # * check Mouse Interaction
  #--------------------------------------------------------------------------
  def click?;         hover? && Mouse.click?;         end
  def press?(key);    hover? && Mouse.press?(key);    end
  def trigger?(key);  hover? && Mouse.trigger?(key);  end
  def repeat?(key);   hover? && Mouse.repeat?(key);   end
  def release?(key);  hover? && Mouse.release?(key);  end
  #--------------------------------------------------------------------------
  # * Mouse accessor
  #--------------------------------------------------------------------------
  def mouse_x; Mouse.x - self.abs_x; end
  def mouse_y; Mouse.y - self.abs_y; end

end

#==============================================================================
# ** Viewport
#------------------------------------------------------------------------------
#  Used when displaying sprites on one portion of the true
#==============================================================================

class Viewport
  #--------------------------------------------------------------------------
  # * Delegation
  #--------------------------------------------------------------------------
  [
    :in?,
    :hover?,
    :click?,
    :press?,
    :trigger?,
    :repeat?,
    :release?,
    :mouse_x,
    :mouse_y,
    :x,
    :y,
    :width,
    :height
  ].each{|m| delegate :rect, m}

end

#==============================================================================
# ** Sprite
#------------------------------------------------------------------------------
#  The sprite class. Sprites are the basic concept used to display characters
#  and other objects on the game screen.
#==============================================================================

class Sprite
  #--------------------------------------------------------------------------
  # * Extend sprite behaviour
  #--------------------------------------------------------------------------
  include Generative::BitmapRect
  #--------------------------------------------------------------------------
  # * Delegate Process
  #--------------------------------------------------------------------------
  [
    :mouse_x,
    :mouse_y
  ].each{|m| delegate :rect, m}

  #--------------------------------------------------------------------------
  # * check if point 's include in the rect
  #--------------------------------------------------------------------------
  def in?(*p)
    point = p.to_point
    point.screen_to_sprite(self)
    point.in?(rect)
  end
  #--------------------------------------------------------------------------
  # * check if the mouse 's hover
  #--------------------------------------------------------------------------
  def hover?(precise = false)
    return precise_in?(Mouse.point) if precise
    in?(Mouse.point)
  end
    #--------------------------------------------------------------------------
  # * check Mouse Interaction
  #--------------------------------------------------------------------------
  def click?(pr = false);         hover?(pr) && Mouse.click?;         end
  def press?(key, pr = false);    hover?(pr) && Mouse.press?(key);    end
  def trigger?(key, pr = false);  hover?(pr) && Mouse.trigger?(key);  end
  def repeat?(key, pr = false);   hover?(pr) && Mouse.repeat?(key);   end
  def release?(key, pr = false);  hover?(pr) && Mouse.release?(key);  end
  #--------------------------------------------------------------------------
  # * Precise inclusion
  #--------------------------------------------------------------------------
  def precise_in?(*p)
    return false unless self.bitmap
    return false if self.zoom_x == 0 || self.zoom_y == 0
    p1 = p.to_point
    p2 = p1.clone
    p2.screen_to_bitmap(self)
    in?(p1) && !bitmap.is_transparent?(p2)
  end
  #--------------------------------------------------------------------------
  # * Collision
  #--------------------------------------------------------------------------
  def collide_with?(with_rect)
    raise RuntimeError.new("Not a rect !") unless with_rect.respond_to?(:rect)
    a = self.rect
    b = with_rect.rect
    return !((b.x >= a.x + a.width) ||
        (b.x + b.width < a.x)  ||
        (b.y >= a.y + a.height)||
        (b.y + b.height < a.y)
      )
  end
  #--------------------------------------------------------------------------
  # * Super precise Collision
  #--------------------------------------------------------------------------
  def pixel_collide_with(with_rect)
    fa = collide_with?(with_rect)
    return false unless fa
    min, max = self, with_rect
    max, min = min, max if (min.rect.width * min.rect.height) > (max.rect.width * max.rect.height)
    lines = (0 .. (min.rect.height - 1)).to_a
    rows = (0 .. (min.rect.width - 1)).to_a
    lines = lines.reverse if min.rect.y < max.y
    rows = rows.reverse if min.rect.x < max.rect.x
    lines.each do |y|
      rows.each do |x|
        real_x = min.rect.x + x - max.rect.x
        real_y = min.rect.y + y - max.rect.y
        if max.rect.in?(min.rect.x + x, min.rect.y + y)
          fa = min.bitmap.pixel_visible?(x, y)
          fb = max.bitmap.pixel_visible?(real_x, real_y)
          return true if fa && fb
        end
      end
    end
    return false
  end
end

#==============================================================================
# ** Bitmap
#------------------------------------------------------------------------------
#  The bitmap class. Bitmaps represent images.
#  Sprites (Sprite) and other objects must be used to display bitmaps onscreen.
#==============================================================================

class Bitmap
  #--------------------------------------------------------------------------
  # * Optimize get_data
  #--------------------------------------------------------------------------
  def address
    return 0 if disposed?
    @address ||= (
      Externlib::RtlMoveMemory.call(a=[0].pack('L'), __id__*2+16, 4)
      Externlib::RtlMoveMemory.call(a, a.unpack('L')[0]+8 , 4)
      Externlib::RtlMoveMemory.call(a, a.unpack('L')[0]+16, 4)
      a.unpack('L')[0]
    )
  end
  #--------------------------------------------------------------------------
  # * Returns byte size
  #--------------------------------------------------------------------------
  def bytesize
    width * height * 4
  end
  #--------------------------------------------------------------------------
  # * Get Data
  #--------------------------------------------------------------------------
  def get_data
    data = [].pack('x') * bytesize
    Externlib::RtlMoveMemory.call(data, address, data.bytesize)
    data
  end
  #--------------------------------------------------------------------------
  # * Get Data pointer
  #--------------------------------------------------------------------------
  def get_data_ptr
    data = String.new
    Externlib::RtlMoveMemory.call(data.__id__*2, [0x6005].pack('L'), 4)
    Externlib::RtlMoveMemory.call(data.__id__*2+8, [bytesize,address].pack('L2'), 8)
    def data.free() Externlib::RtlMoveMemory.call(__id__*2, String.new, 16) end
    return data
  end
  #--------------------------------------------------------------------------
  # * Set data
  #--------------------------------------------------------------------------
  def set_data(data)
    Externlib::RtlMoveMemory.call(self.address, data, data.bytesize)
  end
  #--------------------------------------------------------------------------
  # * Fast get pixel
  #--------------------------------------------------------------------------
  def fast_get_pixel(*p)
    x_in, y_in = p.to_xy
    return Color.new(0,0,0,0) unless x_in.between?(0, self.width) && y_in.between?(0, self.height)
    data = self.get_data_ptr
    i = (x_in + (self.height - 1 - y_in) * self.width) * 4
    blue = data.getbyte(i)
    green = data.getbyte(i+1)
    red = data.getbyte(i+2)
    alpha = data.getbyte(i+3)
    data.free
    Color.new(red, green, blue, alpha)
  end
  #--------------------------------------------------------------------------
  # * Transparency
  #--------------------------------------------------------------------------
  def is_transparent?(*p)
    x_in, y_in = p.to_xy
    return true unless x_in.between?(0, self.width) && y_in.between?(0, self.height)
    data = self.get_data_ptr
    i = (x_in + (self.height - 1 - y_in) * self.width) * 4
    alpha = data.getbyte(i+3)
    data.free
    (alpha == 0)
  end
  def pixel_visible?(*p)
    x, y = p.to_xy
    @pixel_visible ||= Array.new(width) do |ix|
      Array.new(height) {|iy| !is_transparent?(ix, iy)}
    end
    @pixel_visible[x][y]
  end
  #--------------------------------------------------------------------------
  # * Gaussian filter function
  #--------------------------------------------------------------------------
  def self.gaussian_filter(radius)
    dbpwsigma = 0.4155 * (radius + 1)**2
              # 0.4155 ~= 2*(1/sqrt(2*log(255)))**2
    @gaussian_filter ||= Hash.new
    @gaussian_filter[radius] ||= Array.new(2*radius + 1) do |i|
      val = Math.exp(-((i-radius)**2)/dbpwsigma) / Math.sqrt(3.14*dbpwsigma)
    end
  end
  #--------------------------------------------------------------------------
  # * Gaussian blur application
  #--------------------------------------------------------------------------
  def gaussian_blur(radius = 3, step = 1)
    return self if (rad = radius.to_i) <= 0
    step = [1, step].max.to_i
    f = Bitmap.gaussian_filter(rad)
    ['x=', 'y='].each do |m|
      ori = clone
      rec = rect.clone
      f.length.times do |i|
        next if i == rad
        opa = (f[i]*255).to_i
        next if opa == 0
        rec.method(m).call((i - rad)*step)
        blt(0, 0, ori, rec, opa)
      end
    end
    self
  end
end

#==============================================================================
# ** Game_Temp
#------------------------------------------------------------------------------
#  This class handles temporary data that is not included with save data.
# The instance of this class is referenced by $game_temp.
#==============================================================================

class Game_Temp
  class << self
    attr_accessor :in_game
    Game_Temp.in_game = true
  end
end

#==============================================================================
# ** Command
#------------------------------------------------------------------------------
#  Command container
#==============================================================================

module Command
  extend self
  #--------------------------------------------------------------------------
  # * Method suggestions
  #--------------------------------------------------------------------------
  def method_missing(*args)
    super(*args) unless Game_Temp.in_game
    keywords = Command.singleton_methods
    keywords.uniq!
    keywords.delete(:method_missing)
    keywords.collect!{|i|i.to_s}
    keywords.sort_by!{|o| o.damerau_levenshtein(args[0].to_s)}
    snd = keywords.length > 1 ? " or [#{keywords[1]}]" : ""
    msg = "In  [map: #{map_id}, event: #{@event_id}, line: #{@index+1}]\n\n"
    msg += "[#{args[0]}] doesn't exist. Did you mean [#{keywords[0]}]"+snd+"?"
    msg += "\nDo you want save potential fix in the clipboard?"
    cp = Prompt.yes_no_cancel?("Error", msg)
    if cp == :yes
      res = keywords[0].to_s
      Clipboard.push_text(res)
    end
    exit if cp != :cancel
  end
end

#==============================================================================
# ** FileTools
#------------------------------------------------------------------------------
#  Tools for file manipulation
#==============================================================================

module FileTools
  extend self
  #--------------------------------------------------------------------------
  # * Write
  #--------------------------------------------------------------------------
  def write(file, str, flag = "w+")
    File.open(file, flag) {|f| f.write(str)}
  end
  #--------------------------------------------------------------------------
  # * Read
  #--------------------------------------------------------------------------
  def read(file)
    File.open(file, 'rb') { |f| f.read }
  end
  #--------------------------------------------------------------------------
  # * Copy
  #--------------------------------------------------------------------------
  def copy(src, dst)
    k = read(src)
    write(dst, k)
  end
  #--------------------------------------------------------------------------
  # * mv
  #--------------------------------------------------------------------------
  def move(src, dst)
    copy(src, dst)
    File.delete(src)
  end
end

#==============================================================================
# ** Socket
#------------------------------------------------------------------------------
# Adds the possibility to send/receive messages to/from a server
# Big thanks to Zeus81 (and to Nuki, too)
#==============================================================================

class Socket
  #--------------------------------------------------------------------------
  # * Public instance variable
  #--------------------------------------------------------------------------
  attr_reader :address
  attr_reader :port
  #--------------------------------------------------------------------------
  # * Externalize
  #--------------------------------------------------------------------------
  externalize Externlib::Htons,        :w32_htons
  externalize Externlib::Inet_Addr,    :w32_inet_addr
  externalize Externlib::Socket,       :w32_socket
  externalize Externlib::Connect,      :w32_connect
  externalize Externlib::Send,         :w32_send
  externalize Externlib::Recv,         :w32_recv
  externalize Externlib::Shutdown,     :w32_shutdown
  externalize Externlib::CloseSocket,  :w32_close
  #--------------------------------------------------------------------------
  # * Constructor
  #--------------------------------------------------------------------------
  def initialize(address, port)
    @address = address
    @port = port
    init_sockaddr
    @socket = w32_socket(2, 1, 0)
    @connected = false
  end
  #--------------------------------------------------------------------------
  # * Init sockaddr
  #--------------------------------------------------------------------------
  def init_sockaddr
    sinf = 2
    spor = w32_htons(@port)
    iadr = w32_inet_addr(@address)
    @sockaddr = [sinf, spor, iadr].pack('sSLx8')
  end
  #--------------------------------------------------------------------------
  # * Connect
  #--------------------------------------------------------------------------
  def connect!
    return unless @socket
    f = w32_connect(@socket, @sockaddr, @sockaddr.size)
    @connected = f != -1
    @connected
  end
  #--------------------------------------------------------------------------
  # * Send
  #--------------------------------------------------------------------------
  def send(data)
    return if !@socket || !@connected
    v = w32_send(@socket, data, data.length, 0)
    shutdown(2) if v == -1
    !v == -1
  end
  #--------------------------------------------------------------------------
  # * Recv
  #--------------------------------------------------------------------------
  def recv(len = 1024)
    return if !@socket || !@connected
    buf = [].pack('x'+len.to_s)
    v = w32_recv(@socket, buf, len, 0)
    return buf.gsub(/\x00/,"") if v != -1
    false
  end
  #--------------------------------------------------------------------------
  # * Shutdown
  #--------------------------------------------------------------------------
  def shutdown(how)
    return if !@socket || !@connected
    w32_shutdown(@socket, how)
  end
  #--------------------------------------------------------------------------
  # * Close
  #--------------------------------------------------------------------------
  def close
    return if !@socket || !@connected
    w32_close(@socket)
    @socket = nil
    @connected = false
  end
  #--------------------------------------------------------------------------
  # * Connected
  #--------------------------------------------------------------------------
  def connected?
    @socket && @connected
  end
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    attr_accessor :instance
  end
end


if RME.unsafe?
  #==============================================================================
  # ** Plane
  #------------------------------------------------------------------------------
  #  Plane rewritting
  #==============================================================================
  #------------------------------------------------------------------------
  # * jutsu to erase acutal Plane class
  #------------------------------------------------------------------------
  Object.send(:remove_const, :Plane)
  class Plane < Sprite

    #------------------------------------------------------------------------
    # * Z modifier
    #------------------------------------------------------------------------
    def z=(z); super(z * 1000);end

    #------------------------------------------------------------------------
    # * Oz modifier
    #------------------------------------------------------------------------
    def ox=(ox)
      return if @bitmap == nil
      super(ox % @bitmap.width)
    end

    #------------------------------------------------------------------------
    # * Oy modifier
    #------------------------------------------------------------------------
    def oy=(oy)
      return if @bitmap == nil
      super(oy % @bitmap.height)
    end

    #------------------------------------------------------------------------
    # * Bitmap accessor
    #------------------------------------------------------------------------
    def bitmap
      return @bitmap
    end

    #------------------------------------------------------------------------
    # * Bitmap Mutator
    #------------------------------------------------------------------------
    def bitmap=(tile)
      return tile if (@bitmap == tile)
      @bitmap = tile
      return super(nil) unless tile
      xx = 1 + (Graphics.width.to_f / tile.width).ceil
      yy = 1 + (Graphics.height.to_f / tile.height).ceil
      plane = Bitmap.new(@bitmap.width * xx, @bitmap.height * yy)
      (0..xx).each do|x|
        (0..yy).each do |y|
          plane.blt(x * @bitmap.width, y * @bitmap.height, @bitmap, @bitmap.rect)
        end
      end
      super(plane)
    end

  end
end

# -*- coding: utf-8 -*-
#==============================================================================
# ** RME Database
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
    Types::Simple.new(:animation, [:animation, :anim],                   :to_i, true),
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
    EmbedData.new(:animation,   RPG::Animation,   load_data("Data/Animations.rvdata2")),
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
        current     = eval(current) if type.is_a?(Types::Complex) && current.is_a?(String)
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
    #--------------------------------------------------------------------------
    # * Init
    #--------------------------------------------------------------------------
    def init_cst_db
      create_cst_views
      purge_database
      set_db_rvdata
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
          content.each do |_line|
            line = _line.strip
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

# -*- coding: utf-8 -*-
#==============================================================================
# ** RME Internal
#------------------------------------------------------------------------------
#  With :
# Nuki
#------------------------------------------------------------------------------
# Internals DataStructures
#==============================================================================

#==============================================================================
# ** IColor
#------------------------------------------------------------------------------
#  Colors registration
#==============================================================================

class IColor < Static::Table
  pk string :name
  integer :red
  integer :green
  integer :blue
  integer :alpha
end
#--------------------------------------------------------------------------
# * Std Colors
#--------------------------------------------------------------------------
IColor.insert("black", 0, 0, 0, 255)
IColor.insert("white", 255, 255, 255, 255)
IColor.insert("red", 255, 0, 0, 255)
IColor.insert("green", 0, 255, 0, 255)
IColor.insert("blue", 0, 0, 255, 255)
IColor.insert("gray", 120, 120, 120, 255)

#==============================================================================
# ** ITone
#------------------------------------------------------------------------------
#  Tone registration
#==============================================================================

class ITone < Static::Table
  pk string :name
  integer :red
  integer :green
  integer :blue
  integer :gray
end

#--------------------------------------------------------------------------
# * Std Tone
#--------------------------------------------------------------------------
ITone.insert("transluent", 0, 0, 0, 0)
ITone.insert("darkblue", -34, 0, 68, 0)

#==============================================================================
# ** ITextProfile
#------------------------------------------------------------------------------
#  Text Profile Registration
#==============================================================================

class ITextProfile < Static::Table
  pk string :name
  integer :size
  string :font
  string :color_name
  boolean :italic
  boolean :bold
  boolean :outline
  string :outline_color_name
  boolean :shadow

  #--------------------------------------------------------------------------
  # * Convert to font
  #--------------------------------------------------------------------------
  def to_font
    f = Font.new
    f.name = font
    f.size = size
    f.color = get_color(color_name)
    f.italic = italic
    f.bold = bold
    f.outline = outline
    f.out_color = get_color(outline_color_name)
    f.shadow = shadow
    f
  end

end

#--------------------------------------------------------------------------
# * Std TextProfiles
#--------------------------------------------------------------------------
ITextProfile.insert(
  "default",
  Font.default_size,
  Font.default_name,
  "white",
  Font.default_italic,
  Font.default_bold,
  Font.default_outline,
  "black",
  Font.default_shadow
  )

ITextProfile.insert(
  "standard",
  Font.default_size,
  Font.default_name,
  "black",
  Font.default_italic,
  Font.default_bold,
  false,
  "black",
  false
  )

ITextProfile.insert(
  "small_standard",
  15,
  Font.default_name,
  "black",
  Font.default_italic,
  Font.default_bold,
  false,
  "black",
  false
  )

ITextProfile.insert(
  "small_standard_title",
  12,
  Font.default_name,
  "white",
  Font.default_italic,
  true,
  false,
  "black",
  false
  )

#==============================================================================
# ** ITextFieldProfile
#------------------------------------------------------------------------------
#  TextField Profile Registration
#==============================================================================

class ITextFieldProfile < Static::Table
  pk string :name
  string :text_profile
  integer :alignement
  integer :height
  integer :padding
  integer :padding_bottom
  string :tone_name

  #--------------------------------------------------------------------------
  # * Get tone
  #--------------------------------------------------------------------------
  def get_tone
    get_toneProfile(tone_name)
  end
end

#--------------------------------------------------------------------------
# * Std TextFieldProfiles
#--------------------------------------------------------------------------
ITextFieldProfile.insert("default", "default", 0, 54, 6, 6, "darkblue")

#==============================================================================
# ** ITextFieldProfile
#------------------------------------------------------------------------------
#  TextField Profile Registration
#==============================================================================

class IWindowProfile < Static::Table
  pk string :name
  string :text_profile
  integer :alignement
  string :tone_name

  #--------------------------------------------------------------------------
  # * Get tone
  #--------------------------------------------------------------------------
  def get_tone
    get_toneProfile(tone_name)
  end
end

#--------------------------------------------------------------------------
# * Std WindowProfiles
#--------------------------------------------------------------------------
IWindowProfile.insert("default", "default", 0, "darkblue")

#==============================================================================
# ** ISkipTitle
#------------------------------------------------------------------------------
#  Skip title config
#==============================================================================

class ISkipTitle < Static::Table
  pk string :options
  boolean :activate
  integer :x
  integer :y
  integer :map_id
end
ISkipTitle.insert("SkipTitle", false, 0, 0, 0)

#==============================================================================
# ** Kernel
#------------------------------------------------------------------------------
#  Object class methods are defined in this module.
#  This ensures compatibility with top-level method redefinition.
#==============================================================================

module Kernel
  #--------------------------------------------------------------------------
  # * Get color by name
  #--------------------------------------------------------------------------
  def get_color(name)
    c = IColor[name]
    return Color.new(0,0,0) unless c
    Color.new(c.red, c.green, c.blue, c.alpha)
  end
  #--------------------------------------------------------------------------
  # * Get TextProfile by name
  #--------------------------------------------------------------------------
  def get_profile(name)
    c = ITextProfile[name]
    return ITextProfile["default"] unless c
    c
  end
  #--------------------------------------------------------------------------
  # * Get Textfield Profile by name
  #--------------------------------------------------------------------------
  def get_fieldProfile(name)
    c = ITextFieldProfile[name]
    return ITextFieldProfile["default"] unless c
    c
  end

  #--------------------------------------------------------------------------
  # * Get Window Profile by name
  #--------------------------------------------------------------------------
  def get_windowProfile(name)
    c = IWindowProfile[name]
    ITextFieldProfile["default"] unless c
    c
  end

  #--------------------------------------------------------------------------
  # * Get Skip title
  #--------------------------------------------------------------------------
  def skip_title_data
    ISkipTitle["SkipTitle"]
  end

  #--------------------------------------------------------------------------
  # * Map exists?
  #--------------------------------------------------------------------------
  def map_exists?(id)
    load_data(sprintf("Data/Map%03d.rvdata2", id)).to_bool rescue false
  end

  #--------------------------------------------------------------------------
  # * Get Tone by name
  #--------------------------------------------------------------------------
  def get_toneProfile(name)
    c = ITone[name]
    return Tone.new(0,0,0) unless c
    Tone.new(c.red, c.green, c.blue, c.gray)
  end

end

# -*- coding: utf-8 -*-
#==============================================================================
# ** RME Gui
#------------------------------------------------------------------------------
#  With :
# Joke
# Grim
# Nuki
#
#------------------------------------------------------------------------------
# Graphical User Interface SDK for RME's tools
#==============================================================================

=begin

License coming soon

=end

if RME.gui_enabled?

#==============================================================================
# ** Color
#------------------------------------------------------------------------------
#  The RGBA color class.
#==============================================================================

class Color
  alias_method :sdk_initialize, :initialize
  def initialize(*args)
    if args.length == 1 && args[0].is_a?(String)
      args = args[0][1..6].scan(/../).map{|color| color.to_i(16)}
    end
    sdk_initialize(*args)
  end
end

#==============================================================================
# ** Generative
#------------------------------------------------------------------------------
#  Mixins collection
#==============================================================================

module Generative

  #==============================================================================
  # ** Stackable
  #------------------------------------------------------------------------------
  #  Dad in Mom
  #==============================================================================

  module Stackable

    #--------------------------------------------------------------------------
    # * Pushes other in self
    #--------------------------------------------------------------------------
    def <<(oth)
      oth.viewport = Viewport.new if (oth.is_a?(Sprite) && !oth.viewport)
      oth.parent = self
      self.children ||= []
      self.children << oth
      compute
      oth
    end
    #--------------------------------------------------------------------------
    # * Pushes self in other
    #--------------------------------------------------------------------------
    def >>(oth)
      self.viewport = Viewport.new if (self.is_a?(Sprite) && !self.viewport)
      self.parent = oth
      oth.children ||= []
      oth.children << self
      compute
      oth
    end
    #--------------------------------------------------------------------------
    # * Parents
    #--------------------------------------------------------------------------
    def parents
      return [] unless parent
      parents = [parent]
      parents << parents[-1].parent while parents[-1].parent
      parents
    end
    
    #--------------------------------------------------------------------------
    # * Computing
    #--------------------------------------------------------------------------
    def compute
      compute_self
      recompute_children
    end
    #--------------------------------------------------------------------------
    # * Computes self
    #--------------------------------------------------------------------------
    def compute_self
    end
    #--------------------------------------------------------------------------
    # * Children recomputing
    #--------------------------------------------------------------------------
    def recompute_children
      children.each{|c| c.compute} if self.children
    end
    #--------------------------------------------------------------------------
    # * Free stacking
    #--------------------------------------------------------------------------
    def dispose_stack
      children.reverse.each do |c|
        c.dispose if c.respond_to?(:dispose)
      end if self.children
      parent.children.delete(self) if self.parent
    end

  end

  #==============================================================================
  # ** RectComputing
  #------------------------------------------------------------------------------
  #  Baby's shape
  #==============================================================================

  module RectComputing

    #--------------------------------------------------------------------------
    # * Computing rules
    #--------------------------------------------------------------------------
    module Rules

      class << self
        attr_accessor :values
        Rules.values = Hash.new
        delegate_accessor :values, :[]
      end

      self[:absolute] = proc do |r|
        r.true_x      = r.abs_x  = r.x
        r.true_y      = r.abs_y  = r.y
        r.true_width  = r.width
        r.true_height = r.height
      end

      self[:relative] = proc do |r|
        pa = r.parent.inner
        r.true_x      = r.abs_x  = r.x + pa.abs_x
        r.true_y      = r.abs_y  = r.y + pa.abs_y
        r.true_width  = r.width
        r.true_height = r.height
      end

      self[:enclosed] = proc do |r|
        pa = r.parent.inner
        ax = r.abs_x  = r.x + pa.abs_x
        ay = r.abs_y  = r.y + pa.abs_y
        mx = ax + r.width
        my = ay + r.height
        lx = pa.true_x + pa.true_width
        ly = pa.true_y + pa.true_height
        r.true_x      = ax.bound(pa.true_x, lx)
        r.true_y      = ay.bound(pa.true_y, ly)
        r.true_width  = mx.bound(pa.true_x, lx) - r.true_x
        r.true_height = my.bound(pa.true_y, ly) - r.true_y
      end

    end
    #--------------------------------------------------------------------------
    # * Legacy of Rect
    #--------------------------------------------------------------------------
    attr_accessor :legacy_rule
    #--------------------------------------------------------------------------
    # * Computes real Rect from legacy rules
    #--------------------------------------------------------------------------
    def compute_self
      if self.parent
        @legacy_rule ||= :enclosed
        Rules[@legacy_rule][self]
      else
        Rules[:absolute][self]
      end
    end

  end

end

#==============================================================================
# ** Percentage
#------------------------------------------------------------------------------
# Ugly pseudo-typage method
#==============================================================================

class Numeric
  def percent?
    false
  end
  def percent
    Percentage.new(self)
  end
end
class Percentage
  attr_accessor :value
  [:abs,:ceil,:floor,:integer?,:round,:truncate,
    :*,:+,:-,:/,:%,:**,:<=>,:==,:<,:<=,:>,:>=].each{|m| delegate :value, m}
  def initialize(value)
    @value = value
  end
  def percent?
    true
  end
end

#==============================================================================
# ** Rect
#------------------------------------------------------------------------------
#  The rectangle class.
#==============================================================================

class Rect

  #--------------------------------------------------------------------------
  # * Import Imbrication API
  #--------------------------------------------------------------------------
  include Generative::Stackable
  include Generative::RectComputing
  #--------------------------------------------------------------------------
  # * Public instances variables
  #--------------------------------------------------------------------------
  attr_accessor :children, :parent, :abs_x, :abs_y
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :true_x,  :x
  alias_method :true_y,  :y
  alias_method :true_x=, :x=
  alias_method :true_y=, :y=
  alias_method :true_width,   :width
  alias_method :true_height,  :height
  alias_method :true_width=,  :width=
  alias_method :true_height=, :height=
  #--------------------------------------------------------------------------
  # * Auto-computing
  #--------------------------------------------------------------------------
  [
    :x,
    :y,
    :width,
    :height
  ].each{|m| attr_accessor_callback :compute, m}
  #--------------------------------------------------------------------------
  # * Gets properties
  #--------------------------------------------------------------------------
  def abs_x;  @abs_x  ||= true_x; end
  def abs_y;  @abs_y  ||= true_y; end
  def x;      @x      ||= true_x; end
  def y;      @y      ||= true_y; end
  def width;  @width  ||= true_width;  end
  def height; @height ||= true_height; end
  #--------------------------------------------------------------------------
  # * Sets all parameters at once
  #--------------------------------------------------------------------------
  def set(*args)
    if (a = args[0]).is_a? Rect
      @x, @y, @width, @height = a.x, a.y, a.width, a.height
    else
      @x, @y, @width, @height = *args
    end
    compute
    self
  end
  #--------------------------------------------------------------------------
  # * Sets all components to 0.
  #--------------------------------------------------------------------------
  def empty
    @x = @y = @width = @height = self.true_x = self.true_y =
    self.true_width = self.true_height = 0
    self
  end
  #--------------------------------------------------------------------------
  # * Gets real Rect computed from legacy rules
  #--------------------------------------------------------------------------
  def computed
    Rect.new(true_x, true_y, true_width, true_height)
  end
  #--------------------------------------------------------------------------
  # * Clone
  #--------------------------------------------------------------------------
  def clone
    Rect.new(*parameters)
  end
  alias :dup :clone
  #--------------------------------------------------------------------------
  # * Returns parameters into Array format
  #--------------------------------------------------------------------------
  def parameters
    [self.x, self.y, self.width, self.height]
  end
  #--------------------------------------------------------------------------
  # * Sets parameters without auto-computing
  #--------------------------------------------------------------------------
  def set_parameters(x, y, w, h)
    @x = x
    @y = y
    @width = w
    @height = h
  end
  #--------------------------------------------------------------------------
  # * check if point 's include in the rect
  #--------------------------------------------------------------------------
  def in?(*p)
    point = p.to_point
    point.in?(self.computed)
  end
  #--------------------------------------------------------------------------
  # * Inception
  #--------------------------------------------------------------------------
  def inner
    self
  end

end

#==============================================================================
# ** Viewport
#------------------------------------------------------------------------------
#  Used when displaying sprites on one portion of the true
#==============================================================================

class Viewport

  #--------------------------------------------------------------------------
  # * Import Imbrication API
  #--------------------------------------------------------------------------
  include Generative::Stackable
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :true_z,  :z
  alias_method :true_z=, :z=
  alias_method :true_ox,  :ox
  alias_method :true_ox=, :ox=
  alias_method :true_oy,  :oy
  alias_method :true_oy=, :oy=
  alias_method :inner, :rect
  alias_method :sdk_dispose, :dispose
  #--------------------------------------------------------------------------
  # * Delegation
  #--------------------------------------------------------------------------
  [
    :children,
    :parent,
    :legacy_rule
  ].each{|m| delegate_accessor :rect, m}
  #--------------------------------------------------------------------------
  # * Auto-computing when changing parameters
  #--------------------------------------------------------------------------
  [
    :ox,
    :oy,
    :x,
    :y,
    :width,
    :height
  ].each{|m| attr_accessor_callback :compute, m}
  #--------------------------------------------------------------------------
  # * Gets properties
  #--------------------------------------------------------------------------
  def ox;         @ox     ||= true_ox; end
  def oy;         @oy     ||= true_oy; end
  def x;          @x      ||= rect.x;  end
  def y;          @y      ||= rect.y;  end
  def z;          @z      ||= true_z;  end
  def width;      @width  ||= rect.width;  end
  def height;     @height ||= rect.height; end
  #--------------------------------------------------------------------------
  # * The viewport's z-coordinate.
  #--------------------------------------------------------------------------
  def z=(v)
    if @z != v
      @z = v
      compute_z
    end
  end
  #--------------------------------------------------------------------------
  # * Sets parameters without auto-computing
  #--------------------------------------------------------------------------
  def set_parameters(x, y, w, h)
    @x = x
    @y = y
    @width = w
    @height = h
  end
  #--------------------------------------------------------------------------
  # * Computes real Rect from legacy rules
  #--------------------------------------------------------------------------
  def compute_self
    rect.set(self.x, self.y, self.width, self.height)
    rect.compute_self
    self.true_ox = rect.true_x - rect.abs_x + self.ox
    self.true_oy = rect.true_y - rect.abs_y + self.oy
    compute_z
  end
  #--------------------------------------------------------------------------
  # * Computes real z-coordinate from legacy rule
  #--------------------------------------------------------------------------
  def compute_z
    if self.parent && self.parent.respond_to?(:z)
      self.true_z = self.z + self.parent.true_z + 1
    else
      self.true_z = self.z
    end
    if self.children
      self.children.each{|c| c.respond_to?(:compute_z) && c.compute_z}
    end
  end
  #--------------------------------------------------------------------------
  # * Dispose
  #--------------------------------------------------------------------------
  def dispose
    @disposed = true
    dispose_stack
    sdk_dispose
  end
  attr_reader :disposed
  alias_method :disposed?, :disposed
end

#==============================================================================
# ** Sprite
#------------------------------------------------------------------------------
#  Append Stackable Component
#==============================================================================

class Sprite

  #--------------------------------------------------------------------------
  # * Delegation
  #--------------------------------------------------------------------------
  [
    :children,
    :parent,
    :legacy_rule,
    :compute
  ].each{|m| delegate_accessor :viewport, m}
  #--------------------------------------------------------------------------
  # * Import Imbrication API
  #--------------------------------------------------------------------------
  include Generative::Stackable

end

#==============================================================================
# ** GUI
#------------------------------------------------------------------------------
#  Graphical User interface
#==============================================================================

module Gui

  #==============================================================================
  # ** Style
  #------------------------------------------------------------------------------
  #  Telling what the things looks like
  #==============================================================================

  class Style
    #--------------------------------------------------------------------------
    # * Public instances variables
    #--------------------------------------------------------------------------
    attr_accessor :values
    #--------------------------------------------------------------------------
    # * Style initialize
    #--------------------------------------------------------------------------
    def initialize(args = nil)
      @values = Hash.new
      set background_color: Color.new(*[255]*3),
          border_color:     Color.new(*[0]*3),
          x:                0,
          y:                0,
          width:            :auto,
          height:           :auto,
          border:           1,
          border_width:     1,
          border_radius:    0,
          font:             get_profile("small_standard").to_font,
          max_height:       nil,
          min_height:       0,
          max_width:        nil,
          min_width:        0,
          padding:          8,
          margin:           0,
          value:            " ",
          title:            " ",
          checked_label:    "x",
          unchecked_label:  " ",
          display:          :inline
      set args if args
    end
    #--------------------------------------------------------------------------
    # * Reading & Writing access to style specs
    #--------------------------------------------------------------------------
    def [](k)
      @values[k.to_sym]
    end
    def []=(k,v)
      @values[k.to_sym] = v
    end
    #--------------------------------------------------------------------------
    # * Set style spec with named args (ex: set(margin: 5))
    #--------------------------------------------------------------------------
    def set(args)
      return unless args
      args.each do |k,v|
        if [:margin, :padding, :border].include?(k)
          set_param(k, *v)
        else
          self[k] = v
        end
      end
      self
    end
    #--------------------------------------------------------------------------
    # * Quick style specification for :margin, :padding, :border
    #  Exemple :
    #    border: 5          => all border is set to 5
    #    border: [5,8]      => top&bottom border is set to 5
    #                          left&right border is set to 8
    #    border: [5,8,10]   => in order: top, left&right, bottom definition
    #    border: [5,8,10,3] => in order: top, right, bottom, left definition
    #--------------------------------------------------------------------------
    def set_param(m, *args)
      m = m.to_s
      case args.length
      when 1
        self["#{m}_bottom"] = self["#{m}_top"]   =
        self["#{m}_left"]   = self["#{m}_right"] = args[0]
      when 2
        self["#{m}_bottom"] = self["#{m}_top"]   = args[0]
        self["#{m}_left"]   = self["#{m}_right"] = args[1]
      when 3
        self["#{m}_top"]    = args[0]
        self["#{m}_bottom"] = args[2]
        self["#{m}_left"]   = self["#{m}_right"] = args[1]
      else
        self["#{m}_top"],     self["#{m}_right"],
        self["#{m}_bottom"],  self["#{m}_left"]  = *args
      end
    end
    #--------------------------------------------------------------------------
    # * Contracts the given rect with the given method
    #--------------------------------------------------------------------------
    def contract_with(m, r)
      m = m.to_s
      x = r.x + self["#{m}_left"]
      y = r.y + self["#{m}_top" ]
      w = r.width  - self["#{m}_left"] - self["#{m}_right" ]
      h = r.height - self["#{m}_top" ] - self["#{m}_bottom"]
      r.set x, y, w, h
    end
    #--------------------------------------------------------------------------
    # * CSS application
    #--------------------------------------------------------------------------
    def css_match(obj)
      Gui::CSS.apply_to(obj)
    end
  end

  #==============================================================================
  # ** CSS
  #------------------------------------------------------------------------------
  #  Telling what the things looks like LEVEL 2
  #==============================================================================

  module CSS

    #--------------------------------------------------------------------------
    # * Singleton
    #--------------------------------------------------------------------------
    class << self
      #--------------------------------------------------------------------------
      # * CSS entries accessor
      #--------------------------------------------------------------------------
      attr_accessor :entries
      delegate_accessor :entries, :[]
      CSS.entries = Hash.new
      #--------------------------------------------------------------------------
      # * Matching and application for Object's Style instance
      #--------------------------------------------------------------------------
      def apply_to(obj)
        entries.each do |selector, style|
          obj.style.set(style) if selector[obj]
        end
      end
    end # End Singleton

    #--------------------------------------------------------------------------
    # * CSS writing method
    #--------------------------------------------------------------------------
    def set(*selectors, style)
      selectors.each do |s|
        s = s+'._' unless s.include?('.')
        s = '_ '+s unless s.include?(' ')
        s = s.split(/\ |\./)
        sl = proc do |obj|
          c1 = s[0] == "_" || obj.parents.any?{|pa| pa.class.to_s == s[0]}
          c2 = s[1] == ""  || obj.class.to_s == s[1]
          c3 = s[2] == "_" || obj.respond_to?(:name) && obj.name.to_s == s[2]
          c1 && c2 && c3
        end
        CSS[sl] = style
      end
    end

  end

  #==============================================================================
  # ** GUI::Tools
  #------------------------------------------------------------------------------
  #  Graphical User interface helpers
  #==============================================================================

  module Tools

    class << self
      def random_color
        Color.new(rand(255), rand(255), rand(255))
      end
      def password_char
        '•'
      end
    end

    module Activable
      def actived?
        @active
      end
      def activate
        @active = true
      end
      def deactivate
        @active = false
      end
      def trigger_activation
        @active = !@active
      end
      def activation_callback
        @activation_callback
      end
      def set_activation_callback(&block)
        @activation_callback = lambda{|s| false}
        @activation_callback = block if block_given?
      end
      def check_callback
        if @activation_callback
          if @activation_callback.call(self)
            @active = true
          end
        end
      end
    end

  end

  #==============================================================================
  # ** GUI::Components
  #------------------------------------------------------------------------------
  #  Graphical User interface components
  #==============================================================================

  module Components

    #==============================================================================
    # ** Text_Field
    #------------------------------------------------------------------------------
    #  IZI Things
    #==============================================================================

    class Text_Field
      #--------------------------------------------------------------------------
      # * IZI Public instance variables
      #--------------------------------------------------------------------------
      [
        :in?,
        :hover?,
        :click?,
        :press?,
        :trigger?,
        :repeat?,
        :release?,
        :mouse_x,
        :mouse_y,
        :>>,
        :<<
      ].each{|m| delegate :@viewport, m}
      attr_reader :cursor
      delegate_accessor :@text, :value
      delegate_accessor :@text, :virtual_position
      delegate_accessor :@text, :selection_start
      delegate :@text, :formatted_value
      delegate :@text, :has_transformation?
      delegate :@text, :delete
      [:x, :y, :width, :height, :inner, :outer].each{|m| delegate_accessor :@viewport, m}

      include Tools::Activable
      #--------------------------------------------------------------------------
      # * IZI Object initialize
      #--------------------------------------------------------------------------
      def initialize(textrecorder,x,y,w,font="Standard",active=false,&block)
        @active = active
        @text = textrecorder
        @x,@y,@w = x,y,w
        if font.is_a?(Font)
          @font = font  
        else
          @font = get_profile(font).to_font
        end
        @text.start_capture
        @cursor_timer = 0
        create_sprite
        create_viewport
        create_selection_rect
        create_cursor
        set_activation_callback(&block)
        update_bitmap
        update_cursor_pos
      end
      #--------------------------------------------------------------------------
      # * Refresh
      #--------------------------------------------------------------------------
      def refresh
        update_bitmap
        update_cursor_pos
        update_selection_rect
        update_viewport
      end
      #--------------------------------------------------------------------------
      # * IZI Update
      #--------------------------------------------------------------------------
      def update
        unless actived?
          @cursor.opacity = 0
          @selection_rect.opacity = 0
          check_callback
        else
          @selection_rect.opacity = 255
          locate if press?(:mouse_left) || Mouse.dragging? && in?(Mouse.drag.start)
          @text.update unless Devices::Keys::Enter.press? || Devices::Keys::Tab.press?
          update_bitmap if @text.has_transformation?
          if @text.cursor_has_moved?
            update_cursor_pos
            update_selection_rect
            update_viewport
          end
          update_cursor_blink
        end
      end
      #--------------------------------------------------------------------------
      # * IZI Sprite creation
      #--------------------------------------------------------------------------
      def create_sprite
        @sprite = Sprite.new
        @sprite.bitmap = Bitmap.new(1,1)
        @sprite.bitmap.font = @font
        @split_format = 640 / @sprite.bitmap.text_size("W").width
      end
      #--------------------------------------------------------------------------
      # * IZI Viewport creation
      #--------------------------------------------------------------------------
      def create_viewport
        @h = @sprite.bitmap.text_size("W").height
        @viewport = Viewport.new(@x,@y,@w,@h)
        @sprite.viewport = @viewport
      end
      #--------------------------------------------------------------------------
      # * IZI Cursor creation
      #--------------------------------------------------------------------------
      def create_cursor
        @cursor = Sprite.new(@viewport)
        @cursor.bitmap = Bitmap.new(1,@h)
        @cursor.bitmap.fill_rect(0,0,1,@h,Color.new(0,0,0))
        @cursor.ox = 1
      end
      def create_selection_rect
        @selection_rect = Sprite.new(@viewport)
        @selection_rect.bitmap = Bitmap.new(1,1)
        @selection_rect.bitmap.fill_rect(0,0,1,1,Color.new(51,153,255))
        @selection_rect.zoom_x = 0
        @selection_rect.zoom_y = @h
        @selection_rect.z = -1
      end
      #--------------------------------------------------------------------------
      # * IZI Bitmap update
      #--------------------------------------------------------------------------
      def update_bitmap
        text = value
        text = " " if text.empty?
        rect = @sprite.bitmap.text_size(text)
        @sprite.bitmap.dispose
        @sprite.bitmap = Bitmap.new(rect.width, rect.height)
        @sprite.bitmap.font = @font
        last_x = 0
        text.split_each(@split_format).each do |a_text|
          rect = @sprite.bitmap.text_size(a_text)
          rect.x = last_x
          @sprite.bitmap.draw_text(rect, a_text)
          last_x += rect.width
        end
      end
      #--------------------------------------------------------------------------
      # * IZI Cursor blink
      #--------------------------------------------------------------------------
      def update_cursor_blink
        @cursor_timer = (@cursor_timer + 1/20.0)%2
        @cursor.opacity = @cursor_timer < 1 ? 255 : 0
      end
      #--------------------------------------------------------------------------
      # * IZI Cursor position update
      #--------------------------------------------------------------------------
      def update_cursor_pos
        @cursor_timer = 0
        pos = @text.virtual_position
        if pos == 0
          @cursor.x = 1
        else
          @cursor.x = @sprite.bitmap.text_size(value[0...pos]).width
        end
      end
      #--------------------------------------------------------------------------
      # * IZI Selection Rect update
      #--------------------------------------------------------------------------
      def update_selection_rect
        pos = @text.selection_start
        if pos == 0
          @selection_rect.x = 1
        else
          @selection_rect.x = @sprite.bitmap.text_size(value[0...pos]).width
        end
        delta = @cursor.x - @selection_rect.x
        @selection_rect.zoom_x = delta.abs
        @selection_rect.x += delta if delta < 0
      end
      #--------------------------------------------------------------------------
      # * IZI Viewport update
      #--------------------------------------------------------------------------
      def update_viewport
        a = @cursor.x - self.width
        b = @sprite.bitmap.width - self.width
        @viewport.ox = @viewport.ox.bound(a, b).bound(0, @cursor.x-1)
      end
      #--------------------------------------------------------------------------
      # * IZI Cursor location on click
      #--------------------------------------------------------------------------
      def locate
        x = mouse_x + @viewport.ox
        approx = x * value.length / @sprite.bitmap.width
        match = approach(approx, x)
        @text.cursor_jump(match)
        @viewport.ox -= 10 if mouse_x < 0
        @viewport.ox += 10 if (self.width - mouse_x) < 0
      end
      #--------------------------------------------------------------------------
      # * IZI Approach
      #--------------------------------------------------------------------------
      def approach(a, x, memoa=a, memob=0)
        bound = a.bound(0,value.length)
        return bound if bound != a
        b = @sprite.bitmap.text_size(value[0...a]).width
        return a if (b-x) == 0 || (b-x)==(x-memob)
        return memoa if (b-x).abs > (memob-x).abs
        approach(a + (0 <=> (b-x)), x, a, b)
      end
      #--------------------------------------------------------------------------
      # * IZI Dispose
      #--------------------------------------------------------------------------
      def dispose
        self.instance_variables.each{|i| self.instance_variable_set(i, nil) }
      end

    end

    #==============================================================================
    # ** TextRecorder
    #------------------------------------------------------------------------------
    #  Record text state
    #==============================================================================

    class Abstract_Recorder
      #--------------------------------------------------------------------------
      # * Public instance variables
      #--------------------------------------------------------------------------
      attr_accessor :exit_keys
      attr_accessor :stopped
      attr_accessor :transformed
      attr_accessor :cursor_moved
      attr_accessor :virtual_position
      attr_accessor :selection_start
      alias_method :stopped?, :stopped
      def value=(v); @value = v; end
      def value; @value; end
      def formatted_value; @value; end

      #--------------------------------------------------------------------------
      # * Has a transformation
      #--------------------------------------------------------------------------
      def has_transformation?
        result = @transformed
        @transformed = false
        result
      end
      #--------------------------------------------------------------------------
      # * Cursor has moved
      #--------------------------------------------------------------------------
      def cursor_has_moved?
        result = @cursor_moved
        @cursor_moved = false
        result
      end
      #--------------------------------------------------------------------------
      # * Cursor jump
      #--------------------------------------------------------------------------
      def cursor_jump(v)
        @virtual_position = v
        bound_cursor
      end
      #--------------------------------------------------------------------------
      # * Start capture
      #--------------------------------------------------------------------------
      def start_capture
        @stopped = false
        update
      end
      #--------------------------------------------------------------------------
      # * Sop capture
      #--------------------------------------------------------------------------
      def stop_capture
        @stopped = true
      end
      #--------------------------------------------------------------------------
      # * Bound cursor position
      #--------------------------------------------------------------------------
      def bound_cursor
        @virtual_position = @virtual_position.bound(0, @value.length)
        @cursor_moved = true
        c = [nil, ''].include?(Keyboard.current_char)
        @selection_start = @virtual_position unless (Keyboard.shift && c || Mouse.dragging?)
      end
      #--------------------------------------------------------------------------
      # * go left
      #--------------------------------------------------------------------------
      def go_left
        @virtual_position -= 1
        bound_cursor
      end
      #--------------------------------------------------------------------------
      # * go Right
      #--------------------------------------------------------------------------
      def go_right
        @virtual_position += 1
        bound_cursor
      end
      #--------------------------------------------------------------------------
      # * Update key capture
      #--------------------------------------------------------------------------
      def update
        return if stopped?
        return stop_capture if @exit_keys.any?{|key| Keyboard.repeat?(key)}
        update_virtual_cursor
        update_value_modification
        update_value
        update_clipboard
      end
      #--------------------------------------------------------------------------
      # * Running
      #--------------------------------------------------------------------------
      def recording?
        !stopped?
      end
      #--------------------------------------------------------------------------
      # * Update text content
      #--------------------------------------------------------------------------
      def update_value
        return if @limit && @value.length >= @limit
        c = Keyboard.current_char
        unless [nil, ''].include?(c)
          delete(0)
          @value = @value.insert_at(@virtual_position, c)
          @transformed = true
          go_right
        end
      end
      #--------------------------------------------------------------------------
      # * Delete between
      #--------------------------------------------------------------------------
      def delete(dir=-1)
        range = [@virtual_position, @selection_start].sort
        if range[0] == range[1]
          return if @virtual_position == 0
          range[0] -= 1 if dir == -1
          range[1] += 1 if dir == 1
        end
        @value = @value.delete_between(*range)
        @virtual_position = @selection_start = range[0]
        @cursor_moved = @transformed = true
      end
      #--------------------------------------------------------------------------
      # * Update text content (bcps and del)
      #--------------------------------------------------------------------------
      def update_value_modification
        if Keyboard.krepeat?(0x08)
          delete
        end
        if Keyboard.krepeat?(0x2E)
          delete(1)
        end
      end
      #--------------------------------------------------------------------------
      # * Update cursor position
      #--------------------------------------------------------------------------
      def update_virtual_cursor
        go_left  if Keyboard.krepeat?(0x25)
        go_right if Keyboard.krepeat?(0x27)
      end
      #--------------------------------------------------------------------------
      # * Update clipboard
      #--------------------------------------------------------------------------
      def update_clipboard
        if Keyboard.ctrl?(:c)
          c = value[Range.new(*[@selection_start, @virtual_position].sort,true)]
          Clipboard.push_text(c) unless c.empty?
        end
        if Keyboard.ctrl?(:x)
          c = value[Range.new(*[@selection_start, @virtual_position].sort,true)]
          Clipboard.push_text(c) unless c.empty?
          delete(0)
        end
        if Keyboard.ctrl?(:v)
          delete(0)
          c = Clipboard.get_text
          @value = @value.insert_at(@virtual_position, c)
          @virtual_position += c.length
          @transformed = true
          bound_cursor
        end
        if Keyboard.ctrl?(:a)
          @selection_start  = 0
          @virtual_position = value.length
          @cursor_moved = true
        end
      end
    end

    #==============================================================================
    # ** TextRecorder
    #------------------------------------------------------------------------------
    #  Record text state
    #==============================================================================

    class Text_Recorder < Abstract_Recorder
      #--------------------------------------------------------------------------
      # * Object initialize
      #--------------------------------------------------------------------------
      def initialize(init = "", limit = nil , exit_keys = [])
        @transformed = true
        @stopped = true
        @exit_keys = exit_keys
        @limit = limit
        @value = init
        @value = init[0...@limit] if @limit
        @virtual_position = @selection_start = init.length
      end
    end

    #==============================================================================
    # ** Int_Recorder
    #------------------------------------------------------------------------------
    #  Record int state
    #==============================================================================

    class Int_Recorder < Abstract_Recorder
      #--------------------------------------------------------------------------
      # * Object initialize
      #--------------------------------------------------------------------------
      def initialize(init = 0, limit = nil , exit_keys = [])
        @transformed = true
        @stopped = true
        @exit_keys = exit_keys
        @limit = limit
        @value = init
        @value = init.bound(@limit.min, @limit.max) if @limit
        @value = @value.to_s
        @virtual_position = @selection_start = @value.length
      end
      #--------------------------------------------------------------------------
      # * Value accessor
      #--------------------------------------------------------------------------
      def formatted_value;
        self.value=@value
        @value.to_i
      end
      def value; @value; end
      def value=(v)
        return @value = v if v == '+' || v == '-'
        @value = v.to_i
        @value = @value.bound(@limit.min, @limit.max) if @limit
        @value = @value.to_s
        @virtual_position = @selection_start = @value.length
      end
      #--------------------------------------------------------------------------
      # * Update text content
      #--------------------------------------------------------------------------
      def update_value
        c = Keyboard.current_char
        unless [nil, ''].include?(c)
          delete(0)
          return unless (["+","-"] + ("0".."9").to_a).include?(c)
          return if @value != "" && ["+","-"].include?(c)
          self.value = @value.insert_at(@virtual_position, c)
          @transformed = true
          go_right
        end
      end
    end

    #==============================================================================
    # ** Int_Recorder
    #------------------------------------------------------------------------------
    #  Record int state
    #==============================================================================

    class Float_Recorder < Abstract_Recorder
      #--------------------------------------------------------------------------
      # * Object initialize
      #--------------------------------------------------------------------------
      def initialize(init = 0.0, limit = nil , exit_keys = [])
        @transformed = true
        @stopped = true
        @exit_keys = exit_keys
        @limit = limit
        @value = init
        @value = [[@limit.min,init].max, @limit.max].min  if @limit
        @value = @value.to_s
        @virtual_position = @selection_start = @value.length
      end
      #--------------------------------------------------------------------------
      # * Value accessor
      #--------------------------------------------------------------------------
      def formatted_value;
        self.value=@value
        @value.to_f
      end
      def value; @value; end
      def value=(v)
        return @value = v if v == '+' || v == '-' || v == '.'
        @value = v.to_s
        if @limit
          result = @value.to_f
          unless @limit.member?(result)
            @value = [[@limit.min,result].max, @limit.max].min.to_s
          end
        end
        @virtual_position = @selection_start = @value.to_s.length
      end
      #--------------------------------------------------------------------------
      # * Update text content
      #--------------------------------------------------------------------------
      def update_value
        c = Keyboard.current_char
        unless [nil, ''].include?(c)
          delete(0)
          return unless (["+","-",'.'] + ("0".."9").to_a).include?(c)
          return if @value != "" && ["+","-"].include?(c)
          return if c == "." && @value.count(".") == 1
          self.value = @value.insert_at(@virtual_position, c)
          @transformed = true
          go_right
        end
      end
    end

  end
  
  #==============================================================================
  # ** Gui::Base
  #------------------------------------------------------------------------------
  #  Basic Gui Component behaviour
  #==============================================================================

  class Base
    #--------------------------------------------------------------------------
    # * Import Stackable API
    #--------------------------------------------------------------------------
    include Generative::Stackable
    #--------------------------------------------------------------------------
    # * Public instances variables
    #--------------------------------------------------------------------------
    attr_accessor :inner, :style, :viewport, :name, :transformed
    alias_method :outer, :viewport
    [
      :in?,
      :hover?,
      :click?,
      :press?,
      :trigger?,
      :repeat?,
      :release?,
      :mouse_x,
      :mouse_y,
      :x,
      :y,
      :width,
      :height,
      :true_z
    ].each{|m| delegate :viewport, m}
    [
      :children,
      :parent,
      :legacy_rule,
      :z
    ].each{|m| delegate_accessor :viewport, m}
    #--------------------------------------------------------------------------
    # * Object initialize
    # * optionnal named args =
    #   name:     String reference for the CSS matching (like 'class' in HTML)
    #   parent:   Object reference used to stack into
    #   position: :enclosed into parent by default, can be :relative or :absolute
    #   etc: see CSS
    #--------------------------------------------------------------------------
    def initialize(args=nil)
      Interactive << self
      @viewport = Viewport.new(0,0,0,0)
      @inner = Rect.new
      @inner >> @viewport
      @name = args.delete(:name) if args && args[:name]
      set_parent(args.delete(:parent)) if args && args[:parent]
      @style = Style.new
      @style.css_match(self)
      set(args, false)
      initialize_intern_components
      compute
    end
    #--------------------------------------------------------------------------
    # * initialize_intern_components
    #--------------------------------------------------------------------------
    def initialize_intern_components
    end
    #--------------------------------------------------------------------------
    # * Set value to any named args, except :name (reserved to initialize)
    # * :parent can't be redefined twice
    #--------------------------------------------------------------------------
    def set(args, auto_compute=true)
      set_parent(args.delete(:parent)) if args && args[:parent]
      @style.set args
      self.legacy_rule = @style[:position]
      compute if auto_compute
    end
    #--------------------------------------------------------------------------
    # * Basic parameters
    #--------------------------------------------------------------------------
    def x=(v); style_set(:x, v); end
    def y=(v); style_set(:y, v); end
    def z=(v); style_set(:z, v); end
    def width=(v) ; style_set(:width,  v); end
    def height=(v); style_set(:height, v); end
    def style_set(m,v)
      if @style[m] != v
        @style[m] = v
        compute
      end
    end
    def parameters
      [self.x, self.y, self.width, self.height]
    end
    #--------------------------------------------------------------------------
    # * Push into another Object without computing
    #--------------------------------------------------------------------------
    def set_parent(pa)
      self.parent = pa
      pa.children ||= []
      pa.children << self
    end
    #--------------------------------------------------------------------------
    # * Update inner
    #--------------------------------------------------------------------------
    def update_inner
      @inner.set(0, 0, self.width, self.height)
    end
    #--------------------------------------------------------------------------
    # * Computing
    #--------------------------------------------------------------------------
    def compute
      @transformed = false
      compute_self
      if @transformed
        parent_style_auto? ? parent.compute : recompute_children
      end
    end
    #--------------------------------------------------------------------------
    # * Computes self
    #--------------------------------------------------------------------------
    def compute_self
      if (a=[convert(:x), convert(:y), convert(:width), convert(:height)]) != parameters
        @transformed = true
        viewport.set_parameters(*a)
      end
      viewport.z = @style[:z]
      viewport.compute_self
    end
    #--------------------------------------------------------------------------
    # * Conversion percent to value
    #--------------------------------------------------------------------------
    def convert(m)
      return auto(m) if @style[m] == :auto
      return @style[m] unless @style[m].percent?
      parent = self.parent || Viewport.new
      return (@style[m] * parent.inner.width  / 100.0).round if [:x, :width].include?(m)
      return (@style[m] * parent.inner.height / 100.0).round
    end
    #--------------------------------------------------------------------------
    # * Auto adjustment with children
    #--------------------------------------------------------------------------
    def auto(m)
      a = children - [self.inner, self.outer]
      return (@style[:margin_left]  + @style[:margin_right]  +
              @style[:border_left]  + @style[:border_right]  +
              @style[:padding_left] + @style[:padding_right] + 
              (a.delete_if{|c| c.respond_to?(:style) && (c = c.style[:width]) != :auto && c.percent?
                }.map{|c| c.x + c.width }.max||0)
              ) if m == :width
      return (@style[:margin_top]  + @style[:margin_bottom]  +
              @style[:border_top]  + @style[:border_bottom]  +
              @style[:padding_top] + @style[:padding_bottom] +
              (a.delete_if{|c| c.respond_to?(:style) && (c = c.style[:height]) != :auto && c.percent?
                }.map{|c| c.y + c.height}.max||0)
              ) if m == :height
    end
    def parent_style_auto?
      parent.respond_to?(:style) && [parent.style[:width], parent.style[:height]].include?(:auto)
    end
    #--------------------------------------------------------------------------
    # * Interactive behaviour
    #--------------------------------------------------------------------------
    def on_mouse_hover;   on_mouse(:hover);   end
    def on_mouse_trigger; on_mouse(:trigger); end
    def on_mouse_release; on_mouse(:release); end
    def on_mouse_click;   on_mouse(:click);   end
    def on_mouse(k)
      @style[k].call if @style[k].is_a? Proc
    end
    #--------------------------------------------------------------------------
    # * Clone
    #--------------------------------------------------------------------------
    def clone
      self.class.new(clone_properties)
    end
    #--------------------------------------------------------------------------
    # * Properties
    #--------------------------------------------------------------------------
    def clone_properties
      args = @style.values
      args[:name] = @name
      args[:parent] = self.parent
      args
    end
    #--------------------------------------------------------------------------
    # * Free
    #--------------------------------------------------------------------------
    def dispose
      return if @disposed
      @disposed = true
      Interactive.objects.delete(self)
      dispose_stack
      @viewport.dispose
    end
    attr_reader :disposed
    alias_method :disposed?, :disposed
  end

  #==============================================================================
  # ** Gui::Box
  #------------------------------------------------------------------------------
  #  Simple box
  #==============================================================================

  class Box < Base
    #--------------------------------------------------------------------------
    # * Public instances variables
    #--------------------------------------------------------------------------
    attr_accessor :background, :border, :outer
    [
      :in?,
      :hover?,
      :click?,
      :press?,
      :trigger?,
      :repeat?,
      :release?,
      :mouse_x,
      :mouse_y
    ].each{|m| delegate :outer, m}
    #--------------------------------------------------------------------------
    # * initialize_intern_components
    #--------------------------------------------------------------------------
    def initialize_intern_components
      @border = Sprite.new(@viewport)
      @border.bitmap = Bitmap.new(1,1)
      @background = Sprite.new(@viewport)
      @background.bitmap = Bitmap.new(1,1)
      @outer = Rect.new
      @outer >> @viewport
    end
    #--------------------------------------------------------------------------
    # * Computes self
    #--------------------------------------------------------------------------
    def compute_self
      super
      update_colors
      update_background
    end
    #--------------------------------------------------------------------------
    # * Update background display
    #--------------------------------------------------------------------------
    def update_background
      if @style[:background] == :none || [self.width, self.height].include?(0)
        return update_inner
      end
      r = Rect.new(0, 0, self.width, self.height)
      @style.contract_with(:margin, r)
      fit_sprite(@border, r)
      @outer.set(r)
      @style.contract_with(:border, r)
      fit_sprite(@background, r)
      @style.contract_with(:padding, r)
      @inner.set(r)
    end
    #--------------------------------------------------------------------------
    # * Fit sprite(1x1) into the rect
    #--------------------------------------------------------------------------
    def fit_sprite(s, r)
      s.x, s.y = r.x, r.y
      s.zoom_x, s.zoom_y = r.width, r.height
    end
    #--------------------------------------------------------------------------
    # * Update colors
    #--------------------------------------------------------------------------
    def update_colors
      @border.bitmap.set_pixel(0, 0, @style[:border_color])
      @background.bitmap.set_pixel(0, 0, @style[:background_color])
    end
    #--------------------------------------------------------------------------
    # * Free
    #--------------------------------------------------------------------------
    def dispose
      @border.bitmap.dispose
      @border.dispose
      @background.bitmap.dispose
      @background.dispose
      super
    end
  end

  #==============================================================================
  # ** Gui::Label
  #------------------------------------------------------------------------------
  #  Label
  #==============================================================================

  class Label < Base
    #--------------------------------------------------------------------------
    # * Public instances variables
    #--------------------------------------------------------------------------
    attr_accessor :sprite_text
    #--------------------------------------------------------------------------
    # * Object initialize
    # * optionnal named args = font:, value:, x:, y:
    #--------------------------------------------------------------------------
    def initialize_intern_components
      @sprite_text = Sprite.new(@viewport)
      initialize_text(@style[:value])
    end
    #--------------------------------------------------------------------------
    # * Initialize text
    #--------------------------------------------------------------------------
    def initialize_text(txt)
      return unless @sprite_text
      txt ||= ""
      fon = @style[:font]
      bmp = Bitmap.new(1,1)
      bmp.font = fon
      size = bmp.text_size(txt)
      @sprite_text.bitmap = Bitmap.new(size.width, size.height)
      @sprite_text.bitmap.font = fon
      @sprite_text.bitmap.draw_text(size, txt)
      @style[:width]  = size.width
      @style[:height] = size.height
    end
    #--------------------------------------------------------------------------
    # * Set value to any named args, except :name (reserved to initialize)
    # * :parent can't be redefined twice
    #--------------------------------------------------------------------------
    def set(args, auto_compute=true)
      initialize_text(args[:value]) if args && args[:value]
      super(args, auto_compute)
    end
    #--------------------------------------------------------------------------
    # * Value
    #--------------------------------------------------------------------------
    def value; @style[:value]; end
    def value=(v)
      if @style[:value] != v
        @style[:value] = v
        initialize_text(v)
        compute
      end
    end
    #--------------------------------------------------------------------------
    # * Value
    #--------------------------------------------------------------------------
    def font; @style[:font]; end
    def font=(v)
      if @style[:font] != v
        @style[:font] = v
        initialize_text(@style[:value])
        compute
      end
    end
    #--------------------------------------------------------------------------
    # * Free
    #--------------------------------------------------------------------------
    def dispose
      @sprite_text.bitmap.dispose
      @sprite_text.dispose
      super
    end
  end

  #==============================================================================
  # ** Gui::TrackBar
  #------------------------------------------------------------------------------
  #  Horizontal Trackbar
  #==============================================================================

  class TrackBar < Box
    #--------------------------------------------------------------------------
    # * Public instances variables
    #--------------------------------------------------------------------------
    attr_accessor :track, :bar
    #--------------------------------------------------------------------------
    # * Object initialize
    # * optionnal named args = max_value:, value:, x:, y:, width:
    #--------------------------------------------------------------------------
    def initialize(args=nil)
      super(args)
      @track = Box.new(name:'track', parent:self)
      @bar   = Box.new(name:'bar', parent:self)
      Draggable << @bar
      update_drag_restriction
    end
    #--------------------------------------------------------------------------
    # * Responsive computing
    #--------------------------------------------------------------------------
    def compute
      return super unless @bar
      v = value
      super
      self.value = v
      update_drag_restriction
    end
    #--------------------------------------------------------------------------
    # * Shortcuts
    #--------------------------------------------------------------------------
    def start;  @track.inner.x; end
    def course; @track.inner.width - @bar.width; end
    def max_value; @style[:max_value] || 255; end
    def value;  max_value.to_f * (@bar.x-start) / course; end
    #--------------------------------------------------------------------------
    # * Update drag restriction
    #--------------------------------------------------------------------------
    def update_drag_restriction
      @bar.drag_restriction = Rect.new(start, @bar.y, course, 0)
    end
    #--------------------------------------------------------------------------
    # * Move bar to value
    #--------------------------------------------------------------------------
    def value=(v)
      @bar.x = start + course.to_f * v.fbound(0, max_value) / max_value
    end
    #--------------------------------------------------------------------------
    # * Fit course to @max_value
    #--------------------------------------------------------------------------
    def fit_to_max
      self.width = self.width - @track.inner.width + @bar.width + max_value
    end
    #--------------------------------------------------------------------------
    # * Free
    #--------------------------------------------------------------------------
    def dispose
      Draggable.objects.delete(@bar)
      super
    end
  end

  #==============================================================================
  # ** Gui::VerticalTrackBar
  #------------------------------------------------------------------------------
  #  Vertical Trackbar
  #==============================================================================

  class VerticalTrackBar < TrackBar
    #--------------------------------------------------------------------------
    # * Shortcuts
    #--------------------------------------------------------------------------
    def start;  @track.inner.y; end
    def course; @track.inner.height - @bar.height; end
    def value;  max_value.to_f * (@bar.y-start) / course; end
    #--------------------------------------------------------------------------
    # * Move bar to value
    #--------------------------------------------------------------------------
    def value=(v)
      @bar.y = start + course.to_f * v.fbound(0, max_value) / max_value
    end
    #--------------------------------------------------------------------------
    # * Fit course to @max_value
    #--------------------------------------------------------------------------
    def fit_to_max
      self.height = self.height - @track.inner.height + @bar.height + max_value
    end
    #--------------------------------------------------------------------------
    # * Update drag restriction
    #--------------------------------------------------------------------------
    def update_drag_restriction
      @bar.drag_restriction = Rect.new(@bar.x, start, 0, course)
    end
  end
  
  #==============================================================================
  # ** Gui::ScrollBar
  #------------------------------------------------------------------------------
  #  Horizontal ScrollBar
  #==============================================================================

  class ScrollBar < TrackBar; ;end

  #==============================================================================
  # ** Gui::VerticalScrollBar
  #------------------------------------------------------------------------------
  #  Vertical ScrollBar
  #==============================================================================

  class VerticalScrollBar < VerticalTrackBar; ;end

  #==============================================================================
  # ** Gui::Pannel
  #------------------------------------------------------------------------------
  #  Pannel
  #==============================================================================
  
  class Pannel < Box
    #--------------------------------------------------------------------------
    # * Public instances variables
    #--------------------------------------------------------------------------
    attr_accessor :title_label
    #--------------------------------------------------------------------------
    # * Object initialize
    # * optionnal named args = title:, x:, y:, width:, height: + basic CSS
    #--------------------------------------------------------------------------
    def initialize(args=nil)
      super(args)
      @title_label = Label.new(
        name: 'pannel_title',
        parent: self.outer,
        value: @style[:title],
        z: self.z
        )
    end
    #--------------------------------------------------------------------------
    # * Set value to any named argument
    # * :parent can't be redefined twice
    #--------------------------------------------------------------------------
    def set(args, ac=true)
      super(args, ac)
      @title_label.value = @style[:title] if @title_label
    end
    #--------------------------------------------------------------------------
    # * Title
    #--------------------------------------------------------------------------
    def title; @style[:title]; end
    def title=(v)
      set(title: v)
    end
    #--------------------------------------------------------------------------
    # * Free
    #--------------------------------------------------------------------------
    def dispose
      @title_label.dispose
      super
    end
  end
  
  #==============================================================================
  # ** Gui::Button
  #------------------------------------------------------------------------------
  #  Button
  #==============================================================================
  
  class Button < Box
    #--------------------------------------------------------------------------
    # * Public instances variables
    #--------------------------------------------------------------------------
    attr_accessor :title_label
    #--------------------------------------------------------------------------
    # * Object initialize
    # * optionnal named args = title:, x:, y:, width:, height: + basic CSS
    #--------------------------------------------------------------------------
    def initialize_intern_components
      super
      @title_label = Label.new(
        name: 'button_title',
        parent: self,
        value: @style[:title],
        font: @style[:font]
        )
      Interactive.objects.delete(@title_label)
    end
    #--------------------------------------------------------------------------
    # * Set value to any named argument
    # * :parent can't be redefined twice
    #--------------------------------------------------------------------------
    def set(args, ac=true)
      super(args, ac)
      @title_label.value = @style[:title] if @title_label
    end
    #--------------------------------------------------------------------------
    # * Title
    #--------------------------------------------------------------------------
    def title; @style[:title]; end
    def title=(v)
      set(title: v)
    end
    #--------------------------------------------------------------------------
    # * Computing
    #--------------------------------------------------------------------------
    def compute
      super
      @title_label.set(
        x: (self.inner.width - @title_label.width)/2,
        y: (self.inner.height - @title_label.height)/2
      ) if @title_label
    end
  end

  #==============================================================================
  # ** Gui::CheckBox
  #------------------------------------------------------------------------------
  #  CheckBox
  #==============================================================================
  
  class CheckBox < Button
    #--------------------------------------------------------------------------
    # * Initialize
    #--------------------------------------------------------------------------    
    def initialize_intern_components
      @style[:title] = @style[:unchecked_label]
      super
    end
    #--------------------------------------------------------------------------
    # * Macros
    #--------------------------------------------------------------------------
    def checked? ; @style[:title] == @style[:checked_label] ; end
    def check    ; self.title = @style[:checked_label]      ; end
    def uncheck  ; self.title = @style[:unchecked_label]    ; end
    #--------------------------------------------------------------------------
    # * Mouse click
    #--------------------------------------------------------------------------
    def on_mouse_click
      super
      checked? ? uncheck : check
    end
  end

  #==============================================================================
  # ** Gui::TextField
  #------------------------------------------------------------------------------
  #  TextField
  #==============================================================================
  
  class TextField < Box
    #--------------------------------------------------------------------------
    # * Public instances variables
    #--------------------------------------------------------------------------
    attr_accessor :recorder, :textfield
    delegate :@textfield, :activate
    delegate :@textfield, :deactivate
    delegate :@textfield, :formatted_value
    #--------------------------------------------------------------------------
    # * Object initialize
    #--------------------------------------------------------------------------
    def initialize_intern_components
      super
      case @style[:format]
      when :int
        @recorder = Components::Int_Recorder.new
      when :float
        @recorder = Components::Float_Recorder.new
      else
        @recorder = Components::Text_Recorder.new
      end
      @textfield = Components::Text_Field.new(@recorder,
        0, 0, 0, @style[:font], false)
      @textfield >> self
    end
    #--------------------------------------------------------------------------
    # * Computes self
    #--------------------------------------------------------------------------
    def compute_self
      super
      @textfield.width = self.inner.width if @textfield
    end
    #--------------------------------------------------------------------------
    # * Update
    #--------------------------------------------------------------------------
    def update
      @textfield.deactivate if Key::Mouse_left.trigger? && !self.hover?
      @textfield.update
    end
    #--------------------------------------------------------------------------
    # * position of cursor in screen
    #--------------------------------------------------------------------------
    def cursor_screen_x
      @textfield.cursor.rect.x + @textfield.inner.abs_x
    end
    #--------------------------------------------------------------------------
    # * position of cursor in screen
    #--------------------------------------------------------------------------
    def cursor_screen_y
      @textfield.cursor.rect.y + @textfield.inner.abs_y
    end
    #--------------------------------------------------------------------------
    # * Mouse trigger
    #--------------------------------------------------------------------------
    def on_mouse_trigger
      @textfield.activate
      @textfield.locate
    end
    #--------------------------------------------------------------------------
    # * set value
    #--------------------------------------------------------------------------
    def value=(d)
      recorder.value = d 
      @textfield.refresh
      recorder.cursor_jump(@textfield.formatted_value.length)
    end
  end
  
end

#==============================================================================
# ** Module
#------------------------------------------------------------------------------
#  Link CSS
#==============================================================================

class Module
  include Gui::CSS
  extend Gui::CSS
end

#==============================================================================
# ** CSS
#------------------------------------------------------------------------------
#  Telling what the things looks like
#==============================================================================

module CSS

  fon = Font.new(Font.default_name, 16)
  fon.color = Color.new('#FFFFFF')
  fon.bold = true
  fon.outline = false

  #--------------------------------------------------------------------------
  # * TextField
  #--------------------------------------------------------------------------
  set 'Gui::TextField',
    width: 100.percent,
    padding: 3
  
  #--------------------------------------------------------------------------
  # * Pannel
  #--------------------------------------------------------------------------
  set 'Gui::Pannel',
    title: "title",
    width: 100.percent,
    height: 100.percent,
    border: [20, 2, 2, 2],
    border_color: Color.new('#113F59')
  
  set 'Gui::Label.pannel_title',
    font: fon,
    x: 5,
    y: 2
  
  #--------------------------------------------------------------------------
  # * Button
  #--------------------------------------------------------------------------
  set 'Gui::Button',
    background_color: Color.new('#D54F58'),
    title: "title",
    padding: [3, 6],
    border: 0,
    font: fon,
    border: 0
  
  #--------------------------------------------------------------------------
  # * CheckBox
  #--------------------------------------------------------------------------
  set 'Gui::CheckBox',
    padding: [0,4]
  
  #--------------------------------------------------------------------------
  # * TrackBar & ScrollBar
  #--------------------------------------------------------------------------
  set 'Gui::TrackBar','Gui::VerticalTrackBar',
    'Gui::ScrollBar','Gui::VerticalScrollBar',
    background: :none,
    padding: 0,
    border: 0

  set '.track',
    background_color: get_color('gray'),
    padding: 0
    
  set '.bar',
    background_color: get_color('white'),
    border_color: get_color('gray')
    
  #--------------------------------------------------------------------------
  # * Horizontal TrackBar
  #--------------------------------------------------------------------------
  set 'Gui::TrackBar','Gui::VerticalTrackBar',
    width:  100.percent,
    height: 12
    
  set 'Gui::TrackBar .track',
    width:  100.percent,
    height: 50.percent,
    y: 25.percent

  set 'Gui::TrackBar .bar',
    width:  8,
    height: 100.percent
    
  #--------------------------------------------------------------------------
  # * Vertical TrackBar
  #--------------------------------------------------------------------------
  set 'Gui::VerticalTrackBar',
    height: 100.percent,
    width:  12

  set 'Gui::VerticalTrackBar .track',
    width:  50.percent,
    height: 100.percent,
    x: 25.percent
    
  set 'Gui::VerticalTrackBar .bar',
    width: 100.percent,
    height: 8

  #--------------------------------------------------------------------------
  # * Horizontal Scrollbar
  #--------------------------------------------------------------------------
  set 'Gui::ScrollBar',
    width:  100.percent,
    height: 8

  set 'Gui::ScrollBar .track',
    width:  100.percent,
    height: 100.percent

  set 'Gui::ScrollBar .bar',
    width:  20,
    height: 100.percent

  #--------------------------------------------------------------------------
  # * Vertical Scrollbar
  #--------------------------------------------------------------------------
  set 'Gui::VerticalScrollBar',
    width:  8,
    height: 100.percent

  set 'Gui::VerticalScrollBar .track',
    width:  100.percent,
    height: 100.percent
    
  set 'Gui::VerticalScrollBar .bar',
    width:  100.percent,
    height: 20
  
end

end

# -*- coding: utf-8 -*-
#==============================================================================
# ** RME Evex
#------------------------------------------------------------------------------
#  With :
# Grim (original project)
# Nuki
# Raho
#  Help :
# Fabien
# Zeus81
# Joke
# Zangther
#------------------------------------------------------------------------------
# An RPGMaker's Event extension
#==============================================================================

#==============================================================================
# ** Cache
#------------------------------------------------------------------------------
#  This module loads graphics, creates bitmap objects, and retains them.
# To speed up load times and conserve memory, this module holds the
# created bitmap object in the internal hash, allowing the program to
# return preexisting objects when the same bitmap is requested again.
#==============================================================================

module Cache
  def self.map(map_id)
    return $game_map.map if $game_map && $game_map.map_id == map_id
    if !Game_Temp.cached_map || Game_Temp.cached_map[0] != map_id
      Game_Temp.cached_map =
        [map_id, load_data(sprintf("Data/Map%03d.rvdata2", map_id))]
    end
    return Game_Temp.cached_map[1]
  end
end


#==============================================================================
# ** L
#------------------------------------------------------------------------------
#  Label handling API
#==============================================================================

module L
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  extend self
  #--------------------------------------------------------------------------
  # * Returns a Game Label
  #--------------------------------------------------------------------------
  def [](key)
    return 0 if $game_labels[key].nil?
    $game_labels[key]
  end

  #--------------------------------------------------------------------------
  # * Modifies a Game Label
  #--------------------------------------------------------------------------
  def []=(key, value)
    $game_labels[key] = value
  end
end

#==============================================================================
# ** Game_Variables
#------------------------------------------------------------------------------
#  This class handles variables. It's a wrapper for the built-in class "Array."
# The instance of this class is referenced by $game_variables.
#==============================================================================

class Game_Variables
  #--------------------------------------------------------------------------
  # * Get Variable
  #--------------------------------------------------------------------------
  def [](variable_id)
    # Hack for retreive false values
    return 0 if @data[variable_id].nil?
    @data[variable_id]
  end
end


#==============================================================================
# ** V (special thanks to Nuki)
#------------------------------------------------------------------------------
#  Variable handling API
#==============================================================================

module V
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  extend self
  #--------------------------------------------------------------------------
  # * Returns a Game Variable
  #--------------------------------------------------------------------------
  def [](key)
    $game_variables[key]
  end

  #--------------------------------------------------------------------------
  # * Modifies a variable
  #--------------------------------------------------------------------------
  def []=(key, value)
    if key.is_a?(Range)
      key.each do |k|
        $game_variables[k] = value
      end
    else
      $game_variables[key] = value
    end
  end
end

#==============================================================================
# ** S (special thanks to Nuki)
#------------------------------------------------------------------------------
# Switch handling API
#==============================================================================

module S
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  extend self
  #--------------------------------------------------------------------------
  # * Returns a Game Switch
  #--------------------------------------------------------------------------
  def [](key)
    $game_switches[key] || false
  end
  #--------------------------------------------------------------------------
  # * Modifies a Game Switch
  #--------------------------------------------------------------------------
  def []=(key, value)
    if key.is_a?(Range)
      key.each do |k|
        $game_switches[k] = value.to_bool
      end
    else
      $game_switches[key] = value.to_bool
    end
  end
end

#==============================================================================
# ** SV (special thanks to Zeus81)
#------------------------------------------------------------------------------
#  self Variable handling API
#==============================================================================

module SV
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  extend self
  #--------------------------------------------------------------------------
  # * Returns a self Variable
  #--------------------------------------------------------------------------
  def [](*args, id)
    ev_id = args[-1] || Game_Interpreter.current_id
    map_id = args[-2] || Game_Interpreter.current_map_id
    $game_self_vars.fetch([map_id, ev_id, id], 0)
  end
  #--------------------------------------------------------------------------
  # * Modifies a self variable
  #--------------------------------------------------------------------------
  def []=(*args, id, value)
    ev_id = args[-1] || Game_Interpreter.current_id
    map_id = args[-2] || Game_Interpreter.current_map_id
    $game_self_vars[[map_id, ev_id, id]] = value
    $game_map.need_refresh = true
  end
end

#==============================================================================
# ** SL
#------------------------------------------------------------------------------
#  self Labels handling API
#==============================================================================

module SL
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  extend self
  #--------------------------------------------------------------------------
  # * Returns a self Variable
  #--------------------------------------------------------------------------
  def [](*args, id)
    ev_id = args[-1] || Game_Interpreter.current_id
    map_id = args[-2] || Game_Interpreter.current_map_id
    $game_self_labels.fetch([map_id, ev_id, id], 0)
  end
  #--------------------------------------------------------------------------
  # * Modifies a self variable
  #--------------------------------------------------------------------------
  def []=(*args, id, value)
    ev_id = args[-1] || Game_Interpreter.current_id
    map_id = args[-2] || Game_Interpreter.current_map_id
    $game_self_labels[[map_id, ev_id, id]] = value
    $game_map.need_refresh = true
  end
end

#==============================================================================
# ** SS (special thanks to Zeus81)
#------------------------------------------------------------------------------
#  Self Switches handling API
#==============================================================================

module SS
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  extend self
  #--------------------------------------------------------------------------
  # * map key
  #--------------------------------------------------------------------------
  def map_id_s(id)
    auth = ("A".."Z").to_a
    return id if auth.include?(id)
    return auth[id-1] if id.to_i.between?(1, 26)
    return "A"
  end
  private :map_id_s
  #--------------------------------------------------------------------------
  # * Returns a self switch
  #--------------------------------------------------------------------------
  def [](*args, id)
    ev_id = args[-1] || Game_Interpreter.current_id
    map_id = args[-2] || Game_Interpreter.current_map_id
    key = [map_id, ev_id, map_id_s(id)]
    $game_self_switches[key]
  end
  #--------------------------------------------------------------------------
  # * Modifies a self switch
  #--------------------------------------------------------------------------
  def []=(*args, id, value)
    ev_id = args[-1] || Game_Interpreter.current_id
    map_id = args[-2] || Game_Interpreter.current_map_id
    key = [map_id, ev_id, map_id_s(id)]
    $game_self_switches[key] = value.to_bool
    $game_map.need_refresh = true
  end
end

#==============================================================================
# ** RPG::CommonEvent
#------------------------------------------------------------------------------
#  The data class for common events.
#==============================================================================

class RPG::CommonEvent
  #--------------------------------------------------------------------------
  # * Define battle trigger
  #--------------------------------------------------------------------------
  def def_battle_trigger
    return false if !@list[0] || @list[0].code != 355
    script = @list[0].parameters[0] + "\n"
    index = 1
    while @list[index].code == 655
      script += @list[index].parameters[0] + "\n"
      index += 1
    end
    if script =~ /^\s*(in_battle)/
      potential_trigger = eval(script)
      return potential_trigger if potential_trigger.is_a?(Proc)
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * get battle trigger
  #--------------------------------------------------------------------------
  def battle_trigger
    @battle_trigger ||= def_battle_trigger
  end
  #--------------------------------------------------------------------------
  # * Is for battle
  #--------------------------------------------------------------------------
  def for_battle?
    !!battle_trigger
  end
end

#==============================================================================
# ** Game_Temp
#------------------------------------------------------------------------------
#  This class handles temporary data that is not included with save data.
# The instance of this class is referenced by $game_temp.
#==============================================================================

class Game_Temp
  class << self
    attr_accessor :in_battle
    attr_accessor :current_troop
    attr_accessor :cached_map
    Game_Temp.in_battle = false
    Game_Temp.current_troop = 0
  end
end


#==============================================================================
# ** BattleManager
#------------------------------------------------------------------------------
#  This module manages battle progress.
#==============================================================================

module BattleManager
  class << self
    alias_method :extender_setup, :setup
    alias_method :extender_end, :battle_end
    #--------------------------------------------------------------------------
    # * Setup
    #--------------------------------------------------------------------------
    def setup(*a)
      Game_Temp.in_battle = true
      Game_Temp.current_troop = a[0]
      extender_setup(*a)
    end
    #--------------------------------------------------------------------------
    # * End Battle
    #     result : Result (0: Win 1: Escape 2: Lose)
    #--------------------------------------------------------------------------
    def battle_end(result)
      Game_Temp.in_battle = false
      Game_Temp.current_troop = -1
      extender_end(result)
    end
  end
end

#==============================================================================
# ** Game_CommonEvent
#------------------------------------------------------------------------------
#  This class handles common events. It includes functionality for execution of
# parallel process events. It's used within the Game_Map class ($game_map).
#==============================================================================

class Game_CommonEvent
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :extender_active?, :active?
  #--------------------------------------------------------------------------
  # * Determine if Active State
  #--------------------------------------------------------------------------
  def active?
    return extender_active? if not in_battle?
    @event.for_battle? && @event.battle_trigger.call()
  end
end

#==============================================================================
# ** Game_Troop
#------------------------------------------------------------------------------
#  This class handles enemy groups and battle-related data. Also performs
# battle events. The instance of this class is referenced by $game_troop.
#==============================================================================

class Game_Troop
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :extender_setup, :setup
  alias_method :extender_update, :update
  #--------------------------------------------------------------------------
  # * Setup
  #--------------------------------------------------------------------------
  def setup(troop_id)
    extender_setup(troop_id)
    init_common_events
  end
  #--------------------------------------------------------------------------
  # * Initialize common events
  #--------------------------------------------------------------------------
  def init_common_events
    events = $data_common_events.select {|event| event && event.for_battle? }
    @common_events = events.map {|e| Game_CommonEvent.new(e.id)}
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    extender_update
    event_update
  end
  #--------------------------------------------------------------------------
  # * Event Update
  #--------------------------------------------------------------------------
  def event_update
    @common_events.each {|e| e.update}
  end
end


#==============================================================================
# ** Kernel
#------------------------------------------------------------------------------
#  Object class methods are defined in this module.
#  This ensures compatibility with top-level method redefinition.
#==============================================================================

module Kernel
  #--------------------------------------------------------------------------
  # * Define an onload behaviour
  #--------------------------------------------------------------------------
  def map_onload(*ids, &block)
    Game_Map.onload(ids, &block)
  end
  #--------------------------------------------------------------------------
  # * Define an onRunning behaviour
  #--------------------------------------------------------------------------
  def map_onprogress(*ids, &block)
    Game_Map.onprogress(ids, &block)
  end

  #--------------------------------------------------------------------------
  # * Define custom Trigger
  #--------------------------------------------------------------------------
  def trigger(&block)
    block
  end

  def store_action(key, t, &a)
    Handler.store(key, t, a)
  end

  alias_method :listener, :trigger
  alias_method :action, :trigger
  alias_method :ignore_left, :trigger
  #--------------------------------------------------------------------------
  # * Trigger true
  #--------------------------------------------------------------------------
  def always_run
    true
  end
  #--------------------------------------------------------------------------
  # * Trigger in battle
  #--------------------------------------------------------------------------
  def in_battle(&block)
    return lambda{|*id| true} unless block_given?
    block
  end
  #--------------------------------------------------------------------------
  # * Current battle troop
  #--------------------------------------------------------------------------
  def current_troop; Game_Temp.current_troop; end
  #--------------------------------------------------------------------------
  # * check if in battle
  #--------------------------------------------------------------------------
  def in_battle?
    Game_Temp.in_battle
  end
  #--------------------------------------------------------------------------
  # * Cast Events args
  #--------------------------------------------------------------------------
  def select_events(e)
    return [e] if e.is_a?(Fixnum)
    return [e] if e.is_a?(Array) && e[0] == :follower && e.length == 2
    e
  end
  alias_method :select_pictures, :select_events
  #--------------------------------------------------------------------------
  # * All selector
  #--------------------------------------------------------------------------
  def all_events
    events(:all_events)
  end
  #--------------------------------------------------------------------------
  # * Selectors
  #--------------------------------------------------------------------------
  def all_pictures
    a = $game_map.screen.pictures.to_a.select{|pict| !pict.name.empty?}
    a.map {|i| i.number}
  end
  def get_pictures(*ids, &block)
    return [] unless SceneManager.scene.is_a?(Scene_Map)
    if ids.length == 1 && ids[0] == :all_pictures
      return all_pictures
    end
    result = []
    ids.each { |id| result << id if all_pictures.include?(id) }
    result += all_pictures.select(&block) if block_given?
    result
  end
  def events(*ids, &block)
    return [] unless SceneManager.scene.is_a?(Scene_Map)
    if ids.length == 1 && ids[0] == :all_events
      return $game_map.each_events
    end
    result = []
    ids.each{|id| result << id if $game_map.each_events[id]}
    result += $game_map.each_events.select(&block) if block_given?
    result
  end

  alias :e :events
  alias :get_events :events

  def once_event(&block)
    $game_map.each_events.find(&block)
  end
  def once_random_event(&block)
    $game_map.each_events.dup.shuffle.find(&block)
  end
end

#==============================================================================
# ** Module
#------------------------------------------------------------------------------
#  A Module is a collection of methods and constants.
#  The methods in a module may be instance methods or module methods.
#==============================================================================

class Module
  #--------------------------------------------------------------------------
  # * Add Commands to Command Collection
  #--------------------------------------------------------------------------
  def append_commands
    Command.send(:extend, self)
    Game_Interpreter.send(:include, self)
  end
  #--------------------------------------------------------------------------
  # * Public Command Interface
  #--------------------------------------------------------------------------
  def include_commands
    include Generative::CommandAPI
    include Command
  end
end


#==============================================================================
# ** Window movement
#------------------------------------------------------------------------------
#  Window handler
#==============================================================================

module Window_Movement

  #--------------------------------------------------------------------------
  # * Public instance variable
  #--------------------------------------------------------------------------
  attr_accessor :target_opacity, :target_x, :target_y, :target_tone
  attr_accessor :target_width, :target_height, :opacity_duration
  attr_accessor :pos_duration, :size_duration, :tone_duration

  #--------------------------------------------------------------------------
  # * Init public member
  #--------------------------------------------------------------------------
  def init_target
    @target_opacity = self.opacity
    @target_x = self.x
    @target_y = self.y
    @target_tone = self.tone
    @target_width = self.width
    @target_height = self.height
    @opacity_duration = @pos_duration = 0
    @size_duration = @tone_duration = 0
  end

  #--------------------------------------------------------------------------
  # * module update
  #--------------------------------------------------------------------------
  def mod_update
    mod_update_opacity
    mod_update_pos
    mod_update_size
    mod_update_tone
  end

  def move_position(x, y, duration)
    @target_x = x
    @target_y = y
    @pos_duration = duration
  end

  def move_opacity(op, duration)
    @target_opacity = op
    @opacity_duration = duration
  end

  def move_size(w, h, duration)
    @target_width = w
    @target_height = h
    @size_duration = duration
  end

  def move_tone(t, duration)
    @target_tone = t
    @tone_duration = duration
  end

  def extra_move(x, y, w, h, op, duration, tone = nil)
    move_position(x, y, duration)
    move_opacity(op, duration)
    move_size(w, h, duration)
    move_tone(tone, duration) if tone
  end

  #--------------------------------------------------------------------------
  # * Update opacity
  #--------------------------------------------------------------------------
  def mod_update_opacity
    return if @opacity_duration <= 0
    d = @opacity_duration
    self.opacity = (self.opacity * (d - 1) + @target_opacity) / d
    self.contents_opacity = self.opacity
    @opacity_duration -= 1
  end

  #--------------------------------------------------------------------------
  # * Update position
  #--------------------------------------------------------------------------
  def mod_update_pos
    return if @pos_duration <= 0
    d = @pos_duration
    self.x = (self.x * (d - 1) + @target_x) / d
    self.y = (self.y * (d - 1) + @target_y) / d
    @pos_duration -= 1
  end

  #--------------------------------------------------------------------------
  # * Update Size
  #--------------------------------------------------------------------------
  def mod_update_size
    return if @size_duration <= 0
    d = @size_duration
    self.width  = (self.width   * (d - 1) + @target_width)  / d
    self.height = (self.height  * (d - 1) + @target_height)  / d
    @size_duration -= 1
  end

  #--------------------------------------------------------------------------
  # * Update Tone
  #--------------------------------------------------------------------------
  def mod_update_tone
    return if @tone_duration <= 0
    d = @tone_duration
    self.tone.red   = (self.tone.red   * (d - 1) + @target_tone.red)   / d
    self.tone.green = (self.tone.green * (d - 1) + @target_tone.green) / d
    self.tone.blue  = (self.tone.blue  * (d - 1) + @target_tone.blue)  / d
    self.tone.gray  = (self.tone.gray  * (d - 1) + @target_tone.gray)  / d
    @tone_duration -= 1
  end


end

#==============================================================================
# ** Area
#------------------------------------------------------------------------------
#  Area definition
#==============================================================================

module Area

  #==============================================================================
  # ** Common
  #------------------------------------------------------------------------------
  # Defining Common Area
  #==============================================================================

  class Common

    def hover?;         in?(Mouse.x, Mouse.y);                end
    def square_hover?;  in?(Mouse.square_x, Mouse.square_y);  end
    def click?;         hover? && Mouse.click?;               end
    def square_click?;  square_hover? && Mouse.click?;        end

    [:trigger?, :press?, :release?, :repeat?].each do |m|

      define_method(m) do |*k|
        k = k[0] || :mouse_left
        hover? && Mouse.send(m, k)
      end

      define_method("square_#{m}") do |*k|
        k = k[0] || :mouse_left
        square_hover? && Mouse.send("square_#{m}", k)
      end

    end

  end

  #==============================================================================
  # ** Rect
  #------------------------------------------------------------------------------
  # Defining rectangular areas
  #==============================================================================

  class Rect < Common
    #--------------------------------------------------------------------------
    # * Constructor
    #--------------------------------------------------------------------------
    def initialize(x, y, w, h)
      @sprite = nil
      @color = Color.new(Kernel.rand(255), Kernel.rand(255),Kernel.rand(255), 200)
      set(x, y, w, h)
    end
    #--------------------------------------------------------------------------
    # * Set values
    #--------------------------------------------------------------------------
    def set(x, y, w, h)
      @x, @y = x, y
      @width, @height = w, h
    end
    #--------------------------------------------------------------------------
    # * Check if point 's included in the area
    #--------------------------------------------------------------------------
    def in?(x, y)
      check_x = x.between?(@x, @x+@width)
      check_y = y.between?(@y, @y+@height)
      check_x && check_y
    end
    #--------------------------------------------------------------------------
    # * Render area
    #--------------------------------------------------------------------------
    def render
      if @sprite && @sprite.disposed?
        @sprite.dispose
      end
      @sprite = Sprite.new
      @sprite.bitmap = Bitmap.new(@width, @height)
      @sprite.x = @x
      @sprite.y = @y
      @sprite.bitmap.fill_rect(0, 0, @width, @height, @color)
    end
    def hide
      return unless @sprite || @sprite.disposed?
      @sprite.dispose
    end
  end

  #==============================================================================
  # ** Circle
  #------------------------------------------------------------------------------
  # Defining circular areas
  #==============================================================================

  class Circle < Common
    #--------------------------------------------------------------------------
    # * Constructor
    #--------------------------------------------------------------------------
    def initialize(x, y, r)
      set(x, y, r)
    end
    #--------------------------------------------------------------------------
    # * Edits the coordinates
    #--------------------------------------------------------------------------
    def set(x, y, r)
      @x, @y, @r = x, y, r
    end
    #--------------------------------------------------------------------------
    # * check if point 's include in the rect
    #--------------------------------------------------------------------------
    def in?(x, y)
      ((x-@x)**2) + ((y-@y)**2) <= (@r**2)
    end
  end

  #==============================================================================
  # ** Polygon
  #------------------------------------------------------------------------------
  # Defining polygonal areas
  #==============================================================================

  class Polygon < Common
    #--------------------------------------------------------------------------
    # * Constructor
    #--------------------------------------------------------------------------
    def initialize(points)
      set(points)
    end
    #--------------------------------------------------------------------------
    # * Edits the coordinates
    #--------------------------------------------------------------------------
    def set(points)
      @points = points
      @max = points.flatten.max
    end
    #--------------------------------------------------------------------------
    # * Finds the segment intersection function
    #--------------------------------------------------------------------------
    def intersectsegment(ax, ay, bx, by, ix, iy, px, py)
      dx, dy = bx - ax, by - ay
      ex, ey = px - ix, py - iy
      denominator = (dx*ey) - (dy*ex)
      return 0 if denominator == 0
      t = (ix*ey + ex*ay - ax*ey - ex*iy) / denominator
      return 0 if t < 0 || t >= 1
      u = (dx*ay - dx*iy - dy*ax + dy*ix) / denominator
      return 0 if u < 0 || u >= 1
      return 1
    end
    #--------------------------------------------------------------------------
    # * check if point 's include in the rect
    #--------------------------------------------------------------------------
    def in?(px, py)
      ix, iy = @max+100, @max+100
      nbintersections = 0
      @points.each_index do |index|
        ax, ay = *@points[index]
        bx, by = *@points[(index + 1) % @points.length]
        nbintersections += intersectsegment(ax, ay, bx, by, ix, iy, px, py)
      end
      return (nbintersections%2 == 1)
    end
  end

  #==============================================================================
  # ** Ellipse
  #------------------------------------------------------------------------------
  # Defining elliptic areas
  #==============================================================================

  class Ellipse < Common
    #--------------------------------------------------------------------------
    # * Constructor
    #--------------------------------------------------------------------------
    def initialize(x, y, width, height)
      set(x, y, width, height)
    end
    #--------------------------------------------------------------------------
    # * Edits the coordinates
    #--------------------------------------------------------------------------
    def set(x, y, width, height)
      @x, @y, @width, @height = x, y, width, height
    end
    #--------------------------------------------------------------------------
    # * check if point 's include in the rect
    #--------------------------------------------------------------------------
    def in?(x, y)
      w = ((x.to_f-@x.to_f)**2.0)/(@width.to_f/2.0)
      h = ((y.to_f-@y.to_f)**2.0)/(@height.to_f/2.0)
      w + h <= 1
    end
  end

end

#==============================================================================
# ** Handler
#------------------------------------------------------------------------------
#  Custom Event Handler
#==============================================================================

module Handler
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    #--------------------------------------------------------------------------
    # * Public instance variable
    #--------------------------------------------------------------------------
    attr_accessor :triggers
    Handler.triggers = {}
    #--------------------------------------------------------------------------
    # * Store a trigger
    #--------------------------------------------------------------------------
    def store(key, t, a)
      tri = Proc.new {|i| $game_map.interpreter.instance_exec i, &t}
      act = Proc.new {|i| $game_map.interpreter.instance_exec i, &a}
      Handler.triggers[key.to_sym] = Struct.new(:trigger, :action).new(tri, act)
    end
  end
  #--------------------------------------------------------------------------
  # * Event behaviour
  #--------------------------------------------------------------------------
  module Behaviour
    #--------------------------------------------------------------------------
    # * Setup Event Handler
    #--------------------------------------------------------------------------
    def setup_eHandler
      @table_triggers = {}
    end
    #--------------------------------------------------------------------------
    # * Unbinding process
    #--------------------------------------------------------------------------
    def unbind(key = nil)
      unless key
        setup_eHandler
        return
      end
      @table_triggers.keys.each {|k| @table_triggers[k] = 0}
    end
    #--------------------------------------------------------------------------
    # * Binding event
    #--------------------------------------------------------------------------
    def bind(key, n = -1)
      @table_triggers[key.to_sym] = n
    end
    #--------------------------------------------------------------------------
    # * Update events
    #--------------------------------------------------------------------------
    def update_eHandler
      @table_triggers.keys.each do |k|
        if @table_triggers[k] != 0
          return unless Handler.triggers[k]
          oth_id = @id
          b = Handler.triggers[k].trigger
          if $game_map.interpreter.instance_exec(oth_id, &b)
            a = Proc.new{Handler.triggers[k].action.(oth_id)}
            $game_map.interpreter.instance_eval(&a)
            @table_triggers[k] -= 1 if @table_triggers[k] > 0
          end
        end
      end
    end
    #--------------------------------------------------------------------------
    # * Get according sprite
    #--------------------------------------------------------------------------
    def k_sprite
      return nil unless SceneManager.scene.is_a?(Scene_Map)
      return nil unless SceneManager.scene.spriteset
      return nil unless @sprite_index
      SceneManager.scene.spriteset.character_sprites[@sprite_index]
    end
    #--------------------------------------------------------------------------
    # * Hover
    #--------------------------------------------------------------------------
    def hover?(pr = false)
      return false unless k_sprite
      k_sprite.hover?(pr)
    end
    #--------------------------------------------------------------------------
    # * Click
    #--------------------------------------------------------------------------
    def click?(pr = false)
      return false unless k_sprite
      k_sprite.click?(pr)
    end
    #--------------------------------------------------------------------------
    # * Press
    #--------------------------------------------------------------------------
    def press?(key = :mouse_left, pr = false)
      return false unless k_sprite
      k_sprite.press?(key, pr)
    end
    #--------------------------------------------------------------------------
    # * Trigger
    #--------------------------------------------------------------------------
    def trigger?(key = :mouse_left, pr = false)
      return false unless k_sprite
      k_sprite.trigger?(key, pr)
    end
    #--------------------------------------------------------------------------
    # * Repeat
    #--------------------------------------------------------------------------
    def repeat?(key = :mouse_left, pr = false)
      return false unless k_sprite
      k_sprite.repeat?(key, pr)
    end
    #--------------------------------------------------------------------------
    # * Release
    #--------------------------------------------------------------------------
    def release?(key = :mouse_left, pr = false)
      return false unless k_sprite
      k_sprite.release?(key, pr)
    end
  end
  #==============================================================================
  # ** API
  #------------------------------------------------------------------------------
  #  Command handling
  #==============================================================================
  module API
    #--------------------------------------------------------------------------
    # * Event
    #--------------------------------------------------------------------------
    def event(i)
      return $game_player if i == 0
      return $game_map.events[i] if $game_map.events[i]
      raise sprintf("Event %d doesn't exist", i)
    end
    #--------------------------------------------------------------------------
    # * Binding
    #--------------------------------------------------------------------------
    def bind(e, k, n= -1)
      e = select_events(e)
      e.each{|i|event(i).bind(k, n)}
    end
    #--------------------------------------------------------------------------
    # * UnBinding
    #--------------------------------------------------------------------------
    def unbind(e, k=nil)
      e = select_events(e)
      e.each{|i|event(i).unbind(k)}
    end
    #--------------------------------------------------------------------------
    # * Mouse Hover Event
    #--------------------------------------------------------------------------
    def mouse_hover_event?(e, pr = false)
      e = select_events(e)
      e.any?{|i|event(i).hover?(pr)}
    end
    #--------------------------------------------------------------------------
    # * clicked event
    #--------------------------------------------------------------------------
    def mouse_click_event?(e, pr = false)
      e = select_events(e)
      e.any?{|i|event(i).click?(pr)}
    end
    #--------------------------------------------------------------------------
    # * Pressed event
    #--------------------------------------------------------------------------
    def mouse_press_event?(e, k=:mouse_left, pr = false)
      e = select_events(e)
      e.any?{|i|event(i).press?(k, pr)}
    end
    #--------------------------------------------------------------------------
    # * Triggered event
    #--------------------------------------------------------------------------
    def mouse_trigger_event?(e, k=:mouse_left, pr = false)
      e = select_events(e)
      e.any?{|i|event(i).trigger?(k, pr)}
    end
    #--------------------------------------------------------------------------
    # * Repeated event
    #--------------------------------------------------------------------------
    def mouse_repeat_event?(e, k=:mouse_left, pr = false)
      e = select_events(e)
      e.any?{|i|event(i).repeat?(k, pr)}
    end
    #--------------------------------------------------------------------------
    # * Released event
    #--------------------------------------------------------------------------
    def mouse_release_event?(e, k=:mouse_left, pr = false)
      e = select_events(e)
      e.any?{|i|event(i).release?(k, pr)}
    end
    #--------------------------------------------------------------------------
    # * API for player
    #--------------------------------------------------------------------------
    [:hover, :click].each do |m|
      define_method("mouse_#{m}_player?"){ |*k|
        k = (k[0]) ? k[0] : false
        $game_player.send("#{m}?", k)
      }
    end
    [:press, :trigger, :repeat, :release].each do |m|
      define_method("mouse_#{m}_player?") do |*k|
        k = (k[0]) ? k[0] : :mouse_left
        r = (k[1]) ? k[1] : false
        $game_player.send("#{m}?", k, r)
      end
    end

    # EE4 compatibilities
    alias_method :mouse_clicked_event?, :mouse_click_event?
    alias_method :mouse_clicked_player?, :mouse_click_player?

    #--------------------------------------------------------------------------
    # * Load Commands
    #--------------------------------------------------------------------------
    append_commands
  end
end

#==============================================================================
# ** Game_Text
#------------------------------------------------------------------------------
#  Dynamic text representation
#==============================================================================

class Game_Text
  #--------------------------------------------------------------------------
  # * Public instance variable
  #--------------------------------------------------------------------------
  attr_reader :number
  attr_accessor :origin
  attr_accessor :x, :y
  attr_accessor :zoom_x, :zoom_y
  attr_accessor :opacity
  attr_accessor :angle
  attr_reader :blend_type
  attr_accessor :text_value
  attr_reader :profile
  attr_accessor :target_y, :target_x
  attr_accessor :target_zoom_x, :target_zoom_y
  attr_accessor :target_opacity
  attr_accessor :duration
  attr_accessor :opacity_duration
  #--------------------------------------------------------------------------
  # * Constructor
  #--------------------------------------------------------------------------
  def initialize(index)
    @moving = false
    @profile = nil
    @number = index
    init_basic
    init_target
    init_rotate
  end
  #--------------------------------------------------------------------------
  # * Set profile
  #--------------------------------------------------------------------------
  def profile=(p)
    @profile = get_profile(p)
  end
  #--------------------------------------------------------------------------
  # * Init basic values
  #--------------------------------------------------------------------------
  def init_basic
    @text_value = ""
    @origin = @x = @y = 0
    @zoom_x = @zoom_y = 100.0
    @opacity = 255.0
    @blend_type = 1
  end
  #--------------------------------------------------------------------------
  # * Init movement
  #--------------------------------------------------------------------------
  def init_target
    @target_x = @x
    @target_y = @y
    @target_zoom_x = @zoom_x
    @target_zoom_y = @zoom_y
    @target_opacity = @opacity
    @duration = @opacity_duration = 0
  end
  #--------------------------------------------------------------------------
  # * Init rotate
  #--------------------------------------------------------------------------
  def init_rotate
    @angle = 0
    @rotate_speed = 0
  end
  #--------------------------------------------------------------------------
  # * Display
  #--------------------------------------------------------------------------
  def show(text_value, profile, x, y, z_x = 100, z_y = 100, op = 255, bt = 0, ori = 0)
    @profile = get_profile(profile)
    @text_value = text_value.to_s
    @origin = ori
    @x = x.to_f
    @y = y.to_f
    @zoom_x = z_x.to_f
    @zoom_y = z_y.to_f
    @opacity = op.to_f
    @blend_type = bt
    init_target
    init_rotate
  end
  #--------------------------------------------------------------------------
  # * Move
  #--------------------------------------------------------------------------
  def move(duration, x = -1, y = -1, zoom_x = -1, zoom_y = -1, opacity = -1, blend_type = -1, origin = -1)
    @origin = origin unless origin == -1
    @target_x = x.to_f unless x == -1
    @target_y = y.to_f unless y == -1
    @target_zoom_x = zoom_x.to_f unless zoom_x == -1
    @target_zoom_y = zoom_y.to_f unless zoom_y == -1
    @target_opacity = opacity.to_f unless opacity == -1
    @blend_type = blend_type unless blend_type == -1
    @duration = duration
    @opacity_duration = duration
  end
  #--------------------------------------------------------------------------
  # * Change rotate
  #--------------------------------------------------------------------------
  def rotate(speed)
    @rotate_speed = speed
  end
  #--------------------------------------------------------------------------
  # * Erase text
  #--------------------------------------------------------------------------
  def erase
    @text_value = ""
    @profile = nil
    @origin = 0
  end
  #--------------------------------------------------------------------------
  # * Update frame
  #--------------------------------------------------------------------------
  def update
    change = [@x, @y, @zoom_x, @zoom_y, @angle]
    update_move
    update_opacity
    update_rotate
    @moving = (change != [@x, @y, @zoom_x, @zoom_y, @angle])
  end
  #--------------------------------------------------------------------------
  # * Update movement
  #--------------------------------------------------------------------------
  def update_move
    return if @duration == 0
    d = @duration
    @x = (@x * (d - 1) + @target_x) / d
    @y = (@y * (d - 1) + @target_y) / d
    @zoom_x  = (@zoom_x  * (d - 1) + @target_zoom_x)  / d
    @zoom_y  = (@zoom_y  * (d - 1) + @target_zoom_y)  / d
    @duration -= 1
  end
  #--------------------------------------------------------------------------
  # * Update opacity
  #--------------------------------------------------------------------------
  def update_opacity
    return if @opacity_duration == 0
    d = @opacity_duration
    @opacity = (@opacity * (d - 1) + @target_opacity) / d
    @opacity_duration -= 1
  end
  #--------------------------------------------------------------------------
  # * Update rotate
  #--------------------------------------------------------------------------
  def update_rotate
    return if @rotate_speed == 0
    @angle += @rotate_speed / 2.0
    @angle += 360 while @angle < 0
    @angle %= 360
  end
  #--------------------------------------------------------------------------
  # * Text is moving ?
  #--------------------------------------------------------------------------
  def move?
    return @moving
  end
end

#==============================================================================
# ** Game_Texts
#------------------------------------------------------------------------------
#  Text's collection
#==============================================================================

class Game_Texts
  #--------------------------------------------------------------------------
  # * Constructor
  #--------------------------------------------------------------------------
  def initialize
    @data = []
  end
  #--------------------------------------------------------------------------
  # * Get a text
  #--------------------------------------------------------------------------
  def [](number)
    @data[number] ||= Game_Text.new(number)
  end
  #--------------------------------------------------------------------------
  # * Iterator
  #--------------------------------------------------------------------------
  def each
    @data.compact.each {|text| yield text } if block_given?
  end
end

#==============================================================================
# ** Game_CharacterBase
#------------------------------------------------------------------------------
#  This base class handles characters. It retains basic information, such as
# coordinates and graphics, shared by all characters.
#==============================================================================

class Game_CharacterBase
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    attr_accessor :last_clicked
    attr_accessor :last_pressed
    attr_accessor :last_triggered
    attr_accessor :last_released
    attr_accessor :last_repeated
    attr_accessor :last_hovered
  end
  #--------------------------------------------------------------------------
  # * alias
  #--------------------------------------------------------------------------
  alias :rm_extender_initialize          :initialize
  alias :rm_extender_init_public_members :init_public_members
  alias :rm_extender_update              :update
  attr_accessor :buzz
  attr_accessor :buzz_amplitude
  attr_accessor :buzz_length
  attr_accessor :move_speed
  attr_accessor :move_frequency
  attr_accessor :priority_type
  attr_accessor :through
  attr_accessor :trails
  attr_accessor :trails_prop
  attr_accessor :trails_signal
  attr_accessor :opacity
  attr_accessor :ox, :oy, :zoom_x, :zoom_y
  attr_accessor :move_succeed
  #--------------------------------------------------------------------------
  # * Initialisation du Buzzer
  #--------------------------------------------------------------------------
  def  setup_buzzer
    @buzz           = 0
    @buzz_amplitude = 0.1
    @buzz_length    = 16
  end
  #--------------------------------------------------------------------------
  # * Public instance variable
  #--------------------------------------------------------------------------
  attr_reader :rect
  attr_accessor :sprite_index
  #--------------------------------------------------------------------------
  # * Event Handling
  #--------------------------------------------------------------------------
  include Handler::Behaviour
  #--------------------------------------------------------------------------
  # * Object initialize
  #--------------------------------------------------------------------------
  def initialize
    rm_extender_initialize
    @zoom_x = @zoom_y = 100.0
    @rect = Rect.new(0,0,0,0)
    @sprite_index
  end
  #--------------------------------------------------------------------------
  # * restore ox oy
  #--------------------------------------------------------------------------
  def restore_oxy
    if tile_id > 0
      @ox = 16
      @oy = 32
    else
      bitmap = Cache.character(@character_name)
      sign = @character_name[/^[\!\$]./]
      if sign && sign.include?('$')
        cw = bitmap.width / 3
        ch = bitmap.height / 4
      else
        cw = bitmap.width / 12
        ch = bitmap.height / 8
      end
      @ox = cw / 2
      @oy = ch
    end
  end
  #--------------------------------------------------------------------------
  # * Initialize Public Member Variables
  #--------------------------------------------------------------------------
  def init_public_members
    rm_extender_init_public_members
    setup_eHandler
    @trails = 0
    @trails_signal = false
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    last_real_x = @real_x
    last_real_y = @real_y
    rm_extender_update
    update_scroll(last_real_x, last_real_y)
    update_eHandler
    Game_CharacterBase.last_hovered = @id if hover?
    Game_CharacterBase.last_clicked = @id if click?
    Game_CharacterBase.last_triggered = @id if trigger?
    Game_CharacterBase.last_released = @id if release?
    Game_CharacterBase.last_repeated = @id if repeat?
    Game_CharacterBase.last_pressed = @id if press?
  end
  #--------------------------------------------------------------------------
  # * Scroll Processing
  #--------------------------------------------------------------------------
  def update_scroll(last_real_x, last_real_y)
    return if $game_map.target_camera != self
    ax1 = $game_map.adjust_x(last_real_x)
    ay1 = $game_map.adjust_y(last_real_y)
    ax2 = $game_map.adjust_x(@real_x)
    ay2 = $game_map.adjust_y(@real_y)
    $game_map.scroll_down (ay2 - ay1) if ay2 > ay1 && ay2 > center_y
    $game_map.scroll_left (ax1 - ax2) if ax2 < ax1 && ax2 < center_x
    $game_map.scroll_right(ax2 - ax1) if ax2 > ax1 && ax2 > center_x
    $game_map.scroll_up   (ay1 - ay2) if ay2 < ay1 && ay2 < center_y
  end
  #--------------------------------------------------------------------------
  # * X Coordinate of Screen Center
  #--------------------------------------------------------------------------
  def center_x
    (Graphics.width / 32 - 1) / 2.0
  end
  #--------------------------------------------------------------------------
  # * Y Coordinate of Screen Center
  #--------------------------------------------------------------------------
  def center_y
    (Graphics.height / 32 - 1) / 2.0
  end
  #--------------------------------------------------------------------------
  # * Set Map Display Position to Center of Screen
  #--------------------------------------------------------------------------
  def center(x, y)
    $game_map.set_display_pos(x - center_x, y - center_y)
  end
  #--------------------------------------------------------------------------
  # * Move to x y coord
  #--------------------------------------------------------------------------
  def move_to_position(x, y, wait=false, no_through = false)
    return unless $game_map.passable?(x,y,0)
    route = Pathfinder.create_path(Pathfinder::Goal.new(x, y), self, no_through)
    self.force_move_route(route)
    Fiber.yield while self.move_route_forcing if wait
  end
  #--------------------------------------------------------------------------
  # * Get path length
  #--------------------------------------------------------------------------
  def get_path_length(x, y, noth=false)
    route = Pathfinder.create_path(Pathfinder::Goal.new(x, y), self, noth)
    return route.list.length
  end
  #--------------------------------------------------------------------------
  # * Jump to coord
  #--------------------------------------------------------------------------
  def jump_to(x, y, wait=true)
    t_w = @wait_jump
    @wait_jump = wait
    return false if t_w && jumping?
    x_plus, y_plus = x-@x, y-@y
    if x_plus.abs > y_plus.abs
      set_direction(x_plus < 0 ? 4 : 6) if x_plus != 0
    else
      set_direction(y_plus < 0 ? 8 : 2) if y_plus != 0
    end
    return unless @through || map_passable?(x, y, @direction)
    jump(x_plus, y_plus)
  end
  #--------------------------------------------------------------------------
  # * Event name
  #--------------------------------------------------------------------------
  def name
    ""
  end

  #--------------------------------------------------------------------------
  # * Eval sequence
  #--------------------------------------------------------------------------
  def eval(str, r=nil)
    Game_Interpreter.current_id = @id
    Game_Interpreter.current_map_id = $game_map.map_id
    script = str.gsub(/S(V|S)\[(\d+)\]/) { "S#{$1}[#{@id}, #{$2}]" }
    super(script, $game_map.interpreter.get_binding)
  end

end

#==============================================================================
# ** Game_Character
#------------------------------------------------------------------------------
#  A character class with mainly movement route and other such processing
# added. It is used as a super class of Game_Player, Game_Follower,
# GameVehicle, and Game_Event.
#==============================================================================

class Game_Character

  #--------------------------------------------------------------------------
  # * Move Toward position
  #--------------------------------------------------------------------------
  def move_toward_xy(x, y)
    sx = distance_x_from(x)
    sy = distance_y_from(y)
    if sx.abs > sy.abs
      move_straight(sx > 0 ? 4 : 6)
      move_straight(sy > 0 ? 8 : 2) if !@move_succeed && sy != 0
    elsif sy != 0
      move_straight(sy > 0 ? 8 : 2)
      move_straight(sx > 0 ? 4 : 6) if !@move_succeed && sx != 0
    end
  end
  #--------------------------------------------------------------------------
  # * Move Away from position
  #--------------------------------------------------------------------------
  def move_away_from_xy(x, y)
    sx = distance_x_from(x)
    sy = distance_y_from(y)
    if sx.abs > sy.abs
      move_straight(sx > 0 ? 6 : 4)
      move_straight(sy > 0 ? 2 : 8) if !@move_succeed && sy != 0
    elsif sy != 0
      move_straight(sy > 0 ? 2 : 8)
      move_straight(sx > 0 ? 6 : 4) if !@move_succeed && sx != 0
    end
  end
  #--------------------------------------------------------------------------
  # * Turn Toward position
  #--------------------------------------------------------------------------
  def turn_toward_xy(x, y)
    sx = distance_x_from(x)
    sy = distance_y_from(y)
    if sx.abs > sy.abs
      set_direction(sx > 0 ? 4 : 6)
    elsif sy != 0
      set_direction(sy > 0 ? 8 : 2)
    end
  end
  #--------------------------------------------------------------------------
  # * Turn Away from position
  #--------------------------------------------------------------------------
  def turn_away_from_xy(x, y)
    sx = distance_x_from(x)
    sy = distance_y_from(y)
    if sx.abs > sy.abs
      set_direction(sx > 0 ? 6 : 4)
    elsif sy != 0
      set_direction(sy > 0 ? 2 : 8)
    end
  end

end



#==============================================================================
# ** Game_Player
#------------------------------------------------------------------------------
#  This class handles the player. It includes event starting determinants and
# map scrolling functions. The instance of this class is referenced by
# $game_player.
#==============================================================================

class Game_Player
  #--------------------------------------------------------------------------
  # * Scroll Processing
  #--------------------------------------------------------------------------
  alias_method :rme_update_scroll, :update_scroll
  alias_method :rme_refresh, :refresh
  def update_scroll(last_real_x, last_real_y)
    return if $game_map.target_camera != self
    rme_update_scroll(last_real_x, last_real_y)
  end
  #--------------------------------------------------------------------------
  # * Checks if the player is erased.
  #--------------------------------------------------------------------------
  def erased?
    false
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    rme_refresh
    restore_oxy
  end
end

#==============================================================================
# ** Sprite_Reflect
#------------------------------------------------------------------------------
#  This sprite is used to display characters's reflection
#==============================================================================

class Sprite_Reflect < Sprite_Character

  def initialize(*args, id, cases)
    @id = id
    @y_offset = cases[:y_offset] || 1 
    @cases = (cases || {}).map do |k, v|
      [:"#{k}=", v] if respond_to?(:"#{k}=")
    end.compact
    super(*args)
  end

  def update_other
  end
  def setup_new_effect
  end

  def update
    super()
    self.angle = 180
    self.mirror = true
    self.z = -(50 + self.z)
    self.y = @character.screen_y + ((@y_offset - 1) * 32)
    update_effects
  end

  def update_effects 
    @cases.each {|k, v| send(k, v) }
    update_region
  end

  def update_region
    
  end


end


#==============================================================================
# ** Sprite_Character
#------------------------------------------------------------------------------
#  This sprite is used to display characters. It observes an instance of the
# Game_Character class and automatically changes sprite state.
#==============================================================================

class Sprite_Character
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :rm_extender_update,      :update
  alias_method :rm_extender_initialize,  :initialize
  alias_method :rm_extender_dispose,     :dispose
  alias_method :rm_extender_set_character_bitmap,  :set_character_bitmap
  #--------------------------------------------------------------------------
  # * Object initialization
  #--------------------------------------------------------------------------
  def initialize(viewport, character = nil)
    @trails = []
    rm_extender_initialize(viewport, character)
    set_rect
    self.character.setup_buzzer if self.character
    @old_buzz = 0
    @origin_len_x = self.zoom_x
    @origin_len_y = self.zoom_y
  end
  #--------------------------------------------------------------------------
  # * Frame Update zoom
  #--------------------------------------------------------------------------
  def set_character_bitmap
    rm_extender_set_character_bitmap
    character.ox = self.ox
    character.oy = self.oy
    @old_buzz = 0
    @origin_len_x = self.zoom_x
  end
  #--------------------------------------------------------------------------
  # * Dispose trails
  #--------------------------------------------------------------------------
  def dispose_trails
    @trails.each {|trail| trail.dispose unless trail.disposed?}
    self.character.trails = 0 if self.character.trails_signal
    self.character.trails_signal = false
  end
  #--------------------------------------------------------------------------
  # * Set rect to dynamic layer
  #--------------------------------------------------------------------------
  def set_rect
    if character
      x_rect, y_rect = self.x-self.ox*self.zoom_x, self.y-self.oy*self.zoom_y
      w_rect, h_rect = self.src_rect.width*self.zoom_x, self.src_rect.height*self.zoom_y
      character.rect.set(x_rect, y_rect, w_rect, h_rect)
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    rm_extender_update
    return if disposed?
    set_rect
    update_zooms
    update_buzzer
    update_trails
  end
  #--------------------------------------------------------------------------
  # * Frame Update zoom
  #--------------------------------------------------------------------------
  def update_zooms
    return unless character
    self.zoom_x = character.zoom_x / 100.0
    self.zoom_y = character.zoom_y / 100.0
    self.ox = character.ox if character.ox
    self.oy = character.oy if character.oy
  end
  #--------------------------------------------------------------------------
  # * Update trails
  #--------------------------------------------------------------------------
  def update_trails
    if @trails.length != character.trails
      dispose_trails
      @trails = Array.new(character.trails) do |i|
        k = Sprite_Trail.new(viewport, character)
        k.opacity = (k.base_opacity+1) / character.trails * i
        k
      end
    end
    @trails.each do |trail|
      trail.update
      if self.character.trails_signal
        trail.dispose if !trail.disposed? && trail.opacity == 0
      end
    end
    f = self.character.trails_signal && @trails.all? {|tr| tr.disposed?}
    dispose_trails if f
  end
  #--------------------------------------------------------------------------
  # * Dispose
  #--------------------------------------------------------------------------
  def dispose
    dispose_trails
    rm_extender_dispose
  end
  #--------------------------------------------------------------------------
  # * Update buzzer
  #--------------------------------------------------------------------------
  def update_buzzer
    return if !self.character.buzz || self.character.buzz == 0
    if @old_buzz == 0
      @origin_len_x = self.zoom_x
      @origin_len_y = self.zoom_y
    end
    @old_buzz             = self.character.buzz
    len                   = self.character.buzz_length
    transformation        = Math.sin(@old_buzz*6.283/len)
    transformation        *= self.character.buzz_amplitude
    self.zoom_x           = @origin_len_x + transformation
    self.zoom_y           = @origin_len_y - transformation
    self.character.buzz   -= 1
    if self.character.buzz == 0
      self.zoom_x = @origin_len_x
      self.zoom_y = @origin_len_y
      @old_buzz = 0
    end
  end
end

#==============================================================================
# ** Sprite_Trail
#------------------------------------------------------------------------------
#  Character trail
#==============================================================================

class Sprite_Trail < Sprite_Base
  #--------------------------------------------------------------------------
  # * Object Initialization
  #     viewport  : viewport
  #     character : character (Game_Character)
  #--------------------------------------------------------------------------
  def initialize(viewport, chara)
    super(viewport)
    @timer = 0
    @character = chara
    self.opacity = 0
    process_prop
    self.z = @prop[:z]
    self.tone = @prop[:tone] if @prop[:tone]
    self.blend_type = @prop[:blend_type]
    @real_x = @real_y = 0
    update
  end

  #--------------------------------------------------------------------------
  # * Base opacity
  #--------------------------------------------------------------------------
  def base_opacity
    @prop[:opacity]
  end

  #--------------------------------------------------------------------------
  # * Process prop
  #--------------------------------------------------------------------------
  def process_prop
    if @character && @character.trails_prop
      @prop = Hash.new
      @prop[:opacity]     = @character.trails_prop[:opacity]    || 255
      @prop[:blend_type]  = @character.trails_prop[:blend_type] || 1
      @prop[:step]        = @character.trails_prop[:step]       || 0.5
      @prop[:z]           = @character.trails_prop[:z]          || 99
    else
      @prop = {
        opacity: 255,
        blend_type: 1,
        tone: Tone.new(200, 0, 0),
        step: 1,
        z: 99
      }
    end
  end

  #--------------------------------------------------------------------------
  # * Update
  #--------------------------------------------------------------------------
  def update
    return if disposed?
    if self.opacity <= 0
      super
      self.blend_type = @prop[:blend_type]
      update_bitmap
      update_src_rect
      update_position
      update
    end
    fact = (@prop[:opacity]+1.0) / (@character.trails - 1.0)
    self.opacity -= fact
    @prop[:udpate_callback].call(self) if @prop[:udpate_callback]
    @timer +=1
    @timer %= @prop[:step]
    self.x = $game_map.adjust_x(@real_x) * 32 + 16
    self.y = $game_map.adjust_y(@real_y) * 32 + 32 - 4 - @character.jump_height
  end

  #--------------------------------------------------------------------------
  # * Update position
  #--------------------------------------------------------------------------
  def update_position
    if @timer == 0
      @real_x = @character.real_x
      @real_y = @character.real_y
    end
  end

  #--------------------------------------------------------------------------
  # * Update bitmap
  #--------------------------------------------------------------------------
  def update_bitmap
    @character_name = @character.character_name
    @character_index = @character.character_index
    self.bitmap = Cache.character(@character_name)
    sign = @character_name[/^[\!\$]./]
    if sign && sign.include?('$')
      @cw = bitmap.width / 3
      @ch = bitmap.height / 4
    else
      @cw = bitmap.width / 12
      @ch = bitmap.height / 8
    end
    self.ox = @cw / 2
    self.oy = @ch
  end

  #--------------------------------------------------------------------------
  # * Update Transfer Origin Rectangle
  #--------------------------------------------------------------------------
  def update_src_rect
    self.visible =
      (not @character.transparent and @character.trails > 0 and @character.moving?)
    self.opacity = 0 unless @character.moving?
    index = @character.character_index
    pattern = @character.pattern < 3 ? @character.pattern : 1
    sx = (index % 4 * 3 + pattern) * @cw
    sy = (index / 4 * 4 + (@character.direction - 2) / 2) * @ch
    self.opacity = @prop[:opacity]
    self.src_rect.set(sx, sy, @cw, @ch)
  end

end

#==============================================================================
# ** Window_Base
#------------------------------------------------------------------------------
#  This is a super class of all windows within the game.
#==============================================================================

class Window_Base
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :rm_extender_convert_escape_characters, :convert_escape_characters
  alias_method :rm_extender_initialize, :initialize
  alias_method :rm_extender_update, :update
  #--------------------------------------------------------------------------
  # * Object Initialize
  #--------------------------------------------------------------------------
  def initialize(*args)
    rm_extender_initialize(*args)
    init_target
  end
  #--------------------------------------------------------------------------
  # * Frame update
  #--------------------------------------------------------------------------
  def update
    rm_extender_update
    mod_update
  end
  #--------------------------------------------------------------------------
  # * Preconvert Control Characters
  #    As a rule, replace only what will be changed into text strings before
  #    starting actual drawing. The character "\" is replaced with the escape
  #    character (\e).
  #--------------------------------------------------------------------------
  def convert_escape_characters(text)
    result = rm_extender_convert_escape_characters(text).to_s.clone
    result.gsub!(/\eL\[\:(\w+)\]/i) { L[$1.to_sym] }
    result.gsub!(/\eSL\[\:(\w+)\]/i) { SL[$game_message.call_event, $1.to_sym] }
    result.gsub!(/\eSL\[(\d+)\,\s*\:(\w+)\]/i) { SL[$1.to_i, $2.to_sym] }
    result.gsub!(/\eSL\[(\d+)\,\s*(\d+)\,\s*\:(\w+)\]/i) { SL[$1.to_i, $2.to_i, $3.to_sym] }
    result.gsub!(/\eSV\[([^\]]+)\]/i) do
      numbers = $1.extract_numbers
      array = [*numbers]
      if numbers.length == 1
        array = [$game_message.call_event] + array
      end
      SV[*array]
    end
    return result
  end
  #--------------------------------------------------------------------------
  # * Include Window movement
  #--------------------------------------------------------------------------
  include Window_Movement
end

#==============================================================================
# ** Window_Text
#------------------------------------------------------------------------------
#  This message window is used to display text.
#==============================================================================

class Window_Text < Window_Base
  #--------------------------------------------------------------------------
  # * Public instances variables
  #--------------------------------------------------------------------------
  attr_accessor :profile
  attr_accessor :content
  #--------------------------------------------------------------------------
  # * Get Text box
  #--------------------------------------------------------------------------
  def textbox
    bmp = Bitmap.new(1, 1)
    bmp.font = get_profile(@profile.text_profile).to_font
    widths = Array.new
    heights = Array.new
    lines = @content
    lines = @content.split("\n") if @content.is_a?(String)
    lines = lines.collect{|k| convert_escape_characters(k)}
    lines.each do |line|
      r = bmp.text_size(line)
      widths << r.width
      heights << r.height
    end
    width, height = widths.max, heights.max
    total_height = height * lines.length
    [width, total_height, height]
  end
  #--------------------------------------------------------------------------
  # * Object Initialize
  #--------------------------------------------------------------------------
  def initialize(x, y, content, width, height, closed = nil)
    @profile = get_windowProfile("default")
    @content = content
    @w, @th, @h = *textbox
    width = @w + 2*standard_padding if width == -1
    height = @th + 2*standard_padding if height == -1
    super(x, y, width, height)
    refresh
    self.openness = 0 if closed
  end
  #--------------------------------------------------------------------------
  # * Profile accessor
  #--------------------------------------------------------------------------
  def profile=(k)
    @profile = get_windowProfile(k)
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh(flag = false)
    if flag
      @w, @th, @h = *textbox
      width = @w + 2*standard_padding
      height = @th + 2*standard_padding
      move(self.x, self.y, width, height)
    end
    init_bitmap
  end
  #--------------------------------------------------------------------------
  # * Init Bitmap
  #--------------------------------------------------------------------------
  def init_bitmap
    create_contents
    self.contents.font = get_profile(@profile.text_profile).to_font
    draw_text_content
  end
  #--------------------------------------------------------------------------
  # * Draw text content
  #--------------------------------------------------------------------------
  def draw_text_content
    i = 0
    lines = @content
    lines = lines.join("\n") if @content.is_a?(Array)
    draw_text_ex(0, i, lines)
  end
end

#==============================================================================
# ** Window_EvCommand
#------------------------------------------------------------------------------
#  This window deals with general command choices.
#==============================================================================

class Window_EvCommand < Window_Command
  #--------------------------------------------------------------------------
  # * Public instances variables
  #--------------------------------------------------------------------------
  attr_accessor :content
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(x, y, w, h, hash, closed = nil)
    @content = hash
    @ev_width, @ev_height = w, h
    super(x, y)
    self.openness = 0 if closed
    define_handlers
  end
  #--------------------------------------------------------------------------
  # * Define handlers
  #--------------------------------------------------------------------------
  def define_handlers
    @content.each do |key, value|
      action = value.respond_to?(:call) ? value : value[:action]
      actionProc = Proc.new{
        action.call
        self.activate
      }
      set_handler(key.to_sym, actionProc)
    end
  end
  #--------------------------------------------------------------------------
  # * Get Window Width
  #--------------------------------------------------------------------------
  def window_width
    return @ev_width
  end
  #--------------------------------------------------------------------------
  # * Get Number of Lines to Show
  #--------------------------------------------------------------------------
  def visible_line_number
    @ev_height
  end
  #--------------------------------------------------------------------------
  # * Create Command List
  #--------------------------------------------------------------------------
  def make_command_list
    @content.each do |key, value|
      if value.respond_to?(:call)
        e = true
      else
        e = value.has_key?(:enabled?) ? value[:enabled?] : true
      end
      self.add_command(key, key.to_sym, e)
    end
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh(resize = false)
    if resize
      @ev_height = @content.size
      self.height = window_height
    end
    super()
    define_handlers
    select(0)
  end
end

#==============================================================================
# ** Window_HorzCommand
#------------------------------------------------------------------------------
#  This is a command window for the horizontal selection format.
#==============================================================================

class Window_EvHorzCommand < Window_EvCommand
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(x, y, w, hash, closed = nil)
    @col = w
    super(x, y, Graphics.width, 1, hash)
    self.openness = 0 if closed
  end
  #--------------------------------------------------------------------------
  # * Get Number of Lines to Show
  #--------------------------------------------------------------------------
  def visible_line_number
    return 1
  end
  #--------------------------------------------------------------------------
  # * Get Digit Count
  #--------------------------------------------------------------------------
  def col_max
    return @col
  end
  #--------------------------------------------------------------------------
  # * Get Spacing for Items Arranged Side by Side
  #--------------------------------------------------------------------------
  def spacing
    return 8
  end
  #--------------------------------------------------------------------------
  # * Calculate Width of Window Contents
  #--------------------------------------------------------------------------
  def contents_width
    (item_width + spacing) * item_max - spacing
  end
  #--------------------------------------------------------------------------
  # * Calculate Height of Window Contents
  #--------------------------------------------------------------------------
  def contents_height
    item_height
  end
  #--------------------------------------------------------------------------
  # * Get Leading Digits
  #--------------------------------------------------------------------------
  def top_col
    ox / (item_width + spacing)
  end
  #--------------------------------------------------------------------------
  # * Set Leading Digits
  #--------------------------------------------------------------------------
  def top_col=(col)
    col = 0 if col < 0
    col = col_max - 1 if col > col_max - 1
    self.ox = col * (item_width + spacing)
  end
  #--------------------------------------------------------------------------
  # * Get Trailing Digits
  #--------------------------------------------------------------------------
  def bottom_col
    top_col + col_max - 1
  end
  #--------------------------------------------------------------------------
  # * Set Trailing Digits
  #--------------------------------------------------------------------------
  def bottom_col=(col)
    self.top_col = col - (col_max - 1)
  end
  #--------------------------------------------------------------------------
  # * Scroll Cursor to Position Within Screen
  #--------------------------------------------------------------------------
  def ensure_cursor_visible
    self.top_col = index if index < top_col
    self.bottom_col = index if index > bottom_col
  end
  #--------------------------------------------------------------------------
  # * Get Rectangle for Displaying Items
  #--------------------------------------------------------------------------
  def item_rect(index)
    rect = super
    rect.x = index * (item_width + spacing)
    rect.y = 0
    rect
  end
  #--------------------------------------------------------------------------
  # * Get Alignment
  #--------------------------------------------------------------------------
  def alignment
    return 1
  end
  #--------------------------------------------------------------------------
  # * Move Cursor Down
  #--------------------------------------------------------------------------
  def cursor_down(wrap = false)
  end
  #--------------------------------------------------------------------------
  # * Move Cursor Up
  #--------------------------------------------------------------------------
  def cursor_up(wrap = false)
  end
  #--------------------------------------------------------------------------
  # * Move Cursor One Page Down
  #--------------------------------------------------------------------------
  def cursor_pagedown
  end
  #--------------------------------------------------------------------------
  # * Move Cursor One Page Up
  #--------------------------------------------------------------------------
  def cursor_pageup
  end
end

#==============================================================================
# ** Window_EvSelect
#------------------------------------------------------------------------------
#  This window deals with general command choices.
#==============================================================================

class Window_EvSelectable < Window_Selectable

  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(x, y, width, height, hash, closed = nil)
    @raw_hash = hash
    @enabled_callback = hash[:enabled] || Proc.new{ |i| true }
    @enumeration = hash[:data]
    @action_callback = Proc.new do
      return if disposed?
      hash[:action].call(self.current_item) if hash[:action]
      activate
    end
    @cancel_callback = Proc.new do
      return if disposed?
      hash[:cancel].call(self.current_item) if hash[:cancel]
      activate
    end
    @draw_callback = hash[:draw] || Proc.new {|i| write_text(i, @enumeration[i])}
    @column = hash[:column] || 1
    @activation = hash[:activate] || true
    @move_callback = hash[:change]
    super(x, y, width, height)
    self.openness = 0 if closed
    refresh
    set_handler(:ok, @action_callback)
    set_handler(:cancel, @cancel_callback)
    select(0)
    activate if @activation
  end

  def item(id)
    @enumeration[id] || nil
  end

  #--------------------------------------------------------------------------
  # * current item
  #--------------------------------------------------------------------------
  def current_item
    item(index)
  end

  #--------------------------------------------------------------------------
  # * enabled?
  #--------------------------------------------------------------------------
  def enabled?(index)
    instance_exec(index, &@enabled_callback)
  end

  #--------------------------------------------------------------------------
  # * Select Item
  #--------------------------------------------------------------------------
  def select(index)
    super(index)
    instance_exec(index, &@move_callback) if @move_callback
  end

  #--------------------------------------------------------------------------
  # * Create data list
  #--------------------------------------------------------------------------
  def make_item_list
    @data = []
    @enumeration.each do |value|
      p value
      @data.push(value)
    end
  end

  #--------------------------------------------------------------------------
  # * Draw text
  #--------------------------------------------------------------------------
  def write_text(index, s, align = 0)
    change_color(normal_color, enabled?(index))
    draw_text(item_rect_for_text(index), s.to_s, align)
  end
  def write_with_number(index, s, n)
    write_text(index, s)
    write_text(index, n, 2)
  end
  def write_with_icon(index, s, icon, n = nil)
    rect = item_rect_for_text(index)
    rect.width -= 20
    rect.x += 22
    change_color(normal_color, enabled?(index))
    draw_text(rect, s.to_s)
    draw_icon(icon, rect.x-22, rect.y, enabled?(index))
    draw_text(rect, n, 2) if n
  end

  #--------------------------------------------------------------------------
  # * Draw Item
  #--------------------------------------------------------------------------
  def draw_item(index)
    instance_exec(index, &@draw_callback)
  end

  #--------------------------------------------------------------------------
  # * Get Number of Items
  #--------------------------------------------------------------------------
  def item_max
    return @enumeration.length
  end

end

#==============================================================================
# ** Window_Message
#------------------------------------------------------------------------------
#  This message window is used to display text.
#==============================================================================

class Window_Message
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    attr_accessor :line_number
    Window_Message.line_number = 4
  end
  #--------------------------------------------------------------------------
  # * Get Number of Lines to Show
  #--------------------------------------------------------------------------
  def visible_line_number
    Window_Message.line_number
  end
end

#==============================================================================
# ** Scene_Map
#------------------------------------------------------------------------------
#  This class performs the map screen processing.
#==============================================================================

class Scene_Map
  #--------------------------------------------------------------------------
  # * Public instance variable
  #--------------------------------------------------------------------------
  attr_reader :spriteset
  attr_accessor :textfields
  attr_accessor :windows
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :extender_start, :start
  #--------------------------------------------------------------------------
  # * Start
  #--------------------------------------------------------------------------
  def start
    @textfields = Hash.new
    @windows = Hash.new
    extender_start
  end
  #--------------------------------------------------------------------------
  # * Erase a Window
  #--------------------------------------------------------------------------
  def erase_window(i)
    @windows[i].dispose if @windows[i] &&  !@windows[i].disposed?
    @windows.delete(i) if @windows[i]
  end
  #--------------------------------------------------------------------------
  # * Erase all Windows
  #--------------------------------------------------------------------------
  def erase_windows
    return unless @windows
    @windows.each {|i,t| erase_window(i)}
  end
  #--------------------------------------------------------------------------
  # * unActivate all Windows
  #--------------------------------------------------------------------------
  def unactivate_windows
    @windows.each {|i,t| t.deactivate if t && !t.disposed?}
  end
  #--------------------------------------------------------------------------
  # * add Window
  #--------------------------------------------------------------------------
  def add_window(i, window)
    erase_window(i)
    @windows[i] = window
  end
  #--------------------------------------------------------------------------
  # * Erase a field
  #--------------------------------------------------------------------------
  def erase_textfield(i)
    @textfields[i].dispose if @textfields[i] && !@textfields[i].disposed?
    @textfields.delete(i) if @textfields[i]
  end
  #--------------------------------------------------------------------------
  # * Erase all fields
  #--------------------------------------------------------------------------
  def erase_textfields
    return unless @textfields
    @textfields.each {|i,t| erase_textfield(i)}
  end
  #--------------------------------------------------------------------------
  # * Unactivate all textfields
  #--------------------------------------------------------------------------
  def unactivate_textfields
    return unless @textfields
    @textfields.each {|i,t| t.deactivate if t && !t.disposed?}
  end
  #--------------------------------------------------------------------------
  # * add textfield
  #--------------------------------------------------------------------------
  def add_textfield(i, tf)
    erase_textfield(i)
    @textfields[i] = tf
  end
  #--------------------------------------------------------------------------
  # * refresh spriteset
  #--------------------------------------------------------------------------
  def refresh_spriteset
    dispose_spriteset
    create_spriteset
  end
  #--------------------------------------------------------------------------
  # * Refresh Windows
  #--------------------------------------------------------------------------
  def refresh_message
    @message_window.dispose
    @message_window = Window_Message.new
  end

  #--------------------------------------------------------------------------
  # * Update All Windows
  #--------------------------------------------------------------------------
  def update_all_windows
    super
    @windows.values.collect(&:update)
    @textfields.values.collect(&:update)
  end

end

#==============================================================================
# ** Game_Map
#------------------------------------------------------------------------------
# This class handles maps. It includes scrolling and passage determination
# functions. The instance of this class is referenced by $game_map.
#==============================================================================
class Game_Map
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :rm_extender_initialize, :initialize
  alias_method :rm_extender_setup, :setup
  alias_method :rm_extender_update, :update
  alias_method :rm_extender_setup_events, :setup_events
  alias_method :rm_extender_pc, :parallel_common_events
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    #--------------------------------------------------------------------------
    # * Public instances variables
    #--------------------------------------------------------------------------
    attr_accessor :loaded_proc
    attr_accessor :running_proc
    Game_Map.loaded_proc ||= Hash.new
    Game_Map.running_proc ||= Hash.new
    #--------------------------------------------------------------------------
    # * Map onload
    #-------------------------------------------------------------------------
    def onload(ids, &block)
      ids.each do |id|
        oth = Game_Map.loaded_proc[id] || Proc.new {}
        nex = Proc.new do
          $game_map.interpreter.instance_eval(&oth)
          $game_map.interpreter.instance_eval(&block)
        end
        Game_Map.loaded_proc[id] = nex
      end
    end
    #--------------------------------------------------------------------------
    # * Map onRunning
    #--------------------------------------------------------------------------
    def onprogress(ids, &block)
      ids.each do |id|
        oth = Game_Map.running_proc[id] || Proc.new {}
        nex = Proc.new do
          $game_map.interpreter.instance_eval(&oth)
          $game_map.interpreter.instance_eval(&block)
        end
        Game_Map.running_proc[id] = nex
      end
    end
    #--------------------------------------------------------------------------
    # * Eval proc
    #--------------------------------------------------------------------------
    def eval_proc(id, c = Game_Map.loaded_proc)
      c[id].call if c.has_key?(id)
    end
  end
  #--------------------------------------------------------------------------
  # * Public instance variables
  #--------------------------------------------------------------------------
  attr_accessor :parallaxes
  attr_accessor :target_camera
  attr_accessor :tileset_id
  attr_accessor :map
  attr_accessor :use_reflection
  attr_accessor :reflection_properties
  attr_accessor :region_mapper 
  attr_accessor :tile_mapper
  alias_method :rme_update_scroll, :update_scroll
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    @use_reflection = false
    @reflection_properties = {}
    @parallaxes = Game_Parallaxes.new
    rm_extender_initialize
  end
  #--------------------------------------------------------------------------
  # * Setup
  #--------------------------------------------------------------------------
  def setup(map_id)
    rm_extender_setup(map_id)
    SceneManager.scene.erase_textfields if SceneManager.scene.is_a?(Scene_Map)
    Game_Map.eval_proc(:all)
    Game_Map.eval_proc(map_id)
    @target_camera = $game_player
    unflash_map
    setup_region_data
    @max_event_id = events.keys.max || 0
  end
  #--------------------------------------------------------------------------
  # * Setup Region Data
  #--------------------------------------------------------------------------
  def setup_region_data
    @region_mapper = Array.new(64) { Array.new }
    @terrain_mapper = Array.new(8) { Array.new }
    @tile_mapper = [Hash.new, Hash.new, Hash.new]
    data.xsize.times do |x|
      data.ysize.times do |y|
        3.times do |layer|
          tile = tile_id(x, y, layer)
          @tile_mapper[layer][tile] ||= Array.new 
          @tile_mapper[layer][tile] << Point.new(x, y)
        end
        @region_mapper[region_id(x, y)] << Point.new(x, y)
        @terrain_mapper[terrain_tag(x, y)] << Point.new(x, y)
      end 
    end
  end
  #--------------------------------------------------------------------------
  # * Unflash all squares
  #--------------------------------------------------------------------------
  def unflash_map
    return unless SceneManager.scene.is_a?(Scene_Map)
    tilemap = SceneManager.scene.spriteset.tilemap
    if tilemap.flash_data
      height.times do |y|
        width.times do |x|
          tilemap.flash_data[x, y] = Color.new(0, 0, 0).to_hex
        end
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Scroll Processing
  #--------------------------------------------------------------------------
  def update_scroll
    return if @fixed
    rme_update_scroll
  end
  #--------------------------------------------------------------------------
  # * Get each events
  #--------------------------------------------------------------------------
  def each_events
    result = events.keys.dup << 0
    result
  end
  #--------------------------------------------------------------------------
  # * Returns Max Event Id
  #--------------------------------------------------------------------------
  def max_id
    @max_event_id
  end

  #--------------------------------------------------------------------------
  # * Returns the first ID of an erased event
  #--------------------------------------------------------------------------
  def min_erased_id
    e = events.find {|id, ev| ev.erased?}
    (e) ? e[0] : nil
  end

  def super_page
    page = RPG::Event::Page.new
    page.trigger = 4
    page.list = [RPG::EventCommand.new(123, 0, ['internal_rme_trigger', 0])]
    page
  end


  def ev_format(event)
    first = event.pages.first.condition
    if !first.self_switch_valid
      first.self_switch_valid = true 
      first.self_switch_ch = 'internal_rme_trigger'
      event.pages = [super_page] + event.pages 
    end
    event
  end

  #--------------------------------------------------------------------------
  # * Add event to map
  #--------------------------------------------------------------------------
  def add_event(map_id, event_id, new_id,x=nil,y=nil)
    map = Cache.map(map_id)
    return unless map
    event = ev_format(map.events.fetch(event_id, nil).custom_deep_clone)
    return unless event
    event.id = new_id
    clone_events = @events.clone
    clone_events.store(new_id, Game_Event.new(@map_id, event))
    x ||= event.x
    y ||= event.y
    @events = clone_events
    @events[new_id].moveto(x, y)
    @need_refresh = true
    @max_event_id = [@max_event_id, new_id].max
    SceneManager.scene.refresh_spriteset
  end
  #--------------------------------------------------------------------------
  # * Clear parallaxes
  #--------------------------------------------------------------------------
  def clear_parallaxes
    @parallaxes.each {|parallax| parallax.hide}
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #     main:  Interpreter update flag
  #--------------------------------------------------------------------------
  def update(main = false)
    setup(@map_id) if $TEST && Keyboard.trigger?(RME::Config::MAP_RELOAD)
    Game_Map.eval_proc(:all, Game_Map.running_proc)
    Game_Map.eval_proc(map_id, Game_Map.running_proc)
    @parallaxes.each {|parallax| parallax.update}
    rm_extender_update(main)
  end
  #--------------------------------------------------------------------------
  # * Event Setup
  #--------------------------------------------------------------------------
  def setup_events
    rm_extender_setup_events
    @common_events.each {|event| event.refresh }
  end
  #--------------------------------------------------------------------------
  # * Get Random Square of the map
  #--------------------------------------------------------------------------
  def random_square(region_id)
    reg = @region_mapper[region_id] || []
    reg.sample
  end

  #--------------------------------------------------------------------------
  # * Get squares by region
  #--------------------------------------------------------------------------
  def squares_by_region(region_id)
    @region_mapper[region_id] || []
  end

  #--------------------------------------------------------------------------
  # * Get squares by terrain tag
  #--------------------------------------------------------------------------
  def squares_by_terrain(terrain_tag)
    @terrain_mapper[terrain_tag] || []
  end

  #--------------------------------------------------------------------------
  # * Get squares by tile_id
  #--------------------------------------------------------------------------
  def squares_by_tile(layer, tile_id)
    @tile_mapper[layer][tile_id] || []
  end

  #--------------------------------------------------------------------------
  # * Get Array of Parallel Common Events
  #--------------------------------------------------------------------------
  def parallel_common_events
    rm_extender_pc.select {|e| e && !e.for_battle?}
  end
end

#==============================================================================
# ** Game_Message
#------------------------------------------------------------------------------
#  This class handles the state of the message window that displays text or
# selections, etc. The instance of this class is referenced by $game_message.
#==============================================================================

class Game_Message
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor :call_event
end

#==============================================================================
# ** Game_Screen
#------------------------------------------------------------------------------
#  This class handles screen maintenance data, such as changes in color tone,
# flashes, etc. It's used within the Game_Map and Game_Troop classes.
#==============================================================================

class Game_Screen
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self

    #--------------------------------------------------------------------------
    # * Return current Game Screen
    #--------------------------------------------------------------------------
    def get
      $game_party.in_battle ? $game_troop.screen : $game_map.screen
    end
  end
  #--------------------------------------------------------------------------
  # * Public instance variable
  #--------------------------------------------------------------------------
  attr_reader :texts
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias :displaytext_initialize :initialize
  alias :displaytext_update     :update
  #--------------------------------------------------------------------------
  # * Constructor
  #--------------------------------------------------------------------------
  def initialize
    @texts = Game_Texts.new
    displaytext_initialize
  end
  #--------------------------------------------------------------------------
  # * Clear
  #--------------------------------------------------------------------------
  alias_method :displaytext_clear, :clear
  def clear
    displaytext_clear
    clear_texts
  end
  #--------------------------------------------------------------------------
  # * Clear text
  #--------------------------------------------------------------------------
  def clear_texts
    @texts.each{|t|t.erase}
  end
  #--------------------------------------------------------------------------
  # * Frame update
  #--------------------------------------------------------------------------
  def update
    displaytext_update
    update_texts
  end
  #--------------------------------------------------------------------------
  # * Update texts
  #--------------------------------------------------------------------------
  def update_texts
    @texts.each{|t|t.update}
  end
end

#==============================================================================
# ** Sprite_Text
#------------------------------------------------------------------------------
#  text view
#==============================================================================

class Sprite_Text < Sprite
  #--------------------------------------------------------------------------
  # * Constructor
  #--------------------------------------------------------------------------
  def initialize(viewport, dynamic_text)
    super(viewport)
    @text = dynamic_text
    @text_value = ""
    @profile = nil
  end
  #--------------------------------------------------------------------------
  # * Free bitmap
  #--------------------------------------------------------------------------
  def dispose
    bitmap.dispose if bitmap
    super
  end
  #--------------------------------------------------------------------------
  # * Modification à chaque frames
  #--------------------------------------------------------------------------
  def update
    super
    update_bitmap
    update_origin
    update_position
    update_zoom
    update_other
  end
  #--------------------------------------------------------------------------
  # * Création du bitmap
  #--------------------------------------------------------------------------
  def create_bitmap
    font = @text.profile.to_font
    bmp = Bitmap.new(1, 1)
    bmp.font = font
    lines = @text_value.split("\n")
    widths = Array.new
    heights = Array.new
    lines.each do |line|
      r = bmp.text_size(line)
      widths << r.width
      heights << r.height
    end
    width, height = widths.max, heights.max
    total_height = height * lines.length
    self.bitmap = Bitmap.new(width+32, total_height)
    self.bitmap.font = font
    iterator = 0
    lines.each do |line|
      self.bitmap.draw_text(0, iterator, width+32, height, line, 0)
      iterator += height
    end
  end
  #--------------------------------------------------------------------------
  # * Update bitmap
  #--------------------------------------------------------------------------
  def update_bitmap
    if @text.text_value.empty?
      self.bitmap = nil
      @text_value = ""
    else
      if @text.text_value != @text_value || @profile != @text.profile
        @profile = @text.profile
        @text_value = @text.text_value
        if self.bitmap && !self.bitmap.disposed?
          self.bitmap = nil
        end
        create_bitmap
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Update origin
  #--------------------------------------------------------------------------
  def update_origin
    if @text.origin == 0
      self.ox = 0
      self.oy = 0
    else
      self.ox = bitmap.width / 2
      self.oy = bitmap.height / 2
    end
  end
  #--------------------------------------------------------------------------
  # * Update Position
  #--------------------------------------------------------------------------
  def update_position
    self.x = @text.x
    self.y = @text.y
    self.z = @text.number
  end
  #--------------------------------------------------------------------------
  # * Update Zoom Factor
  #--------------------------------------------------------------------------
  def update_zoom
    self.zoom_x = @text.zoom_x / 100.0
    self.zoom_y = @text.zoom_y / 100.0
  end
  #--------------------------------------------------------------------------
  # * Update Other
  #--------------------------------------------------------------------------
  def update_other
    self.opacity = @text.opacity
    self.blend_type = @text.blend_type
    self.angle = @text.angle
  end
end

#==============================================================================
# ** Game_Parallax
#------------------------------------------------------------------------------
#  This class handles Parallaxes.
#==============================================================================

class Game_Parallax
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor :id, :name, :z, :opacity, :zoom_x, :zoom_y, :blend_type
  attr_accessor :autospeed_x, :autospeed_y, :move_x, :move_y, :tone
  #--------------------------------------------------------------------------
  # * Initialize
  #--------------------------------------------------------------------------
  def initialize(id)
    @id = id
    init_basic
  end
  #--------------------------------------------------------------------------
  # * Initialize basic arguments
  #--------------------------------------------------------------------------
  def init_basic
    @name, @z, @opacity = "", -100, 255
    @zoom_x, @zoom_y = 100, 100
    @blend_type = 0
    @autospeed_x = @autospeed_y = 0
    @move_x = @move_y = 0
    @tone = Tone.new(0,0,0)
    @duration = 0
    @tone_duration = 0
    @auto_duration = 0
  end
  #--------------------------------------------------------------------------
  # * show
  #--------------------------------------------------------------------------
  def show(n, z, op, a_x, a_y, m_x, m_y, b = 0, z_x = 100, z_y = 100, t = Tone.new)
    @name, @z, @opacity = n, z, op
    @zoom_x, @zoom_y = z_x, z_y
    @autospeed_x, @autospeed_y = a_x, a_y
    @move_x, @move_y = m_x, m_y
    @blend_type = b
    @tone = t
  end
  #--------------------------------------------------------------------------
  # * move
  #--------------------------------------------------------------------------
  def move(duration, zoom_x, zoom_y, opacity, tone = nil, ease = :linear)
    set_transition('zoom_x',  zoom_x,  duration, ease)
    set_transition('zoom_y',  zoom_y,  duration, ease)
    set_transition('opacity', opacity, duration, ease)
    start_tone_change(tone, duration, ease) if tone.is_a?(Tone)
  end
  #--------------------------------------------------------------------------
  # * Start Changing Color Tone
  #--------------------------------------------------------------------------
  def start_tone_change(tone, duration, ease = :linear)
    @tone.set_transition('red',   tone.red,   duration, ease)
    @tone.set_transition('green', tone.green, duration, ease)
    @tone.set_transition('blue',  tone.blue,  duration, ease)
    @tone.set_transition('gray',  tone.gray,  duration, ease)
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    update_move
    update_tone_change
    update_auto_change
  end
  #--------------------------------------------------------------------------
  # * Update Parallax Move
  #--------------------------------------------------------------------------
  def update_move
    update_transition('zoom_x')
    update_transition('zoom_y')
    update_transition('opacity')
  end
  #--------------------------------------------------------------------------
  # * Update Color Tone Change
  #--------------------------------------------------------------------------
  def update_tone_change
    @tone.update_transition('red')
    @tone.update_transition('green')
    @tone.update_transition('blue')
    @tone.update_transition('gray')
  end
  #--------------------------------------------------------------------------
  # * Update auto Change
  #--------------------------------------------------------------------------
  def update_auto_change
    update_transition('autospeed_x')
    update_transition('autospeed_y')
    update_transition('opacity')
  end
  #--------------------------------------------------------------------------
  # * hide parallax
  #--------------------------------------------------------------------------
  def hide
    @name = ""
  end
end

#==============================================================================
# ** Game_Parallaxes
#------------------------------------------------------------------------------
#  This is a wrapper for a parallaxes array. This class is used within the
# Game_Screen class. Map screen parallaxes and battle screen parallaxes are
# handled separately.
#==============================================================================

class Game_Parallaxes
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    @data = []
  end
  #--------------------------------------------------------------------------
  # * Get Picture
  #--------------------------------------------------------------------------
  def [](number)
    @data[number] ||= Game_Parallax.new(number)
  end
  #--------------------------------------------------------------------------
  # * Iterator
  #--------------------------------------------------------------------------
  def each
    @data.compact.each {|parallax| yield parallax } if block_given?
  end
end

#==============================================================================
# ** Game_Pictures
#------------------------------------------------------------------------------
#  This is a wrapper for a picture array. This class is used within the
# Game_Screen class. Map screen pictures and battle screen pictures are
# handled separately.
#==============================================================================

class Game_Pictures
  # cast to array
  def to_a
    return @data.compact
  end
end


#==============================================================================
# ** Game_Picture
#------------------------------------------------------------------------------
#  Pictures ingame
#==============================================================================

class Game_Picture
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :rm_extender_initialize, :initialize
  alias_method :rm_extender_update,     :update
  alias_method :rm_extender_show,       :show
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor  :number                   # picture index
  attr_accessor  :name                     # filename
  attr_accessor  :origin                   # starting point
  attr_accessor  :x                        # x-coordinate
  attr_accessor  :y                        # y-coordinate
  attr_accessor  :zoom_x                   # x directional zoom rate
  attr_accessor  :zoom_y                   # y directional zoom rate
  attr_accessor  :opacity                  # opacity level
  attr_accessor  :blend_type               # blend method
  attr_accessor  :tone                     # color tone
  attr_accessor  :angle                    # rotation angle
  attr_accessor  :pinned
  attr_accessor  :shake
  attr_accessor  :mirror
  attr_accessor  :wave_amp
  attr_accessor  :wave_speed
  attr_accessor  :duration
  attr_accessor  :scroll_speed_x, :scroll_speed_y
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(number)
    rm_extender_initialize(number)
    clear_effects
  end
  #--------------------------------------------------------------------------
  # * Show Picture
  #--------------------------------------------------------------------------
  def show(name, origin, x, y, zoom_x, zoom_y, opacity, blend_type)
    rm_extender_show(name, origin, x, y, zoom_x, zoom_y, opacity, blend_type)
    clear_effects
  end
  #--------------------------------------------------------------------------
  # * Move Picture
  #--------------------------------------------------------------------------
  def move(origin, x, y, zoom_x, zoom_y, opacity, blend_type, duration, ease=:linear)
    @origin = origin
    @blend_type = blend_type
    set_transition('x', x, duration, ease)
    set_transition('y', y, duration, ease)
    set_transition('zoom_x', zoom_x, duration, ease)
    set_transition('zoom_y', zoom_y, duration, ease)
    set_transition('opacity', opacity, duration, ease)
  end
  #--------------------------------------------------------------------------
  # * Update Picture Move
  #--------------------------------------------------------------------------
  def update_move
    change = [@x, @y, @zoom_x, @zoom_y]
    update_transition('x')
    update_transition('y')
    update_transition('zoom_x')
    update_transition('zoom_y')
    update_transition('opacity')
    update_transition('angle')
    @moving = (change != [@x, @y, @zoom_x, @zoom_y])
  end
  #--------------------------------------------------------------------------
  # * Start Changing Color Tone
  #--------------------------------------------------------------------------
  def start_tone_change(tone, duration, ease=:linear)
    @tone.set_transition('red',   tone.red,   duration, ease)
    @tone.set_transition('green', tone.green, duration, ease)
    @tone.set_transition('blue',  tone.blue,  duration, ease)
    @tone.set_transition('gray',  tone.gray,  duration, ease)
  end
  #--------------------------------------------------------------------------
  # * Update Color Tone Change
  #--------------------------------------------------------------------------
  def update_tone_change
    @tone.update_transition('red')
    @tone.update_transition('green')
    @tone.update_transition('blue')
    @tone.update_transition('gray')
  end
  #--------------------------------------------------------------------------
  # * Clear effects
  #--------------------------------------------------------------------------
  def clear_effects
    @mirror = false
    @wave_amp = @wave_speed = 0
    @pin = false
    @scroll_speed_y = @scroll_speed_x = 2
    clear_shake
  end
  #--------------------------------------------------------------------------
  # * Clear Shake
  #--------------------------------------------------------------------------
  def clear_shake
    @shake_power = 0
    @shake_speed = 0
    @shake_duration = 0
    @shake_direction = 1
    @shake = 0
  end
  #--------------------------------------------------------------------------
  # * Start Shaking
  #     power: intensity
  #     speed: speed
  #--------------------------------------------------------------------------
  def start_shake(power, speed, duration)
    @shake_power = power
    @shake_speed = speed
    @shake_duration = duration
  end
  #--------------------------------------------------------------------------
  # * Update Shake
  #--------------------------------------------------------------------------
  def update_shake
    if @shake_duration > 0 || @shake != 0
      delta = (@shake_power * @shake_speed * @shake_direction) / 10.0
      if @shake_duration <= 1 && @shake * (@shake + delta) < 0
        @shake = 0
      else
        @shake += delta
      end
      @shake_direction = -1 if @shake > @shake_power * 2
      @shake_direction = 1 if @shake < - @shake_power * 2
      @shake_duration -= 1
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    rm_extender_update
    update_shake
  end

  #--------------------------------------------------------------------------
  # * Wave
  #--------------------------------------------------------------------------
  def wave(amp, speed)
    @wave_amp = amp
    @wave_speed = speed
  end

  #--------------------------------------------------------------------------
  # * Flip picture
  #--------------------------------------------------------------------------
  def flip
    self.mirror = !self.mirror
  end

  #--------------------------------------------------------------------------
  # * Blend mode
  #--------------------------------------------------------------------------
  def blend=(mode)
    blend_type = 0
    blend_type = blend if [0,1,2].include?(blend)
    @blend_type = blend_type
  end

  #--------------------------------------------------------------------------
  # * Pin picture
  #--------------------------------------------------------------------------
  def pin
    @pinned = true
  end

  #--------------------------------------------------------------------------
  # * Unpin picture
  #--------------------------------------------------------------------------
  def unpin
    @pinned = false
  end

  #--------------------------------------------------------------------------
  # * Picture is in movement
  #--------------------------------------------------------------------------
  def move?
    @moving
  end

end

#==============================================================================
# ** Plane_Parallax
#------------------------------------------------------------------------------
#  This plane is used to display parallaxes.
#==============================================================================

class Plane_Parallax < Plane
  #--------------------------------------------------------------------------
  # * Object initialization
  #--------------------------------------------------------------------------
  def initialize(parallax)
    super()
    @parallax = parallax
    @scroll_x = @scroll_y = 0
    update
  end
  #--------------------------------------------------------------------------
  # * update bitmap
  #--------------------------------------------------------------------------
  def update
    if @parallax.name.empty?
      self.bitmap = nil
    else
      self.bitmap = Cache.parallax(@parallax.name)
      update_zoom
      update_scroll_dimension
      update_position
      update_other
    end
  end
  #--------------------------------------------------------------------------
  # * update scroll dimension
  #--------------------------------------------------------------------------
  def update_scroll_dimension
    @scroll_width = self.bitmap.width * self.zoom_x
    @scroll_height = self.bitmap.height * self.zoom_y
  end
  #--------------------------------------------------------------------------
  # * update position
  #--------------------------------------------------------------------------
  def update_position
    x_s = 16 * @parallax.move_x
    y_s = 16 * @parallax.move_y
    self.z = @parallax.z
    @scroll_x = (@scroll_x + @parallax.autospeed_x) % @scroll_width
    @scroll_y = (@scroll_y + @parallax.autospeed_y) % @scroll_height
    self.ox = @scroll_x + ($game_map.display_x * x_s)
    self.oy = @scroll_y + ($game_map.display_y * y_s)
  end
  #--------------------------------------------------------------------------
  # * update zoom
  #--------------------------------------------------------------------------
  def update_zoom
    self.zoom_x = @parallax.zoom_x / 100.0
    self.zoom_y = @parallax.zoom_y / 100.0
  end
  #--------------------------------------------------------------------------
  # * update others
  #--------------------------------------------------------------------------
  def update_other
    self.opacity = @parallax.opacity
    self.blend_type = @parallax.blend_type
    self.tone.set(@parallax.tone)
  end
end

#==============================================================================
# ** Spriteset_Map
#------------------------------------------------------------------------------
#  This class brings together map screen sprites, tilemaps, etc. It's used
# within the Scene_Map class.
#==============================================================================

class Spriteset_Map
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :rme_initialize, :initialize
  alias_method :rme_dispose, :dispose
  alias_method :rme_update,  :update
  alias_method :rm_extender_create_parallax, :create_parallax
  alias_method :rm_extender_dispose_parallax, :dispose_parallax
  alias_method :rm_extender_update_parallax, :update_parallax
  alias_method :rm_extender_create_chars, :create_characters

  #--------------------------------------------------------------------------
  # * Public instances variables
  #--------------------------------------------------------------------------
  attr_accessor :picture_sprites
  attr_accessor :character_sprites
  attr_accessor :tilemap
  #--------------------------------------------------------------------------
  # * Constructor
  #--------------------------------------------------------------------------
  def initialize
    create_texts
    rme_initialize
  end
  #--------------------------------------------------------------------------
  # * Create Reflect
  #--------------------------------------------------------------------------
  def create_reflects
    @reflect_sprites = []
    return 
    return if not $game_map.use_reflection
    cases = $game_map.reflection_properties[:cases] || {}
    $game_map.events.values.each do |event|
      push_reflect(event.id, event)
    end
    i = 0
    $game_map.vehicles.each do |vehicle|
      id = [:vehicle, i]
      push_reflect(id, vehicle)
      i += 1
    end
    i = 0
    $game_player.followers.reverse_each do |follower|
      id =  [:vehicle, i]
      push_reflect(id, follower)
      i += 1
    end
    push_reflect(0, $game_player)
  end

  def push_reflect(id, char)
    return unless char || !char.visible?
    cases = $game_map.reflection_properties[:cases] || {}
    case_for_id = cases[id]
    return if case_for_id == :ignored
    return @reflect_sprites.push(Sprite_Reflect.new(@viewport1, char, id, case_for_id)) if case_for_id
    cases = $game_map.reflection_properties[:triggered_cases] || []
    specifics = cases.reduce({}) do |accumulator, elt|
      if elt[0].call(id)
        if accumulator == :ignored || elt[1] == :ignored 
          :ignored
        else
          accumulator.merge(elt[1])
        end
      else 
        accumulator
      end
    end
    return if specifics == :ignored
    @reflect_sprites.push(Sprite_Reflect.new(@viewport1, char, id, specifics))
  end


  #--------------------------------------------------------------------------
  # * Create Character Sprite
  #--------------------------------------------------------------------------
  def create_characters
    rm_extender_create_chars
    @character_sprites.each.with_index do |c, i|
      c.character.sprite_index = i
    end
     create_reflects
  end

  #--------------------------------------------------------------------------
  # * Text creation
  #--------------------------------------------------------------------------
  def create_texts
    @text_sprites = Array.new
  end
  #--------------------------------------------------------------------------
  # * Free
  #--------------------------------------------------------------------------
  def dispose
    rme_dispose
    dispose_texts
    dispose_reflects
  end
  #--------------------------------------------------------------------------
  # * Dispose reflects
  #--------------------------------------------------------------------------
  def dispose_reflects
    @reflect_sprites.each {|sprite| sprite.update }
  end
  #--------------------------------------------------------------------------
  # * Free text
  #--------------------------------------------------------------------------
  def dispose_texts
    @text_sprites.compact.each {|t| t.dispose }
  end
  #--------------------------------------------------------------------------
  # * Update frame
  #--------------------------------------------------------------------------
  def update
    update_texts
    rme_update
    update_reflects
  end
  #--------------------------------------------------------------------------
  # * Update Reflects
  #--------------------------------------------------------------------------
  def update_reflects
    @reflect_sprites.each {|sprite| sprite.update }
  end

  #--------------------------------------------------------------------------
  # * Modification des texts
  #--------------------------------------------------------------------------
  def update_texts
    Game_Screen.get.texts.each do |txt|
      @text_sprites[txt.number] ||= Sprite_Text.new(@viewport2, txt)
      @text_sprites[txt.number].update
    end
  end
  #--------------------------------------------------------------------------
  # * Create Parallax
  #--------------------------------------------------------------------------
  def create_parallax
    @parallaxes_plane = []
    rm_extender_create_parallax
  end
  #--------------------------------------------------------------------------
  # * Free Parallax
  #--------------------------------------------------------------------------
  def dispose_parallax
    @parallaxes_plane.compact.each {|parallax| parallax.dispose}
    rm_extender_dispose_parallax
  end
  #--------------------------------------------------------------------------
  # * Update Parallax
  #--------------------------------------------------------------------------
  def update_parallax
    $game_map.parallaxes.each do |parallax|
      @parallaxes_plane[parallax.id] ||= Plane_Parallax.new(parallax)
      @parallaxes_plane[parallax.id].update
    end
    rm_extender_update_parallax
  end
end

#==============================================================================
# ** Sprite_Picture
#------------------------------------------------------------------------------
#  Sprite picture InGame
#==============================================================================

class Sprite_Picture
  #--------------------------------------------------------------------------
  # * Get cache
  #--------------------------------------------------------------------------
  def swap_cache

    name = @picture.name

    if name == :screenshot
      return self.bitmap if @old_snap
      @old_snap = true
      return Graphics.snap_to_bitmap.clone 
    end

    @old_snap = false
    if /^(\/Pictures|Pictures)\/(.*)/ =~ name
      return Cache.picture($2)
    end
    if /^(\/Battlers|Battlers)\/(.*)/ =~ name
      return Cache.battler($2, 0)
    end
    if /^(\/Battlebacks1|Battlebacks1)\/(.*)/ =~ name
      return Cache.battleback1($2)
    end
    if /^(\/Battlebacks2|Battlebacks2)\/(.*)/ =~ name
      return Cache.battleback2($2)
    end
    if /^(\/Parallaxes|Parallaxes)\/(.*)/ =~ name
      return Cache.parallax($2)
    end
    if /^(\/Titles1|Titles1)\/(.*)/ =~ name
      return Cache.title1($2)
    end
    if /^(\/Titles2|Titles2)\/(.*)/ =~ name
      return Cache.title2($2)
    end
    return Cache.picture(name)
  end
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :rm_extender_update, :update
  alias_method :rm_extender_update_origin, :update_origin

  #--------------------------------------------------------------------------
  # * Update Transfer Origin Bitmap
  #--------------------------------------------------------------------------
  def update_bitmap
    if @picture.name.empty?
      self.bitmap = nil
    else
      self.bitmap = swap_cache
      self.mirror = false
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    rm_extender_update
    self.mirror = @picture.mirror if @picture.mirror != self.mirror
    self.wave_amp = @picture.wave_amp if @picture.wave_amp != self.wave_amp
    self.wave_speed = @picture.wave_speed if @picture.wave_speed != self.wave_speed
  end
  #--------------------------------------------------------------------------
  # * Update Position
  #--------------------------------------------------------------------------
  def update_position
    if @picture.pinned
      x_s = 16 * @picture.scroll_speed_x
      y_s = 16 * @picture.scroll_speed_y
      self.x = @picture.x - ($game_map.display_x * x_s) + @picture.shake
      self.y = @picture.y - ($game_map.display_y * y_s)
    else
      self.x = @picture.x + @picture.shake
      self.y = @picture.y
    end
    self.z = @picture.number
  end
  #--------------------------------------------------------------------------
  # * Update Origin
  #--------------------------------------------------------------------------
  def update_origin
    return unless bitmap || disposed?
    if @picture.origin.is_a?(Array)
      k_x, k_y = @picture.origin
      self.ox, self.oy = k_x, k_y
    else
      rm_extender_update_origin
    end
  end
end

#==============================================================================
# ** Game_Actor
#------------------------------------------------------------------------------
#  This class handles actors. It is used within the Game_Actors class
# ($game_actors) and is also referenced from the Game_Party class ($game_party).
#==============================================================================

class Game_Actor
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor   :character_name           # character graphic filename
  attr_accessor   :character_index          # character graphic index
  attr_accessor   :face_name                # face graphic filename
  attr_accessor   :face_index               # face graphic index
end

#==============================================================================
# ** Game_Event
#------------------------------------------------------------------------------
#  This class handles events. Functions include event page switching via
# condition determinants and running parallel process events. Used within the
# Game_Map class.
#==============================================================================

class Game_Event
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :rm_extender_conditions_met?,  :conditions_met?
  attr_accessor :erased
  attr_accessor :trigger
  alias_method :erased?, :erased
  alias_method :rme_setup_page_settings, :setup_page_settings
  #--------------------------------------------------------------------------
  # * Event Page Setup
  #--------------------------------------------------------------------------
  def setup_page_settings
    rme_setup_page_settings
    restore_oxy
  end
  #--------------------------------------------------------------------------
  # * Determine if Event Page Conditions Are Met
  #--------------------------------------------------------------------------
  def conditions_met?(page)
    value = rm_extender_conditions_met?(page)
    first = first_is_trigger?(page)
    if first.is_a?(Array)
      return first[0].(@event.id)
    end
    return value unless first
    return value && first.(@event.id)
  end
  #--------------------------------------------------------------------------
  # * Determine if the first command is a Trigger
  #--------------------------------------------------------------------------
  def first_is_trigger?(page)
    return false unless page || page.list || page.list[0]
    return false unless page.list[0].code == 355
    script = page.list[0].parameters[0] + "\n"
    index = 1
    while page.list[index].code == 655
      script += page.list[index].parameters[0] + "\n"
      index += 1
    end
    if script =~ /^\s*(trigger|listener)/
      script = script.gsub(/S(V|S)\[(\d+)\]/) { "S#{$1}[#{@id}, #{$2}]" }
      potential_trigger = eval(script)
      return potential_trigger if potential_trigger.is_a?(Proc)
    elsif script =~ /^\s*(ignore_left)/
      script = script.gsub(/S(V|S)\[(\d+)\]/) { "S#{$1}[#{@id}, #{$2}]" }
      potential_trigger = eval(script)
      return [potential_trigger, :ign] if potential_trigger.is_a?(Proc)
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Get event name
  #--------------------------------------------------------------------------
  def name
    @event.name
  end

end

#==============================================================================
# ** Game_Interpreter
#------------------------------------------------------------------------------
#  An interpreter for executing event commands. This class is used within the
# Game_Map, Game_Troop, and Game_Event classes.
#==============================================================================

class Game_Interpreter
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self

    #--------------------------------------------------------------------------
    # * Public instances variables
    #--------------------------------------------------------------------------
    attr_accessor :current_id
    attr_accessor :current_map_id

    #--------------------------------------------------------------------------
    # * Get page
    #--------------------------------------------------------------------------
    def get_page(map_id, event_id, page_id)
      if map_id != $game_map.map_id
        if !Game_Temp.cached_map || Game_Temp.cached_map[0] != map_id
          Game_Temp.cached_map =
            [map_id, load_data(sprintf("Data/Map%03d.rvdata2", map_id))]
        end
        map = Game_Temp.cached_map[1]
      else
        map = $game_map.map
      end
      return unless map
      event = map.events[event_id]
      return unless event
      page = event.pages[page_id-1]
      return unless page
      return page
    end

    #--------------------------------------------------------------------------
    # * Determine if Event Page Conditions Are Met For a Particular Event
    #--------------------------------------------------------------------------
    def conditions_met?(map_id, event_id, page)
      c = page.condition
      if c.switch1_valid
        return false unless $game_switches[c.switch1_id]
      end
      if c.switch2_valid
        return false unless $game_switches[c.switch2_id]
      end
      if c.variable_valid
        return false if $game_variables[c.variable_id] < c.variable_value
      end
      if c.self_switch_valid
        key = [map_id, event_id, c.self_switch_ch]
        return false if $game_self_switches[key] != true
      end
      if c.item_valid
        item = $data_items[c.item_id]
        return false unless $game_party.has_item?(item)
      end
      if c.actor_valid
        actor = $game_actors[c.actor_id]
        return false unless $game_party.members.include?(actor)
      end
      return true
    end

  end
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  def me; @event_id; end
  alias_method :extender_command_101, :command_101
  alias_method :extender_command_111, :command_111
  alias_method :extender_command_105, :command_105
  alias_method :extender_command_355, :command_355
  alias_method :extender_command_117, :command_117

  #--------------------------------------------------------------------------
  # * Show Text
  #--------------------------------------------------------------------------
  def command_101
    $game_message.call_event = @event_id
    extender_command_101
  end
  #--------------------------------------------------------------------------
  # * Show Scrolling Text
  #--------------------------------------------------------------------------
  def command_105
    $game_message.call_event = @event_id
    extender_command_105
  end
  #--------------------------------------------------------------------------
  # * Append Interpreter
  #--------------------------------------------------------------------------
  def append_interpreter(page)
    list = page.list
    child = Game_Interpreter.new(@depth + 1)
    child.setup(list, same_map? ? @event_id : 0)
    child.run
  end
  #--------------------------------------------------------------------------
  # * Conditional Branch
  #--------------------------------------------------------------------------
  def command_111
    Game_Interpreter.current_id = @event_id
    Game_Interpreter.current_map_id = @map_id
    extender_command_111
  end
  #--------------------------------------------------------------------------
  # * Script
  #--------------------------------------------------------------------------
  def command_355
    Game_Interpreter.current_id = @event_id
    Game_Interpreter.current_map_id = @map_id
    script = @list[@index].parameters[0] + "\n"
    while next_event_code == 655
      @index += 1
      script += @list[@index].parameters[0] + "\n"
    end
    script = script.gsub(/S(V|S)\[(\d+)\]/) { "S#{$1}[#{@event_id}, #{$2}]" }
    eval(script)
  end
  #--------------------------------------------------------------------------
  # * Common Event
  #--------------------------------------------------------------------------
  def command_117
    return if $data_common_events[@params[0]].for_battle?
    extender_command_117
  end
  #--------------------------------------------------------------------------
  # * Execute code
  #--------------------------------------------------------------------------
  def exec(&block)
    self.instance_eval(&block)
  end
  #--------------------------------------------------------------------------
  # * Add command API
  #--------------------------------------------------------------------------
  include_commands
  #--------------------------------------------------------------------------
  # * Get Binding
  #--------------------------------------------------------------------------
  def get_binding; binding; end
end

#==============================================================================
# ** UI
#------------------------------------------------------------------------------
# Minimalist UI
#==============================================================================

module UI

  #==============================================================================
  # ** Abstract_Textfield
  #------------------------------------------------------------------------------
  # Abstract text field representation
  #==============================================================================

  class Abstract_Textfield < Window_Base

    #--------------------------------------------------------------------------
    # * Public instance variables
    #--------------------------------------------------------------------------
    attr_accessor :profile
    alias_method :active?, :active
    attr_accessor :range

    #--------------------------------------------------------------------------
    # * Restrict int
    #--------------------------------------------------------------------------
    def restrict(x, r, m=:to_i)
      [[r.min, x.send(m)].max, r.max].min
    end

    #--------------------------------------------------------------------------
    # * Constructor
    #--------------------------------------------------------------------------
    def initialize(x, y, w, t, profile, range = false)
      @menu_disabled = $game_system.menu_disabled
      @raw_w = w
      @profile = get_fieldProfile(profile)
      @text = t
      @range = range
      super(x, y, w, @profile.height)
      init_basic
      refresh
    end

    #--------------------------------------------------------------------------
    # * Basic initialize
    #--------------------------------------------------------------------------
    def init_basic
      @old_text = @text.dup
      self.arrows_visible = false
      self.padding = @profile.padding
      self.padding_bottom = @profile.padding_bottom
      self.active = false
    end

    #--------------------------------------------------------------------------
    # * Bitmap initialize
    #--------------------------------------------------------------------------
    def init_bitmap
      self.contents = Bitmap.new(@raw_w-8, @profile.height-8)
      @align = @profile.alignement%3
      self.contents.font = get_profile(@profile.text_profile).to_font
      self.tone.set(@profile.get_tone)
    end

    #--------------------------------------------------------------------------
    # * Refresh bitmap
    #--------------------------------------------------------------------------
    def refresh
      self.contents.clear
      init_bitmap
      w, h = self.contents.width, self.contents.height
      self.contents.draw_text(0, 0, w, h, @text, @align)
    end

    #--------------------------------------------------------------------------
    # * Frame update
    #--------------------------------------------------------------------------
    def update
      super
      self.tone.set(@profile.get_tone)
      @text = @text[0...@text.length-1] || "" if Keyboard.repeat?(:backspace)
      if @old_text != @text
        refresh
        @old_text = @text.dup
      end
    end

    #--------------------------------------------------------------------------
    # * Set profile
    #--------------------------------------------------------------------------
    def profile=(pr)
      @profile =  get_fieldProfile(pr)
      refresh
    end

    #--------------------------------------------------------------------------
    # * Activate
    #--------------------------------------------------------------------------
    def activate
      @menu_disabled = $game_system.menu_disabled
      $game_system.menu_disabled = true
      return super
    end

    #--------------------------------------------------------------------------
    # * unActivate
    #--------------------------------------------------------------------------
    def deactivate
      $game_system.menu_disabled = @menu_disabled
      return super
    end

    #--------------------------------------------------------------------------
    # * Dispose
    #--------------------------------------------------------------------------
    def dispose
      $game_system.menu_disabled = @menu_disabled
      super
    end

    #--------------------------------------------------------------------------
    # * Get text value
    #--------------------------------------------------------------------------
    def value; @text; end

    #--------------------------------------------------------------------------
    # * point include in textfield
    #--------------------------------------------------------------------------
    def in?(x, y)
      check_x = x.between?(self.x, self.x+self.width)
      check_y = y.between?(self.y, self.y+self.height)
      check_x && check_y
    end

  end

  #==============================================================================
  # ** Window_Textfield
  #------------------------------------------------------------------------------
  # Text field representation
  #==============================================================================

  class Window_Textfield < Abstract_Textfield

    #--------------------------------------------------------------------------
    # * Constructor
    #--------------------------------------------------------------------------
    def initialize(x, y, w, t, profile, range = false)
      range = (range.is_a?(Fixnum) && range > 0) ? range : false
      t = t[0..range-1] if range
      super(x, y, w, t, profile, range)
    end

    #--------------------------------------------------------------------------
    # * Value
    #--------------------------------------------------------------------------
    def value=(t)
      t = t[0..range-1] if range
      @text = t
    end

    #--------------------------------------------------------------------------
    # * Frame update
    #--------------------------------------------------------------------------
    def update
      return unless active?
      return if Keyboard.press?(:enter)
      @text << Keyboard.current_char
      self.value = @text
      super
    end

  end

  #==============================================================================
  # ** Window_IntField
  #------------------------------------------------------------------------------
  # Text field representation
  #==============================================================================

  class Window_Intfield < Abstract_Textfield
    #--------------------------------------------------------------------------
    # * Constructor
    #--------------------------------------------------------------------------
    def initialize(x, y, w, t, profile, range = false)
      range = (range.is_a?(Range)) ? range : false
      t = restrict(t, range) if range
      super(x, y, w, t.to_i.to_s, profile, range)
    end
    #--------------------------------------------------------------------------
    # * Get the input value
    #--------------------------------------------------------------------------
    def value; super.to_i; end
    #--------------------------------------------------------------------------
    # * Set the value
    #--------------------------------------------------------------------------
    def value=(text)
      if text == "+" || text == "-"
        @text = text
        return
      end
      text = restrict(text, range) if range
      @text = text.to_i.to_s
    end
    #--------------------------------------------------------------------------
    # * Update
    #--------------------------------------------------------------------------
    def update
      return unless active?
      super
      letter = Keyboard.current_char
      return unless (["+","-"] + ("0".."9").to_a).include?(letter)
      return if @text != "" && ["+","-"].include?(letter)
      @text << letter
      self.value = @text
    end
  end

  #==============================================================================
  # ** Window_Floatfield
  #------------------------------------------------------------------------------
  # Text field representation
  #==============================================================================

  class Window_Floatfield < Abstract_Textfield
    #--------------------------------------------------------------------------
    # * Constructor
    #--------------------------------------------------------------------------
    def initialize(x, y, w, t, profile, range = false)
      range = (range.is_a?(Range)) ? range : false
      t = restrict(t, range, :to_f) if range
      super(x, y, w, t.to_f.to_s, profile, range)
    end
    #--------------------------------------------------------------------------
    # * Get the input value
    #--------------------------------------------------------------------------
    def value; super.to_f; end
    #--------------------------------------------------------------------------
    # * Set the value
    #--------------------------------------------------------------------------
    def value=(text)
      if text == "+" || text == "-" || text == "."
        @text = text
        return
      end
      text = restrict(text, range, :to_f) if range && must_restrict?(text)
      @text = text.to_s
    end
    #--------------------------------------------------------------------------
    # * Must restriction process
    #--------------------------------------------------------------------------
    def must_restrict?(text)
      return true if text == "+" || text == "-" || text == "."
      return text.to_f < range.min || text.to_f > range.max
    end
    #--------------------------------------------------------------------------
    # * Update
    #--------------------------------------------------------------------------
    def update
      return unless active?
      super
      letter = Keyboard.current_char
      return unless (["+","-", "."] + ("0".."9").to_a).include?(letter)
      return if @text != "" && ["+","-"].include?(letter)
      return if letter == "." && @text.count(".") == 1
      @text << letter
      return if letter == "."
      self.value = @text
    end
  end

end

#==============================================================================
# ** Scene_End
#------------------------------------------------------------------------------
#  This class performs game over screen processing.
#==============================================================================

class Scene_End

  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :evex_command_to_title, :command_to_title
  #--------------------------------------------------------------------------
  # * [Go to Title] Command
  #--------------------------------------------------------------------------
  def command_to_title
    data = skip_title_data
    if !data.activate || !map_exists?(data.map_id)
      evex_command_to_title
      return
    end
    close_command_window
    fadeout_all
    SceneManager.run
  end

end

#==============================================================================
# ** Battle_Context
#------------------------------------------------------------------------------
#  Define a battle context for build your own CBS !
# Work in progress DUUUDE
#==============================================================================

class Battle_Context

  #--------------------------------------------------------------------------
  # * Public instance members
  #--------------------------------------------------------------------------
  attr_reader :troop_id
  attr_reader :can_escape, :can_lose
  alias_method :can_escape?, :can_escape
  alias_method :can_lose?, :can_lose

  #--------------------------------------------------------------------------
  # * Object builder
  #--------------------------------------------------------------------------
  def initialize(troop_id, can_escape, can_lose)
    @troop_id = troop_id
    @can_escape = can_escape
    @can_lose = can_lose
    make_escape_ratio
  end


  #--------------------------------------------------------------------------
  # * Escape ratio
  #--------------------------------------------------------------------------
  def make_escape_ratio
    @escape_ratio = 1.5 - 1.0 * troop.agi / $game_party.agi
  end

  #--------------------------------------------------------------------------
  # * Get troop
  #--------------------------------------------------------------------------
  def troop
    $data_troop[@troop_id]
  end

end

#==============================================================================
# ** Pathfinder
#------------------------------------------------------------------------------
#  Path finder module. A* Algorithm
#==============================================================================

module Pathfinder
  #--------------------------------------------------------------------------
  # * Constants
  #--------------------------------------------------------------------------
  Goal = Struct.new(:x, :y)
  ROUTE_MOVE_DOWN = 1
  ROUTE_MOVE_LEFT = 2
  ROUTE_MOVE_RIGHT = 3
  ROUTE_MOVE_UP = 4
  #--------------------------------------------------------------------------
  # * Definition of a point
  #--------------------------------------------------------------------------
  class Point
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_accessor :x, :y, :g, :h, :f, :parent, :goal
    #--------------------------------------------------------------------------
    # * Object initialize
    #--------------------------------------------------------------------------
    def initialize(x, y, p, goal = Goal.new(0,0))
      @goal = goal
      @x, @y, @parent = x, y, p
      self.score(@parent)
    end
    #--------------------------------------------------------------------------
    # * get an Id from the X and Y coord
    #--------------------------------------------------------------------------
    def id; "#{@x}-#{@y}"; end
    #--------------------------------------------------------------------------
    # * Calculate score
    #--------------------------------------------------------------------------
    def score(parent)
      if !parent
        @g = 0
      elsif !@g || @g > parent.g + 1
        @g = parent.g + 1
        @parent = parent
      end
      @h = (@x - @goal.x).abs + (@y - @goal.y).abs
      @f = @g + @h
    end
    #--------------------------------------------------------------------------
    # * Cast to move_command
    #--------------------------------------------------------------------------
    def to_move
      return nil unless @parent
      return RPG::MoveCommand.new(2) if @x < @parent.x
      return RPG::MoveCommand.new(3) if @x > @parent.x
      return RPG::MoveCommand.new(4) if @y < @parent.y
      return RPG::MoveCommand.new(1) if @y > @parent.y
      return nil
    end
  end
  #--------------------------------------------------------------------------
  # * singleton
  #--------------------------------------------------------------------------
  extend self
  #--------------------------------------------------------------------------
  # * Id Generation
  #--------------------------------------------------------------------------
  def id(x, y); "#{x}-#{y}"; end
  #--------------------------------------------------------------------------
  # * Check the passability
  #--------------------------------------------------------------------------
  def passable?(e, x, y, dir, s = false);
    if s and e.through
      return $game_map.passable?(x, y, dir)
    end
    e.passable?(x, y, dir)
  end
  #--------------------------------------------------------------------------
  # * Check closed_list
  #--------------------------------------------------------------------------
  def has_key?(x, y, l)
    l.has_key?(id(x, y))
  end
  #--------------------------------------------------------------------------
  # * Create a path
  #--------------------------------------------------------------------------
  def create_path(goal, event, no_through = false)
    open_list, closed_list = Hash.new, Hash.new
    current = Point.new(event.x, event.y, nil, goal)
    open_list[current.id] = current
    while !has_key?(goal.x, goal.y, closed_list)&& !open_list.empty?
      current = open_list.values.min{|point1, point2|point1.f <=> point2.f}
      open_list.delete(current.id)
      closed_list[current.id] = current
      args = current.x, current.y+1
      if passable?(event, current.x, current.y, 2, no_through) && !has_key?(*args, closed_list)
        if !has_key?(*args, open_list)
          open_list[id(*args)] = Point.new(*args, current, goal)
        else
          open_list[id(*args)].score(current)
        end
      end
      args = current.x-1, current.y
      if passable?(event, current.x, current.y, 4, no_through) && !has_key?(*args, closed_list)
        if !has_key?(*args, open_list)
          open_list[id(*args)] = Point.new(*args, current, goal)
        else
          open_list[id(*args)].score(current)
        end
      end
      args = current.x+1, current.y
      if passable?(event, current.x, current.y, 4, no_through) && !has_key?(*args, closed_list)
        if !has_key?(*args, open_list)
          open_list[id(*args)] = Point.new(*args, current, goal)
        else
          open_list[id(*args)].score(current)
        end
      end
      args = current.x, current.y-1
      if passable?(event, current.x, current.y, 2, no_through) && !has_key?(*args, closed_list)
        if !has_key?(*args, open_list)
          open_list[id(*args)] = Point.new(*args, current, goal)
        else
          open_list[id(*args)].score(current)
        end
      end
    end
    move_route = RPG::MoveRoute.new
    if has_key?(goal.x, goal.y, closed_list)
      current = closed_list[id(goal.x, goal.y)]
      while current
        move_command = current.to_move
        move_route.list = [move_command] + move_route.list if move_command
        current = current.parent
      end
    end
    move_route.skippable = true
    move_route.repeat = false
    return move_route
  end
end

#==============================================================================
# ** DataManager
#------------------------------------------------------------------------------
# Data of save manager
#==============================================================================

module DataManager
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    #--------------------------------------------------------------------------
    # * Alias
    #--------------------------------------------------------------------------
    alias_method :rm_extender_create_game_objects, :create_game_objects
    alias_method :rm_extender_make_save_contents, :make_save_contents
    alias_method :rm_extender_extract_save_contents, :extract_save_contents
    #--------------------------------------------------------------------------
    # * Creates the objects of the game
    #--------------------------------------------------------------------------
    def create_game_objects
      rm_extender_create_game_objects
      $game_self_vars = Hash.new
      $game_labels = Hash.new
      $game_self_labels = Hash.new
    end
    #--------------------------------------------------------------------------
    # * Saves the contents of the game
    #--------------------------------------------------------------------------
    def make_save_contents
      contents = rm_extender_make_save_contents
      contents[:self_vars] = $game_self_vars
      contents[:labels] = $game_labels
      contents[:self_labels] = $game_self_labels
      contents
    end
    #--------------------------------------------------------------------------
    # * Load a save
    #--------------------------------------------------------------------------
    def extract_save_contents(contents)
      rm_extender_extract_save_contents(contents)
      $game_self_vars = contents[:self_vars]
      $game_labels = contents[:labels]
      $game_self_labels = contents[:self_labels]
    end
    #--------------------------------------------------------------------------
    # * Export Data
    #--------------------------------------------------------------------------
    def export(index)
      datas = Hash.new
      File.open(make_filename(index), "rb") do |file|
        Marshal.load(file)
        contents = Marshal.load(file)
        game_system             = contents[:system]
        game_timer              = contents[:timer]
        game_message            = contents[:message]
        datas[:switches]        = contents[:switches]
        datas[:variables]       = contents[:variables]
        datas[:self_switches]   = contents[:self_switches]
        game_actors             = contents[:actors]
        game_party              = contents[:party]
        game_troop              = contents[:troop]
        game_map                = contents[:map]
        game_player             = contents[:player]
        datas[:self_vars]       = contents[:self_vars]
        datas[:labels]          = contents[:labels]
        datas[:self_labels]     = contents[:self_labels]
      end
      return datas
    end

  end
end

#==============================================================================
# ** SceneManager
#------------------------------------------------------------------------------
#  This module manages scene transitions. For example, it can handle
# hierarchical structures such as calling the item screen from the main menu
# or returning from the item screen to the main menu.
#==============================================================================

module SceneManager
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    #--------------------------------------------------------------------------
    # * Alias
    #--------------------------------------------------------------------------
    alias_method :skip_ee_run, :run
    #--------------------------------------------------------------------------
    # * Run game
    #--------------------------------------------------------------------------
    def run
      Game_Temp.in_game = true
      DataManager.init_cst_db
      data = skip_title_data
      if !data.activate || !map_exists?(data.map_id)
        skip_ee_run
        return
      end
      DataManager.init
      Audio.setup_midi if use_midi?
      DataManager.create_game_objects
      $game_party.setup_starting_members
      $game_map.setup(data.map_id)
      $game_map.autoplay
      $game_player.moveto(data.x, data.y)
      $game_player.refresh
      goto(Scene_Map)
      scene.main while scene
    end
  end
end

#==============================================================================
# ** ScreenEffects
#------------------------------------------------------------------------------
#  This module manages screen effects like zoom, blur, pixelation, etc.
#==============================================================================

module ScreenEffects

  #--------------------------------------------------------------------------
  # * Screen into sprite
  #--------------------------------------------------------------------------
  class Screen < Sprite

    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_accessor :pixelation, :zoom, :zoom_target_x, :zoom_target_y,
    :motion_blur, :focus_event, :blur, :blur_step
    #--------------------------------------------------------------------------
    # * Object initialize
    #--------------------------------------------------------------------------
    def initialize
      super
      self.viewport = Viewport.new
      self.viewport.z = 100
      @zoom = 100
      @pixelation  = 1
      @motion_blur = 0
      @blur = 0
      @blur_step = 1
      @gaussian_curve = Hash.new
      @focus_event = true
      @capture_rect = Rect.new
      @display_rect  = Rect.new
    end
    #--------------------------------------------------------------------------
    # * Frame update
    #--------------------------------------------------------------------------
    def update
      return if disposed?
      update_transitions
      if !SceneManager.scene_is?(Scene_Map) || [@blur, @motion_blur, @pixelation, @zoom] == [0, 0, 1, 100]
        return self.visible = false
      end
      update_zoom_target
      update_capture_rect
      update_pixelation
      update_bitmap
    end
    #--------------------------------------------------------------------------
    # * Update transition
    #--------------------------------------------------------------------------
    def update_transitions
      update_transition('blur')
      update_transition('motion_blur')
      update_transition('pixelation')
      update_transition('zoom')
      unless @focus_event
        update_transition('zoom_target_x')
        update_transition('zoom_target_y')
      end
    end
    #--------------------------------------------------------------------------
    # * Update zoom target
    #--------------------------------------------------------------------------
    def update_zoom_target
      if @focus_event
        @zoom_target_x = $game_map.target_camera.screen_x
        @zoom_target_y = $game_map.target_camera.screen_y
      end
    end
    #--------------------------------------------------------------------------
    # * Portion to capture, depending of zoom processing
    #--------------------------------------------------------------------------
    def update_capture_rect
      @zoom = [100, @zoom].max
      tx, ty = @zoom_target_x, @zoom_target_y
      f = @zoom / 100.0
      w = (Graphics.width / f).to_i
      h = (Graphics.height / f).to_i
      x = (tx - w / 2.0).to_i.bound(0, Graphics.width  - w)
      y = (ty - h / 2.0).to_i.bound(0, Graphics.height - h)
      @capture_rect.set(x, y, w, h)
    end
    #--------------------------------------------------------------------------
    # * Pixelates the screen
    #--------------------------------------------------------------------------
    def update_pixelation
      @blur = [0, @blur].max
      pix = @forced_pixelation = [@pixelation, @blur>5?2:1, @blur>25?3:1].max
      if pix != @pixelation_old
        w = Graphics.width  / pix.to_i
        h = Graphics.height / pix.to_i
        self.zoom_x = Graphics.width.to_f  / w
        self.zoom_y = Graphics.height.to_f / h
        current = bitmap.clone if bitmap
        self.bitmap = Bitmap.new(w, h)
        @pixelation_old = pix
        @display_rect.set(0, 0, w, h)
        self.bitmap.stretch_blt(@display_rect, current, current.rect) if current
      end
    end
    #--------------------------------------------------------------------------
    # * Updates the bitmap
    #--------------------------------------------------------------------------
    def update_bitmap
      visible_windows = collect_visible_windows
      visible_windows.each {|w| w.visible = false}
      o = 255 - [@motion_blur, @blur*3].max.to_i.bound(0, 255)
      self.visible = false
      self.bitmap.stretch_blt(@display_rect, Graphics.snap_to_bitmap, @capture_rect, o)
      self.bitmap.gaussian_blur(@blur/@forced_pixelation, @blur_step/@forced_pixelation)
      self.visible = true
      visible_windows.each {|w| w.visible = true }
    end
    #--------------------------------------------------------------------------
    # * Collects all visible windows
    #--------------------------------------------------------------------------
    def collect_visible_windows
      scene = SceneManager.scene
      scene.instance_variables.collect do |varname|
        scene.instance_variable_get(varname)
      end.select do |ivar|
        ivar.is_a?(Window) && !ivar.disposed? && ivar.visible
      end
    end

  end
end

#==============================================================================
# ** Graphics
#------------------------------------------------------------------------------
#  The module that carries out graphics processing.
#==============================================================================

module Graphics
  class << self
    #--------------------------------------------------------------------------
    # * Alias
    #--------------------------------------------------------------------------
    alias_method :rme_screen_effect_update, :update
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_accessor :screen
    #--------------------------------------------------------------------------
    # * Frame update
    #--------------------------------------------------------------------------
    def update
      @screen = ScreenEffects::Screen.new if @screen.nil? || @screen.disposed?
      @screen.update
      rme_screen_effect_update
    end
  end
end

# -*- coding: utf-8 -*-
#==============================================================================
# ** RME Commands
#------------------------------------------------------------------------------
#  With :
# Grim (original project)
# Nuki
# Raho
#  Help :
# Fabien
# Zeus81
# Joke
# Zangther
# Spyrojojo
#------------------------------------------------------------------------------
# Commands API
# Provide all commands of the EvEx
#==============================================================================

module RMECommands

  #--------------------------------------------------------------------------
  # * Public Commands
  #--------------------------------------------------------------------------

  def game_window_rect
    rect = [0,0,0,0].pack('l4')
    Externlib::GetWindowRect.call(HWND, rect)
    args = rect.unpack('l4')
    return ::Rect.new(*args)
  end

  def fadeout(time = 100)
    RPG::BGM.fade(time)
    RPG::BGS.fade(time)
    RPG::ME.fade(time)
    Graphics.fadeout(time * Graphics.frame_rate / 1000)
    RPG::BGM.stop
    RPG::BGS.stop
    RPG::ME.stop
  end

  def fadein(time = 100)
    Graphics.fadein(time * Graphics.frame_rate / 1000)
  end

  def call_common_event(id)
    $game_temp.reserve_common_event(id)
  end

  def has_prefix?(string, prefix)
    string.start_with?(prefix)
  end

  def has_suffix?(string, suffix)
    string.end_with?(suffix)
  end

  def has_substring?(string, substring)
    string.include?(substring)
  end



  def max(a, b); [a, b].max; end
  def min(a, b); [a, b].min; end
  def screen; Game_Screen.get; end
  def pictures; screen.pictures; end
  def scene; SceneManager.scene; end
  def spriteset; scene.spriteset; end
  def tilemap; spriteset.tilemap; end
  def wait(d); d.times { Fiber.yield}; end
  def session_username; USERNAME; end
  def length(a); a.length; end
  def get(a, i); a[i]; end
  def event(id)
    if id.is_a?(Array)
      if id[0] == :follower
        e = $game_player.followers[id[1]]
        return e if e
        raise sprintf("Follower n° %d doesn't exist", id)
      else id[0] == :vehicle 
        e =  $game_map.vehicles[id[1]]
        return e if e
        raise sprintf("Vehicle n° %d doesn't exist", id)
      end 
    end
    return $game_player if id == 0
    return $game_map.events[id] if $game_map.events[id]
    raise sprintf("Event %d doesn't exist", id)
  end
  def follower(pos)
    [:follower, pos]
  end
  def rm_kill; SceneManager.exit; end
  def website(url); Thread.new { system("start #{url}") };end
  def split_each_char(str); str.scan(/./); end

  def wait_with(time, &block)
    time.times do
      block.call
      Fiber.yield
    end
  end

  def qte(key, time, strict = true)
    i = 0
    wait_with(time) do
      unless strict
        return true if Keyboard.trigger?(key) && i > 6
      else
        c = Keyboard.rgss_current_key(:trigger?)
        return c == key if c && i > 6
      end
      i += 1
    end
    return false
  end

  def random_combination(len, *keys)
    Array.new(len) {keys[Kernel.rand(keys.length)]}
  end

  def wait_trigger(key)
    wait(1)
    Fiber.yield while(!Keyboard.trigger?(key))
  end

  def wait_release(key)
    wait(1)
    Fiber.yield while(!Keyboard.release?(key))
  end

  def pick_random(*args)
    if args.length == 1 && args[0].is_a?(Array)
      return args[0][Kernel.rand(args[0].length)]
    end
    args[Kernel.rand(args.length)]
  end

  def get_tileset_id
    $game_map.tileset_id
  end

  def switch_tileset(tileset_id)
    $game_map.tileset_id = tileset_id
  end

  def set_tile(value, x, y, layer)
    $game_map.instance_variable_get(:@map).data[x, y, layer] = value
  end

  def set_tile_where(layer, id, new_id)
    map = $game_map.instance_variable_get(:@map)
    map_height.times do |y|
      map_width.times do |x|
        map.data[x, y, layer] = new_id if map.data[x, y, layer] == id
      end
    end
  end

  def delete_tiles(layer, id)
    set_tile_where(layer, id, 0)
  end

  #--------------------------------------------------------------------------
  # * Change Message height
  #--------------------------------------------------------------------------
  def message_height(n)
    Window_Message.line_number = n
    scene = SceneManager.scene
    scene.refresh_message if scene.respond_to?(:refresh_message)
  end

  def message(value, face_name = nil, face_index = 0, position = 2, background = 0)
    if face_name
      $game_message.face_name = face_name
      $game_message.face_index = face_index
    end
    $game_message.position = position
    $game_message.background = background
    $game_message.add(value)
    wait_for_message
  end

  # Fix Username
  alias_method :windows_username, :session_username


  append_commands

  #==============================================================================
  # ** Parallaxes
  #------------------------------------------------------------------------------
  #  Parallaxes Commands
  #==============================================================================
  module Parallaxes
    #--------------------------------------------------------------------------
    # * Show parallax
    #--------------------------------------------------------------------------
    def parallax_show(
        id,
        name,
        z  = -100,
        op = 255,
        ax = 0,
        ay = 0,
        mx = 2,
        my = 2,
        b  = 0,
        zx = 100,
        zy = 100
      )
      $game_map.parallaxes[id].show(name, z, op, ax, ay, mx, my, b, zx, zy)
    end
    #--------------------------------------------------------------------------
    # * Move parallax
    #--------------------------------------------------------------------------
    def parallax_transform(
        id,
        duration,
        wf = false,
        zoom_x = 100,
        zoom_y = 100,
        opacity = 255,
        tone = nil,
        ease = :linear
      )
      $game_map.parallaxes[id].move(duration, zoom_x, zoom_y, opacity, tone, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Hide parallax
    #--------------------------------------------------------------------------
    def parallax_erase(id)
      $game_map.parallaxes[id].hide
    end
    #--------------------------------------------------------------------------
    # * Hide all parallax
    #--------------------------------------------------------------------------
    def parallaxes_clear
      $game_map.clear_parallaxes
    end
    #--------------------------------------------------------------------------
    # * Change blend type of a parallax
    #--------------------------------------------------------------------------
    def parallax_blend(id, v)
      $game_map.parallaxes[id].blend_type = v
    end
    #--------------------------------------------------------------------------
    # * Change autospeed_x
    #--------------------------------------------------------------------------
    def parallax_autoscroll_x(id, v, duration = 0, wf = false, ease = :linear)
      $game_map.parallaxes[id].set_transition('autospeed_x', v, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Change autospeed_x
    #--------------------------------------------------------------------------
    def parallax_autoscroll_y(id, v, duration = 0, wf = false, ease = :linear)
      $game_map.parallaxes[id].set_transition('autospeed_y', v, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Change autospeed
    #--------------------------------------------------------------------------
    def parallax_autoscroll(id, x, y, d = 0, wf = false, ease = :linear)
      parallax_autoscroll_x(id, x, d, false, ease)
      parallax_autoscroll_y(id, y, d, wf, ease)
    end
    #--------------------------------------------------------------------------
    # * Change z
    #--------------------------------------------------------------------------
    def parallax_z(id, v)
      $game_map.parallaxes[id].z = v
    end
    #--------------------------------------------------------------------------
    # * Change scroll_x
    #--------------------------------------------------------------------------
    def parallax_scroll_x(id, v)
      $game_map.parallaxes[id].move_x = v
    end
    #--------------------------------------------------------------------------
    # * Change scroll_y
    #--------------------------------------------------------------------------
    def parallax_scroll_y(id, v)
      $game_map.parallaxes[id].move_y = v
    end
    #--------------------------------------------------------------------------
    # * Change speed
    #--------------------------------------------------------------------------
    def parallax_scroll(id, x, y)
      parallax_scroll_x(id, x)
      parallax_scroll_y(id, y)
    end
    #--------------------------------------------------------------------------
    # * Change zoom_x
    #--------------------------------------------------------------------------
    def parallax_zoom_x(id, v, duration = 0, wf = false, ease = :linear)
      $game_map.parallaxes[id].set_transition('zoom_x', v, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Change zoom_y
    #--------------------------------------------------------------------------
    def parallax_zoom_y(id, v, duration = 0, wf = false, ease = :linear)
      $game_map.parallaxes[id].set_transition('zoom_y', v, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Change zoom
    #--------------------------------------------------------------------------
    def parallax_zoom(id, v, duration = 0, wf = false, ease = :linear)
      parallax_zoom_x(id, v, duration, false, ease)
      parallax_zoom_y(id, v, duration, wf, ease)
    end
    #--------------------------------------------------------------------------
    # * Change tone
    #--------------------------------------------------------------------------
    def parallax_tone(id, tone, duration = 0, wf = false, ease = :linear)
      $game_map.parallaxes[id].start_tone_change(tone, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Change opacity
    #--------------------------------------------------------------------------
    def parallax_opacity(id, v, duration = 0, wf = false, ease = :linear)
      $game_map.parallaxes[id].set_transition('opacity', v, duration, ease)
      wait(duration) if wf
    end

    # fix for EE4
    alias_method :parallax_scrollspeed, :parallax_scroll

    append_commands
  end

  #==============================================================================
  # ** Commands Picture
  #------------------------------------------------------------------------------
  #  Pictures manipulation
  #==============================================================================

  module Pictures
    #--------------------------------------------------------------------------
    # * Sprite picture
    #--------------------------------------------------------------------------
    def sprite_picture(id)
      spriteset.picture_sprites[id]
    end
    #--------------------------------------------------------------------------
    # * Picture show
    #--------------------------------------------------------------------------
    def picture_show(id, n, x=0, y=0, ori=0,  z_x=100, z_y=100, op=255, bl=0)
      pictures[id].show(n, ori, x, y, z_x, z_y, op, bl)
    end
    #--------------------------------------------------------------------------
    # * Picture show
    #--------------------------------------------------------------------------
    def picture_show_screenshot(id, x=0, y=0, ori=0,  z_x=100, z_y=100, op=255, bl=0)
      pictures[id].show(:screenshot, ori, x, y, z_x, z_y, op, bl)
    end
    #--------------------------------------------------------------------------
    # * Picture erase
    #--------------------------------------------------------------------------
    def picture_erase(ids)
      ids = select_pictures(ids)
      ids.each {|id| pictures[id].erase}
    end
    #--------------------------------------------------------------------------
    # * Picture name
    #--------------------------------------------------------------------------
    def picture_name(id, name = nil)
      return pictures[id].name unless name
      pictures[id].name = name
    end
    #--------------------------------------------------------------------------
    # * Modify Origin
    # Origin : 0 | 1 (0 = Corner High Left, 1 = Center)
    #--------------------------------------------------------------------------
    def picture_origin(id, *origin)
      origin = origin[0] if origin.length == 1
      pictures[id].origin = origin
    end
    #--------------------------------------------------------------------------
    # * Modify x position
    #--------------------------------------------------------------------------
    def picture_x(id, x=false, duration = 0, wf = false, ease = :linear)
      return pictures[id].x unless x
      pictures[id].set_transition('x', x, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Modify y position
    #--------------------------------------------------------------------------
    def picture_y(id, y=false, duration = 0, wf = false, ease = :linear)
      return pictures[id].y unless y
      pictures[id].set_transition('y', y, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Modify position
    #--------------------------------------------------------------------------
    def picture_position(ids, x, y, duration = 0, wf = false, ease = :linear)
      ids = select_pictures(ids)
      ids.each do |id|
        picture_x(id, x, duration, false, ease)
        picture_y(id, y, duration, false, ease)
      end
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Move picture
    #--------------------------------------------------------------------------
    def picture_move(ids, x, y, zoom_x, zoom_y, dur, wf = true, opacity = -1, bt = -1, o = -1, ease = :linear)
      ids = select_pictures(ids)
      ids.each do |id|
        p = pictures[id]
        opacity = (opacity == -1) ? p.opacity : opacity
        blend = (bt == -1) ? p.blend_type : bt
        origin = (o == -1) ? p.origin : o
        p.move(origin, x, y, zoom_x, zoom_y, opacity, blend, dur, ease)
      end
      wait(dur) if wf
    end
    #--------------------------------------------------------------------------
    # * Modify wave
    #--------------------------------------------------------------------------
    def picture_wave(ids, amp, speed)
      ids = select_pictures(ids)
      ids.each do |id|
        pictures[id].wave_amp = amp
        pictures[id].wave_speed = speed
      end
    end
    #--------------------------------------------------------------------------
    # * Apply Mirror
    #--------------------------------------------------------------------------
    def picture_flip(ids)
      ids = select_pictures(ids)
      ids.each do |id|
        pictures[id].mirror = !pictures[id].mirror
      end
    end
    #--------------------------------------------------------------------------
    # * Modify Angle
    #--------------------------------------------------------------------------
    def picture_angle(id, angle=false, duration = 0, wf = false, ease = :linear)
      return pictures[id].angle unless angle
      pictures[id].set_transition('angle', angle, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Rotate
    #--------------------------------------------------------------------------
    def picture_rotate(ids, speed)
      ids = select_pictures(ids)
      ids.each do |id|
        pictures[id].rotate(speed)
      end
    end
    #--------------------------------------------------------------------------
    # * change Zoom X
    #--------------------------------------------------------------------------
    def picture_zoom_x(id, zoom_x=false, duration = 0, wf = false, ease = :linear)
      return pictures[id].zoom_x unless zoom_x
      pictures[id].set_transition('zoom_x', zoom_x, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * change Zoom Y
    #--------------------------------------------------------------------------
    def picture_zoom_y(id, zoom_y=false, duration = 0, wf = false, ease = :linear)
      return pictures[id].zoom_y unless zoom_y
      pictures[id].set_transition('zoom_y', zoom_y, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * change Zoom
    #--------------------------------------------------------------------------
    def picture_zoom(ids, zoom_x, zoom_y, duration = 0, wf = false, ease = :linear)
      select_pictures(ids).each do |id|
        picture_zoom_x(id, zoom_x, duration, false, ease)
        picture_zoom_y(id, zoom_y, duration, false, ease)
      end
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * change Tone
    #--------------------------------------------------------------------------
    def picture_tone(id, tone, d = 0, wf = false, ease = :linear)
      if d.is_a?(Fixnum)
        pictures[id].start_tone_change(tone, d, ease)
        wait(d) if wf
      else
        pictures[id].tone = tone
      end
    end
    #--------------------------------------------------------------------------
    # * Change blend type
    #--------------------------------------------------------------------------
    def picture_blend(ids, blend)
      select_pictures(ids).each {|id| pictures[id].blend = blend }
    end
    #--------------------------------------------------------------------------
    # * Pin picture on the map
    #--------------------------------------------------------------------------
    def picture_pin(ids, x=nil, y=nil)
      select_pictures(ids).each do |id|
        unless x
          x_s = 16 * pictures[id].scroll_speed_x
          y_s = 16 * pictures[id].scroll_speed_y
          x = picture_x(id) + $game_map.display_x * x_s + pictures[id].shake
          y = picture_y(id) + $game_map.display_y * y_s
        end
        picture_x(id, x)
        picture_y(id, y)
        pictures[id].pin
      end
    end
    #--------------------------------------------------------------------------
    # * Unpin picture on the map
    #--------------------------------------------------------------------------
    def picture_unpin(ids)
      select_pictures(ids).each {|id| pictures[id].unpin }
    end

    #--------------------------------------------------------------------------
    # * Check if a picture is in movement
    #--------------------------------------------------------------------------
    def picture_move?(id)
      pictures[id].move?
    end

    def picture_erased?(id)
      pictures[id].name.empty?
    end

    def picture_showed?(id)
      !picture_erased?(id)
    end

    #--------------------------------------------------------------------------
    # * Change Picture Opacity
    #--------------------------------------------------------------------------
    def picture_opacity(ids, value, duration = 0, wf = false, ease = :linear)
      select_pictures(ids).each do |id|
        pictures[id].set_transition('opacity', value, duration, ease)
      end
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Shake the picture
    #--------------------------------------------------------------------------
    def picture_shake(ids, power, speed, duration)
      ids.each do |id|
        pictures[id].start_shake(power, speed, duration)
      end
    end
    #--------------------------------------------------------------------------
    # * Point in picture
    #--------------------------------------------------------------------------
    def pixel_in_picture?(id, x, y, precise = false)
      spr = sprite_picture(id)
      return false unless spr
      precise ? spr.precise_in?(x, y) : spr.in?(x, y)
    end
    def picture_mouse_hover?(id, precise = false)
      pixel_in_picture?(id, Mouse.x, Mouse.y, precise)
    end
    def picture_mouse_click?(id, precise = false)
      picture_mouse_hover?(id, precise) && Mouse.click?
    end
    def picture_mouse_press?(id, key = :mouse_left, precise = false)
      picture_mouse_hover?(id, precise) && Mouse.press?(key)
    end
    def picture_mouse_trigger?(id, key = :mouse_left, precise = false)
      picture_mouse_hover?(id, precise) && Mouse.trigger?(key)
    end
    def picture_mouse_repeat?(id, key = :mouse_left, precise = false)
      picture_mouse_hover?(id, precise) && Mouse.repeat?(key)
    end
    def picture_mouse_release?(id, key = :mouse_left, precise = false)
      picture_mouse_hover?(id, precise) && Mouse.release?(key)
    end
    #--------------------------------------------------------------------------
    # * Picture collisions
    #--------------------------------------------------------------------------
    def pictures_collide?(a, b)
      spr_a = sprite_picture(a)
      spr_b = sprite_picture(b)
      return if (!spr_a) || (!spr_b)
      spr_a.collide_with?(spr_b)
    end
    #--------------------------------------------------------------------------
    # * Picture collisions (perfect pixel)
    #--------------------------------------------------------------------------
    def pictures_perfect_collide?(a, b)
      spr_a = sprite_picture(a)
      spr_b = sprite_picture(b)
      return if (!spr_a) || (!spr_b)
      spr_a.pixel_collide_with(spr_b)
    end
    #--------------------------------------------------------------------------
    # * Change scroll speed (in X)
    #--------------------------------------------------------------------------
    def picture_scroll_x(ids, speed = nil)
      return pictures[ids].scroll_speed_x unless speed
      select_pictures(ids).each {|id| pictures[id].scroll_speed_x = speed}
    end
    #--------------------------------------------------------------------------
    # * Change scroll speed (in Y)
    #--------------------------------------------------------------------------
    def picture_scroll_y(ids, speed = nil)
    return pictures[ids].scroll_speed_y unless speed
      select_pictures(ids).each {|id| pictures[id].scroll_speed_y = speed}
    end
    #--------------------------------------------------------------------------
    # * Change scroll speed
    #--------------------------------------------------------------------------
    def picture_scroll(ids, speed)
      select_pictures(ids).each do |id|
        picture_scroll_x(id, speed)
        picture_scroll_y(id, speed)
      end
    end
    #--------------------------------------------------------------------------
    # * Clear all pictures
    #--------------------------------------------------------------------------
    def pictures_clear
      screen.clear_pictures
    end

    #--------------------------------------------------------------------------
    # * Get pictures dimension
    #--------------------------------------------------------------------------
    def picture_width(id, v = nil, duration = 0, wf = false, ease = :linear)
      pict = pictures[id]
      unless v
        return 0 if !pict || pict.name.empty?
        bmp = Sprite_Picture.swap_cache(pict.name)
        return (((bmp.width * pict.zoom_x))/100.0).to_i
      end
      zoom = Command.percent(v, picture_width(id))
      picture_zoom_x(id, zoom, duration, wf, ease)
    end

    #--------------------------------------------------------------------------
    # * Get pictures dimension
    #--------------------------------------------------------------------------
    def picture_height(id, v = nil, duration = 0, wf = false, ease = :linear)
      pict = pictures[id]
      unless v
        return 0 if !pict || pict.name.empty?
        bmp = Sprite_Picture.swap_cache(pict.name)
        return (((bmp.height * pict.zoom_y))/100.0).to_i
      end
      zoom = Command.percent(v, picture_height(id))
      picture_zoom_y(id, zoom, duration, wf, ease)
    end

    #--------------------------------------------------------------------------
    # * set pictures dimension
    #--------------------------------------------------------------------------
    def picture_dimension(id, w, h, duration = 0, wf = false, ease = :linear)
      picture_width(id, w, duration, false, ease)
      picture_height(id, h, duration, wf, ease)
    end


    # Fix for EE4
    alias_method :picture_origine, :picture_origin
    alias_method :picture_detach, :picture_unpin

  append_commands
  end

  #==============================================================================
  # ** Commands Base
  #------------------------------------------------------------------------------
  #  Basics Commands
  #==============================================================================

  module Std
    #--------------------------------------------------------------------------
    # * Random number from a range
    #--------------------------------------------------------------------------
    def random(min=0, max)
      min, max = [min.to_i, max.to_i].sort
      min + Kernel.rand(max-min+1)
    end
    #--------------------------------------------------------------------------
    # * Random floating point value between x and its successor
    #--------------------------------------------------------------------------
    def random_figures(x=0)
      x + Kernel.rand
    end
    #--------------------------------------------------------------------------
    # * Return ID of current map
    #--------------------------------------------------------------------------
    def map_id
      $game_map.map_id
    end
    #--------------------------------------------------------------------------
    # * Return map's name
    #--------------------------------------------------------------------------
    def map_name
      $game_map.display_name
    end
    #--------------------------------------------------------------------------
    # * Get Event Id form coords
    #--------------------------------------------------------------------------
    def id_at(x, y)
      result = $game_map.event_id_xy(x, y)
      return result if result > 0
      return 0 if $game_player.x == x && $game_player.y == y
      return -1
    end
    #--------------------------------------------------------------------------
    # * Get terrain Tag from coords
    #--------------------------------------------------------------------------
    def terrain_tag(x, y)
      $game_map.terrain_tag(x, y)
    end
    #--------------------------------------------------------------------------
    # * Get Tile ID from coords and layer (0,1,2)
    #--------------------------------------------------------------------------
    def tile_id(x, y, layer, map_id = nil)
      return $game_map.tile_id(x, y, layer) unless map_id
      Cache.map(map_id).data[x, y, layer]
    end

    #--------------------------------------------------------------------------
    # * retreive data about tiles
    #--------------------------------------------------------------------------
    def wall?(x, y)
      tile_id = tile_id(x, y, 0)
      tile_id.between?(2288, 2335) || tile_id.between?(2384, 2431) ||
      tile_id.between?(2480, 2527) || tile_id.between?(2576, 2623) ||
      tile_id.between?(2672, 2719) || tile_id.between?(2768, 2815) ||
      tile_id.between?(4736, 5119) || tile_id.between?(5504, 5887) ||
      tile_id.between?(6272, 6655) || tile_id.between?(7040, 7423) ||
      tile_id > 7807
    end

    def roof?(x, y)
      tile_id = tile_id(x, y, 0)
      tile_id.between?(4352, 4735) || tile_id.between?(5120, 5503) ||
      tile_id.between?(5888, 6271) || tile_id.between?(6656, 7039) ||
      tile_id.between?(7424, 7807)
    end

    def stair?(x, y)
      tile_id = tile_id(x, y, 0)
      tile_id.between?(1541, 1542) || tile_id.between?(1549, 1550) ||
      tile_id.between?(1600, 1615)
    end

    def table?(x, y)
      tile_id = tile_id(x, y, 0)
      tile_id.between?(3152, 3199) || tile_id.between?(3536, 3583) ||
      tile_id.between?(3920, 3967) || tile_id.between?(4304, 4351)
    end

    def ground?(x, y)
      tile_id = tile_id(x, y, 0)
      (tile_id.between?(2816, 4351) && !table?(x,y)) ||
      (tile_id > 1663 && !stair?(x,y))
    end

    def get_squares_by_region(region_id)
      $game_map.squares_by_region(region_id)
    end

    def get_squares_by_terrain(terrain_tag)
      $game_map.squares_by_terrain(terrain_tag)
    end

    def get_squares_by_tile(layer, tile_id)
       $game_map.squares_by_tile(layer, tile_id)
    end



    def get_random_square(region_id = 0)
      $game_map.random_square(region_id)
    end

    #def use_reflection(properties)
     # $game_map.use_reflection = true
     # $game_map.reflection_properties = properties || {}
    #end


    #--------------------------------------------------------------------------
    # * Get Region ID from coords
    #--------------------------------------------------------------------------
    def region_id(x, y)
      $game_map.region_id(x, y)
    end
    #--------------------------------------------------------------------------
    # * Check passability
    #--------------------------------------------------------------------------
    def square_passable?(x, y, d=2)
      $game_map.passable?(x, y, d)
    end
    #--------------------------------------------------------------------------
    # * Check wounding
    #--------------------------------------------------------------------------
    def damage_floor?(x, y)
      $game_map.damage_floor?(x, y)
    end
    #--------------------------------------------------------------------------
    # * Get a percent
    #--------------------------------------------------------------------------
    def percent(value, max)
      ((value*100.0)/max).to_i
    end
    #--------------------------------------------------------------------------
    # * Get a value from a percent
    #--------------------------------------------------------------------------
    def apply_percent(percent, max)
      ((percent*max)/100.0).to_i
    end
    #--------------------------------------------------------------------------
    # * Include event page
    #--------------------------------------------------------------------------
    def include_page(map_id, ev_id, p_id, if_runnable = false, context=false)
      return unless self.class == Game_Interpreter
      page = Game_Interpreter.get_page(map_id, ev_id, p_id)
      return unless page
      if !if_runnable || page_runnable?(map_id, ev_id, page, context)
        self.append_interpreter(page)
      end
    end
    #--------------------------------------------------------------------------
    # * Invoke Event
    #--------------------------------------------------------------------------
    def invoke_event(map_id, ev_id, new_id, x=nil, y=nil)
      $game_map.add_event(map_id, ev_id, new_id, x, y)
    end
    #--------------------------------------------------------------------------
    # * Get the max Event ID
    #--------------------------------------------------------------------------
    def max_event_id; $game_map.max_id; end
    def fresh_event_id(erased = false)
      if erased
        i = $game_map.min_erased_id
        return i if i
      end
      max_event_id + 1
    end
    #--------------------------------------------------------------------------
    # * Check if a page is runnable
    #--------------------------------------------------------------------------
    def page_runnable?(map_id, ev_id, page, context=false)
      return unless self.class == Game_Interpreter
      page = Game_Interpreter.get_page(map_id, ev_id, p_id) if page.is_a?(Fixnum)
      return unless page
      return Game_Interpreter.conditions_met?(map_id, ev_id, page) if context
      c_map_id = Game_Interpreter.current_map_id
      c_ev_id = self.event_id
      Game_Interpreter.conditions_met?(c_map_id, c_ev_id, page)
    end
    #--------------------------------------------------------------------------
    # * Create a tone
    #--------------------------------------------------------------------------
    def tone(r, v, b, gray = 0)
      Tone.new(r, v, b, gray)
    end
    #--------------------------------------------------------------------------
    # * Create a Color
    #--------------------------------------------------------------------------
    def color(r, v, b, a = 255)
      Color.new(r,v,b,a)
    end

    def map_width; $game_map.width; end
    def map_height; $game_map.height; end

    #--------------------------------------------------------------------------
    # * Flash a square
    #--------------------------------------------------------------------------
    def flash_square(x, y, color)
      tilemap.flash_data ||= Table.new($game_map.width, $game_map.height)
      tilemap.flash_data[x, y] = color.to_hex
    end
    #--------------------------------------------------------------------------
    # * UnFlash a square
    #--------------------------------------------------------------------------
    def unflash_square(x, y)
      flash_square(x, y, Color.new(0, 0, 0))
    end
    #--------------------------------------------------------------------------
    # * Flash rect
    #--------------------------------------------------------------------------
    def flash_rect(x, y, width, height, color)
      (x..x+width).each do |i|
        (y..y+height).each do |j|
          flash_square(i, j, color)
        end
      end
    end
    #--------------------------------------------------------------------------
    # * UnFlash rect
    #--------------------------------------------------------------------------
    def unflash_rect(x, y, width, height)
      flash_rect(x, y, width, height, Color.new(0, 0, 0))
    end

    append_commands
  end

  #==============================================================================
  # ** Commands Device
  #------------------------------------------------------------------------------
  #  Device commands
  #==============================================================================

  module Device
    #--------------------------------------------------------------------------
    # * Keyboard support
    #--------------------------------------------------------------------------
    def key_press?(k);        Keyboard.press?(k);             end
    def key_trigger?(k);      Keyboard.trigger?(k);           end
    def key_release?(k);      Keyboard.release?(k);           end
    def key_repeat?(k);       Keyboard.repeat?(k);            end
    def ctrl?(k=nil);         Keyboard.ctrl?(k);              end
    def keyboard_all?(m, *k); Keyboard.all?(m, *k);           end
    def keyboard_any?(m, *k); Keyboard.any?(m, *k);           end
    def caps_lock?;           Keyboard.caps_lock?;            end
    def num_lock?;            Keyboard.num_lock?;             end
    def scroll_lock?;         Keyboard.scroll_lock?;          end
    def shift?;               Keyboard.shift?;                end
    def alt_gr?;              Keyboard.alt_gr?;               end
    def key_time(k);          Keyboard.time(k);               end
    def key_current(*m);      Keyboard.current_key(*m);       end
    def key_current_rgss(*m); Keyboard.rgss_current_key(*m);  end
    def keyboard_current_digit; Keyboard.current_digit;         end
    def keyboard_current_char;  Keyboard.current_char;          end

    #--------------------------------------------------------------------------
    # * Mouse Support
    #--------------------------------------------------------------------------
    def mouse_press?(k);    Mouse.press?(k);                end
    def mouse_click?;       Mouse.click?;                   end
    def mouse_trigger?(k);  Mouse.trigger?(k);              end
    def mouse_release?(k);  Mouse.release?(k);              end
    def mouse_dragging?;    Mouse.dragging?;                end
    def mouse_repeat?(k);   Mouse.repeat?(k);               end
    def mouse_all?(m, *k);  Mouse.all?(m, *k);              end
    def mouse_any?(m, *k);  Mouse.any?(m, *k);              end
    def mouse_x;            Mouse.x;                        end
    def mouse_y;            Mouse.y;                        end
    def mouse_point;        Mouse.point;                    end
    def mouse_square_x;     Mouse.square_x;                 end
    def mouse_square_y;     Mouse.square_y;                 end
    def mouse_rect;         Mouse.rect;                     end
    def mouse_last_rect;    Mouse.last_rect;                end
    def click_time(k);      Mouse.time(k);                  end
    def mouse_in?(rect);    Mouse.in?(rect);                end
    def mouse_current_key(*m)   Mouse.current_key(*m);      end
    def cursor_system(m)
      flag = (!!flag) ? 1 : 0
      Externlib::ShowCursor.(flag)
    end

    # Fix for EE4
    alias_method :key_number, :keyboard_current_digit
    alias_method :key_char, :keyboard_current_char
    alias_method :key_char?, :keyboard_current_char
    alias_method :maj?, :shift?
    alias_method :mouse_x_square, :mouse_square_x
    alias_method :mouse_y_square, :mouse_square_y
    alias_method :show_cursor_system, :cursor_system

    append_commands
  end

  #==============================================================================
  # ** Commands Team
  #------------------------------------------------------------------------------
  #  Team Commands
  #==============================================================================

  module Party
    #--------------------------------------------------------------------------
    # * Party data
    #--------------------------------------------------------------------------
    def team_size; $game_party.members.size; end
    def gold; $game_party.gold; end
    def steps; $game_party.steps; end
    def play_time; (Graphics.frame_count / Graphics.frame_rate); end
    def timer; $game_timer.sec; end
    def save_count; $game_system.save_count; end
    def battle_count; $game_system.battle_count; end
    def gain_gold(amount); $game_party.gain_gold(amount); end
    def lose_gold(amount); $game_party.lose_gold(amount); end
    #--------------------------------------------------------------------------
    # * Items
    #--------------------------------------------------------------------------
    def items_possessed
      $game_party.items.map {|i| [i.id] * $game_party.item_number(i)}.flatten
    end
    def armors_possessed
      $game_party.weapons.map {|i| [i.id] * $game_party.item_number(i)}.flatten
    end
    def weapons_possessed
      $game_party.armors.map {|i| [i.id] * $game_party.item_number(i)}.flatten
    end
    def item_count(id); $game_party.item_number($data_items[id]); end
    def weapon_count(id); $game_party.item_number($data_weapons[id]); end
    def armor_count(id); $game_party.item_number($data_armors[id]); end
    def item_name(id); $data_items[id].name; end
    def weapon_name(id); $data_weapons[id].name; end
    def armor_name(id); $data_armors[id].name; end
    def item_note(id); $data_items[id].note; end
    def weapon_note(id); $data_weapons[id].note; end
    def armor_note(id); $data_armors[id].note; end
    def item_description(id); $data_items[id].description; end
    def weapon_description(id); $data_weapons[id].description; end
    def armor_description(id); $data_armors[id].description; end
    def item_icon(id); $data_items[id].icon_index; end
    def weapon_icon(id); $data_weapons[id].icon_index; end
    def armor_icon(id); $data_armors[id].icon_index; end
    def item_price(id); $data_items[id].price; end
    def weapon_price(id); $data_weapons[id].price; end
    def armor_price(id); $data_armors[id].price; end
    def item_consumable?(id); $data_items[id].consumable; end
    def is_key_item?(id); $data_items[id].key_item?; end
    def weapon_max_hit_points(id); $data_weapons[id].params[0]; end
    def weapon_max_magic_points(id); $data_weapons[id].params[1]; end
    def weapon_attack_power(id); $data_weapons[id].params[2]; end
    def weapon_defense_power(id); $data_weapons[id].params[3]; end
    def weapon_magic_attack_power(id); $data_weapons[id].params[4]; end
    def weapon_magic_defense_power(id); $data_weapons[id].params[5]; end
    def weapon_agility(id); $data_weapons[id].params[6]; end
    def weapon_luck(id); $data_weapons[id].params[7]; end
    def armor_max_hit_points(id); $data_armors[id].params[0]; end
    def armor_max_magic_points(id); $data_armors[id].params[1]; end
    def armor_attack_power(id); $data_armors[id].params[2]; end
    def armor_defense_power(id); $data_armors[id].params[3]; end
    def armor_magic_attack_power(id); $data_armors[id].params[4]; end
    def armor_magic_defense_power(id); $data_armors[id].params[5]; end
    def armor_agility(id); $data_armors[id].params[6]; end
    def armor_luck(id); $data_armors[id].params[7]; end

    # def armor_element_rate(i, actor_id, element_id)
    #   item = $data_armors[i]
    #   user = $game_actors[i]
    #   if item.damage.element_id < 0
    #     user.atk_elements.empty? ? 1.0 : elements_max_rate(user.atk_elements)
    #   else
    #     element_rate(item.damage.element_id)
    #   end
    # end

    # def weapon_element_rate(i, actor_id, element_id)
    #   item = $data_weapons[i]
    #   user = $game_actors[i]
    #   if item.damage.element_id < 0
    #     user.atk_elements.empty? ? 1.0 : elements_max_rate(user.atk_elements)
    #   else
    #     element_rate(item.damage.element_id)
    #   end
    # end

    def give_item(id, amount)
      item = $data_items[id];
      $game_party.gain_item(item, amount)
    end
    def give_weapon(id, amount, include_equip = false)
      item = $data_weapons[id];
      $game_party.gain_item(item, amount, include_equip)
    end
    def give_armor(id, amount, include_equip = false)
      item = $data_armors[id];
      $game_party.gain_item(item, amount, include_equip)
    end
    def has_item?(id)
      item = $data_items[id]
      $game_party.has_item?(item)
    end
    def has_weapon?(id, include_equip = false)
      item = $data_weapons[id]
      $game_party.has_item?(item, include_equip)
    end
    def has_armor?(id, include_equip = false)
      item = $data_armors[id]
      $game_party.has_item?(item, include_equip)
    end
    def weapon_equiped?(id, member = nil)
      item = $data_weapons[id]
      return $game_party.members_equip_include?(item) unless member
      $game_actors[member].equips.include?(item)
    end
    def armor_equiped?(id, member = nil)
      item = $data_armors[id]
      return $game_party.members_equip_include?(item) unless member
      $game_actors[member].equips.include?(item)
    end

    def weapon_type(id)
     i = $data_weapons[id].wtype_id
     $data_system.weapon_types[i]
    end
    def armor_type(id)
      i = $data_armors[id].atype_id
      $data_system.armor_types[i]
    end
    def item_scope(id)
      $data_items[id].scope
    end
    def item_has_no_scope?(id)
      item_scope(id) == 0
    end
    def item_for_one_enemy?(id)
      item_scope(id) == 1
    end
    def item_for_all_enemies?(id)
      item_scope(id) == 2
    end
    def item_for_one_random_enemy?(id)
      item_scope(id) == 3
    end
    def item_for_two_random_enemies?(id)
      item_scope(id) == 4
    end
    def item_for_three_random_enemies?(id)
      item_scope(id) == 5
    end
    def item_for_four_random_enemies?(id)
      item_scope(id) == 6
    end
    def item_for_one_ally?(id)
      item_scope(id) == 7
    end
    def item_for_all_allies?(id)
      item_scope(id) == 8
    end
    def item_for_one_dead_ally?(id)
      item_scope(id) == 9
    end
    def item_for_all_dead_allies?(id)
      item_scope(id) == 10
    end
    def item_for_caller?(id)
      item_scope(id) == 11
    end
    def item_occasion(id)
      $data_items[id].occasion
    end
    def item_always_usable?(id)
      item_occasion(id) == 0
    end
    def item_battle_usable?(id)
      item_always_usable?(id) || item_occasion(id) == 1
    end
    def item_menu_usable?(id)
      item_always_usable?(id) || item_occasion(id) == 2
    end
    def item_never_usable?(id)
      item_occasion(id) == 3
    end
    def item_for_opponent?(i); $data_items[i].for_opponent?; end
    def item_for_friend?(i); $data_items[i].for_friend?; end
    def item_for_dead_friend?(i); $data_items[i].for_dead_friend?; end
    def item_for_one?(i); $data_items[i].for_one?; end
    def item_for_random?(i); $data_items[i].for_random?; end
    def item_for_all?(i); $data_items[i].for_all?; end
    def item_need_selection?(i); $data_items[i].need_selection?; end
    def item_certain?(i); $data_items[i].certain?; end
    def item_physical?(i); $data_items[i].physical?; end
    def item_magical?(i); $data_items[i].magical?; end
    def item_number_of_targets(i); $data_items[i].number_of_targets; end
    def item_speed(i); $data_items[i].speed; end
    def item_nb_hits(i); $data_items[i].repeats; end
    def item_success_rate(i); $data_items[i].success_rate; end
    def item_tp_gain(i); $data_items[i].tp_gain; end
    # def item_element_rate(i, actor_id, element_id)
    #   item = $data_items[i]
    #   user = $game_actors[i]
    #   if item.damage.element_id < 0
    #     user.atk_elements.empty? ? 1.0 : elements_max_rate(user.atk_elements)
    #   else
    #     element_rate(item.damage.element_id)
    #   end
    # end

    append_commands
  end

  #==============================================================================
  # ** Commands System
  #------------------------------------------------------------------------------
  #  System Commands
  #==============================================================================

  module System
    def sys; $data_system; end
    def game_title; sys.game_title; end
    def version_id; sys.version_id; end
    def currency; sys.currency_unit; end
    def start_map_id; sys.start_map_id; end
    def start_x; sys.start_x; end
    def start_y; sys.start_y; end
    append_commands
  end

  #==============================================================================
  # ** Database  Actor reader
  #------------------------------------------------------------------------------
  #  DatabaseActor commands
  #==============================================================================

  module Actors
    def type_equip(str)
      [:Weapon, :Shield, :Head, :Body, :Accessory].index(str)
    end
    def actor_equip(id, t)
      k = $game_actors[id].equips[type_equip(t)]
      (k.nil?) ? 0 : k.id
    end
    def actor_weapon(id); actor_equip(id, :Weapon); end
    def actor_shield(id); actor_equip(id, :Shield); end
    def actor_head(id); actor_equip(id, :Head); end
    def actor_body(id); actor_equip(id, :Body); end
    def actor_description(id); $game_actors[id].description; end
    def actor_accessory(id); actor_equip(id, :Accessory); end
    def actor_has_weapon?(id); actor_weapon(id) != 0; end
    def actor_has_shield?(id); actor_shield(id) != 0; end
    def actor_has_head?(id); actor_head(id) != 0; end
    def actor_has_body?(id); actor_body(id) != 0; end
    def actor_has_accessory?(id); actor_accessory(id) != 0; end
    def actor_level(id); $game_actors[id].level; end
    def actor_level_max(id); $game_actors[id].max_level; end
    def actor_exp(id); $game_actors[id].exp; end
    def actor_note(id);  $game_actors[id].actor.note; end
    def actor_hp(id); $game_actors[id].hp; end
    def actor_mp(id); $game_actors[id].mp; end
    def actor_tp(id); $game_actors[id].tp; end
    def actor_max_hp(id); $game_actors[id].mhp; end
    def actor_max_mp(id); $game_actors[id].mmp; end
    def actor_attack(id); $game_actors[id].atk; end
    def actor_defense(id); $game_actors[id].def; end
    def actor_magic_attack(id); $game_actors[id].mat; end
    def actor_magic_defense(id); $game_actors[id].mdf; end
    def actor_agility(id); $game_actors[id].agi; end
    def actor_luck(id); $game_actors[id].luk; end
    def actor_hit_rate(id); $game_actors[id].hit; end
    def actor_evasion_rate(id); $game_actors[id].eva; end
    def actor_critical_rate(id); $game_actors[id].cri; end
    def actor_critical_evasion_rate(id); $game_actors[id].cev; end
    def actor_magical_evasion_rate(id); $game_actors[id].mev; end
    def actor_magical_reflection_rate(id); $game_actors[id].mrf; end
    def actor_counter_attack_rate(id); $game_actors[id].cnt; end
    def actor_hp_regeneration_rate(id); $game_actors[id].hrg; end
    def actor_mp_regeneration_rate(id); $game_actors[id].mrg; end
    def actor_tp_regeneration_rate(id); $game_actors[id].trg; end
    def actor_target_rate(id); $game_actors[id].tgr; end
    def actor_guard_effect_rate(id); $game_actors[id].grd; end
    def actor_recovery_effect_rate(id); $game_actors[id].rec; end
    def actor_pharmacology(id); $game_actors[id].pha; end
    def actor_mp_cost_rate(id); $game_actors[id].mcr; end
    def actor_tp_charge_rate(id); $game_actors[id].tcr; end
    def actor_physical_damage_rate(id); $game_actors[id].pdr; end
    def actor_magical_damage_rate(id); $game_actors[id].mdr; end
    def actor_floor_damage_rate(id); $game_actors[id].fdr; end
    def actor_experience_rate(id); $game_actors[id].exr; end
    def actor_name(id); $game_actors[id].name; end
    def set_actor_name(id, n); $game_actors[id].name = n; end
    def actor_nickname(id); $game_actors[id].nickname; end
    def set_actor_nickname(id, n); $game_actors[id].nickname = n; end
    def actor_character_name(id); $game_actors[id].character_name; end
    def actor_character_index(id); $game_actors[id].character_index; end
    def actor_face_name(id); $game_actors[id].face_name; end
    def actor_face_index(id); $game_actors[id].face_index; end
    def actor_class(id); $game_actors[id].class_id; end
    def actor_exp_for_next_level(id); $game_actors[id].next_level_exp; end
    def actor_change_equip(id, slot, wp_id)
      $game_actors[id].change_equip_by_id(type_equip(slot), wp_id)
    end
    def actor_equip_weapon(id, wp); actor_equip(id, :Weapon, wp_id); end
    def actor_equip_shield(id, wp); actor_equip(id, :Shield, wp_id); end
    def actor_equip_head(id, wp); actor_equip(id, :Head, wp_id); end
    def actor_equip_body(id, wp); actor_equip(id, :Body, wp_id); end
    def actor_equip_accessory(id, wp); actor_equip(id, :Accessory, wp_id); end
    def actor_optimize_equipement(id); $game_actors[id].optimize_equipement; end
    def actor_level_up(id); $game_actors[id].level_up; end
    def actor_level_down(id); $game_actors[id].level_down; end
    def actor_give_exp(id, exp); $game_actors[id].gain_exp(exp); end
    def actor_learn(id, skill_id); $game_actors[id].learn_skill(skill_id); end
    def actor_forget(id, skill_id); $game_actors[id].forget_skill(skill_id); end
    def actor_knowns?(id, skill_id); $game_actors[id].skill_learn?($data_skills[skill_id]); end
    def actor_set_graphic(character_name, character_index, face_name, face_index)
      $game_actors.set_graphic(character_name, character_index, face_name, face_index)
    end
    def actor_change_appear(id, character_name, character_index, face_name, face_index)
      $game_actors[id].set_graphic(character_name, character_index, face_name, face_index)
      $game_player.refresh
    end
    def actor_change_character(id, character_name, character_index)
      $game_actors[id].character_name = character_name
      $game_actors[id].character_index = character_index
      $game_player.refresh
    end
    def actor_change_face(id, face_name, face_index)
      $game_actors[id].face_name = face_name
      $game_actors[id].face_index = face_index
      $game_player.refresh
    end
    def actor_skills(id); $game_actors[id].skills.map{|s| s.id}; end
    def actor_weapons(id); $game_actors[id].weapons.map{|w| w.id}; end
    def actor_armors(id); $game_actors[id].armors.map{|a| a.id}; end
    def actor_element_rate(id, element_id)
      $game_actors[id].element_rate(element_id)
    end
    def actor_slot(id)
      return 0 unless $game_party.members[id - 1]
      $game_party.members[id - 1].id
    end

    # Fix for EE4
    alias_method :actor_experience, :actor_exp
    alias_method :actor_exp_rate, :actor_experience_rate
    alias_method :actor_magic, :actor_magic_attack

    append_commands
  end


  #==============================================================================
  # ** Events positions
  #------------------------------------------------------------------------------
  #  Events positions commands
  #==============================================================================

  module Events
    def event_moving?(id); event(id).moving?; end
    def player_moving?; event_moving?(0); end
    def event_name(id); event(id).name; end
    def event_x(id); event(id).x; end
    def event_y(id); event(id).y; end
    def event_screen_x(id); event(id).screen_x; end
    def event_screen_y(id); event(id).screen_y; end
    def event_pixel_y(id)
      ($game_map.display_y * 32) + event_screen_y(id)
    end
    def event_pixel_x(id)
      ($game_map.display_x * 32) + event_screen_x(id)
    end
    def event_direction(id, value = nil)
      return event(id).direction unless value
      event(id).set_direction(value)
    end
    def player_x; event(0).x; end
    def player_y; event(0).y; end
    def player_screen_x; event(0).screen_x; end
    def player_screen_y; event(0).screen_y; end
    def player_pixel_x; event_pixel_x(0); end
    def player_pixel_y; event_pixel_y(0); end
    def player_direction(value = nil) ; event_direction(0, value) end
    def distance_between(flag, ev1, ev2)
      ev1, ev2 = event(ev1), event(ev2)
      args = (ev1.screen_x-ev2.screen_x),(ev1.screen_y-ev2.screen_y)
      args = (ev1.x-ev2.x),(ev1.y-ev2.y) if flag == :square
      Math.hypot(*args).to_i
    end

    def event_flash(id, color, duration)
      event(id).k_sprite.flash(get_color("red"), 10)
    end

    def player_flash(color, duration)
      event_flash(0, color, duration)
    end
    
    def between(x1, y1, x2, y2)
      a = x1 - x2
      b = y1 - y2
      Math.hypot(a, b)
    end
    def squares_between(ev1, ev2); distance_between(:square, ev1, ev2); end
    def pixels_between(ev1, ev2); distance_between(:pixel, ev1, ev2); end
    def angle_between(ev1, ev2)
      ev1, ev2 = event(ev1), event(ev2)
      args = (ev2.screen_y-ev1.screen_y),(ev2.screen_x-ev1.screen_x)
      - (Math.atan2(*args)*57.29)%360
    end
    def event_look_at?(ev, to, scope, metric = :square)
      if event_direction(ev) == 8
        x_axis = event_x(to) == event_x(ev)
        y_axis = event_y(ev) > event_y(to)
      end
      if event_direction(ev) == 2
        x_axis = event_x(to) == event_x(ev)
        y_axis = event_y(ev) < event_y(to)
      end
      if event_direction(ev) == 4
        x_axis = event_x(to) < event_x(ev)
        y_axis = event_y(ev) == event_y(to)
      end
      if event_direction(ev) == 6
        x_axis = event_x(to) > event_x(ev)
        y_axis = event_y(ev) == event_y(to)
      end
      return x_axis && y_axis && (distance_between(metric, ev, to)<=scope)
    end
    def events_collide?(ev1, ev2)
      event1 = event(ev1)
      event2 = event(ev2)
      flag = case event1.direction
      when 2; event2.x == event1.x && event2.y == event1.y+1
      when 4; event2.x == event1.x-1 && event2.y == event1.y
      when 6; event2.x == event1.x+1 && event2.y == event1.y
      when 8; event2.x == event1.x && event2.y == event1.y-1
      else; false
      end
      return flag && !event1.moving?
    end
    def pixel_in_event?(id, x, y, pr = false)
      event(id).pixel_in?(x, y, pr)
    end
    def pixel_in_player?(x, y, pr = false)
      pixel_in_event?(0, x, y, pr)
    end
    def event_in_screen?(id)
      ev = event(id)
      check_x = ev.screen_x > 0 && ev.screen_x < Graphics.width
      check_y = ev.screen_y > 0 && ev.screen_y < Graphics.height
      check_x && check_y
    end
    def player_in_screen?
      event_in_screen?(0)
    end

    def event_ox(id, value = nil)
      return event(id).ox unless value
      event(id).ox = value
    end

    def event_oy(id, value = nil)
      return event(id).oy unless value
      event(id).oy = value
    end

    def player_ox(value = nil); event_ox(0, value); end
    def player_oy(value = nil); event_oy(0, value); end

    def event_zoom_x(id, value = nil)
      return event(id).zoom_x unless value
      event(id).zoom_x = value
    end

    def event_zoom_y(id, value = nil)
      return event(id).zoom_y unless value
      event(id).zoom_y = value
    end

    def event_zoom(id, value)
      event_zoom_x(id, value)
      event_zoom_y(id, value)
    end

    def player_zoom_x(value = nil); event_zoom_x(0, value); end
    def player_zoom_y(value = nil); event_zoom_y(0, value); end
    def player_zoom(value); event_zoom(0, value); end

    def event_restore_origin(id)
      event(id).restore_oxy
    end
    def player_restore_origin; event_restore_origin(0); end
      [:last_clicked,
      :last_pressed,
      :last_triggered,
      :last_released ,
      :last_repeated,
      :last_hovered].each do |m|
        define_method("#{m}_event") do
          Game_CharacterBase.send(m)
        end
    end

    def events_buzzer_properties(e, amplitude, length)
      es = select_events(e)
      es.each do |e|
        event(e).buzz_amplitude = amplitude
        event(e).buzz_length = length
      end
    end

    def followers_buzzer_properties(*ids, amplitude, length)
      if ids.length == 0
        $game_player.followers.each do |f|
          f.buzz_amplitude = amplitude
          f.buzz_length = length
        end
        return
      end
      ids.each do |i|
        e = $game_player.followers[i]
        if e
          e.buzz_amplitude = amplitude
          e.buzz_length = length
        end
      end
    end

    def events_buzz(e, duration=16)
      es = select_events(e)
      es.each do |e|
        event(e).buzz = duration
      end
    end

    def followers_buzz(ids, duration=16)
      return if !$game_player.followers.visible
      if ids.length == 0
        $game_player.followers.each do |f|
          f.buzz = duration
        end
        return
      end
      ids.each do |i|
        e = $game_player.followers[i]
        e.buzz = duration if e
      end
    end

    def event_erased?(id); event(id).erased?; end

    def event_erase(ids)
      select_events(ids).not(0).each do |id_event|
        event(id_event).erase
      end
    end

    def show_animation(ids, id_animation, wait_flag=false)
      character = nil
      select_events(ids).each do |id_event|
        character = event(id_event)
        character.animation_id = id_animation
      end
      Fiber.yield while character.animation_id > 0 if wait_flag && character
    end

    def show_balloon(ids, id_balloon, wait_flag=false)
      character = nil
      select_events(ids).each do |id_event|
        character = event(id_event)
        character.balloon_id = id_balloon
      end
      Fiber.yield while character.balloon_id > 0 if wait_flag
    end

    def event_move_speed(ids, v = nil)
      return event(ids).move_speed if !v && ids.is_a?(Fixnum)
      select_events(ids).each do |id_event|
        event(id_event).move_speed = v
      end
    end

    def player_move_speed(v = nil)
      event_move_speed(0, v)
    end

    def event_move_frequency(ids, f = nil)
      return event(ids).move_frequency if !f && ids.is_a?(Fixnum)
      select_events(ids).each do |id_event|
        event(id_event).move_frequency = f
      end
    end

    def player_move_frequency(f = nil)
      event_move_frequency(0, f)
    end

    def event_move_speed_frequency(ids, v, f)
      select_events(ids).each do |id_event|
        event(id_event).move_speed = v
        event(id_event).move_frequency = f
      end
    end

    def player_move_speed_frequency(v, f)
      event_move_speed(0, v)
      event_move_frequency(0, f)
    end

    def event_priority(ids, priority = nil)
      return event(ids).priority_type unless !priority && ids.is_a?(Fixnum)
      select_events(ids).not(0).each do |id_event|
      event(id_event).priority_type = priority
    end
    end

    def event_trigger(ids, trigger = nil)
      return event(ids).trigger unless !trigger && ids.is_a?(Fixnum)
      select_events(ids).not(0).each do |id_event|
        event(id_event).trigger = trigger
      end
    end

    def event_transfert(id, new_x, new_y)
      event(id).moveto(new_x, new_y)
    end

    def player_transfert(new_x, new_y)
      event_transfert(0, new_x, new_y)
    end

    def player_teleport(map_id, x, y, direction, fade_type = 0)
      $game_player.reserve_transfer(map_id, x, y, direction)
      $game_temp.fade_type = fade_type
      Fiber.yield while $game_player.transfer?
    end

    def event_transparent?(id)
      event(id).transparent
    end

    def player_transparent?
      event_transparent?(0)
    end

    def event_transparent(id)
      event(id).transparent = true
    end
    def player_transparent; event_transparent(0); end

    def event_opaque(id)
      event(id).transparent = false
    end
    def player_opaque; event_opaque(0); end

    def event_through?(id); event(id).through; end
    def player_through?; event_through?(0); end

    def event_through(id, flag = true); event(id).through = flag; end
    def player_through(flag = true); event_through(flag); end

    def event_trail(ids, len, mode = 0, tone = nil)
      select_events(ids).each do |id_event|
        event(id_event).trails = len
        event(id_event).trails_prop = {:blend_type => mode, :tone => tone}
      end
    end
    def player_trail(len, mode = 0, tone = nil)
      event_trail(0, len, mode, tone)
    end

    def event_stop_trail(ids)
      select_events(ids).each do |id_event|
        event(id_event).trails_signal = true
      end
    end
    def player_stop_trail; event_stop_trail(0); end

    def event_brutal_stop_trail(ids)
      select_events(ids).each do |id_event|
        event(id_event).trails = 0
      end
    end
    def player_brutal_stop_trail; event_brutal_stop_trail(0); end

    def event_opacity(ids, value = nil)
      return event(ids).opacity unless value
      select_events(ids).each do |id_event|
        event(id_event).opacity = value
      end
    end

    def player_opacity(value = nil)
      event_opacity(0, value)
    end

    def event_move_with(id, *code)
      route = RPG::MoveRoute.new
      route.list = code.map {|i| RPG::MoveCommand.new(i)}
      event(id).force_move_route(route)
    end

    def event_path_length(id, x, y, nth = false)
      return event(id).get_path_length(x, y, noth)
    end

    def player_path_length(x, y, nth = false)
      return event_path_length(0, x, y, nth)
    end

    def player_move_with(*code)
      event_move_with(0, *code)
    end

    def event_move_straight(id, value, turn_ok = true)
      ev = event(id)
      ev.move_straight(value, turn_ok)
      return ev.move_succeed
    end

    def player_move_straight(value, turn_ok = true)
      event_move_straight(0, value, turn_ok)
    end

    def event_move_down(id, turn_ok = true)
      event_move_straight(id, 2, turn_ok)
    end
    def event_move_left(id, turn_ok = true)
      event_move_straight(id, 4, turn_ok)
    end
    def event_move_right(id, turn_ok = true)
      event_move_straight(id, 6, turn_ok)
    end
    def event_move_up(id, turn_ok = true)
      event_move_straight(id, 8, turn_ok)
    end

    def player_move_down(turn_ok = true); event_move_down(0, turn_ok); end
    def player_move_left(turn_ok = true); event_move_left(0, turn_ok); end
    def player_move_right(turn_ok = true); event_move_right(0, turn_ok); end
    def player_move_up(turn_ok = true); event_move_up(0, turn_ok); end

    def event_move_random(id); event(id).move_random; end 
    def player_move_random; event_move_random(0); end

    def event_move_diagonal(id, horizontal, vertical)
      ev = event(id)
      ev.move_diagonal(horizontal, vertical)
      ev.move_succeed
    end

    def player_move_diagonal(horizontal, vertical)
      event_move_diagonal(0, horizontal, vertical)
    end

    def event_move_lower_left(id); event_move_diagonal(id, 4, 2); end
    def event_move_lower_right(id); event_move_diagonal(id, 6, 2); end
    def event_move_upper_left(id); event_move_diagonal(id, 4, 8); end
    def event_move_upper_right(id); event_move_diagonal(id, 6, 8); end

    def player_move_lower_left; event_move_lower_left(0); end
    def player_move_lower_right; event_move_lower_right(0); end
    def player_move_upper_left; event_move_upper_left(0); end 
    def player_move_upper_right; event_move_upper_right(0); end

    def event_move_toward_position(id, x, y)
      ev = event(id)
      ev.move_toward_xy(x, y)
      ev.move_succeed
    end

    def player_move_toward_position(x, y)
      event_move_toward_position(0, x, y)
    end

    def event_move_toward_event(id, target) 
      ev = event(id)
      tr = event(target)
      ev.move_toward_character(tr)
      ev.move_succeed
    end

    def event_move_toward_player(id)
      event_move_toward_event(id, 0)
    end 

    def player_move_toward_event(id)
      event_move_toward_event(0, id)
    end


    def event_move_away_from_position(id, x, y)
      ev = event(id)
      ev.move_away_from_xy(x, y)
      ev.move_succeed
    end

    def player_move_away_from_position(x, y)
      event_move_away_from_position(0, x, y)
    end

    def event_move_away_from_event(id, target) 
      ev = event(id)
      tr = event(target)
      ev.move_away_from_character(tr)
      ev.move_succeed
    end

    def event_move_away_from_player(id)
      event_move_away_from_event(id, 0)
    end 

    def player_move_away_from_event(id)
      event_move_away_from_event(0, id)
    end

    def event_move_forward(id)
      ev = event(id)
      ev.move_forward
      ev.move_succeed
    end
    def player_move_forward; event_move_forward(0); end

    def event_move_backward(id)
      ev = event(id)
      ev.move_backward
      ev.move_succeed
    end
    def player_move_backward; event_move_backward(0); end


    def event_turn_down(id); event_direction(id, 2); end 
    def player_turn_down; event_turn_down(0); end

    def event_turn_left(id); event_direction(id, 4); end 
    def player_turn_left; event_turn_left(0); end

    def event_turn_right(id); event_direction(id, 6); end 
    def player_turn_right; event_turn_right(0); end

    def event_turn_up(id); event_direction(id, 8); end 
    def player_turn_up; event_turn_up(0); end


    def event_turn_90_left(id); event(id).turn_left_90; end
    def player_turn_90_left; event_turn_90_left(0); end 
    def event_turn_90_right(id); event(id).turn_right_90; end
    def player_turn_90_right; event_turn_90_right(0); end
    def event_turn_180(id); event.turn_180; end 
    def player_turn_180; event_turn_180(0); end
    def event_turn_90_right_or_left(id); event(id).turn_right_or_left_90; end
    def player_turn_90_right_or_left; event_turn_90_right_or_left(0); end
    def event_turn_random(id); event(id).turn_random; end 
    def player_turn_random; event_turn_random(0); end

    
    def event_turn_toward_position(id, x, y)
      ev = event(id)
      ev.turn_toward_xy(x, y)
    end

    def player_turn_toward_position(x, y)
      event_turn_toward_position(0, x, y)
    end

    def event_turn_toward_event(id, target) 
      ev = event(id)
      tr = event(target)
      ev.turn_toward_character(tr)
    end

    def event_turn_toward_player(id)
      event_turn_toward_event(id, 0)
    end 

    def player_turn_toward_event(id)
      event_turn_toward_event(0, id)
    end


    def event_turn_away_from_position(id, x, y)
      ev = event(id)
      ev.turn_away_from_xy(x, y)
    end

    def player_turn_away_from_position(x, y)
      event_turn_away_from_position(0, x, y)
    end

    def event_turn_away_from_event(id, target) 
      ev = event(id)
      tr = event(target)
      ev.turn_away_from_character(tr)
    end

    def event_turn_away_from_player(id)
      event_turn_away_from_event(id, 0)
    end 

    def player_turn_away_from_event(id)
      event_turn_away_from_event(0, id)
    end



    #--------------------------------------------------------------------------
    # * Move event to x, y coords
    #--------------------------------------------------------------------------
    def move_to(id, x, y, w=false, no_t = false); event(id).move_to_position(x, y, w, no_t); end
    #--------------------------------------------------------------------------
    # * Jump event to x, y coords
    #--------------------------------------------------------------------------
    def jump_to(id, x, y, w=true); event(id).jump_to(x, y, w); end

    # Fix for EE4
    alias_method :collide?, :events_collide?
    alias_method :look_at, :event_look_at?
    alias_method :look_at?, :look_at
    alias_method :buzz, :events_buzz
    append_commands
  end

  #==============================================================================
  # ** Skills
  #------------------------------------------------------------------------------
  #  Skills commands
  #==============================================================================

  module Skills

    def skill_name(id); $data_skills[id].name; end
    def skill_note(id); $data_skills[id].note; end
    def skill_description(id); $data_skills[id].description; end
    def skill_icon(id); $data_skills[id].icon_index; end
    def skill_scope(id)
      $data_skills[id].scope
    end
    def skill_has_no_scope?(id)
      skill_scope(id) == 0
    end
    def skill_for_one_enemy?(id)
      skill_scope(id) == 1
    end
    def skill_for_all_enemies?(id)
      skill_scope(id) == 2
    end
    def skill_for_one_random_enemy?(id)
      skill_scope(id) == 3
    end
    def skill_for_two_random_enemies?(id)
      skill_scope(id) == 4
    end
    def skill_for_three_random_enemies?(id)
      skill_scope(id) == 5
    end
    def skill_for_four_random_enemies?(id)
      skill_scope(id) == 6
    end
    def skill_for_one_ally?(id)
      skill_scope(id) == 7
    end
    def skill_for_all_allies?(id)
      skill_scope(id) == 8
    end
    def skill_for_one_dead_ally?(id)
      skill_scope(id) == 9
    end
    def skill_for_all_dead_allies?(id)
      skill_scope(id) == 10
    end
    def skill_for_caller?(id)
      skill_scope(id) == 11
    end
    def skill_occasion(id)
      $data_skills[id].occasion
    end
    def skill_always_usable?(id)
      skill_occasion(id) == 0
    end
    def skill_battle_usable?(id)
      skill_always_usable(id) || skill_occasion(id) == 1
    end
    def skill_menu_usable?(id)
      skill_always_usable(id) || skill_occasion(id) == 2
    end
    def skill_never_usable?(id)
      skill_occasion(id) == 3
    end
    def skill_for_opponent?(i); $data_skills[i].for_opponent?; end
    def skill_for_friend?(i); $data_skills[i].for_friend?; end
    def skill_for_dead_friend?(i); $data_skills[i].for_dead_friend?; end
    def skill_for_one?(i); $data_skills[i].for_one?; end
    def skill_for_random?(i); $data_skills[i].for_random?; end
    def skill_for_all?(i); $data_skills[i].for_all?; end
    def skill_need_selection?(i); $data_skills[i].need_selection?; end
    def skill_certain?(i); $data_skills[i].certain?; end
    def skill_physical?(i); $data_skills[i].physical?; end
    def skill_magical?(i); $data_skills[i].magical?; end
    def skill_number_of_targets(i); $data_skills[i].number_of_targets; end
    def skill_speed(i); $data_skills[i].speed; end
    def skill_nb_hits(i); $data_skills[i].repeats; end
    def skill_success_rate(i); $data_skills[i].success_rate; end
    def skill_tp_gain(i); $data_skills[i].tp_gain; end

    append_commands
  end

  #==============================================================================
  # ** Mathematics
  #------------------------------------------------------------------------------
  #  Math cmds
  #==============================================================================
  module Mathematics
    def pi; Math::PI; end
    def acos(x); Math.acos(x); end
    def acosh(x); Math.acosh(x); end
    def asin(x); Math.asin(x); end
    def asinh(x); Math.asinh(x); end
    def atan(x); Math.atan(x); end
    def atan2(x, y); Math.atan2(x, y); end
    def atanh(x); Math.atanh(x); end
    def cos(x); Math.cos(x); end
    def cosh(x); Math.cosh(x); end
    def hypot(x, y); Math.hypot(x, y); end
    def sin(x); Math.sin(x); end
    def sinh(x); Math.sinh(x); end
    def sqrt(x); Math.sqrt(x); end
    def tan(x); Math.tan(x); end
    def tanh(x); Math.tanh(x); end
    def to_deg(x); (x.to_f)*57.2957795; end
    def to_rad(x); (x.to_f)/57.2957795; end
    # This ugly method is only for preserve the precision !
    def mantissa(x)
      [0, x.to_s.split('.')[1]].join('.').to_f
    end
    #--------------------------------------------------------------------------
    # * Find angle from a couple of point
    #--------------------------------------------------------------------------
    def angle_xy(xa, ya, xb, yb)
      - Math.atan2(yb-ya, xb-xa)*57.29%360
    end
    append_commands
  end

  #==============================================================================
  # ** TroopAndEnemy
  #------------------------------------------------------------------------------
  #  cmd about troops
  #==============================================================================

  module TroopAndEnemy

    def enemy(id)
      return id.enemy if id.is_a?(Game_Enemy)
      $data_enemies[id]
    end
    def troop(id); $data_troops[id]; end
    def troop_size(id); troop(id).members.length; end
    def troop_name(id); troop(id).name; end
    def troop_members(id); troop(id).members.collect{|e| e.enemy_id}; end
    def troop_member(id, pos); troop_members(id)[pos]; end
    def troop_member_x(id, pos); troop(id).members[pos].x; end
    def troop_member_y(id, pos); troop(id).members[pos].y; end

    def picture_show_enemy(id_pic, id, pos)
      x = troop_member_x(id, pos)
      y = troop_member_y(id, pos)
      enemy = enemy(troop_member(id, pos))
      picture = enemy.battler_name
      picture_name = "Battlers/"+picture
      bmp = Cache.battler(picture, enemy.battler_hue)
      w, h = bmp.width/2, bmp.height
      c(:picture_show, id_pic, picture_name, x, y, [w, h])
    end

    def monster_battler_dimension(pos)
      enemy = enemy(troop_member(current_troop, pos))
      picture = enemy.battler_name
      picture_name = "Battlers/"+picture
      bmp = Cache.battler(picture, enemy.battler_hue)
      return [bmp.width, bmp.height]
    end
    def monster_battler_width(i); monster_battler_dimension(i)[0]; end
    def monster_battler_height(i); monster_battler_dimension(i)[1]; end
    def monster_name(id); enemy(id).name; end
    def monster_icon(id); enemy(id).icon_index; end
    def monster_description(id); enemy(id).description; end
    def monster_note(id); enemy(id).note; end
    def monster_max_hp(id); enemy(id).params[0]; end
    def monster_max_mp(id); enemy(id).params[1]; end
    def monster_attack_power(id); enemy(id).params[2]; end
    def monster_defense_power(id); enemy(id).params[3]; end
    def monster_magic_attack_power(id); enemy(id).params[4]; end
    def monster_magic_defense_power(id); enemy(id).params[5]; end
    def monster_agility(id); enemy(id).params[6]; end
    def monster_luck(id); enemy(id).params[7]; end
    def monster_give_exp(id); enemy(id).exp; end
    def monster_give_gold(id); enemy(id).gold; end
    def monster_battler_name(id); enemy(id).battler_name; end
    def monster_battler_hue(id); enemy(id).battler_hue; end
    def current_troop; Kernel.current_troop; end
    # def monster_element_rate(id, element_id)
    #   enemy(id).element_rate(element_id)
    # end

    # Fix for EE4
    alias_method :monster_attack, :monster_attack_power
    alias_method :monster_magic_attack, :monster_magic_attack_power
    alias_method :monster_magic_defense, :monster_magic_defense_power
    alias_method :monster_defense, :monster_defense_power
    alias_method :monster_hp, :monster_max_hp
    alias_method :monster_mp, :monster_max_mp
    alias_method :troop_member_id, :troop_member


    def enemy_hp(id); $game_troop.members[id].hp; end
    def enemy_mp(id); $game_troop.members[id].mp; end
    def enemy_tp(id); $game_troop.members[id].tp; end
    def enemy_max_hp(id); $game_troop.members[id].mhp; end
    def enemy_max_mp(id); $game_troop.members[id].mmp; end
    def enemy_attack(id); $game_troop.members[id].atk; end
    def enemy_defense(id); $game_troop.members[id].def; end
    def enemy_magic_attack(id); $game_troop.members[id].mat; end
    def enemy_magic_defense(id); $game_troop.members[id].mdf; end
    def enemy_agility(id); $game_troop.members[id].agi; end
    def enemy_luck(id); $game_troop.members[id].luk; end
    def enemy_hit_rate(id); $game_troop.members[id].hit; end
    def enemy_evasion_rate(id); $game_troop.members[id].eva; end
    def enemy_critical_rate(id); $game_troop.members[id].cri; end
    def enemy_critical_evasion_rate(id); $game_troop.members[id].cev; end
    def enemy_magical_evasion_rate(id); $game_troop.members[id].mev; end
    def enemy_magical_reflection_rate(id); $game_troop.members[id].mrf; end
    def enemy_counter_attack_rate(id); $game_troop.members[id].cnt; end
    def enemy_hp_regeneration_rate(id); $game_troop.members[id].hrg; end
    def enemy_mp_regeneration_rate(id); $game_troop.members[id].mrg; end
    def enemy_tp_regeneration_rate(id); $game_troop.members[id].trg; end
    def enemy_target_rate(id); $game_troop.members[id].tgr; end
    def enemy_guard_effect_rate(id); $game_troop.members[id].grd; end
    def enemy_recovery_effect_rate(id); $game_troop.members[id].rec; end
    def enemy_pharmacology(id); $game_troop.members[id].pha; end
    def enemy_mp_cost_rate(id); $game_troop.members[id].mcr; end
    def enemy_tp_charge_rate(id); $game_troop.members[id].tcr; end
    def enemy_physical_damage_rate(id); $game_troop.members[id].pdr; end
    def enemy_magical_damage_rate(id); $game_troop.members[id].mdr; end
    def enemy_floor_damage_rate(id); $game_troop.members[id].fdr; end
    def enemy_experience_rate(id); $game_troop.members[id].exr; end
    def enemy_hidden?(id); $game_troop.members[id].hidden?; end
    def enemy_die?(id); $game_troop.members[id].hp <= 0; end
    def current_enemies; $game_troop.members; end
    def total_enemies; $game_troop.members.size; end
    def active_actor
      return BattleManager.actor.id if BattleManager.actor
      nil
    end
    def active_actor?; !!active_actor; end

    append_commands
  end

  #==============================================================================
  # ** Texts
  #------------------------------------------------------------------------------
  #  cmd about texts
  #==============================================================================

  module Texts

    #--------------------------------------------------------------------------
    # * Display a text
    #--------------------------------------------------------------------------
    def text_show(id, *args)
      Game_Screen.get.texts[id].show(*args)
    end

    #--------------------------------------------------------------------------
    # * Texte movement
    #--------------------------------------------------------------------------
    def text_move(id, duration, wait_flag, x, y, zoom_x = -1,
        zoom_y = -1, opacity = -1, blend_type = -1, origin = -1)
      Game_Screen.get.texts[id].move(
        duration, x, y, zoom_x, zoom_y, opacity,
        blend_type, origin
      )
      wait(duration) if wait_flag
    end

    def text_move?(id)
      Game_Screen.get.texts[id].move?
    end

    #--------------------------------------------------------------------------
    # * Erase
    #--------------------------------------------------------------------------
    def text_erase(id)
      Game_Screen.get.texts[id].erase
    end
    #--------------------------------------------------------------------------
    # * Change text
    #--------------------------------------------------------------------------
    def text_change(id, value)
      Game_Screen.get.texts[id].text_value = value
    end
    #--------------------------------------------------------------------------
    # * Change profile
    #--------------------------------------------------------------------------
    def text_profile(id, profile = nil)
      return Game_Screen.get.texts[id].profile unless profile
      Game_Screen.get.texts[id].profile = profile
    end
    #--------------------------------------------------------------------------
    # * Rotation
    #--------------------------------------------------------------------------
    def text_rotate(id, speed)
      Game_Screen.get.texts[id].rotate(speed)
    end

    #--------------------------------------------------------------------------
    # * Modify x position
    #--------------------------------------------------------------------------
    def text_x(id, x=false, duration = nil, wf = false)
      return Game_Screen.get.texts[id].x unless x
      if duration.is_a?(Fixnum)
        Game_Screen.get.texts[id].target_x = x
        Game_Screen.get.texts[id].duration = duration
        wait(duration) if wf
      else
        Game_Screen.get.texts[id].x = x
      end
    end

    #--------------------------------------------------------------------------
    # * Modify y position
    #--------------------------------------------------------------------------
    def text_y(id, y=false, duration = nil, wf = false)
      return Game_Screen.get.texts[id].y unless y
      if duration.is_a?(Fixnum)
        Game_Screen.get.texts[id].target_y = y
        Game_Screen.get.texts[id].duration = duration
        wait(duration) if wf
      else
        Game_Screen.get.texts[id].y = y
      end
    end

    #--------------------------------------------------------------------------
    # * change position
    #--------------------------------------------------------------------------
    def text_position(id, x, y, duration = nil, wf = false)
      text_x(id, x, duration)
      text_y(id, y, duration, wf)
    end

    #--------------------------------------------------------------------------
    # * Modify zoom x
    #--------------------------------------------------------------------------
    def text_zoom_x(id, x=false, duration = nil, wf = false)
      return Game_Screen.get.texts[id].zoom_x unless x
      if duration.is_a?(Fixnum)
        Game_Screen.get.texts[id].target_zoom_x = x
        Game_Screen.get.texts[id].duration = duration
        wait(duration) if wf
      else
        Game_Screen.get.texts[id].zoom_x = x
      end
    end

    #--------------------------------------------------------------------------
    # * Modify zoom y
    #--------------------------------------------------------------------------
    def text_zoom_y(id, y=false, duration = nil, wf = false)
      return Game_Screen.get.texts[id].zoom_y unless y
      if duration.is_a?(Fixnum)
        Game_Screen.get.texts[id].target_zoom_y = y
        Game_Screen.get.texts[id].duration = duration
        wait(duration) if wf
      else
        Game_Screen.get.texts[id].zoom_y = y
      end
    end

    #--------------------------------------------------------------------------
    # * change zoom
    #--------------------------------------------------------------------------
    def text_zoom(id, x, y, duration = nil, wf = false)
      text_zoom_x(id, x, duration)
      text_zoom_y(id, y, duration, wf)
    end

    #--------------------------------------------------------------------------
    # * Change Text Opacity
    #--------------------------------------------------------------------------
    def text_opacity(id, value = nil, duration = nil, wf = false)
      return Game_Screen.get.texts[id].opacity unless value
      if duration.is_a?(Fixnum)
        Game_Screen.get.texts[id].target_opacity = value
        Game_Screen.get.texts[id].opacity_duration = duration
        wait(duration) if wf
      else
        Game_Screen.get.texts[id].opacity = value
      end
    end

    def text_value(id)
      Game_Screen.get.texts[id].text_value
    end

    def text_angle(id, value = nil)
      return Game_Screen.get.texts[id].angle unless value
      Game_Screen.get.texts[id].angle = value
    end

    def text_progressive(id, value, delay)
      value.each_char do |ch| 
        yield if block_given?
        text_change(id, text_value(id) + ch)
        wait(delay)
      end 
    end

    #--------------------------------------------------------------------------
    # * Clear all texts
    #--------------------------------------------------------------------------
    def texts_clear; Game_Screen.get.clear_texts; end

    append_commands
  end

  #==============================================================================
  # ** Time
  #------------------------------------------------------------------------------
  #  cmd about Time
  #==============================================================================

  module CmdTime

    #--------------------------------------------------------------------------
    # * Get the current year
    #--------------------------------------------------------------------------
    def time_year; Time.now.year ;end
    #--------------------------------------------------------------------------
    # * Get the current month
    #--------------------------------------------------------------------------
    def time_month; Time.now.month; end
    #--------------------------------------------------------------------------
    # * Get the current day
    #--------------------------------------------------------------------------
    def time_day; Time.now.day; end
    #--------------------------------------------------------------------------
    # * Get the current hour
    #--------------------------------------------------------------------------
    def time_hour; Time.now.hour; end
    #--------------------------------------------------------------------------
    # * Get the current min
    #--------------------------------------------------------------------------
    def time_min; Time.now.min; end
    #--------------------------------------------------------------------------
    # * Get the current sec
    #--------------------------------------------------------------------------
    def time_sec; Time.now.sec; end

    append_commands

  end

  #==============================================================================
  # ** Socket
  #------------------------------------------------------------------------------
  #  cmd about Socket
  #==============================================================================

  module TCP

    #--------------------------------------------------------------------------
    # * Check Socket
    #--------------------------------------------------------------------------
    def socket_connected?
      Socket.instance && Socket.instance.connected?
    end

    #--------------------------------------------------------------------------
    # * Connect to serveur
    #--------------------------------------------------------------------------
    def socket_connect(address, port)
      Socket.instance.close if socket_connected?
      Socket.instance = Socket.new(address, port)
      Socket.instance.connect!
    end

    #--------------------------------------------------------------------------
    # * Disconnect of serveur
    #--------------------------------------------------------------------------
    def socket_disconnect
      Socket.instance.close
    end

    #--------------------------------------------------------------------------
    # * Send data
    #--------------------------------------------------------------------------
    def socket_send(data)
      return unless socket_connected?
      Socket.instance.send(data)
    end

    #--------------------------------------------------------------------------
    # * Recv data
    #--------------------------------------------------------------------------
    def socket_recv(len = 1024)
      return false unless socket_connected?
      Socket.instance.recv(len)
    end

    #--------------------------------------------------------------------------
    # * Wait a response
    #--------------------------------------------------------------------------
    def socket_wait_recv(len = 1024)
      return false unless socket_connected?
      flag = false
      while !flag
        Graphics.update
        Input.update
        flag = socket_recv(len)
      end
      flag
    end

    ## EE4 fixtures
    alias_method :server_single_close_connection, :socket_disconnect
    alias_method :server_single_connect, :socket_connect
    alias_method :server_single_recv, :socket_recv
    alias_method :server_single_send, :socket_send
    alias_method :server_single_wait_recv, :socket_wait_recv

    append_commands

  end

  #==============================================================================
  # ** Scene
  #------------------------------------------------------------------------------
  #  cmd about scene navigation
  #==============================================================================

  module Scene

    #--------------------------------------------------------------------------
    # * Go to title Screen
    #--------------------------------------------------------------------------
    def call_title_screen
      SceneManager.call(Scene_Title)
    end
    #--------------------------------------------------------------------------
    # * Go to Load Screen
    #--------------------------------------------------------------------------
    def call_load_screen
      SceneManager.call(Scene_Load)
    end

    #--------------------------------------------------------------------------
    # * call scene
    #--------------------------------------------------------------------------
    def scene_call(scene)
      SceneManager.call(scene)
    end

    #--------------------------------------------------------------------------
    # * Goto scene
    #--------------------------------------------------------------------------
    def scene_goto(scene)
      SceneManager.goto(scene)
    end

    #--------------------------------------------------------------------------
    # * Return scene
    #--------------------------------------------------------------------------
    def scene_return
      SceneManager.return
    end

    #--------------------------------------------------------------------------
    # * Clear scene history
    #--------------------------------------------------------------------------
    def scene_clear_history
      SceneManager.clear
    end


    append_commands

  end

  #==============================================================================
  # ** Save
  #------------------------------------------------------------------------------
  #  cmd about saves
  #==============================================================================

  module Save

    #--------------------------------------------------------------------------
    # * Start new Game from the RMVXAce Editor
    #--------------------------------------------------------------------------
    def start_new_game
      DataManager.setup_new_game
      SceneManager.goto(Scene_Map)
      $game_map.autoplay
    end

    #--------------------------------------------------------------------------
    # * Save Game
    #--------------------------------------------------------------------------
    def save_game(index)
      DataManager.save_game(index - 1)
    end

    #--------------------------------------------------------------------------
    # * Load Game
    #--------------------------------------------------------------------------
    def load_game(index, time=100)
      DataManager.load_game(index-1)
      fadeout(time)
      $game_system.on_after_load
      SceneManager.goto(Scene_Map)
    end

    #--------------------------------------------------------------------------
    # * Determine if save exists
    #--------------------------------------------------------------------------
    def a_save_exists?
      DataManager.save_file_exists?
    end

    #--------------------------------------------------------------------------
    # * Determine if save exists
    #--------------------------------------------------------------------------
    def save_exists?(index)
      File.exists?(DataManager.make_filename(index-1))
    end

    #--------------------------------------------------------------------------
    # * Delete save
    #--------------------------------------------------------------------------
    def save_delete(index)
      DataManager.delete_save_file(index-1)
    end

    #--------------------------------------------------------------------------
    # * Import_data
    #--------------------------------------------------------------------------
    def import_variable(ids, idvar); DataManager.export(ids-1)[:variables][idvar]; end
    def import_switch(ids, idswitch); DataManager.export(ids-1)[:switches][idswitch]; end
    def import_label(ids, idlabel); DataManager.export(ids-1)[:labels][idlabel]; end

    # Fix for EE4
    alias_method :delete_save, :save_delete

    append_commands
  end

  #==============================================================================
  # ** Areas
  #------------------------------------------------------------------------------
  #  Areas commands
  #==============================================================================

  module AreaCmds
    def create_rect_area(x, y, width, height); Area::Rect.new(x, y, width, height); end
    def create_circle_area(x, y, rayon); Area::Circle.new(x, y, rayon); end
    def create_ellipse_area(x, y, width, height); Area::Ellipse.new(x, y, width, height); end
    def create_polygon_area(*points); Area::Polygon.new(*points); end
    def in_area?(area, x, y); area.in?(x, y); end
    def mouse_hover_area?(area); area.hover?; end
    def mouse_hover_square_area?(area); area.square_hover?; end
    def mouse_click_area?(area, k=nil); area.click?; end
    def mouse_click_square_area?(area, k=nil); area.square_click?; end

    def mouse_trigger_area?(area, k=:mouse_left)
      area.trigger?(k)
    end
    def mouse_trigger_square_area?(area, k=:mouse_left)
      area.square_trigger?(k)
    end

    def mouse_press_area?(area, k=:mouse_left)
      area.press?(k)
    end
    def mouse_press_square_area?(area, k=:mouse_left)
      area.square_press?(k)
    end

    def mouse_release_area?(area, k=:mouse_left)
      area.release?(k)
    end
    def mouse_release_square_area?(area, k=:mouse_left)
      area.square_release?(k)
    end

    def mouse_repeat_area?(area, k=:mouse_left)
      area.repeat?(k)
    end
    def mouse_repeat_square_area?(area, k=:mouse_left)
      area.square_repeat?(k)
    end

    # EE4 compatibilities
    alias_method :mouse_square_hover_area?, :mouse_hover_square_area?
    alias_method :mouse_clicked_area?, :mouse_click_area?
    alias_method :mouse_square_clicked_area?, :mouse_click_square_area?
    alias_method :mouse_triggered_area?, :mouse_trigger_area?
    alias_method :mouse_square_triggered_area?, :mouse_trigger_square_area?
    alias_method :mouse_pressed_area?, :mouse_press_area?
    alias_method :mouse_square_pressed_area?, :mouse_press_square_area?
    alias_method :mouse_released_area?, :mouse_release_area?
    alias_method :mouse_square_released_area?, :mouse_release_square_area?
    alias_method :mouse_repeated_area?, :mouse_repeat_area?
    alias_method :mouse_square_repeated_area?, :mouse_repeat_square_area?

    append_commands
  end

  #==============================================================================
  # ** Clipboard
  #------------------------------------------------------------------------------
  #  Clipboar commands
  #==============================================================================
  module RMEClipboard
    def clipboard_push_text(text); Clipboard.push_text(text); end
    def clipboard_get_text; Clipboard.get_text; end
    def clipboard_push_command(cmd); Clipboard.push_command(cmd); end
    append_commands
  end

  #==============================================================================
  # ** Pad360
  #------------------------------------------------------------------------------
  #  Vibration commands
  #==============================================================================

  module Pad360
    def pad360_plugged?(id = 0); Devices::XBOX360Pad.plugged?(id);  end
    def pad360_stop_vibration_left(id = 0)
      Devices::XBOX360Pad.stop_left_vibration(id)
    end
    def pad360_stop_vibration_right(id = 0)
      Devices::XBOX360Pad.stop_right_vibration(id)
    end
    def pad360_vibrate(id = 0, left = 100, right = 100)
      Devices::XBOX360Pad.left_vibration(id, left)
      Devices::XBOX360Pad.right_vibration(id, right)
    end
    def pad360_stop_vibration(id = 0)
      Devices::XBOX360Pad.stop_left_vibration(id)
      Devices::XBOX360Pad.stop_right_vibration(id)
    end
    def pad360_vibrate_left(id = 0, s = 100)
      Devices::XBOX360Pad.left_vibration(id, s)
    end
    def pad360_vibrate_right(id = 0, s = 100)
      Devices::XBOX360Pad.right_vibration(id, s)
    end
    append_commands
  end

  #==============================================================================
  # ** Textfields
  #------------------------------------------------------------------------------
  #  Textfields commands
  #==============================================================================

  module Textfields

    def scene; SceneManager.scene; end

    def textfield_text_show(id, text, x, y, w, profile, range = false, active = true, op = 255)
      scene.add_textfield(id, UI::Window_Textfield.new(x, y, w, text, profile, range))
      textfield_opacity(id, op)
      textfield_activate(id)
    end

    def textfield_int_show(id, number, x, y, w, profile, range = false, active = true, op = 255)
      scene.add_textfield(id, UI::Window_Intfield.new(x, y, w, text, profile, range))
      textfield_opacity(id, op)
      textfield_activate(id)
    end

    def textfield_float_show(id, number, x, y, w, profile, range = false, active = true, op = 255)
      scene.add_textfield(id, UI::Window_Floatfield.new(x, y, w, text, profile, range))
      textfield_opacity(id, op)
      textfield_activate(id)
    end

    def textfield_erase(id = nil)
      unless id
        scene.erase_textfields
        return
      end
      scene.erase_textfield(id)
    end

    def textfield_activate(id)
      scene.unactivate_textfields
      scene.textfields[id].activate if scene.textfields[id]
    end

    def textfield_deactivate(id = nil)
      unless id
        scene.unactivate_textfields
        return
      end
      scene.textfields[id].deactivate if scene.textfields[id]
    end

    def textfield_active?(id)
      return scene.textfields[id].active? if scene.textfields[id]
      false
    end

    def textfield_get_value(id)
      return scene.textfields[id].value if scene.textfields[id]
      ""
    end

    def textfield_set_value(id, value)
      scene.textfields[id].value = value if scene.textfields[id]
    end

    def textfield_hover?(id)
      return scene.textfields[id].in?(Mouse.x, Mouse.y) if scene.textfields[id]
      false
    end

    def textfield_click?(id)
      textfield_hover?(id) && Mouse.click?
    end

    [:press?, :release?, :trigger?, :repeat?].each do |m|
      define_method("textfield_#{m}") do |id, *key|
        key = key[0] || :mouse_left
        textfield_hover?(id) && Mouse.send(m, key)
      end
    end

    def textfield_visible(id, flag)
      scene.textfields[id].visibility = !!flag if scene.textfields[id]
    end

    def textfield_visible?(id)
      return scene.textfields[id].visible if scene.textfields[id] && !scene.textfields[id].disposed?
      false
    end

    def textfield_opacity(id, opacity = nil)
      if scene.textfields[id]
        return scene.textfields[id].opacity unless opacity
        scene.textfields[id].opacity = opacity%256
      end
      0
    end

    append_commands
  end

  #==============================================================================
  # ** CmdSounds
  #------------------------------------------------------------------------------
  #  Command for Sound manipulation
  #==============================================================================

  class RPG::BGM
    attr_accessor :name
  end

  module CmdSounds

    def bgm_play(name, volume=100, pitch=100)
      RPG::BGM.new(name, volume, pitch).play
    end
    def bgs_play(name, volume=80, pitch=100)
      RPG::BGS.new(name, volume, pitch).play
    end
    def se_play(name, volume=80, pitch=100)
      RPG::SE.new(name, volume, pitch).play
    end
    def me_play(name, volume=100, pitch=100)
      RPG::ME.new(name, volume, pitch).play
    end

    def bgm_volume(volume)
      RPG::BGM.last.replay.volume = volume
    end
    def bgs_volume(volume)
      RPG::BGS.last.replay.volume = volume
    end

    def bgm_pitch(pitch)
      RPG::BGM.last.replay.pitch = pitch
    end
    def bgs_pitch(pitch)
      RPG::BGS.last.replay.pitch = pitch
    end

    def bgm_fade(wait, frame=false)
      wait *= frame ? 17 : 1000
      RPG::BGM.fade(wait)
    end
    def bgs_fade(wait, frame=false)
      wait *= frame ? 17 : 1000
      RPG::BGS.fade(wait)
    end
    def me_fade(wait, frame=false)
      wait *= frame ? 17 : 1000
      RPG::ME.fade(wait)
    end
    def sound_fade(wait, frame=false)
      wait *= frame ? 17 : 1000
      RPG::BGM.fade(wait)
      RPG::BGS.fade(wait)
      RPG::ME.fade(wait)
    end

    def bgm_stop; RPG::BGM.stop; end
    def bgs_stop; RPG::BGS.stop; end
    def se_stop; RPG::SE.stop; end
    def me_stop; RPG::ME.stop; end
    def sound_stop
      RPG::BGM.stop
      RPG::BGS.stop
      RPG::SE.stop
      RPG::ME.stop
    end

    def save_bgm; $game_system.save_bgm; end
    def replay_bgm; $game_system.replay_bgm; end

    append_commands
  end


  #==============================================================================
  # ** Camera
  #------------------------------------------------------------------------------
  #  Command for Camera manipulation
  #==============================================================================
  module Camera

    CENTER_X = (Graphics.width / 32 - 1) / 2.0
    CENTER_Y = (Graphics.height / 32 - 1) / 2.0

    def camera_scroll(direction, distance, speed)
      Fiber.yield while $game_map.scrolling?
      $game_map.start_scroll(direction, distance, speed)
    end

    def camera_move_on(x, y)
      $game_map.set_display_pos(x-CENTER_X, y-CENTER_Y)
    end

    def camera_scroll_on(x, y, speed)
      Fiber.yield while $game_map.scrolling?
      camera_scroll(((dx = $game_map.display_x) > x)?4:6, (dx-x).abs-CENTER_X, speed)
      Fiber.yield while $game_map.scrolling?
      camera_scroll(((dy = $game_map.display_y) > y)?8:2, (dy-y).abs-CENTER_Y, speed)
    end

    def camera_lock; $game_map.target_camera = nil; end
    def camera_unlock; $game_map.target_camera = $game_player; end

    def camera_change_focus(event_id)
      e = event(event_id)
      camera_move_on(e.x, e.y)
      $game_map.target_camera = e
    end

    def camera_zoom(zoom, duration = 0, wait_flag = false, ease = :linear)
      Graphics.screen.set_transition('zoom', zoom, duration, ease)
      wait(duration) if wait_flag
    end
    def camera_motion_blur(v, duration = 0, wait_flag = false, ease = :linear)
      Graphics.screen.set_transition('motion_blur', v, duration, ease)
      wait(duration) if wait_flag
    end

    append_commands
  end

  #==============================================================================
  # ** Screen
  #------------------------------------------------------------------------------
  #  Change screen data
  #==============================================================================
  module Screen

    def screen_fadeout(duration)
      Fiber.yield while $game_message.visible
      screen.start_fadeout(duration)
      wait(duration)
    end

    def screen_fadein(duration)
      Fiber.yield while $game_message.visible
      screen.start_fadein(duration)
      wait(duration)
    end

    def screen_tone(tone, duration, wait_flag = false)
      $game_map.screen.start_tone_change(tone, duration)
      wait(duration) if wait_flag
    end

    def screen_flash(color, duration, wait_flag = false)
      screen.start_flash(color, duration)
      wait(duration) if wait_flag
    end

    def screen_shake(power, speed, duration, wait_flag = false)
      $game_map.screen.start_shake(power, speed, duration)
      wait(duration) if wait_flag
    end

    def screen_width; Graphics.width; end
    def screen_height; Graphics.height; end

    def screen_pixelation(v, duration = 0, wait_flag = false, ease = :linear)
      Graphics.screen.set_transition('pixelation', v, duration, ease)
      wait(duration) if wait_flag
    end
    def screen_blur(v, duration = 0, wait_flag = false, ease = :linear)
      Graphics.screen.set_transition('blur', v, duration, ease)
      wait(duration) if wait_flag
    end

    append_commands
  end

  #==============================================================================
  # ** Window
  #------------------------------------------------------------------------------
  #  uhu
  #==============================================================================

  module CmdWindow

    def create_text_window(id, content, x, y, w=-1, h=-1, op = 255, closed=nil)
      f = Window_Text.new(x, y, content, w, h, closed)
      SceneManager.scene.add_window(id, f)
    end

    def create_commands_window(id, x, y, w, hash, op = 255,  closed =nil, h = hash.size)
      f = Window_EvCommand.new(x, y, w, h, hash, closed)
      SceneManager.scene.add_window(id, f)
    end

    def create_horizontal_commands_window(id, x, y, hash, op=255, closed = nil, rows = hash.length)
      f = Window_EvHorzCommand.new(x, y, rows, hash, closed)
      SceneManager.scene.add_window(id, f)
    end

    def create_selectable_window(id, x, y, width, height, hash, op=255, closed = nil)
      f = Window_EvSelectable.new(x, y, width, height, hash, closed)
      SceneManager.scene.add_window(id, f)
    end

    def remove_window(id)
      SceneManager.scene.erase_window(id)
    end

    def remove_all_windows
      SceneManager.scene.erase_windows
    end

    def close_window(id)
      SceneManager.scene.windows[id].close if SceneManager.scene.windows[id]
    end

    def open_window(id)
      SceneManager.scene.windows[id].open if SceneManager.scene.windows[id]
    end

    def window_closed?(id); SceneManager.scene.windows[id].close?; end
    def window_opened?(id); SceneManager.scene.windows[id].open?; end

    def window_content(id, content = nil, resize = false)
      return SceneManager.scene.windows[id].content unless content
      SceneManager.scene.windows[id].content = content
      SceneManager.scene.windows[id].refresh(resize)
    end

    def window_moveto(id, x, y, duration = 0, wf = false)
      SceneManager.scene.windows[id].move_position(x, y, duration)
      wait(duration) if wf
    end

    def window_dimension(id, width, height, duration = 0, wf = false)
      if duration > 0
        SceneManager.scene.windows[id].move_size(x, y, duration)
        wait(duration) if wf
        return
      end
      SceneManager.scene.windows[id].width = width
      SceneManager.scene.windows[id].height = height
    end

    def window_opacity(id, value = nil, duration = 0, wf = false)
      return SceneManager.scene.windows[id].opacity unless value
      if duration > 0
        SceneManager.scene.windows[id].move_opacity(value, duration)
        wait(duration) if wf
        return
      end
      SceneManager.scene.windows[id].opacity = value
    end

    def window_move(id, x, y, w, h, opacity, duration = 0, wf = false)
      SceneManager.scene.windows[id].extra_move(x, y, w, h, opacity, duration)
      wait(duration) if wf
    end

    def window_current_symbol(id)
      SceneManager.scene.windows[id].current_symbol
    end

    def window_activate(id)
      SceneManager.scene.windows[id].activate
    end

    def window_deactivate(id)
      SceneManager.scene.windows[id].deactivate
    end

    def window_width(id)
      SceneManager.scene.windows[id].width
    end

    def window_height(id)
      SceneManager.scene.windows[id].height
    end

    def window_x(id, x = nil)
      return SceneManager.scene.windows[id].x unless x
      SceneManager.scene.windows[id].x = x
    end

    def window_y(id, y = nil)
      return SceneManager.scene.windows[id].y unless y
      SceneManager.scene.windows[id].y = y
    end

    append_commands
  end

end

#
# Cette partie concerne les scripts expérimentaux
#

=begin
Implémentation de trucs potentiellement cool pour la future GUI
état tout à fait incumbatif, bien naturellement : c'est dans l'incubator.
=end

#==============================================================================
# ** Bilou
#------------------------------------------------------------------------------
#  Bilou is the best example for anything
#==============================================================================

class Bilou < Viewport
  def initialize(x,y,w,h,c,draggable=false)
    super(x,y,w,h)
    Draggable << self if draggable
    self.color = c
  end
end

class SuperBilou < Viewport
  attr_accessor :inner, :style
  def initialize(x,y,w,h)
    super(x,y,w,h)
    @x,@y,@width,@height = x,y,w,h
    @style = Gui::Style.new
    Gui::CSS.apply_to(self)
    @background = Sprite.new(self)
    @inner = Rect.new
    @inner >> rect
    update_background
    Draggable << self
  end
  def update_background
    @background.bitmap = Bitmap.new(self.width, self.height)
    r = Rect.new(0, 0, self.width, self.height)
    @style.contract_with(:margin, r)
    @background.bitmap.fill_rect(r, @style[:border_color])
    @style.contract_with(:border, r)
    @background.bitmap.fill_rect(r, @style[:background_color])
    @style.contract_with(:padding, r)
    @inner.set(r)
  end
  def compute_self
    super
    update_background
  end
end

class GrosTest
  def initialize
    @viewport = Viewport.new(50,50,300,300)
  end
end


=begin
Implémentation du mode large (actuellement bloqué dans l'incubator, en mode Unsafe)
Code chelou par raho, reste par Grim
=end

if RME.unsafe?

  #==============================================================================
  # ** SceneManager
  #------------------------------------------------------------------------------
  #  This module manages scene transitions. For example, it can handle
  # hierarchical structures such as calling the item screen from the main menu
  # or returning from the item screen to the main menu.
  #==============================================================================

  module SceneManager
    class << self
      alias_method :incubator_run, :run
      #--------------------------------------------------------------------------
      # * Execute
      #--------------------------------------------------------------------------
      def run
        Graphics.overlayer = Sprite.new
        Graphics.overlayer.viewport = Viewport.new
        Graphics.overlayer.viewport.z = 1000
        Graphics.retreive_bitmap
        incubator_run
      end
    end
  end

  #==============================================================================
  # ** Graphics
  #------------------------------------------------------------------------------
  #  Ugly Graphics Monkeypatch
  #==============================================================================
  module Graphics

    #------------------------------------------------------------------------
    # * Singleton
    #------------------------------------------------------------------------
    class << self

      #------------------------------------------------------------------------
      # * Public instance variables
      #------------------------------------------------------------------------
      attr_accessor :overlayer

      #------------------------------------------------------------------------
      # * Retreive bitmap
      #------------------------------------------------------------------------
      def retreive_bitmap
        black = Color.new(0,0,0,255)
        Graphics.overlayer.bitmap = Bitmap.new(Graphics.width, Graphics.height)
        r = Rect.new(0,0,Graphics.width, Graphics.height)
        Graphics.overlayer.bitmap.fill_rect(r, black)
      end

      #------------------------------------------------------------------------
      # * Freezes the current screen in preparation for transitions.
      #------------------------------------------------------------------------
      def freeze
        Graphics.overlayer.bitmap = snap_to_bitmap
      end

      #------------------------------------------------------------------------
      # * Performs a fade-out of the screen.
      #------------------------------------------------------------------------
      def fadeout(frames)
        steps = 255.0/frames.to_f
        1.upto(frames) do |k|
          Graphics.brightness = 255.0 - (steps * k)
          Graphics.wait(1)
        end
      end

      #------------------------------------------------------------------------
      # * Performs a fade-in of the screen.
      #------------------------------------------------------------------------
      def fadein(frames)
        steps = 255.0/frames.to_f
        frames.times do |k|
          Graphics.brightness = steps * k.to_f
          Graphics.wait(1)
        end
      end

      #------------------------------------------------------------------------
      # * The brightness of the screen
      #------------------------------------------------------------------------
      def brightness
        255 - Graphics.overlayer.opacity
      end
      #------------------------------------------------------------------------
      # * change The brightness of the screen
      #------------------------------------------------------------------------
      def brightness=(val)
        Graphics.overlayer.opacity = 255.0 - val.to_f
      end

      #------------------------------------------------------------------------
      # * Carries out a transition from the screen frozen by Graphics.freeze
      #   to the current screen.
      #------------------------------------------------------------------------
      def transition(duration = 10, filename=nil, wave=nil)
        Graphics.overlayer.bitmap = Bitmap.new(filename) if filename
        Graphics.overlayer.opacity = 255
        steps = 255.0 / duration.to_f
        duration.times do |k|
          Graphics.overlayer.opacity = 255.0 - (steps * k.to_f)
          Graphics.wait(1)
        end
        Graphics.overlayer.bitmap.dispose if Graphics.overlayer.bitmap
        retreive_bitmap
      end

    end

  end

  #==============================================================================
  # ** Resolution
  #------------------------------------------------------------------------------
  #  Hack in the matrice :'( :'(
  #==============================================================================
  module Resolution
    extend self
    #------------------------------------------------------------------------
    # * ... no idea
    #------------------------------------------------------------------------
    def fresh_pointer(reg, v)
      addr = Externlib::LoadLibraryA.call(Externlib::RGSSDLL)
      ptr = DL::CPtr.new(addr + reg)
      ptr[0, v.size] = v
    end
    #------------------------------------------------------------------------
    # * ... pack dimension
    #------------------------------------------------------------------------
    def pack_dimension(width, height)
      [
        [width, height],[width+32, height+32],
        [-(~(width/32)), -(~(height/32))]
      ].collect{|elt| elt.pack('ll').scan(/..../)}
    end
    #------------------------------------------------------------------------
    # * ... Oh yeah, i'm currently listening a nice song !
    #------------------------------------------------------------------------
    def map_reg(width, height)
      empty_buff = [].pack('x4')
      (buff_aa, buff_ab), (buff_ba, buff_bb),
      (buff_ca, buff_cb) = *pack_dimension(width, height)
      {
        6495 => "\x90"*5, 6564 => buff_ab, 6569 => buff_aa,
        6742 => buff_ab, 6747 => buff_aa, 8438 => buff_aa,
        8447 => buff_aa, 8454 => buff_ab, 8463 => buff_ab,
        116195 => empty_buff, 116200 => empty_buff,
        128119 => buff_ab, 128124 => buff_aa, 135679 => buff_bb,
        135684 => buff_ba, 138621 => buff_cb[0], 138753 => buff_ca[0],
        1105576=> buff_ab, 1105581=> buff_aa, 1105631=> buff_ab,
        1105648=> buff_aa, 1105684=> buff_ab, 1105688=> buff_aa,
        1105736=> buff_ab, 1105740=> buff_aa, 1107623=> buff_aa,
        1107651=> buff_ab, 1109673=> buff_aa, 1109689=> buff_ab
      }.each{|k, v| fresh_pointer(k, v)}
    end
    #------------------------------------------------------------------------
    # * ... Change resolution
    #------------------------------------------------------------------------
    def change(w, h)
      map_reg(w, h)
      Graphics.resize_screen(w, h)
    end
  end

end


if RME.unsafe?

  #==============================================================================
  # ** Scene_Map
  #------------------------------------------------------------------------------
  #  This class performs the map screen processing.
  #==============================================================================

  class Scene_Map
    #--------------------------------------------------------------------------
    # * Post Processing for Transferring Player
    #--------------------------------------------------------------------------
    alias_method :incubator_post_t, :post_transfer
    def post_transfer
      @spriteset.incubator_refresh_viewports
      incubator_post_t
    end
  end

  #==============================================================================
  # ** Spriteset_Map
  #------------------------------------------------------------------------------
  #  This class brings together map screen sprites, tilemaps, etc. It's used
  # within the Scene_Map class.
  #==============================================================================

  class Spriteset_Map
    #--------------------------------------------------------------------------
    # * Retreive a correct rect
    #--------------------------------------------------------------------------
    def correct_rect
      real_w = $game_map.width * 32
      real_h = $game_map.height * 32
      loop_h = $game_map.loop_vertical?
      loop_w = $game_map.loop_horizontal?
      coeffx = coeffy = 0
      coeffx = (Graphics.width - real_w)/2 if Graphics.width > real_w  && !loop_w
      coeffy = (Graphics.height - real_h)/2 if Graphics.height > real_h  && !loop_h
      coeffw = (loop_w) ? Graphics.width : [Graphics.width, real_w].min
      coeffh = (loop_h) ? Graphics.height : [Graphics.height, real_h].min
      Rect.new(coeffx, coeffy, coeffw, coeffh)
    end
    #--------------------------------------------------------------------------
    # * Create Viewport
    #--------------------------------------------------------------------------
    def create_viewports
      r = correct_rect
      @viewport1 = Viewport.new(r)
      @viewport2 = Viewport.new(r)
      @viewport3 = Viewport.new(r)
      @viewport2.z = 50
      @viewport3.z = 100
    end
    #--------------------------------------------------------------------------
    # * Refresh viewports
    #--------------------------------------------------------------------------
    def incubator_refresh_viewports
      r = correct_rect
      [@viewport1, @viewport2, @viewport3].each do |vp|
        vp.rect.set(r)
      end
    end
  end

  #==============================================================================
  # ** Game_Map
  #------------------------------------------------------------------------------
  #  This class handles maps. It includes scrolling and passage determination
  # functions. The instance of this class is referenced by $game_map.
  #==============================================================================

  class Game_Map
    #--------------------------------------------------------------------------
    # * Scroll Down
    #--------------------------------------------------------------------------
    def scroll_down(distance)
      if loop_vertical?
        @display_y += distance
        @display_y %= @map.height * 256
        @parallax_y += distance if @parallax_loop_y
      else
        last_y = @display_y
        tile_y = (Graphics.height > (height * 32)) ? height : screen_tile_y
        @display_y = [@display_y + distance, (height - tile_y)].min
        @parallax_y += @display_y - last_y
      end
    end
    #--------------------------------------------------------------------------
    # * Scroll Right
    #--------------------------------------------------------------------------
    def scroll_right(distance)
      if loop_horizontal?
        @display_x += distance
        @display_x %= @map.width * 256
        @parallax_x += distance if @parallax_loop_x
      else
        last_x = @display_x
        tile_x = (Graphics.width > (width * 32)) ? width : screen_tile_x
        @display_x = [@display_x + distance, (width - tile_x)].min
        @parallax_x += @display_x - last_x
      end
    end
  end


end

# -*- coding: utf-8 -*-
#==============================================================================
# ** RME
#------------------------------------------------------------------------------
#  With :
# Grim (original project)
# Nuki (a lot of things)
# Raho (general reformulation)
# Zeus81 (a lot of help)
# Hiino (some help and GUI Components)
# Joke (some help)
# Zangther (some help)
# XHTMLBoy (koffie)
# Fabien (Buzzer)
# Kaelar (Improvement)
#
#==============================================================================

=begin

License coming soon

=end

#==============================================================================
# ** Scene_Map
#------------------------------------------------------------------------------
#  This class performs the map screen processing.
#==============================================================================

class Scene_Map
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :tools_update, :update
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    tools_update
    update_eval if $TEST
  end
  #--------------------------------------------------------------------------
  # * Update eval
  #--------------------------------------------------------------------------
  def update_eval

    if (!@box || @box.disposed?)  &&Keyboard.trigger?(RME::Config::KEY_EVAL)
      @old_call_menu = $game_system.menu_disabled
      $game_system.menu_disabled = true
      @box = Graphical_Eval.new
    else
      if ((@box && !@box.disposed?) && Keyboard.any?(:trigger?, RME::Config::KEY_EVAL, :esc) && (
        !@box.in_completion?))
        @box.dispose
        Game_Temp.in_game = true
        @box = nil
        sleep(0.5)
        $game_system.menu_disabled = @old_call_menu
        return
      end
      @box.update if @box
    end

  end
end


#==============================================================================
# ** Graphical_eval
#------------------------------------------------------------------------------
#  Provide a GUI toplevel
#==============================================================================

class Graphical_Eval
  
  class << self 
    
    attr_accessor :stack, :cursor
    Graphical_Eval.stack = Array.new
    Graphical_Eval.cursor = 0
      
  end

  #--------------------------------------------------------------------------
  # * Build Object
  #--------------------------------------------------------------------------
  def initialize
    @disposed = false
    init_fonts
    base_init
    create_box
    create_toolbox
    create_consistent_block
    create_textfield
    create_checkbox
    create_marker
    create_buttons
    @candidates = nil
  end
  
  #--------------------------------------------------------------------------
  # * Init fonts
  #--------------------------------------------------------------------------
  def init_fonts
    @font = Font.new("Arial")
    @font.color = Color.new(255, 255, 255)
    @font.size = 15
    @font.shadow = false 
    @font.bold = false
    @font.outline = false
    @textfield_font = @font.clone 
    @textfield_font.color = Color.new('#000000')
    @toolbox_font = @font.clone 
    @toolbox_font.size = 14
    @success_font = @toolbox_font.clone 
    @failure_font = @toolbox_font.clone 
    @success_font.color = Color.new('#00FF00')
    @failure_font.color = Color.new('#FF0000')
  end
  
  #--------------------------------------------------------------------------
  # * Init coords
  #--------------------------------------------------------------------------
  def base_init
    Game_Temp.in_game = false
    @height = 58+12
    @y = Graphics.height - @height
    @title_height = 18
  end
  
  #--------------------------------------------------------------------------
  # * Create General Box
  #--------------------------------------------------------------------------
  def create_box
    @box = Gui::Pannel.new(
      width: 100.percent, 
      height: @height,
      title: "Ingame tester",
      x: 0, 
      y: @y, 
      z: 4000,
      padding: 0,
      margin: 6,
      border_color: Color.new('#113F59')
    )
    @title_lab = Gui::Label.new(
      parent: @box.outer,
      x: 70.percent, 
      font: @font,
      value: 'Copy as',
      z: 4500
    )
    @run_lab = Gui::Label.new(
      parent: @box.outer,
      font: @font,
      value: 'Run', 
      z: 4500
    )
    @run_lab.set(
      x: @box.outer.width - @run_lab.width - 8
    )
  end
  
  #--------------------------------------------------------------------------
  # * Create consistent block
  #--------------------------------------------------------------------------
  def create_consistent_block 
    @bg = Gui::Box.new(
      parent: @box, 
      width: 30.percent,
      height: @box.inner.height - @toolbox.height, 
      background_color: Color.new('#19BEC0'),
      border: 0,
      x: 70.percent,
      margin: 0, 
      padding: 0,
    )
  end
  
  #--------------------------------------------------------------------------
  # * Create tool box
  #--------------------------------------------------------------------------
  def create_toolbox
    h = 12
    @toolbox = Gui::Box.new(
      parent: @box, 
      width: 100.percent,
      height: h, 
      background_color:  Color.new('#113F59'),
      border: 0, 
      y: @box.inner.height - h,
      margin: 0,
      padding: 0,
    )  
  end
  
  #--------------------------------------------------------------------------
  # * Create textfield
  #--------------------------------------------------------------------------
  def create_textfield
    @textfield = 
      Gui::TextField.new(
        parent: @box, 
        width: 70.percent, 
        height: @box.inner.height - @toolbox.height,
        border: 0,
        margin: 2,
      )
    @textfield.activate
  end
  
  #--------------------------------------------------------------------------
  # * Create checkbox
  #--------------------------------------------------------------------------
  def create_checkbox
    @checkbox = Gui::CheckBox.new(
      parent: @toolbox, 
      position: :relative,
      border: 0,
      border_color: Color.new(0, 0, 0, 0), 
      background_color: Color.new(0, 0, 0, 0), 
      font: @toolbox_font, 
      checked_label: '[X] console output',
      unchecked_label: '[  ] console output', 
      margin: 0, 
      padding: 0,
    )
    @checkbox.check
  end
  
  #--------------------------------------------------------------------------
  # * Create marker
  #--------------------------------------------------------------------------
  def create_marker
    @marker = Gui::Label.new(
      parent: @toolbox,
      font: @font,
      value:" "
    )
    
  end
  
  #--------------------------------------------------------------------------
  # * Create buttons
  #--------------------------------------------------------------------------
  def create_buttons
    @copy_as_text = Gui::Button.new(
      parent: @bg, 
      margin: 3, 
      width: 33.percent, 
      height: 100.percent,
      title: 'TXT',
      trigger: trigger do 
          unless @textfield.formatted_value.empty?
            Clipboard.push_text(@textfield.formatted_value)
            msgbox("Script line pushed in the clipboard (as a text)")
          end
        end
    )
    @copy_as_ev = Gui::Button.new(
      parent: @bg, 
      margin: 3, 
      width: 33.percent, 
      height: 100.percent,
      title: 'EVT',
      x: 33.percent,
      trigger: trigger do 
          unless @textfield.formatted_value.empty?
            rpg_command = RPG::EventCommand.new(355, 0, [@textfield.formatted_value])
            Clipboard.push_command(rpg_command)
            msgbox("Script line pushed in the clipboard (as an event's command)")
          end
        end
    ) 
    @run = Gui::Button.new(
      parent: @bg, 
      margin: 3, 
      width: 33.percent, 
      height: 100.percent,
      title: '►',
      x: 66.percent,
      trigger: trigger { execute_command }
    ) 
  end
  
  #--------------------------------------------------------------------------
  # * Valid marker
  #--------------------------------------------------------------------------
  def build_passing 
    @marker.set(font: @success_font)
    @marker.value = 'success'
    @marker.set(x: @toolbox.width - @marker.width)
  end
  
  #--------------------------------------------------------------------------
  # * Invalid
  #--------------------------------------------------------------------------
  def build_failure
    @marker.set(font: @failure_font)
    @marker.value = 'failure'
    @marker.set(x: @toolbox.width - @marker.width)
  end
  
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    update_cursor
    execute_command if Devices::Keys::Enter.trigger? && !in_completion?
    a = @textfield.formatted_value
    @textfield.update
    update_completion if Devices::Keys::Tab.trigger? && !in_completion?
    update_completion_box
  end
  
  #--------------------------------------------------------------------------
  # * Update Autocompletion
  #--------------------------------------------------------------------------
  def update_completion(i = 0)
    candidates = completion_candidates.reverse 
    return if candidates.length < 2
    @token = candidates.pop
    @candidates = candidates
    draw_completion_box(i)
  end

  #--------------------------------------------------------------------------
  # * Draw completion box
  #--------------------------------------------------------------------------
  def draw_completion_box(i = 0)
    fon = Font.new(Font.default_name, 16)
    fon.color = Color.new('#113f59')
    fon.outline = false
    @i = i % (@candidates.length)
    @last_text_completed = @textfield.formatted_value
    @candidates = @candidates.rotate(@i)
    destroy_completion
    @completion_list = Gui::Box.new(z: 5000)
    @completion_candidates = []
    @candidates.each_index do |c|
      if (c == @candidates.length - 1)
        fon.color = Color.new('#6a3639')
        fon.bold = true
      end
      @completion_candidates[c] = Gui::Label.new(
        parent: @completion_list,
        value: @candidates[c],
        y: 18*c,
        font: fon
      )
    end
    @completion_list.set(
      x: @textfield.cursor_screen_x,
      y: @textfield.cursor_screen_y - @completion_list.height
    )
  end

  #--------------------------------------------------------------------------
  # * Update completion
  #-------------------------------------------------------------------------- 
  def update_completion_box
    return unless in_completion?
    if Devices::Keys::Esc.trigger? || @textfield.formatted_value != @last_text_completed
      return destroy_completion 
    end
    update_completion(@i - 1) if Devices::Keys::Tab.trigger? || Devices::Keys::Up.trigger?
    update_completion(@i + 1) if Devices::Keys::Down.trigger?
    if Devices::Keys::Enter.trigger?
      len = @token.length + 1
      new_value = @textfield.formatted_value[0..-len]
      @textfield.value = new_value + @candidates.last.to_s
      destroy_completion
    end
  end 


  #--------------------------------------------------------------------------
  # * Has completion_box
  #--------------------------------------------------------------------------  
  def in_completion?
    @completion_list && !@completion_list.disposed?
  end

  #--------------------------------------------------------------------------
  # * Destroy completion
  #--------------------------------------------------------------------------  
  def destroy_completion
    @completion_list.dispose if @completion_list
  end

  #--------------------------------------------------------------------------
  # * Completion candidates
  #--------------------------------------------------------------------------  
  def completion_candidates
    i = @textfield.recorder.virtual_position
    @textfield.formatted_value.complete_at_point(i)
  end
  
  #--------------------------------------------------------------------------
  # * Update cursor
  #--------------------------------------------------------------------------
  def update_cursor
    return if self.class.stack.length == 0
    if not in_completion?
      if (Devices::Keys::Up.trigger? || Devices::Keys::Down.trigger?)
        self.class.cursor += (Keys::Down.press?) ? 1 : -1 
        self.class.cursor = self.class.cursor % self.class.stack.length
        @textfield.value = self.class.stack[self.class.cursor]
      end
    end
  end
  
  #--------------------------------------------------------------------------
  # * Filter with damerau_levenshtein
  #--------------------------------------------------------------------------
  def filter(key, candidates)
    candidates.uniq!
    candidates.delete(:method_missing)
    candidates.collect!(&:to_s)
    candidates.sort_by! {|i| i.damerau_levenshtein(key)}
    key_a = "Did you mean maybe [#{candidates[0]}]"
    key_b = candidates.length > 1 ? ", or [#{candidates[1]}] ?" : " ?"
    return "[#{key}] does not exist.\n#{key_a}#{key_b}"
  end
  
  #--------------------------------------------------------------------------
  # * Execute code
  #--------------------------------------------------------------------------
  def execute_command
    commands = @textfield.formatted_value
    return if commands.empty?
    begin 
      raw_command = commands
      commands = "p #{commands}" if @checkbox.checked?
      build_passing
      eval(commands, $game_map.interpreter.get_binding)
      $game_map.need_refresh = true
      self.class.stack << raw_command if raw_command != self.class.stack[-1]
      self.class.cursor = self.class.stack.length-1
      return
    rescue NameError => error
      if error.instance_of?(NoMethodError)
        message = filter(error.name, Exception.last_noMethod.methods)
      else
        message = filter(error.name, Command.singleton_methods)
      end
    rescue SyntaxError => syntaxFailure 
      message = syntaxFailure.message.split(/\:\d+\:/)[-1].strip 
    rescue Exception => exc
      message = "#{exc.message}"    
    end 
    build_failure
    msgbox(message)
  end

  #--------------------------------------------------------------------------
  # * Dispose
  #--------------------------------------------------------------------------
  def dispose 
    @box.dispose
    @run_lab.dispose
    @title_lab.dispose
    @disposed = true
  end

  #--------------------------------------------------------------------------
  # * Disposed ? 
  #--------------------------------------------------------------------------
  def disposed? 
    @disposed
  end
  
end

# -*- coding: utf-8 -*-
#==============================================================================
# ** RME DocGenerator
#------------------------------------------------------------------------------
# With:
#  Nuki
#  Grim
#  Joke
#
#==============================================================================

#==============================================================================
# ** Doc Generator
#------------------------------------------------------------------------------
#  Make the documentation of RME
#==============================================================================

module DocGenerator

  class << self
    #--------------------------------------------------------------------------
    # *  Create Json file
    #--------------------------------------------------------------------------
    def to_json
      result = Array.new
      RME::Doc.commands.each do |category, data|
        puts "Generate #{category}.json"
        json_data =
          [
            "{\"name\":\"#{data[:name]}\",\"desc\":\"#{data[:desc]}\",",
            "\"commands\":[#{rdoc(data[:commands])}]}"
          ].join('')
        result << json_data
      end
      a  = "var documentation = [" + result.join(',') + "];\n"
      puts "Generate Samples"
      a += 'var rme_samples = ' + ASample.to_json + ";\n"
    end

    # A continuer ! Gestion des paramètres et tout :D
    def rdoc(commands)
      kname = lambda{|x| (x =~ /.+\.(.+)/) && $1}
      res = Array.new
      commands.each do |name, data|
        puts "Generate #{name}.json"
        h =
          [
            "{\"name\":\"#{kname.(name)}\", ",
            "\"description\":\"#{data[:description]}\", ",
            "\"returnable\":#{data[:returnable]},",
            "\"parameters\":[#{params(data[:attributes])}]"
          ].join('')
        f = '}'
        res << h + f
      end
      res.join(',')
    end

    def params(parameters)
      res = Array.new
      parameters.each do |name, t|
        res << "{\"name\":\"#{name}\", \"desc\":\"#{t[0]}\", \"type\":\"#{t[1]}\"}"
      end
      return res.join(',')
    end
  end

  #==============================================================================
  # ** Doc Generator in Markdown
  #------------------------------------------------------------------------------
  #  Make the documentation of RME
  #==============================================================================

  module Markdown
    #--------------------------------------------------------------------------
    # * Singleton
    #--------------------------------------------------------------------------
    extend self

    #--------------------------------------------------------------------------
    # * Markdown tags
    #--------------------------------------------------------------------------
    def header(t); ""; end
    def footer; ""; end
    def nl; "  \n"; end
    def np; "\n"*2; end
    def title(size, value); ("#"*size ) + " " + value.to_s + "\n"; end
    def strong(value); "**#{value}**"; end
    def strong_t(value, n=""); '##### '+value.to_s; end
    def italic(value); "*#{value}*"; end
    def ul; ""; end
    def end_ul; np; end
    def li(item); "*    #{item}"+"\n"; end
    def enum(t, v); li("**#{t}** : #{v}"); end
    def code(lang, snippet); "```#{lang}"+nl+snippet+nl+"```"; end
    def inline_code(c); "`#{c}`"; end
    def table(*titles)
      titles.join("|") + nl + (["---"] * titles.length).join(" | ") + nl
    end
    def tr(*values); values.join("|") + nl; end
    def end_table; ""; end
    def blockquote(s); "> #{s}"+np; end
    def link(text, url); "[#{text}](#{url.gsub(/\s/, '%20')})"; end
    def line; "  \n- - -  \n"; end

    #--------------------------------------------------------------------------
    # * Data Navigation
    #--------------------------------------------------------------------------
    def index; "README"; end
    def cmdindex; "Liste des commandes"; end
    def clindex; "Classes et modules"; end
    def extension; "md"; end
  end

  #==============================================================================
  # ** Doc Generator in HTML
  #------------------------------------------------------------------------------
  #  Make the documentation of RME
  #==============================================================================

  module HTML
    #--------------------------------------------------------------------------
    # * Singleton
    #--------------------------------------------------------------------------
    extend self

    #--------------------------------------------------------------------------
    # * Markdown tags
    #--------------------------------------------------------------------------
    def header(t)
     "<!DOCTYPE html><html><head><meta charset='utf-8' /><title>#{t}</title></head>"
    end
    def footer; "</body></html>"; end
    def nl; "  \n"; end
    def np; "<br /><br />"; end
    def title(size, value); ("<h#{size}>") + value.to_s + "</h#{size}>\n"; end
    def strong(value); "<strong>#{value}</strong>"; end
    def strong_t(value, n=""); "<strong name='#{n}' id='#{n}'>#{value}</strong>"; end
    def italic(value); "<i>#{value}</i>"; end
    def ul; "<ul>"; end
    def end_ul; "</ul>"; end
    def li(item); "<li>#{item}</li>"+"\n"; end
    def enum(t, v); li("<strong>#{t}</strong> : #{v}"); end
    def code(lang, snippet); "<pre><code class='#{lang}'>"+nl+snippet+nl+"</code></pre>"; end
    def inline_code(c); "<code>#{c}</code>"; end
    def table(*titles)
      "<table border='1'><tr><th>" + titles.join("</th><th>") + "</th></tr>"
    end
    def tr(*values); "<tr><td>"+values.join("</td><td>") + "</td></tr>"; end
    def end_table; "</table>"; end
    def blockquote(s); "<blockquote>#{s}</blockquote>"; end
    def link(text, url); "<a href='#{url}'>#{text}</a>"; end
    def line; "<hr />"; end

    #--------------------------------------------------------------------------
    # * Data Navigation
    #--------------------------------------------------------------------------
    def index; "index"; end
    def cmdindex; "Liste des commandes"; end
    def clindex; "Classes et modules"; end
    def extension; "html"; end
  end

  #==============================================================================
  # ** Do
  #------------------------------------------------------------------------------
  #  Make the documentation of RME
  #==============================================================================

  module Do
    #--------------------------------------------------------------------------
    # * Singleton
    #--------------------------------------------------------------------------
    extend self

    #--------------------------------------------------------------------------
    # * Index
    #--------------------------------------------------------------------------
    def index(mdl)
      mdl.index + "." + mdl.extension
    end

    #--------------------------------------------------------------------------
    # * Command Index
    #--------------------------------------------------------------------------
    def cmdindex(mdl)
      mdl.cmdindex + "." + mdl.extension
    end

    #--------------------------------------------------------------------------
    # * Class Index
    #--------------------------------------------------------------------------
    def clindex(mdl)
      mdl.clindex + "." + mdl.extension
    end

    #--------------------------------------------------------------------------
    # * File name
    #--------------------------------------------------------------------------
    def filename(mdl, classname)
      classname.to_s.gsub(":", "_").gsub(".", "_") + "." + mdl.extension
    end

    #--------------------------------------------------------------------------
    # * Create Front page (header)
    #--------------------------------------------------------------------------
    def make_header(mdl)
      h = mdl.header("")
      t = mdl.title(1, RME::Doc.vocab[:title])
      d = RME::Doc.vocab[:desc] + mdl.np
      h + t + d
    end

    #--------------------------------------------------------------------------
    # * Create class page (header)
    #--------------------------------------------------------------------------
    def make_class_header(mdl, classname)
      h = make_header(mdl)
      a = mdl.link(RME::Doc.vocab[:index], index(mdl))
      a = a + " > " + mdl.link(RME::Doc.vocab[:cl_title], clindex(mdl))
      a = a + " > " + mdl.strong(classname)
      t = mdl.title(1, classname)
      d = RME::Doc.schema[classname][:description] + mdl.np
      h + a + mdl.line + t + d
    end

    #--------------------------------------------------------------------------
    # * Create Command page (header)
    #--------------------------------------------------------------------------
    def make_cmd_header(mdl, classname)
      h = make_header(mdl)
      a = mdl.link(RME::Doc.vocab[:index], index(mdl))
      a = a + " > " + mdl.link(RME::Doc.vocab[:cmd_title], cmdindex(mdl))
      a = a + " > " + mdl.strong(RME::Doc.commands[classname][:name])
      t = mdl.title(1, RME::Doc.commands[classname][:name])
      d = RME::Doc.commands[classname][:desc] + mdl.np
      h + a + mdl.line + t + d
    end

    #--------------------------------------------------------------------------
    # * Create attribute list
    #--------------------------------------------------------------------------
    def make_class_attributes(mdl, classname)
      k = RME::Doc.schema[classname][:attributes]
      if k.length > 0
        t = mdl.title 2, RME::Doc.vocab[:l_attr]
        t += mdl.table(RME::Doc.vocab[:l_name], RME::Doc.vocab[:l_desc])
        k.each do |atr, desc|
          t += mdl.tr(mdl.inline_code(atr), desc)
        end
        return t + mdl.end_table
      end
      ""
    end

    #--------------------------------------------------------------------------
    # * Create Method list
    #--------------------------------------------------------------------------
    def make_class_methods(mdl, c, title_i = RME::Doc.vocab[:m_desc], title_c = RME::Doc.vocab[:m_list], proc = IDENTITY, snip = true)
      k = Hash[c.sort]
      if k.length > 0
        ls = mdl.title 2, title_c + mdl.ul
        t = mdl.title 2, title_i
        k.each do |name, data|
          desc = data[:description]
          atr = data[:attributes]
          ret = data[:returned]
          inline_args = ""
          inline_args2 = ""
          atr_list = ""
          atr_list = mdl.table(RME::Doc.vocab[:l_name], RME::Doc.vocab[:l_type], RME::Doc.vocab[:l_desc]) if atr.length > 0
          atr.each do |name, dt|
            inline_args2 += name.to_s + "-"
            inline_args += name.to_s+ ", "
            atr_list += mdl.tr(mdl.inline_code(name.to_s), mdl.inline_code(dt[1]), dt[0])
          end
          name = proc.call(name) || name
          atr_list += mdl.end_table
          inline_args = inline_args[0...-2]
          inline_args = (atr.length == 0 ? "" : "(#{inline_args})")
          inline_args2 = inline_args2[0...-1]
          name2 = name.to_s.gsub("*", "").gsub("?", "").gsub("!", "").gsub(".", "").downcase
          inline_args2 = (atr.length == 0 ? "" : "#{inline_args2}".gsub("*", "").gsub("?", "").gsub("!", "").gsub(".", "").downcase)
          t += mdl.strong_t("#{name}#{inline_args}", "#{name2}#{inline_args2}")
          snippet = ""
          snippet = mdl.np + make_class_snippet(mdl, c[name]) + mdl.np if snip
          t += mdl.np + mdl.blockquote(desc) + mdl.nl + atr_list + snippet
          ls += mdl.li(mdl.link("#{name}#{inline_args}", "#{'#'+"#{name2}#{inline_args2}"}"))
        end
        return ls + mdl.end_ul + t
      end
      return ""
    end

    #--------------------------------------------------------------------------
    # * Create Commands list
    #--------------------------------------------------------------------------
    def make_cmd_methods(mdl, classname)
      kname = lambda{|x| (x =~ /.+\.(.+)/) && $1}
      make_class_methods(mdl, classname, RME::Doc.vocab[:cmd_desc], RME::Doc.vocab[:cmd_list], kname, false)
    end

    #--------------------------------------------------------------------------
    # * Create Snippets
    #--------------------------------------------------------------------------
    def make_class_snippet(mdl, c)
      if c[:snippet]
        t = RME::Doc.vocab[:l_sample] + mdl.nl
        t += mdl.code("ruby", c[:snippet]) + mdl.np
        return t
      end
      ""
    end

    #--------------------------------------------------------------------------
    # * Create class page
    #--------------------------------------------------------------------------
    def make_class_page(mdl, klass, index, output)
      name = filename(mdl, klass)
      index += mdl.li(mdl.link(klass, name))
      page = make_class_header(mdl, klass)
      page += make_class_attributes(mdl, klass)
      page += make_class_methods(mdl, RME::Doc.schema[klass][:methods])
      page += mdl.footer
      File.open("#{output}/#{name}", 'w') do |f|
        f.write(page)
      end
      p "#{name} created!"
      return index
    end

    #--------------------------------------------------------------------------
    # * Create command page
    #--------------------------------------------------------------------------
    def make_command_page(mdl, c, command, index, output)
      fname = filename(mdl, "command_#{c}")
      index += mdl.li(mdl.link(command[:name], fname))
      page = make_cmd_header(mdl, c)
      page += make_cmd_methods(mdl, RME::Doc.commands[c][:commands])
      page += mdl.footer
      File.open("#{output}/#{fname}", 'w') do |f|
        f.write(page)
      end
      p "#{fname} created!"
      return index
    end

    #--------------------------------------------------------------------------
    # * Create command index page
    #--------------------------------------------------------------------------
    def make_command_index_page(mdl, output)
      h = make_header(mdl)
      a = mdl.link(RME::Doc.vocab[:index], index(mdl))
      a = a + " > " + mdl.strong(RME::Doc.vocab[:cmd_title])
      l = mdl.ul
      Hash[RME::Doc.commands.sort].each do |c, command|
        l = make_command_page(mdl, c, command, l, output)
      end
      l += mdl.end_ul
      page = h + a + mdl.line + l + mdl.footer
      File.open(output + "/" + cmdindex(mdl), 'w'){|f| f.write(page)}
      p "#{cmdindex(mdl)} created!"
    end

    #--------------------------------------------------------------------------
    # * Create class index page
    #--------------------------------------------------------------------------
    def make_class_index_page(mdl, output)
      h = make_header(mdl)
      a = mdl.link(RME::Doc.vocab[:index], index(mdl))
      a = a + " > " + mdl.strong(RME::Doc.vocab[:cl_title])
      l = mdl.ul
      Hash[RME::Doc.schema.sort].each do |klass, i|
        l = make_class_page(mdl, klass, l, output)
      end
      l += mdl.end_ul
      page = h + a + mdl.line + l + mdl.footer
      File.open(output + "/" + clindex(mdl), 'w'){|f| f.write(page)}
      p "#{clindex(mdl)} created!"
    end

    #--------------------------------------------------------------------------
    # * Create index page
    #--------------------------------------------------------------------------
    def make_index_page(mdl, output)
      h = make_header(mdl)
      a = mdl.strong(RME::Doc.vocab[:index])
      l = mdl.ul
      l += mdl.li(mdl.link(RME::Doc.vocab[:cmd_title], cmdindex(mdl)))
      l += mdl.li(mdl.link(RME::Doc.vocab[:cl_title], clindex(mdl)))
      l += mdl.end_ul
      s = mdl.np + mdl.strong(RME::Doc.vocab[:links]) + mdl.line + mdl.ul
      RME::Doc.links.each{|k,v| s += mdl.li(mdl.link(k, v))}
      s += mdl.end_ul
      page = h + a + mdl.line + l + s + mdl.footer
      File.open(output + "/" + index(mdl), 'w'){|f| f.write(page)}
      p "#{index(mdl)} created!"
    end

    #--------------------------------------------------------------------------
    # * Create documentation
    #--------------------------------------------------------------------------
    def make(mdl, output)
      make_index_page(mdl, output)
      make_class_index_page(mdl, output)
      make_command_index_page(mdl, output)
    end

  end

  #--------------------------------------------------------------------------
  # *  Singleton
  #--------------------------------------------------------------------------
  class << self

    #--------------------------------------------------------------------------
    # *  Render Doc in Markdown
    #--------------------------------------------------------------------------
    def markdown(output)
      Do.make(Markdown, output)
    end
    #--------------------------------------------------------------------------
    # *  Render Doc in HTML
    #--------------------------------------------------------------------------
    def html(output)
      Do.make(HTML, output)
    end

  end

  #==============================================================================
  # ** Check
  #------------------------------------------------------------------------------
  #  Provide documentation fixer (for commands)
  #==============================================================================

  module Checker
    #--------------------------------------------------------------------------
    # *  Singleton
    #--------------------------------------------------------------------------
    class << self
      attr_accessor :documented_methods
      attr_accessor :undocumented_methods
      attr_accessor :orphans
      attr_accessor :raw_methods
      attr_accessor :commands
      #--------------------------------------------------------------------------
      # *  Run
      #--------------------------------------------------------------------------
      def run(output, out_gen, ee=nil)
        get_raw_methods
        Checker.documented_methods = Array.new
        Checker.undocumented_methods = Array.new
        Checker.orphans = Array.new
        Checker.commands = Command.singleton_methods - RME::Doc.internals
        get_raw_methods
        each_commands_methods
        save_report(output, out_gen)
        #ee_report(ee)
      end
      #--------------------------------------------------------------------------
      # *  Process EE report
      #--------------------------------------------------------------------------
      def ee_report(ee)
        g = ""
        eecmd = EE4::Command_Description.singleton_methods
        total = eecmd + Checker.commands
        eev = eecmd.length
        rmev = Checker.commands.select {|k| eecmd.include?(k)}.length
        total = total.uniq.sort.collect do |m|
          rme_call = "-"
          ee_call = "-"
          if eecmd.include?(m)
            ee_call = "#{m}"
            h = EE4::Command_Description.send(m)
            if h[:args] && h[:args].length > 0
              k = h[:args].collect{|a| ((a[:default]) ? "*" : "") + a[:name].downcase[/^\w*/]}
              ee_call += "(" +k.join(",")+")"
            end
          end
          if Command.singleton_methods.include?(m)
            rme_call = "#{m}"
            h = Command.method(m).parameters
            if h.length > 0
              k = h.collect{|k| ((k[0] == :req) ? "" : "*") + k[1].to_s}
              rme_call += "(" +k.join(",")+")"
            end
          end
          "#{rme_call}\t#{ee_call}"
        end
        g += total.join("\n")
        g = "RME\tEE(#{rmev}/#{eev})\n" + g
        FileTools.write(ee, g)
      end
      #--------------------------------------------------------------------------
      # *  Return all documented raw methods
      #--------------------------------------------------------------------------
      def get_raw_methods
        Checker.raw_methods = Array.new
        RME::Doc.commands.each do |category, cmds|
          all_cmds = cmds[:commands].keys.collect {|i| (i.to_s =~ /.+\.(.+)/) && $1}
          Checker.raw_methods += all_cmds.collect(&:to_sym)
        end
      end
      #--------------------------------------------------------------------------
      # *  Iteration on each methods
      #--------------------------------------------------------------------------
      def each_commands_methods
        Checker.documented_methods =
         Checker.commands.select {|i| raw_methods.include?(i)}
        Checker.undocumented_methods = Checker.commands - Checker.raw_methods
        Checker.undocumented_methods.delete(:method_missing)
        Checker.orphans =
          Checker.raw_methods - Checker.documented_methods - Checker.undocumented_methods
      end

      #--------------------------------------------------------------------------
      # *  Save report
      #--------------------------------------------------------------------------
      def save_report(o, b)
        g = ""
        r = "Report,\n"
        r += "\# #{RME::Doc.vocab[:documented]},"
        r += "#{Checker.documented_methods.length}/#{Checker.commands.length}\n,\n"
        r += "\# #{RME::Doc.vocab[:undocumented]},\# #{RME::Doc.vocab[:suggest]}\n"
        Checker.undocumented_methods.each do |c|
          m = RME::Doc.schema[:Command][:methods]["Command.#{c}".to_sym]
          t = "Commande documentée mais non enregistrée" if m
          n = RME::Doc.to_fix.collect {|i| (i.to_s =~ /.+\.(.+)/) && $1}
          n = n.collect(&:to_s).sort_by{|o| o.damerau_levenshtein(c.to_s)}
          t = "Modifier l'enregistrement [#{n[0]}] par  [#{c}]"  if n.length >= 1  && (n[0].damerau_levenshtein(c.to_s)) < 3
          t ||= "Aucune suggestion"
          r += "#{c},#{t}\n"
          if t == "Aucune suggestion"
            g += "\# AUTOGenerated for #{c}\n"
            g += "link_method_documentation 'Command.#{c}', \n"
            params = Command.method(c).parameters
            g += "\t'Your description',\n \t{"
            g += "\n" if params.length > 0
            # Get args
            args = Hash.new
            params.each do |p|
              g += "\t\t"
              g += ":\"*#{p[1]}\"" if p[0] == :opt || p[0] == :rest
              g += ":\"&#{p[1]}\"" if p[0] == :block
              g += ":#{p[1]}" if p[0] == :req
              g += " => [\"Args description\", :ArgType],\n"
            end
            g += "\n\t" if params.length > 0
            g += "}, true \# Maybe changed\n"
            g += "register_command :standard, 'Command.#{c}' \n\n"
          end
          FileTools.write(b, g)
        end
        r += ",\n\# #{RME::Doc.vocab[:orphans]},\# #{RME::Doc.vocab[:suggest]}\n"
        Checker.orphans.each do |c|
          keywords = Checker.undocumented_methods
          keywords.uniq!
          keywords.collect!{|i|i.to_s}
          keywords.sort_by!{|o| o.damerau_levenshtein(c.to_s)}
          s = (keywords.length >= 1) ? "Peut-être faudrait-il remplacer [#{c}] par [#{keywords[0]}]... mais je ne suis pas sur du tout..." : "Aucune suggestion"
          r += "#{c},#{s}\n"
        end
        FileTools.write(o, r)
      end

    end
  end

end

# -*- coding: utf-8 -*-
#==============================================================================
# ** RME Doc
#------------------------------------------------------------------------------
# With:
#  Nuki
#  Raho
#  Grim
#  Hiino
#
#==============================================================================

#==============================================================================
# ** Doc
#------------------------------------------------------------------------------
#  Documentation representation.
#==============================================================================

module Doc
  documentation_define :vocab,
  {
    #doc
    :title     => "RME : RPG Maker Extender",
    :desc      => "Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)",
    :index     => "Documentation",
    #class
    :cl_title  => "Classes et modules",
    #methods
    :m_desc    => "Description des méthodes",
    :m_list    => "Liste des méthodes",
    #commands
    :cmd_title => "Index des commandes",
    :cmd_desc  => "Description des commandes",
    :cmd_list  => "Liste des commandes",
    #labels
    :l_attr    => "Attributs",
    :l_name    => "Nom",
    :l_type    => "Type",
    :l_desc    => "Description",
    :l_sample  => "Exemple",
    #other
    :links     => "Liens utiles",
    :documented   => "Commandes documentées",
    :undocumented => "Commandes non documentées",
    :orphans      => "Commandes inconnues",
    :suggest      => "Suggestion",
    :ease_desc    => "Fonction à utiliser pour effectuer la transition. :linear par défaut."
  }
  documentation_add_link "GitHub", "https://github.com/RMEx/RME"
  documentation_add_link "Manuel d'utilisation (Wiki)", "https://github.com/RMEx/RME/wiki"
end


#==============================================================================
# ** Object
#------------------------------------------------------------------------------
#  The superclass of all classes. Defines the general behavior of objects.
#==============================================================================

class Object
  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Extension de la classe Object"
  link_method_documentation :"Object.delegate",
                            "Délègue une méthode à une autre méthode ou à un attribut",
                            {
                              :obj      => ["Attribut ou méthode à pointer", :Symbol],
                              :method   => ["Méthode à appeler", :Symbol],
                              :m_alias  => ["Alias de la méthode, peut être omis", :Symbol]
                            }
  link_method_documentation :"Object.delegate_accessor",
                            "Délègue les accesseurs, mutateurs d'un attribut à une méthode",
                            {
                              :obj      => ["Attribut ou méthode à pointer", :Symbol],
                              :field    => ["Attribut de l'obj à déléguer", :Symbol]
                            }
  link_method_documentation :"Object.externalize",
                            "Transforme un object 'callable' en méthode",
                            {
                              :obj      => ["Objet callable", :Proc],
                              :m_alias  => ["Nom de la méthode", :Symbol]
                            }
  link_method_documentation :"self.identity",
                            "Renvoie l'instance pointée",
                            {}, true
  link_method_documentation :"self.attr_values",
                            "Renvoie un hash des attributs où la clé est le nom de l'attribut
                            et la valeur est celle de l'attribut",
                            {}, true
  link_method_documentation :"self.buffer",
                            "Renvoie un buffer (pour les Win32API's)",
                            {:size => ["Taille du buffer", :Fixnum]}, true

end

#==============================================================================
# ** Array
#------------------------------------------------------------------------------
#  The Array class
#==============================================================================

class Array
  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Extension des arrays"
  link_method_documentation :"self.to_point",
                            "Retourne l'objet Point, que le tableau ait la forme [x, y] ou [Point]",
                            {}, true
  link_method_documentation :"self.to_xy",
                            "Retourne les valeurs 'x, y', que le tableau ait la forme [x, y] ou [Point]",
                            {}, true
  link_snippet "self.to_xy",
"def foo?(*p)
  x, y = p.to_xy
  bar(x, y)
end
# La méthode foo? pourra recevoir soit (x, y), soit une instance de point en argument"
end

#==============================================================================
# ** Sprite
#------------------------------------------------------------------------------
#  The Sprite class
#==============================================================================

class Sprite
  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Extension des sprites"
  link_method_documentation :"self.rect",
                            "Retourne le rectangle relatif d'un sprite",
                            {}, true
  link_method_documentation :"self.in?",
                            "Vérifie si le point passé en argument (via (x, y), ou via une instance de Point) est inscrit dans le rectangle du sprite",
                            {
                              :x=> ["Coordonnées X du point", :Fixnum],
                              :y=> ["Coordonnées Y du point", :Fixnum]
                            }, true
  link_method_documentation :"self.precise_in?",
                            "Vérifie si le point passé en argument (via (x, y), ou via une instance de Point) est inscrit dans le bitmap du sprite, en tenant compte de la transparence",
                            {
                              :x=> ["Coordonnées X du point", :Fixnum],
                              :y=> ["Coordonnées Y du point", :Fixnum]
                            }, true
  link_method_documentation :"self.hover?",
                            "Vérifie si la souris passe au dessus du rectangle du sprite",
                            {}, true
  link_method_documentation :"self.click?",
                            "Vérifie si la souris clique sur le rectangle du sprite",
                            {}, true
  link_method_documentation :"self.press?",
                            "Vérifie si l'utilisateur a enfoncé la touche de la souris passée en argument au-dessus du rectangle du sprite",
                            {:key => ["Touche d'activation", :Symbol]}, true
  link_method_documentation :"self.trigger?",
                            "Vérifie si l'utilisateur a cliqué une fois avec la touche de la souris passée en argument au-dessus du rectangle du sprite",
                            {:key => ["Touche d'activation", :Symbol]}, true
  link_method_documentation :"self.repeat?",
                            "Vérifie si l'utilisateur a cliqué de manière répétée la touche de la souris passée en argument au-dessus du rectangle du sprite",
                            {:key => ["Touche d'activation", :Symbol]}, true
  link_method_documentation :"self.release?",
                            "Vérifie si l'utilisateur a relâché la touche de la souris passée en argument au-dessus du rectangle du sprite",
                            {:key => ["Touche d'activation", :Symbol]}, true
  link_method_documentation :"self.mouse_x",
                            "Retourne la position x de la souris relative au rectangle du sprite",
                            {}, true
  link_method_documentation :"self.mouse_y",
                            "Retourne la position y de la souris relative au rectangle du sprite",
                            {}, true

end

#==============================================================================
# ** Rect
#------------------------------------------------------------------------------
#  The rectangle class
#==============================================================================

class Rect
  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Extension des rectangles"
  link_method_documentation :"self.in?",
                            "Vérifie si le point passé en argument (via (x, y), ou via une instance de Point) est inscrit dans le rectangle",
                            {
                              :x=> ["Coordonnées X du point", :Fixnum],
                              :y=> ["Coordonnées Y du point", :Fixnum]
                            }, true
  link_method_documentation :"self.hover?",
                            "Vérifie si la souris passe au dessus du rectangle",
                            {}, true
  link_method_documentation :"self.click?",
                            "Vérifie si l'utilisateur a cliqué sur le rectangle",
                            {}, true
  link_method_documentation :"self.press?",
                            "Vérifie si l'utilisateur a enfoncé la touche de la souris passée en argument au-dessus du rectangle",
                            {:key => ["Touche d'activation", :Symbol]}, true
  link_method_documentation :"self.trigger?",
                            "Vérifie si l'utilisateur a cliqué une fois avec la touche de la souris passée en argument au-dessus du rectangle",
                            {:key => ["Touche d'activation", :Symbol]}, true
  link_method_documentation :"self.repeat?",
                            "Vérifie si l'utilisateur a cliqué une fois avec la touche de la souris passée en argument au-dessus du rectangle",
                            {:key => ["Touche d'activation", :Symbol]}, true
  link_method_documentation :"self.release?",
                            "Vérifie si l'utilisateur a relâché la touche de la souris passée en argument au-dessus du rectangle",
                            {:key => ["Touche d'activation", :Symbol]}, true
  link_method_documentation :"self.mouse_x",
                            "Retourne la position x de la souris relative au rectangle",
                            {}, true
  link_method_documentation :"self.mouse_y",
                            "Retourne la position y de la souris relative au rectangle",
                            {}, true

end

#==============================================================================
# ** Bitmap
#------------------------------------------------------------------------------
#  Image representation
#==============================================================================

class Bitmap
  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Extension des Bitmaps"
  link_method_documentation :"self.fast_get_pixel",
                            "Retourne l'objet Color correspondant au point passé en argument (via (x, y), ou via une instance de Point) de manière très rapide",
                            {
                              :x => ["Coordonnées X", :Fixnum],
                              :y => ["Coordonnées Y", :Fixnum]
                            }, true
  link_method_documentation :"self.is_transparent?",
                            "Vérifie si le point passé en argument (via (x, y), ou via une instance de Point) est sur un pixel transparent",
                            {
                              :x => ["Coordonnées X", :Fixnum],
                              :y => ["Coordonnées Y", :Fixnum]
                            }, true
end

#==============================================================================
# ** Fixnum
#------------------------------------------------------------------------------
#  Integer representation
#==============================================================================

class Fixnum
  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Extension des entiers"
  link_method_documentation :"self.to_digit",
                            "Renvoie la représentation textuelle d'un chiffre",
                            {}, true

  link_snippet "self.to_digit", "9.to_digit # :nine"
end

#==============================================================================
# ** String
#------------------------------------------------------------------------------
#  String char extension
#==============================================================================

class String

  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Extension des chaînes de caractères"
  link_method_documentation :"self.extract_numbers",
                            "Renvoie tous les entiers d'une chaîne de caractères",
                            {}, true
  link_method_documentation :"self.damerau_levenshtein",
                            "Renvoie la distance de Damerau–Levenshtein avec
                            une autre chaîne",
                            {:oth => ["Autre chaîne à comparer", :String]}, true

  link_method_documentation :"self.stretch",
                            "Injecte des retours à la ligne dans la chaîne",
                            {:lin_len => ["Taille des lignes", :Fixnum]}, true

end

#==============================================================================
# ** Point
#------------------------------------------------------------------------------
#  Point(x, y) representation
#==============================================================================

class Point
  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Représente un point dans un plan cartésien"
  link_method_documentation :"Point.new",
                            "Constructeur de point",
                            {
                              :x => ["Coordonnées X du point", :Fixnum],
                              :y => ["Coordonnées Y du point", :Fixnum]
                            }, true
  link_method_documentation :"self.set",
                            "Change les coordonnées du point",
                            {
                              :x => ["Coordonnées X du point", :Fixnum],
                              :y => ["Coordonnées Y du point", :Fixnum]
                            }
  link_method_documentation :"self.in?",
                            "Vérifie si un point est inscrit dans un rectangle",
                            {:rect => ["Rectangle à vérifier", :Rect]}, true
  link_method_documentation :"self.null!",
                            "Replace le X et le Y du point à zéro",
                            {}
  link_method_documentation :"self.rotate",
                            "Rotation du point par rapport au point passé en argument (via (x, y), ou via une instance de Point)",
                            {
                              :angle => ["Angle de rotation en degrés décimaux (sens positif = sens trigonométrique)", :Fixnum],
                              :x => ["Coordonnées X du point à l'origine de la rotation", :Fixnum],
                              :y => ["Coordonnées Y du point à l'origine de la rotation", :Fixnum]
                            }
  link_method_documentation :"self.screen_to_sprite",
                            "Transforme les coordonnées du point, de l'écran vers le référentiel du sprite",
                            {:sprite => ["Sprite à vérifier", :Sprite]}
  link_method_documentation :"self.screen_to_bitmap",
                            "Transforme les coordonnées du point, de l'écran vers le référentiel du bitmap en fonction des paramètres du sprite",
                            {:sprite => ["Sprite à vérifier", :Sprite]}
  link_method_documentation :"self.bitmap_to_screen",
                            "Transforme les coordonnées du point, du référentiel du bitmap vers l'écran en fonction des paramètres du sprite",
                            {:sprite => ["Sprite à vérifier", :Sprite]}
end

#==============================================================================
# ** Keys
#------------------------------------------------------------------------------
#  Keys representation
#==============================================================================

class Devices::Keys
  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Représentation des touches clavier/souris, est accessible via Keys, Key, ou Devices::Keys"

  All.select{|x| x!= :none}.each do |key|
    kname = key.to_s
    kcons = "Keys::#{kname.capitalize}"
    link_attr_documentation kcons.to_sym, "Pointe la touche #{kname}"
  end

  link_method_documentation "self.trigger?",
                          "Renvoie true si la touche vient d'être pressée, false sinon",
                          {}, true
  link_method_documentation "self.press?",
                          "Renvoie true si la touche est pressée, false sinon",
                          {}, true
  link_method_documentation "self.release?",
                          "Renvoie true si la touche vient d'être relâchée, false sinon",
                          {}, true
  link_method_documentation "self.repeat?",
                          "Renvoie true si la touche est pressée de manière répétée, false sinon",
                          {}, true

  link_snippet("self.trigger?",
"if Keys::Mouse_left.trigger?
  p :mouse_pressed
end")

end

#==============================================================================
# ** Keyboard
#------------------------------------------------------------------------------
#  Keyboard representation
#==============================================================================

class Devices::Keyboard
  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Représentation du clavier, est accessible via Keyboard"
  Devices::Keys::All.select{|x| x!= :none}.each do |key|
    kname = key.to_s
    sname = ":"+kname
    kcons = "Keys::#{kname.capitalize}"
    link_attr_documentation sname.to_sym, "Pointe la touche #{kcons} (comme argument à passer)"
  end
  link_method_documentation "Keyboard.trigger?",
                          "Renvoie true si la touche passée en argument (cf:attributs) vient d'être pressée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  link_method_documentation "Keyboard.press?",
                          "Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  link_method_documentation "Keyboard.repeat?",
                          "Renvoie true si la touche passée en argument (cf:attributs) est appuyée de manière répétée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  link_method_documentation "Keyboard.release?",
                          "Renvoie true si la touche passée en argument (cf:attributs) vient d'être relâchée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  link_method_documentation "Keyboard.all?",
                          "Renvoie true si toutes les touches passées à keys sont activées selon la méthode passée à method",
                          {
                            :method => ["Méthode pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activées selon la méthode", :Argslist]
                          }, true
  link_snippet "Keyboard.all?", "p 'A, B et C sont pressées' if Keyboard.all?(:press?, :a, :b, :c)"
  link_method_documentation "Keyboard.any?",
                          "Renvoie true si au moins une touche passée à keys est activée selon la méthode passées à method",
                          {
                            :method => ["Méthode pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activée selon la méthode, si rien n'est passé, toutes les touches sont prises en compte", :Argslist]
                          }, true
  link_snippet "Keyboard.all?", "p 'A, B et C sont pressées' if Keyboard.all?(:press?, :a, :b, :c)"
  link_method_documentation "Keyboard.current_char",
                          "Renvoie le caractère pressé sur clavier au moment de l'appel",
                          {}, true
  link_method_documentation "Keyboard.current_digit",
                          "Renvoie le chiffre pressé sur le clavier au moment de l'appel",
                          {}, true
  link_method_documentation "Keyboard.shift?",
                          "Renvoie true si la touche Maj du clavier est activée au moment de l'appel, false sinon",
                          {}, true
  link_method_documentation "Keyboard.caps_lock?",
                          "Renvoie true si le clavier est en mode CAPS_LOCK au moment de l'appel, false sinon",
                          {}, true
  link_method_documentation "Keyboard.num_lock?",
                          "Renvoie true si le clavier est en mode NUM_LOCK au moment de l'appel, false sinon",
                          {}, true
  link_method_documentation "Keyboard.scroll_lock?",
                          "Renvoie true si le clavier est en mode SCROLL_LOCK au moment de l'appel, false sinon",
                          {}, true
  link_method_documentation "Keyboard.alt_gr?",
                          "Renvoie true si la touche ALT_GR (ou la combinaison CTRL+ALT) est appuyée au moment de l'appel, false sinon",
                          {}, true
  link_method_documentation "Keyboard.ctrl?",
                          "Renvoie true si la touche CTRL (ou une combinaison CTRL+key) est appuyée au moment de l'appel, false sinon",
                          {:key => ["Symbole référençant la touche (cf:attributs) mise en combinaison", :Symbol]},
                          true
  link_method_documentation "Keyboard.current_key",
                          "Renvoie la touche activée selon la méthode passée en argument, nil si aucune touche n'est activée",
                          {:method => ["Méthode d'activation (:press?, :release?, :trigger? etc.)", :Symbol]}, true
  link_method_documentation "Keyboard.rgss_current_key",
                          "Renvoie la touche du RGSS (:X, :A, :B, :C etc.) activée selon la méthode passée en argument, nil si aucune touche n'est activée",
                          {:method => ["Méthode d'activation (:press?, :release?, :trigger? etc.)", :Symbol]}, true
  link_method_documentation "Keyboard.time",
                          "Renvoie, en nombre de frames, le temps de pression de la touche du clavier choisie",
                          {:key => ["Touche à vérifier",:Symbol]}, true

end

#==============================================================================
# ** Mouse
#------------------------------------------------------------------------------
#  Keyboard representation
#==============================================================================

class Devices::Mouse
  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Représentation de la souris, est accessible via Mouse"
  [:mouse_left, :mouse_right, :mouse_center, :mouse_x1, :mouse_x2].select{|x| x!= :none}.each do |key|
    kname = key.to_s
    sname = ":"+kname
    kcons = "Keys::#{kname.capitalize}"
    link_attr_documentation sname.to_sym, "Pointe la touche #{kcons} (comme argument à passer)"
  end

  link_method_documentation "Mouse.trigger?",
                          "Renvoie true si la touche passée en argument (cf:attributs) vient d'être pressée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  link_method_documentation "Mouse.press?",
                          "Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  link_method_documentation "Mouse.click?",
                          "Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon. (Alias de Mouse.press?)",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  link_method_documentation "Mouse.repeat?",
                          "Renvoie true si la touche passée en argument (cf:attributs) est appuyée de manière répétée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  link_method_documentation "Mouse.release?",
                          "Renvoie true si la touche passée en argument (cf:attributs) vient d'être relâchée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  link_method_documentation "Mouse.point",
                          "Renvoie un point (possédant les attributs x, y) référençant la position de la souris en pixels par rapport à l'écran",
                          {}, true
  link_method_documentation "Mouse.x",
                          "Renvoie la position (en pixels) X de la souris",
                          {}, true
  link_method_documentation "Mouse.y",
                          "Renvoie la position (en pixels) Y de la souris",
                          {}, true
  link_method_documentation "Mouse.square_x",
                          "Renvoie la position (en cases) X de la souris",
                          {}, true
  link_method_documentation "Mouse.square_y",
                          "Renvoie la position (en cases) Y de la souris",
                          {}, true
  link_method_documentation "Mouse.rect",
                          "Renvoie le rectangle de sélection de la souris (tracé en cours)",
                          {}, true
  link_method_documentation "Mouse.last_rect",
                          "Renvoie le dernier rectangle de sélection de la souris effectué",
                          {}, true
  link_method_documentation "Mouse.dragging?",
                          "Renvoie true si la souris est en train de sélectionner (cliquer/glisser) à l'écran",
                          {}, true
  link_method_documentation "Mouse.in?",
                          "Renvoie true si la souris se trouve dans le rectangle passé en argument",
                          {:rectangle => ["Rectangle à vérifier", :Rect]}, true
  link_method_documentation "Mouse.all?",
                          "Renvoie true si toutes les touches passées à keys sont activées selon la méthode passées à method",
                          {
                            :method => ["Méthode pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activée selon la méthode", :Argslist]
                          }, true
  link_snippet "Mouse.all?", "p 'souris gauche et souris droit sont pressées' if Mouse.all?(:press?, :mouse_left, :mouse_right)"
  link_method_documentation "Mouse.any?",
                          "Renvoie true si au moins une touche passée à keys est activée selon la méthode passée à method",
                          {
                            :method => ["Méthode pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activées selon la méthode, si rien n'est passé, toutes les touches sont prises en compte", :Argslist]
                          }, true
  link_method_documentation "Mouse.current_key",
                          "Renvoie la touche activée selon la méthode passée en argument, nil si aucune touche n'est activée",
                          {:method => ["Méthode d'activation (:press?, :release?, :trigger? etc.)", :Symbol]}, true
  link_method_documentation "Mouse.time",
                          "Renvoie, en nombre de frames, le temps de pression de la touche de la souris choisie, au moment de l'appel",
                          {:key => ["Touche à vérifier",:Symbol]}, true

end

#==============================================================================
# ** Kernel
#------------------------------------------------------------------------------
#  Object class methods are defined in this module.
#  This ensures compatibility with top-level method redefinition.
#==============================================================================

module Kernel
  #--------------------------------------------------------------------------
  # * Documentation
  #--------------------------------------------------------------------------
  link_class_documentation "Module référençant les outils génériques"
  link_attr_documentation :HWND, "Renvoie la fenêtre courante de jeu (pour les WIN32API's)"
  link_attr_documentation :IDENTITY, "Renvoie la lambda identité"
end

#==============================================================================
# ** Generative
#------------------------------------------------------------------------------
#  Mixins collection
#==============================================================================

module Generative

  link_class_documentation "Collection de modules MIXINS pour généraliser des comportements"

  #==============================================================================
  # ** BitmapRect
  #------------------------------------------------------------------------------
  #  Rect API
  #==============================================================================

  module BitmapRect
    link_class_documentation "Module pour les classes dérivant un attribut Bitmap. Il ajoute une méthode rect à la classe
    où il est inclus, permettant d'accéder directement au rectangle du bitmap, tenant compte du viewport (si viewport il y a)"
    link_method_documentation "self.rect",
                          "Renvoie le rectangle référant à l'instance",
                          {}, true
  end

  module CommandAPI
    link_class_documentation "Rend accessibles les commandes EventExtender"
    link_method_documentation "self.command",
                          "Appel d'une commande, alias : c, cmd",
                          {
                            :name => ["Nom de la commande à appeler", :Symbol],
                            :args => ["Suite d'arguments", :Argslist]
                          }, true
    link_snippet("self.command", "command(:test, 1, 2, 3) #Appel Command.test(1,2,3) (ou : c(:test, 1,2,3) ou cmd(:test, 1,2,3)")
  end

end

#==============================================================================
# ** Viewport
#------------------------------------------------------------------------------
#  Used when displaying sprites on one portion of the screen
#==============================================================================

class Viewport
  link_class_documentation "Représente une portion de l'écran"
  link_attr_documentation :elts, "Renvoie la liste des éléments inclus dans le Viewport"
  link_attr_documentation :x, "(Lecture/écriture) Coordonnées X du coin supérieur gauche"
  link_attr_documentation :y, "(Lecture/écriture) Coordonnées Y du coin supérieur gauche"
  link_attr_documentation :width, "(Lecture/écriture) Largeur du rectangle"
  link_attr_documentation :height, "(Lecture/écriture) Hauteur du rectangle"
  link_method_documentation "self.append",
                          "Méthode (idéalement) privée d'ajout d'un élément dans le viewport (et à @elts)",
                          {:obj => ["Objet répondant aux méthodes x, y, width, height", :Object]}, false
  link_method_documentation "self.calc_width",
                          "Renvoie la largeur minimum requise pour afficher tous les éléments du viewport",
                          {}, true
  link_method_documentation "self.calc_height",
                          "Renvoie la hauteur minimum requise pour afficher tous les éléments du viewport",
                          {}, true

end


#==============================================================================
# ** Command
#------------------------------------------------------------------------------
#  EvEx Command description
#==============================================================================

module Command

  register_command_category :mapinfo, "Carte", "Commandes relatives aux informations des cartes"
  register_command_category :standard, "Standards", "Commandes standards"
  register_command_category :event, "Evénements", "Commandes relatives aux évènements"
  register_command_category :keyboard, "Clavier", "Commandes relatives au clavier"
  register_command_category :mouse, "Souris", "Commande relatives à la gestion de la souris"
  register_command_category :picture, "Images", "Commandes relatives à la manipulation des images"
  register_command_category :parallax, "Panoramas", "Commandes relatives à la manipulation des panoramas"
  register_command_category :micro, "Micro-événements", "Commandes relatives à la gestion des micro events"
  register_command_category :party, "Parties", "Commande associées à la gestion de la partie"
  register_command_category :items, "Objets", "Commandes permettant d'obtenir ou de manipuler les objets"
  register_command_category :armors, "Armures", "Commandes permettant de manipuler les armures"
  register_command_category :weapons, "Armes", "Commandes permettant de manipuler les armes"
  register_command_category :system, "Systèmes", "Offre une collection d'informations sur le système"
  register_command_category :actors, "Acteurs", "Offre des commandes pour obtenir des informations sur les acteurs"
  register_command_category :skills, "Techniques", "Offre des commandes pour obtenir des informations sur les techniques"
  register_command_category :math, "Mathématiques", "Outils de traitement mathématiques un peu avancé"
  register_command_category :troop, "Groupes", "Informations sur les groupes de monstres"
  register_command_category :enemy, "Ennemis", "Informations sur les monstres rencontrables tels que définis dans la base de données, donc utilisables partout."
  register_command_category :in_battle, "En combat", "Commandes d'informations en combat (en plus de la base de données). Uniquement valide en combat"
  register_command_category :text, "Textes", "Commandes pour afficher du texte à l'écran, les textes sont référencés par des ID, comme les images."
  register_command_category :date, "Date/Heure", "Commandes pour récupérer des informations sur la date et l'heure"
  register_command_category :socket, "Client-Serveur", "Commandes pour communiquer avec un serveur TCP/IP"
  register_command_category :scene, "Scenes", "Commandes pour naviguer entre les scenes de jeu (et de systèmes)"
  register_command_category :save, "Sauvegardes", "Commandes pour gérer et naviguer entre les sauvegardes"
  register_command_category :area, "Zones virtuelles", "Commandes pour créer et manipuler des zones virtuelles"
  register_command_category :textfield, "Champs de texte", "Commande pour manipuler des champs de texte saisissables au clavier"
  register_command_category :clipboard, "Presse-papier", "Permet d'envoyer des données dans le presse-papier ou de récupérer le texte stocké dans le presse-papier"
  register_command_category :xbox, "Vibrations (XBOX360)", "Permet de manipuler la vibration des manettes de la XBOX360"
  register_command_category :sound, "Sons", "Commandes relatives à la manipulation des sons"
  register_command_category :camera, "Caméra", "Commandes relatives à la manipulation de la caméra (scrolling de la carte)"
  register_command_category :screen, "Ecran", "Commandes pour manipuler l'écran (teintes, vibrations etc)"
  register_command_category :window, "Fenêtres", "Commandes pour créer/modifier des fenêtres. Attention, lorsque vous utilisez du texte, utilisez de préférence les apostrophes comme séparateur. Cette collection de commande est documentée dans le Wiki!"
  register_command_category :game_window, "Fenêtre de jeu", "Commandes de manipulation de la fenêtre de jeu"

  link_class_documentation "Collection des commandes EventExtender"

  add_internals :enemy, :troop, :monster_battler_dimension, :distance_between, :bind, :unbind
  add_internals :type_equip, :sys, :spriteset, :sprite_picture, :screen, :picture
  add_internals :scene, :event, :method_missing, :pictures, :scene, :follower

  # EE4 Fixture
  add_internals :windows_username, :parallax_scrollspeed, :picture_origine
  add_internals :picture_detach, :key_number, :key_char, :key_char?, :maj?
  add_internals :mouse_x_square, :mouse_y_square, :show_cursor_system, :delete_save
  add_internals :monster_attack, :monster_magic_attack, :monster_defense
  add_internals :monster_hp, :monster_mp, :troop_member_id, :actor_experience
  add_internals :actor_magic, :collide?, :look_at, :look_at?
  add_internals :actor_experience_rate, :mouse_clicked_event?, :mouse_clicked_player?
  add_internals :monster_magic_defense, :server_single_close_connection
  add_internals :server_single_connect,:server_single_recv,:server_single_send
  add_internals :server_single_wait_recv, :buzz, :tilemap

  add_internals :mouse_square_hover_area?,:mouse_clicked_area?,:mouse_square_clicked_area?
  add_internals :mouse_triggered_area?,:mouse_square_triggered_area?,:mouse_pressed_area?
  add_internals :mouse_square_pressed_area?,:mouse_released_area?,:mouse_square_released_area?
  add_internals :mouse_repeated_area?, :mouse_square_repeated_area?

  # AUTOGenerated for message
link_method_documentation 'Command.message',
	'Affiche un message à l\'écran',
 	{
		:value => ["Message à afficer", :String],
		:"*face_name" => ["Nom du faceset (peut être remplacé par nil pour ne pas en afficher), il faut utiliser \\n pour afficher plusieurs lignes", :String],
		:"*face_index" => ["Index du faceset (ne sert à rien si aucun faceset n'est donnée)", :Fixnum],
		:"*position" => ["Position de la fenêtre de message (0 = en haut, 1 au centre, 2 en bas), par défaut vaut 2", :Fixnum],
		:"*background" => ["Fond du message, 0 normal, 1 sombre, 2 transparent", :Fixnum],

	}
register_command :standard, 'Command.message'

link_method_documentation 'Command.game_window_rect',
	'Renvoie le rectangle correspondant à la fenêtre de jeu',
 	{}, true # Maybe changed
register_command :game_window, 'Command.game_window_rect' 

# AUTOGenerated for flash_square
link_method_documentation 'Command.flash_square',
	'Fait clignoter une case selon une couleur',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],
		:color => ["Couleur du flash (utilisez la commande color)", :Color],

	}
register_command :standard, 'Command.flash_square'

# AUTOGenerated for unflash_square
link_method_documentation 'Command.unflash_square',
	'Arrête le clignotement',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}
register_command :standard, 'Command.unflash_square'

# AUTOGenerated for flash_rect
link_method_documentation 'Command.flash_rect',
	'Fait clignoter un rectangle de cases',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],
		:width => ["Largeur du rectangle", :Fixnum],
		:height => ["Largeur du rectangle", :Fixnum],
		:color => ["Couleur du flash (utilisez la commande color)", :Color],

	}
register_command :standard, 'Command.flash_rect'

# AUTOGenerated for unflash_rect
link_method_documentation 'Command.unflash_rect',
	'Arrête de faire clignoter les cases référencées par le rectangle',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],
		:width => ["Largeur du rectangle", :Fixnum],
		:height => ["Largeur du rectangle", :Fixnum],

	}
register_command :standard, 'Command.unflash_rect'

  link_method_documentation 'Command.call_common_event',
  	'Exécute l\'événement commun référencé par son ID',
   	{
  		:id => ["ID de l'événement commun à exécuter", :Fixnum],

  	}, false
  register_command :standard, 'Command.call_common_event'

  link_method_documentation "Command.max",
                        "Renvoie la plus grande des deux valeurs A, B",
                        {
                          :a => ["Valeur de A", :Object],
                          :b => ["Valeur de B", :Object]
                        }, true
  register_command :standard, "Command.max"

  link_method_documentation "Command.min",
                        "Renvoie la plus petite des deux valeurs A, B",
                        {
                          :a => ["Valeur de A", :Object],
                          :b => ["Valeur de B", :Object]
                        }, true
  register_command :standard, "Command.min"

  link_method_documentation "Command.tone",
                        "Renvoie une teinte",
                        {
                          :red => ["Valeur de rouge, entre -255 et 255", :Fixnum],
                          :green => ["Valeur de vert, entre -255 et 255", :Fixnum],
                          :blue => ["Valeur de bleu, entre -255 et 255", :Fixnum],
                          :"*gray" => ["Valeur de gris, entre 0 et 255, par défaut 0 !", :Fixnum]
                        }, true
  register_command :standard, "Command.tone"

  link_method_documentation "Command.get",
                        "Renvoie la cellule à la valeur donnée d'un tableau",
                        {:array =>["Tableau", :Array], :index => ["Index à trouver", :Fixnum]}, true
  register_command :standard, "Command.get"
  link_snippet("Command.get", "Command.get([0, 1, 2, 17], 2) # Renvoie 2 (parce que c'est la deuxième cellule et que l'indexation des tableaux commence à 0)")

  link_method_documentation "Command.session_username",
                        "Renvoie le nom d'utilisateur de la session Windows",
                        {}, true
  register_command :standard, "Command.session_username"

  link_method_documentation "Command.length",
                        "Renvoie la taille d'un tableau",
                        {:array =>["Tableau dont il faut renvoyer la taille", :Array]}, true
  register_command :standard, "Command.length"

  link_method_documentation "Command.color",
                        "Renvoie une couleur",
                        {
                          :red => ["Valeur de rouge", :Fixnum],
                          :green => ["Valeur de vert", :Fixnum],
                          :blue => ["Valeur de bleu", :Fixnum],
                          :"*alpha" => ["Opacité, par défaut 255!", :Fixnum]
                        }, true
  register_command :standard, "Command.color"

  link_method_documentation "Command.random",
                        "Renvoie un nombre aléatoire compris entre MIN et MAX inclus",
                        {
                          :min => ["Borne minimale", :Fixnum],
                          :max => ["Borne maximale (à noter que si cet argument n'est pas spécifié, le résultat sera compris entre 0 et min inclus)", :Fixnum]
                        }, true
  register_command :standard, "Command.random"
  link_method_documentation "Command.wait",
                        "Attend un nombre de frames donné",
                        {
                          :duration => ["Nombre de frames à attendre", :Fixnum],
                        }
  register_command :standard, "Command.wait"

  link_method_documentation "Command.random_figures",
                        "Renvoie un nombre à virgule aléatoire compris entre x et x+1",
                        {
                          :x => ["Valeur de base (si cet argument n'est pas spécifié, le résultat sera compris entre 0 et 1)", :Fixnum]
                        }, true
  register_command :standard, "Command.random_figures"

  link_method_documentation "Command.map_id",
                        "Renvoie l'ID de la map en cours. Idéalement, utiliser c(:map_id) qui est plus sur!",
                        {}, true
  register_command :mapinfo, "Command.map_id"

  link_method_documentation "Command.map_name",
                        "Renvoie le nom de la map en cours",
                        {}, true
  register_command :mapinfo, "Command.map_name"

  link_method_documentation "Command.id_at",
                        "Renvoie l'ID de l'évènement pointé par les coordonnées X,Y (0 si c'est le héros, -1 s'il n'y en a pas)",
                        {
                          :x => ["Coordonnées X de la case", :Fixnum],
                          :y => ["Coordonnées Y de la case", :Fixnum]
                        }, true
  register_command :mapinfo, "Command.id_at"

  link_method_documentation "Command.terrain_tag",
                        "Renvoie le tag du terrain de la case pointée par les coordonnées X,Y",
                        {
                          :x => ["Coordonnées X de la case", :Fixnum],
                          :y => ["Coordonnées Y de la case", :Fixnum]
                        }, true
  register_command :mapinfo, "Command.terrain_tag"

  link_method_documentation "Command.tile_id",
                        "Renvoie l'ID de la tile pointée par les coordonnées X,Y",
                        {
                          :x => ["Coordonnées X de la case", :Fixnum],
                          :y => ["Coordonnées Y de la case", :Fixnum],
                          :layer => ["Numéro de la couche", :Fixnum],
                          :"*map_id" => ["ID d'une carte, si aucun argument n'est donné, map_id vaut l'id de la map courante", :Fixnum],
                        }, true
  register_command :mapinfo, "Command.tile_id"

  link_method_documentation 'Command.set_tile_where',
  	'Change tous les tile d\'une carte selon un ID et un layer',
   	{
  		:layer => ["Numero de la couche", :Fixnum],
  		:id => ["Id du tile à remplacer", :Fixnum],
  		:new_id => ["Nouvel Id du tile", :Fixnum],

  	}
  register_command :mapinfo, 'Command.set_tile_where'

  # AUTOGenerated for delete_tiles
  link_method_documentation 'Command.delete_tiles',
  	'Supprime tous les tiles référencés par un ID et un layer',
   	{
  		:layer => ["Numéro de la couche", :Fixnum],
  		:id => ["Id du tile à supprimer", :Fixnum],

  	}
  register_command :mapinfo, 'Command.delete_tiles'

  # AUTOGenerated for set_tile
  link_method_documentation 'Command.set_tile',
  	'Change une case de tile',
   	{
  		:value => ["Valeur du tile (utilisez éventuellement la commande tile_id)", :Fixnum],
  		:x => ["Coordonnées X", :Fixnum],
  		:y => ["Coordonnées Y", :Fixnum],
  		:layer => ["Couche de la carte (1,2 ou 3)", :Fixnum],

  	}, true # Maybe changed
  register_command :mapinfo, 'Command.set_tile'

  link_method_documentation "Command.region_id",
                        "Renvoie l'ID de la région pointée par les coordonnées X,Y",
                        {
                          :x => ["Coordonnées X de la case", :Fixnum],
                          :y => ["Coordonnées Y de la case", :Fixnum]
                        }, true
  register_command :mapinfo, "Command.region_id"

  link_method_documentation "Command.square_passable?",
                        "Renvoie true si la case référencée par X, Y est passable dans la direction référencée par direction, false sinon",
                        {
                          :x => ["Coordonnées X de la case", :Fixnum],
                          :y => ["Coordonnées Y de la case", :Fixnum],
                          :direction => ["Direction (2,4,6,8)", :Fixnum]
                        }, true

  register_command :mapinfo, "Command.square_passable?"

  link_method_documentation "Command.percent",
                        "Renvoie le pourcentage de value par rapport à max",
                        {
                          :value => ["Valeur à transformer", :Fixnum],
                          :max => ["Valeur maximum", :Fixnum]
                        }, true
  register_command :standard, "Command.percent"

  link_snippet("Command.percent", "Command.percent(40, 80) # Renvoie 50 (parce que 40 = 50% de 80)")
  link_method_documentation "Command.apply_percent",
                        "Applique percent à max",
                        {
                          :percent => ["Valeur à appliquer", :Fixnum],
                          :max => ["Valeur maximum", :Fixnum]
                        }, true
  link_snippet("Command.apply_percent", "Command.apply_percent(50, 80) # Renvoie 40 (parce que 50% de 80 = 40)")
  register_command :standard, "Command.apply_percent"

  link_method_documentation "Command.include_page",
                        "Invoque une page (comme s'il s'agissait d'un évènement commun) d'un autre évènement",
                        {
                          :map_id => ["ID de la map où chercher l'évènement à inclure", :Fixnum],
                          :event_id => ["ID de l'évènement où chercher la page à inclure", :Fixnum],
                          :page_id => ["ID de la page à inclure", :Fixnum],
                          "*runnable".to_sym => ["Par défaut, cette variable a pour valeur `false`. Si elle vaut `true`, la page ne sera incluse que si la condition de lancement de la page est respectée. Par défaut, elle utilise le contexte (les interrupteurs locaux) de l'évènement appelant.", :Boolean],
                          "*context".to_sym => ["Par défaut, cette variable a pour valeur `false`. Si `runnable` et `context` valent `true`, la condition de lancement de la page utilisera le contexte (les interrupteurs locaux) de l'évènement d'origine à la place de celui de l'évènement appelant.", :Boolean]
                        }
  register_command :event, "Command.include_page"

  # AUTOGenerated for event_moving?
  link_method_documentation 'Command.event_moving?',
  	'Renvoie true si l\'évènement est en mouvement, false sinon.',
   	{
  		:id => ["Id de l'événement", :Fixnum],

  	}, true # Maybe changed
  register_command :event, 'Command.event_moving?'

  # AUTOGenerated for player_moving?
  link_method_documentation 'Command.player_moving?',
  	'Renvoie true si le héros est en mouvement, false sinon',
   	{}, true # Maybe changed
  register_command :event, 'Command.player_moving?'

  # AUTOGenerated for event_trail
  link_method_documentation 'Command.event_trail',
  	'Applique une traînée sur un sélecteur d\'évènements',
   	{
  		:ids => ["Sélecteur d'évènements à qui attribuer une traînée", :Selector],
  		:len => ["Taille de la trainée", :Fixnum],
  		:"*mode" => ["Mode de fusion de la traînée (0, 1 ou 2), par défaut: 0", :Fixnum],
  		:"*mode" => ["Teinte de la trainée (utilisez la commande tone)", :Tone],

  	}
  register_command :event, 'Command.event_trail'

  # AUTOGenerated for pixel_in_event?
  link_method_documentation 'Command.pixel_in_event?',
  	'Renvoie true si le pixel (x, y) est inclu dans l\'événement, false sinon',
   	{
  		:id => ["Args description", :ArgType],
  		:x => ["Coordonnées X du point à vérifier", :Fixnum],
  		:y => ["Coordonnées Y du point à vérifier", :Fixnum],
  		:"*precise" => ["Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut true ", :Boolean],

  	}, true # Maybe changed
  register_command :event, 'Command.pixel_in_event?'

  # AUTOGenerated for pixel_in_player?
  link_method_documentation 'Command.pixel_in_player?',
  	'Renvoie true si le pixel (x, y) est inclu dans le joueur, false sinon',
   	{
  		:x => ["Coordonnées X du point à vérifier", :Fixnum],
  		:y => ["Coordonnées Y du point à vérifier", :Fixnum],
  		:"*precise" => ["Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut true ", :Boolean],

  	}, true # Maybe changed
  register_command :event, 'Command.pixel_in_player?'

  # AUTOGenerated for event_opacity
  link_method_documentation 'Command.event_opacity',
  	'Modifie (ou retourne) l\'opacité d\'un évènement ',
   	{
  		:ids => ["Id de l'évènement (ne pas utiliser de selecteur pour renvoyer l'opacité)", :Selector],
  		:"*value" => ["Valeur de l'opacité, entre 0 et 255. Si aucune valeur n'est donnée, la commande retourne l'opacité de l'évènement ciblé.", :Fixnum],

  	}, true # Maybe changed
  register_command :event, 'Command.event_opacity'

  # AUTOGenerated for player_opacity
  link_method_documentation 'Command.player_opacity',
  	'Modifie (ou retourne) l\'opacité du héros',
   	{
  		:"*value" => ["Valeur de l'opacité, entre 0 et 255. Si aucune valeur n'est donnée. La commande retourne l'opacité du héros.", :Fixnum],

  	}, true # Maybe changed
  register_command :event, 'Command.player_opacity'

  # AUTOGenerated for event_ox
  link_method_documentation 'Command.event_ox',
  	'Modifie (ou retourne) la coordonnée X du point de départ d\'un événement (le point d\'accroche)',
   	{
  		:id => ["ID de l'événement", :Fixnum],
  		:"*value" => ["Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante", :Fixnum],

  	}, true # Maybe changed
  register_command :event, 'Command.event_ox'

  # AUTOGenerated for event_oy
  link_method_documentation 'Command.event_oy',
  'Modifie (ou retourne) la coordonnée y du point de départ d\'un événement (le point d\'accroche)',
   	{
  		:id => ["ID de l'événement", :Fixnum],
  		:"*value" => ["Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante", :Fixnum],

  	}, true # Maybe changed
  register_command :event, 'Command.event_oy'

  # AUTOGenerated for player_ox
  link_method_documentation 'Command.player_ox',
  'Modifie (ou retourne) la coordonnée X du point de départ du héros (le point d\'accroche)',
   	{
  		:"*value" => ["Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante", :Fixnum],

  	}, true # Maybe changed
  register_command :event, 'Command.player_ox'

  # AUTOGenerated for player_oy
  link_method_documentation 'Command.player_oy',
  'Modifie (ou retourne) la coordonnée Y du point de départ du héros (le point d\'accroche)',
   	{
  		:"*value" => ["Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante", :Fixnum],

  	}, true # Maybe changed
  register_command :event, 'Command.player_oy'

  # AUTOGenerated for event_zoom_x
  link_method_documentation 'Command.event_zoom_x',
  'Modifie (ou retourne) la valeur du zoom horizontal d\'un événement',
   	{
  		:id => ["ID de l'événement", :Fixnum],
  		:"*value" => ["Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante", :Fixnum],

  	}, true # Maybe changed
  register_command :event, 'Command.event_zoom_x'

  # AUTOGenerated for event_zoom_y
  link_method_documentation 'Command.event_zoom_y',
  'Modifie (ou retourne) la valeur du zoom vertical d\'un événement',
   	{
  		:id => ["ID de l'événement", :Fixnum],
  		:"*value" => ["Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante", :Fixnum],

  	}, true # Maybe changed
  register_command :event, 'Command.event_zoom_y'

  # AUTOGenerated for event_zoom
  link_method_documentation 'Command.event_zoom',
  'Modifie le zoom d\'un événement',
   	{
  		:id => ["ID de l'événement", :Fixnum],
  		:value => ["Valeur du zoom", :Fixnum],

  	}
  register_command :event, 'Command.event_zoom'

  # AUTOGenerated for event_restore_origin
  link_method_documentation 'Command.event_restore_origin',
  	'Restore l\'origine de l\'événement référencé par son ID',
   	{
  		:id => ["ID de l'événement", :Fixnum],

  	}
  register_command :event, 'Command.event_restore_origin'

  # AUTOGenerated for player_restore_origin
  link_method_documentation 'Command.player_restore_origin',
  	'Restore l\'origine du héros',
   	{}
  register_command :event, 'Command.player_restore_origin'

  # AUTOGenerated for player_zoom_x
  link_method_documentation 'Command.player_zoom_x',
  'Modifie (ou retourne) la valeur du zoom horizontal du héros',
   	{
  		:"*value" => ["Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante", :Fixnum],

  	}, true # Maybe changed
  register_command :event, 'Command.player_zoom_x'

  # AUTOGenerated for player_zoom_y
  link_method_documentation 'Command.player_zoom_y',
  'Modifie (ou retourne) la valeur du zoom vertical du héros',
   	{
  		:"*value" => ["Nouvelle valeur, si aucune valeur n'est donnée, la commande renverra la valeur courante", :Fixnum],

  	}, true # Maybe changed
  register_command :event, 'Command.player_zoom_y'

  # AUTOGenerated for player_zoom
  link_method_documentation 'Command.player_zoom',
  'Modifie le zoom du héros',
   	{
  		:value => ["Valeur du zoom", :Fixnum],

  	}
  register_command :event, 'Command.player_zoom'



  # AUTOGenerated for player_trail
  link_method_documentation 'Command.player_trail',
  	'Applique une traînée sur le joueur',
   	{
  		:len => ["Taille de la traînée", :Fixnum],
  		:"*mode" => ["Mode de fusion de la traînée (0, 1 ou 2), par défaut: 0", :Fixnum],
  		:"*tone" => ["Teinte de la traînée (utilisez la commande tone)", :Tone],

  	}
  register_command :event, 'Command.player_trail'

  # AUTOGenerated for event_stop_trail
  link_method_documentation 'Command.event_stop_trail',
  	'Arrête la trainée sur un sélecteur d\'évènements',
   	{
  		:ids => ["Sélecteur d'évènements à qui attribuer une traînée", :Selector],

  	}
  register_command :event, 'Command.event_stop_trail'

  # AUTOGenerated for player_stop_trail
  link_method_documentation 'Command.player_stop_trail',
  	'Arrête la traînée sur le joueur',
   	{}
  register_command :event, 'Command.player_stop_trail'

  # AUTOGenerated for event_brutal_stop_trail
  link_method_documentation 'Command.event_brutal_stop_trail',
  	'Arrête brutalement la traînée sur un sélecteur d\'évènements',
   	{
  		:ids => ["Sélecteur d'évènements à qui attribuer une traînée", :Selector],

  	}
  register_command :event, 'Command.event_brutal_stop_trail'

  # AUTOGenerated for player_brutal_stop_trail
  link_method_documentation 'Command.player_brutal_stop_trail',
  	'Arrête brutalement la traînée sur le joueur',
   	{}
  register_command :event, 'Command.player_brutal_stop_trail'


  link_method_documentation "Command.page_runnable?",
                        "Vérifie si la page est exécutable dans le contexte de l'évènement appelant.",
                        {
                          :map_id => ["ID de la map où chercher l'évènement à tester", :Fixnum],
                          :event_id => ["ID de l'évènement où chercher la page à tester", :Fixnum],
                          :page_id => ["ID de la page à tester", :Fixnum],
                          "*context".to_sym => ["Par défaut, cette variable a pour valeur `false`. Si elle vaut `true`, la condition de lancement de la page utilisera le contexte (les interrupteurs locaux) de l'évènement d'origine à la place de celui de l'évènement appelant.", :Boolean]
                          }, true
  register_command :event, "Command.page_runnable?"

  link_method_documentation "Command.invoke_event",
                        "Invoque un évènement d'une autre map (ou de la même) sur la carte",
                        {
                          :map_id => ["ID de la map où chercher l'évènement à invoquer", :Fixnum],
                          :event_id => ["ID de l'évènement à invoquer", :Fixnum],
                          :new_id => ["Nouvel ID de l'évènement fraîchement invoqué", :Fixnum],
                          "*x".to_sym => ["Position X où placer l'évènement invoqué, par défaut, conserve la valeur de l'évènement invoqué", :Fixnum],
                          "*y".to_sym => ["Position Y où placer l'évènement invoqué, par défaut conserve la valeur de l'évènement invoqué", :Fixnum]
                        }
  register_command :event, "Command.invoke_event"

  link_method_documentation "Command.max_event_id",
                        "Renvoie le plus grand ID d'évènement occupé sur la carte",
                        {}, true
  register_command :event, "Command.max_event_id"

  link_method_documentation "Command.fresh_event_id",
                        "Renvoie un ID libre (utile en cas d'invocation d'évènement)",
                        {"*erased".to_sym => ["Si cette valeur vaut true, la commande renverra le plus petit ID d'un événement supprimé", :Boolean]}, true
  register_command :event, "Command.fresh_event_id"

  link_method_documentation "Command.mouse_hover_event?",
                        "Renvoie true si la souris survole un évènement du sélecteur passé en argument",
                        {:events => ["Selecteur d'évènements", :Selectors],
                          :"*precise" => ["Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut true ", :Boolean],}, true
  register_command :event, "Command.mouse_hover_event?"

  link_method_documentation "Command.mouse_click_event?",
                        "Renvoie true si la souris clique sur un évènement du sélecteur passé en argument",
                        {:events => ["Selecteur d'évènements", :Selectors],
                          :"*precise" => ["Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut false ", :Boolean],}, true
  register_command :event, "Command.mouse_click_event?"

  link_method_documentation "Command.mouse_press_event?",
                        "Renvoie true si la souris reste pressée sur un évènement du sélecteur passé en argument",
                        {
                          :events => ["Selecteur d'évènements", :Selectors],
                          :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left)", :Symbol],
                          :"*precise" => ["Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut false ", :Boolean],
                        }, true
  register_command :event, "Command.mouse_press_event?"

  link_method_documentation "Command.mouse_trigger_event?",
                        "Renvoie true si la souris vient de cliquer un évènement du sélecteur passé en argument",
                        {
                          :events => ["Selecteur d'évènements", :Selectors],
                          :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left)", :Symbol],
                          :"*precise" => ["Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut false ", :Boolean],
                        }, true
  register_command :event, "Command.mouse_trigger_event?"

  link_method_documentation "Command.mouse_repeat_event?",
                        "Renvoie true si la souris clique de manière répétée un évènement du sélecteur passé en argument",
                        {
                          :events => ["Selecteur d'évènements", :Selectors],
                          :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left)", :Symbol],
                          :"*precise" => ["Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut false ", :Boolean],
                        }, true
  register_command :event, "Command.mouse_repeat_event?"

  link_method_documentation "Command.mouse_release_event?",
                        "Renvoie true si la souris est relâchée sur un évènement du sélecteur passé en argument",
                        {
                          :events => ["Selecteur d'évènements", :Selectors],
                          :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left)", :Symbol],
                          :"*precise" => ["Si vaut true, la vérification se fait au pixel près, sinon en fonction du rectangle. Par défaut, vaut false ", :Boolean],
                        }, true
  register_command :event, "Command.mouse_release_event?"

  link_method_documentation "Command.event_x",
                        "Renvoie la coordonnées X de la case sur laquelle se trouve l'évènement référencé par son ID",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum]}, true
  register_command :event, "Command.event_x"

  link_method_documentation "Command.event_in_screen?",
                        "Renvoie true si l'évènement référencé par son ID est visible à l'écran, false sinon",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum]}, true
  register_command :event, "Command.event_in_screen?"

   link_method_documentation "Command.player_in_screen?",
                        "Renvoie true si le joueur est visible à l'écran, false sinon",
                        {}, true
  register_command :event, "Command.player_in_screen?"


  link_method_documentation "Command.event_y",
                        "Renvoie la coordonnée Y de la case sur laquelle se trouve l'évènement référencé par son ID",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum]}, true
  register_command :event, "Command.event_y"

  link_method_documentation "Command.event_screen_x",
                        "Renvoie la coordonnée X de l'évènement référencé par son ID par rapport à l'écran",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum]}, true
  register_command :event, "Command.event_screen_x"

  link_method_documentation "Command.event_screen_y",
                        "Renvoie la coordonnée Y de l'évènement référencé par son ID par rapport à l'écran",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum]}, true
  register_command :event, "Command.event_screen_y"

  link_method_documentation "Command.event_pixel_x",
                        "Renvoie la coordonnée X de l'évènement référencé par son ID en pixel sur la carte",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum]}, true
  register_command :event, "Command.event_pixel_x"

  link_method_documentation "Command.event_pixel_y",
                        "Renvoie la coordonnée Y de l'évènement référencé par son ID en pixel sur la carte",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum]}, true
  register_command :event, "Command.event_pixel_y"

  link_method_documentation "Command.event_direction",
                        "Renvoie (ou change) la direction (2 pour le haut, 8, pour le bas, 4 pour la gauche , 6 pour la droite ) de l'évènement référencé par son ID",
                        {:id => ["ID de l'évènement (0 pour héros)", :Fixnum],
                          :"*value" => ["Valeur de la direction, 2,4,6,8. Si aucune valeur n'est donnée, la commande retourne la direction de l'évènement ciblé.", :Fixnum]}, true
  register_command :event, "Command.event_direction"

  link_method_documentation "Command.player_x",
                        "Renvoie la coordonnée X de la case sur laquelle est le joueur",
                         {}, true
  register_command :event, "Command.player_x"

  link_method_documentation "Command.player_y",
                        "Renvoie la coordonnée Y de la case sur laquelle est le joueur",
                       {}, true
  register_command :event, "Command.player_y"

  link_method_documentation "Command.player_screen_x",
                        "Renvoie la coordonnée X du joueur par rapport à l'écran",
                        {}, true
  register_command :event, "Command.player_screen_x"

  link_method_documentation "Command.player_screen_y",
                        "Renvoie la coordonnée Y du joueur par rapport à l'écran",
                        {}, true
  register_command :event, "Command.player_screen_y"

  link_method_documentation "Command.player_pixel_x",
                        "Renvoie la coordonnées X du joueur en pixel sur la carte",
                        {}, true
  register_command :event, "Command.player_pixel_x"

  link_method_documentation "Command.player_pixel_y",
                        "Renvoie la coordonnées Y du joueur en pixel sur la carte",
                        {}, true
  register_command :event, "Command.player_pixel_y"

  link_method_documentation "Command.player_direction",
                        "Renvoie (ou change) la direction (2 pour le haut, 8, pour le bas, 4 pour la gauche , 6 pour la droite ) du joueur",
                        {:"*value" => ["Valeur de la direction, 2,4,6,8. Si aucune valeur n'est donnée, la commande retourne la direction du héros", :Fixnum]}, true
  register_command :event, "Command.player_direction"

  link_method_documentation "Command.squares_between",
                        "Renvoie le nombre de cases entre deux évènements référencés par leurs ID",
                        {
                          :idA => ["ID de l'évènement A (0 pour héros)", :Fixnum],
                          :idB => ["ID de l'évènement B (0 pour héros)", :Fixnum],

                        },
                        true
  register_command :event, "Command.squares_between"

  link_method_documentation "Command.pixels_between",
                        "Renvoie le nombre de pixels entre deux évènements référencés par leurs ID's",
                        {
                          :idA => ["ID de l'évènement A (0 pour héros)", :Fixnum],
                          :idB => ["ID de l'évènement B (0 pour héros)", :Fixnum],

                        },
                        true
  register_command :event, "Command.pixels_between"

  link_method_documentation "Command.event_look_at?",
                        "Renvoie true si l'évènement A regarde dans la direction de l'évènement B et que celui ci est dans son périmètre, false sinon",
                        {
                          :idA => ["ID de l'évènement A (0 pour héros)", :Fixnum],
                          :idB => ["ID de l'évènement B (0 pour héros)", :Fixnum],
                          :scope => ["Nombre de cases ou de pixels", :Fixnum],
                          :"*metric" => ["par défaut :square pour en cases, mettre :pixels pour en pixels", :Fixnum],

                        },
                        true
  register_command :event, "Command.event_look_at?"

  # AUTOGenerated for event_move_with
  link_method_documentation 'Command.event_move_with',
  	'Applique un déplacement (selon un code) à un événement',
   	{
  		:id => ["Id de l'événement", :Fixnum],
  		:code => ["Liste des codes de déplacement", :Fixnum],

  	}
  register_command :event, 'Command.event_move_with'

  # AUTOGenerated for player_move_with
  link_method_documentation 'Command.player_move_with',
  	'Applique un déplacement (selon un code) au héros',
   	{
  		:code => ["Liste des codes de déplacement", :Fixnum],

  	}
  register_command :event, 'Command.player_move_with'

  link_method_documentation "Command.events_collide?",
                        "Renvoie true si l'evenement A est en collision avec l'évènement B, false sinon",
                        {
                          :idA => ["ID de l'évènement A (0 pour héros)", :Fixnum],
                          :idB => ["ID de l'évènement B (0 pour héros)", :Fixnum],

                        },
                        true
  register_command :event, "Command.events_collide?"



  link_method_documentation "Command.key_trigger?",
                          "Renvoie true si la touche passée en argument (cf:attributs) vient d'être pressée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  register_command :keyboard, "Command.key_trigger?"

  link_method_documentation "Command.key_press?",
                          "Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  register_command :keyboard, "Command.key_press?"

  link_method_documentation "Command.key_repeat?",
                          "Renvoie true si la touche passée en argument (cf:attributs) est appuyée de manière répétée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  register_command :keyboard, "Command.key_repeat?"

  link_method_documentation "Command.key_release?",
                          "Renvoie true si la touche passée en argument (cf:attributs) vient d'être relâchée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  register_command :keyboard, "Command.key_release?"

  link_method_documentation "Command.keyboard_all?",
                          "Renvoie true si toutes les touches passées à keys sont activées selon la méthode passée à method",
                          {
                            :method => ["Méthode pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activées selon la méthode", :Argslist]
                          }, true
  register_command :keyboard, "Command.keyboard_all?"

  link_method_documentation "Command.keyboard_any?",
                          "Renvoie true si  au moins une touche passée à keys est activée selon la méthode passée à method",
                          {
                            :method => ["Méthode pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activée selon la méthode, si rien n'est passé, toutes les touches sont prises en compte", :Argslist]
                          }, true
  register_command :keyboard, "Command.keyboard_any?"

  link_method_documentation "Command.keyboard_current_char",
                          "Renvoie le caractère actuel pressé par le clavier",
                          {}, true
  register_command :keyboard, "Command.keyboard_current_char"

  link_method_documentation "Command.keyboard_current_digit",
                          "Renvoie le chiffre actuel pressé par le clavier",
                          {}, true
  register_command :keyboard, "Command.keyboard_current_digit"

  link_method_documentation "Command.shift?",
                          "Renvoie true si la touche Maj du clavier est activée au moment de l'appel, false sinon",
                          {}, true
  register_command :keyboard, "Command.shift?"

  link_method_documentation "Command.caps_lock?",
                          "Renvoie true si le clavier est en mode CAPS_LOCK au moment de l'appel, false sinon",
                          {}, true
  register_command :keyboard, "Command.caps_lock?"

  link_method_documentation "Command.num_lock?",
                          "Renvoie true si le clavier est en mode NUM_LOCK au moment de l'appel, false sinon",
                          {}, true
  register_command :keyboard, "Command.num_lock?"

  link_method_documentation "Command.scroll_lock?",
                          "Renvoie true si le clavier est en mode SCROLL_LOCK au moment de l'appel, false sinon",
                          {}, true
  register_command :keyboard, "Command.scroll_lock?"

  link_method_documentation "Command.alt_gr?",
                          "Renvoie true si la touche ALT_GR (ou la combinaison CTRL+ALT) est appuyée au moment de l'appel, false sinon",
                          {}, true
  register_command :keyboard, "Command.alt_gr?"

  link_method_documentation "Command.ctrl?",
                          "Renvoie true si la touche CTRL (ou une combinaison CTRL+key) est appuyée au moment de l'appel, false sinon",
                          {:key => ["Symbole référençant la touche (cf:attributs) mise en combinaison", :Symbol]},
                          true
  register_command :keyboard, "Command.ctrl?"

  link_method_documentation "Command.key_current",
                          "Renvoie la touche activée selon la méthode passée en argument, nil si aucune touche n'est activée",
                          {:method => ["Méthode d'activation (:press?, :release?, :trigger? etc.)", :Symbol]}, true
  register_command :keyboard, "Command.key_current"

  link_method_documentation "Command.key_current_rgss",
                          "Renvoie la touche du RGSS (:X, :A, :B, :C etc.) activée selon la méthode passée en argument, nil si aucune touche n'est activée",
                          {:method => ["Méthode d'activation (:press?, :release?, :trigger? etc.)", :Symbol]}, true
  register_command :keyboard, "Command.key_current_rgss"

  link_method_documentation "Command.key_time",
                          "Renvoie, en nombre de frames, le temps de pression d'une touche de clavier choisie",
                          {:key => ["Touche à vérifier",:Symbol]}, true
  register_command :keyboard, "Command.key_time"

  link_method_documentation "Command.mouse_trigger?",
                          "Renvoie true si la touche passée en argument (cf:attributs) vient d'être pressée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  register_command :mouse, "Command.mouse_trigger?"

  link_method_documentation "Command.mouse_press?",
                          "Renvoie true si la touche passée en argument (cf:attributs) est pressée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  register_command :mouse, "Command.mouse_press?"

  link_method_documentation "Command.mouse_click?",
                          "Renvoie true lorsqu'on effectue un clic gauche",
                          {},
                          true
  register_command :mouse, "Command.mouse_click?"

  link_method_documentation "Command.mouse_repeat?",
                          "Renvoie true si la touche passée en argument (cf:attributs) est appuyée de manière répétée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  register_command :mouse, "Command.mouse_repeat?"

  link_method_documentation "Command.mouse_release?",
                          "Renvoie true si la touche passée en argument (cf:attributs) vient d'être relâchée, false sinon",
                          {:key => ["Symbole référençant une touche (cf:attributs)", :Symbol]},
                          true
  register_command :mouse, "Command.mouse_release?"

  link_method_documentation "Command.mouse_point",
                          "Renvoie un point (possédant les attributs x, y) référençant la position de la souris en pixels par rapport à l'écran",
                          {}, true
  register_command :mouse, "Command.mouse_point"

  link_method_documentation "Command.mouse_x",
                          "Renvoie la position (en pixels) X de la souris",
                          {}, true
  register_command :mouse, "Command.mouse_x"

  link_method_documentation "Command.mouse_y",
                          "Renvoie la position (en pixels) Y de la souris",
                          {}, true
  register_command :mouse, "Command.mouse_y"

  link_method_documentation "Command.mouse_square_x",
                          "Renvoie la position (en cases) X de la souris",
                          {}, true
  register_command :mouse, "Command.mouse_square_x"

  link_method_documentation "Command.mouse_square_y",
                          "Renvoie la position (en cases) Y de la souris",
                          {}, true
  register_command :mouse, "Command.mouse_square_y"

  link_method_documentation "Command.mouse_rect",
                          "Renvoie le rectangle de sélection de la souris (tracé en cours)",
                          {}, true
  register_command :mouse, "Command.mouse_rect"

  link_method_documentation "Command.mouse_last_rect",
                          "Renvoie le dernier rectangle de sélection de la souris effectué",
                          {}, true
  register_command :mouse, "Command.mouse_last_rect"

  link_method_documentation "Command.mouse_dragging?",
                          "Renvoie true si la souris est en train de sélectionner (cliquer/glisser) à l'écran",
                          {}, true
  register_command :mouse, "Command.mouse_dragging?"

  link_method_documentation "Command.mouse_in?",
                          "Renvoie true si la souris se trouve dans le rectangle passé en argument",
                          {:rectangle => ["Rectangle à vérifier", :Rect]}, true
  register_command :mouse, "Command.mouse_in?"

  link_method_documentation "Command.mouse_all?",
                          "Renvoie true si toutes les touches passées à keys sont activées selon la méthode passée à method",
                          {
                            :method => ["Méthodes pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activées selon la méthode", :Argslist]
                          }, true
  register_command :mouse, "Command.mouse_all?"

  link_method_documentation "Command.mouse_any?",
                          "Renvoie true si au moins une touche passée à keys est activée selon la méthode passée à method",
                          {
                            :method => ["Méthode pour vérifier le prédicat (par exemple, :press?, :trigger?, :release? etc.", :Symbol],
                            :keys => ["Liste des touches qui doivent être activée selon la méthode, si rien n'est passé, toutes les touches sont prises en compte", :Argslist]
                          }, true
  register_command :mouse, "Command.mouse_any?"

  link_method_documentation "Command.mouse_current_key",
                          "Renvoie la touche activée selon la méthode passée en argument, nil si aucune touche n'est activée",
                          {:method => ["Méthode d'activation (:press?, :release?, :trigger? etc.)", :Symbol]}, true
  register_command :mouse, "Command.mouse_current_key"

  link_method_documentation "Command.click_time",
                          "Renvoie, en nombre de frames, la durée de pression d'une touche de souris choisie",
                          {:key => ["Touche à vérifier",:Symbol]}, true
  register_command :mouse, "Command.click_time"

  # AUTOGenerated for picture_mouse_hover?
  link_method_documentation 'Command.picture_mouse_hover?',
  	'Renvoie true si la souris survol l\'image référencée par son ID',
   	{
  		:id => ["ID de l'image", :Fixnum],
  		:"*precise" => ["si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false", :Boolean],

  	}, true # Maybe changed
  register_command :picture, 'Command.picture_mouse_hover?'

  # AUTOGenerated for picture_mouse_click?
  link_method_documentation 'Command.picture_mouse_click?',
  	'Renvoie true si la souris survol et est cliquée l\'image référencée par son ID',
   	{
  		:id => ["ID de l'image", :Fixnum],
  		:"*precise" => ["si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false", :Boolean],

  	}, true # Maybe changed
  register_command :picture, 'Command.picture_mouse_click?'

  # AUTOGenerated for picture_mouse_press?
  link_method_documentation 'Command.picture_mouse_press?',
  	'Renvoie true si la souris survol et presse en continu la touche référencée sur l\'image référencée par son ID',
   	{
  		:id => ["ID de l'image", :Fixnum],
  		:"*key" => ["Touche de la souris (par défaut, :mouse_left)", :Symbol],
  		:"*precise" => ["si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false", :Boolean],

  	}, true # Maybe changed
  register_command :picture, 'Command.picture_mouse_press?'

  # AUTOGenerated for picture_mouse_trigger?
  link_method_documentation 'Command.picture_mouse_trigger?',
  	'Renvoie true si la souris survol et presse la touche référencée sur l\'image référencée par son ID',
   	{
  		:id => ["ID de l'image", :Fixnum],
  		:"*key" => ["Touche de la souris (par défaut, :mouse_left)", :Symbol],
  		:"*precise" => ["si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false", :Boolean],

  	}, true # Maybe changed
  register_command :picture, 'Command.picture_mouse_trigger?'

  # AUTOGenerated for picture_mouse_repeat?
  link_method_documentation 'Command.picture_mouse_repeat?',
  	'Renvoie true si la souris survol et presse successivement la touche référencée sur l\'image référencée par son ID',
   	{
  		:id => ["ID de l'image", :Fixnum],
  		:"*key" => ["Touche de la souris (par défaut, :mouse_left)", :Symbol],
  		:"*precise" => ["si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false", :Boolean],

  	}, true # Maybe changed
  register_command :picture, 'Command.picture_mouse_repeat?'

  # AUTOGenerated for picture_mouse_release?
  link_method_documentation 'Command.picture_mouse_release?',
  	'Renvoie true si la souris survol et relâche la touche référencée sur l\'image référencée par son ID',
   	{
  		:id => ["ID de l'image", :Fixnum],
  		:"*key" => ["Touche de la souris (par défaut, :mouse_left)", :Symbol],
  		:"*precise" => ["si false, détecte via le rectangle de l'image, si false, détecte au pixel près. Par défaut, false", :Boolean],

  	}, true # Maybe changed
  register_command :picture, 'Command.picture_mouse_release?'


  # AUTOGenerated for picture_erased?
  link_method_documentation 'Command.picture_erased?',
  	'Renvoie true si l\'image est supprimée (ou non affichée), false sinon',
   	{
  		:id => ["ID de l'image", :Fixnum],

  	}, true # Maybe changed
  register_command :picture, 'Command.picture_erased?'

  # AUTOGenerated for picture_showed?
  link_method_documentation 'Command.picture_showed?',
  'Renvoie true si l\'image est affichée, false sinon',
   	{
  		:id => ["ID de l'image", :Fixnum],

  	}, true # Maybe changed
  register_command :picture, 'Command.picture_showed?'

  link_method_documentation "Command.picture_show",
                          "Affiche une image à l'écran",
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :name => ["Nom de l'image (sans l'extension, entre guillemets anglais)", :String],
                            :"*x" => ["Position en X de l'image (par défaut 0)", :Fixnum],
                            :"*y" => ["Position en Y de l'image (par défaut 0)", :Fixnum],
                            :"*origin" => ["Origine de l'image, 0 = Haut gauche, 1 = centré, [x,y] = orienté autours de X,Y, par défaut, zéro", :Fixnum],
                            :"*zoom_x" => ["Zoom sur la largeur de l'image par défaut 100 (pour 100%)", :Fixnum],
                            :"*zoom_y" => ["Zoom sur la hauteur de l'image par défaut 100 (pour 100%)", :Fixnum],
                            :"*opacity" => ["Opacité de l'image, par défaut 255 (de 0 à 255)", :Fixnum],
                            :"*blend_type" => ["Mode de fusion, par défaut 0, 0=Normal, 1=Addition, 2=Soustraction", :Fixnum],
                          }
  register_command :picture, "Command.picture_show"

  link_method_documentation "Command.picture_show_screenshot",
                            "Affiche une capture d'écran (comme une image normale)",
                            {
                              :id => ["ID de l'image", :Fixnum],
                             :"*x" => ["Position en X de l'image (par défaut 0)", :Fixnum],
                             :"*y" => ["Position en Y de l'image (par défaut 0)", :Fixnum],
                             :"*origin" => ["Origine de l'image, 0 = Haut gauche, 1 = centré, [x,y] = orienté autours de X,Y, par défaut, zéro", :Fixnum],
                             :"*zoom_x" => ["Zoom sur la largeur de l'image par défaut 100 (pour 100%)", :Fixnum],
                             :"*zoom_y" => ["Zoom sur la hauteur de l'image par défaut 100 (pour 100%)", :Fixnum],
                             :"*opacity" => ["Opacité de l'image, par défaut 255 (de 0 à 255)", :Fixnum],
                             :"*blend_type" => ["Mode de fusion, par défaut 0, 0=Normal, 1=Addition, 2=Soustraction", :Fixnum],
                            }
  register_command :picture, "Command.picture_show_screenshot"

  # AUTOGenerated for picture_move?
  link_method_documentation 'Command.picture_move?',
  	'Renvoie true si l\'image référencée par son ID est en mouvement, false sinon',
   	{
  		:id => ["ID de l'image", :Fixnum],
  	}, true # Maybe changed
  register_command :picture, 'Command.picture_move?'

  # AUTOGenerated for picture_name
  link_method_documentation 'Command.picture_name',
  	"Change le nom de l'image à afficher",
   	{
  		:id => ["ID de l'image", :Fixnum],
  		:"*name" => ["Nom de l'image (sans l'extension, entre guillemets anglais), si aucun argument n'est passé, la commande renverra le nom courrant", :String],
  	}, true # Maybe changed
  register_command :picture, 'Command.picture_name'

  link_method_documentation "Command.picture_origin",
                          "Change l'origine d'une image",
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :origin => ["Origine de l'image, 0 = Haut gauche, 1 = centré, [x,y] = orienté autour de X,Y, par défaut, zéro, zéro", :Fixnum],
                          }
  register_command :picture, "Command.picture_origin"

  link_method_documentation "Command.picture_x",
                          "Change l'axe X d'une image",
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :x => ["Position en x de l'image, si aucun argument n'est passé, la commande renverra la position X de l'image", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }, true
  register_command :picture, "Command.picture_x"

  link_method_documentation "Command.picture_y",
                          "Change l'axe Y d'une image",
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :y => ["Position en y de l'image, si aucun argument n'est passé, la commande renverra la position Y de l'image", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }, true
  register_command :picture, "Command.picture_y"
  link_method_documentation "Command.picture_position",
                          "Change la position de l'image",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :x => ["Position en x de l'image", :Fixnum],
                            :y => ["Position en y de l'image", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }
  register_command :picture, "Command.picture_position"
  link_method_documentation "Command.picture_move",
                          "Déplace une image",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :x => ["Position en x de l'image où l'image doit se rendre", :Fixnum],
                            :y => ["Position en y de l'image où l'image doit se rendre", :Fixnum],
                            :zoom_x => ["Zoom de la largeur (en %)", :Fixnum],
                            :zoom_y => ["Zoom de la hauteur (en %)", :Fixnum],
                            :duration => ["Durée du déplacement en frames", :Fixnum],
                            :"*wait_flag" => ["Attendre la fin du déplacement, par défaut, true", :Boolean],
                            :"*opacity" => ["Opacité (de 0 à 255) que l'image devra avoir, si '-1', ou aucun argument n'est donné, l'image conserva son opacité actuelle", :Fixnum],
                            :"*blend_type" => ["Mode de fusion (0, 1, 2) que l'image devra avoir, si '-1', ou aucun argument n'est donné, l'image conserva son mode de fusion du moment", :Fixnum],
                            :"*origin" => ["Origine que l'image devra avoir, si '-1', ou aucun argument n'est donné, l'image conserva son origine du moment", :Fixnum],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],

                          }
  register_command :picture, "Command.picture_move"
  link_method_documentation "Command.picture_wave",
                          "Fait onduler l'image",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :amplitude => ["Amplitude (taille de l'ondulation)", :Fixnum],
                            :vitesse => ["Vitesse de l'ondulation", :Fixnum],
                          }
  register_command :picture, "Command.picture_wave"
  link_method_documentation "Command.picture_flip",
                          "Applique un effet miroir (axe vertical) sur l'image ",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                          }
  register_command :picture, "Command.picture_flip"
  link_method_documentation "Command.picture_angle",
                          "Change l'angle de l'image",
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :angle => ["Angle d'orientation de l'image (En degrés décimaux, sens anti-horaire). Si aucun angle n'est donné, la commande renverra l'angle de l'image", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }, true
  register_command :picture, "Command.picture_angle"
  link_method_documentation "Command.picture_rotate",
                          "Fait tourner l'image",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :speed => ["Vitesse de rotation de l'image", :Fixnum],
                          }
  register_command :picture, "Command.picture_rotate"
  link_method_documentation "Command.picture_zoom_x",
                          "Change la largeur d'une image",
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :zoom => ["Pourcentage d'agrandissement de la largeur de l'image. Si aucune valeur n'est donnée, la commande renverra le zoom_x de l'image.", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }, true
  register_command :picture, "Command.picture_zoom_x"
  link_method_documentation "Command.picture_zoom_y",
                          "Change la hauteur d'une image",
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :zoom => ["Pourcentage d'agrandissement de la hauteur de l'image. Si aucune valeur n'est donnée, la commande renverra le zoom_y de l'image.", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }, true
  register_command :picture, "Command.picture_zoom_y"
  link_method_documentation "Command.picture_zoom",
                          "Change la taille d'une image",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :zoom_x => ["Pourcentage d'agrandissement de la largeur de l'image", :Fixnum],
                            :"*zoom_y" => ["Pourcentage d'agrandissement de la hauteur de l'image. Si cet argument est ommis, la largeur sera égale à la hauteur.", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }, true
  register_command :picture, "Command.picture_zoom"
  link_method_documentation "Command.picture_tone",
                          "Change la teinte d'une image",
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :tone => ["Teinte de l'image (utilisez la commande tone)", :Tone],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut false", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }
  register_command :picture, "Command.picture_tone"

  link_method_documentation "Command.picture_blend",
                          "Change le mode de fusion d'une image",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :mode => ["Mode choisi (0, 1 ou 2)", :Fixnum],
                          }
  register_command :picture, "Command.picture_blend"
  link_method_documentation "Command.picture_pin",
                          "Fait défiler une image avec la carte (la fixe à une position)",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :"*x" => ["Coordonnées X de la carte en pixels, par défaut la coordonnée convertie de l'écran vers la carte", :Fixnum],
                            :"*y" => ["Coordonnées Y de la carte en pixels, par défaut la coordonnée convertie de l'écran vers la carte", :Fixnum]
                          }
  register_command :picture, "Command.picture_pin"


  link_method_documentation "Command.picture_erase",
                          "Efface l'image",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                          }
  register_command :picture, "Command.picture_erase"
  link_method_documentation "Command.pictures_clear",
                          "Efface toutes les images",
                          {
                          }
  register_command :picture, "Command.pictures_clear"
  link_method_documentation "Command.picture_unpin",
                          "Arrête de faire défiler une image avec la carte",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                          }
  register_command :picture, "Command.picture_unpin"
  link_method_documentation "Command.picture_opacity",
                          "Change l'opacité d'une image",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :opacity => ["valeur de l'opacité (de 0 à 255)", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }
  register_command :picture, "Command.picture_opacity"
  link_method_documentation "Command.picture_shake",
                          "Fait trembler l'image pendant un temps donné",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :power => ["La puissance du tremblement", :Fixnum],
                            :speed => ["La vitesse du tremblement", :Fixnum],
                            :duration => ["La durée en frames du tremblement", :Fixnum],
                          }
  register_command :picture, "Command.picture_shake"

  link_method_documentation "Command.pixel_in_picture?",
                          "Vérifie que le x, y sont inscrits dans l'image",
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :x => ["Coordonnées X", :Fixnum],
                            :y => ["Coordonnées Y", :Fixnum],
                            :"*precise" => ["Par défaut, precise vaut false, si precise vaut true, seuls les pixels non transparents seront pris en compte", :Boolean]
                          }, true
  register_command :picture, "Command.pixel_in_picture?"

  link_method_documentation "Command.pictures_collide?",
                          "Vérifie que deux images sont en collision",
                          {
                            :id => ["ID de l'image", :Fixnum],
                            :id2 => ["ID de l'autre image", :Fixnum],
                          }, true
  register_command :picture, "Command.pictures_collide?"

  link_method_documentation "Command.picture_scroll_x",
                          "Change la vitesse de défilement horizontal d'une image fixée sur la carte, si aucune vitesse n'est donnée (et que le selector est un simple ID) alors la commande renverra simplement la valeur de défilement.",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :"*vitesse" => ["Vitesse de défilement", :Fixnum],
                          }
  register_command :picture, "Command.picture_scroll_x"
  link_method_documentation "Command.picture_scroll_y",
                          "Change la vitesse de défilement vertical d'une image fixée sur la carte, si aucune vitesse n'est donnée (et que le selector est un simple ID) alors la commande renverra simplement la valeur de défilement.",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :"*vitesse" => ["Vitesse de défilement", :Fixnum],
                          }
  register_command :picture, "Command.picture_scroll_y"
  link_method_documentation "Command.picture_scroll",
                          "Change la vitesse de défilement (vertical et horizontal) d'une image fixée sur la carte",
                          {
                            :Selector => ["Sélécteur de l'image", :Selector],
                            :vitesse => ["Vitesse de défilement", :Fixnum],
                          }
  register_command :picture, "Command.picture_scroll"

  # AUTOGenerated for picture_width
  link_method_documentation 'Command.picture_width',
    'Change la largeur d\'une image référencée par son ID',
    {
      :id => ["ID de l'image", :Fixnum],
      :"*v" => ["Valeur à changer, si aucune valeur n'est donnée, la commande renverra la largeur de l'image", :Fixnum],
      :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
      :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
      :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
    }, true # Maybe changed
  register_command :picture, 'Command.picture_width'

  # AUTOGenerated for picture_height
  link_method_documentation 'Command.picture_height',
    'Change la hauteur d\'une image référencée par son ID',
    {
      :id => ["ID de l'image", :Fixnum],
      :"*v" => ["Valeur à changer, si aucune valeur n'est donnée, la commande renverra la hauteur de l'image", :Fixnum],
      :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
      :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
      :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
    }, true # Maybe changed
  register_command :picture, 'Command.picture_height'

  # AUTOGenerated for picture_dimension
  link_method_documentation 'Command.picture_dimension',
    'Change la hauteur et la largeur d\'une image référencée par son ID',
    {
      :id => ["ID de l'image", :Fixnum],
      :w => ["Largeur à modifier", :Fixnum],
      :h => ["Hauteur à modifier", :Fixnum],
      :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
      :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
      :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
    }
  register_command :picture, 'Command.picture_dimension'

  link_method_documentation "Command.parallax_show",
                          "Affiche un panorama",
                          {
                            :id => ["ID du panorama", :Fixnum],
                            :name => ["Nom du panorama", :String],
                            :"*z" => ["Axe Z (par défaut - 100)", :Fixnum],
                            :"*opacity" => ["Opacité, entre 0 et 255. (par défaut 255)", :Fixnum],
                            :"*auto_x" => ["Défilement automatique horizontal (par défaut 0, ne défile pas)", :Fixnum],
                            :"*auto_y" => ["Défilement automatique vertical (par défaut 0, ne défile pas)", :Fixnum],
                            :"*scroll_x" => ["Défilement horizontal (par défaut 2, à la même vitesse que la carte. 1 = vitesse du panorama de VXace)", :Fixnum],
                            :"*scroll_y" => ["Défilement vertical (par défaut 2, à la même vitesse que la carte. 1 = vitesse du panorama de VXace)", :Fixnum],
                            :"*blend_type" => ["Mode de fusion (par défaut 0), mode normal", :Fixnum],
                            :"*zoom_x" => ["Zoom horizontal (par défaut 100)", :Fixnum],
                            :"*zoom_y" => ["Zoom vertical (par défaut 100)", :Fixnum],
                            :"*tone" => ["Teinte, utilisez la commande tone (rubrique Standard), par défaut aucun changement de teinte", :Tone]
                          }
  register_command :parallax, "Command.parallax_show"
  link_method_documentation "Command.parallax_transform",
                          "Transforme un panorama durant une période",
                          {
                            :id => ["ID du panorama", :Fixnum],
                            :duration => ["Durée en frame du déplacement", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut false", :Boolean],
                            :"*zoom_x" => ["Zoom horizontal (par défaut 100)", :Fixnum],
                            :"*zoom_y" => ["Zoom vertical (par défaut 100)", :Fixnum],
                            :"*opacity" => ["Opacité, entre 0 et 255. (par défaut 255)", :Fixnum],
                            :"*tone" => ["Teinte, utilisez la commande tone (rubrique Standard), par défaut aucun changement de teinte", :Tone],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }
  register_command :parallax, "Command.parallax_transform"
  link_method_documentation "Command.parallax_erase",
                          "Supprime un panorama",
                          {
                            :id => ["ID du panorama", :Fixnum]
                          }
  register_command :parallax, "Command.parallax_erase"
  link_method_documentation "Command.parallaxes_clear",
                          "Supprime tous les panoramas",
                          {}
  register_command :parallax, "Command.parallaxes_clear"
  link_method_documentation "Command.parallax_blend",
                          "Change le mode de fusion d'un panorama",
                          {
                            :id => ["ID du panorama", :Fixnum],
                            :blend_type => ["mode de fusion (0 => normal, 1 => Addition, 2 => Soustraction)", :Fixnum]
                          }
  register_command :parallax, "Command.parallax_blend"
  link_method_documentation "Command.parallax_autoscroll_x",
                          "Défilement horizontal automatique d'un panorama",
                          {
                            :id => ["ID du panorama", :Fixnum],
                            :speed => ["Vitesse de défilement", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }
  register_command :parallax, "Command.parallax_autoscroll_x"
  link_method_documentation "Command.parallax_autoscroll_y",
                          "Défilement vertical automatique d'un panorama",
                          {
                            :id => ["ID du panorama", :Fixnum],
                            :speed => ["Vitesse de défilement", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }
  register_command :parallax, "Command.parallax_autoscroll_y"
  link_method_documentation "Command.parallax_scroll_x",
                          "Défilement horizontal d'un panorama par rapport au défilement de la carte",
                          {
                            :id => ["ID du panorama", :Fixnum],
                            :speed => ["Vitesse de défilement", :Fixnum]
                          }
  register_command :parallax, "Command.parallax_scroll_x"
  link_method_documentation "Command.parallax_scroll_y",
                          "Défilement vertical d'un panorama par rapport au défilement de la carte",
                          {
                            :id => ["ID du panorama", :Fixnum],
                            :speed => ["Vitesse de défilement", :Fixnum]
                          }
  register_command :parallax, "Command.parallax_scroll_y"
  link_method_documentation "Command.parallax_zoom_x",
                          "Zoom horizontal d'un panorama",
                          {
                            :id => ["ID du panorama", :Fixnum],
                            :zoom => ["taille en pourcentage", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }
  register_command :parallax, "Command.parallax_zoom_x"
  link_method_documentation "Command.parallax_zoom_y",
                          "Zoom vertical d'un panorama",
                          {
                            :id => ["ID du panorama", :Fixnum],
                            :zoom => ["taille en pourcentage", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }
  register_command :parallax, "Command.parallax_zoom_y"
  link_method_documentation "Command.parallax_zoom",
                          "Zoom sur les deux axes d'un panorama",
                          {
                            :id => ["ID du panorama", :Fixnum],
                            :zoom => ["taille en pourcentage", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }
  register_command :parallax, "Command.parallax_zoom"
  link_method_documentation "Command.parallax_tone",
                          "Change la teinte d'un panorama",
                          {
                            :id => ["ID du panorama", :Fixnum],
                            :tone => ["teinte du panorama (utilisez la commande tone des commandes standards)", :Tone],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                            :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                          }
  register_command :parallax, "Command.parallax_tone"
  link_method_documentation "Command.parallax_opacity",
                        "Change l'opacité d'un panorama",
                        {
                          :id => ["ID du panorama", :Fixnum],
                          :opacity => ["valeur de l'opacité (0 à 255)", :Fixnum],
                          :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                          :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],
                        }
  register_command :parallax, "Command.parallax_opacity"


  # # Retirée car trop peu performante en ce moment :)
  # register_command :picture, "Command.pictures_collide?"
  # link_method_documentation "Command.pictures_perfect_collide?",
  #                         "Vérifie que deux images sont en collisions en tenant compte de la transparence (Attention, actuellement cette commande lag beaucoup)",
  #                         {
  #                           :id => ["ID de l'image", :Fixnum],
  #                           :id2 => ["ID de l'autre image", :Fixnum],
  #                         }, true
  # register_command :picture, "Command.pictures_perfect_collide?"



link_method_documentation "Command.team_size",
                        "Renvoie la taille de l'équipe",
                        {}, true
register_command :party, "Command.team_size"

link_method_documentation "Command.gold",
                        "Renvoie l'argent possédé",
                        {}, true
register_command :party, "Command.gold"

link_method_documentation "Command.steps",
                        "Renvoie le nombre de pas effectués par l'équipe",
                        {}, true
register_command :party, "Command.steps"

link_method_documentation "Command.play_time",
                        "Renvoie le temps de jeu en secondes",
                        {}, true
register_command :party, "Command.play_time"

link_method_documentation "Command.timer",
                        "Renvoie la valeur du chronomètre",
                        {}, true
register_command :party, "Command.timer"

link_method_documentation "Command.save_count",
                        "Renvoie le nombre de sauvegardes effectuées par partie",
                        {}, true
register_command :party, "Command.save_count"

link_method_documentation "Command.battle_count",
                        "Renvoie le nombre de combats effectués par partie",
                        {}, true
register_command :party, "Command.battle_count"

# AUTOGenerated for items_possessed
link_method_documentation 'Command.items_possessed',
	'Renvoie la liste des objets possédés',
 	{}, true # Maybe changed
register_command :items, 'Command.items_possessed'

# AUTOGenerated for armors_possessed
link_method_documentation 'Command.armors_possessed',
'Renvoie la liste des armures possédées',
 	{}, true # Maybe changed
register_command :armors, 'Command.armors_possessed'

# AUTOGenerated for weapons_possessed
link_method_documentation 'Command.weapons_possessed',
'Renvoie la liste des armes possédées',
 	{}, true # Maybe changed
register_command :weapons, 'Command.weapons_possessed'


link_method_documentation "Command.item_count",
                        "Renvoie le nombre d'objets (référencés par un ID) possédés par l'équipe",
                        {:id => ["Id de l'objet à compter", :Fixnum]}, true
register_command :items, "Command.item_count"

link_method_documentation "Command.weapon_count",
                        "Renvoie le nombre d'armes (référencées par un ID) possédées par l'équipe",
                        {:id => ["Id de l'arme à compter", :Fixnum]}, true
register_command :weapons, "Command.weapon_count"

link_method_documentation "Command.armor_count",
                        "Renvoie le nombre d'armures (référencées par un ID) possédées par l'équipe",
                        {:id => ["Id de l'armure à compter", :Fixnum]}, true
register_command :armors, "Command.armor_count"

link_method_documentation "Command.item_name",
                        "Renvoie le nom de l'objet référencé par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :items, "Command.item_name"

link_method_documentation "Command.weapon_name",
                        "Renvoie le nom de l'arme référencée par son ID",
                        {:id => ["Id de l'arme", :Fixnum]}, true
register_command :weapons, "Command.weapon_name"

link_method_documentation "Command.armor_name",
                        "Renvoie le nom de l'armure référencée par son ID",
                        {:id => ["Id de l'armure", :Fixnum]}, true
register_command :armors, "Command.armor_name"

link_method_documentation "Command.item_note",
                        "Renvoie le commentaire de l'objet référencé par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :items, "Command.item_note"

link_method_documentation "Command.weapon_note",
                        "Renvoie le commentaire de l'arme référencée par son ID",
                        {:id => ["Id de l'arme", :Fixnum]}, true
register_command :weapons, "Command.weapon_note"

link_method_documentation "Command.armor_note",
                        "Renvoie le commentaire de l'armure référencée par son ID",
                        {:id => ["Id de l'armure", :Fixnum]}, true
register_command :armors, "Command.armor_note"

link_method_documentation "Command.item_description",
                        "Renvoie la description de l'objet référencé par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :items, "Command.item_description"

link_method_documentation "Command.weapon_description",
                        "Renvoie la description de l'arme référencée par son ID",
                        {:id => ["Id de l'arme", :Fixnum]}, true
register_command :weapons, "Command.weapon_description"

link_method_documentation "Command.armor_description",
                        "Renvoie la description de l'armure référencé par son ID",
                        {:id => ["Id de l'armure", :Fixnum]}, true
register_command :armors, "Command.armor_description"

link_method_documentation "Command.item_icon",
                        "Renvoie l'index de l'icone de l'objet référencé par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :items, "Command.item_icon"

link_method_documentation "Command.weapon_icon",
                        "Renvoie l'index de l'icone de l'arme référencée par son ID",
                        {:id => ["Id de l'arme", :Fixnum]}, true
register_command :weapons, "Command.weapon_icon"

link_method_documentation "Command.armor_icon",
                        "Renvoie l'index de l'icone de l'armure référencée par son ID",
                        {:id => ["Id de l'armure", :Fixnum]}, true
register_command :armors, "Command.armor_icon"

link_method_documentation "Command.item_price",
                        "Renvoie le prix de l'objet référencé par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :items, "Command.item_price"

link_method_documentation "Command.weapon_price",
                        "Renvoie le prix de l'arme référencée par son ID",
                        {:id => ["Id de l'arme", :Fixnum]}, true
register_command :weapons, "Command.weapon_price"

link_method_documentation "Command.armor_price",
                        "Renvoie le prix  de l'armure référencée par son ID",
                        {:id => ["Id de l'armure", :Fixnum]}, true
register_command :armors, "Command.armor_price"

link_method_documentation "Command.item_consumable?",
                        "Renvoie true si l'objet référencé par son ID est consommable, false sinon",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :items, "Command.item_consumable?"

link_method_documentation "Command.is_key_item?",
                        "Renvoie true si l'objet référencé par son ID est un objet clé, false sinon",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :items, "Command.is_key_item?"

link_method_documentation "Command.weapon_max_hit_points",
                        "Renvoie le maximum des points de vie d'une arme référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :weapons, "Command.weapon_max_hit_points"

link_method_documentation "Command.weapon_max_magic_points",
                        "Renvoie le maximum des points de magie d'une arme référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :weapons, "Command.weapon_max_magic_points"

link_method_documentation "Command.weapon_attack_power",
                        "Renvoie la puissance d'attaque d'une arme référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :weapons, "Command.weapon_attack_power"

link_method_documentation "Command.weapon_defense_power",
                        "Renvoie la puissance de défense d'une arme référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :weapons, "Command.weapon_defense_power"

link_method_documentation "Command.weapon_magic_attack_power",
                        "Renvoie la puissance d'attaque magique d'une arme référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :weapons, "Command.weapon_magic_attack_power"

link_method_documentation "Command.weapon_magic_defense_power",
                        "Renvoie la puissance de défense magique d'une arme référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :weapons, "Command.weapon_magic_defense_power"

link_method_documentation "Command.weapon_agility",
                        "Renvoie l'apport d'agilité d'une arme référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :weapons, "Command.weapon_agility"

link_method_documentation "Command.weapon_luck",
                        "Renvoie l'apport de chance d'une arme référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :weapons, "Command.weapon_luck"

link_method_documentation "Command.armor_max_hit_points",
                        "Renvoie le maximum des points de vie d'une armure référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :armors, "Command.armor_max_hit_points"

link_method_documentation "Command.armor_max_magic_points",
                        "Renvoie le maximum des points de magie d'une armure référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :armors, "Command.armor_max_magic_points"

link_method_documentation "Command.armor_attack_power",
                        "Renvoie la puissance d'attaque d'une armure référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :armors, "Command.armor_attack_power"

link_method_documentation "Command.armor_defense_power",
                        "Renvoie la puissance de défense d'une armure référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :armors, "Command.armor_defense_power"

link_method_documentation "Command.armor_magic_attack_power",
                        "Renvoie la puissance d'attaque magique d'une armure référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :armors, "Command.armor_magic_attack_power"

link_method_documentation "Command.armor_magic_defense_power",
                        "Renvoie la puissance de défense magique d'une armure référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :armors, "Command.armor_magic_defense_power"

link_method_documentation "Command.armor_agility",
                        "Renvoie l'apport d'agilité d'une armure référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :armors, "Command.armor_agility"

link_method_documentation "Command.armor_luck",
                        "Renvoie l'apport de chance d'une armure référencée par son ID",
                        {:id => ["Id de l'objet", :Fixnum]}, true
register_command :armors, "Command.armor_luck"

link_method_documentation "Command.give_item",
                        "Fait gagner à l'équipe l'objet référencé par son ID",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                          :amount => ["Nombre à donner. Si le nombre est négatif, l'objet sera retiré", :Fixnum],

                        }
register_command :items, "Command.give_item"

link_method_documentation "Command.give_weapon",
                        "Fait gagner à l'équipe l'arme référencé par son ID",
                        {
                          :id => ["Id de l'arme", :Fixnum],
                          :amount => ["Nombre à donner. Si le nombre est négatif, l'objet sera retiré", :Fixnum],
                          :"*include_equipement" => ["Ce paramètre n'est utile que si on supprime des objets (ammount négatif). Si cette variable vaut true, les objets équipés seront déséquipés si l'inventaire n'en possède pas assez. Par défaut, il vaut false. Donc pas de déséquipement", :Boolean]

                        }
register_command :weapons, "Command.give_weapon"

link_method_documentation "Command.give_armor",
                        "Fait gagner à l'équipe l'armure référencée par son ID",
                        {
                          :id => ["Id de l'armure", :Fixnum],
                          :amount => ["Nombre à donner. Si le nombre est négatif, l'objet sera retiré", :Fixnum],
                          :"*include_equipement" => ["Ce paramètre n'est utile que si on supprime des objets (ammount négatif). Si cette variable vaut true, les objets équipés seront déséquipés si l'inventaire n'en possède pas assez. Par défaut, il vaut false. Donc pas de déséquipement", :Boolean]

                        }
register_command :armors, "Command.give_armor"

link_method_documentation "Command.has_item?",
                        "Renvoie true si l'objet référencé par son ID est possédé par l'équipe, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],

                        }, true
register_command :items, "Command.has_item?"

link_method_documentation "Command.has_weapon?",
                        "Renvoie true si l'arme référencée par son ID est possédée par l'équipe, false sinon",
                        {
                          :id => ["Id de l'arme", :Fixnum],
                           :"*include_equipement" => ["Si ce paramètre vaut true, la commande prend en compte l'équipement, sinon (false), elle ne le prend pas en compte (par défaut: false)", :Boolean]

                        }, true
register_command :weapons, "Command.has_weapon?"

link_method_documentation "Command.has_armor?",
                        "Renvoie true si l'armure référencée par son ID est possédée par l'équipe, false sinon",
                        {
                          :id => ["Id de l'armure", :Fixnum],
                           :"*include_equipement" => ["Si ce paramètre vaut true, la commande prend en compte l'équipement, sinon (false), elle ne le prend pas en compte (par défaut: false)", :Boolean]

                        }, true
register_command :armors, "Command.has_armor?"
link_method_documentation "Command.weapon_equiped?",
                        "Renvoie true si l'arme référencée par son ID est équipée par un des membres de l'équipe, false sinon",
                        {
                          :id => ["Id de l'arme", :Fixnum],
                          :"*member_id" => ["Id du membre de l'équipe. Si aucun membre_id n'est spécifié, la commande vérifiera pour toute l'équipe ", :Fixnum],
                        }, true
register_command :weapons, "Command.weapon_equiped?"
link_method_documentation "Command.armor_equiped?",
                        "Renvoie true si l'armure référencée par son ID est équipée par un des membres de l'équipe, false sinon",
                        {
                          :id => ["Id de l'armure", :Fixnum],
                          :"*member_id" => ["Id du membre de l'équipe. Si aucun membre_id n'est spécifié, la commande vérifiera pour toute l'équipe ", :Fixnum],
                        }, true
register_command :armors, "Command.armor_equiped?"

link_method_documentation "Command.weapon_type",
                        "Renvoie le type de l'arme référencée par son ID",
                        {
                          :id => ["Id de l'arme", :Fixnum],
                        }, true
register_command :weapons, "Command.weapon_type"

link_method_documentation "Command.armor_type",
                        "Renvoie le type de l'armure référencée par son ID",
                        {
                          :id => ["Id de l'armure", :Fixnum],
                        }, true
register_command :armors, "Command.armor_type"

link_method_documentation "Command.item_scope",
                        "Renvoie la portée (en Entier) d'un objet référencé par son ID",
                        {
                          :id => ["Id de l'armure", :Fixnum],
                        }, true
register_command :items, "Command.item_scope"

link_method_documentation "Command.item_has_no_scope?",
                        "Renvoie true si l'objet référencé par son ID ne cible personne, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_has_no_scope?"

link_method_documentation "Command.item_for_one_enemy?",
                        "Renvoie true si l'objet référencé par son ID cible un ennemi, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_one_enemy?"

link_method_documentation "Command.item_for_all_enemies?",
                        "Renvoie true si l'objet référencé par son ID cible tous les ennemis, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_all_enemies?"

link_method_documentation "Command.item_for_one_random_enemy?",
                        "Renvoie true si l'objet référencé par son ID cible un ennemi au hasard, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_one_random_enemy?"

link_method_documentation "Command.item_for_two_random_enemies?",
                        "Renvoie true si l'objet référencé par son ID cible deux ennemis au hasard, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_two_random_enemies?"

link_method_documentation "Command.item_for_three_random_enemies?",
                        "Renvoie true si l'objet référencé par son ID cible trois ennemis au hasard, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_three_random_enemies?"

link_method_documentation "Command.item_for_four_random_enemies?",
                        "Renvoie true si l'objet référencé par son ID cible quatre ennemis au hasard, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_four_random_enemies?"

link_method_documentation "Command.item_for_one_ally?",
                        "Renvoie true si l'objet référencé par son ID cible un allié vivant, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_one_ally?"

link_method_documentation "Command.item_for_all_allies?",
                        "Renvoie true si l'objet référencé par son ID cible tous les alliés vivants, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_all_allies?"

link_method_documentation "Command.item_for_one_dead_ally?",
                        "Renvoie true si l'objet référencé par son ID cible un allié mort, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_one_dead_ally?"

link_method_documentation "Command.item_for_all_dead_allies?",
                        "Renvoie true si l'objet référencé par son ID cible tous les alliés morts, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_all_dead_allies?"

link_method_documentation "Command.item_for_caller?",
                        "Renvoie true si l'objet référencé par son ID est utilisable sur le personnage du moment, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_caller?"

link_method_documentation "Command.item_for_opponent?",
                        "Renvoie true si l'objet référencé par son ID cible les ennemis, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_opponent?"

link_method_documentation "Command.item_for_friend?",
                        "Renvoie true si la cible de l'objet référencé par son ID est du côté allié, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_friend?"

link_method_documentation "Command.item_for_dead_friend?",
                        "Renvoie true si l'objet référencé par son ID cible un (ou les) allié(s) mort(s), false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_dead_friend?"

link_method_documentation "Command.item_for_one?",
                        "Renvoie true si l'objet référencé par son ID a une seule cible, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_one?"

link_method_documentation "Command.item_for_random?",
                        "Renvoie true si l'objet référencé par son ID cible aléatoirement, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_random?"

link_method_documentation "Command.item_for_all?",
                        "Renvoie true si l'objet référencé par son ID cible tout un groupe (tous les alliés ou tous les ennemis), false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_for_all?"

link_method_documentation "Command.item_need_selection?",
                        "Renvoie true si un objet référencé par son ID requiert la sélection d'une cible, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_need_selection?"


link_method_documentation "Command.item_certain?",
                        "Renvoie true si un objet référencé par son ID a une garantie de réussite totale, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_certain?"

link_method_documentation "Command.item_physical?",
                        "Renvoie true si un objet référencé par son ID endommage les PV, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_physical?"

link_method_documentation "Command.item_magical?",
                        "Renvoie true si un objet référencé par son ID endommage les PM, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_magical?"

link_method_documentation "Command.item_number_of_targets",
                        "Renvoie le nombre de cibles d'un objet référencé par son ID, false sinon",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_number_of_targets"



link_method_documentation "Command.item_occasion",
                        "Renvoie un entier correspondant au droit d'utilisation de l'objet",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_occasion"

link_method_documentation "Command.item_always_usable?",
                        "Renvoie true si l'objet référencé par son ID est utilisable partout",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_always_usable?"

link_method_documentation "Command.item_battle_usable?",
                        "Renvoie true si l'objet référencé par son ID est utilisable en combat seulement ",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_battle_usable?"

link_method_documentation "Command.item_menu_usable?",
                        "Renvoie true si l'objet référencé par son ID est utilisable dans le menu seulement",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_menu_usable?"

link_method_documentation "Command.item_never_usable?",
                        "Renvoie true si l'objet référencé par son ID n'est jamais utilisable",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_never_usable?"

link_method_documentation "Command.item_speed",
                        "Renvoie l'apport de vitesse de l'objet référencé par son ID",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_speed"

link_method_documentation "Command.item_nb_hits",
                        "Renvoie le nombre de coups portés par l'objet référencé par son ID",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_nb_hits"

link_method_documentation "Command.item_success_rate",
                        "Renvoie la probabilité de succès de l'objet référencé par son ID",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_success_rate"

link_method_documentation "Command.item_tp_gain",
                        "Renvoie le gain de TP que l'objet référencé par son ID apporte une fois utilisé en combat",
                        {
                          :id => ["Id de l'objet", :Fixnum],
                        }, true
register_command :items, "Command.item_tp_gain"

link_method_documentation "Command.game_title",
                        "Renvoie le titre du jeu",
                        {}, true
register_command :system, "Command.game_title"

link_method_documentation "Command.version_id",
                        "Renvoie l'ID de la version du jeu",
                        {}, true
register_command :system, "Command.version_id"

link_method_documentation "Command.currency",
                        "Renvoie la monnaie du jeu",
                        {}, true
register_command :system, "Command.currency"

link_method_documentation "Command.start_map_id",
                        "Renvoie l'ID de la map de départ",
                        {}, true
register_command :system, "Command.start_map_id"

link_method_documentation "Command.start_x",
                        "Renvoie la position X de départ du joueur",
                        {}, true
register_command :system, "Command.start_x"

link_method_documentation "Command.start_y",
                        "Renvoie la position Y de départ du joueur",
                        {}, true
register_command :system, "Command.start_y"


link_method_documentation "Command.gain_gold",
                        "Fait gagner de l'argent à l'équipe",
                        {:amount => "Total d'argent à faire gagner"}
register_command :party, "Command.gain_gold"

link_method_documentation "Command.lose_gold",
                        "Fait perdre de l'argent à l'équipe",
                        {:amount => "Total d'argent à faire perdre"}
register_command :party, "Command.lose_gold"
=begin
link_method_documentation "Command.actor_",
                        "héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }
register_command :actors, "Command.actor_"
=end

link_method_documentation "Command.actor_equip",
                        "Renvoie l'id de l'équipement (dans le slot indiqué) du héros (référencé par son ID)",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                          :slot => ["Slot d'équipement soit :Weapon, :Head, :Body, :Shield ou :Accessory", :Symbol]
                        }, true
register_command :actors, "Command.actor_equip"

link_method_documentation "Command.actor_weapon",
                        "renvoie l'id de l'arme équipée par le héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_weapon"

link_method_documentation "Command.actor_shield",
                        "renvoie l'id du bouclier équipé par le héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_shield"

link_method_documentation "Command.actor_head",
                        "renvoie l'id du casque équipé par le héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_head"

link_method_documentation "Command.actor_body",
                        "renvoie l'id de l'armure équipée par le héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_body"

link_method_documentation "Command.actor_description",
                        "renvoie la description du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_description"

link_method_documentation "Command.actor_accessory",
                        "renvoie l'id l'accessoire équipé par le héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_accessory"

link_method_documentation "Command.actor_has_weapon?",
                        "renvoie true si le héros référencé par son ID est équipé d'une arme, false sinon",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_has_weapon?"

link_method_documentation "Command.actor_has_shield?",
                        "renvoie true si le héros référencé par son ID est équipé d'un bouclier, false sinon",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_has_shield?"

link_method_documentation "Command.actor_has_head?",
                        "renvoie true si le héros référencé par son ID est équipé d'une casque, false sinon",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_has_head?"

link_method_documentation "Command.actor_has_body?",
                        "renvoie true si le héros référencé par son ID est équipé d'une armure, false sinon",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_has_body?"

link_method_documentation "Command.actor_has_accessory?",
                        "renvoie true si le héros référencé par son ID est équipé d'un accessoire, false sinon",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_has_accessory?"

link_method_documentation "Command.actor_level",
                        "renvoie le niveau du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_level"

link_method_documentation "Command.actor_level_max",
                        "renvoie le niveau maximum du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_level_max"

link_method_documentation "Command.actor_exp",
                        "renvoie les points d'expérience du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_exp"

link_method_documentation "Command.actor_note",
                        "renvoie le commentaire de la base de données du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_note"

link_method_documentation "Command.actor_hp",
                        "renvoie les points de vie du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_hp"

link_method_documentation "Command.actor_mp",
                        "renvoie les points de magie du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_mp"

link_method_documentation "Command.actor_tp",
                        "renvoie les points de temps du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                        }, true
register_command :actors, "Command.actor_tp"

link_method_documentation "Command.actor_max_hp",
                        "renvoie le nombre de points de vie maximum du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_max_hp"

link_method_documentation "Command.actor_max_mp",
                        "renvoie le nombre de points de magie maximum du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_max_mp"

link_method_documentation "Command.actor_attack",
                        "renvoie les points d'attaque du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_attack"

link_method_documentation "Command.actor_defense",
                        "renvoie les points de défense du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_defense"

link_method_documentation "Command.actor_magic_attack",
                        "renvoie les points d'attaque magique du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_magic_attack"

link_method_documentation "Command.actor_magic_defense",
                        "renvoie les points de défense magique du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_magic_defense"

link_method_documentation "Command.actor_agility",
                        "renvoie les points d'agilité du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_agility"

link_method_documentation "Command.actor_luck",
                        "renvoie les points de chance du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_luck"

link_method_documentation "Command.actor_hit_rate",
                        "renvoie la probabilité de toucher un ennemi pour le héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_hit_rate"

link_method_documentation "Command.actor_evasion_rate",
                        "renvoie la probabilité d'esquiver une attaque physique du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_evasion_rate"

link_method_documentation "Command.actor_critical_rate",
                        "renvoie la probabilité de coup critique du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_critical_rate"

link_method_documentation "Command.actor_critical_evasion_rate",
                        "renvoie la probabilité de faire un coup critique en préemptif du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_critical_evasion_rate"

link_method_documentation "Command.actor_magical_evasion_rate",
                        "renvoie la probabilité d'une esquiver une attaque magique d'un ennemi pour le héros référencé par son ID ",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_magical_evasion_rate"

link_method_documentation "Command.actor_magical_reflection_rate",
                        "renvoie la probabilité d'une réflexion magique du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_magical_reflection_rate"

link_method_documentation "Command.actor_counter_attack_rate",
                        "renvoie la probabilité d'un contre (sur une attaque physique) du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_counter_attack_rate"

link_method_documentation "Command.actor_hp_regeneration_rate",
                        "renvoie le pourcentage de régénération de PV à chaque tour du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_hp_regeneration_rate"

link_method_documentation "Command.actor_mp_regeneration_rate",
                        "renvoie le pourcentage de régénration de MP à chaque tour du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_mp_regeneration_rate"

link_method_documentation "Command.actor_tp_regeneration_rate",
                        "renvoie le pourcentage de régénration de TP par tour du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_tp_regeneration_rate"

link_method_documentation "Command.actor_target_rate",
                        "renvoie la probabilité d'être ciblé par un ennemi, du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_target_rate"

link_method_documentation "Command.actor_guard_effect_rate",
                        "renvoie la force de défense (diminution de l'attaque subie) du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_guard_effect_rate"

link_method_documentation "Command.actor_recovery_effect_rate",
                        "renvoie le pourcentage de PV/PM reçu, du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_recovery_effect_rate"

link_method_documentation "Command.actor_pharmacology",
                        "renvoie le pourcentage de PV/PM récupéré via un objet du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_pharmacology"

link_method_documentation "Command.actor_mp_cost_rate",
                        "renvoie le facteur d'un coût de MP (pour une attaque faisant varier la consommation de MP) du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_mp_cost_rate"

link_method_documentation "Command.actor_tp_charge_rate",
                        "renvoie le facteur de coût de TP (pour une attaque faisant varier la consommation de TP) du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_tp_charge_rate"

link_method_documentation "Command.actor_physical_damage_rate",
                        "renvoie le pourcentage de dommage physique reçu par le héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_physical_damage_rate"

link_method_documentation "Command.actor_magical_damage_rate",
                        "renvoie le pourcentage de dommage magique reçu par le héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_magical_damage_rate"

link_method_documentation "Command.actor_floor_damage_rate",
                        "renvoie le pourcentage de dommage des terrains reçu par le héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_floor_damage_rate"

link_method_documentation "Command.actor_exp_rate",
                        "renvoie le pourcentage de la variation d'acquisition d'expérience du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_exp_rate"

link_method_documentation "Command.actor_name",
                        "renvoie le nom du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_name"

link_method_documentation "Command.set_actor_name",
                        "modifie le nom du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                          :new_name => ["Nouveau nom", :String]
                        }
register_command :actors, "Command.set_actor_name"

link_method_documentation "Command.actor_nickname",
                        "renvoie le surnom du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }
register_command :actors, "Command.actor_nickname"

link_method_documentation "Command.set_actor_nickname",
                        "modifie le surnom du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                          :new_name => ["Nouveau surnom", :String]
                        }
register_command :actors, "Command.set_actor_nickname"

link_method_documentation "Command.actor_character_name",
                        "renvoie le nom du charset du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_character_name"

link_method_documentation "Command.actor_character_index",
                        "renvoie l'index du charset du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_character_index"

link_method_documentation "Command.actor_face_name",
                        "renvoie le nom du faceset du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_face_name"

link_method_documentation "Command.actor_face_index",
                        "renvoie l'index du faceset du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_face_index"

link_method_documentation "Command.actor_class",
                        "renvoie l'ID de la classe du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_class"

link_method_documentation "Command.actor_exp_for_next_level",
                        "renvoie le nombre de points d'expérience nécéssaires pour passer au niveau suivant pour le héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_exp_for_next_level"

link_method_documentation "Command.actor_change_equip",
                        "Change l'équipement du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                          :slot => ["Slot d'équipement (:Weapon, :Body, :Shield, : Head, :Accessory)", :Symbol],
                          :object_id => ["ID de l'Arme ou de l'Armure à mettre (La commande déduira s'il doit s'agir d'une arme ou d'une armure)", :Fixnum]
                        }
register_command :actors, "Command.actor_change_equip"

link_method_documentation "Command.actor_equip_weapon",
                        "Change l'arme du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                          :object_id => ["ID de l'Arme", :Fixnum]
                        }
register_command :actors, "Command.actor_equip_weapon"

link_method_documentation "Command.actor_equip_shield",
                        "Change le bouclier du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                          :object_id => ["ID de l'Armure", :Fixnum]
                        }
register_command :actors, "Command.actor_equip_shield"

link_method_documentation "Command.actor_equip_head",
                        "Change le casque du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                          :object_id => ["ID de l'Armure", :Fixnum]
                        }
register_command :actors, "Command.actor_equip_head"

link_method_documentation "Command.actor_equip_body",
                        "Change l'armure du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                          :object_id => ["ID de l'Armure", :Fixnum]
                        }
register_command :actors, "Command.actor_equip_body"

link_method_documentation "Command.actor_equip_accessory",
                        "Change l'accessoire du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                          :object_id => ["ID de l'Armure", :Fixnum]
                        }
register_command :actors, "Command.actor_equip_accessory"

link_method_documentation "Command.actor_optimize_equipement",
                        "Optimise l'équipement du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }
register_command :actors, "Command.actor_optimize_equipement"

link_method_documentation "Command.actor_level_up",
                        "fait gagner un niveau au héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }
register_command :actors, "Command.actor_level_up"

link_method_documentation "Command.actor_level_down",
                        "fait perdre un niveau au héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }
register_command :actors, "Command.actor_level_down"

link_method_documentation "Command.actor_give_exp",
                        "fait gagner de l'expérience au héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                          :exp => ["Expérience donnée", :Fixnum]
                        }
register_command :actors, "Command.actor_give_exp"

link_method_documentation "Command.actor_learn",
                        "Apprend la technique passée en argument au héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                          :skill_id => ["ID de le technique", :Fixnum],
                        }
register_command :actors, "Command.actor_learn"

link_method_documentation "Command.actor_forget",
                        "Oublie la technique passée en argument au héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                          :skill_id => ["ID de le technique", :Fixnum],
                        }
register_command :actors, "Command.actor_forget"

link_method_documentation "Command.actor_knowns?",
                        "Renvoie true si le héros référencé par son ID connait la technique référencée par son ID, false sinon",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                          :skill_id => ["ID de le technique", :Fixnum],
                        }
register_command :actors, "Command.actor_knowns?"

link_method_documentation "Command.actor_set_graphic",
                        "Change les graphismes du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum],
                          :character_name => ["Charset", :String],
                          :character_index => ["index du Charset", :Fixnum],
                          :face_name => ["Faceset", :String],
                          :face_index => ["Index du faceset", :Fixnum],
                        }
register_command :actors, "Command.actor_set_graphic"

link_method_documentation "Command.actor_weapons",
                        "renvoie le tableau des ID's des armes équipées du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_weapons"


link_method_documentation "Command.actor_armors",
                        "renvoie le tableau des ID's des armures équipées du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_armors"

link_method_documentation "Command.actor_skills",
                        "renvoie le tableau des ID's des techniques connues du héros référencé par son ID",
                        {
                          :id => ["ID de l'acteur", :Fixnum]
                        }, true
register_command :actors, "Command.actor_skills"

link_method_documentation "Command.skill_scope",
                        "Renvoie la portée (en Entier) d'une technique référencée par son ID",
                        {
                          :id => ["Id de la techinuqe", :Fixnum],
                        }, true
register_command :skills, "Command.skill_scope"

link_method_documentation "Command.skill_has_no_scope?",
                        "Renvoie true si la technique référencée par son ID ne cible personne, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_has_no_scope?"

link_method_documentation "Command.skill_for_one_enemy?",
                        "Renvoie true si la technique référencée par son ID cible un ennemi, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_one_enemy?"

link_method_documentation "Command.skill_for_all_enemies?",
                        "Renvoie true si la technique référencée par son ID cible tous les ennemis, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_all_enemies?"

link_method_documentation "Command.skill_for_one_random_enemy?",
                        "Renvoie true si la technique référencée par son ID cible un ennemi au hasard, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_one_random_enemy?"

link_method_documentation "Command.skill_for_two_random_enemies?",
                        "Renvoie true si la technique référencée par son ID cible deux ennemis au hasard, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_two_random_enemies?"

link_method_documentation "Command.skill_for_three_random_enemies?",
                        "Renvoie true si la technique référencée par son ID cible trois ennemis au hasard, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_three_random_enemies?"

link_method_documentation "Command.skill_for_four_random_enemies?",
                        "Renvoie true si la technique référencée par son ID cible quatre ennemis au hasard, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_four_random_enemies?"

link_method_documentation "Command.skill_for_one_ally?",
                        "Renvoie true si la technique référencée par son ID cible un allié, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_one_ally?"

link_method_documentation "Command.skill_for_all_allies?",
                        "Renvoie true si la technique référencée par son ID cible tous les alliés, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_all_allies?"

link_method_documentation "Command.skill_for_one_dead_ally?",
                        "Renvoie true si la technique référencée par son ID cible un allié mort, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_one_dead_ally?"

link_method_documentation "Command.skill_for_all_dead_allies?",
                        "Renvoie true si la technique référencée par son ID cible tous les alliés morts, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_all_dead_allies?"

link_method_documentation "Command.skill_for_caller?",
                        "Renvoie true si la technique référencée par son ID cible l'utilisateur, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_caller?"

link_method_documentation "Command.skill_occasion",
                        "Renvoie un entier correspondant au droit d'utilisation de la technique",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_occasion"

link_method_documentation "Command.skill_always_usable?",
                        "Renvoie true si la technique référencé par son ID est utilisable partout",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_always_usable?"

link_method_documentation "Command.skill_battle_usable?",
                        "Renvoie true si la technique référencé par son ID est utilisable en combat seulement",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_battle_usable?"

link_method_documentation "Command.skill_menu_usable?",
                        "Renvoie true si la technique référencé par son ID est utilisable dans le menu seulement",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_menu_usable?"

link_method_documentation "Command.skill_never_usable?",
                        "Renvoie true si la technique référencé par son ID n'est jamais utilisable",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_never_usable?"

link_method_documentation "Command.skill_for_opponent?",
                        "Renvoie true si une technique référencée par son ID cible les ennemis, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_opponent?"

link_method_documentation "Command.skill_for_friend?",
                        "Renvoie true si une technique référencée par son ID cible un (ou les) allié(s), false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_friend?"

link_method_documentation "Command.skill_for_dead_friend?",
                        "Renvoie true si une technique référencée par son ID cible un (ou les) allié(s) mort(s), false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_dead_friend?"

link_method_documentation "Command.skill_for_one?",
                        "Renvoie true si une technique référencée par son ID a une cible unique, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_one?"

link_method_documentation "Command.skill_for_random?",
                        "Renvoie true si une technique référencée par son ID cible aléatoirement, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_random?"

link_method_documentation "Command.skill_for_all?",
                        "Renvoie true si une technique référencée par son ID cible tout le groupe allié, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_for_all?"

link_method_documentation "Command.skill_need_selection?",
                        "Renvoie true si une technique référencée par son ID requiert la sélection de l'ennemi, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_need_selection?"


link_method_documentation "Command.skill_certain?",
                        "Renvoie true si une technique référencée par son ID a une garantie de réussite totale, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_certain?"

link_method_documentation "Command.skill_physical?",
                        "Renvoie true si une technique référencée par son ID endommage les PV, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_physical?"

link_method_documentation "Command.skill_magical?",
                        "Renvoie true si une technique référencée par son ID endommage les PM, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_magical?"

link_method_documentation "Command.skill_number_of_targets",
                        "Renvoie le nombre de cibles d'une technique référencée par son ID, false sinon",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_number_of_targets"

link_method_documentation "Command.skill_speed",
                        "Renvoie l'apport de vitesse de la technique référencée par son ID",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_speed"

link_method_documentation "Command.skill_nb_hits",
                        "Renvoie le nombre de coups portés par la technique référencée par son ID",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_nb_hits"

link_method_documentation "Command.skill_success_rate",
                        "Renvoie la probabilité de succès de la technique référencée par son ID",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_success_rate"

link_method_documentation "Command.skill_tp_gain",
                        "Renvoie le gain de TP que la technique référencée par son ID apporte une fois utilisée en combat",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_tp_gain"

link_method_documentation "Command.skill_name",
                        "Renvoie le nom de la technique référencée par son ID",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_name"

link_method_documentation "Command.skill_note",
                        "Renvoie le commentaire de la base de données de la technique référencée par son ID",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_note"

link_method_documentation "Command.skill_description",
                        "Renvoie la description la technique référencée par son ID",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_description"

link_method_documentation "Command.skill_icon",
                        "Renvoie l'index de l'icone de la technique référencée par son ID",
                        {
                          :id => ["Id de la technique", :Fixnum],
                        }, true
register_command :skills, "Command.skill_icon"

link_method_documentation "Command.pi",
                        "Renvoie une approximation de PI",
                        { }, true
register_command :math, "Command.pi"

link_method_documentation "Command.acos",
                        "Renvoie l'arc cosinus de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.acos"

# AUTOGenerated for mantissa
link_method_documentation 'Command.mantissa',
	'Renvoi la partie flottante d\'un nombre à virgule',
 	{
		:x => ["Nombre à virgule", :Float],

	}, true # Maybe changed
register_command :math, 'Command.mantissa'

link_method_documentation "Command.acosh",
                        "Renvoie l'inverse hyperbolique cosinus de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.acosh"


link_method_documentation "Command.asin",
                        "Renvoie l'arc sinus de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.asin"

link_method_documentation "Command.asinh",
                        "Renvoie l'inverse hyperbolique sinus de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.asinh"

link_method_documentation "Command.atan",
                        "Renvoie l'arc tangent de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.atan"

link_method_documentation "Command.atan2",
                        "Renvoie l'arc tangent pour x et y",
                        { :x => ["Valeur numérique", :Numeric],  :y => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.atan2"

link_method_documentation "Command.atanh",
                        "Renvoie l'inverse hyperbolique tangent de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.atanh"

link_method_documentation "Command.cos",
                        "Renvoie le cosinus de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.cos"

link_method_documentation "Command.cosh",
                        "Renvoie le cosinus hyperbolique de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.cosh"


link_method_documentation "Command.sin",
                        "Renvoie le sinus de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.sin"

link_method_documentation "Command.sinh",
                        "Renvoie le sinus hyperbolique de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.sinh"

link_method_documentation "Command.hypot",
                        "Renvoie l'hypothénuse de x et y",
                        { :x => ["Valeur numérique", :Numeric],  :y => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.hypot"

link_method_documentation "Command.sqrt",
                        "Renvoie la racine carrée de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.sqrt"

link_method_documentation "Command.tan",
                        "Renvoie la tangente de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.tan"

link_method_documentation "Command.tanh",
                        "Renvoie la tangente hyperbolique de x",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.tanh"

link_method_documentation "Command.to_deg",
                        "Renvoie x (supposé radian) converti en degrés",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.to_deg"

link_method_documentation "Command.to_rad",
                        "Renvoie x (supposé degré) converti en radians",
                        { :x => ["Valeur numérique", :Numeric] }, true
register_command :math, "Command.to_rad"

link_method_documentation "Command.troop_size",
                        "Renvoie la taille d'un groupe de monstres référencé par son ID.",
                        { :id => ["ID du groupe de monstre", :Fixnum] }, true
register_command :troop, "Command.troop_size"

link_method_documentation "Command.troop_name",
                        "Renvoie le nom d'un groupe de monstres référencé par son ID.",
                        { :id => ["ID du groupe de monstre", :Fixnum] }, true
register_command :troop, "Command.troop_name"

link_method_documentation "Command.troop_members",
                        "Renvoie un tableau des enemy_id d'un groupe de monstres référencé par son ID.",
                        { :id => ["ID du groupe de monstre", :Fixnum] }, true
register_command :troop, "Command.troop_members"

link_method_documentation "Command.troop_member",
                        "Renvoie l'id d'un monstre d'un groupe de monstres référencé par son ID et par sa position (0 = premier).",
                        { :id => ["ID du groupe de monstre", :Fixnum], :position => ["Position du monstre", :Fixnum]  }, true
register_command :troop, "Command.troop_member"

link_method_documentation "Command.troop_member_x",
                        "Renvoie la position X d'un monstre d'un groupe de monstres référencé par son ID et par sa position (0 = premier) tel que défini dans la base de données.",
                        { :id => ["ID du groupe de monstre", :Fixnum], :position => ["Position du monstre", :Fixnum]  }, true
register_command :troop, "Command.troop_member_x"

link_method_documentation "Command.troop_member_y",
                        "Renvoie la position Y d'un monstre d'un groupe de monstres référencé par son ID et par sa position (0 = premier) tel que défini dans la base de données.",
                        { :id => ["ID du groupe de monstre", :Fixnum], :position => ["Position du monstre", :Fixnum]  }, true
register_command :troop, "Command.troop_member_y"


link_method_documentation "Command.picture_show_enemy",
                        "Affiche un monstre d'un groupe à sa position définie dans la base de données",
                        {
                          :pic_id => ["ID de l'image dans laquelle afficher le monstre", :Fixnum],
                          :id => ["ID du groupe de monstre", :Fixnum],
                          :position => ["Position du monstre", :Fixnum]
                        }, false
register_command :picture, "Command.picture_show_enemy"

link_method_documentation "Command.monster_name",
                        "renvoie le nom d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_name"

link_method_documentation "Command.monster_icon",
                        "renvoie l'icone index d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_icon"

link_method_documentation "Command.monster_description",
                        "renvoie la description d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_description"

link_method_documentation "Command.monster_note",
                        "renvoie la note/commentaire d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_note"

link_method_documentation "Command.monster_battler_name",
                        "renvoie le nom du fichier battler d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_battler_name"

link_method_documentation "Command.monster_battler_hue",
                        "renvoie la teinte d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_battler_hue"

link_method_documentation "Command.monster_max_hp",
                        "renvoie le maximum de points de vie d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_max_hp"

link_method_documentation "Command.monster_max_mp",
                        "renvoie le maximum de points de magie d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_max_mp"

link_method_documentation "Command.monster_attack_power",
                        "renvoie les points d'attaque d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_attack_power"

link_method_documentation "Command.monster_defense_power",
                        "renvoie les points de défense d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_defense_power"

link_method_documentation "Command.monster_magic_attack_power",
                        "renvoie les points d'attaque magique d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_magic_attack_power"

link_method_documentation "Command.monster_magic_defense_power",
                        "renvoie les points de défense magique d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_magic_defense_power"

link_method_documentation "Command.monster_agility",
                        "renvoie l'agilité d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_agility"

link_method_documentation "Command.monster_luck",
                        "renvoie la chance d'un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_luck"

link_method_documentation "Command.monster_give_exp",
                        "renvoie l'experience donnée par un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_give_exp"

link_method_documentation "Command.monster_give_gold",
                        "renvoie l'or donné par un ennemi référencé par son ID",
                        { :id => ["ID de l'ennemi", :Fixnum]}, true
register_command :enemy, "Command.monster_give_gold"


link_method_documentation "Command.current_troop",
                        "Renvoie l'identifiant du groupe en cours de combat",
                        {}, true
register_command :in_battle, "Command.current_troop"

link_method_documentation "Command.current_enemies",
                        "Renvoie un tableau contenant les ID des ennemis en cours de combat",
                        {}, true
register_command :in_battle, "Command.current_enemies"

link_method_documentation "Command.total_enemies",
                        "Renvoie le nombre d'enemis en combat (mort ou vivant)",
                        {}, true
register_command :in_battle, "Command.total_enemies"


link_method_documentation "Command.enemy_hp",
                        "renvoie les points de vie de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum],
                        }, true
register_command :in_battle, "Command.enemy_hp"

link_method_documentation "Command.enemy_mp",
                        "renvoie les points de magie de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum],
                        }, true
register_command :in_battle, "Command.enemy_mp"

link_method_documentation "Command.enemy_tp",
                        "renvoie les points de temps de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum],
                        }, true
register_command :in_battle, "Command.enemy_tp"

link_method_documentation "Command.enemy_max_hp",
                        "renvoie le nombre de points de vie maximum de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_max_hp"

link_method_documentation "Command.enemy_max_mp",
                        "renvoie le nombre de points de magie de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_max_mp"

link_method_documentation "Command.enemy_attack",
                        "renvoie les points d'attaque de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_attack"

link_method_documentation "Command.enemy_defense",
                        "renvoie les points de défense de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_defense"

link_method_documentation "Command.enemy_magic_attack",
                        "renvoie les points d'attaque magique de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_magic_attack"

link_method_documentation "Command.enemy_magic_defense",
                        "renvoie les points de défense magique de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_magic_defense"

link_method_documentation "Command.enemy_agility",
                        "renvoie les points d'agilité de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_agility"

link_method_documentation "Command.enemy_luck",
                        "renvoie les points de chance de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_luck"

link_method_documentation "Command.enemy_hit_rate",
                        "renvoie la probabilité de toucher de l'ennemi en combat référencé par sa position en combat sur un ennemi",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_hit_rate"

link_method_documentation "Command.enemy_evasion_rate",
                        "renvoie la probabilité d'esquiver une attaque physique de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_evasion_rate"

link_method_documentation "Command.enemy_critical_rate",
                        "renvoie la probabilité de coup critique de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_critical_rate"

link_method_documentation "Command.enemy_critical_evasion_rate",
                        "renvoie la probabilité de faire un coup critique en préemptif de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_critical_evasion_rate"

link_method_documentation "Command.enemy_magical_evasion_rate",
                        "renvoie la probabilité d'une esquiver une attaque magique de l'ennemi en combat référencé par sa position en combat par un ennemi",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_magical_evasion_rate"

link_method_documentation "Command.enemy_magical_reflection_rate",
                        "renvoie la probabilité d'une réflexion magique de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_magical_reflection_rate"

link_method_documentation "Command.enemy_counter_attack_rate",
                        "renvoie la probabilité d'un contre (sur une attaque physique) de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_counter_attack_rate"

link_method_documentation "Command.enemy_hp_regeneration_rate",
                        "renvoie le pourcentage de régénération de PV à chaque tour de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_hp_regeneration_rate"

link_method_documentation "Command.enemy_mp_regeneration_rate",
                        "renvoie le pourcentage de régénération PM à chaque tour de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_mp_regeneration_rate"

link_method_documentation "Command.enemy_tp_regeneration_rate",
                        "renvoie le pourcentage de régénération de TP par tour de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_tp_regeneration_rate"

link_method_documentation "Command.enemy_target_rate",
                        "renvoie la probabilité d'être ciblé par un ennemi, de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_target_rate"


link_method_documentation "Command.monster_battler_width",
                        "renvoie la largeur du battler de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.monster_battler_width"

link_method_documentation "Command.monster_battler_height",
                        "renvoie la largeur du battler de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.monster_battler_height"


link_method_documentation "Command.enemy_guard_effect_rate",
                        "renvoie la force de défense (diminution de l'attaque subie) de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_guard_effect_rate"

link_method_documentation "Command.enemy_recovery_effect_rate",
                        "renvoie le pourcentage de PV/PM reçus, de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_recovery_effect_rate"

link_method_documentation "Command.enemy_pharmacology",
                        "renvoie le pourcentage de PV/PM récupéré via un objet de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_pharmacology"

link_method_documentation "Command.enemy_mp_cost_rate",
                        "renvoie le facteur d'un coût de MP (pour une attaque faisant varier la consommation de MP) de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_mp_cost_rate"

link_method_documentation "Command.enemy_tp_charge_rate",
                        "renvoie le facteur de coût de TP (pour une attaque faisant varier la consommation de TP) de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_tp_charge_rate"

link_method_documentation "Command.enemy_physical_damage_rate",
                        "renvoie le pourcentage de dommage physique reçu par l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_physical_damage_rate"

link_method_documentation "Command.enemy_magical_damage_rate",
                        "renvoie le pourcentage de dommage magique reçu par l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_magical_damage_rate"

link_method_documentation "Command.enemy_hidden?",
                        "renvoie true si l'ennemi en combat référencé par sa position en combat est invisble, false sinon",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_hidden?"

link_method_documentation "Command.enemy_floor_damage_rate",
                        "renvoie le pourcentage de dommage des terrains reçu par l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_floor_damage_rate"

link_method_documentation "Command.enemy_experience_rate",
                        "renvoie le pourcentage de la variation d'acquisition d'expérience de l'ennemi en combat référencé par sa position en combat",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_experience_rate"

link_method_documentation "Command.enemy_die?",
                        "renvoie true si l'ennemi en combat référencé par sa position en combat est mort, false sinon",
                        {
                          :position => ["Position du monstre en combat (0 = premier) (attention ce n'est pas l'ID du monstre dans la base de données!!!)", :Fixnum]
                        }, true
register_command :in_battle, "Command.enemy_die?"

link_method_documentation "Command.active_actor?",
                        "renvoie true si un acteur est en train de choisir une action, false sinon",
                        {

                        }, true
register_command :in_battle, "Command.active_actor?"

link_method_documentation "Command.active_actor",
                        "renvoie l'identifiant d'un acteur si il est en train de sélectionner une action, nil sinon",
                        {

                        }, true
register_command :in_battle, "Command.active_actor"


link_method_documentation "Command.text_show",
                          "Affiche un texte à l'écran",
                          {
                            :id => ["Identifiant du texte",:Fixnum],
                            :text => ["Texte a afficher",:String],
                            :profile => ["Profil du texte (voir Base de données)",:String],
                            :x => ["Position X",:Fixnum],
                            :y => ["Position Y",:Fixnum],
                            :"*zoom_x" => ["Zoom sur la largeur du texte par défaut 100 (pour 100%)", :Fixnum],
                            :"*zoom_y" => ["Zoom sur la hauteur du text par défaut 100 (pour 100%)", :Fixnum],
                            :"*opacity" => ["Opacité de l'image, par défaut 255 (de 0 à 255)", :Fixnum],
                            :"*blend_type" => ["Mode de fusion, par défaut 0, 0=Normal, 1=Addition, 2=Soustraction", :Fixnum],
                            :"*origin" => ["Origine du texte, 0 = Haut gauche, 1 = centré, par défaut, zéro", :Fixnum],
                          }
register_command :text, "Command.text_show"

# AUTOGenerated for text_move?
link_method_documentation 'Command.text_move?',
	'Retourne true sur le texte référencé par son ID est en mouvement, false sinon',
 	{
		:id => ["ID du texte", :Fixnum],

	}, true # Maybe changed
register_command :text, 'Command.text_move?'

# AUTOGenerated for text_angle
link_method_documentation 'Command.text_angle',
	'Change l\'angle d\'un texte, si aucun angle n\'est donné, la commande renverra la valeur de l\'angle du texte',
 	{
		:id => ["Id du texte", :Fixnum],
		:"*value" => ["Nouvel angle (peut être vide)", :Fixnum],

	}, true # Maybe changed
register_command :standard, 'Command.text_angle'

# AUTOGenerated for text_value
link_method_documentation 'Command.text_value',
	'Renvoie la valeur d\'un texte',
 	{
		:id => ["ID du texte", :Fixnum],

	}, true # Maybe changed
register_command :text, 'Command.text_value'

link_method_documentation "Command.text_move",
                          "Déplace un texte affiché à l'écran",
                          {
                            :id => ["Identifiant du texte", :Fixnum],
                            :duration => ["Durée du déplacement en frames", :Fixnum],
                            :"wait_flag" => ["Attendre la fin du déplacement, par défaut, true", :Boolean],
                            :x => ["Position en x où le texte doit se rendre", :Fixnum],
                            :y => ["Position en y ou le texte doit se rendre", :Fixnum],
                            :zoom_x => ["Zoom de la largeur (en %)", :Fixnum],
                            :zoom_y => ["Zoom de la hauteur (en %)", :Fixnum],
                            :"opacity" => ["Opacité (de 0 à 255)", :Fixnum],
                            :"blend_type" => ["Mode de fusion (0, 1, 2) ", :Fixnum],
                            :"origin" => ["Origine", :Fixnum],

                          }
register_command :text, "Command.text_move"

link_method_documentation "Command.text_erase",
                          "Supprime le texte affiché à l'écran",
                          {
                            :id => ["Identifiant du texte", :Fixnum],
                          }
register_command :text, "Command.text_erase"

link_method_documentation "Command.text_change",
                          "Change le texte affiché à l'écran",
                          {
                            :id => ["Identifiant du texte", :Fixnum],
                            :text => ["Nouveau texte", :String]
                          }
register_command :text, "Command.text_change"

link_method_documentation "Command.text_profile",
                          "Change le profil du texte, si aucun profile n'est donné, la commande renverra le profil du texte",
                          {
                            :id => ["Identifiant du texte", :Fixnum],
                            :"*profile" => ["Nouveau profil", :String]
                          }
register_command :text, "Command.text_profile"

link_method_documentation "Command.text_rotate",
                          "Fait tourner le texte (mettez une vitesse négative pour changer le sens de rotation)",
                          {
                            :id => ["Identifiant du texte", :Fixnum],
                            :speed => ["Vitesse de rotation", :Fixnum],
                          }
register_command :text, "Command.text_rotate"

link_method_documentation "Command.text_opacity",
                          "Change l'opacité du texte, si aucune opacité n'est donnée, la commande renverra l'opacité du texte",
                          {
                            :id => ["Identifiant du texte", :Fixnum],
                            :"*opacity" => ["valeur de l'opacité, entre 0 et 255.", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }
register_command :text, "Command.text_opacity"

link_method_documentation "Command.text_x",
                          "Change l'axe X d'un texte",
                          {
                            :id => ["ID du texte", :Fixnum],
                            :x => ["Position en x du texte, si aucun argument n'est passé, la commande renverra la position X du texte", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }, true
register_command :text, "Command.text_x"

link_method_documentation "Command.text_y",
                          "Change l'axe Y d'un texte",
                          {
                            :id => ["ID du texte", :Fixnum],
                            :y => ["Position en y du texte, si aucun argument n'est passé, la commande renverra la position X du texte", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }, true
register_command :text, "Command.text_y"

link_method_documentation "Command.text_position",
                          "Change la position d'un texte",
                          {
                            :id => ["ID du texte", :Fixnum],
                            :x => ["Position en x du texte", :Fixnum],
                            :y => ["Position en y du texte", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }, true
register_command :text, "Command.text_position"

link_method_documentation "Command.text_zoom_x",
                          "Change le zoom X d'un texte",
                          {
                            :id => ["ID du texte", :Fixnum],
                            :zoom_x => ["zoom x du texte, si aucun argument n'est passé, la commande renverra le zoom X du texte", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }, true
register_command :text, "Command.text_zoom_x"

link_method_documentation "Command.text_zoom_y",
                          "Change le zoom y d'un texte",
                          {
                            :id => ["ID du texte", :Fixnum],
                            :zoom_y => ["zoom y du texte, si aucun argument n'est passé, la commande renverra le zoom X du texte", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }, true
register_command :text, "Command.text_zoom_y"

link_method_documentation "Command.text_zoom",
                          "Change le zoom d'un texte",
                          {
                            :id => ["ID du texte", :Fixnum],
                            :zoom_x => ["zoom x du texte", :Fixnum],
                            :zoom_y => ["zoom y du texte", :Fixnum],
                            :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
                            :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
                          }, true
register_command :text, "Command.text_zoom"

link_method_documentation 'Command.pictures_perfect_collide?',
  'Vérifie la collision entre deux images au pixel près. ATTENTION, CETTE COMMANDE LAG ENORMEMENT !IL EST DECONSEILLE DE L\'UTILISER !',
  {
    :idA => ["ID de la première image", :Fixnum],
    :idB => ["ID de la seconde image", :Fixnum],

  }
register_command :picture, 'Command.pictures_perfect_collide?'

# AUTOGenerated for time_year
link_method_documentation 'Command.time_year',
  'Renvoie l\'année actuelle',
  {}, true # Maybe changed
register_command :date, 'Command.time_year'

# AUTOGenerated for time_month
link_method_documentation 'Command.time_month',
  'Renvoie le mois actuel',
  {}, true # Maybe changed
register_command :date, 'Command.time_month'

# AUTOGenerated for time_day
link_method_documentation 'Command.time_day',
  'Renvoie le jour actuel',
  {}, true # Maybe changed
register_command :date, 'Command.time_day'

# AUTOGenerated for time_hour
link_method_documentation 'Command.time_hour',
  'Renvoie l\' heure actuelle',
  {}, true # Maybe changed
register_command :date, 'Command.time_hour'

# AUTOGenerated for time_min
link_method_documentation 'Command.time_min',
  'Renvoie la minute actuelle',
  {}, true # Maybe changed
register_command :date, 'Command.time_min'

# AUTOGenerated for time_sec
link_method_documentation 'Command.time_sec',
  'Renvoie la seconde actuelle',
  {}, true # Maybe changed
register_command :date, 'Command.time_sec'

# AUTOGenerated for socket_connected?
link_method_documentation 'Command.socket_connected?',
  'Renvoie true si la connexion est en cours, false, sinon',
  {}, true # Maybe changed
register_command :socket, 'Command.socket_connected?'

# AUTOGenerated for socket_connect
link_method_documentation 'Command.socket_connect',
  'Se connecte à un serveur, renvoie true si la connexion a réussi, false sinon.',
  {
    :address => ["Adresse du serveur", :String],
    :port => ["Port d'écoute", :Fixnum],

  }, true # Maybe changed
register_command :socket, 'Command.socket_connect'

# AUTOGenerated for socket_disconnect
link_method_documentation 'Command.socket_disconnect',
  'Déconnecte la connexion courante',
  {}
register_command :socket, 'Command.socket_disconnect'

# AUTOGenerated for socket_send
link_method_documentation 'Command.socket_send',
  'Envoie un message au serveur connecté, renvoie true en cas de réussite, false en cas d\'échec',
  {
    :data => ["Message à envoyer", :String],

  }, true # Maybe changed
register_command :socket, 'Command.socket_send'

# AUTOGenerated for socket_recv
link_method_documentation 'Command.socket_recv',
  'Renvoie le message envoyé par le serveur au client, false si aucun message n\' est reçu',
  {
    :"*len" => ["Taille maximale du message à recevoir, par défaut 1024", :Fixnum],

  }, true # Maybe changed
register_command :socket, 'Command.socket_recv'

# AUTOGenerated for socket_wait_recv
link_method_documentation 'Command.socket_wait_recv',
  'Attend une réponse du serveur, se termine quand une réponse a été reçue (et la renvoie)',
  {
    :"*len" => ["Taille maximale du message à recevoir, par défaut 1024", :Fixnum],

  }, true # Maybe changed
register_command :socket, 'Command.socket_wait_recv'

# AUTOGenerated for angle_xy
link_method_documentation 'Command.angle_xy',
  'Renvoie l\' angle entre deux points, dans le sens anti-horaire, défini entre 0 et 360 degrés',
  {
    :xa => ["Coordonnée X du point A", :Fixnum],
    :ya => ["Coordonnée Y du point A", :Fixnum],
    :xb => ["Coordonnée X du point B", :Fixnum],
    :yb => ["Coordonnée Y du point B", :Fixnum],
  }, true
register_command :math, 'Command.angle_xy'

# AUTOGenerated for wait_with
link_method_documentation 'Command.wait_with',
  'Attend en exécutant une action',
  {
    :time => ["Temps d'attente", :Fixnum],
    :"&block" => ["Action à exécuter ({action})", :Block],

  }
register_command :standard, 'Command.wait_with'

# AUTOGenerated for split_each_char
link_method_documentation 'Command.split_each_char',
	'Transforme une chaîne de caractères en un tableau de caractères',
 	{
		:str => ["Chaine a transformer", :String],

	}, true # Maybe changed
register_command :standard, 'Command.split_each_char'

# AUTOGenerated for qte
link_method_documentation 'Command.qte',
  'Attend la saisie d\'une touche pendant une durée donnée. La commande renvoie true si la touche a été saisie, false sinon.',
  {
    :key => ["Touche qu'il faut presser avant la fin", :Symbol],
    :time => ["Durée", :Fixnum],
    :"*strict" => ["Difficulté, si elle vaut true, aucune erreur admise, sinon erreurs admises. Par défaut vaut true", :Boolean]

  }, true # Maybe changed
register_command :standard, 'Command.qte'

# AUTOGenerated for wait_trigger
link_method_documentation 'Command.wait_trigger',
  'Attend l\'appui d\'une touche',
  {
    :key => ["Touche à attendre", :Symbol],

  }
register_command :standard, 'Command.wait_trigger'

# AUTOGenerated for wait_release
link_method_documentation 'Command.wait_release',
  'Attend le relâchement d\'une touche',
  {
    :key => ["Touche à attendre", :Symbol],

  }, true # Maybe changed
register_command :standard, 'Command.wait_release'


# AUTOGenerated for call_title_screen
link_method_documentation 'Command.call_title_screen',
  'Renvoie à l\'écran titre',
  {}
register_command :scene, 'Command.call_title_screen'

# AUTOGenerated for call_load_screen
link_method_documentation 'Command.call_load_screen',
  'Renvoie à la scene de chargement de partie',
  {}
register_command :scene, 'Command.call_load_screen'

# AUTOGenerated for scene_call
link_method_documentation 'Command.scene_call',
  'Appelle une scene (et la place dans la pile de scene)',
  {
    :scene => ["Scene à appeler", :Scene],

  }, true # Maybe changed
register_command :scene, 'Command.scene_call'

# AUTOGenerated for scene_goto
link_method_documentation 'Command.scene_goto',
  'Appelle une scene (sans la placer dans la pile de scene)',
  {
    :scene => ["Scene à appeler", :Scene],

  }
register_command :scene, 'Command.scene_goto'

# AUTOGenerated for scene_return
link_method_documentation 'Command.scene_return',
  'Renvoie à la dernière scene dans la pile d\'appel',
  {}
register_command :scene, 'Command.scene_return'

# AUTOGenerated for scene_clear_history
link_method_documentation 'Command.scene_clear_history',
  'Vide la pile d\'appel des scenes',
  {}
register_command :scene, 'Command.scene_clear_history'

# AUTOGenerated for fadeout
link_method_documentation 'Command.fadeout',
  'Fondu noir (et sonore) du jeu pendant la durée passée en argument',
  {
    :"*time" => ["Durée de fondu", :Fixnum],

  }
register_command :standard, 'Command.fadeout'

# AUTOGenerated for rm_kill
link_method_documentation 'Command.rm_kill',
  'Quitte le jeu... d\'un coup sec... TCHAK',
  {}
register_command :standard, 'Command.rm_kill'

# AUTOGenerated for start_new_game
link_method_documentation 'Command.start_new_game',
  'Démarre une nouvelle partie',
  {}
register_command :save, 'Command.start_new_game'

# AUTOGenerated for save_game
link_method_documentation 'Command.save_game',
  'Sauvegarde la partie sur la sauvegardé référencée par l\'ID donné',
  {
    :index => ["Numéro de la sauvegarde", :Fixnum],

  }
register_command :save, 'Command.save_game'

# AUTOGenerated for load_game
link_method_documentation 'Command.load_game',
  'Charge la partie référencée par l\'ID de sauvegarde donné',
  {
    :index => ["Numéro de la sauvegarde", :Fixnum],
    :"*time" => ["Durée du fadeout", :Fixnum],

  }
register_command :save, 'Command.load_game'

# AUTOGenerated for a_save_exists?
link_method_documentation 'Command.a_save_exists?',
  'Renvoie true si au moins une sauvegade a été faite, false sinon',
  {}, true
register_command :save, 'Command.a_save_exists?'

# AUTOGenerated for save_exists?
link_method_documentation 'Command.save_exists?',
  'Renvoie true si la sauvegarde référencée par son numéro existe',
  {
    :index => ["Numéro de la sauvegarde", :Fixnum],

  }, true # Maybe changed
register_command :save, 'Command.save_exists?'

# AUTOGenerated for save_delete
link_method_documentation 'Command.save_delete',
  'Supprime la sauvegarde référencée par son numéro',
  {
    :index => ["Numéro de la sauvegarde", :Fixnum],

  }, true # Maybe changed
register_command :save, 'Command.save_delete'

# AUTOGenerated for import_variable
link_method_documentation 'Command.import_variable',
  'Renvoie la valeur d\'une variable issue d\'une autre sauvegarde',
  {
    :index => ["Numéro de la sauvegarde", :Fixnum],
    :idvar => ["Numéro de la variable", :Fixnum],

  }, true # Maybe changed
register_command :save, 'Command.import_variable'

# AUTOGenerated for import_switch
link_method_documentation 'Command.import_switch',
  'Renvoie la valeur d\'un interrupteur issu d\'une autre sauvegarde',
  {
    :index => ["Numéro de la sauvegarde", :Fixnum],
    :idswitch => ["Numéro de l'interrupteur", :Fixnum],

  }, true # Maybe changed
register_command :save, 'Command.import_switch'

# AUTOGenerated for import_label
link_method_documentation 'Command.import_label',
  'Renvoie la valeur d\'un label issu d\'une autre sauvegarde',
  {
    :index => ["Numéro de la sauvegarde", :Fixnum],
    :idlabel => ["Identifiant du label", :Fixnum],

  }, true # Maybe changed
register_command :save, 'Command.import_label'

# AUTOGenerated for random_combination
link_method_documentation 'Command.random_combination',
  'Renvoie une combinaison (tableau itérable) aléatoire de la taille spécifiée en argument, composée des paramètres des touches passées en arguments. (par exemple : random_combination(5, :UP, :DOWN, :LEFT, :RIGHT) )',
  {
    :len => ["Args description", :Fixnum],
    :"*keys" => ["Liste des touches pouvant constituer la combinaison", :Argslist],

  }, true # Maybe changed
register_command :standard, 'Command.random_combination'

# AUTOGenerated for pick_random
link_method_documentation 'Command.pick_random',
  'Renvoie un élément au hasard du tableau (ou de la liste d\'arguments)',
  {
    :"*elts" => ["éléments dans lesquels piocher un élément aléatoire. Soit pick_random(a, b, c, d...etc.) soit pick_random([a,b,c,d...etc])", :ArgsList],
  }, true # Maybe changed
register_command :standard, 'Command.pick_random'

# AUTOGenerated for event_name
link_method_documentation 'Command.event_name',
  'Renvoie le nom d\'un évènement, renvoie nil s\' il s\'agit du héros',
  {
    :id => ["ID de l'évènement (0 pour le héros)", :Fixnum],

  }, true # Maybe changed
register_command :event, 'Command.event_name'

# AUTOGenerated for event_through?
link_method_documentation 'Command.event_through?',
	"Renvoie true si l'évènement est en mode 'traverse tout', false sinon",
 	{
		:id => ["ID de l'évènement", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_through?'

# AUTOGenerated for player_through?
link_method_documentation 'Command.player_through?',
	"Renvoie true si le joueur est en mode 'traverse tout', false sinon",
 	{}, true # Maybe changed
register_command :event, 'Command.player_through?'

# AUTOGenerated for event_through
link_method_documentation 'Command.event_through',
	'Change le mode de traversée de l\'évènement',
 	{
		:id => ["ID de l'évènement", :Fixnum],
		:"*flag" => ["true pour 'traverse tout', false pour 'ne traverse pas tout', par défaut vaut true ", :Boolean],

	}
register_command :event, 'Command.event_through'

# AUTOGenerated for player_through
link_method_documentation 'Command.player_through',
	'Change le mode de traversée du joueur',
 	{
		:"*flag" => ["true pour 'traverse tout', false pour 'ne traverse pas tout', par défaut vaut true ", :Boolean],

	}
register_command :event, 'Command.player_through'

link_method_documentation 'Command.event_erased?',
  "Renvoie true si l'évènement référencé par son ID à été supprimé, false sinon",
  {
    :id => ["ID de l'évènement (0 pour le héro)", :Fixnum],

  }, true # Maybe changed
register_command :event, 'Command.event_erased?'

# AUTOGenerated for cursor_system
link_method_documentation 'Command.cursor_system',
  'Affiche ou masque le curseur Windows sur la fenêtre de jeu',
  {
    :flag => ["true pour visible, false pour invisible", :Boolean],

  }
register_command :mouse, 'Command.cursor_system'

# AUTOGenerated for parallax_autoscroll
link_method_documentation 'Command.parallax_autoscroll',
  "Défilement horizontal et vertical automatique d'un panorama",
    {
      :id => ["ID du panorama", :Fixnum],
      :speed_x => ["Vitesse de défilement horizontal", :Fixnum],
      :speed_x => ["Vitesse de défilement vertical", :Fixnum],
      :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
      :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
    }
register_command :parallax, 'Command.parallax_autoscroll'

# AUTOGenerated for parallax_z
link_method_documentation 'Command.parallax_z',
  'Change l\'axe Z du panorama',
  {
    :id => ["Identifiant du panorama", :Fixnum],
    :z => ["Axe Z", :Fixnum],

  }
register_command :parallax, 'Command.parallax_z'

# AUTOGenerated for parallax_scroll
link_method_documentation 'Command.parallax_scroll',
  'Change la vitesse de défilement d\' un panorama référencé par son ID',
  {
    :id => ["Identifiant du panorama", :Fixnum],
    :x => ["vitesse horizontale", :Fixnum],
    :y => ["vitesse verticale", :Fixnum],

  }
register_command :parallax, 'Command.parallax_scroll'

# AUTOGenerated for mouse_hover_player?
link_method_documentation 'Command.mouse_hover_player?',
  'Renvoie true si la souris survole l\'image du joueur',
  {}, true # Maybe changed
register_command :event, 'Command.mouse_hover_player?'

# AUTOGenerated for mouse_click_player?
link_method_documentation 'Command.mouse_click_player?',
  'Renvoie true si la souris clique sur l\'image du joueur',
  {}, true # Maybe changed
register_command :event, 'Command.mouse_click_player?'

# AUTOGenerated for mouse_press_player?
link_method_documentation 'Command.mouse_press_player?',
  'Renvoie true si la souris presse en continu la touche passée en argument sur le joueur',
  {
    :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left)", :ArgType],

  }, true # Maybe changed
register_command :event, 'Command.mouse_press_player?'

# AUTOGenerated for mouse_trigger_player?
link_method_documentation 'Command.mouse_trigger_player?',
  'Renvoie true si la souris appuie une fois la touche passée en argument sur le joueur',
  {
    :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left)", :ArgType],

  }, true # Maybe changed
register_command :event, 'Command.mouse_trigger_player?'

# AUTOGenerated for mouse_repeat_player?
link_method_documentation 'Command.mouse_repeat_player?',
  'Renvoie true si la souris appuie de manière répétée sur la touche passée en argument sur l\'image du joueur',
  {
    :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left)", :ArgType],

  }, true # Maybe changed
register_command :event, 'Command.mouse_repeat_player?'

# AUTOGenerated for mouse_release_player?
link_method_documentation 'Command.mouse_release_player?',
  'Renvoie true si la souris relâche la touche passée en argument sur le joueur',
  {
    :"*key" => ["Touche à presser (par défaut, la touche est :mouse_left)", :ArgType],

  }, true # Maybe changed
register_command :event, 'Command.mouse_release_player?'

# AUTOGenerated for last_clicked_event
link_method_documentation 'Command.last_clicked_event',
  "Renvoie le dernier event cliqué par la souris, nil si aucun évènement n'a été cliqué",
  {}, true # Maybe changed
register_command :event, 'Command.last_clicked_event'

# AUTOGenerated for last_pressed_event
link_method_documentation 'Command.last_pressed_event',
  "Renvoie le dernier event pressé (avec :mouse_left) par la souris, nil si aucun évènement n'a été pressé",
  {}, true # Maybe changed
register_command :event, 'Command.last_pressed_event'

# AUTOGenerated for last_triggered_event
link_method_documentation 'Command.last_triggered_event',
  "Renvoie le dernier event appuyé une fois (avec :mouse_left) par la souris, nil si aucun évènement n'a été triggeré",
  {}, true # Maybe changed
register_command :event, 'Command.last_triggered_event'

# AUTOGenerated for last_released_event
link_method_documentation 'Command.last_released_event',
  "Renvoie le dernier event relâché (avec mouse_left) par la souris, nil si aucun évènement n'a été relâché",
  {}, true # Maybe changed
register_command :event, 'Command.last_released_event'

# AUTOGenerated for last_repeated_event
link_method_documentation 'Command.last_repeated_event',
  "Renvoie le dernier event cliqué en continu (avec :mouse_left) par la souris, nil si aucun évènement n'a été cliqué en continu",
  {}, true # Maybe changed
register_command :event, 'Command.last_repeated_event'

# AUTOGenerated for last_hovered_event
link_method_documentation 'Command.last_hovered_event',
  "Renvoie le dernier event survolé par la souris, nil si aucun évènement n'a été survolé",
  {}, true # Maybe changed
register_command :event, 'Command.last_hovered_event'

# AUTOGenerated for events_buzzer_properties
link_method_documentation 'Command.events_buzzer_properties',
  "Change les propriétés de tressaillement d'évènements",
  {
    :e => ["Selecteurs d'évènements", :Selector],
    :amplitude => ["Amplitude du tressaillement", :ArgType],
    :length => ["Taille du tressaillement", :Fixnum],

  }
register_command :event, 'Command.events_buzzer_properties'

# AUTOGenerated for followers_buzzer_properties
link_method_documentation 'Command.followers_buzzer_properties',
  "Change les propriétés de tressaillement des membres de la chenille (followers_buzzer_properties(0,1,2,3, amplitude, length))",
  {
    :"*ids" => ["Liste des positions des suiveurs. Si cet argument est occulté, ces paramètres s'appliquent à tous les suiveurs.", :ArgsList],
    :amplitude => ["Amplitude du tressaillement", :ArgType],
    :length => ["Taille du tressaillement", :Fixnum],

  }
register_command :event, 'Command.followers_buzzer_properties'

# AUTOGenerated for events_buzz
link_method_documentation 'Command.events_buzz',
  'Fait tressaillir les évènements',
  {
    :e => ["Selecteur d'évènements", :Selector],
    :"*duration" => ["Durée du dressaillement (en frames), par défaut, 16", :Fixnum],

  }
register_command :event, 'Command.events_buzz'

# AUTOGenerated for followers_buzz
link_method_documentation 'Command.followers_buzz',
  'Fait tressaillir les suiveurs (followers_buzz([1,2,3], *duration), par exemple, si la liste des suiveurs n\'est pas renseignée, ça s\'applique à tous les followers)',
  {
    :ids => ["Tableau des identifiants des suiveurs à faire tressaillir, utiliser [] pour appliquer à tous les suiveurs", :Selector],
    :"*duration" => ["Durée du dressaillement (en frame), par défaut, 16", :Fixnum]

  }
register_command :event, 'Command.followers_buzz'

# AUTOGenerated for create_rect_area
link_method_documentation 'Command.create_rect_area',
  "Crée et renvoie une zone rectangulaire",
  {
    :x => ["Coordonnées X de la zone", :Fixnum],
    :y => ["Coordonnées Y de la zone", :Fixnum],
    :width => ["Largeur de la zone", :Fixnum],
    :height => ["Hauteur de la zone", :Fixnum],

  }, true # Maybe changed
register_command :area, 'Command.create_rect_area'

# AUTOGenerated for create_circle_area
link_method_documentation 'Command.create_circle_area',
  'Crée et renvoie une zone circulaire',
  {
    :x => ["Coordonnées X de la zone", :Fixnum],
    :y => ["Coordonnées Y de la zone", :Fixnum],
    :rayon => ["Rayon de la zone", :Fixnum],

  }, true # Maybe changed
register_command :area, 'Command.create_circle_area'

# AUTOGenerated for create_ellipse_area
link_method_documentation 'Command.create_ellipse_area',
  'Crée et renvoie une zone elliptique',
  {
    :x => ["Coordonnées X de la zone", :Fixnum],
    :y => ["Coordonnées Y de la zone", :Fixnum],
    :width => ["Largeur de la zone", :Fixnum],
    :height => ["Hauteur de la zone", :Fixnum],

  }, true # Maybe changed
register_command :area, 'Command.create_ellipse_area'

# AUTOGenerated for create_polygon_area
link_method_documentation 'Command.create_polygon_area',
  'Crée et renvoie une zone polygonale (le dernier point est relié avec le premier)',
  {
    :"points" => ["Liste de points. Exemple : create_polygon_area([[ax, ay], [bx, by], [cx, cy]])", :ArgType],

  }, true # Maybe changed
register_command :area, 'Command.create_polygon_area'

# AUTOGenerated for in_area?
link_method_documentation 'Command.in_area?',
  'Vérifie si le point référencé par X, Y est inscrit dans la zone passée en argument',
  {
    :area => ["Zone à vérifier", :Area],
    :x => ["Coordonnée X du point", :Fixnum],
    :y => ["Coordonnée Y du point", :ArgType],

  }, true # Maybe changed
register_command :area, 'Command.in_area?'

# AUTOGenerated for mouse_hover_area?
link_method_documentation 'Command.mouse_hover_area?',
  "Renvoie true si la souris survole la zone passée en argument au moment de l'appel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],

  }, true # Maybe changed
register_command :area, 'Command.mouse_hover_area?'

# AUTOGenerated for mouse_hover_square_area?
link_method_documentation 'Command.mouse_hover_square_area?',
  "Renvoie true si la souris survole la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en cases et non en pixels, false sinon",
  {
    :area => ["Zone à vérifier", :Area],

  }, true # Maybe changed
register_command :area, 'Command.mouse_hover_square_area?'

# AUTOGenerated for mouse_click_area?
link_method_documentation 'Command.mouse_click_area?',
  "Renvoie true si la souris survole et clique sur la zone passée en argument au moment de l'appel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],

  }, true # Maybe changed
register_command :area, 'Command.mouse_click_area?'

# AUTOGenerated for mouse_click_square_area?
link_method_documentation 'Command.mouse_click_square_area?',
  "Renvoie true si la souris survole et clique sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en cases et non en pixels, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_click_square_area?'

# AUTOGenerated for mouse_trigger_area?
link_method_documentation 'Command.mouse_trigger_area?',
  "Renvoie true si la souris survole et clique une fois sur la zone passée en argument au moment de l'appel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_trigger_area?'

# AUTOGenerated for mouse_trigger_square_area?
link_method_documentation 'Command.mouse_trigger_square_area?',
  "Renvoie true si la souris survole et clique une fois sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en cases et non en pixels, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_trigger_square_area?'

# AUTOGenerated for mouse_press_area?
link_method_documentation 'Command.mouse_press_area?',
  "Renvoie true si la souris survole et clique en continu sur la zone passée en argument au moment de l'appel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_press_area?'

# AUTOGenerated for mouse_press_square_area?
link_method_documentation 'Command.mouse_press_square_area?',
  "Renvoie true si la souris survole et clique en continu sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en cases et non en pixels, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_press_square_area?'

# AUTOGenerated for mouse_release_area?
link_method_documentation 'Command.mouse_release_area?',
  "Renvoie true si la souris survole et est relâchée sur la zone passée en argument au moment de l'appel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_release_area?'

# AUTOGenerated for mouse_release_square_area?
link_method_documentation 'Command.mouse_release_square_area?',
  "Renvoie true si la souris survole et est relâchée sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en cases et non en pixels, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_release_square_area?'

# AUTOGenerated for mouse_repeat_area?
link_method_documentation 'Command.mouse_repeat_area?',
  "Renvoie true si la souris survole et pressée de manière répétée sur la zone passée en argument au moment de l'appel, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_repeat_area?'

# AUTOGenerated for mouse_repeat_square_area?
link_method_documentation 'Command.mouse_repeat_square_area?',
  "Renvoie true si la souris survole et est pressée de manière répétée sur la zone passée en argument au moment de l'appel en admettant que la zone soit paramétrée avec des coordonnées en cases et non en pixels, false sinon",
  {
    :area => ["Zone à vérifier", :Area],
    :"*key" => ["Touche à vérifier (par défaut, :mouse_left)", :Symbol],

  }, true # Maybe changed
register_command :area, 'Command.mouse_repeat_square_area?'

# AUTOGenerated for angle_between
link_method_documentation 'Command.angle_between',
  'Renvoie l\'angle entre deux événements référencés par leurs ID\'s',
  {
    :idA => ["ID de l'évènement A (0 pour héros)", :Fixnum],
    :idB => ["ID de l'évènement B (0 pour héros)", :Fixnum],

  }, true # Maybe changed
register_command :event, 'Command.angle_between'

# AUTOGenerated for textfield_text_show
link_method_documentation 'Command.textfield_text_show',
  'Affiche un champ de texte permettant de saisir du texte',
  {
    :id => ["ID du champ de texte", :Fixnum],
    :text => ["Texte du champ à afficher par défaut", :String],
    :x => ["Position X du champ", :Fixnum],
    :y => ["Position Y du champ", :Fixnum],
    :w => ["Largeur du champ de texte", :Fixnum],
    :profile => ["Référence du profile du champ de texte", :Fixnum],
    :"*range" => ["Intervalle du nombre de caractères autorisés, peut être occulté", :Range],
    :"*active" => ["Défini si le textfield est actif à sa création (true oui, false non). Par défaut: true", :Boolean],
    :"*opacity" => ["Défini l'opacité du textfield, par défaut, 255", :Fixnum]

  }
register_command :textfield, 'Command.textfield_text_show'

# AUTOGenerated for textfield_int_show
link_method_documentation 'Command.textfield_int_show',
  'Affiche un champ de texte permettant de saisir des nombres entiers',
  {
    :id => ["ID du champ de texte", :Fixnum],
    :number => ["Nombre à afficher par défaut", :Fixnum],
    :x => ["Position X du champ", :Fixnum],
    :y => ["Position Y du champ", :Fixnum],
    :w => ["Largeur du champ de texte", :Fixnum],
    :profile => ["Référence du profile du champ de texte", :Fixnum],
    :"*range" => ["Intervalle des nombres autorisés, peut être occulté", :Range],
    :"*active" => ["Défini si le textfield est actif à sa création (true oui, false non). Par défaut: true", :Boolean],
    :"*opacity" => ["Défini l'opacité du textfield, par défaut, 255", :Fixnum]

  }
register_command :textfield, 'Command.textfield_int_show'

# AUTOGenerated for textfield_float_show
link_method_documentation 'Command.textfield_float_show',
  'Affiche un champ de texte permettant de saisir des nombres à virgule',
  {
    :id => ["ID du champ de texte", :Fixnum],
    :number => ["Nombre à afficher par défaut du champ", :Float],
    :x => ["Position X du champ", :Fixnum],
    :y => ["Position Y du champ", :Fixnum],
    :w => ["Largeur du champ de texte", :Fixnum],
    :profile => ["Référence du profile du champ de texte", :Fixnum],
    :"*range" => ["Intervalle des nombres autorisés, peut être occulté", :Range],
    :"*active" => ["Défini si le textfield est actif à sa création (true oui, false non). Par défaut: true", :Boolean],
    :"*opacity" => ["Défini l'opacité du textfield, par défaut, 255", :Fixnum]

  }
register_command :textfield, 'Command.textfield_float_show'

# AUTOGenerated for textfield_erase
link_method_documentation 'Command.textfield_erase',
  'Supprime le champ de texte référencé par son ID',
  {
    :"*id" => ["ID de la zone de texte, si aucun ID n'est spécifié, toutes les zones de textes seront supprimées", :Fixnum],

  }
register_command :textfield, 'Command.textfield_erase'

# AUTOGenerated for textfield_activate
link_method_documentation 'Command.textfield_activate',
  'Active la zone de texte référencée par son ID',
  {
    :id => ["ID de la zone de texte", :Fixnum],

  }
register_command :textfield, 'Command.textfield_activate'

# AUTOGenerated for textfield_deactivate
link_method_documentation 'Command.textfield_deactivate',
  'désactive la zone de texte référencée par son ID',
  {
    :"*id" => ["ID du champ de texte, si aucun ID n'est spécifié, toutes les zones de textes seront désactivés", :Fixnum],

  }
register_command :textfield, 'Command.textfield_deactivate'

# AUTOGenerated for textfield_active?
link_method_documentation 'Command.textfield_active?',
  'Renvoie true si le champ de texte référencé par son ID est activé',
  {
    :id => ["ID de la zone de texte", :Fixnum],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_active?'

# AUTOGenerated for textfield_get_value
link_method_documentation 'Command.textfield_get_value',
  'Renvoie la valeur de la zone de texte référencé par son ID',
  {
    :id => ["ID de la zone de texte", :Fixnum],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_get_value'

# AUTOGenerated for textfield_set_value
link_method_documentation 'Command.textfield_set_value',
  'Attribue une valeur à un champ de texte référencé par son ID',
  {
    :id => ["ID de la zone de texte", :Fixnum],
    :value => ["Valeur à attribuer", :TextfieldType],

  }
register_command :textfield, 'Command.textfield_set_value'

# AUTOGenerated for textfield_hover?
link_method_documentation 'Command.textfield_hover?',
  'Renvoie true si la souris survole le champ de texte référencé par son ID, false sinon',
  {
    :id => ["ID de la zone de texte", :Fixnum],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_hover?'

# AUTOGenerated for textfield_click?
link_method_documentation 'Command.textfield_click?',
  'Renvoie true si la souris clique sur le champ de texte référencé par son ID, false sinon',
  {
    :id => ["ID de la zone de texte", :Fixnum],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_click?'

# AUTOGenerated for textfield_press?
link_method_documentation 'Command.textfield_press?',
  'Renvoie true si la souris est pressée en continu sur le champ de texte référencé par son ID, false sinon',
  {
    :id => ["ID de la zone de texte", :Fixnum],
    :"*key" => ["Bouton de la souris, par défaut :mouse_left", :Key],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_press?'

# AUTOGenerated for textfield_release?
link_method_documentation 'Command.textfield_release?',
  'Renvoie true si la souris est relâchée sur le champ de texte référencé par son ID, false sinon',
  {
    :id => ["ID de la zone de texte", :Fixnum],
    :"*key" => ["Bouton de la souris, par défaut :mouse_left", :Key],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_release?'

# AUTOGenerated for textfield_trigger?
link_method_documentation 'Command.textfield_trigger?',
  'Renvoie true si la souris clique une fois sur le champ de texte référencé par son ID, false sinon',
  {
    :id => ["ID de la zone de texte", :Fixnum],
    :"*key" => ["Bouton de la souris, par défaut :mouse_left", :Key],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_trigger?'

# AUTOGenerated for textfield_repeat?
link_method_documentation 'Command.textfield_repeat?',
  'Renvoie true si la souris clique de manière répétée sur le champ de texte référencé par son ID, false sinon',
  {
    :id => ["ID de la zone de texte", :Fixnum],
    :"*key" => ["Bouton de la souris, par défaut :mouse_left", :Key],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_repeat?'

# AUTOGenerated for textfield_visible
link_method_documentation 'Command.textfield_visible',
  'Change la visibilité du champ de texte référencé par son ID',
  {
    :id => ["ID de la zone de texte", :Fixnum],
    :flag => ["True pour visible, false pour invisible", :Boolean],

  }
register_command :textfield, 'Command.textfield_visible'

# AUTOGenerated for textfield_visible
link_method_documentation 'Command.textfield_visible?',
  'Renvoie true si le champ de texte référencé par son ID est visible, false sinon',
  {
    :id => ["ID de la zone de texte", :Fixnum],

  }, true
register_command :textfield, 'Command.textfield_visible?'

# AUTOGenerated for textfield_opacity
link_method_documentation 'Command.textfield_opacity',
  'Change l\'opacité du champ de texte référencé par son ID',
  {
    :id => ["ID de la zone de texte", :Fixnum],
    :opacity => ["Opacité, entre 0 et 255. Si aucune opacité n'est donnée, la commande renverra la valeur de l'opacité du champ", :Fixnum],

  }, true # Maybe changed
register_command :textfield, 'Command.textfield_opacity'

# AUTOGenerated for message_height
link_method_documentation 'Command.message_height',
  'Change le nombre de lignes affichées dans les messages (Commande Event Afficher message)',
  {
    :n => ["Nombre de lignes visibles", :Fixnum],

  }
register_command :standard, 'Command.message_height'

# # AUTOGenerated for bind
# link_method_documentation 'Command.bind',
#   'Associe un micro_event à un sélecteur',
#   {
#     :e => ["Sélecteur d'évènements", :Selecteur],
#     :"*args" => ["Voir l'explication référente aux micro_event dans la documentation", :Args],
#     :"&block" => ["Action à exécuter", :Block],

#   }
# register_command :micro, 'Command.bind'

# # AUTOGenerated for unbind
# link_method_documentation 'Command.unbind',
#   'Dissocie un micro_evenement d\'un sélecteur d`\'évènements',
#   {
#     :e => ["Sélecteur d'évènements", :Selecteur],
#     :"*k" => ["Voir l'explication référente aux micro_event dans la documentation", :Args],

#   }, true # Maybe changed
# register_command :micro, 'Command.unbind'


# AUTOGenerated for clipboard_push_text
link_method_documentation 'Command.clipboard_push_text',
  'Place un texte dans le presse-papier',
  {
    :text => ["Texte à sauvegarder dans le presse-papier", :String],

  }
register_command :clipboard, 'Command.clipboard_push_text'

# AUTOGenerated for clipboard_get_text
link_method_documentation 'Command.clipboard_get_text',
  'Renvoie le texte contenu dans le presse-papier',
  {}, true # Maybe changed
register_command :clipboard, 'Command.clipboard_get_text'

# AUTOGenerated for clipboard_push_command
link_method_documentation 'Command.clipboard_push_command',
  'Place une commande évènement dans le presse-papier',
  {
    :cmd => ["Commande à placer dans le presse-papier", :RPGCommand],

  }
register_command :clipboard, 'Command.clipboard_push_command'

# AUTOGenerated for pad360_plugged?
link_method_documentation 'Command.pad360_plugged?',
  'Renvoie true si une manette est branchée dans le port référencé par son ID, false sinon',
  {
    :"*id" => ["Port de la manette, par défaut 0, soit la première manette branchée", :Fixnum],

  }, true
register_command :xbox, 'Command.pad360_plugged?'

# AUTOGenerated for pad360_stop_vibration_left
link_method_documentation 'Command.pad360_stop_vibration_left',
  'Arrête la vibration du moteur gauche de la manette référencée par son ID',
  {
    :"*id" => ["Port de la manette, par défaut 0, soit la première manette branchée", :Fixnum],

  }
register_command :xbox, 'Command.pad360_stop_vibration_left'

# AUTOGenerated for pad360_stop_vibration_right
link_method_documentation 'Command.pad360_stop_vibration_right',
  'Arrête la vibration du moteur droit de la manette référencée par son ID',
  {
    :"*id" => ["Port de la manette, par défaut 0, soit la première manette branchée", :Fixnum],

  }
register_command :xbox, 'Command.pad360_stop_vibration_right'

# AUTOGenerated for pad360_vibrate
link_method_documentation 'Command.pad360_vibrate',
  'Fait vibrer la manette référencée par son ID',
  {
    :"*id" => ["Port de la manette, par défaut 0, soit la première manette branchée", :Fixnum],
    :"*left" => ["Force dans le moteur gauche, par défaut, 100", :Fixnum],
    :"*right" => ["Force dans le moteur droit, par défaut, 100", :Fixnum],

  }
register_command :xbox, 'Command.pad360_vibrate'

# AUTOGenerated for pad360_stop_vibration
link_method_documentation 'Command.pad360_stop_vibration',
  'Arrête la vibration des deux moteurs de la manette référencée par son ID',
  {
    :"*id" => ["Port de la manette, par défaut 0, soit la première manette branchée", :Fixnum],

  }
register_command :xbox, 'Command.pad360_stop_vibration'

# AUTOGenerated for pad360_vibrate_left
link_method_documentation 'Command.pad360_vibrate_left',
  'Fait vibrer le moteur gauche de la manette référencée par son ID',
  {
    :"*id" => ["Port de la manette, par défaut 0, soit la première manette branchée", :Fixnum],
    :"*s" => ["Force de la vibration, par défaut, 100", :Fixnum],

  }
register_command :xbox, 'Command.pad360_vibrate_left'

# AUTOGenerated for pad360_vibrate_right
link_method_documentation 'Command.pad360_vibrate_right',
  'Fait vibrer le moteur droit de la manette référencée par son ID',
  {
    :"*id" => ["Port de la manette, par défaut 0, soit la première manette branchée", :Fixnum],
    :"*s" => ["Force de la vibration, par défaut, 100", :Fixnum],

  }
register_command :xbox, 'Command.pad360_vibrate_right'

# AUTOGenerated for actor_change_appear
link_method_documentation 'Command.actor_change_appear',
	'Change l\'apparence et la face du héros référencé par son ID',
 	{
		:id => ["ID du héros", :Fixnum],
		:character_name => ["Nom du caractère", :String],
		:character_index => ["ID du caractère", :Fixnum],
		:face_name => ["Nom du face", :String],
		:face_index => ["ID du face", :Fixnum],

	}
register_command :actors, 'Command.actor_change_appear'

# AUTOGenerated for actor_change_character
link_method_documentation 'Command.actor_change_character',
	'Change l\'apparence du héros référencé par son ID',
 	{
		:id => ["ID du héros", :Fixnum],
		:character_name => ["Nom du caractère", :String],
		:character_index => ["ID du caractère", :Fixnum],

	}
register_command :actors, 'Command.actor_change_character'

# AUTOGenerated for actor_change_face
link_method_documentation 'Command.actor_change_face',
	'Change la face du héros référencé par son ID',
 	{
		:id => ["ID du héros", :Fixnum],
		:face_name => ["Nom du face", :String],
		:face_index => ["ID du face", :Fixnum],

	}
register_command :actors, 'Command.actor_change_face'

 # AUTOGenerated for event_erase
link_method_documentation 'Command.event_erase',
	'Efface de la map les événements référencés par le sélécteur ID',
 	{
		:id => ["ID des événements", :Selector],

	}
register_command :event, 'Command.event_erase'

# AUTOGenerated for show_animation
link_method_documentation 'Command.show_animation',
	'Joue une animation sur les événements référencés par le selecteur ID',
 	{
		:ids => ["IDS des événements", :Selector],
		:id_animation => ["ID de l'animation", :Fixnum],
		:"*wait_flag" => ["attend la fin si true", :string],

	}
register_command :event, 'Command.show_animation'

# AUTOGenerated for show_balloon
link_method_documentation 'Command.show_balloon',
	'Joue une émoticone sur les événements référencés par le selecteur ID',
 	{
		:ids => ["IDS des événements", :Selector],
		:id_balloon => ["ID de l'émoticone", :Fixnum],
		:"*wait_flag" => ["attend la fin si true", :String],

	}
register_command :event, 'Command.show_balloon'


# AUTOGenerated for website
link_method_documentation 'Command.website',
  'Ouvre la page web passée en argument',
  {
    :url => ["Url à charger", :String],

  }
register_command :standard, 'Command.website'

# AUTOGenerated for event_move_speed
link_method_documentation 'Command.event_move_speed',
  'Modifie la vitesse des événements référencés par leurs Id',
  {
    :ids => ["ID des événements", :Selector],
    :v => ["Vitesse des événements,si aucune priorité n'est donnée, la commande renverra la valeur de la vitesse de l'évènement référencé par son ID", :Fixnum],

  }
register_command :event, 'Command.event_move_speed'

# AUTOGenerated for player_move_speed
link_method_documentation 'Command.player_move_speed',
  'Modifie la vitesse du joueur',
  {
    :v => ["Vitesse du joueur à donner,si aucune priorité n'est donnée, la commande renverra la valeur de la vitesse du héros", :Fixnum],

  }
register_command :event, 'Command.player_move_speed'

# AUTOGenerated for event_move_frequency
link_method_documentation 'Command.event_move_frequency',
  'Modifie la fréquence des événements référencés par leurs Id',
  {
    :ids => ["ID des événements", :Selector],
    :f => ["Fréquence des événements, si aucune priorité n'est donnée, la commande renverra la valeur de la fréquence de l'évènement référencé par son ID", :Fixnum],

  }
register_command :event, 'Command.event_move_frequency'

# AUTOGenerated for player_move_frequency
link_method_documentation 'Command.player_move_frequency',
  'Modifie la fréquence du joueur',
  {
    :f => ["Fréquence du joueur, si aucune priorité n'est donnée, la commande renverra la valeur de la fréquence du héros", :Fixnum],

  }
register_command :event, 'Command.player_move_frequency'

# AUTOGenerated for event_transfert
link_method_documentation 'Command.event_transfert',
	'Téléporte l\'évènement référencé par son ID à une nouvelle coordonnées de la carte',
 	{
		:id => ["ID de l'évènement", :Fixnum],
		:new_x => ["Coordonnées X", :Fixnum],
		:new_y => ["Coordonnées Y", :Fixnum],

	}
register_command :event, 'Command.event_transfert'
# AUTOGenerated for player_transfert
link_method_documentation 'Command.player_transfert',
	'Téléporte instanément le héros à une autre position de la carte',
 	{
		:new_x => ["Coordonnée X", :Fixnum],
		:new_y => ["Coordonnée Y", :Fixnum],

	}
register_command :event, 'Command.player_transfert'

# AUTOGenerated for player_transfert
link_method_documentation 'Command.player_teleport',
	'Téléporte le héros à une nouvelle coordonnées sur une nouvelle map (potentiellement)',
 	{
		:map_id => ["ID de la carte. Utiliser c(:map_id) pour téléporter sur la même carte", :Fixnum],
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],
		:direction => ["Nouvelle direction pour le héro (2,4,6 ou 8)", :Fixnum],
    :"*fade_type" => ["Le mode de téléport (par défaut 0), 0 = fondu noir, 1 = fondu blanc, 2 = instantanné", :Fixnum]

	}
register_command :event, 'Command.player_teleport'


# AUTOGenerated for event_move_speed_frequency
link_method_documentation 'Command.event_move_speed_frequency',
  'Change la vitesse et la fréquence des événements référencés par leurs ID',
  {
    :ids => ["IDs des événements", :Selector],
    :v => ["Vitesse des événements", :Fixnum],
    :f => ["Fréquence des événements", :Fixnum],

  }
register_command :event, 'Command.event_move_speed_frequency'

# AUTOGenerated for player_move_speed_frequency
link_method_documentation 'Command.player_move_speed_frequency',
  'Change la vitesse et la fréquence de déplacement du joueur',
  {
    :v => ["Vitesse du joueur", :Fixnum],
    :f => ["Fréquence du joueur", :Fixnum],

  }
register_command :event, 'Command.player_move_speed_frequency'

# AUTOGenerated for sound_BGM_play
link_method_documentation 'Command.bgm_play',
  'Joue un BGM',
  {
    :name => ["Nom du BGM", :String],
    :"*volume" => ["Volume du BGM. Pourcentage entre 0 et 100. Par défaut : 100", :Fixnum],
    :"*pitch" => ["Vitesse du BGM. Pourcentage entre 1 et 453. Par défaut : 100", :Fixnum],
  }
register_command :sound, 'Command.bgm_play'

# AUTOGenerated for sound_BGS_play
link_method_documentation 'Command.bgs_play',
  'Joue un BGS',
  {
    :name => ["Nom du BGS", :String],
    :"*volume" => ["Volume du BGS. Pourcentage entre 0 et 100. Par défaut : 80", :Fixnum],
    :"*pitch" => ["Vitesse du BGS. Pourcentage entre 1 et 453. Par défaut : 100", :Fixnum],
  }
register_command :sound, 'Command.bgs_play'

# AUTOGenerated for sound_SE_play
link_method_documentation 'Command.se_play',
  'Joue un SE',
  {
    :name => ["Nom du SE", :String],
    :"*volume" => ["Volume du SE. Pourcentage entre 0 et 100. Par défaut : 80", :Fixnum],
    :"*pitch" => ["Vitesse du SE. Pourcentage entre 1 et 453. Par défaut : 100", :Fixnum],
  }
register_command :sound, 'Command.se_play'

# AUTOGenerated for sound_ME_play
link_method_documentation 'Command.me_play',
  'Joue un ME',
  {
    :name => ["Nom du ME", :String],
    :"*volume" => ["Volume du ME. Pourcentage entre 0 et 100. Par défaut : 100", :Fixnum],
    :"*pitch" => ["Vitesse du ME. Pourcentage entre 1 et 453. Par défaut : 100", :Fixnum],
  }
register_command :sound, 'Command.me_play'

# AUTOGenerated for sound_BGM_volume
link_method_documentation 'Command.bgm_volume',
  'Change le volume du BGM en cours',
  {
    :volume => ["Volume du BGM. Pourcentage entre 0 et 100", :Fixnum],

  }
register_command :sound, 'Command.bgm_volume'

# AUTOGenerated for sound_BGS_volume
link_method_documentation 'Command.bgs_volume',
  'Change le volume du BGS en cours',
  {
    :volume => ["Volume du BGS. Pourcentage entre 0 et 100", :Fixnum],

  }
register_command :sound, 'Command.bgs_volume'

# AUTOGenerated for sound_BGM_stop
link_method_documentation 'Command.bgm_stop',
  'Stoppe le BGM en cours',
  {}
register_command :sound, 'Command.bgm_stop'

# AUTOGenerated for sound_BGS_stop
link_method_documentation 'Command.bgs_stop',
  'Stoppe le BGS en cours',
  {}
register_command :sound, 'Command.bgs_stop'

# AUTOGenerated for sound_SE_stop
link_method_documentation 'Command.se_stop',
  'Stoppe le SE en cours',
  {}
register_command :sound, 'Command.se_stop'

# AUTOGenerated for sound_ME_stop
link_method_documentation 'Command.me_stop',
  'Stoppe le ME en cours',
  {}
register_command :sound, 'Command.me_stop'

# AUTOGenerated for sound_stop
link_method_documentation 'Command.sound_stop',
  'Stoppe tous les sons en cours',
  {}
register_command :sound, 'Command.sound_stop'

# AUTOGenerated for sound_BGM_fade
link_method_documentation 'Command.bgm_fade',
  'Arrêt en fondu du BGM en cours',
  {
    :wait => ["Temps du fondu, par défaut en secondes", :Fixnum],
    :"*frame" => ["Spécifiez 'true' si vous renseignez un temps en frames plutôt qu'en secondes", :Boolean],
  }
register_command :sound, 'Command.bgm_fade'

# AUTOGenerated for sound_BGS_fade
link_method_documentation 'Command.bgs_fade',
  'Arrêt en fondu du BGS en cours',
  {
    :wait => ["Temps du fondu (en secondes)", :Fixnum],
    :"*frame" => ["Spécifiez 'true' si vous renseignez un temps en frames plutôt qu'en secondes", :Boolean],
  }
register_command :sound, 'Command.bgs_fade'

link_method_documentation 'Command.me_fade',
  'Arrêt en fondu du ME en cours',
  {
    :wait => ["Temps du fondu, par défaut en secondes", :Fixnum],
    :"*frame" => ["Spécifiez 'true' si vous renseignez un temps en frames plutôt qu'en secondes", :Boolean],
  }
register_command :sound, 'Command.me_fade'

# AUTOGenerated for sound_BGM_pitch
link_method_documentation 'Command.bgm_pitch',
  'Change la vitesse du BGM en cours',
  {
    :pitch => ["Vitesse du BGM. Pourcentage entre 1 et 453", :Fixnum],
  }
register_command :sound, 'Command.bgm_pitch'

# AUTOGenerated for sound_BGS_pitch
link_method_documentation 'Command.bgs_pitch',
  'Change la vitesse du BGS en cours',
  {
    :pitch => ["Vitesse du BGS. Pourcentage entre 1 et 453", :Fixnum],
  }
register_command :sound, 'Command.bgs_pitch'

# AUTOGenerated for sound_fade
link_method_documentation 'Command.sound_fade',
  'Stoppe les BGM et BGS en fondu',
  {
    :wait => ["Temps du fondu, par défaut en secondes", :Fixnum],
    :"*frame" => ["Spécifiez 'true' si vous renseignez un temps en frames plutôt qu'en secondes", :Boolean],
  }
register_command :sound, 'Command.sound_fade'

link_method_documentation 'Command.save_bgm',
  'Mémorise le BGM en cours',
  {}
register_command :sound, 'Command.save_bgm'

link_method_documentation 'Command.replay_bgm',
  'Reprend le BGM mémorisé',
  {}
register_command :sound, 'Command.replay_bgm'

# AUTOGenerated for actor_slot
link_method_documentation 'Command.actor_slot',
  'Renvoie l\'ID d\'un acteur en fonction de sa position dans l\'équipe. Renvoie 0 si le slot est vide.',
  {
    :id => ["Position de l'acteur dans l'équipe", :Fixnum],

  }
register_command :actors, 'Command.actor_slot'


link_method_documentation 'Command.player_path_length',
	                        'Renvoie la taille du chemin nécéssaire au pathfinder pour se rendre a un point',
 	                        {
		                        :x => ["Coordonnées X", :Fixnum],
		                        :y => ["Coordonnées Y", :Fixnum],
		                       :"*wait_flag" => ["Par défaut, false, cette valeur définit le blocage durant le déplacement ou non", :Boolean],
                           :"*no_through" => ["Par défaut, false, si cette valeur vaut true, même en mode fantôme, l'évènement utilisera un chemin passable", :Boolean],

	                        } # Maybe changed
register_command :event, 'Command.player_path_length'

link_method_documentation 'Command.event_path_length',
	                        'Renvoie la taille du chemin nécéssaire au pathfinder pour se rendre a un point',
 	                        {
		                        :id => ["Id de l'évènement (0 pour le héros)", :Fixnum],
		                        :x => ["Coordonnées X", :Fixnum],
		                        :y => ["Coordonnées Y", :Fixnum],
		                       :"*wait_flag" => ["Par défaut, false, cette valeur définit le blocage durant le déplacement ou non", :Boolean],
                           :"*no_through" => ["Par défaut, false, si cette valeur vaut true, même en mode fantôme, l'évènement utilisera un chemin passable", :Boolean],

	                        } # Maybe changed
register_command :event, 'Command.event_path_length'

# AUTOGenerated for move_to
link_method_documentation 'Command.move_to',
	'Déplace l\'évènement référencé par son ID (0 pour le héros) vers les coordonnées données en argument',
 	{
		:id => ["Id de l'évènement (0 pour le héros)", :Fixnum],
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],
		:"*wait_flag" => ["Par défaut, false, cette valeur définit le blocage durant le déplacement ou non", :Boolean],
    :"*no_throug" => ["Par défaut, false, si cette valeur vaut true, même en mode fantôme, l'évènement utilisera un chemin passable", :Boolean],

	} # Maybe changed
register_command :event, 'Command.move_to'

# AUTOGenerated for jump_to
link_method_documentation 'Command.jump_to',
'Déplace l\'évènement, en sautant, référencé par son ID (0 pour le héros) vers les coordonnées données en argument',
 {
  :id => ["Id de l'évènement (0 pour le héros)", :Fixnum],
  :x => ["Coordonnées X", :Fixnum],
  :y => ["Coordonnées Y", :Fixnum],
  :"*wait_flag" => ["Par défaut, false, cette valeur définit le blocage durant le déplacement ou non", :Boolean],

} # Maybe changed
register_command :event, 'Command.jump_to'

# # AUTOGenerated for monster_element_rate
# link_method_documentation 'Command.monster_element_rate',
# 	'Renvoie la résistance élémentaire (par son ID d\'élément) d\'un monstre référencé par son ID',
#  	{
# 		:id => ["Id du monstre", :Fixnum],
# 		:element_id => ["Id de l'élément", :Fixnum],
#
# 	}, true # Maybe changed
# register_command :enemy, 'Command.monster_element_rate'

# AUTOGenerated for actor_element_rate
link_method_documentation 'Command.actor_element_rate',
  'Renvoie la résistance élémentaire (par son ID d\'élément) d\'un acteur référencé par son ID',
 	{
		:id => ["Id de l'acteur", :Fixnum],
    :element_id => ["Id de l'élément", :Fixnum],

	}, true # Maybe changed
register_command :actors, 'Command.actor_element_rate'

# # AUTOGenerated for armor_element_rate
# link_method_documentation 'Command.armor_element_rate',
#   'Renvoie la résistance élémentaire (par son ID d\'élément) d\'une armure référencée par son ID par rapport à un acteur',
#  	{
# 		:i => ["Id de l'armure", :Fixnum],
# 		:actor_id => ["Id de l'acteur", :Fixnum],
# 		:element_id => ["Id de l'élément", :Fixnum],
#
# 	}, true # Maybe changed
# register_command :armors, 'Command.armor_element_rate'
#
# # AUTOGenerated for weapon_element_rate
# link_method_documentation 'Command.weapon_element_rate',
# 'Renvoie la résistance élémentaire (par son ID d\'élement) d\'une arme référencée par son ID par rapport à un acteur',
#  	{
#      :i => ["Id de l'arme", :Fixnum],
#  		:actor_id => ["Id de l'acteur", :Fixnum],
#  		:element_id => ["Id de l'élément", :Fixnum],
#
# 	}, true # Maybe changed
# register_command :weapons, 'Command.weapon_element_rate'
#
# # AUTOGenerated for item_element_rate
# link_method_documentation 'Command.item_element_rate',
# 'Renvoie la résistance élémentaire (par son ID d\'élement) d\'un objet référencé par son ID par rapport à un acteur',
#  	{
#      :i => ["Id de l'objet", :Fixnum],
#  		:actor_id => ["Id de l'acteur", :Fixnum],
#  		:element_id => ["Id de l'élément", :Fixnum],
#
# 	}, true # Maybe changed
# register_command :items, 'Command.item_element_rate'

# AUTOGenerated for event_priority
link_method_documentation 'Command.event_priority',
  'Change la priorité d\'affichage des événements référencés par leurs ID (0: sous le héros, 1: même niveau que le héros, 2: au dessus du héros)',
  {
    :ids => ["ID des événements", :Selector],
    :priority => ["Priorité d'affichage, si aucune priorité n'est donnée, la commande renverra la valeur de la priorité de l'évènement référencé par son ID", :Fixnum],

  }
register_command :event, 'Command.event_priority'

# AUTOGenerated for event_trigger
link_method_documentation 'Command.event_trigger',
  'Change le type de déclenchement des événements référencés par leurs ID (0: touche action, 1: contact du héros, 2: contact de l\'event, 3: automatique, 4: processus paralléle).',
  {
    :ids => ["ID des événements", :Selector],
    :trigger => ["Type de déclenchement, si aucune priorité n'est donnée, la commande renverra la valeur du déclencheur de l'évènement référencé par son ID", :Fixnum],

  }
register_command :event, 'Command.event_trigger'

# AUTOGenerated for camera_scroll
link_method_documentation 'Command.camera_scroll',
	'Fait défiler la carte dans une direction sur une distance (en cases) à une certaine vitesse',
 	{
		:direction => ["Direction (2=bas, 4=gauche, 6=droite, 8=haut)",  :Fixnum],
		:distance => ["Nombre de case à défiler",  :Fixnum],
		:speed => ["Vitesse du défilement",  :Fixnum],

	}
register_command :camera,'Command.camera_scroll'

# AUTOGenerated for camera_move_on
link_method_documentation 'Command.camera_move_on',
	'Place la caméra sur un point de la carte',
 	{
		:x => ["Coordonnées X",  :Fixnum],
		:y => ["Coordonnées Y",  :Fixnum],

	}
register_command :camera,'Command.camera_move_on'

# AUTOGenerated for camera_scroll_on
link_method_documentation 'Command.camera_scroll_on',
	'Fait défiler la carte vers un point donné',
 	{
		:x => ["Coordonnées X",  :Fixnum],
		:y => ["Coordonnées Y",  :Fixnum],
		:speed => ["Vitesse de défilement",  :Fixnum],

	}
register_command :camera,'Command.camera_scroll_on'

# AUTOGenerated for camera_lock
link_method_documentation 'Command.camera_lock',
	'Verrouille la position de la caméra',
 	{}
register_command :camera,'Command.camera_lock'

# AUTOGenerated for camera_unlock
link_method_documentation 'Command.camera_unlock',
	'Déverrouille la position de la caméra (et reprend le héros comme plan de référence)',
 	{}
register_command :camera,'Command.camera_unlock'

# AUTOGenerated for camera_change_focus
link_method_documentation 'Command.camera_change_focus',
	'Change la cible du scrolling (par défaut, le scrolling suit le héros) pour un autre évènement',
 	{
		:event_id => ["ID de l'évènement à suivre par la caméra",  :Fixnum],

	}
register_command :camera,'Command.camera_change_focus'

# AUTOGenerated for fadein
link_method_documentation 'Command.fadein',
	'Affiche l\'écran en fondu',
 	{
		:"*time" => ["Durée de la transition", :Fixnum],

	}
register_command :standard, 'Command.fadein'

# AUTOGenerated for screen_fadeout
link_method_documentation 'Command.screen_fadeout',
	'Efface l\'écran en fondu (de manière moins radicale que la commande fadeout)',
 	{
		:duration => ["Durée en frame", :Fixnum],

	}
register_command :screen, 'Command.screen_fadeout'

# AUTOGenerated for screen_fadein
link_method_documentation 'Command.screen_fadein',
'Affiche l\'écran en fondu (de manière moins radicale que la commande fadein)',
 	{
		:duration => ["Durée en frame", :Fixnum],

	}
register_command :screen, 'Command.screen_fadein'

# AUTOGenerated for screen_tone
link_method_documentation 'Command.screen_tone',
	'Change la teinte de l\'écran',
 	{
		:tone => ["Teinte (utilisez la commande 'tone')", :Tone],
		:duration => ["Durée en frame", :Fixnum],
		:"*wait_flag" => ["Attend la fin de l'effet (true), n'attend pas (false). Par défaut cet argument vaut false", :Boolean],

	}
register_command :screen, 'Command.screen_tone'

# AUTOGenerated for screen_flash
link_method_documentation 'Command.screen_flash',
	'Envoie un flash à l\'écran',
 	{
		:color => ["Couleur du flash (utilisez la commande 'color')", :Color],
		:duration => ["Durée en frames", :Fixnum],
		:"*wait_flag" => ["Attend la fin de l'effet (true), n'attend pas (false). Par défaut cet argument vaut false", :Boolean],

	}
register_command :screen, 'Command.screen_flash'

# AUTOGenerated for screen_width
link_method_documentation 'Command.screen_width',
	'Renvoie la largeur de l\'écran (en pixels)',
 	{}, true # Maybe changed
register_command :screen, 'Command.screen_width'

# AUTOGenerated for screen_height
link_method_documentation 'Command.screen_height',
	'Renvoie la hauteur de l\'écran (en pixels)',
 	{}, true # Maybe changed
register_command :screen, 'Command.screen_height'


# AUTOGenerated for screen_shake
link_method_documentation 'Command.screen_shake',
	'Fait trembler l\'écran pendant une durée déterminée',
 	{
		:power => ["Puissance du tremblement", :Fixnum],
		:speed => ["Vitesse du tremblement", :Fixnum],
		:duration => ["Durée en frames", :Fixnum],
		:"*wait_flag" => ["Attend la fin de l'effet (true), n'attend pas (false). Par défaut cet argument vaut false", :Boolean],

	}
register_command :screen, 'Command.screen_shake'
# AUTOGenerated for screen_zoom
link_method_documentation 'Command.camera_zoom',
	'Zoom tout l\'écran en temps réel, sauf les windows (dialogues, etc.)',
 	{
		:zoom => ["Valeur de zoom, supérieur à 100", :ArgType],
    :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
    :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
    :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],

	}
register_command :camera, 'Command.camera_zoom'

# AUTOGenerated for screen_pixelation
link_method_documentation 'Command.screen_pixelation',
	'Pixélise tout l\'écran en temps réel, sauf les windows (dialogues, etc.)',
 	{
		:pixelation => ["Valeur de pixélisation (exemple: si 2, la taille des pixels est multipliée par deux)", :ArgType],
    :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
    :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
    :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],

	}
register_command :screen, 'Command.screen_pixelation'

# AUTOGenerated for screen_blur
link_method_documentation 'Command.screen_blur',
	'Applique un flou gaussien sur tout l\'écran en temps réel, sauf les windows (dialogues, etc.). Attention, cette commande peut faire baisser le FPS.',
 	{
		:radius => ["Radius du flou gaussien. (0 = pas de flou)", :ArgType],
    :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
    :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
    :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],

	}
register_command :screen, 'Command.screen_blur'

# AUTOGenerated for screen_motion_blur
link_method_documentation 'Command.camera_motion_blur',
	'Atténue le raffraichissement de l\'écran. Rend plus diffus les mouvements de caméra, et mouvements à l\'écran.',
 	{
		:attenuation => ["Valeur d'atténuation du raffraichissement de l'écran, de 0 à 200", :ArgType],
    :"*duration" => ["Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif", :Fixnum],
    :"*wait_flag" => ["Attend la fin du déplacement, par défaut true", :Boolean],
    :"*ease" => [RME::Doc.vocab[:ease_desc], :Symbol],

	}
register_command :camera, 'Command.camera_motion_blur'

# AUTOGenerated for event_transparent?
link_method_documentation 'Command.event_transparent?',
	'Renvoie true si l\'évènement est transparent (false sinon)',
 	{
		:id => ["ID de l'évènement", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_transparent?'

# AUTOGenerated for player_transparent?
link_method_documentation 'Command.player_transparent?',
	'Renvoi true si le joueur est transparent (false sinon)',
 	{

	}, true # Maybe changed
register_command :event, 'Command.player_transparent?'

# AUTOGenerated for event_transparent
link_method_documentation 'Command.event_transparent',
	'Rend l\'évènement référencé par son ID transparent',
 	{
		:id => ["ID de l'évènement", :Fixnum],

	}
register_command :event, 'Command.event_transparent'

# AUTOGenerated for player_transparent
link_method_documentation 'Command.player_transparent',
	'Rend le joueur transparent',
 	{}
register_command :event, 'Command.player_transparent'

# AUTOGenerated for event_opaque
link_method_documentation 'Command.event_opaque',
	'Rend l\'évènement référencé par son ID opaque',
 	{
		:id => ["ID de l'évènement", :Fixnum],

	}
register_command :event, 'Command.event_opaque'

# AUTOGenerated for player_opaque
link_method_documentation 'Command.player_opaque',
	'Rend le joueur opaque',
 	{}
register_command :event, 'Command.player_opaque'

# AUTOGenerated for get_tileset_id
link_method_documentation 'Command.get_tileset_id',
	'Renvoie l\' ID du tileset de la carte en cours',
 	{}, true # Maybe changed
register_command :mapinfo, 'Command.get_tileset_id'

# AUTOGenerated for switch_tileset
link_method_documentation 'Command.switch_tileset',
	'Change le tileset de la carte en cours',
 	{
		:tileset_id => ["ID du nouveau tileset", :Fixnum],

	}
register_command :mapinfo, 'Command.switch_tileset'

# AUTOGenerated for wall?
link_method_documentation 'Command.wall?',
	'Renvoie true si les coordonnées sont sur un mur, false sinon',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}, true # Maybe changed
register_command :mapinfo, 'Command.wall?'

# AUTOGenerated for roof?
link_method_documentation 'Command.roof?',
	'Renvoie true si les coordonnées sont sur un toit, false sinon',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}, true # Maybe changed
register_command :mapinfo, 'Command.roof?'

# AUTOGenerated for stair?
link_method_documentation 'Command.stair?',
	'Renvoie true si les coordonnées sont sur une marche, false sinon',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}, true # Maybe changed
register_command :mapinfo, 'Command.stair?'

# AUTOGenerated for table?
link_method_documentation 'Command.table?',
	'Renvoie true si les coordonnées sont sur une table, false sinon',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}, true # Maybe changed
register_command :mapinfo, 'Command.table?'

# AUTOGenerated for map_width
link_method_documentation 'Command.map_width',
	'Retourne la largeur de la carte',
 	{}, true # Maybe changed
register_command :mapinfo, 'Command.map_width'

# AUTOGenerated for map_height
link_method_documentation 'Command.map_height',
	'Retourne la hauteur de la carte',
 	{}, true # Maybe changed
register_command :mapinfo, 'Command.map_height'


# AUTOGenerated for ground?
link_method_documentation 'Command.ground?',
	'Renvoie true si les coordonnées sont sur le sol, false sinon',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}, true # Maybe changed
register_command :mapinfo, 'Command.ground?'

# AUTOGenerated for create_text_window
link_method_documentation 'Command.create_text_window',
	'Crée une fenêtre pouvant contenir du texte',
 	{
		:id => ["Numéro de la fenêtre", :Fixnum],
		:content => ["Texte (ou tableau séparé par des virgules) à afficher", :String],
		:x => ["Position X de la fenêtre", :Fixnum],
		:y => ["Position Y de la fenêtre", :Fixnum],
		:"*w" => ["Largeur de la fenêtre, utilisez 'nil' pour que la largeur de la fenêtre soit calculée", :Fixnum],
		:"*h" => ["Hauteur de la fenêtre, utilisez 'nil' pour que la hauteur de la fenêtre soit calculée", :Fixnum],

	} # Maybe changed
register_command :window, 'Command.create_text_window'

# AUTOGenerated for remove_window
link_method_documentation 'Command.remove_window',
	'Supprime la fenêtre référencée par son ID',
 	{
		:id => ["ID de la fenêtre", :Fixnum],

	}
register_command :window, 'Command.remove_window'

# AUTOGenerated for remove_all_windows
link_method_documentation 'Command.remove_all_windows',
	'Supprime toutes les fenêtres',
 	{}
register_command :window, 'Command.remove_all_windows'

# AUTOGenerated for close_window
link_method_documentation 'Command.close_window',
	'Ferme la fenêtre référencée par son ID',
 	{
		:id => ["ID de la fenêtre", :Fixnum],

	}
register_command :window, 'Command.close_window'

# AUTOGenerated for open_window
link_method_documentation 'Command.open_window',
	'Ouvre la fenêtre référencée par son ID',
 	{
		:id => ["ID de la fenêtre", :Fixnum],

	}, true # Maybe changed
register_command :window, 'Command.open_window'

# AUTOGenerated for window_closed?
link_method_documentation 'Command.window_closed?',
	'Renvoie true si la fenêtre référencée par son ID est fermée, false sinon',
 	{
		:id => ["ID de la fenêtre", :Fixnum],

	}, true # Maybe changed
register_command :window, 'Command.window_closed?'

# AUTOGenerated for window_opened?
link_method_documentation 'Command.window_opened?',
	'Renvoie true si la fenêtre référencée par son ID est ouverte, false sinon',
 	{
		:id => ["ID de la fenêtre", :Fixnum],

	}, true # Maybe changed
register_command :window, 'Command.window_opened?'

# AUTOGenerated for window_content
link_method_documentation 'Command.window_content',
	'Change le contenu de la fenêtre référencée par son ID, si aucun contenu n\'est donné, la commande renverra le contenu de la fenêtre',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
		:"*content" => ["Valeur affichée de la fenêtre", :Object],
		:"*resize" => ["Si cet argument vaut true, la taille de la fenêtre est recalculée", :Boolean],

	}, true # Maybe changed
register_command :window, 'Command.window_content'


# AUTOGenerated for window_moveto
link_method_documentation 'Command.window_moveto',
	'Change les coordonnées X et Y de la fenêtre',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
		:x => ["Coordonnée X", :Fixnum],
		:y => ["Coordonnée Y", :Fixnum],
		:"*duration" => ["Durée du déplacement", :Fixnum],
		:"*wait_flag" => ["si cet argument vaut true, on attendra la fin du déplacement", :Boolean],

	}
register_command :window, 'Command.window_moveto'

# AUTOGenerated for window_dimension
link_method_documentation 'Command.window_dimension',
	'Change la dimension de la fenêtre',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
		:width => ["Largeur de la fenêtre", :Fixnum],
		:height => ["Hauteur de la fenêtre", :Fixnum],
		:"*duration" => ["Durée du déplacement", :Fixnum],
		:"*wait_flag" => ["si cet argument vaut true, on attendra la fin du déplacement", :Boolean],

	}
register_command :window, 'Command.window_dimension'

# AUTOGenerated for window_opacity
link_method_documentation 'Command.window_opacity',
	'Change l\'opacité de la fenêtre, si aucune valeur n\'est spécifiée, la commande renvoie la valeur de l\'opacité',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
		:"*value" => ["Valeur de l'opacité à changer", :Fixnum],
		:"*duration" => ["Durée du déplacement", :Fixnum],
		:"*wait_flag" => ["si cet argument vaut true, on attendra la fin du déplacement", :Boolean],

	}, true # Maybe changed
register_command :window, 'Command.window_opacity'

# AUTOGenerated for window_moveto
link_method_documentation 'Command.window_moveto',
	'Change les coordonnées X et Y de la fenêtre',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
		:x => ["Coordonnée X", :Fixnum],
		:y => ["Coordonnée Y", :Fixnum],
		:"*duration" => ["Durée du déplacement", :Fixnum],
		:"*wait_flag" => ["si cet argument vaut true, on attendra la fin du déplacement", :Boolean],

	}
register_command :window, 'Command.window_moveto'

# AUTOGenerated for window_dimension
link_method_documentation 'Command.window_dimension',
	'Change la dimension de la fenêtre',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
		:width => ["Largeur de la fenêtre", :Fixnum],
		:height => ["Hauteur de la fenêtre", :Fixnum],
		:"*duration" => ["Durée du déplacement", :Fixnum],
		:"*wait_flag" => ["si cet argument vaut true, on attendra la fin du déplacement", :Boolean],

	}
register_command :window, 'Command.window_dimension'

# AUTOGenerated for window_opacity
link_method_documentation 'Command.window_opacity',
	'Change l\'opacité de la fenêtre, si aucune valeur n\'est spécifiée, la commande renvoie la valeur de l\'opacité',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
		:"*value" => ["Valeur de l'opacité à changer, entre 0 et 255.", :Fixnum],
		:"*duration" => ["Durée du déplacement", :Fixnum],
		:"*wait_flag" => ["si cet argument vaut true, on attendra la fin du déplacement", :Boolean],

	}, true # Maybe changed
register_command :window, 'Command.window_opacity'


# AUTOGenerated for window_move
link_method_documentation 'Command.window_move',
	'Déplacement sur tous les paramètres',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],
		:w => ["Largeur", :Fixnum],
		:h => ["Hauteur", :Fixnum],
		:opacity => ["Opacité", :Fixnum],
		:"*duration" => ["Durée du déplacement", :Fixnum],
		:"*wait_flag" => ["si cet argument vaut true, on attendra la fin du déplacement", :Boolean],

	}
register_command :window, 'Command.window_move'

# AUTOGenerated for create_commands_window
link_method_documentation 'Command.create_commands_window',
	'Crée une fenêtre de sélection verticale',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
		:x => ["Coordonnées X de la fenêtre", :Fixnum],
		:y => ["Coordonnées Y de la fenêtre", :Fixnum],
		:w => ["Largeur de la fenêtre", :Fixnum],
		:hash => ["Hash décrivant les différentes sections de la fenêtre", :Hash],
		:"*h" => ["Hauteur de la fenêtre (en nombre de ligne), si aucun argument n'est donné, la hauteur sera calculée", :Fixnum],

	}
register_command :window, 'Command.create_commands_window'

# AUTOGenerated for create_horizontal_commands_window
link_method_documentation 'Command.create_horizontal_commands_window',
	'Crée une fenêtre de sélection horizontale',
 	{
     :id => ["ID de la fenêtre", :Fixnum],
 		:x => ["Coordonnées X de la fenêtre", :Fixnum],
 		:y => ["Coordonnées Y de la fenêtre", :Fixnum],
    :hash => ["Hash décrivant les différentes sections de la fenêtre", :Hash],
    :"row" => ["Nombre de colonnes. Si aucun argument n'est spécifié, la fenêtre prendra le nombre correct de colonnes", :Fixnum],
	}
register_command :window, 'Command.create_horizontal_commands_window'

# AUTOGenerated for window_current_symbol
link_method_documentation 'Command.window_current_symbol',
	'Renvoie, pour une fenêtre de sélection, le symbole sélectionné',
 	{
		:id => ["ID de la fenêtre", :Fixnum],

	}, true # Maybe changed
register_command :window, 'Command.window_current_symbol'

# AUTOGenerated for window_activate
link_method_documentation 'Command.window_activate',
	'Rend la fenêtre référencée par son ID active',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
	}
register_command :window, 'Command.window_activate'

# AUTOGenerated for window_deactivate
link_method_documentation 'Command.window_deactivate',
'Rend la fenêtre référencée par son ID inactive',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
	}
register_command :window, 'Command.window_deactivate'

# AUTOGenerated for create_selectable_window
link_method_documentation 'Command.create_selectable_window',
	'Crée une fenêtre de sélection complexe',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
		:x => ["Coordonnée X", :Fixnum],
		:y => ["Coordonnée Y", :Fixnum],
		:width => ["Largeur de la fenêtre", :Fixnum],
		:height => ["Hauteur de la fenêtre", :Fixnum],
		:hash => ["Description des callbacks de la fenêtre (CF Wiki)", :Hash],

	}
register_command :window, 'Command.create_selectable_window'

# AUTOGenerated for window_width
link_method_documentation 'Command.window_width',
	'Renvoie la largeur de la fenêtre référencée par son ID',
 	{
		:id => ["ID de la fenêtre", :Fixnum],

	}, true # Maybe changed
register_command :window, 'Command.window_width'

# AUTOGenerated for window_height
link_method_documentation 'Command.window_height',
	'Renvoie la hauteur de la fenêtre référencée par son ID',
 	{
		:id => ["ID de la fenêtre", :Fixnum],

	}, true # Maybe changed
register_command :window, 'Command.window_height'

# AUTOGenerated for window_x
link_method_documentation 'Command.window_x',
	'Change la coordonnée X de la fenêtre référencée par son ID, si aucun X n\'est donné, la commande renverra la valeur actuelle de x',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
    :"*x" => ["Coordonnée X de la fenêtre", :Fixnum],
	}, true # Maybe changed
register_command :window, 'Command.window_x'

# AUTOGenerated for window_y
link_method_documentation 'Command.window_y',
	'Change la coordonnée Y de la fenêtre référencée par son ID, si aucun Y n\'est donné, la commande renverra la valeur actuelle de y',
 	{
		:id => ["ID de la fenêtre", :Fixnum],
    :"*y" => ["Coordonnée Y de la fenêtre", :Fixnum],
	}, true # Maybe changed
register_command :window, 'Command.window_y'

link_method_documentation 'Command.between',
	'Donne la distance entre deux points',
 	{
		:x1 => ["Valeur X du premier point", :Fixnum],
		:y1 => ["Valeur Y du premier point", :Fixnum],
		:x2 => ["Valeur X du second point", :Fixnum],
		:y2 => ["Valeur Y du second point", :Fixnum],

	}, true
register_command :math, 'Command.between'

# AUTOGenerated for damage_floor?
link_method_documentation 'Command.damage_floor?',
  'Renvoie true si la case référencée par X, Y est blessante, false sinon',
  {
    :x => ["Coordonnées X de la case", :Fixnum],
    :y => ["Coordonnées Y de la case", :Fixnum],

  }, true
register_command :mapinfo, 'Command.damage_floor?'

# AUTOGenerated for text_clear
link_method_documentation 'Command.texts_clear',
  'Supprime tous les textes',
  {}, true
register_command :text, 'Command.texts_clear'


# AUTOGenerated for event_move_down
link_method_documentation 'Command.event_move_down', 
	'Fait bouger l\'événement référencé par son ID d\'une case vers le bas. Renvoie true si le déplacement s\'est effectué, false sinon.',
 	{
    :id => ["Id de l'événement", :Fixnum],
    :"*turn_ok" => ["En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)", :Boolean],
	}
register_command :event, 'Command.event_move_down' 

# AUTOGenerated for event_move_left
link_method_documentation 'Command.event_move_left', 
	'Fait bouger l\'événement référencé par son ID d\'une case vers la gauche. Renvoie true si le déplacement s\'est effectué, false sinon.',
 	{
		:id => ["Id de l'événement", :Fixnum],
    :"*turn_ok" => ["En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)", :Boolean],
	}
register_command :event, 'Command.event_move_left' 

# AUTOGenerated for event_move_right
link_method_documentation 'Command.event_move_right', 
	'Fait bouger l\'événement référencé par son ID d\'une case vers la droite. Renvoie true si le déplacement s\'est effectué, false sinon.',
 	{
		:id => ["Id de l'événement", :Fixnum],
    :"*turn_ok" => ["En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)", :Boolean],
	}
register_command :event, 'Command.event_move_right' 

# AUTOGenerated for event_move_up
link_method_documentation 'Command.event_move_up', 
  'Fait bouger l\'événement référencé par son ID d\'une case vers le haut. Renvoie true si le déplacement s\'est effectué, false sinon.',  
 	{
		:id => ["Id de l'événement", :Fixnum],
    :"*turn_ok" => ["En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)", :Boolean],
	}
register_command :event, 'Command.event_move_up' 

# AUTOGenerated for player_move_down
link_method_documentation 'Command.player_move_down', 
	'Fait bouger le joueur d\'une case vers le bas',
 	{:"*turn_ok" => ["En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)", :Boolean]}
register_command :event, 'Command.player_move_down' 

# AUTOGenerated for player_move_left
link_method_documentation 'Command.player_move_left', 
	'Fait bouger le joueur d\'une case vers la gauche. Renvoie true si le déplacement s\'est effectué, false sinon.',
 	{:"*turn_ok" => ["En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)", :Boolean]}
register_command :event, 'Command.player_move_left' 

# AUTOGenerated for player_move_right
link_method_documentation 'Command.player_move_right', 
	'Fait bouger le joueur d\'une case vers la droite. Renvoie true si le déplacement s\'est effectué, false sinon.',
 	{:"*turn_ok" => ["En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)", :Boolean]}
register_command :event, 'Command.player_move_right' 

# AUTOGenerated for player_move_up
link_method_documentation 'Command.player_move_up', 
	'Fait bouger le joueur d\'une case vers le haut. Renvoie true si le déplacement s\'est effectué, false sinon.',
 	{:"*turn_ok" => ["En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)", :Boolean]}
register_command :event, 'Command.player_move_up' 

# AUTOGenerated for event_move_straight
link_method_documentation 'Command.event_move_straight', 
	'Déplace un événement référencé par son ID d\'une case dans une direction. La commande renvoie true ou false si le déplacement a réussi ou non.',
 	{
		:id => ["Id de l'événement", :Fixnum],
		:value => ["Valeur, 2 pour bas, 4 pour gauche, 6 pour droite et 8 pour bas", :Fixnum],
		:"*turn_ok" => ["En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)", :Boolean],

	}, true # Maybe changed
register_command :event, 'Command.event_move_straight' 

# AUTOGenerated for player_move_straight
link_method_documentation 'Command.player_move_straight', 
	'Déplace un événement référencé par son ID d\'une case dans une direction. La commande renvoie true ou false si le déplacement a réussi ou non.',
 	{
		:value => ["Valeur, 2 pour bas, 4 pour gauche, 6 pour droite et 8 pour bas", :Fixnum],
		:"*turn_ok" => ["En cas d'échec de déplacement, si turn_ok vaut true, l'événement se tournera dans la direction du mouvement. (par défaut, true)", :Boolean],

	}, true # Maybe changed
register_command :event, 'Command.player_move_straight' 

# AUTOGenerated for event_move_random
link_method_documentation 'Command.event_move_random', 
	'Déplace un événement d\' une case aléatoire.',
 	{
		:id => ["Id de l'événement", :Fixnum],
	}
register_command :event, 'Command.event_move_random' 

# AUTOGenerated for player_move_random
link_method_documentation 'Command.player_move_random', 
	'Déplacele héro d\' une case aléatoire.',
 	{}
register_command :event, 'Command.player_move_random'

# AUTOGenerated for event_move_diagonal
link_method_documentation 'Command.event_move_diagonal', 
	"Déplace un événement référencé par son ID d'une case en diagonale. Renvoie true si le mouvement à réussi, false sinon.",
 	{
		:id => ["Id de l'événement", :Fixnum],
		:horizontal => ["Direction horizontale (4 pour gauche, 6 pour droite)", :Fixnum],
		:vertical => ["Direction verticale (2 pour bas, 8 pour haut)", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_diagonal' 

# AUTOGenerated for player_move_diagonal
link_method_documentation 'Command.player_move_diagonal', 
	"Déplace le héro d'une case en diagonale. Renvoie true si le mouvement à réussi, false sinon.",
 	{
		:horizontal => ["Direction horizontale (4 pour gauche, 6 pour droite)", :Fixnum],
		:vertical => ["Direction verticale (2 pour bas, 8 pour haut)", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.player_move_diagonal' 

# AUTOGenerated for event_move_lower_left
link_method_documentation 'Command.event_move_lower_left', 
	"Déplacement l'événement référencé par son ID d'une case en diagonale bas-gauche. Renvoie true si le déplacement à réussi, false sinon.",
 	{
		:id => ["ID de l'événement", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_lower_left' 

# AUTOGenerated for event_move_lower_right
link_method_documentation 'Command.event_move_lower_right', 
	"Déplacement l'événement référencé par son ID d'une case en diagonale bas-droite. Renvoie true si le déplacement à réussi, false sinon.",
 	{
		:id => ["ID de l'événement", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_lower_right' 

# AUTOGenerated for event_move_upper_left
link_method_documentation 'Command.event_move_upper_left', 
	"Déplacement l'événement référencé par son ID d'une case en diagonale haut-gauche. Renvoie true si le déplacement à réussi, false sinon.",
 	{
		:id => ["ID de l'événement", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_upper_left' 

# AUTOGenerated for event_move_upper_right
link_method_documentation 'Command.event_move_upper_right', 
	"Déplacement l'événement référencé par son ID d'une case en diagonale haut-droite. Renvoie true si le déplacement à réussi, false sinon.",
 	{
		:id => ["ID de l'événement", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_upper_right' 

# AUTOGenerated for player_move_lower_left
link_method_documentation 'Command.player_move_lower_left', 
	"Déplacement  le héro d'une case en diagonale bas-gauche. Renvoie true si le déplacement à réussi, false sinon.",
 	{}, true # Maybe changed
register_command :event, 'Command.player_move_lower_left' 

# AUTOGenerated for player_move_lower_right
link_method_documentation 'Command.player_move_lower_right', 
	"Déplacement  le héro d'une case en diagonale bas-droite. Renvoie true si le déplacement à réussi, false sinon.",
 	{}, true # Maybe changed
register_command :event, 'Command.player_move_lower_right' 

# AUTOGenerated for player_move_upper_left
link_method_documentation 'Command.player_move_upper_left', 
	"Déplacement  le héro d'une case en diagonale haut-gauche. Renvoie true si le déplacement à réussi, false sinon.",
 	{}, true # Maybe changed
register_command :event, 'Command.player_move_upper_left' 

# AUTOGenerated for player_move_upper_right
link_method_documentation 'Command.player_move_upper_right', 
	"Déplacement  le héro d'une case en diagonale haut-droite. Renvoie true si le déplacement à réussi, false sinon.",
 	{}, true # Maybe changed
register_command :event, 'Command.player_move_upper_right' 

# AUTOGenerated for event_move_toward_position
link_method_documentation 'Command.event_move_toward_position', 
	'Déplace un événement référencé par son ID d\'une case en direction d\'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["ID de l'événement", :Fixnum],
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_toward_position' 

# AUTOGenerated for player_move_toward_position
link_method_documentation 'Command.player_move_toward_position', 
	'Déplace le héro d\'une case en direction d\'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.player_move_toward_position' 

# AUTOGenerated for event_move_toward_event
link_method_documentation 'Command.event_move_toward_event', 
	'Déplace un événement référencé par son ID d\'une case en direction d\'un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement devant effectuer le déplacement", :Fixnum],
		:target => ["Id de l'événement cible", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_toward_event' 

# AUTOGenerated for event_move_toward_player
link_method_documentation 'Command.event_move_toward_player', 
	'Déplace un événement référencé par son ID d\'une case en direction du héro. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement devant effectuer le déplacement", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_toward_player' 

# AUTOGenerated for player_move_toward_event
link_method_documentation 'Command.player_move_toward_event', 
	'Déplace le héro d\'une case en direction d\'un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement cible", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.player_move_toward_event' 


# AUTOGenerated for event_move_away_from_position
link_method_documentation 'Command.event_move_away_from_position', 
	'Déplace un événement référencé par son ID d\'une case dans la direction opposée à une coordonnée. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["ID de l'événement", :Fixnum],
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_away_from_position' 

# AUTOGenerated for player_move_away_from_position
link_method_documentation 'Command.player_move_away_from_position', 
	'Déplace le héro d\'une case dans la direction opposée d\'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.player_move_away_from_position' 

# AUTOGenerated for event_move_away_from_event
link_method_documentation 'Command.event_move_away_from_event', 
	'Déplace un événement référencé par son ID d\'une case dans la direction opposée à un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement devant effectuer le déplacement", :Fixnum],
		:target => ["Id de l'événement cible", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_away_from_event' 

# AUTOGenerated for event_move_away_from_player
link_method_documentation 'Command.event_move_away_from_player', 
	'Déplace un événement référencé par son ID d\'une case en direction opposée au héro. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement devant effectuer le déplacement", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_away_from_player' 

# AUTOGenerated for player_move_away_from_event
link_method_documentation 'Command.player_move_away_from_event', 
	'Déplace le héro d\'une case dans la direction opposée à un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement cible", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.player_move_away_from_event' 

# AUTOGenerated for event_move_forward
link_method_documentation 'Command.event_move_forward', 
	"Déplace l'événement référencé par son ID d'une case en avant. Renvoie true si le mouvement a réussi, false sinon.",
 	{
		:id => ["Id de l'événement devant effectuer le déplacement", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_forward' 

# AUTOGenerated for player_move_forward
link_method_documentation 'Command.player_move_forward', 
	"Déplace le héro d'une case en avant. Renvoie true si le mouvement a réussi, false sinon.",
 	{}, true # Maybe changed
register_command :event, 'Command.player_move_forward' 

# AUTOGenerated for event_move_backward
link_method_documentation 'Command.event_move_backward', 
	"Déplace l'événement référencé par son ID d'une case en arrière. Renvoie true si le mouvement a réussi, false sinon.",
 	{
		:id => ["Id de l'événement devant effectuer le déplacement", :Fixnum],

	}, true # Maybe changed
register_command :event, 'Command.event_move_backward' 

# AUTOGenerated for player_move_backward
link_method_documentation 'Command.player_move_backward', 
	"Déplace le héro d'une case en arrière. Renvoie true si le mouvement a réussi, false sinon.",
 	{}, true # Maybe changed
register_command :event, 'Command.player_move_backward' 

# AUTOGenerated for event_turn_down
link_method_documentation 'Command.event_turn_down', 
	"Fait tourner un événement vers le bas",
 	{
		:id => ["ID de l'événement", :Fixnum],

	}
register_command :event, 'Command.event_turn_down' 

# AUTOGenerated for player_turn_down
link_method_documentation 'Command.player_turn_down', 
	"Fait tourner le héro vers le bas",
 	{}
register_command :event, 'Command.player_turn_down' 

# AUTOGenerated for event_turn_left
link_method_documentation 'Command.event_turn_left', 
	"Fait tourner un événement à gauche",
 	{
		:id => ["ID de l'événement", :Fixnum],

	}
register_command :event, 'Command.event_turn_left' 

# AUTOGenerated for player_turn_left
link_method_documentation 'Command.player_turn_left', 
	"Fait tourner le héro à gauche",
 	{}
register_command :event, 'Command.player_turn_left' 

# AUTOGenerated for event_turn_right
link_method_documentation 'Command.event_turn_right', 
	"Fait tourner un événement à droite",
 	{
		:id => ["ID de l'événement", :Fixnum],

	}
register_command :event, 'Command.event_turn_right' 

# AUTOGenerated for player_turn_right
link_method_documentation 'Command.player_turn_right', 
	"Fait tourner le héro à droite",
 	{}
register_command :event, 'Command.player_turn_right' 

# AUTOGenerated for event_turn_up
link_method_documentation 'Command.event_turn_up', 
	"Fait tourner un événement vers le bas",
 	{
		:id => ["ID de l'événement", :Fixnum],

	}
register_command :event, 'Command.event_turn_up' 

# AUTOGenerated for player_turn_up
link_method_documentation 'Command.player_turn_up', 
	"Fait tourner le héro vers le bas",
 	{}
register_command :event, 'Command.player_turn_up' 


# AUTOGenerated for event_turn_90_left
link_method_documentation 'Command.event_turn_90_left', 
	'Fait tourner un événement référencé par son ID de 90° par la gauche',
 	{
		:id => ["ID de l'événement", :Fixnum],

	}
register_command :event, 'Command.event_turn_90_left' 

# AUTOGenerated for player_turn_90_left
link_method_documentation 'Command.player_turn_90_left', 
	'Fait tourner le joueur de 90° par la gauche',
 	{}
register_command :event, 'Command.player_turn_90_left' 

# AUTOGenerated for event_turn_90_right
link_method_documentation 'Command.event_turn_90_right', 
	'Fait tourner un événement référencé par son ID de 90° par la droite',
 	{
		:id => ["ID de l'événement", :Fixnum],

	}
register_command :event, 'Command.event_turn_90_right' 

# AUTOGenerated for player_turn_90_right
link_method_documentation 'Command.player_turn_90_right', 
	'Fait tourner le joueur de 90° par la droite',
 	{}
register_command :event, 'Command.player_turn_90_right' 

# AUTOGenerated for event_turn_180
link_method_documentation 'Command.event_turn_180', 
	'Fait tourner un événement référencé par son ID de 180°',
 	{
		:id => ["ID de l'événement", :Fixnum],

	}
register_command :event, 'Command.event_turn_180' 

# AUTOGenerated for player_turn_180
link_method_documentation 'Command.player_turn_180', 
	'Fait tourner le héro de 180°',
 	{}
register_command :event, 'Command.player_turn_180' 

# AUTOGenerated for event_turn_90_right_or_left
link_method_documentation 'Command.event_turn_90_right_or_left', 
	'Fait tourner un événement référencé par son ID de 90° par la gauche ou par la droite (aléatoirement)',
 	{
		:id => ["ID de l'événement", :Fixnum],

	}
register_command :event, 'Command.event_turn_90_right_or_left' 

# AUTOGenerated for player_turn_90_right_or_left
link_method_documentation 'Command.player_turn_90_right_or_left', 
	'Fait tourner le héro de 90° par la gauche ou par la droite (aléatoirement)',
 	{}
register_command :event, 'Command.player_turn_90_right_or_left' 

# AUTOGenerated for event_turn_random
link_method_documentation 'Command.event_turn_random', 
	'Fait tourner un événement référencé par son ID dans une direction aléatoire',
 	{
		:id => ["ID de l'événement", :Fixnum],

	}
register_command :event, 'Command.event_turn_random' 

# AUTOGenerated for player_turn_random
link_method_documentation 'Command.player_turn_random', 
	'Fait tourner le héro dans une direction aléatoire',
 	{}
register_command :event, 'Command.player_turn_random' 


# AUTOGenerated for event_turn_toward_position
link_method_documentation 'Command.event_turn_toward_position', 
	'Tourne un événement référencé par son ID d\'une case en direction d\'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["ID de l'événement", :Fixnum],
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}
register_command :event, 'Command.event_turn_toward_position' 

# AUTOGenerated for player_turn_toward_position
link_method_documentation 'Command.player_turn_toward_position', 
	'Tourne le héro d\'une case en direction d\'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}
register_command :event, 'Command.player_turn_toward_position' 

# AUTOGenerated for event_turn_toward_event
link_method_documentation 'Command.event_turn_toward_event', 
	'Tourne un événement référencé par son ID d\'une case en direction d\'un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement devant effectuer le déplacement", :Fixnum],
		:target => ["Id de l'événement cible", :Fixnum],

	}
register_command :event, 'Command.event_turn_toward_event' 

# AUTOGenerated for event_turn_toward_player
link_method_documentation 'Command.event_turn_toward_player', 
	'Tourne un événement référencé par son ID d\'une case en direction du héro. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement devant effectuer le déplacement", :Fixnum],

	}
register_command :event, 'Command.event_turn_toward_player' 

# AUTOGenerated for player_turn_toward_event
link_method_documentation 'Command.player_turn_toward_event', 
	'Tourne le héro d\'une case en direction d\'un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement cible", :Fixnum],

	}
register_command :event, 'Command.player_turn_toward_event' 


# AUTOGenerated for event_turn_away_from_position
link_method_documentation 'Command.event_turn_away_from_position', 
	'Tourne un événement référencé par son ID d\'une case dans la direction opposée à une coordonnée. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["ID de l'événement", :Fixnum],
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}
register_command :event, 'Command.event_turn_away_from_position' 

# AUTOGenerated for player_turn_away_from_position
link_method_documentation 'Command.player_turn_away_from_position', 
	'Tourne le héro d\'une case dans la direction opposée d\'une coordonnée. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:x => ["Coordonnées X", :Fixnum],
		:y => ["Coordonnées Y", :Fixnum],

	}
register_command :event, 'Command.player_turn_away_from_position' 

# AUTOGenerated for event_turn_away_from_event
link_method_documentation 'Command.event_turn_away_from_event', 
	'Tourne un événement référencé par son ID d\'une case dans la direction opposée à un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement devant effectuer le déplacement", :Fixnum],
		:target => ["Id de l'événement cible", :Fixnum],

	}
register_command :event, 'Command.event_turn_away_from_event' 

# AUTOGenerated for event_turn_away_from_player
link_method_documentation 'Command.event_turn_away_from_player', 
	'Tourne un événement référencé par son ID d\'une case en direction opposée au héro. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement devant effectuer le déplacement", :Fixnum],

	}
register_command :event, 'Command.event_turn_away_from_player' 

# AUTOGenerated for player_turn_away_from_event
link_method_documentation 'Command.player_turn_away_from_event', 
	'Tourne le héro d\'une case dans la direction opposée à un autre événément référencé par son ID. Renvoie true si le mouvement a réussi, false sinon.',
 	{
		:id => ["Id de l'événement cible", :Fixnum],

	}
register_command :event, 'Command.player_turn_away_from_event'

# AUTOGenerated for text_progressive
link_method_documentation 'Command.text_progressive', 
	'Affiche progressivement un texte (caractère par caractère)',
 	{
		:id => ["Id du champ de texte", :Fixnum],
		:value => ["Texte a afficher", :String],
		:delay => ["Durée (délai) entre chaque apparition de caractères", :Fixnum],
		:"*block" => ["Vous pouvez passer du code entre accolades qui va s'exécuter à chaque caractère (facultatif)", :Block]

	}
register_command :text, 'Command.text_progressive' 

# AUTOGenerated for get_random_square
link_method_documentation 'Command.get_random_square', 
	'Renvoie un point aléatoire sur la carte, dont la région est référencée par son ID',
 	{
		:"*region_id" => ["L'id de la région dans laquelle chercher une case aléatoire. Par défaut, elle vaut 0", :Fixnum],

	}, true # Maybe changed
register_command :mapinfo, 'Command.get_random_square' 

# AUTOGenerated for get_squares_by_region
link_method_documentation 'Command.get_squares_by_region', 
	'Renvoie un tableau de cases pour une région donnée.',
 	{
		:region_id => ["l'ID de la région (entre 0 et 63)", :Fixnum],

	}, true # Maybe changed
register_command :mapinfo, 'Command.get_squares_by_region' 

# AUTOGenerated for get_squares_by_tile
link_method_documentation 'Command.get_squares_by_tile', 
	'Renvoie un tableau de cases pour un tile (et une couche) donnés.',
 	{
		:layer => ["La couche (entre 0 et 2)", :Fixnum],
		:tile_id => ["L'ID du tile", :Fixnum],

	}, true # Maybe changed
register_command :mapinfo, 'Command.get_squares_by_tile' 

# AUTOGenerated for has_prefix?
link_method_documentation 'Command.has_prefix?', 
	'Renvoie true si une chaine à le préfix donné, false sinon.',
 	{
		:string => ["La chaine de caractère à vérifier", :String],
		:prefix => ["Le préfix devant être contenu dans la chaine", :String],

	}, true # Maybe changed
register_command :standard, 'Command.has_prefix?' 

# AUTOGenerated for has_suffix?
link_method_documentation 'Command.has_suffix?', 
	'Renvoie true si une chaine à le suffix donné, false sinon.',
 	{
		:string => ["La chaine de caractère à vérifier", :String],
		:suffix => ["Le suffix devant être contenu dans la chaine", :String],

	}, true # Maybe changed
register_command :standard, 'Command.has_suffix?' 

# AUTOGenerated for has_substring?
link_method_documentation 'Command.has_substring?', 
	'Renvoie true si une chaine contient une autre chaine donnée, false sinon.',
 	{
		:string => ["La chaine de caractère à vérifier", :String],
		:substring => ["La chaine devant être contenue dans la chaine", :String],

	}, true # Maybe changed
register_command :standard, 'Command.has_substring?' 

# AUTOGenerated for event_flash
link_method_documentation 'Command.event_flash', 
	'Flash un événement (référencé par son ID) dans une couleur',
 	{
		:id => ["l'ID de l'événement cible", :Fixnum],
		:color => ["La couleur du flash (vous pouvez utiliser la commande color ou via son profil dans la base de données)", :Color],
		:duration => ["La durée du flash en frames", :Fixnum],

	}
register_command :event, 'Command.event_flash' 

# AUTOGenerated for player_flash
link_method_documentation 'Command.player_flash', 
	'Flash le hér dans une couleur',
 	{
		:color => ["La couleur du flash (vous pouvez utiliser la commande color ou via son profil dans la base de données)", :Color],
		:duration => ["La durée du flash en frames", :Fixnum],

	}
register_command :event, 'Command.player_flash' 

# AUTOGenerated for get_squares_by_terrain
link_method_documentation 'Command.get_squares_by_terrain', 
	'Renvoie un tableau de cases pour un terrain_tag donné donnée.',
 	{
		:terrain_tag => ["Le terrain tag (entre 0 et 7)", :Fixnum],

	}, true # Maybe changed
register_command :mapinfo, 'Command.get_squares_by_terrain' 



end

## Documentation generator
if $STAGING
  if $TEST && Dir.exist?("../doc")
    DocGenerator.markdown("../doc")
    DocGenerator.html("../doc/HTML")
    p "generate report"
    DocGenerator::Checker.run("../doc_report.csv", "../doc_generated.rb", "../ee4_report.tsv")
    p "generate JSON files"
    File.open('../doc/doc.js', 'w+'){|f| f.write(DocGenerator.to_json)}
    p "generate Self-contained RME"
    File.open('../src/package.rb', 'r') do |f|
      package = eval(f.read)

      dump = package.components.reduce("") do |acc, n|
        p "dump #{n}"
        acc + "\n" + File.read("../src/#{n}")
      end
      File.open('../RME.rb', 'w+'){|rf| rf.write(dump)}
    end
    p "done! let's go !"
  end
end
