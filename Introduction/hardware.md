# Hardware Diagrams

Here are all the parts and pieces that come with your new HEXA:

* HEXA Robot
  * Head shell
  * Distance measuring sensor
  * Infrared transmitter
  * Camera
  * Hardware interfaces
    * USB
    * Audio in/out \(3.5mm\)
    * I²C
    * ADC
    * GPIo
    * 5V/3.3V power output
  * Signal light
* Charging Dock
* AC/DC Adapter

# HEXA Inventory

![](/assets/Screen Shot 2017-08-14 at 10.02.17 AM.png)

# Hardware Interfaces

If you remove HEXA's head shell, you can see the hardware interfaces more clearly:

![](/assets/Screen Shot 2017-08-14 at 10.08.56 AM.png)

# HEXA's Legs

When you turn HEXA upside-down, you can see the power button and charger socket. This diagram shows the correct numbering of the legs, which stay the same even if the head rotates.

![](/assets/download.png)

# Range of Motion

Each of HEXA's legs has a wide range of motion, which you can see defined in the diagrams below. In this diagram, the three joints are at 90, 90, and 45 degrees, respectively.

![](/assets/download %281%29.png)

# Leg and Body Coordinates

The legs and body are tracked using a Cartesian coordinate system based on the diagrams below.

![](/assets/download %282%29.png)

Additionally, the body-coordinates follow the direction of the camera, as opposed to the ground-coordinates. The ground-coordinates will not change when the camera rotates.

![](/assets/download %283%29.png)

