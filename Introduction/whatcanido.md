# What can I do with HEXA?

What can HEXA do?

A lot of things, actually. Here are just a few examples us and our Human Mentors put together:

* [HEXA navigates an obstacle course](https://www.youtube.com/watch?v=5OQrAyfnBBo)
* [HEXA the bull \(follows the color red\)](https://www.youtube.com/watch?v=N1Ybisn04so)
* [HEXA dances to a beat](https://www.youtube.com/watch?v=PBaB7I-Baa8)

We have a library of [Example Skills](/Development/exampleskills.md) for you to get started with.

All you need is an idea, a [HEXA](http://www.vincross.com/hexa), and the [MIND SDK](/Introduction/mindsdk.md).

You can find applications from other developers on the [Skill Store](/Introduction/skillstore.md), and even [publish your own](/Introduction/publishingskills.md) once you're ready.

## Features

### Hardware Control

The [Robot part](/Introduction/robot.md) of our SDK allows you to control the hardware on HEXA. The [MIND SDK](/Introduction/mindsdk.md) provides APIs to abstract common tasks \(such as moving the limbs\), but allows you as a developer complete control of the robot. We have functions at varying levels of granularity for this purpose. Robot code for the HEXA is written in the [Go programming language](https://golang.org/).

### Remote Control

The [Remote part](/Introduction/remote.md) of the [MIND SDK](/Introduction/mindsdk.md) is used for transmitting data between mobile devices and robots. It works over a local network as well as over the internet. The SDK will find the fastest path between your device and robot \(local or WiFi\) and establish a communication channel with a unified programming interface.

Remote applications are stored on your mobile device and are written in JavaScript.

### Multitasking

You can run multiple applications on the HEXA simultaneously without affecting other applications or hardware resources.

# MIND OS

Vincross Inc. developed the MIND operating system to run on the HEXA robot. Based on Linux, it supports basic functionality for robots such as controlling peripherals and scheduling tasks. Your applications created with the [MIND SDK](/Introduction/mindsdk.md) sit on top of MIND OS.

# MIND Server

The MIND Server contains services provided by Vincross. It helps enable communication between your mobile device and robot.

# MIND SDK

The MIND SDK is what you, the developer, will be working with most often. It contains the necessary libraries and packages to develop applications for HEXA.

You can find [installation instructions](/Development/installmind.md) for the MIND SDK in our development section.

There are two parts of the MIND SDK:

* [**Robot**](/Introduction/robot.md) -- The robot part of the SDK allows your application to control the robot. 
* [**Remote**](/Introduction/remote.md) -- The remote part of the SDK allows you to transmit data between your mobile device and the HEXA robot. In this way, you can use your phone as a "remote control" for HEXA. 



