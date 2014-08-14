#Generative::CommandAPI
[Retourner à l'index](README.md)

Rend accessible les commandes EventExtender

##Méthodes
**self.command(`name`, `args`)**

> Appel d'une commande, alias : c, cmd  
  
> Nom|Type|Description  
--- | --- | ---  
`name`|`Symbol`|Nom de la commande à appeler  
`args`|`Argslist`|Suite d'arguments  
  


Exemple  
```ruby  
command(:test, 1, 2, 3) #Appel Command.test(1,2,3) (ou : c(:test, 1,2,3) ou cmd(:test, 1,2,3)  
```



