#Object
[Retourner à l'index](README.md)

Extension de la classe Object

##Méthodes
**Object.delegate(`obj`, `method`, `m_alias`)**

> Délègue à une méthode ou un attribut une méthode  
  
> Nom|Type|Description  
--- | --- | ---  
`obj`|`Symbol`|Attribut ou méthode à pointer  
`method`|`Symbol`|Méthode à appeler  
`m_alias`|`Symbol`|Alias de la méthode, peut être ommis  
  


Exemple  
```ruby  

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
  
```



**Object.delegate_accessor(`obj`, `field`)**

> Délègue à une méthode les accesseurs, mutateurs d'un attribut  
  
> Nom|Type|Description  
--- | --- | ---  
`obj`|`Symbol`|Attribut ou méthode à pointer  
`field`|`Symbol`|Attribut de l'obj à déléguer  
  




**Object.externalize(`obj`, `m_alias`)**

> Transforme un object 'callable' en méthode  
  
> Nom|Type|Description  
--- | --- | ---  
`obj`|`Proc`|Objet callable  
`m_alias`|`Symbol`|Nom de la méthode  
  


Exemple  
```ruby  

TEST = lambda{|people| p 'Hello' + people.to_s}
class Say
  externalize TEST, :hello
end

t = Say.new
t.hello('Nuki') # p 'Hello Nuki'
  
```



**self.identity()**

> Renvoi l'instance pointée  
  
>   




**self.attr_values()**

> Renvoi un hash des attributs où la clé est le nom de l'attribut
                            et la valeur est la valeur de l'attribut  
  
>   




**self.buffer(`size`)**

> Renvoi un buffer (pour les Win32API's)  
  
> Nom|Type|Description  
--- | --- | ---  
`size`|`Fixnum`|Taille du buffer  
  




