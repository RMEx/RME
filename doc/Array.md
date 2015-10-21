#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Classes et modules](Classes et modules.md) > **Array**  
- - -  
#Array
Extension des arrays

##Liste des méthodes
*    [self.to_point](#selfto_point)
*    [self.to_xy](#selfto_xy)


##Description des méthodes
##### self.to_point

> Retourne l'objet Point, que le tableau ait la forme [x, y] ou [Point]

  
> 





##### self.to_xy

> Retourne les valeurs 'x, y', que le tableau ait la forme [x, y] ou [Point]

  
> 



Exemple  
```ruby  
def foo?(*p)
  x, y = p.to_xy
  bar(x, y)
end
# La méthode foo? pourra recevoir soit (x, y), soit une instance de point en argument  
```



