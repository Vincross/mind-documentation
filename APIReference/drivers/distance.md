# distance
----
    import "mind/core/framework/drivers/distance"

Package distance provides API for the distance sensor.

Example: Getting the current distance.

    distance.Start()
    dist := distance.Value()
    distance.Close()

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
Close shuts down the distance sensor driver.

#### func  Start

```go
func Start() (err error)
```
Start starts the distance sensor driver.

#### func  Value

```go
func Value() (dis float64, err error)
```
Value returns the filtered distance value within the range of 100~1500mm
