#!/bin/bash
# PS2DEV installer + updater (lolol if this works -K)
SOURCEDIR=$HOME


if [ -f "$HOME/ps2dev/build-all.sh" ]; then
echo "ps2dev found, updating..."
# update ps2dev + ethernet driver
cd $HOME
rm -rf $HOME/ps2dev/build
cd $HOME/ps2dev/ && git pull && ./build-all.sh
cd $HOME
# eth
cd $HOME/ps2eth && git fetch origin && git reset --hard origin/master && make clean && make clean all install && cd $HOME
#if it's not there, install it and its dependencies.
else
	echo -e "ps2dev not found, installing"
	echo '#ps2dev vars' >> ~/.bashrc
	echo 'export PS2DEV=/usr/local/ps2dev' >> ~/.bashrc
	echo 'export PS2SDK=$PS2DEV/ps2sdk' >> ~/.bashrc
	echo 'export GSKIT=$PS2DEV/gsKit' >> ~/.bashrc
	echo 'export PATH=$PATH:$PS2DEV/bin:$PS2DEV/ee/bin:$PS2DEV/iop/bin:$PS2DEV/dvp/bin:$PS2SDK/bin' >> ~/.bashrc
	# adds PATH variables neccessary for PS2DEV to compile, time to reload bash
	. ~/.bashrc
	# now we need a working directory
	sudo mkdir /usr/local/ps2dev
	sudo chmod 777 /usr/local/ps2dev
	# restarted, now let's download some software!
	sudo apt install -y gedit
	sudo apt install -y build-essential
	sudo apt install -y git
	sudo apt install -y texinfo
	sudo apt install -y libucl-dev
	sudo apt install -y zlib1g
	sudo apt install -y zlib1g-dev
	sudo apt install -y zlibc
	# let's make a load directory for ELF binaries so it's easier down the road.
	mkdir $HOME/load
	echo "made directory for elf loading"
	# now for ps2dev-main
	cd $HOME && git clone https://github.com/ps2dev/ps2dev.git ps2dev && cd ps2dev && ./build-all.sh
	# suprise-ethernet-driver
	cd $HOME && git clone https://github.com/ps2dev/ps2eth.git ps2eth && cd ps2eth && make clean all install && cd $HOME
fi

# end section 1 - ps2dev enviornment. 
# Section 2, OPL 
OPL=$HOME/open-ps2-loader
if [ -d "$OPL" ]; then
    echo "$OPL is a directory."
    echo "updating..."
    #yes we update it too now.
    cd $HOME/open-ps2-loader && make clean && git pull && make rebuild && cd $HOME
else
echo -e "OPL not found, installing..."
cd $HOME
git clone https://github.com/ps2homebrew/Open-PS2-Loader.git open-ps2-loader
cd $HOME && cd open-ps2-loader
make rebuild
mkdir $HOME/load
cp ~$OPL/opl.elf ~$HOME/load
fi
# end section 2
# section 3 (in progress) - eth0 config. Here are variables you should edit if you're not
# using a dedicated machine or VM for dev purposes.
