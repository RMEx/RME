#RME : RPG Maker Extender
Outil d'extension de RPG Maker (les objets étendus ne sont documentés que pour les ajouts.)

[Documentation](README.md) > [Index des commandes](Liste des commandes.md) > **Commandes de communication client-serveur**  
- - -  
#Commandes de communication client-serveur
Commandes pour communiquer avec un serveur TCP/IP

##Liste des commandes
*    [socket_connect(address, port)](#socket_connectaddress-port)
*    [socket_connected?](#socket_connected)
*    [socket_disconnect](#socket_disconnect)
*    [socket_recv(*len)](#socket_recvlen)
*    [socket_send(data)](#socket_senddata)
*    [socket_wait_recv(*len)](#socket_wait_recvlen)


##Description des commandes
##### socket_connect(address, port)

> Se connecte à un serveur, renvoie true si la connexion à réussie, false sinon.

  
> Nom|Type|Description  
--- | --- | ---  
`address`|`String`|Adresse du serveur  
`port`|`Fixnum`|Port d'écoute  


##### socket_connected?

> Renvoi true si la connexion est en cours, false, sinon

  
> 

##### socket_disconnect

> Déconnecte la connexion courrante

  
> 

##### socket_recv(*len)

> Renvoi le message envoyé par le serveur au client, false si aucun message n' est reçu

  
> Nom|Type|Description  
--- | --- | ---  
`*len`|`Fixnum`|Taille maximale du message à recevoir, par défaut 1024  


##### socket_send(data)

> Envoi un message au serveur connecté, renvoie true en cas de réussite, false en cas d'échec

  
> Nom|Type|Description  
--- | --- | ---  
`data`|`String`|Message à envoyer  


##### socket_wait_recv(*len)

> Attend une réponse du serveur, se termine quand une réponse a été reçue (et l'a renvoi)

  
> Nom|Type|Description  
--- | --- | ---  
`*len`|`Fixnum`|Taille maximale du message à recevoir, par défaut 1024  


