#
# Cette partie concerne les scripts expérimentaux
#

=begin 
Implémentation des évènements communs dans le système de combat 
- Solution proposée par <Nuki>
- Etat : En cours
=end

#==============================================================================
# ** BattleManager
#------------------------------------------------------------------------------
#  This module manages battle progress.
#==============================================================================

module BattleManager
  #--------------------------------------------------------------------------
  # * Singleton
  #--------------------------------------------------------------------------
  class << self
    #--------------------------------------------------------------------------
    # * Global datas
    #--------------------------------------------------------------------------
    attr_accessor :common_events
    attr_accessor :interpreter
    #--------------------------------------------------------------------------
    # * Alias
    #--------------------------------------------------------------------------
    alias_method :rme_setup, :setup
    alias_method :rme_battle_end, :battle_end
    alias_method :rme_judge_win_loss, :judge_win_loss
    #--------------------------------------------------------------------------
    # * Setup
    #--------------------------------------------------------------------------
    def setup(troop_id, can_escape = true, can_lose = false)
      BattleManager.interpreter = Game_Interpreter.new
      ev = $data_common_events.select {|e| e && e.for_battle?}
      BattleManager.common_events = ev.collect do |e| 
        Game_CommonEvent.new(e.id)
      end
      rme_setup(troop_id, can_escape, can_lose)
    end
    #--------------------------------------------------------------------------
    # * End Battle
    #     result : Result (0: Win 1: Escape 2: Lose)
    #--------------------------------------------------------------------------
    def battle_end(result)
      BattleManager.common_events = []
      rme_battle_end(result)
    end
    #--------------------------------------------------------------------------
    # * Determine Win/Loss Results
    #--------------------------------------------------------------------------
    def judge_win_loss
      BattleManager.common_events.each {|e| e.update }
      loop do 
        BattleManager.interpreter.update
        break if BattleManager.interpreter.running?
        return unless get_common
      end
      rme_judge_win_loss
    end
    #--------------------------------------------------------------------------
    # * get common event
    #--------------------------------------------------------------------------
    def get_common
      e = BattleManager.common_events.find {|e| e.active?}
      BattleManager.interpreter.setup(e.event.list) if e
    end
  end
end