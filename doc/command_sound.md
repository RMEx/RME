#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Commandes de manipulation des sons**  
- - -  
#Commandes de manipulation des sons
Commandes relatives à la manipulation des sons

##Liste des commandes
*    [bgm_fade(wait, *frame)](#bgm_fadewait-frame)
*    [bgm_pitch(pitch)](#bgm_pitchpitch)
*    [bgm_play(name, *volume, *pitch)](#bgm_playname-volume-pitch)
*    [bgm_stop](#bgm_stop)
*    [bgm_volume(volume)](#bgm_volumevolume)
*    [bgs_fade(wait, *frame)](#bgs_fadewait-frame)
*    [bgs_pitch(pitch)](#bgs_pitchpitch)
*    [bgs_play(name, *volume, *pitch)](#bgs_playname-volume-pitch)
*    [bgs_stop](#bgs_stop)
*    [bgs_volume(volume)](#bgs_volumevolume)
*    [me_fade(wait, *frame)](#me_fadewait-frame)
*    [me_play(name, *volume, *pitch)](#me_playname-volume-pitch)
*    [me_stop](#me_stop)
*    [replay_bgm](#replay_bgm)
*    [save_bgm](#save_bgm)
*    [se_play(name, *volume, *pitch)](#se_playname-volume-pitch)
*    [se_stop](#se_stop)
*    [sound_fade(wait, *frame)](#sound_fadewait-frame)
*    [sound_stop](#sound_stop)


##Description des commandes
##### bgm_fade(wait, *frame)

> Arrêt en fondu du BGM en cours

  
> Nom|Type|Description  
--- | --- | ---  
`wait`|`Fixnum`|Temps du fondu, par défaut en secondes  
`*frame`|`Boolean`|Spécifiez 'true' si vous renseignez un temps en frames plutôt qu'en secondes  


##### bgm_pitch(pitch)

> Change la vitesse du BGM en cours

  
> Nom|Type|Description  
--- | --- | ---  
`pitch`|`Fixnum`|Vitesse du BGM. Pourcentage entre 1 et 453  


##### bgm_play(name, *volume, *pitch)

> Joue un BGM

  
> Nom|Type|Description  
--- | --- | ---  
`name`|`String`|Nom du BGM  
`*volume`|`Fixnum`|Volume du BGM. Pourcentage entre 0 et 100. Par défaut : 100  
`*pitch`|`Fixnum`|Vitesse du BGM. Pourcentage entre 1 et 453. Par défaut : 100  


##### bgm_stop

> Stoppe le BGM en cours

  
> 

##### bgm_volume(volume)

> Change le volume du BGM en cours

  
> Nom|Type|Description  
--- | --- | ---  
`volume`|`Fixnum`|Volume du BGM. Pourcentage entre 0 et 100  


##### bgs_fade(wait, *frame)

> Arrêt en fondu du BGS en cours

  
> Nom|Type|Description  
--- | --- | ---  
`wait`|`Fixnum`|Temps du fondu (en secondes)  
`*frame`|`Boolean`|Spécifiez 'true' si vous renseignez un temps en frames plutôt qu'en secondes  


##### bgs_pitch(pitch)

> Change la vitesse du BGS en cours

  
> Nom|Type|Description  
--- | --- | ---  
`pitch`|`Fixnum`|Vitesse du BGS. Pourcentage entre 1 et 453  


##### bgs_play(name, *volume, *pitch)

> Joue un BGS

  
> Nom|Type|Description  
--- | --- | ---  
`name`|`String`|Nom du BGS  
`*volume`|`Fixnum`|Volume du BGS. Pourcentage entre 0 et 100. Par défaut : 80  
`*pitch`|`Fixnum`|Vitesse du BGS. Pourcentage entre 1 et 453. Par défaut : 100  


##### bgs_stop

> Stoppe le BGS en cours

  
> 

##### bgs_volume(volume)

> Change le volume du BGS en cours

  
> Nom|Type|Description  
--- | --- | ---  
`volume`|`Fixnum`|Volume du BGS. Pourcentage entre 0 et 100  


##### me_fade(wait, *frame)

> Arrêt en fondu du ME en cours

  
> Nom|Type|Description  
--- | --- | ---  
`wait`|`Fixnum`|Temps du fondu, par défaut en secondes  
`*frame`|`Boolean`|Spécifiez 'true' si vous renseignez un temps en frames plutôt qu'en secondes  


##### me_play(name, *volume, *pitch)

> Joue un ME

  
> Nom|Type|Description  
--- | --- | ---  
`name`|`String`|Nom du ME  
`*volume`|`Fixnum`|Volume du ME. Pourcentage entre 0 et 100. Par défaut : 100  
`*pitch`|`Fixnum`|Vitesse du ME. Pourcentage entre 1 et 453. Par défaut : 100  


##### me_stop

> Stoppe le ME en cours

  
> 

##### replay_bgm

> Reprend le BGM mémorisé

  
> 

##### save_bgm

> Mémorise le BGM en cours

  
> 

##### se_play(name, *volume, *pitch)

> Joue un SE

  
> Nom|Type|Description  
--- | --- | ---  
`name`|`String`|Nom du SE  
`*volume`|`Fixnum`|Volume du SE. Pourcentage entre 0 et 100. Par défaut : 80  
`*pitch`|`Fixnum`|Vitesse du SE. Pourcentage entre 1 et 453. Par défaut : 100  


##### se_stop

> Stoppe le SE en cours

  
> 

##### sound_fade(wait, *frame)

> Stoppe les BGM et BGS en fondu

  
> Nom|Type|Description  
--- | --- | ---  
`wait`|`Fixnum`|Temps du fondu, par défaut en secondes  
`*frame`|`Boolean`|Spécifiez 'true' si vous renseignez un temps en frames plutôt qu'en secondes  


##### sound_stop

> Stoppe tous les sons en cours

  
> 

