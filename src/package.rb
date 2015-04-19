# Package description
Package.new(
	name: 'RME',
	version: vsn(0, 0, 5),
	authors: {
    'Nuki' => 'xaviervdw@gmail.com',
    'Grim' => 'grimfw@gmail.com',
    'Raho' => '',
    'Hiino' => '',
    'Joke' => 'joke@biloucorp.com',
    'Mspawn' => ''
  },
	components: [
    'SDK.rb',
		'SDK.Gui.rb',
    'Database.rb',
    'Internal.rb',
    'EvEx.rb',
    'Commands.rb',
    'Incubator.rb',
    'EE4Cmds.rb',
		'Tools.rb',
    'DocGenerator.rb',
    'Doc.rb'
  ],
	description: 'RME is a powerful tool to improve your RPGMaker VXAce experience!'
)
