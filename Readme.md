# Gree Dummy Server
Based on https://github.com/emtek-at/GreeAC-DummyServer
Changes:
* update .net core from 3.1 to 8.0
* docker file for raspberry pi

This project makes it possible to block all Internet traffic from your Gree AC Devices. 
It is coded using the dotnet core 3.1 Framework in C#. The Server must listen on port 5000, because the AC Devices sends there first command to this port.
There is also the possibility to run it in a docker container.

# Installation
* You have to run your own DNS Server. Add an entry for the Dummy Server like gree.example.com and point it to the IP Address running the Server.
#### Docker
* `sudo docker build -t greeac-dummyserver:net8-arm64 .`
* `sudo docker run -d --restart=always \
  -e DOMAIN_NAME=my.gree.com \
  -e EXTERNAL_IP=172.0.0.4 \
  -p 5000:5000 \
  greeac-dummyserver:net8-arm64`
#### Bare Metal
* set the environment variables DOMAIN_NAME, and EXTERNAL_IP to the same values as your DNS Record
* start the Server with dotnet DummyServer.dll

# Device Configuration
For the Device Configuration use ConfigTool. https://github.com/Hagakurje/GreeAC-ConfigTool
