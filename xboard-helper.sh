#
# Compile and install Xboard + uci2wb on Linux computers
# And play duck chess w/ MayhemDuck
#
# > sudo sh xboard-helper.sh
#

VERSION="xboard-helper 0.1"

echo "Hello from $VERSION !"

# Install packages ( propably more is needed ... ) and update
apt install libgtk2.0-dev libglib2.0-dev
apt update

# Compile + Install Xboard
#wget http://hgm.nubati.net/transfer/xboard-4.9.1.tar.gz
tar -xf xboard-v4.9.x-167d205.tar.gz
cd xboard-v4.9.x-167d205
./autogen.sh
./configure
make
make install
cd ..

# Compile + Install UCI2WB
# Download by hand first !!!
# > http://hgm.nubati.net/cgi-bin/gitweb.cgi?p=uci2wb.git;a=tree;h=6b6a612223f609a4dc17ed776091af9fe53797c8;hb=6b6a612223f609a4dc17ed776091af9fe53797c8
tar -xf uci2wb-6b6a612.tar.gz
cd uci2wb-6b6a612
gcc -O2 -s UCI2WB.c -lpthread -o UCI2WB
cp UCI2WB /usr/games/uci2wb
cd ..

# Install MayhemDuck
tar -xf MayhemDuck-2.3.tar.gz
cp MayhemDuck-2.3/mayhemduck-2.3-x86-linux-64bit /usr/games/mayhemduck
#cp MayhemDuck-2.3/mayhemduck-2.3-x86-linux-avx2-64bit /usr/games/mayhemduck # For newer CPUs


# Cleanup
rm -r -f uci2wb-6b6a612
rm -r -f xboard-v4.9.x-167d205
rm -r -f MayhemDuck-2.1
rm -f *.png

# Play MayhemDuck
xboard -fcp "uci2wb mayhemduck" -variant duck
