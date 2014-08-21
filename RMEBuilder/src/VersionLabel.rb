# -*- coding: utf-8 -*-
#==============================================================================
# ** Version_Label
#------------------------------------------------------------------------------
#  Version representation
#==============================================================================

class Version_Label < Struct.new(:major, :sub, :last)
	#--------------------------------------------------------------------------
	# * to_s
	#--------------------------------------------------------------------------
	def to_s
	  "v #{self.major}.#{self.sub}.#{self.last}"
	end
	#--------------------------------------------------------------------------
	# * Compare operation
	#--------------------------------------------------------------------------
	def cmp(oth)
	  if oth.is_a?(Version_Label)
	    return -1 if oth.major > self.major
	    return  1 if oth.major < self.major
	    return -1 if oth.sub > self.sub
	    return  1 if oth.sub < self.sub
	    return -1 if oth.last > self.last
	    return  1 if oth.last < self.last
	    return 0
	  else raise RuntimeError.new("Must be a Version_Label")
	  end
	end
	#--------------------------------------------------------------------------
	# * Operators overloading
	#--------------------------------------------------------------------------
	def ==(o); self.cmp(o) == 0; end 
	def >(o);  self.cmp(o) > 0; end
	def <(o);  self.cmp(o) < 0; end 
	def >=(o); self.cmp(o) >= 0; end 
	def <=(o); self.cmp(o) <= 0; end
end

#==============================================================================
# ** Kernel
#------------------------------------------------------------------------------
#  Common Interface
#==============================================================================

module Kernel
  def version(a = 1, b = 0, c = 0)
    Version_Label.new(a, b, c)
  end
  alias_method :vsn, :version
end