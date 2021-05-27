#!/bin/sh
#           /$$$$$$ /$$$$$$ /$$
#          |_  $$_/|_  $$_/| $$
# /$$$$$$$   | $$    | $$  | $$   /$$
#| $$__  $$  | $$    | $$  | $$  /$$/
#| $$  \ $$  | $$    | $$  | $$$$$$/
#| $$  | $$  | $$    | $$  | $$_  $$
#| $$  | $$ /$$$$$$ /$$$$$$| $$ \  $$
#|__/  |__/|______/|______/|__/  \__/
#

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~DEB-LIST~~~~~~~~~~~~~~~~~~#
deb_list() {
    more="\
discord \
telegram-desktop
snapd"

    browsers="\
firefox \
tor \
torbrowser-launcher"

    doc="\
flameshot \
cherrytree \
notion \
ghostwriter \
peek \
obs-studio"

    sys_mon="\
bpytop \
top \
htop \
neofetch \
gparted"

    sys_sec="\
ufw \
fail2ban \
libpam-google-authenticator"

    virt="\
vmware-ovftool \
virtualbox \
virt-manager \
qemu \
docker \
docker.io \
docker-compose"

    prod="\
neovim \
nano \
vscode \
python \
python2 \
python-pip \
unzip \
qbittorrent \
arduino \
blender \
wine"

    in_shell="\
nnn-nerd \
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

#~~~~~~~~~~~Kali~~~~~~~~~~~~#

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
crackmapexec \
exploitdb \
openvas"

    pswd="\
hydra \
hashcat \
john \
johnny"

    netwk="\
nc \
nmap \
tcpdump \
wireshark-qt \
openvpn \
openssh \
filezilla \
seclists \
dbeaver \
sqlite \
mariadb \
sqlmap \
sshuttle \
chisel \
socat"

    win="\
freerdp2-x11 \
rdesctop \
remmina \
empire \
powershell \
evil-wm"

    osint="\
maltego \
spiderfoot"

    rev="\
radare2 \
hexedit"

    #~~~~~~~~~~~~~~~~#
    kali_list="$web $vulns $pswd $netwk $win $osint $rev"
    list="\
$more \
$browsers \
$doc \
$sys_mon \
$sys_sec \
$virt \
$prod \
$blk_arch"
    apt update
    apt install $list -y
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~ARCH-LIST~~~~~~~~~~~~~~~~~~#
arch_list() {
    more="\
discord \
telegram-desktop
snapd"

    browsers="\
brave-nightly-bin \
firefox \
tor \
torbrowser-launcher"

    doc="\
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
top \
htop \
neofetch \
gparted"

    sys_sec="\
ufw \
fail2ban \
libpam-google-authenticator"

    virt="\
vmware-ovftool \
virtualbox \
virt-manager \
qemu \
docker \
docker.io \
docker-compose"

    prod="\
vi \
gvim \
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
blender \
wine"

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
nvidia-util \
opencl-nvidia \
nvidia-settings"

#~~~~~~~~~~~Black-Arch~~~~~~~~~~~~#

    web="\
burp \
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
exploit-db \
openvas \
nexus \
nessus"

    pswd="\
hydra \
hashcat \
john \
johnny"

    netwk="\
nc \
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
rdesctop \
remmina \
empire \
powershell \
evil-winrm"

    osint="\
maltego \
spiderfoot \
shodanhat"

    rev="\
radare2 \
ida-free \
hexeditor"

    #~~~~~~~~~~~~~~~~#
    blk_arch="$web $vulns $pswd $netwk $win $osint $rev"
    list="\
$more \
$browsers \
$doc \
$sys_mon \
$sys_sec \
$virt \
$prod \
$blk_arch"
    paru -Sy
    paru -S $list --noconfirm
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~OPENRC-LIST~~~~~~~~~~~~~~~~~~#
artix_openrc_list() {
    list="\
vmware-openrc \
vmware-workstation-openrc \
docker-openrc \
nvidia-util-openrc \
openssh-openrc \
mariadb-openrc"
    paru -S $list --noconfirm
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
    gem install $list
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~PIP-LIST~~~~~~~~~~~~~~~~~~#
pip_list() {
    depend_check "python-pip" "python3-pip"
    list="\
pytest"
    pip3 install $list
}



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~~FUNCS~~~~~~~~~~~~~~~~~~#

# Hightlghiting func
highli() {
    var=$1
    mode=$2
    l="-----------"
    reset="\e[0m"
    if [ "$mode" = "err" ]; then
        echo "\e[1;4;39;91m$l$var$l$reset"
    elif [ "$mode" = "err_bl" ]; then
        echo "\e[1;5;37;41m$l$var$l$reset"
    elif [ "$mode" = "found" ]; then
        echo "\e[1;36;45m$l$var$l$reset"
    elif [ "$mode" = "nfound" ]; then
        echo "\e[1;37;41m$l$var$l$reset"
    elif [ "$mode" = "run" ]; then
        echo "\e[1;37;42m$l$var$l$reset"
    elif [ "$mode" = "done" ]; then
        echo "\e[1;5;37;42m$l$var$l$reset"
    fi
}


# Yes/No promp
yes_or_no() {
    echo "\n\n"
    msg=$1
    yes=$2
    nay=$3
    while true; do
        read -p "$1 [y/n]: " yn
        case $yn in
            [Yy]*) echo "\n" ; highli "$yes" "run" ; return 0  ;;  
            [Nn]*) echo "\n" ; highli "$nay: Aborted!" "err" ; return  1 ;;
        esac
        echo
        highli "I need answer!!!" "err_bl"
    done
}

# Checking and installing dependancies
depend_check() {
    for pk in $@
    do
        if [ ! $(which $pk) ]; then
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


# Tools not included into the apt repo
not_in_apt() {
    #Brave Nightly
    if [ ! $(which brave-browser-nightly) ]; then
        apt install apt-transport-https curl
        curl -fsSLo /usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg \
        https://brave-browser-apt-nightly.s3.brave.com/brave-browser-nightly-archive-keyring.gpg
        echo "deb [signed-by=/usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg arch=amd64] \
        https://brave-browser-apt-nightly.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-nightly.list
        apt install brave-browser-nightly -y
    fi

    #Xmind
    if [ ! $(which xmind) ]; then
        depend_check "snapd"
        snap install xmind
    fi
}


# Tools not included in AUR
#not_in_aur() {
#
#}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Upgrades
upgrade() {
    mng=$1
    if [ $mng = "pacman" ] || [ $mng = "artix_openrc" ]; then
        highli "Upgrade is starting!!!" "run"
        pacman -Syyu --noconfirm
        pacman -Qdtq --noconfirm
        pacman -Rs --noconfirm
        highli "The upgrade is done!" "done"

    elif [ $mng = "apt" ]; then
        highli "Upgrade is starting!!!" "run"
        apt update -y
        apt full-upgrade -y
        apt autoremove -y
        apt autoclean -y
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
        if [! -f "./strap.sh" ]; then
            highli "Downloading strap.sh!" "done"
            wget https://blackarch.org/strap.sh
        fi
        highli "Installing Black Arch repo!" "run"
        chmod +x ./strap.sh
        ./strap.sh
        pacman -Syy --noconfirm
        highli "The repo is added!" "done"

    elif [ $mng = "apt" ]; then
        echo "\n\n"
        parr=false
        kali=false
        while true; do
            read -p "$1 [P/K]: " pk
            case $yn in
                [Pp]*) echo "\n" ; highli "Setting Parrot repos!" ; parr=true ; return 1  ;;  
                [Kk]*) echo "\n" ; highli "Setting Kali repos!" "run" ; kali=true ; return  1 ;;
            esac
            echo
            highli "I need answer!!!" "err_bl"
        done
        
        if [ $parr = true ]; then
            highli "Installing Parrot Security repo!" "run"
            wget -qO - https://archive.parrotsec.org/parrot/misc/parrotsec.gpg | apt-key add -
            echo '# Parrot Security repositories | Added by autoConf script\ndeb https://deb.parrotsec.org/parrot parrot main contrib non-free' >> /etc/apt/sources.list
            apt update
            apt install parrot-meta-full
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
            else
                highli "Installing Kali repo!" "run"
                apt-key adv --keyserver pool.sks-keyservers.net --recv-keys ED444FF07D8D0BF6
                echo '# Kali linux repositories | Added by autoConf script\ndeb http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list
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
                if [ $(sudo -u $usr fc-list | grep $font | wc -l) =! "0" ]; then
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

                    elif [ $font = "ProFonts" ]; then
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
        if [ ! $(which paru) ]; then
            highli "PARU is missing!" "err"
            highli "Installing paru!" "run"
            pacman -S --needed base-devel --noconfirm
            sudo -u niik git clone https://aur.archlinux.org/paru.git
            cd paru/ && sudo -u niik makepkg -si
            cd .. && rm -rf ./paru
        else
            highli "PARU found!" "found"
        fi
        
        highli "Installing tools!!!" "run"
        arch_list
        highli "The tools are installed!" "done"

        if [ $mng = "artix_openrc" ]; then
            highli "Installing openrc tools!!!" "run"
            artix_openrc_list
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
    depend_check "ruby" "ruby-dev" "python-pip" "python3-pip"
    highli "Installing GEM and PY tools!!!" "run"
    #gem install $(cat ./toolists/gem.list | tr "\n" " ")
    #pip3 install -r ./toolists/py.list
    gem_list
    pip_list
    highli "GEM and PY tools are installed!!!" "done"
}

# Coppy dot files to home(s) dir
coppy_dot_files() {
    for hm in $(ls /home/)
    do
        coppy=false
        yes_or_no "Do you want to coppy the dot files to /home/$hm dir" "Copying..." "Coppy to /home/$hm" && coppy=true
        if [ $coppy = true ]; then
            for doted in $(ls ./dot_files/)
            do
                cp -r ./dot_files/$doted /home/$hm/.$doted
                chown $hm:$hm /home/$hm/.$doted
            done
        fi
    done
    highli "Finished with copying the dot files!" "done"
}


# Setting ZSH as defo
zsh_for_def() {
    highli "Setting ZSH as a default shell!" "run"
    depend_check "zsh" "neofetch"
    if [ ! $(which pfetch) ]; then
        highli "pfetch is missing!" "nfound"
        highli "Intslling pfetch!" "run"
        wget https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch -P /bin/ 
        highli "pfetch is installed!" "done"
    else
        highli "pfetch is found!" "found"
    fi

    for user in $(ls /home/)
    do
        yes_or_no "Set ZSH as default shell for user $user?" "Setting ZSH as gefault shell for user $user" "Setting ZSH as gefault shell for user $user" && chsh -s /bin/zsh $(sudo -u $user whoami)
    done
    highli "Done with ZSH config!" "done"
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~ROOT-CHECKS~~~~~~~~~~~~~~~~~~#

# Run root check
if [ $(id -u) -ne '0' ]; then
    highli "Run as root!" "err_bl"
    exit 0
fi

clear
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~~~~BEGIN~~~~~~~~~~~~~~~~~~~~~~#

echo "\e[1;5;91m          )      )  (     \e[0m"
echo "\e[1;5;91m   (   ( /(   ( /(  )\ )  \e[0m"
echo "\e[1;5;91m   )\  )\())  )\())(()/(  \e[0m"
echo "\e[1;5;91m (((_)((_)\  ((_)\  /(_)) \e[0m"
echo "\e[1;5;91m  )\\e[0m\e[1;36m___\e[1;5;91m  ((\e[0m\e[1;36m_\e[1;5;91m)  \e[0m\e[1;36m_\e[1;5;91m((\e[0m\e[1;36m_\e[1;5;91m)(\e[0m\e[1;36m_\e[1;5;91m))\e[0m\e[1;36m_\e[1;5;91m| \e[0m"
echo "\e[1;5;91m((\e[0m\e[1;36m/ __|/ _ \ | \| || |_   \e[0m"
echo "\e[1;36m | (__| (_) || .  || __|        \e[0m"
echo "\e[1;36m  \___|\___/ |_|\_||_|          \e[0m\n"
echo "\e[1;96mAuthor: \e[1;7;96mnick\e[0m"
echo "\e[1;96m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\e[0m"
echo "\e[1;96mGitHub: https://github.com/Nikelandjelo\e[0m\n"
echo "\e[1;5;91m[!]\e[0m \e[1;4;35mMake sure that you run this script from writable directory!"
echo "\e[1;5;91m[!]\e[0m \e[1;4;35mMake sure that the /home contain only user(s) folder(s)!"
echo "\n\n"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~CHECKS~~~~~~~~~~~~~~~~~~#
# Distro detect
if [ -f "/etc/artix-release" ]; then
    highli "Artix Based: $(cat /etc/artix_relese)" "found"
    inf="artix_openrc" #artix with openrc is the best :D
elif [ -f "/etc/arch-release" ]; then
    highli "Arch Based: $(cat /etc/arch-relese)" "found"
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
    if [ $(which $dep) ]; then
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


# Check for home files
if [ -d "./dot_files" ]; then
    highli "Dot files dir: found" "found"
    dot_dir=true
else
    highli "Dot files dir: not found" "nfound"
    dor_dir=false
fi

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
dot=false
zsh_shell=false

yes_or_no "Do you want to run ugrade" "Upgrade will run!" "Update" && up=true
yes_or_no "Do you want to include some HACKING repos ;) " "Good boyy!" ";((((" && repo=true
yes_or_no "Do you want to install nerd-fonts (required for the zsh configuration)" "Nerd-fonts will be installed!" "Installing nerd-fonts" && nerd=true
yes_or_no "Do you want to install the tools from the tool-lists" "The tools will be installed!" "Installing tools" && too=true
yes_or_no "Do you want to install the tools from the py and gem tool-lists" "The tools will be installed!" "Installing tools" && pygem=true
yes_or_no "Do you want to coppy all dot files in your home dir" "Dot files will be copied!" "Copying dot files" && dot=true
yes_or_no "Do you want to set ZSH as default shell?" "ZSH will be set as a default shell!" "Setting ZSH as a default shell" && zsh_shell=true

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
##################################################################################################
##################################################################################################
##################################################################################################
#~~~~~~~~~~~~~~~RUNNING-THE-CONFIRM~~~~~~~~~~~~~~~~~~#

echo "\n\n"
if [ $up = true ]; then
    upgrade "$inf"
else
    highli "Skipping upgrade!!!" "err"
fi

echo "\n\n"
if [ $repo = true ]; then
    hack "$inf"
else
    highli "Skipping add of repo!!!" "err"
fi

echo "\n\n"
if [ $nerd = true ]; then
    nerd_fonts
else
    highli "Skipping nerd-font installation!!!" "err"
fi

echo "\n\n"
if [ $too = true ]; then
    tools_install "$inf"
else
    highli "Skipping tools installation!!!" "err"
fi

echo "\n\n"
if [ $pygem = true ]; then
    pys_gems
else
    highli "Skipping tools installation!!!" "err"
fi

echo "\n\n"
if [ $dot_dir = true ] && [ $dot = true ]; then
    coppy_dot_files
elif [ $dot_dir = false ]; then
    highli "Dot files directory is missing!!!" "nfound"
else
    highli "Skipping copying the dot files!!!" "err"
fi

echo "\n\n"
if [ $zsh_shell = true ]; then
    zsh_for_def
else
    highli "Skipping setting ZSH as deffault shell!!!" "err"
fi

echo "\n\n\n"
highli "All done!" "done"