# Using the HEXA Simulator

We provide a 3D [HEXA Simulator](https://www.vincross.com/download-hexa-simulator) application so you can modify your HEXA from your computer.

You can use it as a sandbox for prototyping and designing new moves.

HEXA Simulator is available for both Windows and macOS.

# Sandbox Editor

![](/assets/Screen Shot 2017-08-15 at 9.15.13 PM.png)

You can drag and drop shapes into the world to mimic obstacles that HEXA might encounter. Currently we support cubes, spheres, and capsule shapes. You can change the color, position, and coordinates of each shape as well as of the HEXA.

# How to Edit or Create a New Motion

You can design new motions for the HEXA from within the Simulator. To do so, first you'll need to create or open an existing World.

![](/assets/Screen Shot 2017-09-04 at 10.20.20 AM.png)

Once you've loaded your World, you can see the sandbox editor and 3D environment to test HEXA's motions. In order to create a new motion, select 'Menu' at the top left of your screen and then 'New Motion'.

<img src="/assets/Screen Shot 2017-09-04 at 10.20.47 AM.png" align="center" width=400>

This will bring you to the motion design screen. Here you can control and modify each joint and leg of the HEXA, and play back the motions on screen to test them.



# How to Export Your Motions

Once you've created a new motion in the HEXA Simulator, you can export it for use on your HEXA robot.

In the Motion Designer, right-click the motion you are interested in, then select 'Export'. You can select a name and location for the file to be saved.

<img src="/assets/Screen Shot 2017-09-04 at 11.41.55 AM.png" align="center" width=400>

HEXA Motions are saved as `.vsm` files, and if you open it with a text editor this is what you'll see:

```
Als-MacBook-Pro:Desktop alnelson$ less handclap.vsm
V0A90V1A90V2A45V3A90V4A90V5A45V6A120V7A110V8A135V9A90V10A70V11A135V12A90V13A70V14A135V15A60V16A110V17A135V18A0T200|V0A60V1A70V2A45V3A120V4A70V5A45V6A120V7A110V8A135V9A90V10A70V11A135V12A90V13A70V14A135V15A60V16A110V17A135V18A0T200
```

It might look like a nonsense string of letters and numbers, but it follows a specific pattern to tell HEXA how to move.

Here's how it works:

1. Frames of motion are separated by the pip character "|".
2. The text in each frame tells us the angle of HEXA's 18 leg joints and its head. The formatting looks like this: `VxxAxxVxxAxx...Txx`
3. The number after the T refers to the execution time of the frame. It is also referred to as the "duration" of the movement.
4. The number after the A refers to the angle of that joint in degrees. So `A90` means 90 degrees.
5. The number that comes after the V refers to the number of HEXA's joint. They joints are numbered starting with joint 0 of leg 0. So 0, 1, and 2 refer to the 0th, 1st, and 2nd joint of the 0th leg. Then when you get to 3, we're talking about leg number 1. Here's a list to help you map numbers to legs and joints.

```
V0 --> Leg 0, Joint 0
V1 --> Leg 0, Joint 1
V2 --> Leg 0, Joint 2
V3 --> Leg 1, Joint 0
V4 --> Leg 1, Joint 1
V5 --> Leg 1, Joint 2
V6 --> Leg 2, Joint 0
V7 --> Leg 2, Joint 1
V8 --> Leg 2, Joint 2
V9 --> Leg 3, Joint 0
V10 --> Leg 3, Joint 1
V11 --> Leg 3, Joint 2
V12 --> Leg 4, Joint 0
V13 --> Leg 4, Joint 1
V14 --> Leg 4, Joint 2
V15 --> Leg 5, Joint 0
V16 --> Leg 5, Joint 1
V17 --> Leg 5, Joint 2
V18 --> HEXA's head
```

See this post for more details: [https://forum.vincross.com/t/about-hexa-simulator-api/170/4](https://forum.vincross.com/t/about-hexa-simulator-api/170/4)
