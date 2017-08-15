# gpio

---

```go
import "mind/core/framework/drivers/gpio"
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

Close makes sure the GPIO Driver is closed.

#### func High

```go
func High(pin int) (high bool, err error)
```

High returns whether output voltage is high or low on pin within range 0-3. Only accurate when pin is connected.

#### func Output

```go
func Output(pin int, high bool) (err error)
```

Output high or low voltage to pin within range 0-3.

#### func Start

```go
func Start() (err error)
```

Start makes sure the GPIO Driver is ready.

#### func Watch

```go
func Watch(pin int) (high bool, err error)
```

Watch returns whether output voltage is high\(true\) or low\(false\) on pin within range 0-3. It will be blocked until the voltage of the specified pin changes after being called.

