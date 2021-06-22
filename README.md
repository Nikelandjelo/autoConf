# Setup Bash Script  
![Logo](/screenshots/1.png "Logo")  
![Logo](/screenshots/2.png "Logo")  
  
Sources:  
nvim source: https://github.com/siduck76/NvChad  
rxfetch source: https://github.com/Mangeshrex/rxfetch  
tmux source: https://github.com/gpakosz/.tmux  
oh-my-zsh: https://github.com/ohmyzsh/ohmyzsh  
powerline10k: https://github.com/romkatv/powerlevel10k  

Tested on:  
+ Ubuntu 20.x.x
+ Parrot Security
+ Kali Linux
+ Arch
+ Artix (OpenRC)  
  
## GRUB Themes:  
https://store.kde.org/p/1414997/
https://store.kde.org/p/1484567/
https://store.kde.org/p/1429443/
https://store.kde.org/p/1420727/
  
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

### Application Shortcuts:
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

nvim (Leader key = Space): (Source: https://github.com/siduck76/NvChad/wiki/mappings)
```
Ctl+l                   :    Open terminal vertically over right
Ctl+x                   :    Open terminal horizontally below the current window
Ctl+n                   :    toggle neovim tree
Shift+h:                :    show hidden files (use these keybinds when cursor's in the filetree, same for the keybinds below).
Ctl+v                   :    open files in vertical split
Ctl+x                   :    open files in horizontal split
leader+n                :    toggle line number
leader+z                :    toggle truezen.nvim's Ataraxis mode
leader+m                :    toggle truezen.nvim's minimalistic mode
Ctl+a                   :    copies everything in the current file
select any text + y     :    copies the selected text
leader+fb               :    open all buffers
leader+ff               :    find files in the current DIR
leader+fo               :    open recently edited files
leader+fh               :    opens up a help page like thing
Ctl+v                   :    open files in vertical split
Ctl+x                   :    open files in horizontal split
leader+fm               : formats or beautifies the code in current window via neoformat (currently only html ,css , js can be formatted . To be able to use this keybind you need to install the formatter locally for your language , in my case prettier was required only so I installed it. check this.
<C-u>, <C-d>, <C-b>, <C-f>, <C-y> and <C-e> : Smooth scrolling for window movement commands.
TAB or Shift TAB cycle through opened tabs
Shift+x                 :   close current tab
Shift+t                 :   open new tab
K                       :   hover and show the definition
gd                      :   jumps to the definition (works for user and language definitions)
[d                      :   jumps to the previous error
]d                      :   jumps to the next error
leader+D                :   jumps to the definition
leader+wq               :   list all the errors in a new buffer
leader+rn               :   rename all instances of this definition (user functions and declaration)
leader+/                :   toggle
```

vim:
```
Copy                    :   Ctl+C
Paste                   :   Ctl+V
```

## Browser's Shrotcut Cheepsheet:
Tabs:
```
Ctl+1-8                     Switch to the specified tab, counting from the left.
Ctl+9                       Switch to the last tab.
Ctl+Tab / Ctrl+PgUp         Switch to the next tab – in other words, the tab on the right.
Ctl+Shift+Tab / Ctl+PgDn    Switch to the previous tab – in other words, the tab on the left.
Ctl+W, Ctl+F4               Close the current tab.
Ctl+Shift+T                 Reopen the last closed tab.
Ctl+T                       Open a new tab.
Ctl+N                       Open a new browser window.
Alt+F4                      Close the current window.
```

Mouse Actions for Tabs:
```
Middle Click a Tab              Close the tab.
Ctrl+Left Click / Middle Click  Open a link in a background tab.
Shift+Left Click                Open a link in a new browser window.
Ctrl+Shift+Left Click           Open a link in a foreground tab.
```

Navigation:
```
Alt+Left Arrow / Backspace          Back.
Alt+Right Arrow / Shift+Backspace   Forward.
F5 / Ctl+R                          Reload.
Ctl+F5                              Reload and skip the cache, re-downloading the entire website.
Escape                              Stop.
Alt+Home                            Open homepage.
```

Zooming:
```
Ctl++ / Ctl+Mousewheel Up       Zoom in.
Ctl+– / Ctl+Mousewheel Down     Zoom out.
Ctl+0                           Default zoom level.
F11                             Full-screen mode.
```

Scrolling:
```
Space / PgDn            Scroll down a frame.
Shift+Space / PgUp      Scroll up a frame.
Home                    Top of page.
End                     Bottom of page.
```

Address Bar:
```
Ctl+L / Alt+D / F6  Focus the address bar so you can begin typing.
Alt+Enter           Open the location in the address bar in a new tab.
```

Search:
```
Ctl+K or Ctl+E          Focus the browser’s built-in search box or focus the address bar if the browser doesn’t have a dedicated search box. (Ctrl+K doesn’t work in IE, Ctrl+E does.)
Alt+Enter               Perform a search from the search box in a new tab.
Ctl+F / F3              Open the in-page search box to search on the current page.
Ctl+G / F3              Find the next match of the searched text on the page.
Ctl+Shift+G / Shift+F3  Find the previous match of the searched text on the page.
```

History & Bookmarks:
```
Ctl+H           Open the browsing history.
Ctl+J           Open the download history.
Ctl+D           Bookmark the current website.
Ctl+Shift+Del   Open the Clear Browsing History window.
```

Other Functions:
```
Ctl+P               Print the current page.
Ctl+S               Save the current page to your computer.
Ctl+O               Open a file from your computer.
Ctl+U               Open the current page’s source code. (Not in IE.)
F12 / Ctl+Shift+I   Open Developer Tools.
```
