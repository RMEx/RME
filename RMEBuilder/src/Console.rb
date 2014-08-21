# -*- coding: utf-8 -*-
#==============================================================================
# ** Console
#------------------------------------------------------------------------------
#  Console Handling
#==============================================================================

module Console
  #--------------------------------------------------------------------------
  # * Constants
  #--------------------------------------------------------------------------
  AllocConsole = Win32API.new('kernel32', 'AllocConsole', 'v', 'l')
  SetForegroundWindow = Win32API.new('user32', 'SetForegroundWindow','l','l')
  SetConsoleTitleA = Win32API.new('kernel32','SetConsoleTitleA','p','s')
  WriteConsoleOutput = Win32API.new('kernel32', 'WriteConsoleOutput', 'lpllp', 'l' )
  GetConsoleWindow = Win32API.new('kernel32','GetConsoleWindow', 'v', 'l')
  FindWindowA = Win32API.new('user32', 'FindWindowA', 'pp', 'i') 
  HANDLE = FindWindowA.call('RGSS Player', 0)

  extend self

  #--------------------------------------------------------------------------
  # * Console Init
  #--------------------------------------------------------------------------
  def init
    AllocConsole.call
    SetForegroundWindow.call(HANDLE)
    SetConsoleTitleA.call("RMEBuilder #{current_version.to_s}")
    $stdout.reopen('CONOUT$')
    $stdin.reopen('CONIN$')
  end
  #--------------------------------------------------------------------------
  # * Puts in console
  #--------------------------------------------------------------------------
  def print(*data)
    puts(*data.collect{|d|d.inspect})
  end
  #--------------------------------------------------------------------------
  # * Gets in console
  #--------------------------------------------------------------------------
  def gets
    SetForegroundWindow.call(GetConsoleWindow.call)
    $stdin.gets
  end

end

#==============================================================================
# ** Kernel
#------------------------------------------------------------------------------
#  Common Interface
#==============================================================================

module Kernel
  def p(*args); Console.print(*args); end
  def gets; Console.gets; end;  
end

# Run console
Console.init