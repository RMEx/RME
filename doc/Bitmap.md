#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Classes et modules](Classes et modules.md) > **Bitmap**  
- - -  
#Bitmap
Extension des Bitmaps

##Liste des méthodes
*    [self.fast_get_pixel(x, y)](#selffast_get_pixelx-y)
*    [self.is_transparent?(x, y)](#selfis_transparentx-y)


##Description des méthodes
##### self.fast_get_pixel(x, y)

> Retourne l'objet Color correspondant au point passé en argument (via (x, y), ou via une instance de Point) de manière très rapide

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  






##### self.is_transparent?(x, y)

> Vérifie si le point passé en argument (via (x, y), ou via une instance de Point) est sur un pixel transparent

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  






