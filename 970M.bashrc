#------------------------------------------------------------------------------#
#                            BASHRC FOR GYOM                                   #
#------------------------------------------------------------------------------#
# @File : gd_alias.bshrc
#
# @Authors : Guillaume DAGUET
#            gd.guillaume.daguet@gmail.com
#            [+|)
#
# @Date : 01/09/2021
#
# @Version : V1.0
#
# @Synopsis : Exemple d'entete de fichier
#             qui peut se continuer sur plusieurs lignes
#
# @Pré-requis :
#
#    1- Créer le repertoire ~/.bashrc.d
#    2- Ajouter le § suivant dans le fichier ~/.bashrc
#
#       # Source all .bashrc files in ~/bashrc.d
#       for file in ~/.bashrc.d/*.bashrc; do
#           . "$file"
#       done
#
#    3- Déposer le présent fichier gd_alias.bashrc dans ~/.bashrc.d
#

####### N° DE VERSION 
#
#   w.x.y.z : 
#
#    + w est le numéro de version Majeure : 
#       il est incrémenté lorsque de grosses modifications ont été apportées, et qui cassent la compatibilité avec la version majeure précédente w-1,
#       nécessitant donc de grosses modifications dans les projets pour la migration.
#
#    + x est le numéro de version Mineure : 
#       il est incrémenté quand il y a de nouvelles fonctionnalités, évolutions, corrections de bugs etc. 
#       Par contre un projet basé sur une version w.x doit être # compatible avec une version w.x-1.
#
#    + y est le numéro de version de correction, appelé Release: il change quand il y a eu simplement des corrections de bugs par rapport à la version w.x.y-1.
#
#    + z est le numéro de version de build : Celui-ci permet de s'incrémenter à chaque fois que vous compiler votre programm
#


# ============================================================================
# [[ Variables d'environement ]]
# ============================================================================

### PATHS
export W012X="$HOME/GD_W012X"
export G70M="$HOME/GD_970M"

export GDWRK="$W012X/gd_workspace"
export GDCONF="$W012X/gd_workspace/conf"

export EDITEUR="code -r "

####### [[ Mes Alias ]]

alias ll='ls -lF'
alias l='ls -CF1'
alias ltr='ls -ltr'
alias la='ls -ltra'
alias cdt="cd $HOME/Téléchargements"
alias cdg="cd $G70M"
alias cdx="cd $W012X"
alias cdd="cd $HOME/Documents"
alias cdb="cd $GDWRK/bin"
alias cdv="cd $GDWRK/dev"
alias cdc="cd $GDWRK/conf"
alias cdw="cd $GDWRK"
alias gd="cd $W012X/'[+|]'"

alias lsapp="ls /usr/share/applications | awk -F '.desktop' ' { print $1}'" # Liste des logiciels installés
alias permall="$GDWRK/bin/perm_mng.sh"

####### [[ Mes Alias Fonctionnels ]]

alias start_ap='lamp_mng.sh -s'
alias stop_ap='lamp_mng.sh -e'

####### [[ Mise à jour de $PATH ]]

PATH=$GDWRK/bin:$PATH
PATH=$GDWRK/dev/scripts:$PATH

#PATH=__NEWPATH__:$PATH
export PATH


# ============================================================================
# [[ Fonction shell ]]
# ============================================================================
### Liste l'ensemble des fonctions ci-dessous
sos()
{


cat << EOF

add_sudo()  : Autorisation de sudo pour un script
adm()       : Afficher les commandes d'administration système
af()        : Ouvir l'editeur de texte
arbo()      : Afficher les commandes d'administration système
bu()        : Ouvir fichier bujo
code_conf() : Ouvrir fichier de configuration VSCode
ex ()       : Extraire des archives
perm()      : Afficher les commande pour modifier les privilèges
upt_bash()  : Mise à jour bashrc

EOF
}



### Ouvir l'editeur de texte
af()
{
    if [ -f $1 ] ; then
        $EDITEUR $1
    else
        $EDITEUR
    fi
}


### Ouvir fichier bujo
bu()
{
    af $G70M/GD/GD_ID/_GD_BuJo.log

}

### Autorisation de sudo pour un script
add_sudo()
{
    if [ -f $1 ] ; then
        #--- Donner le fichier à root
        sudo chown root $1
        #--- mettre le bit setuid
        sudo chmod +s $1
    else
        echo "'$1' fichier invalide"
    fi
}

### Extraction archives
ex ()
{
    if [ -f $1 ] ; then
        case $1 in
        *.tar.bz2)   tar xjf $1   ;;
        *.tar.gz)    tar xzf $1   ;;
        *.bz2)       bunzip2 $1   ;;
        *.rar)       unrar x $1     ;;
        *.gz)        gunzip $1    ;;
        *.tar)       tar xf $1    ;;
        *.tbz2)      tar xjf $1   ;;
        *.tgz)       tar xzf $1   ;;
        *.zip)       unzip $1     ;;
        *.Z)         uncompress $1;;
        *.7z)        7z x $1      ;;
        *)           echo "'$1' ne peut etre extrait par ex()" ;;
        esac
    else
        echo "'$1' fichier invalide"
    fi
}


## Ouvrir fichier de config. VSCode
code_conf()
{
    af $HOME/.config/Code/User/settings.json
}



## Mise à jour bashrc
upt_bash()
{

    if [ -f $GDCONF/gd_config/gd_alias.bashrc ] ; then

        echo "Maj de ~/.bashrc.d/gd_alias.bashrc"
	    cp "$GDCONF/gd_config/gd_alias.bashrc" ~/.bashrc.d
        echo "Source du fichier"
        . ~/.bashrc
    else
    	echo "ERROR: $GDCONF/gd_config/gd_alias.bashrc invalide"
    fi
}

### Afficher les commande pour modifier les privilèges
perm()
{

cat << EOF

> Fichier : 

    chmod [u g o a] [+ - =] [r w x] nom_du_fichier

> Répertoire (récursif) :

    chmod -R [u g o a] [+ - =] [r w x] nom_du_répertoire

> Valeures octales :

    --- 0->000----->aucun droit
    --x 1->001----->execution
    -w- 2->010----->écriture
    -wx 3->011----->écriture-execution
    r-- 4->100----->lecture
    r-x 5->101----->lecture-execution
    rw- 6->110----->lecture-écriture
    rwx 7->111----->lecture-écriture-execution

EOF
}


### Afficher les commandes d'administration système
adm()
{

cat << EOF

lspci
lsusb
lscpu
lsmod
sudo lshw 
inxi -Fxz # specs de la machine
ifconfig
iwconfig
iwlist scan
cat  /etc/network/interfaces
lsb_release -a ; echo $DESKTOP_SESSION
uname -r -m
cat /etc/X11/xorg.conf
lsblk -o name,fstype,size,fsused,fsuse%,fsavail,label,mountpoint | grep -Ev "loop" # liste des partitions
cat /etc/fstab
cat /etc/apt/sources.list | egrep -v "(^#.*|^$)" # pour voir les commentaires enlever le egrep
apt-cache policy | grep http | awk '{print $2 $3}' | sort -u # sources avec PPA actifs
find /etc/apt -name '*.list' -exec bash -c 'echo -e "\n$1\n"; nl -ba "$1"' _ '{}' \;
cat /boot/grub/grub.cfg 
awk -F'[/:]' '{if ($3 >= 1000 && $3 != 65534) print $1}' /etc/passwd # liste les utilisateurs
grep -oP '},"name":"\K[^"]+' ~/.mozilla/firefox/*.*default*/addons.json # liste des modules Firefox
sudo smartctl -s on -a /dev/sda # pour vérifier l'état du 1er disque interne
tail -n 10 /var/log/syslog # Derniers Log du système
dmesg | tail -n 10 # Derniers Log du noyau
sudo apt update && sudo dpkg --configure -a && sudo apt-get install -fy && sudo apt-get autoclean && sudo apt-get autoremove --purge -y && sudo apt full-upgrade -y
    
EOF
    
}

### Afficher les commandes d'administration système
arbo()
{
    normal=$(tput sgr0) 
    bold=$(tput bold)
    blue=$(tput setaf 4)
    echo "this is ${blue}${bold}bold${normal} but this isn t" 

cat << EOF

/
|
|___ ${blue}${bold}/bin${normal} : contient les commandes de base.
|    
|___ ${blue}${bold}/boot${normal} : contient les informations nécessaires au démarrage de la machine.
|
|___ ${blue}${bold}/dev${normal} : contient les fichiers spéciaux correspondant aux périphériques.
|
|___ ${blue}${bold}/etc${normal} : la plupart des fichiers de configuration.
|
|___ ${blue}${bold}/home${normal} : contient les répertoires personnels des utilisateurs.
|
|___ ${blue}${bold}/lib${normal} : contient les principales bibliothèques partagées (équivalent des DLL de Windows).
|
|___ ${blue}${bold}/lost+found${normal} : c'est là que le programme fsck dépose les fragments de fichiers perdus.
|
|___ ${blue}${bold}/mnt${normal} : les répertoires utilisés pour monter temporairement un système de fichiers (disquette, CD-ROM...).
|
|___ ${blue}${bold}/opt${normal} : c'est la qu on installe les logiciels commerciaux.
|
|___ ${blue}${bold}/proc${normal} : un répertoire factice, dont les fichiers contiennent des infos sur l'état du système et des processus en cours d'exécution.
|
|___ ${blue}${bold}/root${normal} : le répertoire de l'administrateur système (il n est pas sous /home).
|
|___ ${blue}${bold}/sbin${normal} : les commandes de base nécessaires a l'administration système (vérification et réparation des disques, mise en place du réseau...).
|
|___ ${blue}${bold}/tmp${normal} : les fichiers temporaires.
|
|___ ${blue}${bold}/usr${normal} : les logiciels installés avec le système.
|     |
|     |___ ${blue}${bold}/usr/X11R6${normal} : X-Window.
|     |
|     |___ ${blue}${bold}/usr/bin${normal} : les exécutables.
|     |
|     |___ ${blue}${bold}/usr/dict${normal} : les dictionnaires (pour les correcteurs d'orthographe et les craqueurs de mots de passe).
|     |
|     |___ ${blue}${bold}/usr/doc${normal} : la doc.
|     |
|     |___ ${blue}${bold}/usr/etc${normal} : des fichiers de config.
|     |
|     |___ ${blue}${bold}/usr/games${normal} : les jeux.
|     |
|     |___ ${blue}${bold}/usr/include${normal} : les fichiers d'en-tête pour la programmation.
|     |
|     |___ ${blue}${bold}/usr/info${normal} : la doc au format GNU info.
|     |
|     |___ ${blue}${bold}/usr/lib${normal} : les DLL non vitales.
|     |
|     |___ ${blue}${bold}/usr/local${normal} : une sous-hiérarchie qui contient des logiciels compilés sur place à partir des sources. Organisation similaire à /usr.
|     |
|     |___ ${blue}${bold}/usr/man${normal} : le manuel en ligne. Les fichiers sont compressés.
|     |
|     |___ ${blue}${bold}/usr/sbin${normal} : principalement les serveurs réseau.
|     |
|     |___ ${blue}${bold}/usr/share${normal} : des fichiers de données.
|     |
|     |___ ${blue}${bold}/usr/spool${normal} : généralement un lien symbolique vers /var/spool.
|     |
|     |___ ${blue}${bold}/usr/src${normal} : les sources de certains logiciels, principalement le noyau de Linux.
|
|___ ${blue}${bold}/var${normal} : des données fréquemment réécrites.
      |
      |___ ${blue}${bold}/var/catman${normal} : les pages du manuel décompressées (ça se fait à la demande).
      |
      |___ ${blue}${bold}/var/lib${normal} : des bases de données, des fichiers de config...
      |
      |___ ${blue}${bold}/var/local${normal} : complète /usr/local de la même façon que /var complète /usr.
      |
      |___ ${blue}${bold}/var/lock${normal} : des fichiers qui servent à marquer l'utilisation de certaines ressources (fichier de lock).
      |
      |___ ${blue}${bold}/var/log${normal} : le journal du système.
      |
      |___ ${blue}${bold}/var/run${normal} : principalement des infos sur les serveurs en fonctionnement.
      |
      |___ ${blue}${bold}/var/spool${normal} : les spools: tout ce qui est "de passage" en attendant d'être utilisé (le mail, les news, les files d attente des imprimantes).
      |
      |___ ${blue}${bold}/var/tmp${normal} : des fichiers temporaires.
EOF
    
}
