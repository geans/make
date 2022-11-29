# Initial creates

mkdir ~/bin
cd ~/bin
TARGET_BASHRC=~/.bashrc

## creating addbashrc funtion on .bashrc file
echo "function addbashrc" >> ~/.bashrc
echo "{" >> ~/.bashrc
echo "	echo $1 >> ~/.bashrc" >> ~/.bashrc
echo "}" >> ~/.bashrc
source ~/.bashrc

addbashrc "MYPATH=''"



# Basic programs
sudo apt install vim g++ unzip tar wget apt-transport-https


# For hooking

## [MITM Proxy](https://mitmproxy.org)
wget https://snapshots.mitmproxy.org/4.0.4/mitmproxy-4.0.4-linux.tar.gz -O proxy.tar.gz
mkdir proxy.tar.gz
tar xzf proxy.tar.gz -C mitmproxy-4.0.4-linux
rm proxy.tar.gz

## [Frida tools](https://www.frida.re/)
sudo python3 -m pip install frida


# Developer

## Pip for Python 3
sudo apt install python3-pip

## [sublime-text 3](https://www.sublimetext.com)
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
addbashrc "MYPATH=$MYPATH:/opt/sublime_text/sublime_text"

## Android Studio
wget https://dl.google.com/dl/android/studio/ide-zips/3.3.2.0/android-studio-ide-182.5314842-linux.zip?hl=pt-br -O android-studio.zip
unzip android-studio.zip
rm android-studio.zip
addbashrc "MYPATH=$MYPATH:~/bin/android-studio"

## Android SDK
### Install android sdk from android studio and add you directory to PATH

# Personal

## [youtube-dl](https://youtube-dl.org)
sudo apt-get install ffmpeg
sudo python3 -m pip install --upgrade youtube_dl
addbashrc 'alias youtube-audio-dl="youtube-dl -x --audio-format mp3 --audio-quality 0"'

## [unfield remote](https://www.unifiedremote.com/)
wget https://www.unifiedremote.com/download/linux-x64-deb -O urserver.deb
sudo dpkg -i urserver.deb


# End

addbashrc "export PATH=$PATH:$MYPATH"
## others alias
addbashrc 'alias okbash="source ~/.bashrc"'
addbashrc 'alias mybash="vim ~/.bashrc"'
addbashrc 'alias python=python3'
source $TARGET_BASHRC