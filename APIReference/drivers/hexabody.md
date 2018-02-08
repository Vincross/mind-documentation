# hexabody
----
    import "mind/core/framework/drivers/hexabody"

Package hexabody provides an API to interface with the HEXAS's body.

HEXA has six legs and each leg has three joints, including the head joint the
DOF(degree of freedom) is 19.

When animating a movement, duration (ms) will be passed as an argument when the
distance to the new location is known, otherwise speed (cm/s for movements and
degree/s for rotations) will passed. The range of duration is 0 ~ 9999ms. The
duration longer than 9999ms will be set as 9999ms.

All joint and leg positions are points in a Cartesian coordinate system.

https://documentation.vincross.com/Introduction/hardware.html

## Usage

```go
var (
	// OverflowSoftLimit error is deprecated.
	OverflowSoftLimit error = errors.New("Calculate overflow soft limit")
	// OverflowHardLimit error happens when 'CalculateJointDegrees' was called to calculate the joints' degrees with coodinates which represent an unreachable position.
	OverflowHardLimit error = errors.New("Calculate overflow hard limit")
	// YIsZeroOrNegative error is deprecated.
	YIsZeroOrNegative error = errors.New("Y is zero or negative")
	// JointNumberNotSupport error happens when 'CalculateJointDegrees' or 'Fit' are called with the count of joints of the legposion is not 3.
	JointNumberNotSupport error = errors.New("The joint number is not support")
	// WrongGaitType error happens when a wrong gait type was selected with 'SelectGait' function. You can make a reference with the GaitType consts.
	WrongGaitType error = errors.New("Wrong gait type.")
	// OverflowStepLengthRatio error happens when 'SetStepLength' was called to set the step length when walking. It should be 0-1.
	OverflowStepLengthRatio error = errors.New("The step length ratio should be (0, 1].")
	// LegPositionInvalid error happens when 'Coordinates' was called to return an invalid coordinate.
	LegPositionInvalid error = errors.New("The leg postion is invalid.")
	// SelectGaitWhileWalking error happens when changing gait type with walking at the same time.
	SelectGaitWhileWalking error = errors.New("Cound not select gait while the hexa is walking.")
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

```go
var LegLength = []float64{59, 47, 88}
```
LegLength is the length of each leg.

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
Direction returns the current direction of HEXA's head in degrees (0-359).

0 degrees is in the direction of the power button. The result is the degree
between the head and the power button in an anti-clockwise rotation.

#### func  Lift

```go
func Lift(lift float64) (err error)
```
Lift raises or reduces the height of HEXA's body in given height (-20 mm - 50
mm).

#### func  MoveHead

```go
func MoveHead(degree float64, duration int) (err error)
```
MoveHead moves the head to specified degree(0-359) in given duration.

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
The range of degree is different. The range of NO.0 joint's degree is (35 -
145). The range of NO.1 joint's degree is (10 - 170). The range of NO.2 joint's
degree is (10 - 160).

'ErrLegNumberOverstep' error will be returned if jointNumber is not 0-2.

#### func  MoveLeg

```go
func MoveLeg(legNumber int, legPosition *LegPosition, duration int) error
```
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
Pitch makes the body pitch at specified degree of angle in given duration. The
HEXA will pitch along the X axis of body coordinate.

#### func  Relax

```go
func Relax() (err error)
```
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

#### func  SelectGait

```go
func SelectGait(gaitType GaitType) error
```
SelectGait chooses the walking gait of HEXA.

'SelectGaitWhileWalking' error will be returned if the HEXA is walking.
'WrongGaitType' error will be returned if a wrong gait type is input.

#### func  SetStepLength

```go
func SetStepLength(stepLengthRatio float64) error
```
SetStepLength set the walking step length of HEXA. The range of stepLengthRatio
is (0, 1].

'OverflowStepLengthRatio' error will be returned if stepLengthRatio is out of
its range.

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
Marching is a kind of state of the walk. The leg of HEXA will be raised higher
when it's walking. It's different from the gait of the walk. StartMarching makes
the HEXA enter the state of marching.

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
StopMarching makes the HEXA quit the state of marching.

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
Walk makes the HEXA walk one frame in given direction in degrees (0-359) with
given duration. Calling this function in a loop would give the same effect as
calling WalkContinuously.

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

#### type GaitType

```go
type GaitType int
```


```go
const (
	GaitOriginal GaitType = iota // default gait
	GaitWave                     // 5+1 gait, 5 legs stay on the ground and 1 leg raise at the same time
	GaitRipple                   // 4+2 gait, 4 legs stay on the ground and 2 legs raise at the same time
	GaitTripod                   // 3+3 gait, 3 legs stay on the ground and 3 legs raise at the same time
	GaitAmble                    // 4+2 gait, 4 legs stay on the ground and 2 legs raise at the same time, different from GaitRipple.
)
```

#### type JointDegree

```go
type JointDegree struct {
	Degree float64
	Range  *JointDegreeRange
}
```

JointDegree defines the degree and range of rotation of a joint.

#### func (*JointDegree) Fit

```go
func (j *JointDegree) Fit() *JointDegree
```
Fit ensures the joint in range, if it is out of range, it will be modified to
the adjacent edge value.

#### func (*JointDegree) IsValid

```go
func (j *JointDegree) IsValid() bool
```
IsValid returns whether joint degree is in range.

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

#### func (JointDegrees) Fit

```go
func (j JointDegrees) Fit() JointDegrees
```
Fit ensures the joints in range, if any of them is out of range, it will be
modified to the adjacent edge value.

#### func (JointDegrees) IsValid

```go
func (j JointDegrees) IsValid() bool
```
IsValid returns whether joints degrees are in range.

#### func (JointDegrees) SetDegree

```go
func (j JointDegrees) SetDegree(jointNumber int, degree float64) error
```
SetJointDegree sets the degree of the particular joint.

#### func (JointDegrees) SetDegrees

```go
func (j JointDegrees) SetDegrees(degree0, degree1, degree2 float64)
```
SetJointDegrees sets the degrees of three joints.

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

See https://documentation.vincross.com/Introduction/hardware.html for further
information of coordinate system.

#### func  NewLegPosition

```go
func NewLegPosition() *LegPosition
```
NewLegPosition returns new LegPosition with given (x, y, z). The coordinate is
the Leg-coordinate. The x range is -168mm-168mm, y range is 0mm-194mm, z range
is -135mm-135mm.

#### func (*LegPosition) CalculateJointDegrees

```go
func (legPosition *LegPosition) CalculateJointDegrees() error
```
CalculateJointDegrees calculates joints degree in single leg. It will convert
the coordinate data of the leg to joints' degree.

'JointNumberNotSupport' error will be returned if the count of joint are not 3.
'OverflowHardLimit' error will be returned if the coordinate represent an
unreachable place.

#### func (*LegPosition) Coordinates

```go
func (legPosition *LegPosition) Coordinates() (x, y, z float64, err error)
```
Coordinates returns the legPosition's coordinates.

'LegPositionInvalid' error will be returned if legPosition's coordinate is not
valid.

#### func (*LegPosition) Fit

```go
func (legPosition *LegPosition) Fit() error
```
Fit is used to approximate a reachable leg position for the LegPosition object.

'JointNumberNotSupport' error will be returned if the count of joint are not 3.
'OverflowHardLimit' error will be returned if the coordinate represent an
unreachable place.

#### func (*LegPosition) IsValid

```go
func (legPosition *LegPosition) IsValid() bool
```
IsValid returns if the leg positions can be reached.

#### func (*LegPosition) SetCoordinates

```go
func (a *LegPosition) SetCoordinates(x, y, z float64) *LegPosition
```
SetCoordinates sets the position coordinates of a LegPosition.

#### func (*LegPosition) SetJointDegrees

```go
func (a *LegPosition) SetJointDegrees(jointDegrees JointDegrees) *LegPosition
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

#### func (LegPositions) Fit

```go
func (a LegPositions) Fit() error
```
Fit is used to approximate reachable leg positions for every leg position in the
LegPositions object.

#### func (LegPositions) IsValid

```go
func (a LegPositions) IsValid() bool
```
IsValid returns if all of the leg positions can be reached.

#### func (LegPositions) SetLegPosition

```go
func (a LegPositions) SetLegPosition(legNumber int, legPostion *LegPosition) error
```
SetLegPosition set legPosition with legNumber.

#### type RotationDirection

```go
type RotationDirection int
```

RotationDirection returns the direction of rotation, 1 means clockwise, -1 means
anticlockwise.
