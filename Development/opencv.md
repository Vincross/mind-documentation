# OpenCV

Did you know that you can use computer vision in your Skill by including the OpenCV library?

In this tutorial we are going to show how to cross compile and bind a C++ library to be used in your Skills. We will be using [OpenCV](http://opencv.org/) since it is a very useful library for robots who want to visually understand the world.

## Cross compiling OpenCV

Let’s start by downloading and extracting OpenCV:

```
$ wget https://github.com/opencv/opencv/archive/2.4.13.2.tar.gz
$ tar -xzvf 2.4.13.2.tar.gz
$ cd opencv-2.4.13.2
```

To make OpenCV work in a Skill on the HEXA we need to compile OpenCV for HEXA’s processor architecture \([arm7](http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.set.arm7/index.html)\).

Compiling for another architecture than what your development machine is using is called cross-compilation and MIND SDK ships with this functionality built in.

We will be using `mind x [COMMAND]`to launch a container in the current folder which in turn will invoke `[COMMAND]`. In our case, we are going to write a small shell script`build.sh`which we will execute inside the cross-compiling container with`mind x ./build.sh`

Inside the `opencv-2.4.13.2` folder that we just extracted, use your favorite editor and add the following content to `build.sh`.

_This shell script contains all the commands that are required to build OpenCV directly grabbed from their _[_official documentation_](http://docs.opencv.org/2.4/doc/tutorials/introduction/crosscompilation/arm_crosscompile_with_cmake.html)_._

```bash
#!/usr/bin/env bash
apt-get update 
apt-get install -y \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libtbb2 libtbb-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libjasper-dev \
    libdc1394-22-dev
cd platforms/linux/build_hardfp && \
    cmake -DCMAKE_TOOLCHAIN_FILE=../arm-gnueabi.toolchain.cmake ../../.. && \
    make && make install
```

Once the build is finished, you should be able to find all of the built dynamic libraries inside of the`install`folder.

## Binding OpenCV in a Skill

Let’s start by creating a new Skill project.

```
$ cd .. 
$ mind init OpenCVSkill
$ cd OpenCVSkill
$ tree .
.
├── manifest.json
├── remote
│   └── index.html
└── robot
    ├── deps
    └── src
        └── opencvskill.go

```

Note the`deps`folder. This is where you put all of the dynamic libraries that your Skill depends on. That means we need to copy the built OpenCV libraries and header files into this folder.

```
$ cp -r ../opencv-2.4.13.2/install/* robot/deps/

```

To generate Golang bindings for C libraries, one would typically use CGO, and when binding for C++ libraries, one would use SWIG. Writing the Golang bindings can be a pretty mundane process, and in our case we are lucky. Some cool people have already gone through the effort of writing [Golang bindings for OpenCV using SWIG.](https://github.com/lazywei/go-opencv)

Clone the go-opencv repository into the`vendor`folder as such:

```
$ git clone https://github.com/lazywei/go-opencv.git robot/src/vendor/github.com/lazywei/go-opencv

```

Edit`robot/src/opencvskill.go`and add the following import:

```go
import (
  ...
  "github.com/lazywei/go-opencv/opencv"
  ...
)

```

And now you are ready to start using OpenCV inside of your Skill.

Please have a look at our [OpenCV Example Skill](https://github.com/vincross/mindsdk/tree/master/examples/OpenCVSkill) for some useful getting started code. The project also contains a Makefile that automates the downloading and building of OpenCV.

If you want to know more in depth how the SDK and cross-compilation container works, you can have a look at this [blog post](https://t3d.one/development/2017/04/06/building-an-sdk-for-robots/) which explains it in detail.

