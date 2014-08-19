#==============================================================================
# ** RME V1.0.0 Compiler
#------------------------------------------------------------------------------
#  With : 
# Nuki
#------------------------------------------------------------------------------
# Package description
#==============================================================================

PATHS = {
	:src           => "../../src/",
	:output_dir    => "../../project/Data/",
  :raw_compiled  => "../../project/Data/Scripts.rvdata2",
	:output_file   => "Scripts.rvdata2",
	:output_backup => "Scripts-Backup.rvdata2",
	:after         => "Scene_Gameover"
}
LIB = {
	"▼ RME"              => "front.txt",
	"RME.SDK"            => "SDK.rb",
	"RME.EvEx"           => "EvEx.rb",
	"RME.DocGenerator"   => "DocGenerator.rb",
	"RME.Documentation"  => "Doc.rb"
}