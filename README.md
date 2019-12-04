# Bare Metal Setup Tools for Raspberry Pi

## sd card provisioning

- [ ] unwrap image in `flasher` container
- [ ] automatically add `ssh` tag to root partition
- [ ] probe existing image information from root partition?

## os bootstrap
- [ ] use `nmap -sn ip/mask` to detect pi
- [ ] WAP role
- [ ] key management


## V4

### architecture
* use pi as host from which to flash SD card

### workflow
* flash image onto target SD card
* provide target hostname as argument
* establish bootstrap environment on target SD card 
