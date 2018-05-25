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

      # TODO
      # - `actor_attack`
      # - `actor_defense`
      # - `actor_magic_attack`
      # - `actor_magic_defense`
      # - `actor_agility`
      # - `actor_luck`
      # - `actor_hit_rate`
      # - `actor_evasion_rate`
      # - `actor_critical_rate`
      # - `actor_critical_evasion_rate`
      # - `actor_magical_evasion_rate`
      # - `actor_magical_reflection_rate`
      # - `actor_counter_attack_rate`
      # - `actor_hp_regeneration_rate`
      # - `actor_mp_regeneration_rate`
      # - `actor_tp_regeneration_rate`
      # - `actor_target_rate`
      # - `actor_guard_effect_rate`
      # - `actor_revory_effect_rate`
      # - `actor_pharmacology`
      # - `actor_mp_cost_rate`
      # - `actor_tp_charge_rate`
      # - `actor_physical_damage_rate`
      # - `actor_magical_damage_rate`
      # - `actor_floor_damage_rate`
      # - `actor_exp_rate`
      # - `actor_name`
      # - `set_actor_name`
      # - `actor_nickname`
      # - `set_actor_nickname`
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
