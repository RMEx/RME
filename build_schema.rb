# -*- coding: utf-8 -*-


project_directory "project/"
insert_after "Scene_Gameover"

# Define a library
library("RME", 'src/') do 
  
  define_version 1, 0, 0
  describe "RME is a powerful tool to improve your RPGMaker VXAce experience!"

  add_author "Nuki", "xaviervdw@gmail.com"
  add_author "Hiino"
  add_author "Raho"
  add_author "Grim", "grimfw@gmail.com"
  add_author "Joke"
  add_author "Mspawn"

  add_component "RME.SDK",            "SDK.rb"
  add_component "RME.Database",       "Database.rb"
  add_component "RME.EvEx",           "EvEx.rb"
  add_component "RME.Commands",       "Commands.rb"
  add_component "RME.Incubator",      "Incubator.rb"
  add_component "RME.DocGenerator",   "DocGenerator.rb"
  add_component "RME.Documentation",  "Doc.rb"

end