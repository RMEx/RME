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

      # TODO
      # - `armor_name`
      # - `armor_note`
      # - `armor_description`
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
