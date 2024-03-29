#!/bin/bash
cd /tmp || exit
echo "Downloading Postman ..."
wget -q https://dl.pstmn.io/download/latest/linux?arch=64 -O postman.tar.gz
tar -xzf postman.tar.gz
rm postman.tar.gz

echo "Installing to opt..."
if [ -d "~/Postman" ];then
    rm -rf ~/Postman
fi
mv Postman ~/Postman

echo "Creating symbolic link..."
if [ -L "/usr/bin/postman" ];then
    sudo rm -f /usr/bin/postman
fi

sudo ln -s /opt/Postman/Postman /usr/bin/postman

echo "Creating .desktop file..."
if [ -e "/usr/share/applications/Postman.desktop" ];then
    sudo rm /usr/share/applications/Postman.desktop
fi

sudo touch /usr/share/applications/Postman.desktop

sudo chown $USER /usr/share/applications/Postman.desktop 

sudo cat > /usr/share/applications/Postman.desktop <<- "EOF"
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOF

echo "Installation completed successfully."
echo "You can use Postman!"