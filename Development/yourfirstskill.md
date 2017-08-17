# Your First Skill

Are you ready to build your first skill on HEXA? This first example shows how to use the `mind` CLI to build, package, and run a Skill on HEXA. Then we'll talk about how to make HEXA walk and use sensors in the [SensorWalkSkill tutorial](/Development/sensorwalktutorial.md).

Make sure you've [installed](/Development/installmind.md) the MIND SDK before continuing.

## Create a new project

To start running Skills on our HEXA, we can use `mind init projectname` to build an example skeleton project. Let's do that now:

```
$ mind init helloworld
$ cd helloworld
```

## Build and package

Well, our Skill doesn't really do anything right now. But that's okay. We should probably test that we can build and package it correctly, and get it sent to our HEXA robot. We'll go into how to make a walking skill in this [tutorial](/Development/yourfirstskill.md).

```
$ mind build   # Will build an ARM binary into robot/skill
$ mind pack    # Will pack the Skill as an mpk file.
```

## Run

Before we can run a Skill, we need to tell it what HEXA to run on. To see a list of available HEXAs on the network, we can run `mind scan`.

```
$ mind scan
10.0.0.51 HEXA
10.0.0.76 HEXA4XMZ
```

If we want to run the Skill on the HEXA named HEXA4XMZ, we can either execute `mind run HEXA4XMZ` or set this particular HEXA as the default robot.

Here's how we do that:

```
$ mind set-default-robot HEXA4XMZ
$ mind get-default-robot # Just to be sure
HEXA4XMZ
$ mind run
```

If you're just testing or on a friend's HEXA, you probably don't need to set the default robot. But if you're going to be developing a lot on the same robot, it can save a lot of time if you set the default.

Once you execute `mind run`, your Skill \(which currently does nothing\) should be running on your HEXA and displaying its status in your terminal.

Ready to get HEXA walking? Check out our [SensorWalkSkill tutorial](/Development/sensorwalkskill.md) next.

