# Package description
Package.new(
  name: 'RME',
  version: vsn(1, 4, 1),
  authors: {
    'xvw' => 'xaviervdw@gmail.com',
    'Grim' => 'grimfw@gmail.com',
    'Raho' => '',
    'Hiino' => '',
    'Joke' => 'joke@biloucorp.com',
    'Mspawn' => '',
    'Zangther' => 'zangther@gmail.com', 
    'Al Rind' => '', 
    'Hiinola' => '', 
    'Ulis' => '', 
    'FalconPilot' => '', 
    'Spyrojojo' => ''
  },
  components: [
    'SDK.rb',
    'Database.rb',
    'Internal.rb',
    'SDK.Gui.rb',
    'EvEx.rb',
    'Commands.rb',
    'Tools.rb',
    'Incubator/loop.rb',
    'Incubator/add_kill_resolution.rb', 
    'Incubator/fix_kill_resolution.rb'
  ],
  description: 'RME is a powerful tool to improve your RPGMaker VXAce experience!'
)
