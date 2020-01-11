# By Raho
if RME.allowed?(:enlarge_resolution)

  #==============================================================================
  # ** Resolution
  #------------------------------------------------------------------------------
  #  Hack in the matrice :'( :'(
  #==============================================================================
  module Resolution
    extend self
    #------------------------------------------------------------------------
    # * ... no idea
    #------------------------------------------------------------------------
    def fresh_pointer(reg, v)
      addr = Externlib::LoadLibraryA.call(Externlib::RGSSDLL)
      ptr = DL::CPtr.new(addr + reg)
      ptr[0, v.size] = v
    end
    #------------------------------------------------------------------------
    # * ... pack dimension
    #------------------------------------------------------------------------
    def pack_dimension(width, height)
      [
        [width, height],[width+32, height+32],
        [-(~(width/32)), -(~(height/32))]
      ].collect{|elt| elt.pack('ll').scan(/..../)}
    end
    #------------------------------------------------------------------------
    # * ... Oh yeah, i'm currently listening a nice song !
    #------------------------------------------------------------------------
    def map_reg(width, height)
      empty_buff = [].pack('x4')
      (buff_aa, buff_ab), (buff_ba, buff_bb),
      (buff_ca, buff_cb) = *pack_dimension(width, height)
      {
        6495 => "\x90"*5, 6564 => buff_ab, 6569 => buff_aa,
        6742 => buff_ab, 6747 => buff_aa, 8438 => buff_aa,
        8447 => buff_aa, 8454 => buff_ab, 8463 => buff_ab,
        116195 => empty_buff, 116200 => empty_buff,
        128119 => buff_ab, 128124 => buff_aa, 135679 => buff_bb,
        135684 => buff_ba, 138621 => buff_cb[0], 138753 => buff_ca[0],
        1105576=> buff_ab, 1105581=> buff_aa, 1105631=> buff_ab,
        1105648=> buff_aa, 1105684=> buff_ab, 1105688=> buff_aa,
        1105736=> buff_ab, 1105740=> buff_aa, 1107623=> buff_aa,
        1107651=> buff_ab, 1109673=> buff_aa, 1109689=> buff_ab
      }.each{|k, v| fresh_pointer(k, v)}
    end
    #------------------------------------------------------------------------
    # * ... Change resolution
    #------------------------------------------------------------------------
    def change(w, h)
      map_reg(w, h)
      Graphics.resize_screen(w, h)
    end
  end

end
