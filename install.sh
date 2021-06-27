#!/bin/bash

if [[ $EUID -ne 0 ]]
then
	>&2 echo "This script must be run as root"
	exit 1
fi

server_home="/var/minecraft"

while [ "$agree" != "y" ] && [ "$agree" != "n" ]
do
	read -p "Do you agree to the Minecraft EULA? (https://account.mojang.com/documents/minecraft_eula) (y/n): " agree
done
if [ "$agree" == "n" ] || [ "$agree" != "y" ]
then
	exit 1
fi

# Moving into script directory
base_dir=$(dirname "${BASH_SOURCE[0]}")
cd "$base_dir"

if type "apt-get"
then
	apt-get install -y $(cat dependencies.txt)
elif type "yum"
then
	yum install -y $(cat dependencies.txt)
else
	echo "Could not determine your package manager"
	echo "You'll have to install dependencies manually"
	echo "dependencies are listed in dependencies.txt"
fi

if [ -z "$(id -u minecraft)" ]
then
	useradd --system --no-create-home --shell "/bin/false" minecraft
	nobody_home=~nobody
	usermod -d "$nobody_home" minecraft
else
	echo 'user "minecraft" already exists'
fi
mkdir -p "$server_home"
mkdir -p "$server_home/servers"
cp "minecraft-server" "/usr/local/bin/minecraft-server"
cp "minecraft-server.service" "/etc/init.d/minecraft-server"
chmod +x "/etc/init.d/minecraft-server"
chmod +x "/usr/local/bin/minecraft-server"
chown -R minecraft:minecraft "$server_home"

if [ "$1" == "bukkit" ]
then 
	minecraft-server update bukkit
else 
	minecraft-server update
fi	

update-rc.d minecraft-server defaults

