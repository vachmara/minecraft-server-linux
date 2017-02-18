# Minecraft Server for Linux
This repo provides scripts to simplify installing and running a minecraft server on Linux

## Installing
```` bash
git clone https://github.com/lufinkey/minecraft-server-linux
cd minecraft-server-linux
sudo ./install.sh
````
This will install the minecraft-server service and the minecraft-server script

## Usage
Server files will be stored in ````/var/minecraft/servers/default````.
They aren't created until the first time you start the server.

To start running your minecraft server:
````
sudo service minecraft-server start
````
To stop running your minecraft server:
````
sudo service minecraft-server stop
````
