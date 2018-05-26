# -*- coding: utf-8 -*-

# ==============================================================================
# * RPG Maker (VX / VX.ACE) Extender
# ------------------------------------------------------------------------------
# {{ TODO: authors }}
# ------------------------------------------------------------------------------
# Actors related commands.
#
# [Dependencies]
#   - `../*.rb`
#   - `../documentation/internal_commands.rb`
#   - `../documentation/internal_documentation.rb`
# ==============================================================================

module RME
  module Command
    module Actors

      # Common parameters' declaration
      ACTOR_ID = {:name        => :id,
                  :type        => ParameterType::ActorId,
                  :description => 'Actors.actor_id'}

      # Internal methods
      def self.type_equip(sym)
        [:Weapon, :Shield, :Head, :Body, :Accessory].index(sym)
      end
      private_class_method :type_equip

      # ------------------------------------------------------------------------
      # * Returns the identifier of the item which is currently equipped
      #   by the given actor, in the specified slot.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_equip,
                        :description => 'Actors.actor_equip',
                        :parameters  => [
                           ACTOR_ID,
                           {:name        => :slot,
                            :description => 'Actors.actor_equip.slot',
                            :type        => ParameterType::EquipmentSlot}
                         ]}) do |id, slot|
        k = $game_actors[id].equips[type_equip(slot)]
        (k.nil?) ? 0 : k.id
      end

      # ------------------------------------------------------------------------
      # * Returns the identifier of the weapon which is currently
      #   equipped by the given actor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_weapon,
                        :description => 'Actors.actor_weapon',
                        :parameters  => [ACTOR_ID]}) do |id|
        actor_equip(id, :Weapon)
      end

      # ------------------------------------------------------------------------
      # * Returns the identifier of the shield which is currently
      #   equipped by the given actor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_shield,
                        :description => 'Actors.actor_shield',
                        :parameters  => [ACTOR_ID]}) do |id|
        actor_equip(id, :Shield)
      end

      # ------------------------------------------------------------------------
      # * Returns the identifier of the helmet which is currently
      #   equipped by the given actor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_head,
                        :description => 'Actors.actor_head',
                        :parameters  => [ACTOR_ID]}) do |id|
        actor_equip(id, :Head)
      end

      # ------------------------------------------------------------------------
      # * Returns the identifier of the armour which is currently
      #   equipped by the given actor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_body,
                        :description => 'Actors.actor_body',
                        :parameters  => [ACTOR_ID]}) do |id|
        actor_equip(id, :Body)
      end

      # ------------------------------------------------------------------------
      # * Returns the description associated with the given actor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_description,
                        :description => 'Actors.actor_description',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].description
      end

      # ------------------------------------------------------------------------
      # * Returns the identifier of the accessory which is currently
      #   equipped by the given actor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_accessory,
                        :description => 'Actors.actor_accessory',
                        :parameters  => [ACTOR_ID]}) do |id|
        actor_equip(id, :Accessory)
      end

      # ------------------------------------------------------------------------
      # * Tells whether the given actor is equipped with a weapon (`true`);
      #   or not (`false`).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_has_weapon?,
                        :description => 'Actors.actor_has_weapon?',
                        :parameters  => [ACTOR_ID]}) do |id|
        actor_weapon(id) != 0
      end

      # ------------------------------------------------------------------------
      # * Tells whether the given actor is equipped with a shield (`true`);
      #   or not (`false`).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_has_shield?,
                        :description => 'Actors.actor_has_shield?',
                        :parameters  => [ACTOR_ID]}) do |id|
        actor_shield(id) != 0
      end

      # ------------------------------------------------------------------------
      # * Tells whether the given actor is equipped with an helmet (`true`);
      #   or not (`false`).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_has_head?,
                        :description => 'Actors.actor_has_head?',
                        :parameters  => [ACTOR_ID]}) do |id|
        actor_head(id) != 0
      end

      # ------------------------------------------------------------------------
      # * Tells whether the given actor is equipped with an armour (`true`);
      #   or not (`false`).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_has_body?,
                        :description => 'Actors.actor_has_body?',
                        :parameters  => [ACTOR_ID]}) do |id|
        actor_body(id) != 0
      end

      # ------------------------------------------------------------------------
      # * Tells whether the given actor is equipped with an accessory (`true`);
      #   or not (`false`).
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_has_accessory?,
                        :description => 'Actors.actor_has_accessory?',
                        :parameters  => [ACTOR_ID]}) do |id|
        actor_accessory(id) != 0
      end

      # ------------------------------------------------------------------------
      # * Returns the level of the given actor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_level,
                        :description => 'Actors.actor_level',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].level
      end

      # ------------------------------------------------------------------------
      # * Returns the maximum level that the given actor can reach.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_level_max,
                        :description => 'Actors.actor_level_max',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].max_level
      end

      # ------------------------------------------------------------------------
      # * Returns the experience points that the given actor currently has.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_exp,
                        :description => 'Actors.actor_exp',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].exp
      end

      # ------------------------------------------------------------------------
      # * Returns the note (as stored in RM database) associated with the given
      #   actor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_note,
                        :description => 'Actors.actor_note',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].actor.note
      end

      # ------------------------------------------------------------------------
      # * Returns the health points that the given actor currently has.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_hp,
                        :description => 'Actors.actor_hp',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].hp
      end

      # ------------------------------------------------------------------------
      # * Returns the mana points that the given actor currently has.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_mp,
                        :description => 'Actors.actor_mp',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].mp
      end

      # ------------------------------------------------------------------------
      # * Returns the "time points"" that the given actor currently has.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_tp,
                        :description => 'Actors.actor_tp',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].tp
      end

      # ------------------------------------------------------------------------
      # * Returns the maximal health points of the given actor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_max_hp,
                        :description => 'Actors.actor_max_hp',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].mhp
      end

      # ------------------------------------------------------------------------
      # * Returns the maximal mana points of the given actor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_max_mp,
                        :description => 'Actors.actor_max_mp',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].mmp
      end

      # ------------------------------------------------------------------------
      # * Returns the attack points of the given actor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_attack,
                        :description => 'Actors.actor_attack',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].atk
      end

      # ------------------------------------------------------------------------
      # * Returns the defense points of the given actor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_defense,
                        :description => 'Actors.actor_defense',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].def
      end

      # ------------------------------------------------------------------------
      # * Returns the magical attack points of the given actor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_magic_attack,
                        :description => 'Actors.actor_magic_attack',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].mat
      end

      # ------------------------------------------------------------------------
      # * Returns the magical defense points of the given actor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_magic_defense,
                        :description => 'Actors.actor_magic_defense',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].mdf
      end

      # ------------------------------------------------------------------------
      # * Returns the agility points of the given actor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_agility,
                        :description => 'Actors.actor_agility',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].agi
      end

      # ------------------------------------------------------------------------
      # * Returns the luck points of the given actor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_luck,
                        :description => 'Actors.actor_luck',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].luk
      end

      # ------------------------------------------------------------------------
      # * Returns the rate at which the given actor can successfully hit
      #   a monster.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_hit_rate,
                        :description => 'Actors.actor_hit_rate',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].hit
      end

      # ------------------------------------------------------------------------
      # * Returns the rate at which the given actor can successfully dodge
      #   monsters' attacks.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_evasion_rate,
                        :description => 'Actors.actor_evasion_rate',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].eva
      end

      # ------------------------------------------------------------------------
      # * Returns the rate at which the given actor can successfully perform
      #   a critical strike.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_critical_rate,
                        :description => 'Actors.actor_critical_rate',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].cri
      end

      # ------------------------------------------------------------------------
      # * Returns the rate at which the given actor can successfully dodge
      #   critical strikes performed by monsters.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_critical_evasion_rate,
                        :description => 'Actors.actor_critical_evasion_rate',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].cev
      end

      # ------------------------------------------------------------------------
      # * Returns the rate at which the given actor can successfully dodge
      #   magical attacks performed by monsters.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_magical_evasion_rate,
                        :description => 'Actors.actor_magical_evasion_rate',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].mev
      end

      # ------------------------------------------------------------------------
      # * Returns the rate at which the given actor can successfully reflect
      #   magical attacks performed by monsters.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_magical_reflection_rate,
                        :description => 'Actors.actor_magical_reflection_rate',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].mrf
      end

      # ------------------------------------------------------------------------
      # * Returns the rate at which the given actor can successfully reflect
      #   physical attacks performed by monsters.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_counter_attack_rate,
                        :description => 'Actors.actor_counter_attack_rate',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].cnt
      end

      # ------------------------------------------------------------------------
      # * Returns the rate at which the given actor regenerate
      #   its health points.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_hp_regeneration_rate,
                        :description => 'Actors.actor_hp_regeneration_rate',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].hrg
      end

      # ------------------------------------------------------------------------
      # * Returns the rate at which the given actor regenerate
      #   its magic (mana) points.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_mp_regeneration_rate,
                        :description => 'Actors.actor_mp_regeneration_rate',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].mrg
      end

      # ------------------------------------------------------------------------
      # * Returns the rate at which the given actor regenerate
      #   its "time" points.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_tp_regeneration_rate,
                        :description => 'Actors.actor_tp_regeneration_rate',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].trg
      end

      # ------------------------------------------------------------------------
      # * Returns the rate at which the given actor can be targeted by
      #   a monster.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_target_rate,
                        :description => 'Actors.actor_target_rate',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].tgr
      end

      # ------------------------------------------------------------------------
      # * Returns the capability of the given actor to reduce physical damage
      #   it takes.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_guard_effect_rate,
                        :description => 'Actors.actor_guard_effect_rate',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].grd
      end

      # ------------------------------------------------------------------------
      # * Returns the capability of the given actor to recover its health
      #   and magical (mana) points.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_recovery_effect_rate,
                        :description => 'Actors.actor_recovery_effect_rate',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].rec
      end

      # ------------------------------------------------------------------------
      # * Returns the ratio of health and magical (mana) points that the given
      #   actor has received with the last item.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_pharmacology,
                        :description => 'Actors.actor_pharmacology',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].pha
      end

      # ------------------------------------------------------------------------
      # * Returns the costs' ratio in terms of magical (mana) points,
      #   when an attack requiring magical (mana) points has been triggered
      #   by the given actor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_mp_cost_rate,
                        :description => 'Actors.actor_mp_cost_rate',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].mcr
      end

      # ------------------------------------------------------------------------
      # * Returns the costs' ratio in terms of "time" points,
      #   when an attack requiring "time" points has been triggered
      #   by the given actor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_mp_cost_rate,
                        :description => 'Actors.actor_tp_charge_rate',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].tcr
      end

      # ------------------------------------------------------------------------
      # * Returns the ratio of physical damage that the given actor
      #   has lastly received.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_physical_damage_rate,
                        :description => 'Actors.actor_physical_damage_rate',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].pdr
      end

      # ------------------------------------------------------------------------
      # * Returns the ratio of magical damage that the given actor
      #   has lastly received.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_magical_damage_rate,
                        :description => 'Actors.actor_magical_damage_rate',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].mdr
      end

      # ------------------------------------------------------------------------
      # * Returns the ratio of floor-performed physical damage that the given
      #   actor has lastly received.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_floor_damage_rate,
                        :description => 'Actors.actor_floor_damage_rate',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].fdr
      end

      # ------------------------------------------------------------------------
      # * Returns the ratio of experience's growth that the given actor
      #   can acquire.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_experience_rate,
                        :description => 'Actors.actor_experience_rate',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].exr
      end

      # ------------------------------------------------------------------------
      # * Returns the name of the given actor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_name,
                        :description => 'Actors.actor_name',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].name
      end

      # ------------------------------------------------------------------------
      # * Modifies the name of the given actor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :set_actor_name,
                        :description => 'Actors.set_actor_name',
                        :parameters  => [
                          ACTOR_ID,
                          {:name        => :new_name,
                           :description => 'Actors.set_actor_name.name',
                           :type        => ParameterType::String}
                        ]}) do |id, new_name|
        $game_actors[id].name = new_name
      end

      # ------------------------------------------------------------------------
      # * Returns the nickname of the given actor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :actor_nickname,
                        :description => 'Actors.actor_nickname',
                        :parameters  => [ACTOR_ID]}) do |id|
        $game_actors[id].nickname
      end

      # ------------------------------------------------------------------------
      # * Modifies the nickname of the given actor.
      # ------------------------------------------------------------------------
      Command::declare({:section     => self,
                        :name        => :set_actor_nickname,
                        :description => 'Actors.set_actor_nickname',
                        :parameters  => [
                          ACTOR_ID,
                          {:name        => :new_name,
                           :description => 'Actors.set_actor_nickname.name',
                           :type        => ParameterType::String}
                        ]}) do |id, new_name|
        $game_actors[id].nickname = new_name
      end

      # TODO
      # - `actor_character_name`
      # - `actor_character_index`
      # - `actor_face_name`
      # - `actor_face_index`
      # - `actor_class`
      # - `actor_exp_for_next_level`
      # - `actor_change_equip`
      # - `actor_equip_weapon`
      # - `actor_equip_shield`
      # - `actor_equip_head`
      # - `actor_equip_body`
      # - `actor_equip_accessory`
      # - `actor_optimize_equipement`
      # - `actor_level_up`
      # - `actor_level_down`
      # - `actor_give_exp`
      # - `actor_learn`
      # - `actor_forget`
      # - `actor_knowns?`
      # - `actor_set_graphic`
      # - `actor_weapons`
      # - `actor_armors`
      # - `actor_skills`
      # - `actor_change_appear`
      # - `actor_change_character`
      # - `actor_change_face`
      # - `actor_slot`
      # - `actor_element_rate`

    end
  end
end
