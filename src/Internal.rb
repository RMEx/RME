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
