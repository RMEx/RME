#Viewport
[Retourner à l'index](README.md)

Représente une portion de l'écran

##Attributs
Nom|Description  
--- | ---  
`elts`|Renvoie la liste des éléments inclus dans le Viewport  
`x`|(Lecture/ecriture) Coordonnées X du coin superieur gauche  
`y`|(Lecture/ecriture) Coordonnées Y du coin superieur gauche  
`width`|(Lecture/ecriture) Largeur du rectangle  
`height`|(Lecture/ecriture) Hauteur du rectangle  
##Méthodes
**self.append(`obj`)**

> Méthode (idéalement) privée d'ajout d'un élément dans le viewport (et à @elts)  
  
> Nom|Type|Description  
--- | --- | ---  
`obj`|`Object`|Objet répondant aux méthodes x, y, width, height  
  




**self.calc_width**

> Renvoie la largeur requise minimum pour afficher tous les éléments du viewport  
  
>   




**self.calc_height**

> Renvoie la hauteur requise minimum pour afficher tous les éléments du viewport  
  
>   




