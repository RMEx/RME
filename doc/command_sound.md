#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Commandes de manipulation des sons**  
- - -  
#Commandes de manipulation des sons
Commandes relative à la manipulation des sons

##Liste des commandes
*    [sound_BGM_fade(wait, frame)](#sound_bgm_fadewait-frame)
*    [sound_BGM_pitch(pitch)](#sound_bgm_pitchpitch)
*    [sound_BGM_play(name, volume, tempo)](#sound_bgm_playname-volume-tempo)
*    [sound_BGM_stop](#sound_bgm_stop)
*    [sound_BGM_volume(volume)](#sound_bgm_volumevolume)
*    [sound_BGS_fade(wait, frame)](#sound_bgs_fadewait-frame)
*    [sound_BGS_pitch(pitch)](#sound_bgs_pitchpitch)
*    [sound_BGS_play(name, volume, tempo)](#sound_bgs_playname-volume-tempo)
*    [sound_BGS_stop](#sound_bgs_stop)
*    [sound_BGS_volume(volume)](#sound_bgs_volumevolume)
*    [sound_ME_pitch(pitch)](#sound_me_pitchpitch)
*    [sound_ME_play(name, volume, tempo)](#sound_me_playname-volume-tempo)
*    [sound_ME_stop](#sound_me_stop)
*    [sound_ME_volume(volume)](#sound_me_volumevolume)
*    [sound_SE_pitch(pitch)](#sound_se_pitchpitch)
*    [sound_SE_play(name, volume, tempo)](#sound_se_playname-volume-tempo)
*    [sound_SE_stop](#sound_se_stop)
*    [sound_SE_volume(volume)](#sound_se_volumevolume)
*    [sound_fade(wait, frame)](#sound_fadewait-frame)
*    [sound_stop](#sound_stop)


##Description des commandes
##### sound_BGM_fade(wait, frame)

> Stop le BGM en cours en fondu

  
> Nom|Type|Description  
--- | --- | ---  
`wait`|`Fixnum`|Temps du fondu en seconde  
`frame`|`Boolean`|si true le fondu ce fait par frame sinon par seconde  


##### sound_BGM_pitch(pitch)

> Change la vitesse du BGM en cours

  
> Nom|Type|Description  
--- | --- | ---  
`pitch`|`Fixnum`|Vitesse du BGM  


##### sound_BGM_play(name, volume, tempo)

> Joue une musique BGM

  
> Nom|Type|Description  
--- | --- | ---  
`name`|`String`|Nom du BGM  
`volume`|`Fixnum`|Volume du BGM  
`tempo`|`Fixnum`|Tempo du BGM  


##### sound_BGM_stop

> Stop le BGM en cours

  
> 

##### sound_BGM_volume(volume)

> Change le volume du BGM en cours

  
> Nom|Type|Description  
--- | --- | ---  
`volume`|`Fixnum`|Volume du BGM  


##### sound_BGS_fade(wait, frame)

> Stop le BGS en cours en fondu

  
> Nom|Type|Description  
--- | --- | ---  
`wait`|`Fixnum`|Temps du fondu en seconde  
`frame`|`Boolean`|si true le fondu ce fait par frame sinon par seconde  


##### sound_BGS_pitch(pitch)

> Change la vitesse du BGS en cours

  
> Nom|Type|Description  
--- | --- | ---  
`pitch`|`Fixnum`|Vitesse du BGS  


##### sound_BGS_play(name, volume, tempo)

> Joue une musique BGS

  
> Nom|Type|Description  
--- | --- | ---  
`name`|`String`|Nom du BGS  
`volume`|`Fixnum`|Volume du BGS  
`tempo`|`Fixnum`|Tempo du BGS  


##### sound_BGS_stop

> Stop le BGS en cours

  
> 

##### sound_BGS_volume(volume)

> Change le volume du BGS en cours

  
> Nom|Type|Description  
--- | --- | ---  
`volume`|`Fixnum`|Volume du BGS  


##### sound_ME_pitch(pitch)

> Change la vitesse du ME en cours

  
> Nom|Type|Description  
--- | --- | ---  
`pitch`|`Fixnum`|Vitesse du ME  


##### sound_ME_play(name, volume, tempo)

> Joue un ME

  
> Nom|Type|Description  
--- | --- | ---  
`name`|`String`|Nom du ME  
`volume`|`Fixnum`|Volume du ME  
`tempo`|`Fixnum`|Tempo du ME  


##### sound_ME_stop

> Stop le ME en cours

  
> 

##### sound_ME_volume(volume)

> Change le volume du ME en cours

  
> Nom|Type|Description  
--- | --- | ---  
`volume`|`Fixnum`|Volume du ME  


##### sound_SE_pitch(pitch)

> Change la vitesse du SE en cours

  
> Nom|Type|Description  
--- | --- | ---  
`pitch`|`Fixnum`|Vitesse du SE  


##### sound_SE_play(name, volume, tempo)

> Joue un SE

  
> Nom|Type|Description  
--- | --- | ---  
`name`|`String`|Nom du SE  
`volume`|`Fixnum`|Volume du SE  
`tempo`|`Fixnum`|Tempo du SE  


##### sound_SE_stop

> Stop le SE en cours

  
> 

##### sound_SE_volume(volume)

> Change le volume du SE en cours

  
> Nom|Type|Description  
--- | --- | ---  
`volume`|`Fixnum`|Volume du SE  


##### sound_fade(wait, frame)

> Stop les BGM et BGS en fondu

  
> Nom|Type|Description  
--- | --- | ---  
`wait`|`Fixnum`|Temps du fondu  
`frame`|`Boolean`|si true le fondu ce fait par frame sinon par seconde  


##### sound_stop

> Stop tout les sons en cours

  
> 

