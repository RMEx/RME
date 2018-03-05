[Join us on Discord !](https://discord.gg/yRUZcdQ)

# [![RMEx](http://rmex.github.io/images/rmex-shortcut.png)](http://rmex.github.io) [RME : RPG Maker Extender](https://github.com/RMEx/RME/wiki)

**RME** is the successor of **[Event Extender](http://funkywork.github.io/EE)**.
It offers a collection of tools to promote the personalization of an RPG Maker VX Ace project.
It is the result of the work of many people and any contribution is welcome.

***

## Some features:
- Add **+700 event commands** in the form of small script calls
  - **Map** commands (Carte)
  - **Standard** commands (Standards)
  - **Event** commands (Evénements)
  - **Keyboard** commands (Clavier)
  - **Mouse** commands (Souris)
  - **Picture** commands (Images)
  - **Parallax** commands (Panoramas)
  - **Team** commands (Equipes)
  - **Item** commands (Objets)
  - **Armor/Weapon** commands (Armures/Armes)
  - **System** commands (Systèmes)
  - **Actor** commands (Acteurs)
  - **Skill** commands (Techniques)
  - **Mathematical** commands (Mathématiques)
  - **Troop** commands (Groupes)
  - **Monster** commands (Ennemis)
  - **Battle** commands (En combat)
  - **Text** commands (Textes)
  - **Time** commands (Date/Heure)
  - **Socket** commands (Client-Serveur)
  - **Scene** commands (Scenes)
  - **Save/Load** commands (Sauvegardes)
  - **Virtual area** commands (Zones virtuelles)
  - **Textfield** commands (Champs de texte)
  - **Clipboard** commands (Presse-papier)
  - **Pad XBOX360 vibration** commands (Vibrations (XBOX360))
  - **BGM/BGS/ME/SE** commands (Sons)
  - **Camera** commands (Caméra)
  - **Screen effects** commands (Ecran)
  - **Game windows** commands (Fenêtres)
  - **Special effects** commands (Effets spéciaux)
  - **File** commands (Fichiers)
  - **Spritesheet** commands (Spritesheet)

- Add `V[id]` and `S[id]` shortcut for manipulating global variables and global switches in script calls
- Add labels, self-labels, self-variables and extend self-switches
  - `L[key]` : label (ex.: `L[:foo] = "bar"`)
  - `SL[key]` : self-label (ex.: `SL[:x] = event_x(1)`)
  - `SS[id]` : self-switch (ex.: `SS[6] = player_moving?`)
  - `SV[id]` : self-variable (ex.: `SV[1] = 5`)
- Call self-labels/variables/swtich from another event or map (`SV[id_event, id]`, `SV[id_map, id_event, id]`...)
- Can eval commands live ingame with the **command-tester** (F3)
- Can test the tone of the screen with the **tone-tester** (F4)
- Add maps related events, custom triggers, events selectors...
  see the wiki! ;)

***

## Installation

Copy/paste the content of `RME.rb` in your scripts... that's all!

***

## [Lastest Release](https://github.com/RMEx/RME/releases/latest)

***

## [Wiki / User Manual (EN)](https://github.com/RMEx/RME-uk/wiki)
## [Wiki / Manuel d'utilisation (FR)](https://github.com/RMEx/RME/wiki)

***

## [Command documentation (FR)](http://rmex.github.io/RMEDoc/)

Unfortunately, the command documentation is not yet available in English, but it is easy to understand what a command is for because its name and parameters are in English! :)

***

## [Contribute to the project](https://github.com/RMEx/RME-uk/wiki/Contribute-to-the-project)
## [Contribuer au projet](https://github.com/RMEx/RME/wiki/Contribuer-au-projet)
