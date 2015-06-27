#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Classes et modules](Classes et modules.md) > **Viewport**  
- - -  
#Viewport
Représente une portion de l'écran

##Attributs
Nom|Description  
--- | ---  
`elts`|Renvoie la liste des éléments inclus dans le Viewport  
`x`|(Lecture/écriture) Coordonnées X du coin supérieur gauche  
`y`|(Lecture/écriture) Coordonnées Y du coin supérieur gauche  
`width`|(Lecture/écriture) Largeur du rectangle  
`height`|(Lecture/écriture) Hauteur du rectangle  
##Liste des méthodes
*    [self.append(obj)](#selfappendobj)
*    [self.calc_height](#selfcalc_height)
*    [self.calc_width](#selfcalc_width)


##Description des méthodes
##### self.append(obj)

> Méthode (idéalement) privée d'ajout d'un élément dans le viewport (et à @elts)

  
> Nom|Type|Description  
--- | --- | ---  
`obj`|`Object`|Objet répondant aux méthodes x, y, width, height  






##### self.calc_height

> Renvoie la hauteur minimum requise pour afficher tous les éléments du viewport

  
> 





##### self.calc_width

> Renvoie la largeur minimum requise pour afficher tous les éléments du viewport

  
> 





