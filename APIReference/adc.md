# adc

---

```go
import "mind/core/framework/drivers/adc"
```

The adc driver provides an API to interface with ADCs.

[https://en.wikipedia.org/wiki/Analog-to-digital\_converter](https://en.wikipedia.org/wiki/Analog-to-digital_converter)

Example: Read current ADC value from pin 0.

```go
adc.Start()
pinVal, _ := adc.Value(0)
adc.Close()
```

## Usage

#### func Available

```go
func Available() bool
```

Available returns whether the driver is available or not.

#### func Close

```go
func Close() (err error)
```

Close makes sure the ADC Driver is closed.

#### func Start

```go
func Start() (err error)
```

Start makes sure ADC Driver is ready.

#### func Value

```go
func Value(pin int) (val float64, err error)
```

Value returns measured voltage value on pin within range 0-3.

