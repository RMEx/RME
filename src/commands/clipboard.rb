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

      # TODO
      # - `clipboard_get_text`
      # - `clipboard_push_command`

      append_commands
    end
  end
end
