# RME Changelog

## Release (1.2.0)

### Commandes ajoutées

* `camera_scrolling?` (@xvw, reporté par @Zer0xZer0x)
* `windowskin_tone` et `windowskin_opacity` (@xvw, reporté par @YendaHusk)
* `event_tone` et `player_tone` (@xvw, reporté par @Zer0xZer0x)
* `event_character_name`, (@BastienDuplessier)
* `event_character_index`, (@BastienDuplessier)
* `event_change_character`, (@BastienDuplessier)
*    - `menu_enabled?|disabled?` 
     - `save_enabled?|disabled?`
     - `formation_enabled?|disabled?`
     - `encounter_enabled?|disabled?`
     (@xvw, reporté par Zer0xZer0x)

### Corrections de bogues

* Correction des commandes pour flasher les cases (@xvw)
* Correction de la commande `picture_zoom` (@xvw)

## Release (1.1.0)

### Commandes ajoutées

*  `last_used_item`, (@hinola, reporté par @Zer0xZer0x)
*  `disable_weather_dimness`+ `disable_weather_dimness` (@BastienDuplessier, reporté par @Zer0xZer0x)
*  `window_exists?` (@hinola)
*    - `camera_locked?` 
     - `camera_lock_x`
     - `camera_lock_y`
     - `camera_unlock_x`
     - `camera_unlock_y` 
     (@BastienDuplessier, reporté par @lunri)
*  `mouse_hover_window?` (@hinola)
*  `choice` + `last_choice` (@xvw reporté par @Zer0xZer0x)
*  - `dash_activation`
   - `dash_activate`
   - `dash_deactivate`
   - `dash_activate?`
   - `dash_deactivate?`
   (@xvw, reporté par @Zer0xZer0x)

### Corrections de bogues
*  Correction des commandes `armors_possessed` et `weapons_possessed` (@hinola)
*  Corrections des commandes `event_flash` et `player_flash` (@BastienDuplessier)
*  Correction de l'afficheur de texte (profil avec contours) (@xvw reporté par @jauke)
*  Correction des interpolations linéaires (@xvw reporté par @hinola)


## Avant la version 1.0.0
*  `1.0.0 => 02/09/2017 22:00` Ajout de commandes pour la caméra (Al Rind), Débogage des fenêtres (Zangther) et ajouts de fonctions relatives à l'équipe (Zangther). **A partir de maintenant, on passe en versionnement sémantique**.
*  `0.4.9 => 18/08/2017 01:00` Correction de la commande length (Nuki)
*  `0.4.8 => 18/08/2017 05:00` Correction du move_to (enfin) ! (Nuki)
*  `0.4.7 => 14/08/2017 05:00` Corrections de beaucoup de bugs et ajout de mouse_moving? (Nuki)
*  `0.4.6 => 11/08/2017 05:00` Implémentation de la réflexion d'événements sur une surface (Nuki)
*  `0.4.5 => 11/08/2017 01:00` Ajout des transitions en image (Nuki)
*  `0.4.4 => 04/08/2017 00:30` Implémentation du testeur de teinte (Joke et Nuki)
*  `0.4.3 => 06/08/2017 01:30` Direction facultative dans player_teleport (Nuki, reportée par Zer0zer0x)
*  `0.4.3 => 06/08/2017 01:00` Retrait du DocGenerator du package.rb (Nuki)
*  `0.4.2 => 05/08/2017 19:30` Ajout commandes fresh_quelquechose_id (Nuki, reporté par Husk)
*  `0.4.1 => 04/08/2017 17:50` Ajout commandes d'intéraction texte/souris (Joke, reporté par Spyrojojo)
*  `0.4.0 => 04/08/2017 02:00` Modification de l'algorithme de complétion pour le testeur de scripts (Nuki)
*  `0.3.9 => 04/08/2017 01:30` Ajout d'un paramètre à fresh_event_id (Nuki, reporté par Husk)
*  `0.3.8 => 04/08/2017 00:45` Correction du "testeur" (Joke et Nuki, reporté par Spyrojojo)
*  `0.3.7 => 04/08/2017 00:30` Changement du "testeur de script en jeu" (Joke et Nuki)
