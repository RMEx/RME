#Object
[Retourner à l'index](README.md)

Extension de la classe Object

##Liste des méthodes
**Object.delegate(`obj`, `method`, `m_alias`)**

> Délègue une méthode à une autre méthode ou à un attribut

  
> Nom|Type|Description  
--- | --- | ---  
`obj`|`Symbol`|Attribut ou méthode à pointer  
`method`|`Symbol`|Méthode à appeler  
`m_alias`|`Symbol`|Alias de la méthode, peut être omis  






**Object.delegate_accessor(`obj`, `field`)**

> Délègue les accesseurs, mutateurs d'un attribut à une méthode

  
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






**self.attr_values**

> Renvoie un hash des attributs où la clé est le nom de l'attribut
                            et la valeur est celle de l'attribut

  
> 





**self.buffer(`size`)**

> Renvoie un buffer (pour les Win32API's)

  
> Nom|Type|Description  
--- | --- | ---  
`size`|`Fixnum`|Taille du buffer  






**self.identity**

> Renvoie l'instance pointée

  
> 





