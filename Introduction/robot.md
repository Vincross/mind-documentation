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

You can pull in other libraries and packages to extend the functionality of your Skill. For instance, say you wanted to use [OpenCV](http://opencv.org/), a computer vision toolkit, to analyze imagery picked up by HEXA's camera.

Third-party libraries and dependencies are stored in the `deps` folder. The include search path will be set to `deps/include` and `LD_LIBRARY_PATH` will be set to `deps/lib`. The `lib` folder is where your libraries will go, however, you need to compile them for the ARM architecture that sits on the HEXA robot.

You can find more information on how to do this in our [OpenCVSkill tutorial](/Development/opencv.md).

# Building a Skill

To develop a Skill, implement the `skill.Base` interface:

```go
type Interface interface {
    OnStart()             // Called when Skill is started
    OnClose()             // Called when Skill is closed 
    OnConnect()           // Called when Skill is connected
    OnDisconnect()        // Called when Skill is disconnected
    OnRecvJSON([]byte)    // Called when remote sent data
    OnRecvString(string)  // Called when remote sent a string 
}
```

Here's an example of the simplest Skill possible, to give you an idea of what the skeleton looks like:

```go
package example

import "mind/core/framework/skill"

type Example struct {
    skill.Base
}

func NewSkill() skill.Interface {
    return &Example{}
}
```

We can break this down line-by-line:

* Start a new package, we just call it `example` here
* Import the MIND SDK
* We set up an Example struct so we have something to return. In this case, we're just using the built-in `skill.Base`
* We build a function called `NewSkill()` that implements the `skill.Interface` interface
  * This function returns the `Example` struct

While this is a very simple example, you can see the basic functions and skeleton needed to build a Skill on the Robot side. You'll learn more about building a skill in our [Your First Skill](/Development/yourfirstskill.md) tutorial.

You can find more information for the Robot SDK functions in our [Developer Reference](/APIReference/robotpart.md) \(drivers, sending data, storage, and more\).

