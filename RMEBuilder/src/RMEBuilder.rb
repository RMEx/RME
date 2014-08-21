# -*- coding: utf-8 -*-
#==============================================================================
# ** RMEBuilder
#------------------------------------------------------------------------------
#  RPGMaker VX Ace scripts builder V 1.0.0
#  Powered by FUNKYWORK (http://funkywork.github.io)
#
#  ~ Hiino, Grim and Nuki 
#  With special thanks to Zeus81, Joke and Zangther 
#  Big kiss to Raho
#==============================================================================

# Erase RM Window
HANDLE = Win32API.new('user32', 'FindWindowA', 'pp', 'i').call('RGSS Player', 0)
ARGV   = Win32API.new("Kernel32", "GetCommandLine", "", "P").call.split
Win32API.new('user32','ShowWindow','ll','l').call(HANDLE, 0)

# Define RMEBuilder version
def current_version; version(1, 0, 0); end

# Include Libs
Kernel.send(:require, 'target.rb')
Kernel.send(:require, 'src/VersionLabel.rb')
Kernel.send(:require, 'src/Console.rb')
Kernel.send(:require, 'src/Library.rb')

# Get Assembly data
Kernel.send(:require, TARGET)

# Build Assembly Data
Kernel.send(:require, 'src/Compiler.rb')
Compiler.general_process
# End Process
p "Press [enter] to finish process"
gets