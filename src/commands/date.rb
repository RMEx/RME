# -*- coding: utf-8 -*-

# ==============================================================================
# * RPG Maker (VX / VX.ACE) Extender
# ------------------------------------------------------------------------------
# {{ TODO: authors }}
# ------------------------------------------------------------------------------
# Commands to retrieve informations about date & time.
#
# [Dependencies]
#   - `../*.rb`
#   - `../documentation/internal_commands.rb`
#   - `../documentation/internal_documentation.rb`
# ==============================================================================

module RME
  module Command
    module Date

      # ------------------------------------------------------------------------
      # * Returns the current year.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :time_year,
                        :description => 'Date.time_year'}) do
        Time.now.year
      end

      # ------------------------------------------------------------------------
      # * Returns the current month.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :time_month,
                        :description => 'Date.time_month'}) do
        Time.now.month
      end

      # TODO
      # - `time_day`
      # - `time_hour`
      # - `time_min`
      # - `time_sec`

      append_commands
    end
  end
end
