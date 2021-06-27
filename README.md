# Minecraft Server for Linux
This repo provides scripts to simplify installing and running a minecraft server on Linux

## Installing
```` bash
git clone https://github.com/lufinkey/minecraft-server-linux
cd minecraft-server-linux
sudo ./install.sh
````
This will install the minecraft-server service and the minecraft-server script with official minecraft version.
To install Spigot version please run this command instead the last one:

```` bash
sudo ./install.sh bukkit
````

## Usage
Server files will be stored in ````/var/minecraft/servers/default````.
They aren't created until the first time you start the server.

To start running your minecraft server:
```` bash
sudo service minecraft-server start
````
To stop running your minecraft server:
```` bash
sudo service minecraft-server stop
````

## Advanced usage

Update server to Spigot / Crafbukkit version:
```` bash
sudo ./minecraft-server run your_server_name bukkit
````
If you want change the default server running through minecraft-server service. Change `server_name="your_server_name"` variable available [here](https://github.com/vachmara/minecraft-server-install/blob/345128b501ca6e3bffe4ef974c62368ebc32f753/minecraft-server.service#L14).
In case you have multiple servers running, don't forget to update `server.properties` port in your minecraft server files.
