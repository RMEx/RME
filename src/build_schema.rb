$STAGING = true
[
    "../src/Event_printer.rb",
    "../src/SDK.Sample.rb",
    "../src/Samples.rb",
    "../src/SDK.rb",
    "../src/Database.rb",
    "../src/Internal.rb", 
    "../src/EvEx.rb", 
    "../src/Commands.rb", 
    "../src/Incubator.rb",
    "../src/DocGenerator.rb",
    "../src/Doc.rb", 
    "../src/SDK.Gui.rb", 
    "../src/Tools.rb", 
    "../src/Process.Doc.rb"
].each {|file| Kernel.send(:load, file)}