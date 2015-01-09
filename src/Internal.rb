# -*- coding: utf-8 -*-
#==============================================================================
# ** RME V1.0.0 Internal
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

end