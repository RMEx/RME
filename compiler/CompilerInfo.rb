#==============================================================================
# ** RME V1.0.0 Compiler
#------------------------------------------------------------------------------
#  With : 
# Nuki
#------------------------------------------------------------------------------
# Package description
#==============================================================================

#Configuration
src_directory     "../../src/"
project_directory "../../project/"
insert_after      "Scene_Gameover"
project_to_src    "../src/"

#Included lib
define_lib "▼ RME",             "front.rb"
define_lib "RME.SDK",           "SDK.rb"
define_lib "RME.EvEx",          "EvEx.rb"
define_lib "RME.DocGenerator",  "DocGenerator.rb"
define_lib "RME.Documentation", "Doc.rb"
