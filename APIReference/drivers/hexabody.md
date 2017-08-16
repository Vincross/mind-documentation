# hexabody
----
    import "mind/core/framework/drivers/hexabody"

Package hexabody provides an API to interface with the HEXAS's body.

HEXA has six legs and each leg has three joints, including the head joint the
DOF(degree of freedom) is 19.

When animating a movement, duration (ms) will be passed as an argument when the
distance to the new location is known, otherwise speed (cm/s for movements and
degree/s for rotations) will passed.

All joint and leg positions are points in a Cartesian coordinate system.
https://www.vincross.com/developer/documentation/the-hexa

## Usage

```go
var (
	OverflowSoftLimit     error = errors.New("Calculate overflow soft limit")
	OverflowHardLimit     error = errors.New("Calculate overflow hard limit")
	YIsZeroOrNegative     error = errors.New("Y is zero or negative")
	JointNumberNotSupport error = errors.New("The joint number is not support")
)
```

```go
var ErrJointNumberOverstep = errors.New("Joint number should be 0~2.")
```

```go
var (
	ErrLegNumberOverstep = errors.New("The legNumber should be in 0~5.")
)
```

```go
var JointDegreeRanges = []JointDegreeRange{
	JointDegreeRange{35, 145},
	JointDegreeRange{10, 170},
	JointDegreeRange{10, 160},
}
```
JointDegreeRanges defines the range of rotation in degrees for each joint in
every leg, starting with the joint closest to the HEXA's body.

#### func  Available

```go
func Available() bool
```
Available returns whether driver is available or not.

#### func  Close

```go
func Close() (err error)
```
Close shuts down the hexabody driver.

#### func  Direction

```go
func Direction() (currDir float64)
```
Direction returns the current direction in degrees (0-359).

#### func  Lift

```go
func Lift(lift float64) (err error)
```
RecoverPitch lets the body pitch to zero degree no matter what degrees pitched
before.

#### func  MoveHead

```go
func MoveHead(degree float64, duration int) (err error)
```
MoveJoints rotates all joints on all legs to given leg positions in given
duration. MoveHead moves the head to specified degree(0-359) in given
duration(0ms-9999ms).

0 degrees is in the direction of the power button. An increase in direction
angle results in an anti-clockwise rotation.

Example: Control the robot's head move around.

       hexabody.Start()
       var direction float64
       for {
         hexabody.MoveHead(direction, 10)
         direction += 1
         if direction == 360 {
    			direction = 0
    		}
       }
       hexabody.Close()

#### func  MoveJoint

```go
func MoveJoint(legNumber, jointNumber int, degree float64, duration int) error
```
MoveJoint rotates specified joint on a leg to a given degree in given duration.

#### func  MoveLeg

```go
func MoveLeg(legNumber int, legPosition *LegPosition, duration int) error
```
StartHeadControl recovers the closed-loop control at the position that it last
recorded. It should be called before move legs after StopHeadControl().

MoveLeg moves a leg to specified position in given duration.

#### func  MoveLegs

```go
func MoveLegs(legPositions LegPositions, duration int) error
```
MoveLegs moves the legs in legPositions to specified positions in given
duration.

#### func  Pitch

```go
func Pitch(degree float64, duration int) error
```
Pitch makes the body pitch at specified degree of angle in given duration.

#### func  Relax

```go
func Relax() (err error)
```
StartLegsControl recovers the closed-loop control at the stand position that it
last recorded. It should be called before move legs after StopLegsControl().

Releax reduces power to all servos on HEXA to save battery.

#### func  RelaxHead

```go
func RelaxHead() (err error)
```
RelaxHead reduces servo energy to head to save battery.

#### func  RelaxLegs

```go
func RelaxLegs() (err error)
```
RelaxLegs reduces servo power in all the legs to save battery.

#### func  RotateHeadContinuously

```go
func RotateHeadContinuously(direction RotationDirection, speed float64) error
```
RotateHeadContinuously makes the head rotate continuously with specified
direction and speed (1 - 360).

#### func  RotatingHeadContinuously

```go
func RotatingHeadContinuously() bool
```
RotatingHeadContinuously returns whether HEXA is rotating it's head continuously
or not.

#### func  SetDegree

```go
func SetDegree(jointNumber int, degree float64) error
```
SetJointDegree sets the degree of the particular joint.

#### func  SetDegrees

```go
func SetDegrees(degree0, degree1, degree2 float64)
```
SetJointDegrees sets the degrees of three joints.

#### func  SetLegPosition

```go
func SetLegPosition(legNumber int, legPostion *LegPosition) error
```
SetLegPosition set legPosition with legNumber.

#### func  Spin

```go
func Spin(degree float64, duration int) (err error)
```
Spin makes the HEXA use its legs to position itself in the given degree of
rotation in given duration.

#### func  Stand

```go
func Stand() error
```
Stand makes the HEXA stand at the default height of 50mm.

#### func  StandWithHeight

```go
func StandWithHeight(z float64) error
```
LegOffset returns an offset depends on the given head direction. The return
offset's range is 0-5, it is useful to find which leg is near the head.

StandWithHeight makes the HEXA stand with it's body at the specified height.

#### func  Start

```go
func Start() error
```
Start starts the hexabody driver.

#### func  StartMarching

```go
func StartMarching() (err error)
```

#### func  StopLeg

```go
func StopLeg(leg int) (err error)
```
StopLeg stops movement of specified leg.

#### func  StopLegs

```go
func StopLegs() (err error)
```
StopLegs stops movement in all legs.

#### func  StopMarching

```go
func StopMarching() (err error)
```

#### func  StopPitch

```go
func StopPitch() (err error)
```
StopPitching stops an ongoing pitch.

#### func  StopRotatingHeadContinuously

```go
func StopRotatingHeadContinuously() (err error)
```
StopRotatingHeadContinuously stops continuous rotation of the head.

#### func  StopWalkingContinuously

```go
func StopWalkingContinuously() error
```
StopWalkingContinuously stops the HEXA from walking continuously.

#### func  Walk

```go
func Walk(direction float64, duration int) error
```
StopCommands stops executing external commands.

ExecCommand runs an outside command and can change legs by direction inputed.
raw is the outside command.

TranslateCommands translates external commands to movements. The format of
outside command should accord with regex expression:
`^\d{0,1}((V\d{1,2}A\d{1,3})+T\d{1,4}\|)*(V\d{1,2}A\d{1,3})+T\d{1,4}$`

Walk makes the HEXA walk one frame in given direction in degrees (0-359) with
given duration(0ms-9999ms). Calling this function in a loop would give the same
effect as calling WalkContinuously.

0 degrees is in the direction of the power button. An increase in direction
angle results in an anti-clockwise rotation.

Example: Move head and walk at the same time with goroutine.

     hexabody.Start()
     go func() {
       var headDirection float64
       for {
         hexabody.MoveHead(headDirection, 10)
         headDirection += 1
         if headDirection == 90 {
           break
         }
       }
    }()
    go func() {
      var bodyDirection float64
      for {
        hexabody.Walk(bodyDirection, 100)
        bodyDirection += 10
        if bodyDirection == 360 {
          bodyDirection = 0
        }
      }
    }()
    select {}
    hexabody.Close()

#### func  WalkContinuously

```go
func WalkContinuously(direction, speed float64) error
```
WalkContinuously makes the HEXA walk continuously in given direction in degrees
(0-359) with given speed (0.1 cm/s - 1.2 cm/s). Call StopWalkingContinuously to
stop.

0 degrees is in the direction of the power button. An increase in direction
angle results in an anti-clockwise rotation.

Example: Control the robot walk continuously.

    hexabody.Start()
    hexabody.WalkContinuously(90, 0.2)
    time.Sleep(10 * time.Second)
    hexabody.Close()

#### func  WalkingContinuously

```go
func WalkingContinuously() bool
```
WalkingContinuously returns whether HEXA is walking continuously or not.

#### type JointDegree

```go
type JointDegree struct {
	Degree float64
	Range  *JointDegreeRange
}
```

JointDegree defines the degree and range of rotation of a joint.

#### type JointDegreeRange

```go
type JointDegreeRange struct {
	Min float64
	Max float64
}
```

JointDegreeRange defines the range of joint rotation.

#### type JointDegrees

```go
type JointDegrees []JointDegree
```

JointDegrees is a slice of JointDegree

#### func  NewJointDegrees

```go
func NewJointDegrees() JointDegrees
```
NewJointDegrees creates a new JointDegrees.

#### type LegPosition

```go
type LegPosition struct {
	X            float64
	Y            float64
	Z            float64
	JointDegrees JointDegrees
}
```

LegPosition holds the points of a leg in the Cartesian coordinate system as well
as the degree of rotation of the joints in the leg.

See https://www.vincross.com/developer/documentation/the-hexa for further
information of coordinate system.

#### func  NewLegPosition

```go
func NewLegPosition() *LegPosition
```
NewLegPosition returns new LegPosition with given (x, y, z). The coordinate is
the Leg-coordinate. The x range is -168mm-168mm, y range is 0mm-194mm, z range
is -135mm-135mm.

#### func  SetCoordinates

```go
func SetCoordinates(x, y, z float64) *LegPosition
```
SetCoordinates sets the position coordinates of a LegPosition.

#### func  SetJointDegrees

```go
func SetJointDegrees(jointDegrees JointDegrees) *LegPosition
```
SetJointDegrees sets the jointdegrees of a LegPosition.

#### type LegPositions

```go
type LegPositions map[int]*LegPosition
```

LegPositions is a slice of LegPosition.

#### func  NewLegPositions

```go
func NewLegPositions() LegPositions
```
NewLegPositions creates a set of legPositions, then use SetLegPosition to put
legPostion into it.

#### func  PitchRoll

```go
func PitchRoll(pitchAngle, rollAngle float64) LegPositions
```
PitchRoll returns LegPositions transformed from given pitchAngle and rollAngle
degrees.

#### type RotationDirection

```go
type RotationDirection int
```

RotationDirection returns the direction of rotation, 1 means clockwise, -1 means
anticlockwise.
