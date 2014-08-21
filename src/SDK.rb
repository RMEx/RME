# -*- coding: utf-8 -*-
#==============================================================================
# ** RME V1.0.0
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
  
Licence coming soon 

=end

#==============================================================================
# ** RME
#------------------------------------------------------------------------------
#  Provide information about RME
#==============================================================================

module RME
  class << self
    #--------------------------------------------------------------------------
    # * Version
    #--------------------------------------------------------------------------
    def version; define_version(1,0,0); end
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
      Doc.schema ||= Hash.new
      Doc.header ||= Hash.new
      Doc.commands ||= Hash.new
    end
    #--------------------------------------------------------------------------
    # * classname
    #--------------------------------------------------------------------------
    def classname
      self.to_s.to_sym
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
      register_command_category(cat, "undefinded", "undefinded")
      Doc.commands[cat][:commands][name.to_sym] = d if d
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
    # * Header
    #--------------------------------------------------------------------------
    Doc.header[:title]  = "RME : RPG Maker Extender"
    Doc.header[:desc]   = "Outil d'extension de RPG Maker 
    (les objets étendus ne sont documentés que pour les ajouts.)" 
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

end # End of Object

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
    :seve, 
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
# ** String
#------------------------------------------------------------------------------
#  String char extension
#==============================================================================

class String
 
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
  # * In area
  #--------------------------------------------------------------------------
  def in?(rect)
    check_x = self.x.between?(rect.x, rect.x+rect.width)
    check_y = self.y.between?(rect.y, rect.y+rect.height)
    check_x && check_y
  end

  #--------------------------------------------------------------------------
  # * Restart
  #--------------------------------------------------------------------------
  def null!
    self.x = self.y = 0
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
  FindWindow          = Win32API.new('user32', 'FindWindow', 'pp', 'i')
  GetCursorPos        = Win32API.new('user32', 'GetCursorPos', 'p',  'i')
  GetKeyboardState    = Win32API.new('user32', 'GetKeyboardState', 'p', 'i')
  ScreenToClient      = Win32API.new('user32', 'ScreenToClient', 'ip', 'i')
  ShowCursor          = Win32API.new('user32', 'ShowCursor','i', 'i')
  ToUnicode           = Win32API.new('user32', 'ToUnicode', 'iippii', 'l')
  WideCharToMultiByte = Win32API.new('kernel32', 'WideCharToMultiByte', 'iipipipp', 'i')
end

#==============================================================================
# ** Devices
#------------------------------------------------------------------------------
#  Devices collection
#==============================================================================

module Devices

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
    # * Click API
    #--------------------------------------------------------------------------
    alias_method :click?, :press?

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
      return "" if [0x0D, 0x1B, 0x08].include?(key) || 
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

    #--------------------------------------------------------------------------
    # * Initialize
    #--------------------------------------------------------------------------
    def initialize
      @start = Point.new(0,0)
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
    [:trigger?, :press?, :release?, :repeat?, :time].each do |m|
      externalize ::Keyboard.method(m), m
    end

    #--------------------------------------------------------------------------
    # * Alias
    #--------------------------------------------------------------------------
    alias_method :click?, :press?

    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_reader :point
    attr_reader :square
    attr_reader :last_rect
    attr_reader :dragging
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
      @last_rect    = Rect.new(0,0,0,0)
      @dragging     = false
      @drag         = Drag.new
    end

    #--------------------------------------------------------------------------
    # * Frame update
    #--------------------------------------------------------------------------
    def update
      update_position
      update_drag
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
        @dragging     = true
        @drag.start.x = @point.x
        @drag.start.y = @point.y
      elsif dragging? && Key::Mouse_left.press?
        min_x, max_x  = *[@drag.start.x, @point.x].sort
        min_y, max_y  = *[@drag.start.y, @point.y].sort
        @drag.set(min_x, min_y, max_x-min_x, max_y-min_y)
      elsif dragging?
        @last_rect    = @drag.subtype 
        @dragging     = false
        @drag.empty
      end
    end

    #--------------------------------------------------------------------------
    # * Get Drag rect
    #--------------------------------------------------------------------------
    def rect
      return @drag.subtype
    end 

    #--------------------------------------------------------------------------
    # * Alias
    #--------------------------------------------------------------------------
    alias_method :click?, :press?

    #--------------------------------------------------------------------------
    # * Singleton Mouse instance
    #--------------------------------------------------------------------------
    ::Mouse = self.new 

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
      sdk_update
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
        tx = viewport.x - viewport.ox
        ty = viewport.y - viewport.oy
      end
      Rect.new(tx, ty, bitmap.width, bitmap.height)
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
  #--------------------------------------------------------------------------
  # * Import CMD API
  #--------------------------------------------------------------------------
  include Generative::CommandAPI
  extend Generative::CommandAPI
end

#==============================================================================
# ** Viewport
#------------------------------------------------------------------------------
#  Used when displaying sprites on one portion of the screen
#==============================================================================

class Viewport
  #--------------------------------------------------------------------------
  # * alias
  #--------------------------------------------------------------------------
  alias_method :sdk_initialize, :initialize
  #--------------------------------------------------------------------------
  # * Public instances variables
  #--------------------------------------------------------------------------
  attr_accessor :elts
  delegate_accessor :rect, :x 
  delegate_accessor :rect, :y
  delegate_accessor :rect, :width
  delegate_accessor :rect, :height

  #--------------------------------------------------------------------------
  # * Object initialize
  #--------------------------------------------------------------------------
  def initialize(*args)
    sdk_initialize(*args)
    @elts = []
  end

  #--------------------------------------------------------------------------
  # * append Sprites
  #--------------------------------------------------------------------------
  def append(s)
    @elts << (s)
  end

  #--------------------------------------------------------------------------
  # * Calcul height space
  #--------------------------------------------------------------------------
  def calc_height
    return rect.height if @elts.empty?
    v = @elts.max{|a, b| (a.y + a.rect.height) <=> (b.y + b.rect.height)}
    [(v.y+v.rect.height), rect.height].max
  end

  #--------------------------------------------------------------------------
  # * Calcul height space
  #--------------------------------------------------------------------------
  def calc_width
    return rect.width if @elts.empty?
    v = @elts.max{|a, b| (a.x + a.rect.width) <=> (b.x + b.rect.width)}
    [(v.x+v.rect.width), rect.width].max
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
    x = y = 0
    if p.length == 2
      x, y = *p
    elsif p.length == 1
      x, y = p[0].x, p[0].y
    end 
    check_x = x.between?(self.x, self.x+self.width)
    check_y = y.between?(self.y, self.y+self.height)
    check_x && check_y
  end
  #--------------------------------------------------------------------------
  # * check if the mouse 's hover
  #--------------------------------------------------------------------------
  def hover?; in?(Mouse.point); end
  #--------------------------------------------------------------------------
  # * check Mouse Interaction
  #--------------------------------------------------------------------------
  def click?(key);    hover? && Mouse.click?(key);    end
  def press?(key);    hover? && Mouse.press?(key);    end
  def trigger?(key);  hover? && Mouse.trigger?(key);  end
  def repeat?(key);   hover? && Mouse.repeat?(key);   end
  def release?(key);  hover? && Mouse.release?(key);  end
end

#==============================================================================
# ** Command
#------------------------------------------------------------------------------
#  Command container
#==============================================================================

module Command
  extend self
  #--------------------------------------------------------------------------
  # * Screen data
  #--------------------------------------------------------------------------
  def screen; Game_Screen.get; end
  def pictures; screen.pictures; end
  def scene; SceneManager.scene; end
end