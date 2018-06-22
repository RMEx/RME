# -*- coding: utf-8 -*-

# ==============================================================================
# * RPG Maker (VX / VX.ACE) Extender
# ------------------------------------------------------------------------------
# {{ TODO: authors }}
# ------------------------------------------------------------------------------
# Armors related commands.
#
# [Dependencies]
#   - `../*.rb`
#   - `../documentation/internal_commands.rb`
#   - `../documentation/internal_documentation.rb`
# ==============================================================================

module RME
  module Command
    module Armors

      # Common parameters' declaration
      ARMOR_ID = {:name        => :id,
                  :type        => ParameterType::ItemId,
                  :description => 'Armors.armor_id'}

      # ------------------------------------------------------------------------
      # * Returns the list of armors that are currently owned by the player.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :armors_possessed,
                        :description => 'Armors.armors_possessed'}) do
        $game_party.armors.map {|i| [i.id] * $game_party.item_number(i)}.flatten
      end

      # ------------------------------------------------------------------------
      # * Counts the number of copies for the given armor, that are currently
      #   owned by the player.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :armor_count,
                        :description => 'Armors.armor_count',
                        :parameters  => [
                          {:name        => :id,
                           :description => 'Armors.armor_count.id',
                           :type        => ParameterType::ItemId}
                        ]}) do |id|
        $game_party.item_number($data_armors[id])
      end

      # ------------------------------------------------------------------------
      # * Returns the name of the given armor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :armor_name,
                        :description => 'Armors.armor_name',
                        :parameters  => [ARMOR_ID]}) do |id|
        $data_armors[id].name
      end

      # ------------------------------------------------------------------------
      # * Returns the note attached to the given armor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :armor_note,
                        :description => 'Armors.armor_note',
                        :parameters  => [ARMOR_ID]}) do |id|
        $data_armors[id].note
      end

      # ------------------------------------------------------------------------
      # * Returns the given armor's description.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :armor_description,
                        :description => 'Armors.armor_description',
                        :parameters  => [ARMOR_ID]}) do |id|
        $data_armors[id].description
      end

      # TODO
      # - `armor_icon`
      # - `armor_price`
      # - `armor_max_hit_points`
      # - `armor_max_magic_points`
      # - `armor_attack_power`
      # - `armor_defense_power`
      # - `armor_magic_attack_power`
      # - `armor_magic_defense_power`
      # - `armor_agility`
      # - `armor_luck`
      # - `give_armor`
      # - `has_armor?`
      # - `armor_equiped?`
      # - `armor_type`
      # - `armor_element_rate`

      append_commands
    end
  end
end
