# ps2devinstall
a ps2dev install script

a simple guide how to use this:
# On Ubuntu/Mint and systems that use APT
1. first, make sure git is installed, or just download the script from here.
2. clone it into home, or a folder in home (i do `git clone <url> psi` for my tests)
3. type `chmod 777 <dir>/ps2install.sh
4. type ./ps2devinstall
**5. Currently, there's a bug where the terminal doesn't reset in the middle, so you may need to delete the ps2dev and ps2eth folders in home and re-run it after a reboot.**
6. navigate to /usr/local/ps2dev 
7. program your Qb

# On Manjaro/Arch and systems that use Pacman
this feature isn't ready yet, but it's on its way since I primarialy use Manjaro as my distro of choice.
**coming soon** although-
the attuned of you will find the same procedure used in the script (and on ps2home's website) is adaptable manually to arch systems. It has been done twice (i watched one by my pro friend Eclipse- i reccomend you check him out (bunger)
the two main pains are libucl can be picky on arch, and for some reason pacman -Sy doesn't work sometimes (a bug)

# CentOS/Other Systems
i don't plan on trying to adapt it to all systems, however the main thing you need to really adapt it to anything is:
build-essential, make, zlib1g, zlib-dev, libucl-dev and an editior of your choice (i don't reccomend nano that's included, I use vim or gedit, or for actual programming vscode)
if I ever end up switching systems again, i'll include a script for it probably, but it's unlinkely. 
**alternatively, if you would like to contribute by finding the requirements in binaries that could be compiled universially, it is very much appreciated!**
`end koda`
