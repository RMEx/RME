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

      # ------------------------------------------------------------------------
      # * Returns the index within the iconset, of the icon which represents
      #   the enemy.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :monster_icon,
                        :description => 'Enemy.monster_icon',
                        :parameters  => [ENEMY_ID]}) do |id|
        enemy(id).icon_index
      end

      # ------------------------------------------------------------------------
      # * Returns the enemy's description.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :monster_description,
                        :description => 'Enemy.monster_description',
                        :parameters  => [ENEMY_ID]}) do |id|
        enemy(id).description
      end

      # ------------------------------------------------------------------------
      # * Returns the enemy's note (additional description).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :monster_note,
                        :description => 'Enemy.monster_note',
                        :parameters  => [ENEMY_ID]}) do |id|
        enemy(id).note
      end

      # ------------------------------------------------------------------------
      # * Returns the name of the file in which is stored the graphical
      #   representation of the enemy (i.e: battler).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :monster_battler_name,
                        :description => 'Enemy.monster_battler_name',
                        :parameters  => [ENEMY_ID]}) do |id|
        enemy(id).battler_name
      end

      # ------------------------------------------------------------------------
      # * Returns the hue of the enemy's graphical representation
      #   (i.e: battler).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :monster_battler_hue,
                        :description => 'Enemy.monster_battler_hue',
                        :parameters  => [ENEMY_ID]}) do |id|
        enemy(id).battler_hue
      end

      # ------------------------------------------------------------------------
      # * Returns the maximal health points of the given enemy.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :monster_max_hp,
                        :description => 'Enemy.monster_max_hp',
                        :parameters  => [ENEMY_ID]}) do |id|
        enemy(id).params[0]
      end

      # ------------------------------------------------------------------------
      # * Returns the maximal mana points of the given enemy.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :monster_max_mp,
                        :description => 'Enemy.monster_max_mp',
                        :parameters  => [ENEMY_ID]}) do |id|
        enemy(id).params[1]
      end

      # ------------------------------------------------------------------------
      # * Returns the attack points of the given enemy.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :monster_attack_power,
                        :description => 'Enemy.monster_attack_power',
                        :parameters  => [ENEMY_ID]}) do |id|
        enemy(id).params[2]
      end

      # ------------------------------------------------------------------------
      # * Returns the defense points of the given enemy.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :monster_defense_power,
                        :description => 'Enemy.monster_defense_power',
                        :parameters  => [ENEMY_ID]}) do |id|
        enemy(id).params[3]
      end

      # ------------------------------------------------------------------------
      # * Returns the magical attack points of the given enemy.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :monster_magic_attack_power,
                        :description => 'Enemy.monster_magic_attack_power',
                        :parameters  => [ENEMY_ID]}) do |id|
        enemy(id).params[4]
      end

      # ------------------------------------------------------------------------
      # * Returns the magical defense points of the given enemy.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :monster_magic_defense_power,
                        :description => 'Enemy.monster_magic_defense_power',
                        :parameters  => [ENEMY_ID]}) do |id|
        enemy(id).params[5]
      end


      # ------------------------------------------------------------------------
      # * Returns the agility points of the given enemy.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :monster_agility,
                        :description => 'Enemy.monster_agility',
                        :parameters  => [ENEMY_ID]}) do |id|
        enemy(id).params[6]
      end

      # ------------------------------------------------------------------------
      # * Returns the luck points of the given enemy.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :monster_luck,
                        :description => 'Enemy.monster_luck',
                        :parameters  => [ENEMY_ID]}) do |id|
        enemy(id).params[7]
      end

      # ------------------------------------------------------------------------
      # * Returns the experience points that the given enemy provides
      #   once defeated.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :monster_give_exp,
                        :description => 'Enemy.monster_give_exp',
                        :parameters  => [ENEMY_ID]}) do |id|
        enemy(id).exp
      end

      # ------------------------------------------------------------------------
      # * Returns the amount of gold that the given enemy provides once
      #   defeated.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :monster_give_gold,
                        :description => 'Enemy.monster_give_gold',
                        :parameters  => [ENEMY_ID]}) do |id|
        enemy(id).gold
      end

      # TODO
      # - `monster_element_rate`

      append_commands
    end
  end
end
