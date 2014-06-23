#Object
[Retourner à l'index](README.md)

Extension de la classe Object

##Méthodes
`Object.delegate(obj, method, m_alias)`

> Délègue à une méthode ou un attribut une méthode  
  
> Nom|Type|Description  
--- | --- | ---  
obj|`Symbol`|Attribut ou méthode à pointer  
method|`Symbol`|Méthode à appeler  
m_alias|`Symbol`|Alias de la méthode, peut être ommis  
  


`Object.delegate_accessor(obj, field)`

> Délègue à une méthode les accesseurs, mutateurs d'un attribut  
  
> Nom|Type|Description  
--- | --- | ---  
obj|`Symbol`|Attribut ou méthode à pointer  
field|`Symbol`|Attribut de l'obj à déléguer  
  


`Object.externalize(obj, m_alias)`

> Transforme un object 'callable' en méthode  
  
> Nom|Type|Description  
--- | --- | ---  
obj|`Proc`|Objet callable  
m_alias|`Symbol`|Nom de la méthode  
  


`self.identity()`

> Renvoi l'instance pointée  
  
>   


`self.attr_values()`

> Renvoi un hash des attributs où la clé est le nom de l'attribut
                            et la valeur est la valeur de l'attribut  
  
>   


`self.buffer(size)`

> Renvoi un buffer (pour les Win32API's)  
  
> Nom|Type|Description  
--- | --- | ---  
size|`Fixnum`|Taille du buffer  
  


