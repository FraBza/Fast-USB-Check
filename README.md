# Fast-USB-Check
A simple script using BASH and 2 Popular AV - ClamAV and Malware Detect to do a fast Scan of any USB devices with some graphical interface

**_FR :_** 
Le script `Verifcle.sh `est un outil utilisé dans mon cas sur une machine Ubuntu graphique (la honte), mais aussi utilisable sur une Debian Graphique par exemple.
Dans l'optique de crée une **"Station Blanche"**. Bien sur la machine doit etre deconnecter du réseau après mise en place et installation de tout les outils pour commencer l'utilisation de notre celle-ci.

L'interface Graphique est utilisé dans l'idée de crée quelque chose de plus User-Friendly

 Il est necessaire d'avoir préalablement installer : 
> - ClamAV 
> - Malware Detect (Maldet)
> - Zenity

:$ sudo apt install **clamav** -----> https://doc.ubuntu-fr.org/clamav (pour ce documenter au niveau des mise à jour des ressources)

:$ sudo wget **http://www.rfxn.com/downloads/maldetect-current.tar.gz** --- > [https://github.com/andrewelkins/Linux-Malware-Detect/blob/master/files/maldet](url)

:$ tar xfz maldetect-current.tar.gz

:$ cd maldetect-1.X.X

:$ ./install.sh

:$ apt install ---- >zenity https://doc.ubuntu-fr.org/zenity



Pour lancer le scan il faut **ce connecter en tant que sudo** et ensuite lancer le script Verifcle.sh **(bien verifié le groupe qui lance le fichier par defaut)**
Selectionez la clé en question et patientez pendant que le scan ce fait. (Ajout d'une barre de progression prochainement)
		Un message recapitulatif "SCAN SUMMARY" s'affiche à l'ecran : il faut alors lire les données et validé.
`SCAN CLAMAV TERMINER`

![scanclamav](https://user-images.githubusercontent.com/89842037/192543793-595ed70a-1fac-49e0-8e32-f77d5274753e.png)

Ensuite le scan maldet ce lance automatiquement après la validation du précédent message
Un message recapitulatif s'affiche à l'ecran: il faut alors lire les données et validé.
`SCAN MALDET TERMINER`

![scanmaldet](https://user-images.githubusercontent.com/89842037/192544151-71476fb4-2b2f-459a-bf0c-2220175b2f8a.png)

Ce script à pour but de rendre plus léger l'usage des clé USB dans les entreprises et de rendre cela exceptionnel, dans le cas de l'exception un scan de ce genre peut etre utile (bien que pas forcément infaible bien sur...)

#######################################################

**_EN :_** 

The script `Verifcle.sh ` is a tool used in my case on a Ubuntu with an Graphical interface (what a shame), but still it will work easily on Debian.
In order to create our **"Sheep Dip"**. Of course the machine must be disconnected from the network after installing all the tools to start using it.

Graphical interface is used in the idea of creating something more user-friendly

 It is necessary to have previously installed: 
> - ClamAV 
> - Malware Detect (Maldet)
> - Zenity

:$ sudo apt install **clamav** -----> https://doc.ubuntu-fr.org/clamav (some doc about how to update ClamAV ressources)

:$ sudo wget **http://www.rfxn.com/downloads/maldetect-current.tar.gz** --- > [https://github.com/andrewelkins/Linux-Malware-Detect/blob/master/files/maldet](url)

:$ tar xfz maldetect-current.tar.gz

:$ cd maldetect-1.X.X

:$ ./install.sh

:$ apt install ---- >zenity https://doc.ubuntu-fr.org/zenity



To start the scan you must **connect as sudo** and then run the Verifcle.sh script **(check that the group that starts the file by default is sudo)**
Select the USB KEY in question and wait while the scan happen. (I Will add a progress bar soon)
		A recapitulative message "SCAN SUMMARY" is displayed on the screen: you must then read the data and validate.
`CLAMAV SCAN COMPLETED`

![scanclamav](https://user-images.githubusercontent.com/89842037/192543793-595ed70a-1fac-49e0-8e32-f77d5274753e.png)

Then the maldet scan starts automatically after the validation of the previous message
A recapitulative message is displayed on the screen: you must then read the data and validate.
`MALDET SCAN COMPLETED`

![scanmaldet](https://user-images.githubusercontent.com/89842037/192544151-71476fb4-2b2f-459a-bf0c-2220175b2f8a.png)

This script is intended to make the use of USB keys  lighter in companies and to make it exceptional, in the case of the exception a scan of this kind can be useful (although not necessarily perfect of course...)

