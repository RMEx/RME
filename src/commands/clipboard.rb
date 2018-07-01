# -*- coding: utf-8 -*-

# ==============================================================================
# * RPG Maker (VX / VX.ACE) Extender
# ------------------------------------------------------------------------------
# {{ TODO: authors }}
# ------------------------------------------------------------------------------
# Commands which allows to store and retrieve data in/from the clipboard.
#
# [Dependencies]
#   - `../*.rb`
#   - `../documentation/internal_commands.rb`
#   - `../documentation/internal_documentation.rb`
# ==============================================================================

module RME
  module Command
    module Clipboard

      # ------------------------------------------------------------------------
      # * Stores the given `text` into the clipboard.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :clipboard_push_text,
                        :description => 'Clipboard.clipboard_push_text',
                        :parameters  => [
                          {:name        => :text,
                           :type        => ParameterType::String,
                           :description => 'Clipboard.clipboard_push_text.text'}
                        ]}) do |text|
        Clipboard.push_text(text)
      end

      # ------------------------------------------------------------------------
      # * Retrieves the text stored in the clipboard.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :clipboard_get_text,
                        :description => 'Clipboard.clipboard_get_text'}) do
        Clipboard.get_text
      end

      # ------------------------------------------------------------------------
      # * Stores the given event command into the clipboard.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :clipboard_push_command,
                        :description => 'Clipboard.clipboard_push_command',
                        :parameters  => [
                          {:name        => :cmd,
                           :description => 'Clipboard.clipboard_push_command.cmd'}
                        ]}) do |cmd|
        Clipboard.push_command(cmd)
      end

      append_commands
    end
  end
end
