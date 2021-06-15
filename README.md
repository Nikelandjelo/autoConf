
# Setup Bash Script
![Logo](/readme.gif "Logo")  
Tested on:  
+ Ubuntu 20.x.x
+ Parrot Security
+ Kali Linux
+ Arch
+ Artix (OpenRC)  
  
## Installation
git:  
`git clone https://github.com/Nikelandjelo/autoConf.git`  
curl:  
`curl -O https://raw.githubusercontent.com/Nikelandjelo/autoConf/main/autoConf.sh`  
wget:  
`wget https://raw.githubusercontent.com/Nikelandjelo/autoConf/main/autoConf.sh`  
  
## Usage
Interactive Mod:  
```
chmod +x autoConf.sh
sudo ./autoConf.sh
```  
Non-interactive mod:
```
chmod +x autoConf.sh
sudo ./autoConf.sh [arg]
```  
Arguments:  
```
-h 	Prints this menu.
-A 	Running the all functions.
-u 	Running update and upgrade.
-r 	Adding pen-test repo.
-i	Installing the tools from all tool-lists.
-g	Installing the tools from the gem tool-lists.
-p	Installing the tools from the pip tool-lists.
-s 	Configuring the shells.
-t 	Configuring the text editors.
-K 	Setting-up Kali.
-P 	Setting-up ParrotSecurity.
-B 	Setting-up BlackArch.
```

### What this script can do for you?
+ Update and Upgrade
+ Add a PenTest Repo:
    - Kali (Deb)
    - Parrot (Deb)
    - BlackArch (Arch)
+ Install tools in and out of the package manager
+ Install tools from gem and pip managers
+ Download a new .bashrc for selected users (including root)
+ Install zsh, oh-my-zsh and:
    - zsh autocompleat (custom plugin)
    - zsh highlight (custom plugin)
    - powerline10k (custom theam)
+ Download .zshrc and the powerline10k theams in dot_files dir
+ Download .vimrc and .nanorc
+ Install plugins from .vimrc  
+ Install and configure kitty terminal enumulator
+ Install and configure tmux

### Also:
-K/P/B for custom setup for:
+ Kali
+ Parrot
+ BlackArch

## Further configurations:
### Default Applications:
+ Web Browser:  Brave/Firefox
+ File Manager: Dolphin/Nemo/GNOME Files
+ Terminal:     kitty

### System Shortcuts:
```
kitty                   :   Ctl+Alt+T
terminator              :   Ctl+T
emacs                   :   Ctl+Alt+E
Browser                 :   Ctl+Alt+B
yakuake                 :   F12
File Manager            :   Ctl+Alt+M
Keyboard Layout         :   Meta+Space
Log Out                 :   Ctl+Alt+Del
Close Window            :   Alt+F4  /   Ctl+Alt+C
Full Screen             :   F11
Maximise Window         :   Meta+PgUp
Minimise Window         :   Meta+PgDown
Pack Window Down        :   Ctl+Alt+Down
Pack Window Left        :   Ctl+Alt+Left
Pack Window Right       :   Ctl+Alt+Right
Pack Window Up          :   Ctl+Alt+Up
Quick Tile Bottom       :   Meta+Down
Quick Tile Left         :   Meta+Left
Quick Tile Right        :   Meta+Right
Quick Tile Top          :   Meta+Top
Show Desctop            :   Meta+D
Swich Desktop Down      :   Meta+Ctl+Down
Swich Desktop Left      :   Meta+Ctl+Left
Swich Desktop Right     :   Meta+Ctl+Right
Swich Desktop Up        :   Meta+Ctl+Up
Swich to Desktop #      :   Ctl+F#
Swich to Window Above   :   Meta+Alt+Up
Swich to Window Left    :   Meta+Alt+Left
Swich to Window Right   :   Meta+Alt+Right
Swich to Window Below   :   Meta+Alt+Down
Walk Through Windows    :   Alt+Tab
Walk Through Windows Rev:   Alt+Shift+Backtabe
Windows to Next Screen  :   Meta+Shift+Right
Windows to Prev Screen  :   Meta+Shift+Left
Windows to Next Desktop :   Meta+Shift+Up
Windows to Prev Desktop :   Meta+Shift+Down
Zoom In                 :   Meta+=
Zoom Out                :   Meta+-
```

#### Application Shortcuts:
kitty:
```
New Tab                 :   Ctl+Shift+T
Left Tab                :   Ctl+Shift+Left
Right Tab               :   Ctl+Shift+Right
```

zsh:
```
sudo                    :   Esc+Esc
```
tmux (Prefix Key = Ctl+A):
```
New Window              :   Pref C
Left Window             :   Pref Shift+Left
Right Window            :   Pref Shift+Right
Tab #                   :   Pref #
Last Window             :   Pref Tab
Create Vertical Pain    :   Pref V
Create Horizontal Pain  :   Pref H
Up Pain                 :   Ctl+Up
Left Pain               :   Ctl+Left
Right Pain              :   Ctl+Right
Down Pain               :   Ctl+Down
```

vim:
```
Copy                    :   Ctl+C
Paste                   :   Ctl+V
```
