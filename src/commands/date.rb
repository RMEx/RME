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

      # ------------------------------------------------------------------------
      # * Returns the current day.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :time_day,
                        :description => 'Date.time_day'}) do
        Time.now.day
      end

      # ------------------------------------------------------------------------
      # * Returns the current hour of the day.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :time_hour,
                        :description => 'Date.time_hour'}) do
        Time.now.hour
      end

      # ------------------------------------------------------------------------
      # * Returns the clock's minutes.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :time_min,
                        :description => 'Date.time_min'}) do
        Time.now.min
      end

      # ------------------------------------------------------------------------
      # * Returns the clock's seconds.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :time_sec,
                        :description => 'Date.time_sec'}) do
        Time.now.sec
      end

      append_commands
    end
  end
end
