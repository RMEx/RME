# -*- coding: utf-8 -*-

# ==============================================================================
# * RPG Maker (VX / VX.ACE) Extender
# ------------------------------------------------------------------------------
# {{ TODO: authors }}
# ------------------------------------------------------------------------------
# Enemy/foe/monster related commands.
#
# [Dependencies]
#   - `../*.rb`
#   - `../documentation/internal_commands.rb`
#   - `../documentation/internal_documentation.rb`
# ==============================================================================

module RME
  module Command
    module Enemy

      # Common parameters' declaration
      ENEMY_ID = {:name        => :id,
                  :type        => ParameterType::EnemyId,
                  :description => 'Enemy.id'}

      # ------------------------------------------------------------------------
      # * Returns the enemy's name.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :monster_name,
                        :description => 'Enemy.monster_name',
                        :parameters  => [ENEMY_ID]}) do |id|
        enemy(id).name
      end

      # TODO
      # - `monster_icon`
      # - `monster_description`
      # - `monster_note`
      # - `monster_battler_name`
      # - `monster_battler_hue`
      # - `monster_max_hp`
      # - `monster_max_mp`
      # - `monster_attack_power`
      # - `monster_defense_power`
      # - `monster_magic_attack_power`
      # - `monster_magic_defense_power`
      # - `monster_agility`
      # - `monster_luck`
      # - `monster_give_exp`
      # - `monster_give_gold`
      # - `monster_element_rate`

      append_commands
    end
  end
end
