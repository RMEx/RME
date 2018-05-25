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

      # TODO
      # - `actor_accessory`
      # - `actor_has_weapon?`
      # - `actor_has_shield?`
      # - `actor_has_head?`
      # - `actor_has_body?`
      # - `actor_has_accessory?`
      # - `actor_level`
      # - `actor_level_max`
      # - `actor_exp`
      # - `actor_note`
      # - `actor_hp`
      # - `actor_mp`
      # - `actor_tp`
      # - `actor_max_hp`
      # - `actor_max_mp`
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
