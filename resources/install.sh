#!/bin/bash
cd $1
touch /tmp/playtts_dep
echo "Début de l'installation"
echo 0 > /tmp/playtts_dep

sudo apt-get install -y mplayer mpg123 lsb-release
echo "Installation mplayer"
echo 30 > /tmp/playtts_dep

test=`lsb_release -is`
if [ "$test" = "Raspbian" ]; then
        sudo apt-get install -y libsox-fmt-mp3 sox libttspico-data
else
        sudo apt-get install -y libsox-fmt-mp3 sox libttspico-utils
fi
echo "Installation PicoTTS"
echo 70 > /tmp/playtts_dep

sudo usermod -a -G audio www-data
echo "Ajout de www-data dans le groupe audio"
echo 80 > /tmp/playtts_dep

sudo amixer set Master 85%
echo "Configuration audio"
echo 0 > /tmp/playtts_dep

sudo amixer set Headphone 85%
echo "Configuration sortie audio"
echo 90 > /tmp/playtts_dep

sudo amixer set PCM 85%
echo "Fin de l'installation"
rm /tmp/playtts_dep