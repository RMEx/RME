# -*- coding: utf-8 -*-
#==============================================================================
# ** RME v1.3.0
#------------------------------------------------------------------------------
#  With :
# xvw
# Joke
# Grim
# Raho
# Zeus81
# Hiino
# Zangther
# Fabien
# Kaelar
# Spyrojojo
# Boubou le hibou
# FalconPilot
# Husk
# Hinola
# Ulis
# msp
#------------------------------------------------------------------------------
#  RME is the successor of Event Extender. It offers a collection of tools to
# promote the personalization of an RPG Maker VX Ace project. It is the result
# of the work of many people and any contribution is welcome.
#------------------------------------------------------------------------------
#  GitHub: https://github.com/RMEx/RME
#==============================================================================

=begin # MIT License

Copyright (c) 2012-2018 RMEx

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

=end # MIT License

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
    def version; define_version(1,3,0); end
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
    #--------------------------------------------------------------------------
    # * Deprecation
    #--------------------------------------------------------------------------
    def deprecated(message)
      puts "[deprecated] #{message}"
    end

    def deprecated_command(command, message = "this command is deprecated")
      puts "[deprecated command '#{command}'] #{message}"
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

class Point

  attr_reader :x, :y
  attr_accessor :rect

  #--------------------------------------------------------------------------
  # * Initialize
  #--------------------------------------------------------------------------
  def initialize(x, y, rect = nil)
    @rect = rect
    set(x, y, rect)
  end

  #--------------------------------------------------------------------------
  # * Set coords
  #--------------------------------------------------------------------------
  def set(x, y, rect = nil)
    @rect ||= rect
    self.x = x
    self.y = y
  end

  #--------------------------------------------------------------------------
  # * x accessor
  #--------------------------------------------------------------------------
  def x=(new_x)
    new_x = new_x.bound(@rect.x, @rect.x + @rect.width) if @rect
    @x = new_x
  end

  #--------------------------------------------------------------------------
  # * y accessor
  #--------------------------------------------------------------------------
  def y=(new_y)
    new_y = new_y.bound(@rect.y, @rect.y + @rect.height) if @rect
    @y = new_y
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
    set(0, 0)
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
# Big thanks to Zeus81 (and to xvw, too)
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

#==============================================================================
# ** RME Database
#------------------------------------------------------------------------------
#  With :
# xvw
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

#==============================================================================
# ** RME Internal
#------------------------------------------------------------------------------
#  With :
# xvw
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

#==============================================================================
# ** RME Gui
#------------------------------------------------------------------------------
#  With :
# Joke
# Grim
# xvw
#------------------------------------------------------------------------------
# Graphical User Interface SDK for RME's tools
#==============================================================================

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
    @base_z ||= self.z
    if self.parent && self.parent.respond_to?(:z)
      begin 
        self.true_z = @base_z + self.parent.true_z + 1
      rescue # Souviens toi l'été dernier
        self.true_z = @base_z
      end
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
          checked_label:    "✓",
          unchecked_label:  "  ",
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
        #self.value=@value
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
          return if @value != "" && ["+", "-"].include?(c)
          self.value = @value.insert_at(@virtual_position, c)
          @transformed = true
          go_right
        end
      end
    end

    #==============================================================================
    # ** Float_Recorder
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
    def on_mouse_drag;   on_mouse(:drag);   end
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
      @bar   = Box.new(name:'bar', parent:self, x:start, drag: @style[:drag])
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
      @bar.x = (start + course.to_f * v.fbound(0, max_value) / max_value).to_i
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

  class VerticalTrackBar < Box
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
      @bar   = Box.new(name:'bar', parent:self, y:start, drag: @style[:drag])
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
    def start;  @track.inner.y; end
    def course; @track.inner.height - @bar.height; end
    def max_value; @style[:max_value] || 255; end
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

  class ScrollBar < TrackBar
    #--------------------------------------------------------------------------
    # * Object initialize
    # * optionnal named args = max_value:, value:, x:, y:, width:
    #--------------------------------------------------------------------------
    def initialize(args=nil)
      super(args)
      @left_button = Button.new(name:'left_button', parent:self,
      trigger: trigger{@bar.x = [@bar.x - 10, start].max; @style[:drag].call if @style[:drag].is_a? Proc})
      @right_button = Button.new(name:'right_button', parent:self, x:self.width-12,
      trigger: trigger{@bar.x = [@bar.x + 10, course + 12].min; @style[:drag].call if @style[:drag].is_a? Proc})
      set_bar_size(@style[:windows_size], @style[:content_size])
    end
    #--------------------------------------------------------------------------
    # * Set bar size
    #--------------------------------------------------------------------------
    def set_bar_size(windows_size, content_size)
      windows_size ||= 50
      content_size ||= 100
      @bar.width = @track.inner.width * windows_size / content_size
      update_drag_restriction
    end
    #--------------------------------------------------------------------------
    # * Responsive computing
    #--------------------------------------------------------------------------
    def compute
      super
      @right_button.x = self.width-12 if @right_button
    end
  end

  #==============================================================================
  # ** Gui::VerticalScrollBar
  #------------------------------------------------------------------------------
  #  Vertical ScrollBar
  #==============================================================================

  class VerticalScrollBar < VerticalTrackBar
    #--------------------------------------------------------------------------
    # * Object initialize
    # * optionnal named args = max_value:, value:, x:, y:, width:
    #--------------------------------------------------------------------------
    def initialize(args=nil)
      super(args)
      @up_button = Button.new(name:'up_button', parent:self,
      trigger: trigger{@bar.y = [@bar.y - 10, start].max; @style[:drag].call if @style[:drag].is_a? Proc})
      @down_button = Button.new(name:'down_button', parent:self, y:self.height-12,
      trigger: trigger{@bar.y = [@bar.y + 10, course + 12].min; @style[:drag].call if @style[:drag].is_a? Proc})
      set_bar_size(@style[:windows_size], @style[:content_size])
    end
    #--------------------------------------------------------------------------
    # * Set bar size
    #--------------------------------------------------------------------------
    def set_bar_size(windows_size, content_size)
      windows_size ||= 50
      content_size ||= 100
      @bar.height = @track.inner.height * windows_size / content_size
      update_drag_restriction
    end
    #--------------------------------------------------------------------------
    # * Responsive computing
    #--------------------------------------------------------------------------
    def compute
      super
      @down_button.y = self.height-12 if @down_button
    end
  end

  #==============================================================================
  # ** Gui::ScrollableField
  #------------------------------------------------------------------------------
  #  Scrollable Field
  #==============================================================================

  class ScrollableField < Box

    attr_accessor :content, :field
    #--------------------------------------------------------------------------
    # * Object initialize
    # * optionnal named args = x:, y:, width:, height:
    #--------------------------------------------------------------------------
    def initialize(args=nil)
      super(args)
      @field = Box.new(name:'field', parent:self)
      @content = Box.new(name:'content', parent:@field)
    end
    #--------------------------------------------------------------------------
    # * Pushes other in self
    #--------------------------------------------------------------------------
    def <<(oth)
      @content << oth
      compute_scrolling
      oth
    end
    #--------------------------------------------------------------------------
    # * Recompute Scrollbar
    #--------------------------------------------------------------------------
    def compute_scrolling
      if @content.width > @field.width
        create_horizontal_scrollbar
      else
        @scrollbar.dispose if @scrollbar
        @field.height = self.height
      end
      if @content.height > @field.height
        create_vertical_scrollbar
      else
        @verticalscrollbar.dispose if @verticalscrollbar
        @field.width = self.width
      end
    end

    #--------------------------------------------------------------------------
    # * Create horizontal scrollbar
    #--------------------------------------------------------------------------
    def create_horizontal_scrollbar
      @scrollbar ||= ScrollBar.new(
        parent: self,
        y: @field.height - 12,
        drag: trigger{scroll_horizontally}
      )
      @scrollbar.set_bar_size(@field.width, @content.width)
      @field.height = self.height - 12
      @scrollbar.width = @field.width - 12 if @content.height > @field.height
    end
    #--------------------------------------------------------------------------
    # * Create vertical scrollbar
    #--------------------------------------------------------------------------
    def create_vertical_scrollbar
      @verticalscrollbar ||= VerticalScrollBar.new(
        parent: self,
        x: @field.width - 12,
        drag: trigger{scroll_vertically}
      )
      @verticalscrollbar.set_bar_size(@field.height, @content.height)
      @field.width = self.width - 12
    end
    #--------------------------------------------------------------------------
    # * Scroll horizontally
    #--------------------------------------------------------------------------
    def scroll_horizontally
      @content.x = - ((@content.width - @field.width) * @scrollbar.value / 100)
    end
    #--------------------------------------------------------------------------
    # * Scroll vertycally
    #--------------------------------------------------------------------------
    def scroll_vertically
      @content.y = - ((@content.height - @field.height) * @verticalscrollbar.value / 100)
    end
  end

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
    delegate :@textfield, :value
    delegate :@textfield, :actived?
    #--------------------------------------------------------------------------
    # * Object initialize
    #--------------------------------------------------------------------------
    def initialize_intern_components
      super

      limit = @style[:range_value] || nil

      case @style[:format]
      when :int
        @recorder = Components::Int_Recorder.new(0, limit)
      when :float
        @recorder = Components::Float_Recorder.new(0.0, limit)
      else
        @recorder = Components::Text_Recorder.new("", limit)
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
      recorder.cursor_jump(@textfield.formatted_value.to_s.length)
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
    background_color: Color.new('#113f59'),
    padding: 0
    
  set '.bar',
    background_color: Color.new('#19bec0'),
    border_color: Color.new('#113f59')
    
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
  button_font = fon.clone
  button_font.size = 8
  button_font.color = Color.new('#113f59')

  set 'Gui::ScrollBar',
    width:  100.percent,
    height: 12,
    max_value: 100

  set 'Gui::ScrollBar .track',
    width:  100.percent,
    height: 100.percent,
    margin: [0,12],
    border: 0

  set 'Gui::ScrollBar .bar',
    width:  50.percent,
    height: 100.percent

  set 'Gui::ScrollBar .right_button', 'Gui::ScrollBar .left_button',
    width:  12,
    height: 12,
    padding: 0,
    font: button_font,
    border: 1,
    background_color: Color.new('#19bec0'),
    border_color: Color.new('#113f59')

  set 'Gui::ScrollBar .right_button',
    title: '▶'

  set 'Gui::ScrollBar .left_button',
    title: '◀'

  #--------------------------------------------------------------------------
  # * Vertical Scrollbar
  #--------------------------------------------------------------------------
  set 'Gui::VerticalScrollBar',
    width:  12,
    height: 100.percent,
    max_value: 100

  set 'Gui::VerticalScrollBar .track',
    width:  100.percent,
    height: 100.percent,
    margin: [12,0],
    border: 0
    
  set 'Gui::VerticalScrollBar .bar',
    width:  100.percent,
    height: 50.percent

  set 'Gui::VerticalScrollBar .up_button', 'Gui::VerticalScrollBar .down_button',
    width:  12,
    height: 12,
    padding: 0,
    font: button_font,
    border: 1,
    background_color: Color.new('#19bec0'),
    border_color: Color.new('#113f59')

  set 'Gui::VerticalScrollBar .up_button',
    title: '▲'

  set 'Gui::VerticalScrollBar .down_button',
    title: '▼'

  #--------------------------------------------------------------------------
  # * Scrollable Field
  #--------------------------------------------------------------------------

  set 'Gui::ScrollableField', 'Gui::ScrollableField .field',
    background: :none,
    padding: 0,
    border: 0,
    width: 100.percent,
    height: 100.percent

  set 'Gui::ScrollableField .content',
    background: :none,
    padding: 0,
    border: 0,
    width: :auto,
    height: :auto


end

end

#==============================================================================
# ** RME Evex
#------------------------------------------------------------------------------
#  With :
# Grim (original project)
# xvw
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

  def self.swap(name)
    if name == :screenshot
      return Graphics.snap_to_bitmap.clone
    end
    if /^(\/Pictures|Pictures)\/(.*)/ =~ name
      return Cache.picture($2)
    end
    if /^(\/Animations|Animations)\/(.*)/ =~ name
      return Cache.animation($2)
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
    if /^(\/Characters|Characters)\/(.*)/ =~ name
      return Cache.character($2)
    end
    if /^(\/Faces|Faces)\/(.*)/ =~ name
      return Cache.face($2)
    end
    if /^(\/Parallaxes|Parallaxes)\/(.*)/ =~ name
      return Cache.parallax($2)
    end
    if /^(\/System|System)\/(.*)/ =~ name
      return Cache.system($2)
    end
    if /^(\/Tilesets|Tilesets)\/(.*)/ =~ name
      return Cache.tileset($2)
    end
    if /^(\/Titles1|Titles1)\/(.*)/ =~ name
      return Cache.title1($2)
    end
    if /^(\/Titles2|Titles2)\/(.*)/ =~ name
      return Cache.title2($2)
    end
    return Cache.picture(name)
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
# ** V (special thanks to xvw)
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
# ** S (special thanks to xvw)
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
    if id.is_a?(Range)
      id.each do |k|
        $game_self_vars[[map_id, ev_id, k]] = value
      end
    else
      $game_self_vars[[map_id, ev_id, id]] = value
    end
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
  attr_accessor :last_used_item
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
# ** Game_Battler
#------------------------------------------------------------------------------
#  A battler class with methods for sprites and actions added. This class
# is used as a super class of the Game_Actor class and Game_Enemy class.
#==============================================================================

class Game_Battler < Game_BattlerBase
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :old_use_item, :use_item
  #--------------------------------------------------------------------------
  # * Memorize item ID
  #--------------------------------------------------------------------------
  def use_item(item)
    $game_temp.last_used_item = item.id
    old_use_item(item)
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
  alias_method :select_spritesheets, :select_events
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

  def all_spritesheets
    a = $game_map.screen.spritesheets.to_a.select{|pict| !pict.name.empty?}
    a.map {|i| i.number}
  end

  def get_spritesheets(*ids, &block)
    return [] unless SceneManager.scene.is_a?(Scene_Map)
    if ids.length == 1 && ids[0] == :all_pictures
      return all_spritesheets
    end
    result = []
    ids.each { |id| result << id if all_spritesheets.include?(id) }
    result += all_spritesheets.select(&block) if block_given?
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
  attr_accessor :pin
  attr_accessor  :scroll_speed_x, :scroll_speed_y
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
    @pin = false
    @scroll_speed_y = @scroll_speed_x = 2
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
  # * Check if a text is erased
  #--------------------------------------------------------------------------
  def erased?
    !@profile
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
  #--------------------------------------------------------------------------
  # * Text is pinned ?
  #--------------------------------------------------------------------------
  def pinned?
    @pin
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
  # * Fresh id
  #--------------------------------------------------------------------------
  def fresh_id
    i = @data.find_index {|text| !text || text.erased? }
    return (i || @data.length)
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
# ** Light_Emitter
#------------------------------------------------------------------------------
#  The Abstract representation of a lightsource
#==============================================================================

class Light_Emitter

  attr_accessor :rayon, :intensity, :excluded, :fx

  def initialize(rayon, intensity, excluded = [], fx = {})
    @rayon = rayon
    @intensity = intensity
    @excluded = excluded
    @fx = fx
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
  attr_accessor :light_emitter
  attr_accessor :tone
  attr_reader :id

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
    @id = 0
    rm_extender_initialize
    @light_emitter = nil
    @zoom_x = @zoom_y = 100.0
    @rect = Rect.new(0,0,0,0)
    @sprite_index
    init_tone
  end

  #--------------------------------------------------------------------------
  # * Initialize Color Tone
  #--------------------------------------------------------------------------
  def init_tone
    @tone = Tone.new
    @tone_target = Tone.new
    @tone_duration = 0
  end

  #--------------------------------------------------------------------------
  # * Remove Emitter
  #--------------------------------------------------------------------------
  def remove_light_emitter
    @light_emitter = nil
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
    update_tone_change
  end
  #--------------------------------------------------------------------------
  # * Start Changing Color Tone
  #--------------------------------------------------------------------------
  def start_tone_change(tone, duration, ease=:InLinear)
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
  # * Check if the event is adjacent to the map's border
  #--------------------------------------------------------------------------
  def adjacent_of_map_border?
    w = $game_map.width -1
    h = $game_map.height -1
    (self.x == 0 or self.x == w) or (self.y == 0 or self.y == h)
  end

  #--------------------------------------------------------------------------
  # * Move to x y coord
  #--------------------------------------------------------------------------
  def move_to_position(sx, sy, wait=false, no_through = false)
    return unless $game_map.passable?(sx,sy,0)
    route = Pathfinder.create_path(Point.new(sx, sy), self, no_through)
    self.force_move_route(route)
    Fiber.yield while self.move_route_forcing if wait
  end
  #--------------------------------------------------------------------------
  # * Move n squares towards x y coord
  #--------------------------------------------------------------------------
  def partial_move_to_position(sx, sy, steps, wait=false, no_through = false)
    return unless $game_map.passable?(sx,sy,0)
    route = Pathfinder.create_path(Point.new(sx, sy), self, no_through)

    if route.list.size > steps
      route.list.slice!(steps...-1)
    end

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
# ** Sprite_Shadow
#------------------------------------------------------------------------------
#  This sprite is used to display characters's Shadow
#==============================================================================

class Sprite_Shadow < Sprite_Character

end

#==============================================================================
# ** Sprite_Reflect
#------------------------------------------------------------------------------
#  This sprite is used to display characters's reflection
#==============================================================================

class Sprite_Reflect < Sprite_Character

  def initialize(*args, id, cases)
    @id = id
    @y_offset = compute_y_offset
    @base_opacity = 255
    @cases = cases
    super(*args)
  end

  def compute_y_offset
    return 0 unless @character
    return 1 if @character.priority_type != 2
    ev = $game_map.events_xy(@character.x, @character.y + 1)
    return 3 if !ev.empty? && ev[0].priority_type == 0
    2
  end

  def update_other; end
  def setup_new_effect; end

  def y_rect
    return 8 if src_rect.height > 32
    0
  end

  def need_erased?
    @character.transparent || @cases[:excluded].include?(@id)
  end

  def update
    if need_erased?
      self.visible = false
      return
    end
    self.visible = true
    @y_offset = compute_y_offset
    super()
    self.angle = 180
    self.mirror = true
    self.z = -100
    self.y = @character.screen_y + ((@y_offset - 1) * 32) - 2 - y_rect
    update_sprite_effect
    update_for(:terrains, :terrain_tag)
    update_for(:regions, :region_id)
  end

  def update_sprite_effect
    self.wave_amp = @cases[:wave_amp]
    self.wave_speed = @cases[:wave_speed]
    self.opacity = @cases[:opacity]
    self.tone = @cases[:tone]
  end

  def update_for(key, method)
    id = $game_map.send(method, @character.x, @character.y + @y_offset)
    if @cases[key].has_key?(id)
      reg = @cases[key][id]
      self.wave_amp = reg[:wave_amp] || @cases[:wave_amp]
      self.wave_speed = reg[:wave_speed] || @cases[:wave_speed]
      self.opacity = reg[:opacity] || @cases[:opacity]
      self.tone =  reg[:tone] || @cases[:tone]
    end
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
    self.tone.set(character.tone)
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
    self.opacity = $game_system.window_opacity
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
  #--------------------------------------------------------------------------
  # * mouse_hover?
  #--------------------------------------------------------------------------
  def mouse_hover?
    posX = Mouse.x - self.x
    posY = Mouse.y - self.y
    posX -= viewport.x if (viewport)
    posY -= viewport.y if (viewport)
    return(posX.between?(0, self.width-1) && posY.between?(0, self.height-1))
  end
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

  #--------------------------------------------------------------------------
  # * item
  #--------------------------------------------------------------------------
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
  # * Get Activation State of Selection Item
  #--------------------------------------------------------------------------
  def current_item_enabled?
    enabled?(index)
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

  #--------------------------------------------------------------------------
  # * Draw text with number
  #--------------------------------------------------------------------------
  def write_with_number(index, s, n)
    write_text(index, s)
    write_text(index, n, 2)
  end

  #--------------------------------------------------------------------------
  # * Draw text with icon (and number)
  #--------------------------------------------------------------------------
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
  #--------------------------------------------------------------------------
  # * Update Window Background
  #--------------------------------------------------------------------------
  def update_background
    @background = $game_message.background
    self.opacity = @background == 0 ? $game_system.window_opacity : 0
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
    $game_map.reflash_map
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
  alias_method :rm_extender_setup_scroll, :setup_scroll
  alias_method :rm_extender_pc, :parallel_common_events
  alias_method :rm_extender_update_scroll, :update_scroll
  alias_method :rm_extender_scroll_up, :scroll_up
  alias_method :rm_extender_scroll_down, :scroll_down
  alias_method :rm_extender_scroll_left, :scroll_left
  alias_method :rm_extender_scroll_right, :scroll_right
  alias_method :rm_extender_refresh, :refresh

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
  attr_accessor :camera_lock
  attr_accessor :tileset_id
  attr_accessor :map
  attr_accessor :use_reflection
  attr_accessor :reflection_properties
  attr_accessor :region_mapper
  attr_accessor :tile_mapper
  attr_accessor :scroll_speed
  attr_accessor :can_dash
  attr_accessor :scrolling_activate
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
    @camera_lock = []
    reflash_map
    setup_region_data
    @max_event_id = events.keys.max || 0
    @can_dash = !@map.disable_dashing
  end
  #--------------------------------------------------------------------------
  # * Get Whether Dash is Disabled
  #--------------------------------------------------------------------------
  def disable_dash?
    !can_dash
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
  # * reflash all squares
  #--------------------------------------------------------------------------
  def reflash_map
    return unless SceneManager.scene.is_a?(Scene_Map)
    tilemap = SceneManager.scene.spriteset.tilemap
    old_flash = $game_system.flashed_data[map_id]
    if tilemap && old_flash
      tilemap.flash_data = old_flash
    end
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    rm_extender_refresh
  end
  #--------------------------------------------------------------------------
  # * Scroll Processing
  #--------------------------------------------------------------------------
  def update_scroll
    return if @fixed

    if @scroll_function.nil?
      rm_extender_update_scroll
    else
      target = @scroll_function.call(@scroll_rest)
      @display_x = target.x
      @display_y = target.y
      @scroll_rest -= 1

      @scroll_function = nil if (0 >= @scroll_rest)
    end
  end

  #--------------------------------------------------------------------------
  # * Scroll Down
  #--------------------------------------------------------------------------
  def scroll_down(distance)
    return if @camera_lock.include?(:y)
    rm_extender_scroll_down(distance)
  end
  #--------------------------------------------------------------------------
  # * Scroll Left
  #--------------------------------------------------------------------------
  def scroll_left(distance)
    return if @camera_lock.include?(:x)
    rm_extender_scroll_left(distance)
  end
  #--------------------------------------------------------------------------
  # * Scroll Right
  #--------------------------------------------------------------------------
  def scroll_right(distance)
    return if @camera_lock.include?(:x)
    rm_extender_scroll_right(distance)
  end
  #--------------------------------------------------------------------------
  # * Scroll Up
  #--------------------------------------------------------------------------
  def scroll_up(distance)
    return if @camera_lock.include?(:y)
    rm_extender_scroll_up(distance)
  end

  #--------------------------------------------------------------------------
  # * Get the map rectangle
  #--------------------------------------------------------------------------
  def scrollable_rect
    Rect.new(0, 0, self.width * 32, self.height * 32)
  end
  #--------------------------------------------------------------------------
  # * Scroll straight towards the given point (x, y)
  #--------------------------------------------------------------------------
  def start_scroll_towards(x, y, nb_steps, easing_function)
    initial = Point.new(@display_x, @display_y, scrollable_rect)
    target  = Point.new(x, y, scrollable_rect)

    return if initial.eql? target

    nb_steps += 1

    if (initial.x == target.x)
      step_variation = Easing.tween(initial.y, target.y,
                                    nb_steps, easing_function)
      @scroll_function = build_scroll_function(target, nb_steps) do |i|
        Point.new(initial.x, step_variation.call(i), scrollable_rect)
      end
    else
      linear_interpolant = Point.linear_interpolant(initial, target)
      direction = (target.x < initial.x) ? -1 : 1
      distance = (initial.x - target.x).abs
      x_step = Easing.tween(0, distance, nb_steps, easing_function)
      x_variation = lambda { |i| initial.x + direction * x_step.call(i) }

      @scroll_function = build_scroll_function(target, nb_steps) do |i|
        x = x_variation.call(i)
        y = linear_interpolant.call(x)
        Point.new(x, y, scrollable_rect)
      end
    end

    @scroll_rest = nb_steps
  end

  def build_scroll_function(target, nb_steps)
    lambda do |nb_steps_still|
      return target if (1 >= nb_steps_still)

      i = nb_steps - nb_steps_still
      p = yield i
      Point.new(p.x % @map.width, p.y % @map.height)
    end
  end

  private :build_scroll_function

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
    @scrolling_activate = (@l_display_y != @display_y) || (@l_display_x != @display_x)
    @l_display_x = @display_x
    @l_display_y = @display_y
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
  # * Event Setup
  #--------------------------------------------------------------------------
  def setup_scroll
    rm_extender_setup_scroll
    @scroll_function = nil
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
  attr_accessor :last_choice
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
  attr_reader :texts, :spritesheets
  #--------------------------------------------------------------------------
  # * Alias
  #--------------------------------------------------------------------------
  alias_method :displaytext_initialize, :initialize
  alias_method :displaytext_update,     :update
  #--------------------------------------------------------------------------
  # * Constructor
  #--------------------------------------------------------------------------
  def initialize
    @texts = Game_Texts.new
    @spritesheets = Game_Spritesheets.new
    displaytext_initialize
  end
  #--------------------------------------------------------------------------
  # * Clear
  #--------------------------------------------------------------------------
  alias_method :displaytext_clear, :clear
  def clear
    displaytext_clear
    clear_texts
    clear_spritesheets
  end
  #--------------------------------------------------------------------------
  # * Clear text
  #--------------------------------------------------------------------------
  def clear_texts
    @texts.each{|t|t.erase}
  end
  #--------------------------------------------------------------------------
  # * Clear Spritesheets
  #--------------------------------------------------------------------------
  def clear_spritesheets
    @spritesheets.each {|picture| picture.erase }
  end
  #--------------------------------------------------------------------------
  # * Frame update
  #--------------------------------------------------------------------------
  def update
    displaytext_update
    update_texts
    update_spritesheets
  end
  #--------------------------------------------------------------------------
  # * Update texts
  #--------------------------------------------------------------------------
  def update_texts
    @texts.each{|t|t.update}
  end
  #--------------------------------------------------------------------------
  # * Update texts
  #--------------------------------------------------------------------------
  def tone_change?
    @tone_duration > 0
  end
  #--------------------------------------------------------------------------
  # * Update Spritesheets
  #--------------------------------------------------------------------------
  def update_spritesheets
    @spritesheets.each {|picture| picture.update }
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
    width, height = widths.max + font.size, heights.max + font.size
    total_height = height * lines.length
    self.bitmap = Bitmap.new(width, total_height)
    self.bitmap.font = font
    iterator = 0
    lines.each do |line|
      self.bitmap.draw_text(0, iterator, width, height, line, 0)
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
    if @text.pinned?
      x_s = 16 * @text.scroll_speed_x
      y_s = 16 * @text.scroll_speed_y
      self.x = @text.x - ($game_map.display_x * x_s)
      self.y = @text.y - ($game_map.display_y * y_s)
    else
      self.x = @text.x
      self.y = @text.y
    end
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
  def move(duration, zoom_x, zoom_y, opacity, tone = nil, ease = :InLinear)
    set_transition('zoom_x',  zoom_x,  duration, ease)
    set_transition('zoom_y',  zoom_y,  duration, ease)
    set_transition('opacity', opacity, duration, ease)
    start_tone_change(tone, duration, ease) if tone.is_a?(Tone)
  end
  #--------------------------------------------------------------------------
  # * Start Changing Color Tone
  #--------------------------------------------------------------------------
  def start_tone_change(tone, duration, ease = :InLinear)
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
  # Returns a fresh picture id
  def fresh_id
    i = @data.find_index {|parallax| !parallax || parallax.name.empty? }
    return (i || @data.length)
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
  # Returns a fresh picture id
  def fresh_id
    i = @data.find_index {|picture| !picture || picture.name.empty? }
    return (i || @data.length)
  end
end

#==============================================================================
# ** Game_Pictures
#------------------------------------------------------------------------------
#  This is a wrapper for a picture array. This class is used within the
# Game_Screen class. Map screen pictures and battle screen pictures are
# handled separately.
#==============================================================================

class Game_Spritesheets
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
    @data[number] ||= Game_Spritesheet.new(number)
  end
  #--------------------------------------------------------------------------
  # * Iterator
  #--------------------------------------------------------------------------
  def each
    @data.compact.each {|picture| yield picture } if block_given?
  end
  #--------------------------------------------------------------------------
  # * Cast to array
  #--------------------------------------------------------------------------
  def to_a
    return @data.compact
  end

  #--------------------------------------------------------------------------
  # * Iterator
  #--------------------------------------------------------------------------
  def fresh_id
    i = @data.find_index {|picture| !picture || picture.name.empty? }
    return (i || @data.length)
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
  def move(origin, x, y, zoom_x, zoom_y, opacity, blend_type, duration, ease=:InLinear)
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
  def start_tone_change(tone, duration, ease=:InLinear)
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
# ** Game_Spritesheet
#------------------------------------------------------------------------------
#  Display spritesheet
#==============================================================================

class Game_Spritesheet < Game_Picture
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader :rows, :columns, :current
  attr_accessor :dirty

  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(number)
    super(number)
    @rows = 1
    @columns = 1
    @current = 0
    @dirty = true
  end

  #--------------------------------------------------------------------------
  # * Get the number of squares
  #--------------------------------------------------------------------------
  def steps
    @columns * @rows
  end

  #--------------------------------------------------------------------------
  # * Get the number of squares
  #--------------------------------------------------------------------------
  def current=(new_value)
    value = (new_value)%steps
    @dirty = @current != value
    @current = value
  end


  #--------------------------------------------------------------------------
  # * Next steps
  #--------------------------------------------------------------------------
  def next
    self.current += 1
  end

  #--------------------------------------------------------------------------
  # * Pred steps
  #--------------------------------------------------------------------------
  def pred
    self.current -= 1
  end

  #--------------------------------------------------------------------------
  # * Set rows
  #--------------------------------------------------------------------------
  def rows=(new_rows)
    @dirty = new_rows != @rows
    @rows = new_rows
    current = 0 if @dirty
  end

  #--------------------------------------------------------------------------
  # * Set columns
  #--------------------------------------------------------------------------
  def columns=(new_columns)
    @dirty = new_columns != @columns
    @columns = new_columns
    current = 0 if @dirty
  end

  #--------------------------------------------------------------------------
  # * Show Picture
  #--------------------------------------------------------------------------
  def show(name, rows, columns, index, origin, x, y, zoom_x, zoom_y, opacity, blend_type)
    super(name, origin, x, y, zoom_x, zoom_y, opacity, blend_type)
    self.rows = rows
    self.columns = columns
    self.current = index
    @dirty = true
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
  attr_accessor :spritesheet_sprites
  attr_accessor :text_sprites
  attr_accessor :character_sprites
  attr_accessor :tilemap
  #--------------------------------------------------------------------------
  # * Constructor
  #--------------------------------------------------------------------------
  def initialize
    create_texts
    create_spritesheets
    rme_initialize
  end
  #--------------------------------------------------------------------------
  # * Create Reflect and shadows
  #--------------------------------------------------------------------------
  def create_effects
    @reflect_sprites = []
    return if not $game_map.use_reflection
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
      id =  [:follower, i]
      push_reflect(id, follower)
      i += 1
    end
    push_reflect(0, $game_player)
  end

  def push_reflect(id, char)
    return unless char
    return if $game_map.reflection_properties[:excluded].include?(id)
    @reflect_sprites.push(
      Sprite_Reflect.new(
        @viewport1,
        char,
        id,
        $game_map.reflection_properties
        )
      )
  end


  #--------------------------------------------------------------------------
  # * Create Character Sprite
  #--------------------------------------------------------------------------
  def create_characters
    rm_extender_create_chars
    @character_sprites.each.with_index do |c, i|
      c.character.sprite_index = i
    end
     create_effects
  end

  #--------------------------------------------------------------------------
  # * Create sprite sheets
  #--------------------------------------------------------------------------
  def create_spritesheets
    @spritesheet_sprites = Array.new
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
    dispose_spritesheets
  end
  #--------------------------------------------------------------------------
  # * Free Picture Spritesheets
  #--------------------------------------------------------------------------
  def dispose_spritesheets
    @spritesheet_sprites.compact.each {|sprite| sprite.dispose }
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
    update_spritesheets
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
  # *Update Picture Spritesheets
  #--------------------------------------------------------------------------
  def update_spritesheets
    $game_map.screen.spritesheets.each do |pic|
      @spritesheet_sprites[pic.number] ||= Sprite_Spritesheet.new(@viewport2, pic)
      @spritesheet_sprites[pic.number].update
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
    return Cache.swap(@picture.name)
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

class Sprite_Spritesheet < Sprite_Picture
  #--------------------------------------------------------------------------
  # * Update Transfer Origin Bitmap
  #--------------------------------------------------------------------------
  def update_bitmap
    if @picture.dirty
      super()
      recompute_bitmap
    end
  end

  #--------------------------------------------------------------------------
  # * Recompute the bitmap
  #--------------------------------------------------------------------------
  def recompute_bitmap
    bmp = swap_cache
    w = bmp.width / @picture.rows
    h = bmp.height / @picture.columns 
    x = @picture.current % @picture.rows * w 
    y = @picture.current / @picture.rows * h
    rect = Rect.new(x, y, w, h)
    self.bitmap = Bitmap.new(w, h)
    self.bitmap.blt(0, 0, bmp, rect, 255)
    bmp.dispose
    @picture.dirty = false
  end
end

#==============================================================================
# ** Spriteset_Weather
#------------------------------------------------------------------------------
#  A class for weather effects (rain, storm, and snow). It is used within the
# Spriteset_Map class.
#==============================================================================

class Spriteset_Weather
  #--------------------------------------------------------------------------
  # * Aliases
  #--------------------------------------------------------------------------
  alias_method :rme_dimness, :dimness
  #--------------------------------------------------------------------------
  # * Get Dimness
  #--------------------------------------------------------------------------
  def dimness
    $game_system.weather_no_dimness ? 0 : rme_dimness
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
    return false unless $game_map.events.has_key?(self.id)
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
    def initialize(x, y, xy, goal = ::Point.new(0,0))
      @goal = goal
      @x, @y, @parent = x, y, xy
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
  def passable?(e, x, y, current, dir, no_through = false)
    if no_through && e.through
      return $game_map.passable?(x, y, dir)
    end
    e.passable?(current.x, current.y, dir)
  end

  #--------------------------------------------------------------------------
  # * Complete passability
  #--------------------------------------------------------------------------
  def check_passability?(event, current, dir, no_through, x, y, cl)
    passable?(event, x, y, current, dir, no_through) && !has_key?(x, y, cl)
  end

  #--------------------------------------------------------------------------
  # * Check closed_list
  #--------------------------------------------------------------------------
  def has_key?(x, y, l)
    l.has_key?(id(x, y))
  end

  #--------------------------------------------------------------------------
  # * Check if unbounded
  #--------------------------------------------------------------------------
  def unbounded?(x, y)
    (x < 0 or x >= $game_map.width) or (y < 0 or y >= $game_map.height)
  end

  #--------------------------------------------------------------------------
  # * Create a path
  #--------------------------------------------------------------------------
  def create_path(goal, event, no_through = false)

    open_list, closed_list = Hash.new, Hash.new
    current = Point.new(event.x, event.y, nil, goal)
    open_list[current.id] = current

    while !has_key?(goal.x, goal.y, closed_list) && !open_list.empty?

      current = open_list.values.min{|point1, point2|point1.f <=> point2.f}
      open_list.delete(current.id)
      closed_list[current.id] = current

      {2 => [0, 1], 4 => [-1, 0], 6 => [1, 0], 8 => [0, -1]}.each do | dir, elt |
        args = current.x + elt[0], current.y + elt[1]
        next if unbounded?(*args)
        if check_passability?(event, current, dir, no_through, *args, closed_list)
          if !has_key?(*args, open_list)
            open_list[id(*args)] = Point.new(*args, current, goal)
          else
            open_list[id(*args)].score(current)
          end
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
    alias_method :rm_extender_init, :init
    alias_method :rm_save_game_without_rescue, :save_game_without_rescue
    #--------------------------------------------------------------------------
    # * Reinitialize the DataManager
    #--------------------------------------------------------------------------
    def init
      rm_extender_init
      Window_Message.line_number = 4
    end
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

    #--------------------------------------------------------------------------
    # * Create Filename
    #     index : File Index
    #--------------------------------------------------------------------------
    def make_filename(index)
      return sprintf("Save%02d.rvdata2", index + 1) if index.is_a?(Fixnum)
      "#{index}.rvdata2"
    end

    #--------------------------------------------------------------------------
    # * Execute Save (No Exception Processing)
    #--------------------------------------------------------------------------
    def save_game_without_rescue(name)
      last_index = @last_savefile_index
      trace = rm_save_game_without_rescue(name)
      @last_savefile_index = last_index unless name.is_a?(Fixnum)
      trace
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
      if !data.activate || !map_exists?(data.map_id) || $BTEST
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

#==============================================================================
# ** RME Commands
#------------------------------------------------------------------------------
#  With :
# Grim (original project)
# xvw
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

  def windowskin_tone(tone = nil)
    $game_system.window_tone = tone if tone
    $game_system.window_tone
  end

  def windowskin_opacity(opacity = nil)
    $game_system.window_opacity = opacity if opacity
    $game_system.window_opacity
  end

  def menu_disabled?
    $game_system.menu_disabled
  end

  def menu_enabled?
    !menu_disabled?
  end

  def save_enabled?
    !save_disabled?
  end

  def save_disabled?
    $game_system.save_disabled
  end

  def encounter_disabled?
    $game_system.encounter_disabled
  end

  def encounter_enabled?
    !encounter_disabled?
  end

  def formation_disabled?
    $game_system.formation_disabled
  end

  def formation_enabled?
    !formation_disabled?
  end


  def max(a, b); [a, b].max; end
  def min(a, b); [a, b].min; end
  def screen; Game_Screen.get; end
  def pictures; screen.pictures; end
  def spritesheets; screen.spritesheets; end
  def scene; SceneManager.scene; end
  def spriteset; scene.spriteset; end
  def tilemap; spriteset.tilemap; end
  def wait(d); d.times { Fiber.yield}; end
  def session_username; USERNAME; end
  def length(a); a.to_a.length; end
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

  def file_exists?(filename)
    File.exists?(filename)
  end

  def file_delete(filename)
    File.delete(filename)
  end

  def file_read(filename)
    begin
      File.open(filename, "r") {|f| f.read}
    rescue
      ""
    end
  end

  def file_write(filename, content)
    File.open(filename, "w") {|f| f.write(content)}
    content
  end

  def file_append(filename, content)
    File.open(filename, "a+") {|f| f.write(content)}
    content
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

  def choice(array, index_if_cancelled, value = nil, face_name = nil, face_index = 0, position = 2, background = 0)
    if value
      if face_name
        $game_message.face_name = face_name
        $game_message.face_index = face_index
      end
      $game_message.position = position
      $game_message.background = background
      $game_message.add(value)
    else
      wait_for_message
    end
    setup_choices([array, index_if_cancelled])
    $game_message.choice_cancel_type = index_if_cancelled
    $game_message.choice_proc = Proc.new {|n| $game_message.last_choice = n+1}
    if value
      wait_for_message
    else
      Fiber.yield while $game_message.choice?
    end
    return $game_message.last_choice
  end

  def last_choice
    $game_message.last_choice
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
        ease = :InLinear
      )
      $game_map.parallaxes[id].move(duration, zoom_x, zoom_y, opacity, tone, ease)
      wait(duration) if wf
    end
    def fresh_parallax_id
      $game_map.parallaxes.fresh_id
    end
    #--------------------------------------------------------------------------
    # * Hide parallax
    #--------------------------------------------------------------------------
    def parallax_erase(id)
      $game_map.parallaxes[id].hide
    end
    def parallax_erased?(id)
      $game_map.parallaxes[id].name.empty?
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
    def parallax_autoscroll_x(id, v, duration = 0, wf = false, ease = :InLinear)
      $game_map.parallaxes[id].set_transition('autospeed_x', v, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Change autospeed_x
    #--------------------------------------------------------------------------
    def parallax_autoscroll_y(id, v, duration = 0, wf = false, ease = :InLinear)
      $game_map.parallaxes[id].set_transition('autospeed_y', v, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Change autospeed
    #--------------------------------------------------------------------------
    def parallax_autoscroll(id, x, y, d = 0, wf = false, ease = :InLinear)
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
    def parallax_zoom_x(id, v, duration = 0, wf = false, ease = :InLinear)
      $game_map.parallaxes[id].set_transition('zoom_x', v, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Change zoom_y
    #--------------------------------------------------------------------------
    def parallax_zoom_y(id, v, duration = 0, wf = false, ease = :InLinear)
      $game_map.parallaxes[id].set_transition('zoom_y', v, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Change zoom
    #--------------------------------------------------------------------------
    def parallax_zoom(id, v, duration = 0, wf = false, ease = :InLinear)
      parallax_zoom_x(id, v, duration, false, ease)
      parallax_zoom_y(id, v, duration, wf, ease)
    end
    #--------------------------------------------------------------------------
    # * Change tone
    #--------------------------------------------------------------------------
    def parallax_tone(id, tone, duration = 0, wf = false, ease = :InLinear)
      $game_map.parallaxes[id].start_tone_change(tone, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Change opacity
    #--------------------------------------------------------------------------
    def parallax_opacity(id, v, duration = 0, wf = false, ease = :InLinear)
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
    def picture_x(id, x=false, duration = 0, wf = false, ease = :InLinear)
      return pictures[id].x unless x
      pictures[id].set_transition('x', x, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Modify y position
    #--------------------------------------------------------------------------
    def picture_y(id, y=false, duration = 0, wf = false, ease = :InLinear)
      return pictures[id].y unless y
      pictures[id].set_transition('y', y, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Modify position
    #--------------------------------------------------------------------------
    def picture_position(ids, x, y, duration = 0, wf = false, ease = :InLinear)
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
    def picture_move(ids, x, y, zoom_x, zoom_y, dur, wf = true, opacity = -1, bt = -1, o = -1, ease = :InLinear)
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
    def picture_angle(id, angle=false, duration = 0, wf = false, ease = :InLinear)
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
    def picture_zoom_x(id, zoom_x=false, duration = 0, wf = false, ease = :InLinear)
      return pictures[id].zoom_x unless zoom_x
      pictures[id].set_transition('zoom_x', zoom_x, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * change Zoom Y
    #--------------------------------------------------------------------------
    def picture_zoom_y(id, zoom_y=false, duration = 0, wf = false, ease = :InLinear)
      return pictures[id].zoom_y unless zoom_y
      pictures[id].set_transition('zoom_y', zoom_y, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * change Zoom
    #--------------------------------------------------------------------------
    def picture_zoom(ids, zoom_x, zoom_y = false, duration = 0, wf = false, ease = :InLinear)
      zoom_y ||= zoom_x
      select_pictures(ids).each do |id|
        picture_zoom_x(id, zoom_x, duration, false, ease)
        picture_zoom_y(id, zoom_y, duration, false, ease)
      end
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * change Tone
    #--------------------------------------------------------------------------
    def picture_tone(id, tone, d = 0, wf = false, ease = :InLinear)
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

    def fresh_picture_id
      pictures.fresh_id
    end


    #--------------------------------------------------------------------------
    # * Change Picture Opacity
    #--------------------------------------------------------------------------
    def picture_opacity(ids, value, duration = 0, wf = false, ease = :InLinear)
      select_pictures(ids).each do |id|
        pictures[id].set_transition('opacity', value, duration, ease)
      end
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Shake the picture
    #--------------------------------------------------------------------------
    def picture_shake(ids, power, speed, duration)
      select_pictures(ids).each do |id|
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
    def picture_width(id, v = nil, duration = 0, wf = false, ease = :InLinear)
      pict = pictures[id]
      unless v
        return 0 if !pict || pict.name.empty?
        bmp = Cache.swap(pict.name)
        return (((bmp.width * pict.zoom_x))/100.0).to_i
      end
      zoom = Command.percent(v, picture_width(id))
      picture_zoom_x(id, zoom, duration, wf, ease)
    end

    #--------------------------------------------------------------------------
    # * Get pictures dimension
    #--------------------------------------------------------------------------
    def picture_height(id, v = nil, duration = 0, wf = false, ease = :InLinear)
      pict = pictures[id]
      unless v
        return 0 if !pict || pict.name.empty?
        bmp = Cache.swap(pict.name)
        return (((bmp.height * pict.zoom_y))/100.0).to_i
      end
      zoom = Command.percent(v, picture_height(id))
      picture_zoom_y(id, zoom, duration, wf, ease)
    end

    #--------------------------------------------------------------------------
    # * set pictures dimension
    #--------------------------------------------------------------------------
    def picture_dimension(id, w, h, duration = 0, wf = false, ease = :InLinear)
      picture_width(id, w, duration, false, ease)
      picture_height(id, h, duration, wf, ease)
    end


    # Fix for EE4
    alias_method :picture_origine, :picture_origin
    alias_method :picture_detach, :picture_unpin

    append_commands
  end

  #==============================================================================
  # ** Commands Spritesheets
  #------------------------------------------------------------------------------
  #  Spritesheets management
  #==============================================================================
  module Spritesheets

    #--------------------------------------------------------------------------
    # * Sprite picture
    #--------------------------------------------------------------------------
    def sprite_spritesheet(id)
      spriteset.spritesheet_sprites[id]
    end

    def spritesheet_show(id, n, row, cell, index=0, x=0, y=0, ori=0,  z_x=100, z_y=100, op=255, bl=0)
      spritesheets[id].show(n, row, cell, index, ori, x, y, z_x, z_y, op, bl)
    end

    def spritesheet_show_face(id, n, index=0, x=0, y=0, ori=0,  z_x=100, z_y=100, op=255, bl=0)
      name = "Faces/" + n
      spritesheet_show(id, name, 4, 2, index, ori, x, y, z_x, z_y, op, bl)
    end

    def spritesheet_show_icon(id, index=0, x=0, y=0, ori=0,  z_x=100, z_y=100, op=255, bl=0)
      name = "System/iconSet"
      spritesheet_show(id, name, 16, 39, index, ori, x, y, z_x, z_y, op, bl)
    end

    def spritesheet_show_balloon(id, index=0, x=0, y=0, ori=0,  z_x=100, z_y=100, op=255, bl=0)
      name = "System/Balloon"
      spritesheet_show(id, name, 8, 10, index, ori, x, y, z_x, z_y, op, bl)
    end

    def spritesheet_show_character(id, n, index=0, x=0, y=0, ori=0,  z_x=100, z_y=100, op=255, bl=0)
      name = "Characters/" + n
      sign = n[/^[\!\$]./]
      row = 12
      cell = 8
      if sign && sign.include?('$')
        row = 3
        cell = 4
      end
      spritesheet_show(id, name, row, cell, index, ori, x, y, z_x, z_y, op, bl)
    end

    def spritesheet_next(id)
      spritesheets[id].next
    end

    def spritesheet_pred(id)
      spritesheets[id].pred
    end

    def spritesheet_index(id, new_index = nil)
      spritesheets[id].current = new_index if new_index
      spritesheets[id].current
    end

    def spritesheet_steps(id)
      spritesheets[id].steps
    end

    def spritesheet_rows(id, new_rows = nil)
      if new_rows
        spritesheets[id].rows = new_rows 
        spritesheet_index(0)
      end
      spritesheets[id].rows
    end

    def spritesheet_columns(id, new_columns = nil)
      if new_columns
        spritesheets[id].columns = new_columns 
        spritesheet_index(id, 0)
      end
      spritesheets[id].columns
    end

    #--------------------------------------------------------------------------
    # * Spritesheet erase
    #--------------------------------------------------------------------------
    def spritesheet_erase(ids)
      ids = select_spritesheets(ids)
      ids.each {|id| spritesheets[id].erase}
    end
    #--------------------------------------------------------------------------
    # * Spritesheet name
    #--------------------------------------------------------------------------
    def spritesheet_name(id, name = nil)
      return spritesheets[id].name unless name
      spritesheets[id].name = name
    end
    #--------------------------------------------------------------------------
    # * Modify Origin
    # Origin : 0 | 1 (0 = Corner High Left, 1 = Center)
    #--------------------------------------------------------------------------
    def spritesheet_origin(id, *origin)
      origin = origin[0] if origin.length == 1
      spritesheets[id].origin = origin
    end
    #--------------------------------------------------------------------------
    # * Modify x position
    #--------------------------------------------------------------------------
    def spritesheet_x(id, x=false, duration = 0, wf = false, ease = :InLinear)
      return spritesheets[id].x unless x
      spritesheets[id].set_transition('x', x, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Modify y position
    #--------------------------------------------------------------------------
    def spritesheet_y(id, y=false, duration = 0, wf = false, ease = :InLinear)
      return spritesheets[id].y unless y
      spritesheets[id].set_transition('y', y, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Modify position
    #--------------------------------------------------------------------------
    def spritesheet_position(ids, x, y, duration = 0, wf = false, ease = :InLinear)
      ids = select_spritesheets(ids)
      ids.each do |id|
        spritesheet_x(id, x, duration, false, ease)
        spritesheet_y(id, y, duration, false, ease)
      end
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Move picture
    #--------------------------------------------------------------------------
    def spritesheet_move(ids, x, y, zoom_x, zoom_y, dur, wf = true, opacity = -1, bt = -1, o = -1, ease = :InLinear)
      ids = select_spritesheets(ids)
      ids.each do |id|
        p = spritesheets[id]
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
    def spritesheet_wave(ids, amp, speed)
      ids = select_spritesheets(ids)
      ids.each do |id|
        spritesheets[id].wave_amp = amp
        spritesheets[id].wave_speed = speed
      end
    end
    #--------------------------------------------------------------------------
    # * Apply Mirror
    #--------------------------------------------------------------------------
    def spritesheet_flip(ids)
      ids = select_spritesheets(ids)
      ids.each do |id|
        spritesheets[id].mirror = !spritesheets[id].mirror
      end
    end
    #--------------------------------------------------------------------------
    # * Modify Angle
    #--------------------------------------------------------------------------
    def spritesheet_angle(id, angle=false, duration = 0, wf = false, ease = :InLinear)
      return spritesheets[id].angle unless angle
      spritesheets[id].set_transition('angle', angle, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Rotate
    #--------------------------------------------------------------------------
    def spritesheet_rotate(ids, speed)
      ids = select_spritesheets(ids)
      ids.each do |id|
        spritesheets[id].rotate(speed)
      end
    end
    #--------------------------------------------------------------------------
    # * change Zoom X
    #--------------------------------------------------------------------------
    def spritesheet_zoom_x(id, zoom_x=false, duration = 0, wf = false, ease = :InLinear)
      return spritesheets[id].zoom_x unless zoom_x
      spritesheets[id].set_transition('zoom_x', zoom_x, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * change Zoom Y
    #--------------------------------------------------------------------------
    def spritesheet_zoom_y(id, zoom_y=false, duration = 0, wf = false, ease = :InLinear)
      return spritesheets[id].zoom_y unless zoom_y
      spritesheets[id].set_transition('zoom_y', zoom_y, duration, ease)
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * change Zoom
    #--------------------------------------------------------------------------
    def spritesheet_zoom(ids, zoom_x, zoom_y = false, duration = 0, wf = false, ease = :InLinear)
      zoom_y ||= zoom_x
      select_spritesheets(ids).each do |id|
        spritesheet_zoom_x(id, zoom_x, duration, false, ease)
        spritesheet_zoom_y(id, zoom_y, duration, false, ease)
      end
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * change Tone
    #--------------------------------------------------------------------------
    def spritesheet_tone(id, tone, d = 0, wf = false, ease = :InLinear)
      if d.is_a?(Fixnum)
        spritesheets[id].start_tone_change(tone, d, ease)
        wait(d) if wf
      else
        spritesheets[id].tone = tone
      end
    end
    #--------------------------------------------------------------------------
    # * Change blend type
    #--------------------------------------------------------------------------
    def spritesheet_blend(ids, blend)
      select_spritesheets(ids).each {|id| spritesheets[id].blend = blend }
    end
    #--------------------------------------------------------------------------
    # * Pin spritesheet on the map
    #--------------------------------------------------------------------------
    def spritesheet_pin(ids, x=nil, y=nil)
      select_spritesheets(ids).each do |id|
        unless x
          x_s = 16 * spritesheets[id].scroll_speed_x
          y_s = 16 * spritesheets[id].scroll_speed_y
          x = spritesheet_x(id) + $game_map.display_x * x_s + spritesheets[id].shake
          y = spritesheet_y(id) + $game_map.display_y * y_s
        end
        spritesheet_x(id, x)
        spritesheet_y(id, y)
        spritesheets[id].pin
      end
    end
    #--------------------------------------------------------------------------
    # * Unpin spritesheet on the map
    #--------------------------------------------------------------------------
    def spritesheet_unpin(ids)
      select_spritesheets(ids).each {|id| spritesheets[id].unpin }
    end

    #--------------------------------------------------------------------------
    # * Check if a spritesheet is in movement
    #--------------------------------------------------------------------------
    def spritesheet_move?(id)
      spritesheets[id].move?
    end

    def spritesheet_erased?(id)
      spritesheets[id].name.empty?
    end

    def spritesheet_showed?(id)
      !spritesheet_erased?(id)
    end

    def fresh_spritesheet_id
      spritesheets.fresh_id
    end


    #--------------------------------------------------------------------------
    # * Change spritesheet Opacity
    #--------------------------------------------------------------------------
    def spritesheet_opacity(ids, value, duration = 0, wf = false, ease = :InLinear)
      select_spritesheets(ids).each do |id|
        spritesheets[id].set_transition('opacity', value, duration, ease)
      end
      wait(duration) if wf
    end
    #--------------------------------------------------------------------------
    # * Shake the spritesheet
    #--------------------------------------------------------------------------
    def spritesheet_shake(ids, power, speed, duration)
      select_spritesheets(ids).each do |id|
        spritesheets[id].start_shake(power, speed, duration)
      end
    end
    #--------------------------------------------------------------------------
    # * Point in spritesheet
    #--------------------------------------------------------------------------
    def pixel_in_spritesheet?(id, x, y, precise = false)
      spr = sprite_spritesheet(id)
      return false unless spr
      precise ? spr.precise_in?(x, y) : spr.in?(x, y)
    end
    def spritesheet_mouse_hover?(id, precise = false)
      pixel_in_spritesheet?(id, Mouse.x, Mouse.y, precise)
    end
    def spritesheet_mouse_click?(id, precise = false)
      spritesheet_mouse_hover?(id, precise) && Mouse.click?
    end
    def spritesheet_mouse_press?(id, key = :mouse_left, precise = false)
      spritesheet_mouse_hover?(id, precise) && Mouse.press?(key)
    end
    def spritesheet_mouse_trigger?(id, key = :mouse_left, precise = false)
      spritesheet_mouse_hover?(id, precise) && Mouse.trigger?(key)
    end
    def spritesheet_mouse_repeat?(id, key = :mouse_left, precise = false)
      spritesheet_mouse_hover?(id, precise) && Mouse.repeat?(key)
    end
    def spritesheet_mouse_release?(id, key = :mouse_left, precise = false)
      spritesheet_mouse_hover?(id, precise) && Mouse.release?(key)
    end
    #--------------------------------------------------------------------------
    # * spritesheet collisions
    #--------------------------------------------------------------------------
    def spritesheets_collide?(a, b)
      spr_a = sprite_spritesheet(a)
      spr_b = sprite_spritesheet(b)
      return if (!spr_a) || (!spr_b)
      spr_a.collide_with?(spr_b)
    end
    #--------------------------------------------------------------------------
    # * spritesheet collisions (perfect pixel)
    #--------------------------------------------------------------------------
    def spritesheets_perfect_collide?(a, b)
      spr_a = sprite_spritesheet(a)
      spr_b = sprite_spritesheet(b)
      return if (!spr_a) || (!spr_b)
      spr_a.pixel_collide_with(spr_b)
    end
    #--------------------------------------------------------------------------
    # * Change scroll speed (in X)
    #--------------------------------------------------------------------------
    def spritesheet_scroll_x(ids, speed = nil)
      return spritesheets[ids].scroll_speed_x unless speed
      select_spritesheets(ids).each {|id| spritesheets[id].scroll_speed_x = speed}
    end
    #--------------------------------------------------------------------------
    # * Change scroll speed (in Y)
    #--------------------------------------------------------------------------
    def spritesheet_scroll_y(ids, speed = nil)
    return spritesheets[ids].scroll_speed_y unless speed
      select_spritesheets(ids).each {|id| spritesheets[id].scroll_speed_y = speed}
    end
    #--------------------------------------------------------------------------
    # * Change scroll speed
    #--------------------------------------------------------------------------
    def spritesheet_scroll(ids, speed)
      select_spritesheets(ids).each do |id|
        spritesheet_scroll_x(id, speed)
        spritesheet_scroll_y(id, speed)
      end
    end
    #--------------------------------------------------------------------------
    # * Clear all spritesheets
    #--------------------------------------------------------------------------
    def spritesheets_clear
      screen.clear_spritesheets
    end

    #--------------------------------------------------------------------------
    # * Get pictures dimension
    #--------------------------------------------------------------------------
    def spritesheet_width(id, v = nil, duration = 0, wf = false, ease = :InLinear)
      pict = spritesheets[id]
      unless v
        return 0 if !pict || pict.name.empty?
        bmp = Cache.swap(pict.name)
        return (((bmp.width * pict.zoom_x))/100.0).to_i
      end
      zoom = Command.percent(v, spritesheet_width(id))
      spritesheet_zoom_x(id, zoom, duration, wf, ease)
    end

    #--------------------------------------------------------------------------
    # * Get spritesheets dimension
    #--------------------------------------------------------------------------
    def spritesheet_height(id, v = nil, duration = 0, wf = false, ease = :InLinear)
      pict = spritesheets[id]
      unless v
        return 0 if !pict || pict.name.empty?
        bmp = Cache.swap(pict.name)
        return (((bmp.height * pict.zoom_y))/100.0).to_i
      end
      zoom = Command.percent(v, spritesheet_height(id))
      spritesheet_zoom_y(id, zoom, duration, wf, ease)
    end

    #--------------------------------------------------------------------------
    # * set spritesheets dimension
    #--------------------------------------------------------------------------
    def spritesheet_dimension(id, w, h, duration = 0, wf = false, ease = :InLinear)
      spritesheet_width(id, w, duration, false, ease)
      spritesheet_height(id, h, duration, wf, ease)
    end

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
      RME::deprecated_command("id_at", "use 'event_at'")
      event_at(x, y)
    end
    #--------------------------------------------------------------------------
    # * Get Event Id form coords
    #--------------------------------------------------------------------------
    def event_at(x, y)
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
    
    def boat_passable?(x, y)
      $game_map.boat_passable?(x, y)
    end
    
    def ship_passable?(x, y)
      $game_map.ship_passable?(x, y)
    end
   
    def autotile_type(x, y, z)
      $game_map.autotile_type(x, y, z)
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

    def use_reflection(properties = nil)
      $game_map.use_reflection = true
      return unless properties && properties.is_a?(Hash)
      $game_map.reflection_properties = properties
      $game_map.reflection_properties[:excluded] ||= []
      $game_map.reflection_properties[:wave_amp] ||= 0
      $game_map.reflection_properties[:wave_speed] ||= 360
      $game_map.reflection_properties[:opacity] ||= 255
      $game_map.reflection_properties[:tone] ||= Tone.new(0, 0, 0, 0)
      $game_map.reflection_properties[:terrains] ||= {}
      $game_map.reflection_properties[:regions] ||= {}
    end

    def create_light_emitters(hash)
      hash.each do |key, value|
        event(id).light_emitter = Light_Emitter.new(
          value[:rayon],
          value[:intensity],
          value[:excluded] || [],
          value[:fx] || {}
        )
      end
      $game_map.need_refresh = true
      SceneManager.scene.refresh_spriteset
    end

    #--------------------------------------------------------------------------
    # * Disable dimness on weather
    #--------------------------------------------------------------------------
    def disable_weather_dimness
      $game_system.weather_no_dimness = true
    end

    #--------------------------------------------------------------------------
    # * Enable dimness on weather
    #--------------------------------------------------------------------------
    def enable_weather_dimness
      $game_system.weather_no_dimness = false
    end

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
      $game_system.flashed_data[$game_map.map_id] = tilemap.flash_data
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
    def mouse_moving?;      Mouse.moving?;                  end
    def click_time(k);      Mouse.time(k);                  end
    def mouse_in?(rect);    Mouse.in?(rect);                end
    def mouse_current_key(*m)   Mouse.current_key(*m);      end
    def cursor_system(b)
      flag = (!!b) ? 1 : 0
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
    def team_members; $game_party.members.map(&:id); end
    def team_member(pos); $game_party.members[pos - 1].id; end
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
    def use_item(item_id, actor_id)
      return false unless test_item(item_id, actor_id)
      item = $data_items[item_id]
      user = $game_party.movable_members.max_by {|member| member.pha }
      target = $game_actors[actor_id]
      return false unless item && user && target

      user.use_item(item)
      item.repeats.times { target.item_apply(user, item) }
      true
    end
    def test_item(item_id, actor_id)
      item = $data_items[item_id]
      user = $game_party.movable_members.max_by {|member| member.pha }
      target = $game_actors[actor_id]

      target.item_test(user, item)
    end

    def items_possessed
      $game_party.items.map {|i| [i.id] * $game_party.item_number(i)}.flatten
    end
    def armors_possessed
      $game_party.armors.map {|i| [i.id] * $game_party.item_number(i)}.flatten
    end
    def weapons_possessed
      $game_party.weapons.map {|i| [i.id] * $game_party.item_number(i)}.flatten
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

    def last_used_item(); $game_temp.last_used_item; end

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
    def event_change_character(id, character_name, character_index)
      event(id).set_graphic(character_name, character_index)
    end
    def event_character_name(id); event(id).character_name; end
    def event_character_index(id); event(id).character_index; end
    def current_event_id; me; end
    def me; Game_Interpreter.current_id; end
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

    def dash_activate?
      $game_map.can_dash
    end

    def dash_deactivate?
      !dash_activate
    end

    def dash_activation(flag)
      $game_map.can_dash = !!flag
    end

    def dash_activate
      dash_activation(true)
    end

    def dash_deactivate
      dash_activation(false)
    end

    def event_flash(id, _color, duration)
      color = _color.is_a?(String) ? get_color(_color) : _color
      event(id).k_sprite.flash(color, duration)
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
      return true if event1.x == event2.x && event1.y == event2.y
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

    def event_width(id) 
      character = event_character_name(id)
      width = character_width(character)
      coeff = event_zoom_x(id)
      (width * (coeff / 100.0)).to_i
    end

    def event_height(id) 
      character = event_character_name(id)
      height = character_height(character)
      coeff = event_zoom_y(id)
      (height * (coeff / 100.0)).to_i
    end

    def player_width
      event_width(0)
    end

    def player_height
      event_height(0)
    end

    def character_width(name) 
      real_name = "Characters/" + name
      bmp = Cache.swap(real_name)
      sign = name[/^[\!\$]./]
      row = 12
      row = 3 if sign && sign.include?('$')
      w = bmp.width / row 
      w
    end

    def character_height(name) 
      real_name = "Characters/" + name
      bmp = Cache.swap(real_name)
      sign = name[/^[\!\$]./]
      row = 8
      row = 4 if sign && sign.include?('$')
      h = bmp.height / row 
      h
    end

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
      return event(ids).priority_type if !priority && ids.is_a?(Fixnum)
      select_events(ids).not(0).each do |id_event|
      event(id_event).priority_type = priority
    end
    end

    def event_trigger(ids, trigger = nil)
      return event(ids).trigger if !trigger && ids.is_a?(Fixnum)
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

    def player_teleport(map_id, x, y, direction = nil, fade_type = 0)
      direction ||= $game_player.direction
      $game_player.reserve_transfer(map_id, x, y, direction)
      $game_temp.fade_type = fade_type
      Fiber.yield while $game_player.transfer?
    end

    def player_teleport_with_transition(map_id, x, y, transition, duration, vague=40, direction = nil)
      direction ||= $game_player.direction
      Graphics.freeze
      $game_player.reserve_transfer(map_id, x, y, direction)
      wait(1)
      Graphics.transition(duration, "Graphics/#{transition}", vague)
    end

    def perform_transition(duration, transition, before, during, after, vague = 40)
      Graphics.freeze
      before.()
      wait(1)
      during.()
      Graphics.transition(duration, "Graphics/#{transition}", vague)
      after.()
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

    #--------------------------------------------------------------------------
    # * change Tone
    #--------------------------------------------------------------------------
    def event_tone(ids, tone, d = 0, wf = false, ease = :InLinear)
      select_events(ids).each do |id_event|
        event(id_event).start_tone_change(tone, d, ease)
      end
      if d.is_a?(Fixnum) && wf
        wait(d)
      end
    end

    def player_tone(tone, d = 0, wf = false, ease = :InLinear)
      event_tone(0, tone, d, wf, ease)
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

    def event_jump(id, x_plus, y_plus)
      event(id).jump(x_plus, y_plus)
    end

    def player_jump(x_plus, y_plus)
      event_jump(0, x_plus, y_plus)
    end

    def event_jump_x(id, x_plus)
      event_jump(id, x_plus, 0)
    end

    def event_jump_y(id, y_plus)
      event_jump(id, 0, y_plus)
    end

    def player_jump_x(x_plus)
      event_jump(0, x_plus, 0)
    end

    def player_jump_y(y_plus)
      event_jump(0, 0, y_plus)
    end

    def event_move_to(id, x, y, w=false, no_t = false)
      event(id).move_to_position(x, y, w, no_t)
    end

    def player_move_to(x, y, w=false, no_t = false)
      event(0).move_to_position(x, y, w, no_t)
    end

    def event_partial_move_to(id, x, y, st, w=false, no_t = false)
      event(id).partial_move_to_position(x, y, st, w, no_t)
    end

    def player_partial_move_to(x, y, st, w=false, no_t = false)
      event(0).partial_move_to_position(x, y, st, w, no_t)
    end

    def event_jump_to(id, x, y, w=true)
      event(id).jump_to(x, y, w)
    end

    def player_jump_to(x, y, w=true)
      event(0).jump_to(x, y, w)
    end


    #--------------------------------------------------------------------------
    # * Move event to x, y coords
    #--------------------------------------------------------------------------
    def move_to(id, x, y, w=false, no_t = false)
      RME::deprecated_command("move_to", "use 'event_move_to' or 'player_move_to'")
      event(id).move_to_position(x, y, w, no_t)
    end
    #--------------------------------------------------------------------------
    # * Jump event to x, y coords
    #--------------------------------------------------------------------------
    def jump_to(id, x, y, w=true)
      RME::deprecated_command("jump_to", "use 'event_jump_to' or 'player_jump_to'")
      event(id).jump_to(x, y, w)
    end


    #--------------------------------------------------------------------------
    # * Start an event
    #--------------------------------------------------------------------------
    def event_start(id)
      event(id).start
    end

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
    # * Get a fresh text ID
    #--------------------------------------------------------------------------
    def fresh_text_id
      Game_Screen.get.texts.fresh_id
    end

    #--------------------------------------------------------------------------
    # * Change text scroll speed
    #--------------------------------------------------------------------------
    def text_scroll_x(id, value = nil)
      Game_Screen.get.texts[id].scroll_speed_x = value if value
      Game_Screen.get.texts[id].scroll_speed_x
    end

    #--------------------------------------------------------------------------
    # * Change text scroll speed
    #--------------------------------------------------------------------------
    def text_scroll_y(id, value = nil)
      Game_Screen.get.texts[id].scroll_speed_y = value if value
      Game_Screen.get.texts[id].scroll_speed_y
    end

    #--------------------------------------------------------------------------
    # * Change text scroll speed
    #--------------------------------------------------------------------------
    def text_scroll(id, xvalue, yvalue = xvalue)
      yvalue ||= xvalue
      text_scroll_speed_x(id, xvalue)
      text_scroll_speed_y(id, yvalue)
    end

    #--------------------------------------------------------------------------
    # * Pin text
    #--------------------------------------------------------------------------
    def text_pin(id, x = nil, y = nil)
      text =  Game_Screen.get.texts[id]
      unless x
        x_s = 16 * text.scroll_speed_x
        x = text_x(id) + $game_map.display_x * x_s
      end
      unless y
        y_s = 16 * text.scroll_speed_y
        y = text_y(id) + $game_map.display_y * y_s
      end
      text_x(id, x)
      text_y(id, y)
      text.pin = true
    end

    def text_unpin(id)
      Game_Screen.get.texts[id].pin = false
    end

    def text_pinned?(id)
      Game_Screen.get.texts[id].pin
    end

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
    # * Point in text
    #--------------------------------------------------------------------------
    def pixel_in_text?(id, x, y, precise = false)
      spr = spriteset.text_sprites[id]
      return false unless spr
      precise ? spr.precise_in?(x, y) : spr.in?(x, y)
    end
    def text_mouse_hover?(id, precise = false)
      pixel_in_text?(id, Mouse.x, Mouse.y, precise)
    end
    def text_mouse_click?(id, precise = false)
      text_mouse_hover?(id, precise) && Mouse.click?
    end
    def text_mouse_press?(id, key = :mouse_left, precise = false)
      text_mouse_hover?(id, precise) && Mouse.press?(key)
    end
    def text_mouse_trigger?(id, key = :mouse_left, precise = false)
      text_mouse_hover?(id, precise) && Mouse.trigger?(key)
    end
    def text_mouse_repeat?(id, key = :mouse_left, precise = false)
      text_mouse_hover?(id, precise) && Mouse.repeat?(key)
    end
    def text_mouse_release?(id, key = :mouse_left, precise = false)
      text_mouse_hover?(id, precise) && Mouse.release?(key)
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

    def save_game_with_free_name(name)
      DataManager.save_game(name)
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
    # * Load Game
    #--------------------------------------------------------------------------
    def load_game_with_free_name(name, time=100)
      DataManager.load_game(name)
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

    def import_variable_with_free_name(ids, idvar); DataManager.export(ids)[:variables][idvar]; end
    def import_switch_with_free_name(ids, idswitch); DataManager.export(ids)[:switches][idswitch]; end
    def import_label_with_free_name(ids, idlabel); DataManager.export(ids)[:labels][idlabel]; end

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

    POSITION = {
      :centered        => lambda { |x, y| [center_x(x), center_y(y)] },
      :centered_left   => lambda { |x, y| [left_x(x), center_y(y)] },
      :centered_right  => lambda { |x, y| [right_x(x), center_y(y)] },
      :centered_top    => lambda { |x, y| [center_x(x), top_y(y)] },
      :centered_bottom => lambda { |x, y| [center_x(x), bottom_y(y)] },
      :top_left        => lambda { |x, y| [left_x(x), top_y(y)] },
      :top_right       => lambda { |x, y| [right_x(x), top_y(y)] },
      :bottom_left     => lambda { |x, y| [left_x(x), bottom_y(y)] },
      :bottom_right    => lambda { |x, y| [right_x(x), bottom_y(y)] }
    }

    def self.limit_within_range(x, min, max)
      min if (x < min)
      max if (x > max)
      x
    end

    def self.left_x(x); limit_within_range(x, 0, $game_map.width); end
    def self.center_x(x); limit_within_range(x - CENTER_X, 0, $game_map.width); end
    def self.right_x(x); limit_within_range(x - 2 * CENTER_X, 0, $game_map.width); end

    def self.top_y(y); limit_within_range(y, 0, $game_map.height); end
    def self.center_y(y); limit_within_range(y - CENTER_Y, 0, $game_map.height); end
    def self.bottom_y(y); limit_within_range(y - 2 * CENTER_Y, 0, $game_map.height); end

    private_class_method :left_x, :center_x, :right_x,
                         :top_y, :center_y, :bottom_y,
                         :limit_within_range

    def camera_scroll(direction, distance, speed)
      Fiber.yield while $game_map.scrolling?
      $game_map.start_scroll(direction, distance, speed)
    end

    def camera_scroll_towards(x, y, nb_steps, easing = :InLinear, position = :centered)
      Fiber.yield while $game_map.scrolling?
      $game_map.start_scroll_towards(*POSITION[position].call(x, y),
                                     nb_steps,
                                     Easing::FUNCTIONS[easing])
    end

    def camera_scroll_towards_event(id, nb_steps, easing = :InLinear, position = :centered)
      camera_scroll_towards(event_x(id), event_y(id), nb_steps, easing, position)
    end

    def camera_scroll_towards_player(nb_steps, easing = :InLinear, position = :centered)
      camera_scroll_towards(player_x, player_y, nb_steps, easing, position)
    end

    def camera_move_on(x, y)
      $game_map.set_display_pos(x-CENTER_X, y-CENTER_Y)
    end

    def camera_scrolling?
      $game_map.scrolling? || $game_map.scrolling_activate
    end

    def camera_scroll_on(x, y, speed)
      camera_scroll(((dx = $game_map.display_x) > x)?4:6, (dx-x).abs-CENTER_X, speed)
      camera_scroll(((dy = $game_map.display_y) > y)?8:2, (dy-y).abs-CENTER_Y, speed)
    end

    def camera_lock; $game_map.target_camera = nil; end
    def camera_unlock; $game_map.target_camera = $game_player; end
    def camera_locked?; $game_map.target_camera.nil?; end

    def camera_lock_x; $game_map.camera_lock << :x; end
    def camera_unlock_x; $game_map.camera_lock.delete(:x); end
    def camera_x_locked?; $game_map.camera_lock.include?(:x); end

    def camera_lock_y; $game_map.camera_lock << :y; end
    def camera_unlock_y; $game_map.camera_lock.delete(:y); end
    def camera_y_locked?; $game_map.camera_lock.include?(:y); end

    def camera_change_focus(event_id)
      e = event(event_id)
      camera_move_on(e.x, e.y)
      $game_map.target_camera = e
    end

    def camera_zoom(zoom, duration = 0, wait_flag = false, ease = :InLinear)
      Graphics.screen.set_transition('zoom', zoom, duration, ease)
      wait(duration) if wait_flag
    end
    def camera_motion_blur(v, duration = 0, wait_flag = false, ease = :InLinear)
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

    def screen_pixelation(v, duration = 0, wait_flag = false, ease = :InLinear)
      Graphics.screen.set_transition('pixelation', v, duration, ease)
      wait(duration) if wait_flag
    end
    def screen_blur(v, duration = 0, wait_flag = false, ease = :InLinear)
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

    def window_closed?(id)
      return false unless window_exists?(id)
      SceneManager.scene.windows[id].close?
    end

    def window_opened?(id)
      return false unless window_exists?(id)
      SceneManager.scene.windows[id].open?
    end

    def window_exists?(id)
      SceneManager.scene.windows[id].to_bool
    end

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

    #--------------------------------------------------------------------------
    # * Point in window
    #--------------------------------------------------------------------------

    def mouse_hover_window?(id)
      SceneManager.scene.windows[id].mouse_hover? if SceneManager.scene.windows[id]
    end

    append_commands
  end

end

#==============================================================================
# ** RME Tools
#------------------------------------------------------------------------------
#  With :
# xvw
# Joke
#------------------------------------------------------------------------------
#  Gui-based tools for users (command-tester, tone-tester...)
#==============================================================================

#==============================================================================
# ** Scene_Map
#------------------------------------------------------------------------------
#  This class performs the map screen processing.
#==============================================================================

class Scene_Map

  alias_method :tools_update, :update

  def update
    tools_update
    update_tools if $TEST
  end

  def eval_disposed?; !@eval || @eval.disposed?; end 
  def tone_disposed?; !@tone || @tone.disposed?; end

  def dispose_eval
    @eval.dispose
    Game_Temp.in_game = true
    @eval = nil 
    sleep(0.3)
    $game_system.menu_disabled = @old_call_menu
  end

  def dispose_tone 
    @tone.dispose
    Game_Temp.in_game = true
    @tone = nil 
    sleep(0.3)
    $game_system.menu_disabled = @old_call_menu
  end

  def update_tone
    @tone.update if @tone
  end 

  def update_eval
    @eval.update if @eval
  end

  def can_launch?(key)
    tone_disposed? && eval_disposed? && Keyboard.trigger?(key)
  end

  def can_launch_tone?
    can_launch?(RME::Config::KEY_TONE)
  end

  def can_launch_eval?
    can_launch?(RME::Config::KEY_EVAL)
  end

  def must_dispose_tone?
    !tone_disposed? && (Keyboard.trigger?(RME::Config::KEY_TONE) || Keyboard.trigger?(:esc))
  end

  def must_dispose_eval?
    !eval_disposed? && (
      Keyboard.trigger?(RME::Config::KEY_EVAL) || Keyboard.trigger?(:esc)
      ) && ! @eval.in_completion?
  end


  def update_tools
    update_tone
    update_eval
    if can_launch_eval? 
      @old_call_menu = $game_system.menu_disabled
      $game_system.menu_disabled = true
      @eval = Graphical_Eval.new
    elsif can_launch_tone?
      @old_call_menu = $game_system.menu_disabled
      $game_system.menu_disabled = true
      @tone = Graphical_Tone.new
    elsif must_dispose_eval?
      dispose_eval
    elsif must_dispose_tone?
      dispose_tone   
    end
  end
end

#==============================================================================
# ** Graphical_tone
#------------------------------------------------------------------------------
#  Provide a Tone tester
#==============================================================================

class Graphical_Tone 

  #--------------------------------------------------------------------------
  # * Init fonts
  #--------------------------------------------------------------------------
  def init_fonts
    @font = Font.new("Arial")
    @font.color = Color.new(0, 0, 0)
    @font.size = 10
    @font.shadow = false 
    @font.bold = false
    @font.outline = false
  end

  #--------------------------------------------------------------------------
  # * Build Object
  #--------------------------------------------------------------------------
  def initialize
    init_fonts
    @changing = false
    @last_y = 0
    @disposed = false
    @base_tone = $game_map.screen.tone.clone
    @current_tone = $game_map.screen.tone.clone
    create_box
    create_root
    create_components
    create_simulator
    create_buttons
    Draggable << @box
    @box.drag_restriction = Rect.new(
      0, 0, Graphics.width - @box.width, Graphics.height - @box.height
    )
  end

  #--------------------------------------------------------------------------
  # * Check if the box is disposed
  #--------------------------------------------------------------------------
  def disposed? 
    @disposed
  end
  
  #--------------------------------------------------------------------------
  # * Create root
  #--------------------------------------------------------------------------
  def create_root
    @root = Gui::Box.new(
      width: 100.percent, 
      height: 100.percent, 
      border: 0,
      parent: @box, 
      padding: 4
    )
  end


  #--------------------------------------------------------------------------
  # * Dispose the box
  #--------------------------------------------------------------------------
  def dispose 
    $game_map.screen.clear_tone
    $game_map.screen.tone.set(@base_tone)
    #@wait_label.dispose
    @box.dispose
    @disposed = true
  end

  #--------------------------------------------------------------------------
  # * Create General Box
  #--------------------------------------------------------------------------
  def create_box
    @box = Gui::Pannel.new(
      width: 175, 
      height: 200,
      title: "Testeur de teintes", 
      y: 10, 
      z: 4000,
      padding: 0,
      margin: 6,
      border_color: Color.new('#113F59'),
      background_color: Color.new(255, 255, 255)
    )
  end

  #--------------------------------------------------------------------------
  # * Create a trackbar
  #--------------------------------------------------------------------------
  def create_trackbar(kind, i)
    offset = (kind == "gray") ? 0 : 255
    instance_variable_set(
      "@#{kind}_track", 
      Gui::TrackBar.new(
        parent: @root, 
        y: 10 + (i * 20),
        width: 60.percent,
        max_value: offset + 255, 
      )
    )

    v = instance_variable_get("@#{kind}_track")
    v.value = @current_tone.send(kind) + offset
    v.bar.style_set(:background_color, get_color(kind))
  end

  #--------------------------------------------------------------------------
  # * Create input text
  #--------------------------------------------------------------------------
  def create_fields(kind, i)
    offset = (kind == "gray") ? 0 : 255
    new_y =  4 + (i * 20)
    instance_variable_set(
      "@#{kind}_field", 
      Gui::TextField.new(
        parent: @root, 
        width: 32.percent, 
        border: 1,
        padding: 1,
        border_color: Color.new("#c0c0c0"),
        margin: 2,
        x: 68.percent, 
        y: new_y, 
        format: :int, 
        range_value: [-offset, 255]
      )
    )
    @last_y = new_y
    v = instance_variable_get("@#{kind}_field")
    v.value = @current_tone.send(kind)
  end


  #--------------------------------------------------------------------------
  # * Create Trackbars and input text
  #--------------------------------------------------------------------------
  def create_components
    ["red", "green", "blue", "gray"].each_with_index do |item, i|
      create_trackbar(item, i)
      create_fields(item, i)
    end 
  end

  #--------------------------------------------------------------------------
  # * Create Simulator
  #--------------------------------------------------------------------------
  def create_simulator
    @last_y += 35
    @checkbox = Gui::CheckBox.new(
      y: @last_y,
      border_color: Color.new('#c0c0c0'),
      parent: @root,
      x: 3,
    )
    @wait_label = Gui::Label.new(
      parent: @root,
      value: 'Attendre',
      x: 38, 
      y: @last_y,
      z: 4500
    )
    @frames =Gui::TextField.new(
      parent: @root, 
      width: 32.percent, 
      border: 1,
      padding: 1,
      border_color: Color.new("#c0c0c0"),
      margin: 2,
      x: 68.percent, 
      y: @last_y-4, 
      format: :int, 
      range_value: [0, 600]
    )
    @frames.value = 60
  end

  #--------------------------------------------------------------------------
  # * Create Buttons
  #--------------------------------------------------------------------------
  def create_buttons
    @last_y += 30
    @copy_as_text = Gui::Button.new(
      y: @last_y,
      parent: @root, 
      margin: 3, 
      width: 33.percent, 
      title: 'TXT',
      trigger: trigger do 
          text = sprintf(
            "screen_tone(tone(%d,%d,%d,%d), %d, %s)",
            @red_field.formatted_value.to_i,
            @green_field.formatted_value.to_i,
            @blue_field.formatted_value.to_i,
            @gray_field.formatted_value.to_i,
            @frames.formatted_value.to_i, 
            @checkbox.checked?.to_s
          )
          Clipboard.push_text(text)
          msgbox("La ligne de script a été collée dans le presse-papier")
        end
    )
    @copy_as_ev = Gui::Button.new(
      y: @last_y,
      parent: @root, 
      margin: 3, 
      width: 33.percent, 
      title: 'EVT',
      x: 33.percent,
      trigger: trigger do 
          set_tone
          time = @frames.formatted_value.to_i
          check = @checkbox.checked?
          rpg_command =  RPG::EventCommand.new(223, 0, [@tone, time, check])
          Clipboard.push_command(rpg_command)
          msgbox("La commande événementielle a été collée dans le presse-papier")
        end
    ) 
    @run = Gui::Button.new(
      y: @last_y,
      parent: @root, 
      margin: 3, 
      width: 33.percent, 
      title: '►',
      x: 66.percent,
      trigger: trigger do 
        @changing = true
        $game_map.screen.tone.set(@base_tone)
        set_tone 
         $game_map.screen.start_tone_change(
           @tone, 
           @frames.formatted_value.to_i
          )
      end
    ) 
  end


  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    return if disposed?
    if $game_map.screen.tone_change? 
      update_fields_values
    else
      if @changing 
        update_fields_values
        @changing = false
      end
      update_tone
      update_fields 
    end
  end

  #--------------------------------------------------------------------------
  # * Update fields values
  #--------------------------------------------------------------------------
  def update_fields_values 
    [ "red", "green", "blue", "gray"].each do |elt|
      field = instance_variable_get("@#{elt}_field")
      offset = (elt == "gray") ? 0 : 255
      track = instance_variable_get("@#{elt}_track")
      value = $game_map.screen.tone.send(elt)
      field.value = value.to_i
      track.value = value.to_i + offset
    end 
  end 

  #--------------------------------------------------------------------------
  # * Update fields
  #--------------------------------------------------------------------------
  def update_fields
    @frames.update
    [ "red", "green", "blue", "gray"].each do |elt|
      field = instance_variable_get("@#{elt}_field")
      offset = (elt == "gray") ? 0 : 255
      track = instance_variable_get("@#{elt}_track")
      field_value = field.formatted_value.to_i
      track_value = (track.value.to_i - offset)
      if track.bar.dragging?
        field.value = track_value
      elsif field.actived?
        track.value = (field_value + offset)     
      end
      field.update 
    end

  end

  #--------------------------------------------------------------------------
  # * Set current tone
  #--------------------------------------------------------------------------
  def set_tone
    @tone = Tone.new(
      @red_field.formatted_value, 
      @green_field.formatted_value, 
      @blue_field.formatted_value,
      @gray_field.formatted_value, 
    )
  end

  #--------------------------------------------------------------------------
  # * Update input
  #--------------------------------------------------------------------------
  def update_input
    return dispose if Key::Esc.trigger? || Keyboard.trigger?(RME::Config::KEY_TONE)
  end

  #--------------------------------------------------------------------------
  # * Update tone
  #--------------------------------------------------------------------------
  def update_tone
    set_tone
    return if @current_tone == @tone
    @current_tone = @tone
    $game_map.screen.tone.set(@tone)
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
      title: "Testeur de commandes",
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
      value: 'Copier',
      z: 4500
    )
    @run_lab = Gui::Label.new(
      parent: @box.outer,
      font: @font,
      value: 'Lancer', 
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
      checked_label: '[X] Afficher dans la console',
      unchecked_label: '[  ] Afficher dans la console', 
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
            msgbox("La ligne de script a été collée dans le presse-papier")
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
            msgbox("La commande événementielle a été collée dans le presse-papier")
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
    update_completion_box
    update_completion if Devices::Keys::Tab.trigger? && !in_completion?
  end
  
  #--------------------------------------------------------------------------
  # * Update Autocompletion
  #--------------------------------------------------------------------------
  def update_completion(i = 0)
    candidates = completion_candidates
    return if candidates.length < 2
    @token = candidates.shift
    @candidates = candidates.reverse
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
      message = filter(error.name, Command.singleton_methods)
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


#==============================================================================
# ** Scene_RME
#------------------------------------------------------------------------------
#  This scene provide tools to generate RMEScene
#==============================================================================

class Scene_RME < Scene_Base

  #--------------------------------------------------------------------------
  # * Utils
  #--------------------------------------------------------------------------
  def width; Graphics.width; end
  def height; Graphics.height; end

  #--------------------------------------------------------------------------
  # * Create White Background
  #--------------------------------------------------------------------------
  def create_background 
    @background = Sprite.new
    @background.bitmap = Bitmap.new(width, height)
    @background.bitmap.fill_rect(0, 0, width, height, Color.new(255, 255, 255)) 
  end 

  #--------------------------------------------------------------------------
  # * Create Full pannel
  #--------------------------------------------------------------------------
  def create_pannel(title)
    @pannel = Gui::Pannel.new(
      width: width, 
      height: height,
      title: title,
      border_color: Color.new('#113F59'),
      background_color: Color.new(255, 255, 255), 
      padding: 0
    )
  end

  #--------------------------------------------------------------------------
  # * Dispose Pannel
  #--------------------------------------------------------------------------
  def dispose_pannel
    @pannel.dispose
  end

  #--------------------------------------------------------------------------
  # * Dispose Background
  #--------------------------------------------------------------------------
  def dispose_background
    @background.bitmap.dispose
    @background.dispose
  end

  #--------------------------------------------------------------------------
  # * General start
  #--------------------------------------------------------------------------
  def start
    super 
    Graphics.freeze 
    create_background
  end

  #--------------------------------------------------------------------------
  # * Termination Processing
  #--------------------------------------------------------------------------
  def terminate
    super
    dispose_background
  end

  #--------------------------------------------------------------------------
  # * Create a viewport to the whole content
  #--------------------------------------------------------------------------
  def create_main_viewport
    @main_viewport = Gui::ScrollableField.new(
      width: width, 
      height: height
    )
  end

  #--------------------------------------------------------------------------
  # * Dispose Main viewport
  #--------------------------------------------------------------------------
  def dispose_main_viewport
    @main_viewport.dispose
  end

end

#==============================================================================
# ** Scene_Commands
#------------------------------------------------------------------------------
#  This scene provides tools to build commands
#==============================================================================

class Scene_Commands < Scene_RME

  #--------------------------------------------------------------------------
  # * General start
  #--------------------------------------------------------------------------
  def start
    super 
    @size = 0
    create_main_viewport
  end

  #--------------------------------------------------------------------------
  # * Termination Processing
  #--------------------------------------------------------------------------
  def terminate
    super
    dispose_main_viewport
  end
end
# By Raho
if RME.unsafe?

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