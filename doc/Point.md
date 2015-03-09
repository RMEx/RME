#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Classes et modules](Classes et modules.md) > **Point**  
- - -  
#Point
Représente un point dans un plan cartésien

##Liste des méthodes
*    [Point.new(x, y)](#pointnewx-y)
*    [self.bitmap_to_screen(sprite)](#selfbitmap_to_screensprite)
*    [self.in?(rect)](#selfinrect)
*    [self.null!](#selfnull)
*    [self.rotate(angle, x, y)](#selfrotateangle-x-y)
*    [self.screen_to_bitmap(sprite)](#selfscreen_to_bitmapsprite)
*    [self.screen_to_sprite(sprite)](#selfscreen_to_spritesprite)
*    [self.set(x, y)](#selfsetx-y)


##Description des méthodes
##### Point.new(x, y)

> Constructeur de point

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X du point  
`y`|`Fixnum`|Coordonnées Y du point  






##### self.bitmap_to_screen(sprite)

> Transforme les coordonnées du point, du référentiel du bitmap vers l'écran en fonction des paramètres du sprite

  
> Nom|Type|Description  
--- | --- | ---  
`sprite`|`Sprite`|Sprite à vérifier  






##### self.in?(rect)

> Vérifie si un point est inscrit dans un rectangle

  
> Nom|Type|Description  
--- | --- | ---  
`rect`|`Rect`|Rectangle à vérifier  






##### self.null!

> Replace le X et le Y du point à zéro

  
> 





##### self.rotate(angle, x, y)

> Rotation du point par rapport au point passé en argument (via (x, y), ou via une instance de Point)

  
> Nom|Type|Description  
--- | --- | ---  
`angle`|`Fixnum`|Angle de rotation en degrés décimaux (sens positif = sens trigonométrique)  
`x`|`Fixnum`|Coordonnées X du point à l'origine de la rotation  
`y`|`Fixnum`|Coordonnées Y du point à l'origine de la rotation  






##### self.screen_to_bitmap(sprite)

> Transforme les coordonnées du point, de l'écran vers le référentiel du bitmap en fonction des paramètres du sprite

  
> Nom|Type|Description  
--- | --- | ---  
`sprite`|`Sprite`|Sprite à vérifier  






##### self.screen_to_sprite(sprite)

> Transforme les coordonnées du point, de l'écran vers le référentiel du sprite

  
> Nom|Type|Description  
--- | --- | ---  
`sprite`|`Sprite`|Sprite à vérifier  






##### self.set(x, y)

> Change les coordonnées du point

  
> Nom|Type|Description  
--- | --- | ---  
`x`|`Fixnum`|Coordonnées X du point  
`y`|`Fixnum`|Coordonnées Y du point  






