# i2c

---

```go
import "mind/core/framework/drivers/i2c"
```

The i2c driver provides an API for interfacing with an i2c device. [https://en.wikipedia.org/wiki/I%C2%B2C](https://en.wikipedia.org/wiki/I%C2%B2C)

Example: Write 0xff to i2c device address 0x41 register address 0x01 and then read from it:

```go
i2c.Start()
err := s.Set(0x41, 0x01, 0xff)
data, err := s.Value(0x41, 0x01, 1)
i2c.Close()
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

Close makes sure the i2c Driver is closed.

#### func Set

```go
func Set(addr byte, reg byte, data ...byte) (err error)
```

Set writes data to a register on a i2c device address.

#### func Start

```go
func Start() (err error)
```

Start makes sure the i2c Driver is ready.

#### func Value

```go
func Value(addr byte, reg byte, length int) (data []byte, err error)
```

Value reads and returns data of length from a register on a i2c device address.

