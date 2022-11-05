#!/bin/sh
##setup command=wget https://raw.githubusercontent.com/emil237/ArabicSavior/main/installer.sh -O - | /bin/sh

version=1.9

# remove old version
if [ -f /var/lib/dpkg/status ]; then
   apt-ger -r enigma2-plugin-extensions-arabicsavior
else
   opkg remove enigma2-plugin-extensions-arabicsavior
fi

cd /tmp
rm -f *ArabicSavior*
# Download new version
wget "https://raw.githubusercontent.com/emil237/plugins/main/ArabicSavior-"$version".tar.gz"

# remove old version
rm -r /usr/lib/enigma2/python/Plugins/Extensions/ArabicSavior > /dev/null 2>&1

# Install new version
tar -xzf ArabicSavior-"$version".tar.gz -C /
set +e
rm -f *ArabicSavior*
cd ..

sync
echo "#########################################################"
echo "#      ArabicSavior INSTALLED SUCCESSFULLY              #"
echo "#                 mfaraj57  &  RAED                     #"                       
echo "#########################################################"
echo "#           your Device will RESTART Now                #"
echo "#########################################################"
sleep 3
killall -9 enigma2
exit 0










