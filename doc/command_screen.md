#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Ecran**  
- - -  
#Ecran
Commandes pour manipuler l'écran (teintes, vibrations etc)

##Liste des commandes
*    [screen_fadein(duration)](#screen_fadeinduration)
*    [screen_fadeout(duration)](#screen_fadeoutduration)
*    [screen_flash(color, duration, *wait_flag)](#screen_flashcolor-duration-wait_flag)
*    [screen_height](#screen_height)
*    [screen_shake(power, speed, duration, *wait_flag)](#screen_shakepower-speed-duration-wait_flag)
*    [screen_tone(tone, duration, *wait_flag)](#screen_tonetone-duration-wait_flag)
*    [screen_width](#screen_width)


##Description des commandes
##### screen_fadein(duration)

> Affiche l'écran en fondu (de manière moins radicale que la commande fadein)

  
> Nom|Type|Description  
--- | --- | ---  
`duration`|`Fixnum`|Durée en frame  


##### screen_fadeout(duration)

> Efface l'écran en fondu (de manière moins radicale que la commande fadeout)

  
> Nom|Type|Description  
--- | --- | ---  
`duration`|`Fixnum`|Durée en frame  


##### screen_flash(color, duration, *wait_flag)

> Envoie un flash à l'écran

  
> Nom|Type|Description  
--- | --- | ---  
`color`|`Color`|Couleur du flash (utilisez la commande 'color')  
`duration`|`Fixnum`|Durée en frames  
`*wait_flag`|`Boolean`|Attend la fin de l'effet (true), n'attend pas (false). Par défaut cet argument vaut false  


##### screen_height

> Renvoie la hauteur de l'écran (en pixels)

  
> 

##### screen_shake(power, speed, duration, *wait_flag)

> Fait trembler l'écran pendant une durée déterminée

  
> Nom|Type|Description  
--- | --- | ---  
`power`|`Fixnum`|Puissance du tremblement  
`speed`|`Fixnum`|Vitesse du tremblement  
`duration`|`Fixnum`|Durée en frames  
`*wait_flag`|`Boolean`|Attend la fin de l'effet (true), n'attend pas (false). Par défaut cet argument vaut false  


##### screen_tone(tone, duration, *wait_flag)

> Change la teinte de l'écran

  
> Nom|Type|Description  
--- | --- | ---  
`tone`|`Tone`|Teinte (utilisez la commande 'tone')  
`duration`|`Fixnum`|Durée en frame  
`*wait_flag`|`Boolean`|Attend la fin de l'effet (true), n'attend pas (false). Par défaut cet argument vaut false  


##### screen_width

> Renvoie la largeur de l'écran (en pixels)

  
> 

