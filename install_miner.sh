#/usr/bin/bash
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Install GO"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
export GOLANG="go1.17.2.linux-amd64.tar.gz"
wget https://golang.org/dl/$GOLANG
sudo tar -C /usr/local -xzf $GOLANG
rm $GOLANG
unset GOLANG
mkdir -p ~/go/src
echo 'PATH=$PATH:/usr/local/go/bin' >> ~/.profile
echo 'GOPATH=$HOME/go' >> ~/.profile
source ~/.profile
go env -w GO111MODULE=off
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Install git"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
apt-get update
apt-get install git
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Install emulator"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
cd ~
git clone https://bitbucket.org/m0rph3us1987/duino-coin.git
go get github.com/m0rph3us1987/color
go get github.com/m0rph3us1987/screen
cd ~/duino-coin/arduino_miner
go build
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Setup systemd"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
cd ~/miner_installer
cp miner.service /usr/lib/systemd/system/miner.service
cp miner.conf ~/duino-coin/arduino_miner/miner.conf
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "All Done!"
echo "*** Rember to set an hostname ***"
echo "*** systemctl start miner.service starts the miner ***"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
