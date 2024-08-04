### Install Apycula, Yosys, Gowin nextpnr and OpenFPGALoader to Tang Nano 
### Machine: WSL Ubuntu 24.04 LTS

sudo apt update

## apycula
sudo apt install python3-pip -y
#sudo  apt install python3.12-venv -y
sudo pip install apycula --break-system-packages
#python3 -m venv my-env
#my-env/bin/pip install apycula

#echo 'export PATH=$PATH?/home/$(whoami)/my-venv/bin/' >> ~/.bashrc
#echo 'export PATH=$PATH?/home/$(whoami)/.local/bin/' >> ~/.bashrc
echo 'export PATH=/usr/local/bin/' >> ~/.bashrc
source ~/.bashrc

## Yosys
sudo apt-get install build-essential clang lld bison flex	libreadline-dev gawk tcl-dev libffi-dev git graphviz xdot pkg-config python3 libboost-system-dev libboost-python-dev libboost-filesystem-dev zlib1g-dev -y

git clone https://github.com/YosysHQ/yosys.git
cd yosys/
git submodule update --init
make
sudo make install
yosys --version
cd ..

## Gowin nextpnr
sudo apt install -y clang-format python3-dev libboost-all-dev libeigen3-dev
sudo apt-get install qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools -y
sudo apt  install cmake -y
git clone https://github.com/YosysHQ/nextpnr.git
cd nextpnr 
cmake . -DARCH="himbaechel" -DHIMBAECHEL_GOWIN_DEVICES="all" -DBUILD_GUI=ON
#cmake . -DARCH="gowin" -DBUILD_GUI=ON
make -j$(nproc)
sudo make install
cd ..

## OpenFPGALoader
sudo apt install -y  git  gzip  libftdi1-2  libftdi1-dev  libhidapi-hidraw0  libhidapi-dev  libudev-dev  zlib1g-dev  cmake  pkg-config  make  g++
git clone https://github.com/trabucayre/openFPGALoader
cd openFPGALoader
mkdir build
cd build
cmake .. # add -DBUILD_STATIC=ON to build a static version
         # add -DENABLE_UDEV=OFF to disable udev support and -d /dev/xxx
         # add -DENABLE_CMSISDAP=OFF to disable CMSIS DAP support
cmake --build .
sudo make install
cd ../../
#sudo cp 99-openfpgaloader.rules /etc/udev/rules.d/
#sudo udevadm control --reload-rules && sudo udevadm trigger # force udev to take new rule
#sudo usermod -a $USER -G plugdev # add user to plugdev group

## Testing
#nextpnr-gowin --version
nextpnr-himbaechel -V
yosys --version
gowin_bba --version
openFPGALoader -V
