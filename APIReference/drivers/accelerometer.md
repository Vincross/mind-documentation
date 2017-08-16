# accelerometer
----
    import "mind/core/framework/drivers/accelerometer"

Package accelerometer provides an API for interfacing with the HEXA's
accelerometer.

Example: Get current acceleration and degree of inclination.

    accelerometer.Start()
    fx, fy, fz, ax, ay, az, err := accelerometer.Value()
    accelerometer.Close()

## Usage

#### func  Available

```go
func Available() bool
```
Available returns whether driver is available or not.

#### func  Close

```go
func Close() (err error)
```
Close shuts down the accelerometer driver.

#### func  Start

```go
func Start() (err error)
```
Start starts the accelerometer driver.

#### func  Value

```go
func Value() (fx, fy, fz, ax, ay, az float64, err error)
```
Value returns the current acceleration exhibited on the HEXA as well as its
inclination (a).

When HEXA is standing still fz will be equal to ~9.8.

Any movement on the HEXA will affect the values returned meaning accurate angles
can only be mesaured when the HEXA is standing still.

fx, fy, fz are current acceleration and ax, ay, az are angles in degrees.
