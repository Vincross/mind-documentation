# Robot

```
myskill
├── manifest.json
├── remote
│   ├── assets
│   │   ├── myskill.js
│   │   └── style.css
│   └── index.html
└── robot <-- YOU ARE HERE
    ├── deps 
    ├── assets
    └── src
        └── myskill.go
```

The Robot part of a HEXA skill contains the code that is running _on_ the robot.

We use the Go programming language to write code for HEXA, and we have a detailed [SDK reference](/APIReference/robotpart.md) to describe the different functions we provide.

All your code will go into the `src` folder, and `assets` is where you place your configuration files or data files needed for your application.

You can pull in other libraries and packages to extend the functionality of your skill. For instance, say you wanted to use [OpenCV](http://opencv.org/), a computer vision toolkit, to analyze imagery picked up by HEXA's camera.

Third-party libraries and dependencies are stored in the `deps` folder. The include search path will be set to `deps/include` and `LD_LIBRARY_PATH` will be set to `deps/lib`. The `lib` folder is where your libraries will go, however, you need to compile them for the ARM architecture that sits on the HEXA robot.

You can find more information on how to do this in our [OpenCVSkill tutorial](/Development/opencv.md).

# Building a Skill





