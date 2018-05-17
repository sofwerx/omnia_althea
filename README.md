# Omnia_althea
Flashing and using Althea firmware on a Turris Omnia. This repo will also go over flashing and brick recovery.

## Flashing
When flashing the Omnia it will fail the first time and if you are connected through serial it will throw you into a kernel.
See "Recovery from Brick" section for commands. 

Plug in a flash drive with a copy of the built medkit tarball on it. Then press and hold the reset button on the back panel while booting and wait for 4 LEDs to light up regardless of color. This will put the router into flash mode. Once the router has powered on, ssh into it
as root. A banner saying ALTHEA MESH will appear and you will be logged in to the router. 

On a computer give the firmware to the router through scp:
```
scp <firmware> root@192.168.1.1:/tmp/<firmware>
```

Once the router has the firmware enter this command on the router:
```
sysupgrade -v -n /tmp/<firmware>
```

## Recovery from Brick
Use TTL to USB to enter the U-Boot kernel and reset the router to its default environment.
Use commands
```
env default -a
saveenv
```
On a computer open a program like minicom or screen on baudrate 115200 and look for a device called tty.usbserial
or something like that. You may need to install drivers to be able to see such devices. 

### Wiring:

![alt text](https://github.com/sofwerx/omnia_althea/blob/master/images/20180516_141814.jpg "Pinout of Omnia router")

Open the router and at the front of the router between the LEDs and the brightness light there are four pins.
from left to right they are: GND, RX, TX, and power. Connect GND, RX, and TX to the black, white and green wires respectively. 

USB Cable | Omnia
--- | ---
GND (black) | GND
RX (white) | RX
TX (green) | TX
Power (red) | --
