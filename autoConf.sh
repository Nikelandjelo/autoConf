#!/bin/bash
#           /$$$$$$ /$$$$$$ /$$
#          |_  $$_/|_  $$_/| $$
# /$$$$$$$   | $$    | $$  | $$   /$$
#| $$__  $$  | $$    | $$  | $$  /$$/
#| $$  \ $$  | $$    | $$  | $$$$$$/
#| $$  | $$  | $$    | $$  | $$_  $$
#| $$  | $$ /$$$$$$ /$$$$$$| $$ \  $$
#|__/  |__/|______/|______/|__/  \__/
#

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~NON-INTERACTIVE-FUNCS~~~~~~~~~~~~~~~~~~#
help() {
    echo "This is setup script."
    echo "Author: https://github.com/Nikelandjelo"
    echo
    echo "It contains the following operations:"
    echo
    echo "Update and Upgrade"
    echo
    echo "Adding one of the following repos deppending on choise and distro"
    echo "Kali, Parrot, BlackArch"
    echo
    echo "Installing the following nerd-fonts"
    echo "Hack, Hermit, ProFonts"
    echo
    echo "Installing tools from toolists."
    echo
    echo "Installing PIP and GEM packages."
    echo
    echo "Setting a new bashrc"
    echo
    echo "Setting zsh as a default shell, and installing"
    echo "oh-my-zsh, plugins, powerline10k"
    echo
    echo "Setting VIM, VIM plugins and new nanorc"
    echo
    echo
    echo "#######################################################################"
    echo
    echo -e "-h \tPrints this menu."
    echo -e "-A \tRunning the all functions."
    echo -e "-u \tRunning update and upgrade."
    echo -e "-r \tAdding pen-test repo."
    echo -e "-i\tInstalling the tools from all tool-lists."
    echo -e "-g\tInstalling the tools from the gem tool-lists."
    echo -e "-p\tInstalling the tools from the pip tool-lists."
    echo -e "-s \tConfiguring the shells."
    echo -e "-t \tConfiguring the text editors."
    echo -e "-K \tSetting-up Kali."
    echo -e "-P \tSetting-up ParrotSecurity."
    echo -e "-B \tSetting-up BlackArch."
}

dis() {
    if [ -f "/etc/artix-release" ]; then
        inf="artix_openrc" #artix with openrc is the best :D
    elif [ -f "/etc/arch-release" ]; then
        inf="pacman"
    elif [ -f "/etc/debian_version" ]; then
        inf="apt"
    else
        highli "Unknown distro!!" "err_bl"
        highli "Edit the script!" "err"
        exit 0
    fi
    echo "$inf"
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
min_A() {
    root_check
    inf=$(dis)
    upgrade "$inf"
    hack "$inf"
    nerd_fonts "$inf"
    tools_install "$inf"
    pys_gems "$inf"
    new_bash
    zsh_for_def
    vim_and_nano "$inf"
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
min_u() {
    root_check
    inf=$(dis)
    upgrade "$inf"
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
min_r() {
    root_check
    inf=$(dis)
    hack "$inf"
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
min_i() {
    root_check
    inf=$(dis)
    tools_install "$inf"
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
min_g() {
    root_check
    inf=$(dis)
    gem_list "$inf"
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
min_p() {
    root_check
    inf=$(dis)
    pip_list "$inf"
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
min_s() {
    root_check
    new_bash
    zsh_for_def
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
min_t() {
    root_check
    inf=$(dis)
    vim_and_nano "$inf"
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
min_K() {
    root_check
    inf=$(dis)
    lst="\
zsh \
git \
curl \
tmux \
terminator \
tor \
torbrowser-launcher \
zaproxy \
seclists \
gobuster"

    passwd kali
    apt update -y
    apt dist-upgrade -y
    apt full-upgrade -y
    apt autoremove -y
    apt autoclean -y
    apt install -y $lst

    gzip -d /usr/share/wordlists/rockyou.txt.gz
    vim_and_nano "$inf"
    pys_gems "$inf"
    nerd_fonts
    zsh_for_def

    declare -a list=(\
"Add keyboard layouts and shortcut for them!" \
"Login FireFox" \
"Set terminator as default terminal!" \
"Add the ssh keys to .ssh!")

    arraylength=${#list[@]}
    echo -e "\n\n"
    highli "Configure manually!!!" "done"
    echo -e "\n"
    for (( i=1; i<${arraylength}; i++ ));
    do
      echo -e "\e[1;5;91m[$i]\e[0m \e[1;34m${list[$i]}\e[0m"

    done
    
    exit 1
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
min_P() {
    root_check
    inf=$(dis)
    lst="\
zsh \
git \
curl \
tmux \
terminator \
zaproxy \
gobuster"

    passwd root
    apt update -y
    apt dist-upgrade -y
    apt full-upgrade -y
    apt autoremove -y
    apt autoclean -y
    apt install -y $lst

    gzip -d /usr/share/wordlists/rockyou.txt.gz
    vim_and_nano "$inf"
    pys_gems "$inf"
    nerd_fonts
    zsh_for_def

    mkdir -p /usr/share/wordlists
    mkdir -p /usr/share/wordlists/seclists
    wget https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip
    unzip SecList.zip
    rm -f SecList.zip
    mv SecLists-master /usr/share/seclists
    ln -s /usr/share/seclists/Passwords /usr/share/wordlists/seclists/Passwords
    ln -s /usr/share/seclists/Usernames /usr/share/wordlists/seclists/Usernames

    declare -a list=(\
"Add keyboard layouts and shortcut for them!" \
"Login FireFox" \
"Set terminator as default terminal!" \
"Add the ssh keys to .ssh!")

    arraylength=${#list[@]}
    echo -e "\n\n"
    highli "Configure manually!!!" "done"
    echo -e "\n"
    for (( i=1; i<${arraylength}; i++ ));
    do
      echo -e "\e[1;5;91m[$i]\e[0m \e[1;34m${list[$i]}\e[0m"

    done

    exit 1
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
min_B() {
    root_check
    pacman -Syyu
    exit 1
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~DEB-LIST~~~~~~~~~~~~~~~~~~#
deb_list() {
    games="\
lutris"

    more="\
telegram-desktop \
snapd"

    browsers="\
firefox \
tor \
torbrowser-launcher"

    doc="\
okular \
flameshot \
cherrytree \
notion \
ghostwriter \
peek \
obs-studio"

    sys_mon="\
bpytop \
htop \
neofetch \
gparted"

    sys_sec="\
ufw \
fail2ban \
libpam-google-authenticator"

    virt="\
virtualbox \
virt-manager \
qemu \
docker \
docker.io \
docker-compose"

    prod="\
vim-gtk \
nano \
git \
vscode \
python \
python2 \
python3-pip \
unzip \
qbittorrent \
arduino \
blender \
wine"

    in_shell="\
nnn \
zsh \
bash \
fish \
yakuake \
terminator \
tmux"

    nvd="\
nvidia-driver \
nvidia-cuda-dev \
nvidia-cuda-gdb \
nvidia-cuda-toolkit \
nvidia-opencl-common \
nvidia-opencl-dev \
nvidia-opencl-icd \
nvidia-settings \
nvidia-smi"

#~~~~~~~~~~~Kali/Parrot~~~~~~~~~~~~#

    web="\
burpsuite \
dirbuster \
gobuster \
curl \
wget \
wpscan \
ffuf \
zaproxy \
proxychains \
testssl.sh"

    vulns="\
metasploit-framework \
exploitdb \
openvas \
enum4linux"

    pswd="\
hydra \
hashcat \
john \
johnny"

    netwk="\
netcat \
nmap \
tcpdump \
wireshark-qt \
openvpn \
filezilla \
dbeaver \
sqlite \
sqlmap \
sshuttle \
chisel \
socat"
#seclists"

    win="\
freerdp2-x11 \
rdesktop \
remmina \
empire \
powershell \
evilwm"

    osint="\
maltego \
spiderfoot \
theharvester"

    rev="\
radare2 \
hexedit"

    #~~~~~~~~~~~~~~~~#
    hack_list=""
    yes_or_no "Do you want to install some hacking tools" "Installing..." "Installing" && \
hack_list="$web $vulns $pswd $netwk $win $osint $rev"
    list="\
$games \
$more \
$browsers \
$doc \
$sys_mon \
$sys_sec \
$virt \
$prod \
$in_shell \
$nvd \
$hack_list"
    apt update 2> /dev/null
    apt install $list
    sudo dpkg --configure -a
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~ARCH-LIST~~~~~~~~~~~~~~~~~~#
arch_list() {
    games="\
steam \
lutris"

    more="\
discord \
telegram-desktop \
teams"
#snapd"

    browsers="\
brave-nightly-bin \
firefox \
tor \
torbrowser-launcher"

    doc="\
okular \
flameshot \
cherrytree \
xmind \
notion \
obsidian \
ghostwriter \
peek \
obs-studio"

    sys_mon="\
bpytop \
htop \
neofetch \
gparted"

    sys_sec="\
ufw \
fail2ban \
libpam-google-authenticator"

    virt="\
virtualbox \
virt-manager \
qemu \
docker \
docker-compose"
#vmware-ovftool"

    prod="\
vi \
gvim \
git \
nano \
vscode \
python \
python2 \
python-pip \
python2-pip \
unzip \
qbittorrent \
arduino \
etcher-bin \
blender"
#wine"

    in_shell="\
nnn-nerd \
zsh \
bash \
fish \
yakuake \
terminator \
tmux"

    nvd="\
nvidia \
nvidia-utils \
opencl-nvidia \
nvidia-settings"

#~~~~~~~~~~~Black-Arch~~~~~~~~~~~~#

    web="\
burpsuite \
dirbuster \
gobuster \
curl \
wget \
wpscan \
ffuf \
zaproxy \
proxychains \
testssl.sh"

    vulns="\
metasploit \
crackmapexec \
exploit-db-git \
openvas \
nexus \
nessus \
enum4linux"

    pswd="\
hydra \
hashcat \
john \
johnny"

    netwk="\
netcat \
nmap \
tcpdump \
wireshark-qt \
openvpn \
openssh \
filezilla \
ftpmap \
seclists \
dbeaver \
sqlite \
mariadb \
sqlmap \
sshuttle \
chisel \
socat \
socat2"

    win="\
freerdp \
remmina \
empire \
powershell \
evil-winrm"

    osint="\
maltego \
spiderfoot \
shodanhat \
theharvester"

    rev="\
radare2 \
ida-free \
hexeditor \
gdb"

    #~~~~~~~~~~~~~~~~#
    blk_arch=""
    yes_or_no "Do you want to install some hacking tools" "Installing..." "Installing" && \
blk_arch="$web $vulns $pswd $netwk $win $osint $rev"
    list="\
$games \
$more \
$browsers \
$doc \
$sys_mon \
$sys_sec \
$virt \
$prod \
$in_shell \
$nvd \
$blk_arch"
    usr="$1"
    sudo -u $usr paru -Sy --noconfirm 2> /dev/null
    sudo -u $usr paru -S $list
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~OPENRC-LIST~~~~~~~~~~~~~~~~~~#
artix_openrc_list() {
    virt="\
vmware-openrc \
vmware-workstation-openrc \
docker-openrc"

    nvd="\
nvidia-utils-openrc"

    netwk="\
openssh-openrc \
mariadb-openrc"
    #~~~~~~~~~~~~~~~~#
    list="\
$virt \
$nvd \
$netwk"

    usr="$1"
    sudo -u $usr paru -S $list
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~NOT-IN-APT~~~~~~~~~~~~~~~~~~#


# Tools not included into the apt repo
not_in_apt() {
    #Brave Nightly
    ins=false
    yes_or_no "Do you want to install Brave-Nightly" "Installing..." "Installing" && ins=true
    if [ ! $(which brave-browser-nightly 2> /dev/null) ] && [ $ins = true ]; then
        depend_check "apt-transport-https" "curl"
        curl -fsSLo /usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg \
https://brave-browser-apt-nightly.s3.brave.com/brave-browser-nightly-archive-keyring.gpg
        echo -e "deb [signed-by=/usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg arch=amd64] \
https://brave-browser-apt-nightly.s3.brave.com/ stable main" >> /etc/apt/sources.list
        apt update
        apt install brave-browser-nightly -y
    fi

    #Xmind
    ins=false
    yes_or_no "Do you want to install Xmind" "Installing..." "Installing" && ins=true
    if [ ! $(which xmind) ] && [ $ins = true ]; then
        depend_check "snapd"
        snap install xmind
    fi

    #SecLists
    ins=false
    yes_or_no "Do you want to install SecLists" "Installing..." "Installing" && ins=true
    if [ ! -d "/usr/share/seclists" ] && [ $ins = true ]; then
        depend_check "wget"
        mkdir -p /usr/share/wordlists
        mkdir -p /usr/share/wordlists/seclists
        wget https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip
        unzip SecList.zip
        rm -f SecList.zip
        mv SecLists-master /usr/share/seclists
        ln -s /usr/share/seclists/Passwords /usr/share/wordlists/seclists/Passwords
        ln -s /usr/share/seclists/Usernames /usr/share/wordlists/seclists/Usernames
    fi

    #Discord
    ins=false
    yes_or_no "Do you want to install Discord" "Installing..." "Installing" && ins=true
    if [ ! $(which discord 2> /dev/null) ] && [ $ins = true ]; then
        depend_check "wget"
        wget 'https://discord.com/api/download?platform=linux&format=deb' -O discord.deb
        dpkg -i discord.deb
        apt install -f
        rm discord.deb
    fi

    #Steam
    ins=false
    yes_or_no "Do you want to install Steam" "Installing..." "Installing" && ins=true
    if [ ! $(which steam 2> /dev/null) ] && [ $ins = true ]; then
        depend_check "wget"
        wget 'https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb' -O steam.deb
        dpkg -i steam.deb
        apt install -f
        rm steam.deb
    fi

    #Teams
    ins=false
    yes_or_no "Do you want to install Microsoft Teams" "Installing..." "Installing" && ins=true
    if [ ! $(which teams 2> /dev/null) ] && [ $ins = true ]; then
        depend_check "wget"
        wget 'https://go.microsoft.com/fwlink/p/?LinkID=2112886&clcid=0x809&culture=en-gb&country=GB' -O teams.deb
        dpkg -i teams.deb
        apt install -f
        rm teams.deb
    fi

    #Cutter
    ins=false
    yes_or_no "Do you want to install Cutter" "Installing..." "Installing" && ins=true
    if [ ! $(which cutter 2> /dev/null) ] && [ $ins = true ]; then
        depend_check "wget"
        wget 'https://github.com/rizinorg/cutter/releases/download/v2.0.2/Cutter-v2.0.2-x64.Linux.appimage'
        chmod +x Cutter*.AppImage;
        ./Cutter*.AppImage
        rm Cutter*.AppImage
    fi

    #GEF for GDB
    ins=false
    yes_or_no "Do you want to install GEF for GDB" "Installing..." "Installing" && ins=true
    if [ $ins = true ]; then
        for user in $(ls /home)
        do
            i=false
            yes_or_no "Do you want to install GEF for GDB for user $user" "Installing..." "Installing" && i=true
            if [ ! -f /home/$user/.gdbinit-gef.py ] && [ $i = true ]; then
                depend_check "wget" "gdb"
                wget -O /home/$user/.gdbinit-gef.py -q https://github.com/hugsy/gef/raw/master/gef.py
                echo source /home/$user/.gdbinit-gef.py >> /home/$user/.gdbinit
            fi
        done
    fi
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~NOT-IN-AUR~~~~~~~~~~~~~~~~~~#


# Tools not included in AUR
not_in_aur() {
    #Cutter
    ins=false
    yes_or_no "Do you want to install Cutter" "Installing..." "Installing" && ins=true
    if [ ! $(which cutter 2> /dev/null) ] && [ $ins = true ]; then
        depend_check "wget"
        wget 'https://github.com/rizinorg/cutter/releases/download/v2.0.2/Cutter-v2.0.2-x64.Linux.appimage'
        chmod +x Cutter*.AppImage;
        ./Cutter*.AppImage
        rm Cutter*.AppImage
    fi
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~GEM-LIST~~~~~~~~~~~~~~~~~~#
gem_list() {
    depend_check "ruby" "ruby-dev"
    list="\
colorls \
evil-winrm \
cms_scanner"
    #gem update
    for usr in $(ls /home/)
    do
        sudo -u $usr echo "export PATH=~/.local/share/gem/ruby/3.0.0/bin:$PATH" >> /home/$usr/.bashrc
        sudo -u $usr echo "export PATH=~/.local/share/gem/ruby/2.7.0/bin:$PATH" >> /home/$usr/.bashrc
        sudo -u $usr gem install $list  2> /dev/null
        gem install $list  2> /dev/null
    done
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~PIP-LIST~~~~~~~~~~~~~~~~~~#
pip_list() {
    mng=$1
    if [ $mng = "pacman" ] || [ $mng = "artix_openrc" ]; then
        depend_check "python-pip"
    elif [ $mng = "apt" ]; then
        depend_check "python3-pip"
    fi
    list="\
pwn \
pytest \
keystone-engine \
unicorn \
ropper \
keystone-engine"
    pip3 install $list  2> /dev/null
}



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~~FUNCS~~~~~~~~~~~~~~~~~~#

# Run root check
root_check() {
    if [ $(id -u) -ne '0' ]; then
        highli "Run as root!" "err_bl"
        exit 0
    fi
}

# Hightlghiting func
highli() {
    var=$1
    mode=$2
    l="-----------"
    reset="\e[0m"
    if [ "$mode" = "err" ]; then
        echo -e "\e[1;4;39;91m$l$var$l$reset"
    elif [ "$mode" = "err_bl" ]; then
        echo -e "\e[1;5;37;41m$l$var$l$reset"
    elif [ "$mode" = "found" ]; then
        echo -e "\e[1;36;45m$l$var$l$reset"
    elif [ "$mode" = "nfound" ]; then
        echo -e "\e[1;37;41m$l$var$l$reset"
    elif [ "$mode" = "run" ]; then
        echo -e "\e[1;37;42m$l$var$l$reset"
    elif [ "$mode" = "done" ]; then
        echo -e "\e[1;5;37;42m$l$var$l$reset"
    fi
}


# Yes/No promp
yes_or_no() {
    echo -e "\n\n"
    msg=$1
    yes=$2
    nay=$3
    while true; do
        read -p "$1 [y/n]: " yn
        case $yn in
            [Yy]*) echo -e "\n" ; highli "$yes" "run" ; return 0  ;;  
            [Nn]*) echo -e "\n" ; highli "$nay: Aborted!" "err" ; return 1 ;;
        esac
        echo
        highli "I need answer!!!" "err_bl"
    done
}

# Checking and installing dependancies
depend_check() {
    for pk in $@
    do
        if [ $pk = "python-pip" ] || [ $pk = "python3-pip" ]; then
            pk="pip"
        fi
        if [ ! $(which $pk 2> /dev/null) ]; then
            highli "$pk is missing!" "nfound"
            highli "Installing $pk" "run"
            if [ $(which pacman) ]; then
                pacman -S $pk --noconfirm
            elif [ $(which apt) ]; then
                apt install $pk -y
            fi
            highli "Installing $pk: DONE!" "done"
        else
            highli "$pk found!" "found"
        fi
    done
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Upgrades
upgrade() {
    mng=$1
    if [ $mng = "pacman" ] || [ $mng = "artix_openrc" ]; then
        highli "Upgrade is starting!!!" "run"
        pacman -Syyu --noconfirm 2> /dev/null
        pacman -Qdtq --noconfirm 2> /dev/null
        pacman -Rs --noconfirm 2> /dev/null
        highli "The upgrade is done!" "done"

    elif [ $mng = "apt" ]; then
        highli "Upgrade is starting!!!" "run"
        apt update -y 2> /dev/null
        apt full-upgrade -y 2> /dev/null
        apt autoremove -y 2> /dev/null
        apt autoclean -y 2> /dev/null
        highli "The upgrade is done!" "done"
    else
        highli "Unknown package manager!!!" "err_bl"
    fi
}

# Installing BlackArch ParrotSec or Kali repos
hack() {
    mng=$1
    depend_check "wget"
    if [ $mng = "pacman" ] || [ $mng = "artix_openrc" ]; then
        if [ ! -f "./strap.sh" ]; then
            highli "Downloading strap.sh!" "done"
            wget https://blackarch.org/strap.sh
        fi
        highli "Installing Black Arch repo!" "run"
        chmod +x ./strap.sh
        ./strap.sh
        pacman -Syy --noconfirm
        highli "The repo is added!" "done"
        yes_or_no "Do you want to remove strap.sh" "Removing..." "Removing" && rm strap.sh

    elif [ $mng = "apt" ]; then
        echo -e "\n\n"
        parr=false
        kali=false
        while [ $parr = false ] && [ $kali = false ];
        do
            read -p "Pirrot Security or Kali repo [P/K]: " pk
            case $pk in
                [Pp]*) echo -e "\n" ; highli "Setting Parrot repos!" ; parr=true ;;  
                [Kk]*) echo -e "\n" ; highli "Setting Kali repos!" "run" ; kali=true ;;
            esac
        done
        
        if [ $parr = true ]; then
            highli "Installing Parrot Security repo!" "run"
            wget -qO - https://archive.parrotsec.org/parrot/misc/parrotsec.gpg | apt-key add -
            echo -e '# Parrot Security repositories | Added by autoConf script\ndeb https://deb.parrotsec.org/parrot parrot main contrib non-free' >> /etc/apt/sources.list
            apt update
            yes_or_no "Do you want to install Parrot Metapackages" "Installing..." "Installing" && apt install parrot-meta-full -y
            highli "The repo is added!" "done"
            
        elif [ $kali = true ]; then
            kat=false
            yes_or_no "Do you want to use katoolin.py for the installation" "Installing with katoolin.py!" "Installation" && kat=true
            if [ $kat = true ]; then
                depend_check "python2" "xterm"
                if [ ! -f ./katoolin.py ]; then
                    highli "Downloading katoolin.py!!!" "run"
                    wget https://raw.githubusercontent.com/LionSec/katoolin/master/katoolin.py
                else
                    highli "katoolin.py: found" "found"
                fi

                chmod +x katoolin.py
                highli "katoolin.py is starting! Close the xterm terminal when finished!" "done"
                xterm -hold -e "python2 ./katoolin.py"
                yes_or_no "Do you want to remove katoolin.py" "Removing..." "Removing" && rm katoolin.py
            else
                highli "Installing Kali repo!" "run"
                apt-key adv --keyserver pool.sks-keyservers.net --recv-keys ED444FF07D8D0BF6
                echo -e '# Kali linux repositories | Added by autoConf script\ndeb http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list
                apt update
                yes_or_no "Do you want to install Kali Metapackages" "Installing..." "Installing" && apt install kali-menu -y
                highli "The repo is added!" "done"
            fi
        fi
    else
        highli "Error with adding the repo!!!" "err_bl"
    fi
}

# Installing nerd-fonts
nerd_fonts() {
    depend_check "zip" "wget"
    for font in "Hack" "Hurmit" "ProFont"
    do
        for user in $(ls /home/)
        do
            conf=false
            yes_or_no "Do you want to install $font for user $user" "Installing $font for user $user..." "Installing $font for user $user" && conf=true
            if [ $conf = true ]; then
                if [ $(sudo -u $usr fc-list | grep $font | wc -l) -ne "0" ]; then
                    highli "$font nerd-fonts for user $usr: already installed" "found"
                else
                    sudo -u $user mkdir -p /home/$user/.local/share/fonts
                    if [ $font = "Hack" ]; then
                        sudo -u $user wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
                        sudo -u $user unzip Hack-v3.003-ttf.zip
                        sudo -u $user cp ./ttf/* /home/$user/.local/share/fonts
                        rm -rf ttf Hack-v3.003-ttf.zip
                        fc-cache -f -v

                    elif [ $font = "Hurmit" ]; then
                        sudo -u $user wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hermit.zip
                        sudo -u $user unzip Hermit.zip
                        rm -rf Hermit.zip
                        sudo -u $user cp ./Hurmit* /home/$user/.local/share/fonts
                        rm -rf Hurmit*
                        fc-cache -f -v

                    elif [ $font = "ProFont" ]; then
                        sudo -u $user wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/ProFont.zip
                        sudo -u $user unzip ProFont.zip
                        rm -rf ProFont.zip
                        sudo -u $user cp ./ProFont* /home/$user/.local/share/fonts
                        rm -rf ProFont*
                        fc-cache -f -v
                    fi
                fi
            fi
        done
    done
    highli "Nerd-fonts installed!" "done"
}

# Installing tools from tool-lists
tools_install() {
    mng=$1
    if [ $mng = "pacman" ] || [ $mng = "artix_openrc" ]; then
        depend_check "git"        
        u=""
        while true; do
            for usr in $(ls /home/ 2> /dev/null)
            do
                yes_or_no "Do you want tou run PARU as user $usr" "Running as user $usr" "$usr" && u="$usr"
            done
            if [[ $u == "$usr" ]]; then
                    break
            fi
        done
        if [ ! $(which paru 2> /dev/null) ]; then
            highli "PARU is missing!" "err"
            highli "Installing PARU!" "run"
            pacman -S --needed base-devel --noconfirm
            sudo -u $u git clone https://aur.archlinux.org/paru.git
            cd paru/ && sudo -u $u makepkg -si
            cd .. && rm -rf ./paru
        else
            highli "PARU found!" "found"
        fi

        highli "Installing tools!!!" "run"
        arch_list $u
        highli "The tools are installed!" "done"

        if [ $mng = "artix_openrc" ]; then
            highli "Installing openrc tools!!!" "run"
            artix_openrc_list "$u"
            highli "The openrc tools are installed!" "done"
        fi

    elif [ $mng = "apt" ]; then
        highli "Installing tools!!!" "run"
        yes_or_no "Do you want to install tools that are not in the apt repo" "Installing..." "Installing" && not_in_apt
        deb_list
        highli "The tools are installed!" "done"
    else
        highli "Error installing the tools!!!" "err_bl"
    fi
}

# Installing pip and gem packets
pys_gems() {
    mng=$1
    highli "Installing GEM and PY tools!!!" "run"
    gem_list
    pip_list $mng
    highli "GEM and PY tools are installed!!!" "done"
}

# New bashrc
new_bash() {
    highli "Setting new bashrc!" "run"
    bsh=false
    yes_or_no "Do you want new bash for root user" "Setting new bashrc for root user..." "Setting new bashrc for root user" && bsh=true
    if [ $bsh = true ]; then
        rm /root/.bashrc
        wget https://raw.githubusercontent.com/Nikelandjelo/autoConf/main/dot_files/bashrc
        mv bashrc /root/.bashrc
    fi
    for user in $(ls /home/)
    do
        bsh=false
        yes_or_no "Do you want new bashrc for user $user" "Setting new bashrc for user $user" "Setting new bashrc for user $user" && bsh=true
        if [ $bsh = true ]; then
            if [ ! $(which pfetch 2> /dev/null) ]; then
                highli "pfetch is missing!" "nfound"
                highli "Intslling pfetch!" "run"
                sudo -u $user wget https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch
                chmod +x pfetch
                mv pfetch /bin/
                highli "pfetch is installed!" "done"
            else
                highli "pfetch is found!" "found"
            fi
            sudo -u $user wget https://raw.githubusercontent.com/Nikelandjelo/autoConf/main/dot_files/bashrc
            sudo -u $user mv bashrc /home/$user/.bashrc
        fi
    done
}

# Setting ZSH as defo
zsh_for_def() {
    highli "Setting ZSH as a default shell!" "run"
    depend_check "zsh" "neofetch" "wget" "git" "fortune-mod"
    for user in $(ls /home/)
    do
        if [ ! $(which pfetch 2> /dev/null) ]; then
            highli "pfetch is missing!" "nfound"
            highli "Intslling pfetch!" "run"
            sudo -u $user wget https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch
            chmod +x pfetch
            mv pfetch /bin/
            highli "pfetch is installed!" "done"
        else
            highli "pfetch is found!" "found"
        fi
        omz=false
        yes_or_no "Set ZSH as default shell for user $user?" "Setting ZSH as gefault shell for user $user" "Setting ZSH as gefault shell for user $user" && chsh -s /bin/zsh $user
        yes_or_no "Do you want to setup oh-my-zsh for user $user" "Setting oh-my-zsh for user $user..." "Setting oh-my-zsh for user $user" && omz=true
        if [ $omz = true ]; then
            sudo -u $user sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
            sudo -u $user git clone https://github.com/zsh-users/zsh-autosuggestions /home/$user/.oh-my-zsh/custom/plugins/zsh-autosuggestions
            sudo -u $user git clone https://github.com/sukkaw/zsh-proxy.git /home/$user/.oh-my-zsh/custom/plugins/zsh-proxy
            sudo -u $user git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/$user/.oh-my-zsh/plugins/zsh-syntax-highlighting
            sudo -u $user git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/$user/.oh-my-zsh/custom/themes/powerlevel10k
            sudo -u $user wget https://raw.githubusercontent.com/Nikelandjelo/autoConf/main/dot_files/zshrc
            sudo -u $user mv zshrc /home/$user/.zshrc
            sudo -u $user wget https://raw.githubusercontent.com/Nikelandjelo/autoConf/main/dot_files/defo_p10k.zsh
            sudo -u $user mv defo_p10k.zsh /home/$user/.defo_p10k.zsh
            sudo -u $user wget https://raw.githubusercontent.com/Nikelandjelo/autoConf/main/dot_files/bulk_p10k.zsh
            sudo -u $user mv bulk_p10k.zsh /home/$user/.bulk_p10k.zsh
        fi
    done
    highli "Done with ZSH config!" "done"
}

# Setting VIM and NANO
vim_and_nano() {
    highli "Setting VIM and NANO" "run"
    mng=$1
    if [ $mng = "pacman" ] || [ $mng = "artix_openrc" ]; then
        depend_check "gvim"
    elif [ $mng = "apt" ]; then
        depend_check "vim-gtk"
    fi
    depend_check "nano" "python3" "curl" "wget" "xterm"
    apt install build-essential cmake vim-nox python3-dev mono-complete golang nodejs default-jdk npm -y
    for user in $(ls /home/)
    do
        cnf=false
        yes_or_no "Do you want to build the setup for user $user" "Building for user $user..." "Building for user $user" && cnf=true
        if [ $cnf = true ]; then
            sudo -u $user curl -fLo /home/$user/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            sudo -u $user wget https://raw.githubusercontent.com/Nikelandjelo/autoConf/main/dot_files/vimrc
            sudo -u $user mv vimrc /home/$user/.vimrc
            sudo -u $user wget https://raw.githubusercontent.com/Nikelandjelo/autoConf/main/dot_files/nanorc
            sudo -u $user mv nanorc /home/$user/.nanorc
            highli "Close the xterm window after the installation!" "done"
            sudo -u $user xterm -e "vim -c ':PlugInstall'"
            sudo -u $user python3 /home/$user/.vim/plugged/YouCompleteMe/install.py --all
        fi
    done
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~MANUAL-CONFIG~~~~~~~~~~~~~~~~~~#

# Prints a list of things that have to be configured manually
manual_list() {
    declare -a list=(\
"Add keyboard layouts and shortcut for them!" \
"Set Brave as deffault browser!" \
"Add the chain key to Brave!" \
"Set terminator as default terminal!" \
"Add the ssh keys to .ssh!")

    arraylength=${#list[@]}
    echo -e "\n\n"
    highli "Configure manually!!!" "done"
    echo -e "\n"
    for (( i=1; i<${arraylength}; i++ ));
    do
      echo -e "\e[1;5;91m[$i]\e[0m \e[1;34m${list[$i]}\e[0m"

    done
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~NON-INTERACTIVE~~~~~~~~~~~~~~~~~~#
if [ $@ ]; then
    if [[ ! $@ == -* ]];then
        echo "Unknown argument: $@!"
        help
        exit 2
    fi
    opstring=":hAurigpstKPB"
    while getopts ${opstring} arg; do
        case ${arg} in
            h) help ; exit 1 ;;
            A) min_A ;;
            u) min_u ;;
            r) min_r ;;
            i) min_i ;;
            g) min_g ;;
            p) min_p ;;
            s) min_s ;;
            t) min_t ;;
            K) min_K ;;
            P) min_P ;;
            B) min_B ;;
            \?) echo "Unknown argument: -${OPTARG}!" ; help ; exit 2 ;;
        esac
    done
    exit 1
fi

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~ROOT-CHECKS~~~~~~~~~~~~~~~~~~#

# Run root check
root_check

clear
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~~~~BEGIN~~~~~~~~~~~~~~~~~~~~~~#

echo -e "\e[1;5;91m          )      )  (     \e[0m"
echo -e "\e[1;5;91m   (   ( /(   ( /(  )\ )  \e[0m"
echo -e "\e[1;5;91m   )\  )\())  )\())(()/(  \e[0m"
echo -e "\e[1;5;91m (((_)((_)\  ((_)\  /(_)) \e[0m"
echo -e "\e[1;5;91m  )\\e[0m\e[1;36m___\e[1;5;91m  ((\e[0m\e[1;36m_\e[1;5;91m)  \e[0m\e[1;36m_\e[1;5;91m((\e[0m\e[1;36m_\e[1;5;91m)(\e[0m\e[1;36m_\e[1;5;91m))\e[0m\e[1;36m_\e[1;5;91m| \e[0m"
echo -e "\e[1;5;91m((\e[0m\e[1;36m/ __|/ _ \ | \| || |_   \e[0m"
echo -e "\e[1;36m | (__| (_) || .  || __|        \e[0m"
echo -e "\e[1;36m  \___|\___/ |_|\_||_|          \e[0m\n"
echo -e "\e[1;96mAuthor: \e[1;7;96mnick\e[0m"
echo -e "\e[1;96m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\e[0m"
echo -e "\e[1;96mGitHub: https://github.com/Nikelandjelo\e[0m\n"
echo -e "\e[1;5;91m[!]\e[0m \e[1;4;35mMake sure that you run this script from writable directory!\e[0m"
echo -e "\e[1;5;91m[!]\e[0m \e[1;4;35mMake sure that the /home contain only user(s) folder(s)!\e[0m"
echo -e "\e[1;5;91m[!]\e[0m \e[1;4;35mIf runing on arch based, uncomment the [multilib] mirrorlist! (/etc/pacman.conf)\e[0m"
echo -e "\n\n"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~CHECKS~~~~~~~~~~~~~~~~~~#
# Distro detect
if [ -f "/etc/artix-release" ]; then
    highli "Artix Based: $(cat /etc/artix-release)" "found"
    inf="artix_openrc" #artix with openrc is the best :D
elif [ -f "/etc/arch-release" ]; then
    highli "Arch Based: $(cat /etc/arch-release)" "found"
    inf="pacman"
elif [ -f "/etc/debian_version" ]; then
    highli "Deb Based: $(cat /etc/debian_version)" "found"
    inf="apt"
else
    highli "Unknown distro!!" "err_bl"
    highli "Edit the script!" "err"
    exit 0
fi


# Checking if dependancies are installed
#deps=("git" "pip3" "gem" "python2" "xterm" "wget" "zip")
for dep in "git" "pip3" "gem" "python2" "xterm" "wget" "zip"
do
    if [ $(which $dep 2> /dev/null) ]; then
        highli "$dep: found" "found"
    else
        highli "$dep: not found" "nfound"
    fi
done


# Cheking strap.sh and katoolin.py (BlackArch)
if [ $inf = "pacman" ] || [ $inf = "artix_openrc" ]; then
    if [ -f "./strap.sh" ]; then
        highli "strap.sh: found" "found"
    else
        highli "strap.sh: not found" "nfound"
    fi
elif [ $inf = "apt" ]; then
    if [ -f "./katoolin.py" ]; then
        highli "katoolin.py: found" "found"
    else
        highli "katoolin.py: not found" "nfound"
    fi
fi


# Nerd-fonts check
for font in "Hack" "Hurmit" "ProFont"
do
    for usr in $(ls /home/)
    do
        if [ $(sudo -u $usr fc-list | grep $font | wc -l) != "0" ]; then
            highli "$font nerd-fonts for user $usr: found" "found"
        else
            highli "$font nerd-fonts for user $usr: not found" "nfound"
        fi
    done
done


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~CONFIRMATION-PROM~~~~~~~~~~~~~~~~~~#

up=false
repo=false
nerd=false
too=false
pygem=false
bsh=false
zsh_shell=false
vn=false

yes_or_no "Do you want to run ugrade" "Upgrade will run!" "Update" && up=true
yes_or_no "Do you want to include some HACKING repos ;) " "Good boyy!" ";((((" && repo=true
yes_or_no "Do you want to install nerd-fonts (required for the zsh configuration)" "Nerd-fonts will be installed!" "Installing nerd-fonts" && nerd=true
yes_or_no "Do you want to install the tools from the tool-lists" "The tools will be installed!" "Installing tools" && too=true
yes_or_no "Do you want to install the tools from the py and gem tool-lists" "The tools will be installed!" "Installing tools" && pygem=true
yes_or_no "Do you want new bashrc" "New bashrc will be downloaded" "New bashrc" && bsh=true
yes_or_no "Do you want to set ZSH as default shell" "ZSH will be set as a default shell!" "Setting ZSH as a default shell" && zsh_shell=true
yes_or_no "Do you want to setup VIM and NANO" "Setting VIM and NANO..." "Setting VIM and NANO..." && vn=true

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~RUNNING-THE-CONFIRM~~~~~~~~~~~~~~~~~~#

echo -e "\n\n"
if [ $up = true ]; then
    upgrade "$inf"
else
    highli "Skipping upgrade!!!" "err"
fi

echo -e "\n\n"
if [ $repo = true ]; then
    hack "$inf"
else
    highli "Skipping add of repo!!!" "err"
fi

echo -e "\n\n"
if [ $nerd = true ]; then
    nerd_fonts
else
    highli "Skipping nerd-font installation!!!" "err"
fi

echo -e "\n\n"
if [ $too = true ]; then
    tools_install "$inf"
else
    highli "Skipping tools installation!!!" "err"
fi

echo -e "\n\n"
if [ $pygem = true ]; then
    pys_gems "$inf"
else
    highli "Skipping tools installation!!!" "err"
fi

echo -e "\n\n"
if [ $bsh = true ]; then
    new_bash
else
    highli "Skipping setting new bashrc!!!" "err"
fi

echo -e "\n\n"
if [ $zsh_shell = true ]; then
    zsh_for_def
else
    highli "Skipping setting ZSH as deffault shell!!!" "err"
fi

echo -e "\n\n"
if [ $vn = true ]; then
    vim_and_nano "$inf"
else
    highli "Skipping setting VIM and NANO!!!" "err"
fi

echo -e "\n\n"
manual_list
echo -e "\n\n"
highli "All done!" "done"