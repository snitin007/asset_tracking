# Asset Tracking 

Asset Tracking using Magnetometry and a self-sustained WiFi network

<img alt="little 3d printed case" src="https://user-images.githubusercontent.com/10133520/58359398-92c96b00-7e83-11e9-9285-94ef4a91110a.png"  width="60%">

The aim of the project is to build an asset tracking system using the concept of
magnetometry. An asset tracking system is simply a wireless sensor network for
indoor positioning of assets and objects.
Indoor positioning system is used in places where the use of GPS’s would be very
innacurate due to small displacements, IPA’s can be used inside warehouses and big
buildings for finding a person or an asset.
![Architecture](https://user-images.githubusercontent.com/10133520/58359378-7b8a7d80-7e83-11e9-9b59-8638069b2e94.png)
Most indoor positioning system is based around the idea of bluetooth low energy, as
a new approach we used WiFi for tracking objects in space.
Most wireless systems use signal strength as a functionality to detect proximity and
this can be used to find a scalar measurement of an object relative to the signal
source. Since signal strength can only perceive the distance, this information is
useless if the direction of signal is un-available.
To solve this issue we use digital compasses for finding the heading and bearing to
true magnetic north since the Earth magnetic field can be relatively used anywhere
accross the globe.
The angle of deviation and inclination could be used to find relative positions
between objects.

<img alt="Finding location" src="https://user-images.githubusercontent.com/10133520/58359438-bab8ce80-7e83-11e9-93c7-c7b5b1821c15.png"  width="50%">

## Hardware used 
 - RaspberryPi
 - HMC5883L Digital compass
 - ESP32 WiFi Module
 
### Working
The beacons must be turned on by plugging them into a portable power
source.
- The compass must be placed horizontal to the ground.
- During paring mode, the LED’s blink rapidly and once they have found the
right central device, they make an attempt to connect to the node with the
strongest signal.
- The LED’s will flickr once in 5 seconds to show transmission of data.
- In case of a network failure, the node will reconnect with 5 attempts, if all the
5 attempts fail, then the node will restart and redo the pairing process.
- The use can go to `192.168.43.10/5000/show_all` to view the current positioning
of the user in the building.
- The user can search for all the central’s by clicking on Home.
- By clicking on ‘all locations’ the user can look for all the rooms and the hisotry of the nodes
in that room.
- In the home view, the user can click on **show** to view a 2D map of the room where the person
is located.

### Run
- `bundle install`
- `rails s`
