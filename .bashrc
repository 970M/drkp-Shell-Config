# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# #####################################################################################
# ## 970M ENV
# #####################################################################################

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -F1'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep -i --color=auto'
    alias fgrep='fgrep -i --color=auto'
    alias egrep='egrep -i --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'


# -------------------------------------------------------------------------------------


gijom="970M"
craft="ATEME"
workspace="Workspace"
# My aliases
alias ll='ls -lF'
alias l='ls -CF1'
alias ltr='ls -ltrh'
alias la='ls -ltrah'
alias lt="tree -LF 1"
alias ltl="tree -LF"
alias ps="ps -edf"
alias psg="ps -edf | grep -i"
alias pgrep="pgrep -fa"
alias cdt="cd $HOME/Téléchargements"
alias cdd="cd $HOME/Documents"
alias cdb="cd $HOME/bin"
alias cdg="cd $HOME/$gijom"
alias cdw="cd $HOME/src/$workspace"
alias cdn="cd $HOME/src/tests-neadvr"
alias cdp="cd $HOME/src/tests-neadvr/pytest"
alias cdc="cd $HOME/src/tests-neadvr/cypress"
alias cds="cd $HOME/src"
alias h="history"
alias hgrep="history|grep"
alias vi="nvim --cmd \":set nu\""
alias edi="gnome-text-editor"
alias edb="code $HOME/src/$workspace/.vscode/Workspace.code-workspace -g $HOME/src/$workspace/Shell/.bashrc:104 &"
alias code="code -n"
alias na="nautilus"
alias log="journalctl"
alias eds="gnome-text-editor /etc/apt/sources.list"
alias meteo="curl \"wttr.in/Paris?format=v2&lang=fr\""
alias getalias="cat ~/.bashrc | grep -v \"#\" | grep -E \"alias|function\""
alias venv3-9='source $HOME/src/venv-3.9/bin/activate'
alias venv3-10='source $HOME/src/venv-3.10/bin/activate'
alias cy='npx cypress open'
alias memo='firefox /home/gdaguet/970M/W012X/Workspace/How-To/README.md &'
alias note='gnome-text-editor $HOME/$craft/970M_notebook.md &'
alias soapott='soapsh ott'
alias setott='$HOME/bin/create_basic_ott_conf.py'
alias ablkc='ateme-black --check'
alias ablk='ateme-black'
alias opws="code $HOME/src/$workspace"
alias rlc='killall conky; conky -d'
alias rlb='. ~/.bashrc'
alias addch='venv3-9;/home/gdaguet/src/Workspace/Repos/Tools/create_basic_ott_conf.py'


# Alias hosts
alias sbr1='ssh root@qas-neadvr-streamer-perf-1.lab1.anevia.com'
alias sbr2='ssh root@qas-neadvr-streamer-perf-2.lab1.anevia.com'
alias vm1='ssh amaint@gda-1.lab1.anevia.com'
alias vm2='ssh amaint@gda-2.lab1.anevia.com'
alias vm3='ssh amaint@gda-3.lab1.anevia.com'
alias nperf='ssh amaint@nea-dvr-perf.lab1.anevia.com'
alias ndev='ssh amaint@nea-dvr-dev.lab1.anevia.com'
alias nref='ssh amaint@nea-live-ref.lab1.anevia.com'
alias ntest='ssh amaint@nea-live-gen9-test.lab1.anevia.com'
alias benchnas='ssh nas@benchnas.lab1.anevia.com'
alias ndvr1='ssh amaint@dvr1.gen10.lab1.anevia.com'
alias ndvr2='ssh amaint@dvr2.gen10.lab1.anevia.com'
alias ndvr3='ssh amaint@dvr3.gen10.lab1.anevia.com'
alias ndvr4='ssh amaint@dvr4.gen10.lab1.anevia.com'
alias ndb1='ssh amaint@db1.gen10.lab1.anevia.com'
alias ndb2='ssh amaint@db2.gen10.lab1.anevia.com'



# Generation du certificat Ateme
alias newcert='K=~/.ssh/id_ed25519; curl -f -F "pubkey=@$K.pub" https://ssh-ca.ateme.net/sign/ssh-ca-ed25519-1@ateme.com -o $K-cert.pub -sS -u g.daguet'

# EXPORT ------------------------------------------------------------------------------

export EDITOR=gnome-text-editor
### PATH 

export PATH="$PATH:$HOME/src/$workspace"
export PATH="$PATH:$HOME/src/$workspace/Repos/Profile_Setup_Utilities"
export PATH="$PATH:$HOME/src/$workspace/Repos/Tools"
export PATH="$PATH:$HOME/src/$workspace/Repos/soap-common"
export PATH="$PATH:$HOME/src/tests-neadvr/benchmark/scripts"



export PYTHONPATH="$PYTHONPATH:$HOME/src/tests-neadvr/pytest"
export PYTHONPATH="$PYTHONPATH:$HOME/src/tests-neadvr/benchmark/scripts"
export PYTHONPATH="$PYTHONPATH:$HOME/src/tests-neadvr/pytest/third_party/titanlive_test_framework/framework/src/framework"

# For Terraform
export PATH=/usr/local/bin:$PATH

# Date dans la commande history
export HISTTIMEFORMAT='%x %T '

# -------------------------------------------------------------------------------------
### Functions

# Find sans les erreurs
function fd ()
{
  find $1 -name $2 -print 2>/dev/null
}


# Mise à jour du systeme 
upd()
{
	echo ">> Mettre à jour la liste des paquets"
	sudo apt update  
	echo ">> Afficher les paquets à mettre à jour"
	apt list --upgradable
	echo ">> Mettre à jour les paquets"
	#sudo apt upgrade
	sudo apt full-upgrade
	echo ">> Supprimer tous les paquets obsolètes"
	sudo apt autoremove
	echo ">> Nettoyer le cache"
	sudo apt autoclean
}


# Extraction archives
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

# Afficher les commande pour modifier les privilèges
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

# Afficher les commandes d'administration système
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
blkid
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

# Redémarrer le wifi
resetwifi()
{
	nmcli radio wifi off
	sleep 2
	nmcli radio wifi on

}

# Lancer des pytest
function runtc()
{
  local test_file="$(echo "$1")"
  echo $test_file
  
  cd $HOME/src/tests-neadvr/pytest
  
  if [ $# == "1" ]; then    
    pytest --config configs/gda.cfg $test_file
  elif [ $# == "2" ]; then
    local test_case="$(echo "$2")"
    echo $test_case
    pytest --config configs/gda.cfg $test_file::$test_case
  else
    echo "ERROR : Wrong number of argument args=$#"
  fi 
}

# Setting *.cfg
function setcfg()
{
  local cfg_file="$(echo "$1")"
  cp $HOME/src/tests-neadvr/pytest/configs/${cfg_file} $HOME/src/tests-neadvr/pytest/configs/gda.cfg
}

alias getcfg='cat $HOME/src/tests-neadvr/pytest/configs/gda.cfg;echo'
alias fetchcfg='cp /home/gdaguet/src/Workspace/VScode/*.cfg $HOME/src/tests-neadvr/pytest/configs/'

# #####################################################################################
# ## ATEME ENV
# #####################################################################################

# -------------------------------------------------------------------------------------
# Aliases
alias gl='git log --graph --decorate --oneline' # Pretty git log on current branch
alias gla='git log --graph --all --decorate --oneline' # Pretty git log on all branches
alias glp='git log -p' # Git log which display all commits
alias glg='git log --pretty=%H --grep' # Git log which display only commits which match with regexp
alias gdiff='git diff'
alias gst='git status'
alias gc='git commit'
alias gco='git checkout'
alias gs='git show'
alias gb='git branch'
alias grb='git rebase -i origin/master' # To modify Git history
alias gph='git push -u -f origin'
alias gcm='git checkout master'
alias gpl='git pull'


function gg() # Git grep over all Git repositories which end with .git
{
  local regexp="$1"
  if [ -z "$regexp" ]; then
    echo "gg regexp [branch]"
    echo "Default branch is origin/master"
    echo "Error: No regexp provided"
    return 1
  fi

  if [ -d .git ]; then
    git grep -n "$regexp" $2
  else
    for git_dir in $(ls -d *.git); do
      echo "======== $git_dir ======="
      local branch="${2:-origin/master}"
      git -C $git_dir fetch # Comment because too slow
      git -C $git_dir grep -n "$regexp" "$branch"
    done
  fi
}
alias gfr='git fetch && git rebase' # Fetch last modification and rebase on it on the current branch
alias gbc='git branch -a --contains' # Display all branches which contains a specific commit
alias grc='git rebase --continue' # Continue after fixing a conflict or editing the history
alias gcp='git cherry-pick -x --edit' # Cherry pick a commit and suggest to modify the comment (message contains the hash of the cherry picked commit)

# Print time and current branch:

# Initialize prompt command
export PROMPT_COMMAND=prompt_command

function prompt_command()
{
  local EXIT="$?"             # This needs to be first

  local NO_COLOR='\[\e[0m\]'
  local BOLD_RED='\[\e[1;31m\]'
  local GREEN='\[\e[0;32m\]'
  local BG_WHITE="\[\033[1;37m\]"
  local YELLOW='\[\e[0;33m\]'
  local BG_BLUE='\[\e[1;34m\]'

  PS1="$GREEN\u@\h$NO_COLOUR:"
  if [ $EXIT != 0 ]; then
    PS1+="$BOLD_RED\$?$NO_COLOR:"
  fi
  #PS1+="$YELLOW[\$(date +%k:%M:%S)]$NO_COLOR:$BG_BLUE\w$BG_WHITE\$(parse_git_branch)$GREEN\$$NO_COLOR "
  PS1+="$YELLOW[\$(date +%k:%M:%S)]$NO_COLOR:$BG_BLUE\w$BOLD_RED\$(parse_git_branch)$GREEN\$$NO_COLOR "
}

function parse_git_branch()
{
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


function extractfdi()
{
  if [ -e logs ]; then
    echo "a file 'logs' exists in current directory: rename it before to re-execute this command" >&2
    return 1
  fi
 
  for f in "$@"; do
    echo "===== Extracting $f ====="
    local dir=$(echo "$f" | sed 's/\.bin$//')
    if [ -e "$dir" ]; then
      echo "a file '$dir' exists, FDI $f can't be extracted: skip" >&2
      continue
    fi
 
    tail --bytes=+130 "$f" | tar xz
    mv logs "$dir"
 
    sudo chown -R $USER: "$dir"
    sudo chmod -R u+w "$dir"
  done
}

# Amaint connection
function ac()
{
  local host="$(echo "$1" | \grep -Po '(http://)?\K(.+)')"
  echo $host
  local re='^[0-9]+$'
  echo $re
  if [[ $host =~ $re ]]; then
    ssh amaint@$host.$USER.lab1.anevia.com
  else
    [[ $host =~ \.$ ]] && host="${host}lab1.anevia.com"
    ssh amaint@$host
  fi
}


# #####################################################################################
# ## OTHER ENV
# #####################################################################################

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
