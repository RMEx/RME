Object.link_snippet(:"Object.delegate", "
#Classe qui sera un attribut
class A
  attr_accessor :test
  def initialize
    @test = 99
  end
  def succ 
    return @test + 1
  end
end

#Classe qui Délègue
class B 
  attr_accessor :a
  delegate :a, :succ  #On crée la méthode Succ 
  def initialize
    @a = A.new
  end
end

#Exemple d'usage 
b = B.new 
b.succ # 100
")

Object.link_snippet(:"Object.externalize", "
TEST = lambda{|people| p 'Hello' + people.to_s}
class Say
  externalize TEST, :hello
end

t = Say.new
t.hello('Nuki') # p 'Hello Nuki'
")