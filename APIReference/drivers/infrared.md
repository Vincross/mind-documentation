# infrared
----
    import "mind/core/framework/drivers/infrared"

Package infrared provides an API to interface with the infrared module.

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
Close makes sure the infrared module driver is shut down.

#### func  LightOff

```go
func LightOff() (err error)
```
LightOff turns off the light.

#### func  LightOn

```go
func LightOn() (err error)
```
LightOn starts the emitting of infrared light without modulated information.

#### func  SendInfraredSequence

```go
func SendInfraredSequence(sequence []int) (err error)
```
SendInfraredSequence takes a slice of pulses and gaps in duration (microseconds)
and sends them to the infrared device. The length of the slice has to be an odd
number and start with, as well as end with a pulse duration.

Example: Send a sequence to the infrared device.

    infrared.Start()
    sequence := []int{2416, 582, 1204, 585, 609, 580, 1752, 33, 608, 577, 1574}
    infrared.SendInfraredSequence(sequence)
    infrared.Close()

#### func  Start

```go
func Start() (err error)
```
Start makes sure the infrared module driver is ready.
