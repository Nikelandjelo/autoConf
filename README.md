
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
