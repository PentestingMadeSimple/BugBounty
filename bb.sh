#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install -y xargs

#installazione di  go
if [[ -z "$GOPATH" ]];then
echo "-- OPSS, sembra che go non sia installato nel sistema!!"
sleep 2
echo "-- Installazione di Golang"
wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
sudo tar -xvf go1.13.4.linux-amd64.tar.gz
sudo mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
source ~/.bash_profile
sleep 1
				
					
fi

sleep 2
echo   "-- Golang installato, procediamo con i vari tools"
sleep 2

#creiamo una cartella nella home
mkdir ~/tools
cd ~/tools/


#installazione sublist3r, noto script in python per l'enumerazione di subdomini
echo "-- installazione di Sublist3r"
echo ""
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
pip install -r requirements.txt
cd ~/tools/
echo "-- Operazione Eseguita"
sleep 2

#installazione di wpscan, vabbe' serve anche lui ogni tanto :)
echo "-- installazione di wpscan"
git clone https://github.com/wpscanteam/wpscan.git
cd wpscan*
sudo gem install bundler && bundle install --without test
cd ~/tools/
echo "-- Operazione Eseguita"
sleep 2

#installazione di dirsearch, noto script in python per fare crawling/brute force di directories. 
echo "-- installazione di dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
cd ~/tools/
echo "-- Operazione Eseguita"
sleep 2

#installazione di host discovery, classico http scanner
echo "-- installazione di  Assetfinder"
go get -u github.com/tomnomnom/assetfinder
cd ~/tools/
echo "-- Operazione eseguita"
sleep 2

#installazione sqlmap
echo "-- installazione di sqlmap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd ~/tools/
echo "-- Operazione Eseguita"
sleep 2

#installazione di masscan, simile a nmap ma piu veloce(dicono)
echo "-- installazione di masscan"
sudo apt-get install git gcc make libpcap-dev
git clone https://github.com/robertdavidgraham/masscan
cd masscan
make
cd ~/tools/
echo "-- Operazione Eseguita"
sleep 2

#installazione di httpx.
echo "-- installazione di httpx "
git clone https://github.com/projectdiscovery/httpx.git
cd httpx/cmd/httpx
go build
mv httpx /usr/bin/
cd ~/tools/
echo "-- Operazione Eseguita"
sleep 2

#installazione di nmap
echo "-- installing nmap"
sudo apt-get install -y nmap
echo "-- Operazione eseguita"
sleep 2

#installazione massdns, DNS resolver
echo "-- installazione di  massdns"
git clone https://github.com/blechschmidt/massdns.git
cd ~/tools/massdns
make
cd ~/tools/
echo "-- Operazione eseguita"
sleep 2

#installazione di httprobe, script in go per l'enumerazione di host attivi http/https
echo "-- installazione di httprobe"
go get -u github.com/tomnomnom/httprobe 
echo "-- Operazione Eseguita"
sleep 2

#installazione di unfurl, script in go che restituisce dati da un url tramite stdin.
echo "-- installazione di unfurl"
go get -u github.com/tomnomnom/unfurl 
echo "-- Operazione Eseguita"
sleep 2

#installazione di  waybackurls, script in go che recupera url in un file e li restituisce in stdout
echo "-- installazione di waybackurls"
go get github.com/tomnomnom/waybackurls
echo "-- Operazione Eseguita"
sleep 2

#installazione di Arjun, script che trova parametri in un url
echo "-- installazione di Arjun"
https://github.com/s0md3v/Arjun
echo "-- Operazione Eseguita"
sleep 2

#download di Seclists, nota compilation di file per fuzzing,brute force,etc
echo "-- downloading di  Seclists"
cd ~/tools/
git clone https://github.com/danielmiessler/SecLists.git
cd ~/tools/SecLists/Discovery/DNS/
##
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/tools/
echo "-- Operazione Eseguita"
sleep 2

echo -e "\n\n\n\n\n\n\n\n\n\n\Operazione Eseguita! Sembra che tutti i scripts siano stati installati correttamente in ~/tools"
ls -la
