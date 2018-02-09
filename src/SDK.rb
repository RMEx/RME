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

module RME

  module Config

    KEY_EVAL = :f3
    KEY_TONE = :f4
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
  GetClientRect           = Win32API.new('user32', 'GetClientRect', 'ip', 'i')
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
  SetWindowPos 	          = Win32API.new('user32', 'SetWindowPos', 'iiiiiii', 'i')
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
  def set_transition(method, target, duration, easing = :InLinear)
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
    f = Easing::FUNCTIONS[f]
    v = t==0 ? b : t==d ? b + c : b + c*f[t/d]
    instance_variable_set("@trans_t_#{m}", t + 1)
    method("#{m}=")[v]
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

  #--------------------------------------------------------------------------
  # * Linear interpolant between the two given points
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # @param a [Point] the first point
  # @param b [Point] the second point (whose x-coordinate should be below
  #                  the first one)
  # @return [Lambda(Float): Float] a function which corresponds to the
  #         linear interpolant between the two points
  #--------------------------------------------------------------------------
  def self.linear_interpolant(a, b)
    linear_interpolant(b, a) if a.x > b.x

    slope = (b.y - a.y).fdiv(b.x - a.x)
    y_intercept = a.y - slope * a.x

    lambda { |x| slope * x + y_intercept }
  end

end

#==============================================================================
# ** Game_Window
#------------------------------------------------------------------------------
#  The window of the game
#==============================================================================

module Game_Window
  extend self
  #--------------------------------------------------------------------------
  # * Get the window frame
  #--------------------------------------------------------------------------
  def rect
    Externlib::GetWindowRect.call(HWND, wr = [0, 0, 0, 0].pack('l4'))
    wr = wrect.unpack('l4')
    Rect.new(wr[0], wr[1], wr[2] - wr[0], wr[3] - wr[1])
  end
  #--------------------------------------------------------------------------
  # * Get the dimensions of the window, excluding the frame
  #--------------------------------------------------------------------------
  def client_rect
    Externlib::GetClientRect.call(HWND, cr = [0, 0, 0, 0].pack('l4'))
    cr = cr.unpack('l4')
    Rect.new(*cr)
  end
  #--------------------------------------------------------------------------
  # * Set the position of the window (specify x, y, or Point)
  #--------------------------------------------------------------------------
  def set_position(x, y)
    Externlib::SetWindowPos.call(HWND, 0, x, y, 0, 0, 0x0201)
  end
  #--------------------------------------------------------------------------
  # * Get the ratio of the display
  #--------------------------------------------------------------------------
  def ratio
    client_rect.width.to_f / Graphics.width
  end
  #--------------------------------------------------------------------------
  # * Set the ratio of the display
  #--------------------------------------------------------------------------
  def ratio=(v)
    wr = rect
    cr = client_rect
    w = (Graphics.width  * v).to_i + wr.width  - cr.width
    h = (Graphics.height * v).to_i + wr.height - cr.height
    x = wr.x - (w - wr.width ) / 2
    y = wr.y - (h - wr.height) / 2
    Externlib::SetWindowPos.call(HWND, 0, x, y, w, h, 0x0200)
  end
end

#==============================================================================
# ** Easing modules
#------------------------------------------------------------------------------
# Easing functions specify the rate of change of a paremeter over time.
# It is mainly used to animate things (transitions).
#
# Basically, these functions are cubic Bézier curves defined by an interval of
# `n` points starting from P0(0, 0) to Pn(1, 1).
# All points in between -- formally represented by Px(x, y) -- should comply
# with the following criteria:
#   - `x` is a real number and should belong to the [0, 1]'s interval
#   - `y` is any real number
#==============================================================================
module Easing

  #--------------------------------------------------------------------------
  # * Easing functions
  #--------------------------------------------------------------------------
  e = {
    'Linear'  => proc{|t| t },
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

  FUNCTIONS = Hash.new
  e.keys.each do |k|
    FUNCTIONS[('In'   + k).to_sym] = e[k]
    FUNCTIONS[('Out'  + k).to_sym] = proc{|t| 1 - e[k][1 - t] }
    FUNCTIONS[('InOut'+ k).to_sym] = proc do |t|
      t < 0.5 ? e[k][t*2]/2 : 1 - e[k][(1-t)*2]/2
    end
  end

  #--------------------------------------------------------------------------
  # * Interval's 'tweening with easing functions
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Computes `nb_steps` of steps -- according to the provided easing function
  # (`easing_function`) -- to cross the given interval from the start (`from`)
  # to its end (`end`).
  # @param from [Fixnum] the interval's start
  # @param to [Fixnum] the interval's end
  # @param nb_steps [Fixnum] the number of steps to compute in [`from`, `to`]
  # @param easing_function [Lambda(Float): Float] the easing function used to
  #        compute steps
  # @return [Lambda(Fixnum): Float] a function which returns the step's value
  #         thanks to the provided step's index.
  #--------------------------------------------------------------------------
  def self.tween(from, to, nb_steps, easing_function = FUNCTIONS[:InLinear])
    distance = to - from
    lambda do |x|
      completion = x.fdiv(nb_steps.to_i)
      from + distance * easing_function.call(completion)
    end
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
    attr_reader :moving

    #--------------------------------------------------------------------------
    # * Alias
    #--------------------------------------------------------------------------
    alias_method :dragging?, :dragging
    alias_method :moving?, :moving

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
      @moving       = false
      @last_point   = Point.new(0, 0)
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
      @moving = @last_point != @point
      @last_point.x = @point.x
      @last_point.y = @point.y
    end

    #--------------------------------------------------------------------------
    # * Position update
    #--------------------------------------------------------------------------
    def update_position
      buffer = [0,0].pack('l2')
      cursor_position(buffer)
      screen_to_client(HWND, buffer)
      r = Game_Window.ratio
      @point.x, @point.y = *buffer.unpack('l2')
      @point.x, @point.y = (@point.x / r).to_i, (@point.y / r).to_i
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
      @picked.dragging = true
      @picked.drag_viewport_instead ? o = @picked.viewport : o = @picked
      nx, ny = @x_init + Mouse.drag.ox, @y_init + Mouse.drag.oy
      if r = @picked.drag_restriction
        o.x = [[nx, r.x].max, r.x + r.width ].min
        o.y = [[ny, r.y].max, r.y + r.height].min
      else
        o.x, o.y = nx, ny
      end
      @picked.on_mouse_drag if @picked.respond_to?(:on_mouse_drag)
    end
    #--------------------------------------------------------------------------
    # * Drops the last picked Object
    #--------------------------------------------------------------------------
    def drop
      @picked.dragging = false if @picked
      @picked = nil
    end
  end

  #--------------------------------------------------------------------------
  # * Extend the draggable object's behaviour
  #--------------------------------------------------------------------------
  attr_accessor :drag_viewport_instead
  attr_accessor :drag_restriction
  attr_accessor :dragging
  alias_method :dragging?, :dragging

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

  alias_method :after, :lambda
  alias_method :before, :lambda
  alias_method :during, :lambda

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
# ** Game_System
#------------------------------------------------------------------------------
#  This class handles system data. It saves the disable state of saving and 
# menus. Instances of this class are referenced by $game_system.
#==============================================================================

class Game_System
  #--------------------------------------------------------------------------
  # * Aliases
  #--------------------------------------------------------------------------
  alias_method :rme_initialize, :initialize
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor   :weather_no_dimness   # Disable automatic dimness with weather
  attr_accessor   :flashed_data
  attr_accessor   :window_opacity
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    @window_opacity = 255
    rme_initialize
    @weather_no_dimness = false
    @flashed_data = {}
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
