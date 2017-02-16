# minecraft-server-linux
Simple install script and service for running a minecraft server on linux

## Installing
```` bash
git clone https://github.com/lufinkey/minecraft-server-linux
cd minecraft-server-linux
./install.sh
````
This will install the minecraft-server service and the minecraft-server script

## Usage
The server files for the minecraft-server service will be stored in ````/var/minecraft/servers/default````.
They aren't created until the first time you start the server.

To start running your minecraft server:
````
sudo service minecraft-server start
````
To stop running your minecraft server:
````
sudo service minecraft-server stop
````
