# RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste%20des%20commandes.md) > **Textes**  
- - -  
# Textes
Commandes pour afficher du texte à l'écran, les textes sont référencés par des ID, comme les images.

## Liste des commandes
*    [fresh_text_id](#fresh_text_id)
*    [pixel_in_text?(id, x, y, *precise)](#pixel_in_textid-x-y-precise)
*    [text_change(id, text)](#text_changeid-text)
*    [text_erase(id)](#text_eraseid)
*    [text_mouse_click?(id, *precise)](#text_mouse_clickid-precise)
*    [text_mouse_hover?(id, *precise)](#text_mouse_hoverid-precise)
*    [text_mouse_press?(id, *key, *precise)](#text_mouse_pressid-key-precise)
*    [text_mouse_release?(id, *key, *precise)](#text_mouse_releaseid-key-precise)
*    [text_mouse_repeat?(id, *key, *precise)](#text_mouse_repeatid-key-precise)
*    [text_mouse_trigger?(id, *key, *precise)](#text_mouse_triggerid-key-precise)
*    [text_move(id, duration, wait_flag, x, y, zoom_x, zoom_y, opacity, blend_type, origin)](#text_moveid-duration-wait_flag-x-y-zoom_x-zoom_y-opacity-blend_type-origin)
*    [text_move?(id)](#text_moveid)
*    [text_opacity(id, *opacity, *duration, *wait_flag)](#text_opacityid-opacity-duration-wait_flag)
*    [text_position(id, x, y, *duration, *wait_flag)](#text_positionid-x-y-duration-wait_flag)
*    [text_profile(id, *profile)](#text_profileid-profile)
*    [text_progressive(id, value, delay, *block)](#text_progressiveid-value-delay-block)
*    [text_rotate(id, speed)](#text_rotateid-speed)
*    [text_show(id, text, profile, x, y, *zoom_x, *zoom_y, *opacity, *blend_type, *origin)](#text_showid-text-profile-x-y-zoom_x-zoom_y-opacity-blend_type-origin)
*    [text_value(id)](#text_valueid)
*    [text_x(id, x, *duration, *wait_flag)](#text_xid-x-duration-wait_flag)
*    [text_y(id, y, *duration, *wait_flag)](#text_yid-y-duration-wait_flag)
*    [text_zoom(id, zoom_x, zoom_y, *duration, *wait_flag)](#text_zoomid-zoom_x-zoom_y-duration-wait_flag)
*    [text_zoom_x(id, zoom_x, *duration, *wait_flag)](#text_zoom_xid-zoom_x-duration-wait_flag)
*    [text_zoom_y(id, zoom_y, *duration, *wait_flag)](#text_zoom_yid-zoom_y-duration-wait_flag)
*    [texts_clear](#texts_clear)


## Description des commandes
##### fresh_text_id

> Génère un ID non utilisé pour un texte

  
##### pixel_in_text?(id, x, y, *precise)

> Vérifie que le x, y sont inscrit dans le texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`x`|`Fixnum`|Coordonnées X  
`y`|`Fixnum`|Coordonnées Y  
`*precise`|`Boolean`|Si false, détecte via le rectangle du texte, si true, détecte au pixel près. Par défaut, false  
##### text_change(id, text)

> Change le texte affiché à l'écran

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
`text`|`String`|Nouveau texte  
##### text_erase(id)

> Supprime le texte affiché à l'écran

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
##### text_mouse_click?(id, *precise)

> Renvoie true si la souris survole et clique le texte référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`*precise`|`Boolean`|Si false, détecte via le rectangle du texte, si true, détecte au pixel près. Par défaut, false  
##### text_mouse_hover?(id, *precise)

> Renvoie true si la souris survole le texte référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`*precise`|`Boolean`|Si false, détecte via le rectangle du texte, si true, détecte au pixel près. Par défaut, false  
##### text_mouse_press?(id, *key, *precise)

> Renvoie true si la souris survole et presse en continu la touche référencée sur le texte référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`*key`|`Symbol`|Touche de la souris (par défaut, :mouse_left  
`*precise`|`Boolean`|Si false, détecte via le rectangle du texte, si true, détecte au pixel près. Par défaut, false  
##### text_mouse_release?(id, *key, *precise)

> Renvoie true si la souris survole et relâche la touche référencée sur le texte référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`*key`|`Symbol`|Touche de la souris (par défaut, :mouse_left  
`*precise`|`Boolean`|Si false, détecte via le rectangle du texte, si true, détecte au pixel près. Par défaut, false  
##### text_mouse_repeat?(id, *key, *precise)

> Renvoie true si la souris survole et presse successivement la touche référencée sur le texte référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`*key`|`Symbol`|Touche de la souris (par défaut, :mouse_left  
`*precise`|`Boolean`|Si false, détecte via le rectangle du texte, si true, détecte au pixel près. Par défaut, false  
##### text_mouse_trigger?(id, *key, *precise)

> Renvoie true si la souris survole et presse la touche référencée sur le texte référencé par son ID

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`*key`|`Symbol`|Touche de la souris (par défaut, :mouse_left  
`*precise`|`Boolean`|Si false, détecte via le rectangle du texte, si true, détecte au pixel près. Par défaut, false  
##### text_move(id, duration, wait_flag, x, y, zoom_x, zoom_y, opacity, blend_type, origin)

> Déplace un texte affiché à l'écran

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
`duration`|`Fixnum`|Durée du déplacement en frames  
`wait_flag`|`Boolean`|Attendre la fin du déplacement, par défaut, true  
`x`|`Fixnum`|Position en x où le texte doit se rendre  
`y`|`Fixnum`|Position en y ou le texte doit se rendre  
`zoom_x`|`Fixnum`|Zoom de la largeur (en %)  
`zoom_y`|`Fixnum`|Zoom de la hauteur (en %)  
`opacity`|`Fixnum`|Opacité (de 0 à 255)  
`blend_type`|`Fixnum`|Mode de fusion (0, 1, 2)   
`origin`|`Fixnum`|Origine  
##### text_move?(id)

> Retourne true sur le texte référencé par son ID est en mouvement, false sinon

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
##### text_opacity(id, *opacity, *duration, *wait_flag)

> Change l'opacité du texte, si aucune opacité n'est donnée, la commande renverra l'opacité du texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
`*opacity`|`Fixnum`|valeur de l'opacité, entre 0 et 255.  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
##### text_position(id, x, y, *duration, *wait_flag)

> Change la position d'un texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`x`|`Fixnum`|Position en x du texte  
`y`|`Fixnum`|Position en y du texte  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
##### text_profile(id, *profile)

> Change le profil du texte, si aucun profile n'est donné, la commande renverra le profil du texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
`*profile`|`String`|Nouveau profil  
##### text_progressive(id, value, delay, *block)

> Affiche progressivement un texte (caractère par caractère)

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Id du champ de texte  
`value`|`String`|Texte a afficher  
`delay`|`Fixnum`|Durée (délai) entre chaque apparition de caractères  
`*block`|`Block`|Vous pouvez passer du code entre accolades qui va s'exécuter à chaque caractère (facultatif)  
##### text_rotate(id, speed)

> Fait tourner le texte (mettez une vitesse négative pour changer le sens de rotation)

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
`speed`|`Fixnum`|Vitesse de rotation  
##### text_show(id, text, profile, x, y, *zoom_x, *zoom_y, *opacity, *blend_type, *origin)

> Affiche un texte à l'écran

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|Identifiant du texte  
`text`|`String`|Texte a afficher  
`profile`|`String`|Profil du texte (voir Base de données)  
`x`|`Fixnum`|Position X  
`y`|`Fixnum`|Position Y  
`*zoom_x`|`Fixnum`|Zoom sur la largeur du texte par défaut 100 (pour 100%)  
`*zoom_y`|`Fixnum`|Zoom sur la hauteur du text par défaut 100 (pour 100%)  
`*opacity`|`Fixnum`|Opacité de l'image, par défaut 255 (de 0 à 255)  
`*blend_type`|`Fixnum`|Mode de fusion, par défaut 0, 0=Normal, 1=Addition, 2=Soustraction  
`*origin`|`Fixnum`|Origine du texte, 0 = Haut gauche, 1 = centré, par défaut, zéro  
##### text_value(id)

> Renvoie la valeur d'un texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
##### text_x(id, x, *duration, *wait_flag)

> Change l'axe X d'un texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`x`|`Fixnum`|Position en x du texte, si aucun argument n'est passé, la commande renverra la position X du texte  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
##### text_y(id, y, *duration, *wait_flag)

> Change l'axe Y d'un texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`y`|`Fixnum`|Position en y du texte, si aucun argument n'est passé, la commande renverra la position X du texte  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
##### text_zoom(id, zoom_x, zoom_y, *duration, *wait_flag)

> Change le zoom d'un texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`zoom_x`|`Fixnum`|zoom x du texte  
`zoom_y`|`Fixnum`|zoom y du texte  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
##### text_zoom_x(id, zoom_x, *duration, *wait_flag)

> Change le zoom X d'un texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`zoom_x`|`Fixnum`|zoom x du texte, si aucun argument n'est passé, la commande renverra le zoom X du texte  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
##### text_zoom_y(id, zoom_y, *duration, *wait_flag)

> Change le zoom y d'un texte

  
Nom|Type|Description  
--- | --- | ---  
`id`|`Fixnum`|ID du texte  
`zoom_y`|`Fixnum`|zoom y du texte, si aucun argument n'est passé, la commande renverra le zoom X du texte  
`*duration`|`Fixnum`|Par défaut, la transition est instantanée, si la duration vaut un nombre, l'effet sera progressif  
`*wait_flag`|`Boolean`|Attend la fin du déplacement, par défaut true  
##### texts_clear

> Supprime tous les textes

  
