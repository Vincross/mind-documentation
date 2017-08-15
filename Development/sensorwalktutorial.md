# SensorWalkSkill

Ready to get your HEXA moving? We're going to build a simple walking skill that moves forward and changes direction when it senses that something is obstructing its path.

Let’s start out by configuring which HEXA we want to use for this tutorial. Use `mind scan` to list the available HEXAs.

```
$ mind scan
10.0.0.76 Susan 
10.0.0.21 Catherine 
10.0.0.51 Andy 
```

Let's use Catherine. To tell MIND which robot to use, we can execute the `mind set-default-robot` command.

```
$ mind set-default-robot Catherine
```

Now we are ready to start developing a Skill for Catherine. Let’s call it `SensorWalkSkill`.

`mind init` builds us a sample project with the necessary folders and structure. It also contains some example code. All we need to do now is go and fill it in.

```
$ mind init SensorWalkSkill
$ cd SensorWalkSkill
```

Let’s build, pack and execute it, just to make sure everything is ready to go:

```
$ mind run
Installation started
Uploading 0%
Uploading 21%
Uploading 42%
Uploading 65%
Installing 80%
Installation successful !
Point your browser to: http://localhost:7597
Connecting
Connected !
Battery: 100% [Charging]
```

Now let's start building our Skill! Use your favorite editor to open`robot/src/sensorwalkskill.go`

```
$ atom robot/src/sensorwalkskill.go

```

Add `hexabody` to your imports. This is the driver that lets us manipulate the body.

```go
import (
  "mind/core/framework/drivers/hexabody"
  "mind/core/framework/skill"
)
```

Modify the `OnStart` and `OnClose` functions to look like this.

```go
func (d *SensorWalkSkill) OnStart() {
  hexabody.Start()
  hexabody.Stand()
}

func (d *SensorWalkSkill) OnClose() {
  hexabody.Close()
}
```

`OnStart` is called when the Skill launches and `OnClose` is triggered when Skill shuts down. Apart from starting and stopping the hexabody driver, we will also tell Catherine to stand up.

Build, pack and run the skill again.

```
$ mind build && mind pack && mind run
```

Catherine should now stand up as soon as the Skill starts.

So far so good, but not very interesting. Let’s make her walk forward.

The`OnConnect`function is called whenever a remote \(browser, mobile app or terminal\) connects to and disconnects from the Skill.

Add`WalkContinuously`to the `OnConnect` function and give her the walking speed of 0.5 centimeters per second.

Note: The fastest speed possible is somewhere between 1.30-1.50.

```go
func (d *SensorWalkSkill) OnConnect() {
  hexabody.WalkContinuously(0, 0.5)
}
```

We send`0`as direction argument so that Catherine will walk in the direction she is facing.

We also need to tell her to stop walking and relax when we disconnect the remote. Otherwise, Catherine will just keep walking until she dies of old age.

```go
func (d *SensorWalkSkill) OnDisconnect() {
  hexabody.StopWalkingContinuously()
  hexabody.Relax()
}
```

When you run this, you might notice that Catherine is not walking in the direction she is facing. This is because Catherine cannot remember the position of her head. To figure out the direction of her head, all she needs do is keep turning her head until a sensor tells her that her head is now in position 0. Saving the head position after each run will not help because the head can be manually moved with ones hands.

Let’s put her head in position 0 right before she starts walking.

```go
func (d *SensorWalkSkill) OnConnect() {
  hexabody.MoveHead(0, 0)
  hexabody.WalkContinuously(0, 0.5)
}            
```

The second argument to `MoveHead` is the duration of the animation, but since Catherine currently does not know how far away position 0 is, she wont be able to move there in a given time. However, for all future head movements she will.

Execute the Skill and Catherine should now be walking in the same direction as her face, until she either hits a wall or falls off a cliff.

Luckily there are no cliffs in our office, but we have a lot of walls that can be avoided by using the infrared distance sensor.

Add the distance sensor driver to your imports.

```go
import (
  "mind/core/framework/drivers/distance"
  "mind/core/framework/drivers/hexabody"
  "mind/core/framework/skill"
)
```

Add the starting and closing of the distance sensor driver to the`OnStart`and`OnClose`functions.

```go
func (d *SensorWalkSkill) OnStart() {
  hexabody.Start()
  distance.Start()
  hexabody.Stand()
}

func (d *SensorWalkSkill) OnClose() {
  hexabody.Close()
  distance.Close()
}
```

Now, in the`OnConnect`function we will add an infinite loop that measures the distance twice per second.

_This should be done with Goroutines and channels but for simplicity, a`for`loop is fine for now. We also won’t be writing any error handling code._

```go
import (
  "mind/core/framework/drivers/distance"
  "mind/core/framework/drivers/hexabody"
  "mind/core/framework/log"
  "mind/core/framework/skill"
  "time"
)
...

func (d *SensorWalkSkill) OnConnect() {
  hexabody.MoveHead(0, 0)
  hexabody.WalkContinuously(0, WALK_SPEED)
  for {
    dist, _ := distance.Value()
    log.Info.Println("Distance in millimeters: ", dist)
    time.Sleep(500 * time.Millisecond)
  }
}
```

When you build and run this, you should see some output that looks like this.

```
[Info] 2017/03/16 07:00:59 sensorwalkskill.go:40: Distance:  1500
[Info] 2017/03/16 07:01:00 sensorwalkskill.go:40: Distance:  1500
[Info] 2017/03/16 07:01:00 sensorwalkskill.go:40: Distance:  1500
[Info] 2017/03/16 07:01:01 sensorwalkskill.go:40: Distance:  1500
```

Try moving your hand in front of Catherines face and you should see the number shrink.

Now all we need to do is to take some action when distance gets below, let’s say, half a meter.

We will add a function that will give us a new direction based on an old direction, multiplied by -1, so that we can switch between clockwise and anti-clockwise at each call. How much of a direction change we want is controlled by the`degrees`argument.

```go
import (
  "math"
  "mind/core/framework/drivers/distance"
  "mind/core/framework/drivers/hexabody"
  "mind/core/framework/log"
  "mind/core/framework/skill"
  "time"
)

...

func newDirection(direction float64, degrees float64) float64 {
  return math.Mod(direction+degrees, 360) * -1
}
```

And now to the fun part. When we have measured a distance that is below half a meter, we will instruct Catherine to do the following:

* Stop walking
* Sit down and relax for 2 seconds.
* Calculate a new direction \(180 degrees\)
* Move her head to that direction and wait 1 second.
* Start walking towards that direction.

```go
func (d *SensorWalkSkill) OnConnect() {
  direction := 0.0
  hexabody.MoveHead(0, 0)
  hexabody.WalkContinuously(0, 0.5)
  for {
    dist, _ := distance.Value()
    log.Info.Println("Distance: ", dist)
    if dist < 500 {
      hexabody.StopWalkingContinuously()
      hexabody.Relax()
      time.Sleep(2 * time.Second)
      direction = newDirection(direction, 180)
      hexabody.MoveHead(direction, 0)
      time.Sleep(time.Second)
      hexabody.WalkContinuously(0, 0.5)
      time.Sleep(time.Second)
    }
    time.Sleep(500 * time.Millisecond)
  }
}
```

And there you have it. Catherine is off to see the world! Or at least your living room...

Catherine should now be able to walk around without bumping in to things too often. Note that the sensor reacts differently to different light and can sometimes give false positives.

To make Catherine never hit a wall, the code above would have to be improved with some more logic to avoid false positives.

A slightly better version of this Skill using Goroutines and channels can be found in [our examples on GitHub](https://github.com/vincross/mindsdk/tree/master/examples).

If you want you could try to combine this Skill with the [OpenCV Skill](https://github.com/vincross/mindsdk/tree/master/examples/OpenCVSkill) and make your HEXA turn around when it detects faces.

