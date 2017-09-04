# Using the HEXA Simulator

We provide a 3D [HEXA Simulator](https://www.vincross.com/download-hexa-simulator) application so you can modify your HEXA from your computer.

You can use it as a sandbox for prototyping and designing new moves.

HEXA Simulator is available for both Windows and macOS.

# Sandbox Editor

![](/assets/Screen Shot 2017-08-15 at 9.15.13 PM.png)

You can drag and drop shapes into the world to mimic obstacles that HEXA might encounter. Currently we support cubes, spheres, and capsule shapes. You can change the color, position, and coordinates of each shape as well as of the HEXA.

# How to Create a New Motion

You can design new motions for the HEXA from within the Simulator. To do so, first you'll need to create or open an existing World.

![](/assets/Screen Shot 2017-09-04 at 10.20.20 AM.png)

Once you've loaded your World, you can see the sandbox editor and 3D environment to test HEXA's motions. In order to create a new motion, select 'Menu' at the top left of your screen and then 'New Motion'.

<img src="/assets/Screen Shot 2017-09-04 at 10.20.47 AM.png" align="center" width=350>

This will bring you to the motion design screen. Here you can control and modify each joint and leg of the HEXA, and play back the motions on screen to test them.

# How to Export Your Motions

Once you've created a new motion in the HEXA Simulator, you can export it for use on your HEXA robot.

In the Motion Designer, right-click the motion you are interested in, then select 'Export'. You can select a name and location for the file to be saved.

SCREENSHOT

HEXA Motions are saved as `.vsm` files, and if you open it with a text editor this is what you'll see:

```
Als-MacBook-Pro:Desktop alnelson$ less handclap.vsm
V0A90V1A90V2A45V3A90V4A90V5A45V6A120V7A110V8A135V9A90V10A70V11A135V12A90V13A70V14A135V15A60V16A110V17A135V18A0T200|V0A60V1A70V2A45V3A120V4A70V5A45V6A120V7A110V8A135V9A90V10A70V11A135V12A90V13A70V14A135V15A60V16A110V17A135V18A0T200
```

It might look like a nonsense string of letters and numbers, but it follows a specific pattern to tell HEXA how to move. Here's how it works:



See this post for details: [https://forum.vincross.com/t/about-hexa-simulator-api/170/4](https://forum.vincross.com/t/about-hexa-simulator-api/170/4)
