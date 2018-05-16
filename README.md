# Omnia_althea
Flashing and using Althea firmware on a Turris Omnia. This repo will also go over flashing and brick recovery.

## Flashing


## Recovery from Brick
Use TTL to USB to enter the U-Boot kernel and reset the router to its default environment.
Use commands
```
env default -a
saveenv
```

### To connect to serial:
Open the router and at the front of the router between the LEDs and the brightness light there are four pins.
from left to right they are: GND, RX, TX, and power. Connect GND, RX, and TX to the black, white and green wires respectively. 

USB Cable | Omnia
GND (black) | GND
RX (white) | RX
TX (green) | TX
Power (red) | --
