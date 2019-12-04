# TODO

## next

* first time:
** flash
** manually add `mda.identity` to boot partition

* update flasher to auto-probe for known pi partition
* mount and check for LKG device name
* check that our eth0/wlan0 is not the flash target

write script to auto-initialize pi based on eth0/wlan0 from table of known hosts


do an A3 for script?

# card init
- [ ] flash with raspbian lite
- [ ] put hostname/eth0/wlan0 map on boot partition in `mdabone.host_device_map`
- [ ] touch `ssh` file in root partition


# host init
- [ ] dist-upgrade
- [ ] apt-based software install
  * `eject`



# arch

## bootstrap

### deployment

![deployment](http://www.plantuml.com/plantuml/png/JOvH2W9H24N_NSLTHp0mj8Le0VAq1ffvXjfNjFVUiv_W_dZF4LqZsVDrxDHD5DWi4cyYe6Qnzb3_5K2pusbTU-AsSspgentv48sKtzZ5bQLs2aQQyrqHCbcPL4UMvTy-uNevqwfTvYzV)

<!--
@startuml
node  host {

  node docker {

    component flasher

  }

}

node cardreader {

  storage sdcard

}


host == cardreader : USB
@enduml
-->


### sequence
![sequence](http://www.plantuml.com/plantuml/png/POyn2iCm301tlK8V2Daxb3oZgsCvrDILYoGNyllAO592HkdkRBIe1R7sBX2YLS6cIM2jZId8Zh5aY9LDQi6j17qwJ6pPTbIAGGYW1pZTkuett38JVeAuaYk3BpiRwPKFuCvupvMYQtd16ATJFLFwpagFVtTyVA0-zdNJSx8a9Z_p1m00)

<!--
@startuml
actor user
boundary cli
control flasher
entity sdcard

user -> cli : find partition
cli -> flasher : find partition
flasher -> sdcard : lsblk
sdcard --> flasher : /dev/sdX
flasher --> cli : /dev/sdX
cli --> user : /dev/sdX
@enduml
-->


# notes

## uml

[PlantUML](http://www.plantuml.com)

[PlantUML Server](http://www.plantuml.com/plantuml/uml)

https://stackoverflow.com/questions/683825/in-uml-class-diagrams-what-are-boundary-classes-control-classes-and-entity-cl

http://www.agilemodeling.com/artifacts/sequenceDiagram.htm

https://www.uml-diagrams.org/sequence-diagrams-reference.html



## config

https://www.52pi.com/blog/19-instructions-of-command-line-in-raspi-config

https://www.cyberciti.biz/faq/how-to-disable-ssh-password-login-on-linux/




## startup

https://raspberrypi.stackexchange.com/questions/8734/execute-script-on-start-up

https://www.raspberrypi.org/documentation/linux/usage/rc-local.md

