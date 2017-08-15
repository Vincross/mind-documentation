# audio

---

```
import "mind/core/framework/drivers/audio"
```

The audio driver provides an API for interfacing with the audio interface, e.g. playback or capturing sound.

## Usage

```go
var (
    ErrNoDataRead       = errors.New("No data read from sound card")
    ErrNilDevicePointer = errors.New("Nil pointer for sound card device")
)
```

#### func Available

```go
func Available() bool
```

Available returns whether the driver is available or not.

#### func Close

```go
func Close() (err error)
```

#### func Init

```go
func Init(channels int, rate int, format Format) (err error)
```

Init sets up the channels, sample rate and sample format for the audio interface.

#### func Read

```go
func Read() (buffer []byte, err error)
```

Read will read from the audio interface and return raw data in a buffer.

#### func Start

```go
func Start() (err error)
```

#### func Write

```go
func Write(buffer []byte) (bufferLength int, err error)
```

Write writes raw data to the audio interface.

#### type Format

```go
type Format int



const (
    FormatS8 Format = iota
    FormatU8
    FormatS16LE
    FormatS16BE
    FormatU16LE
    FormatU16BE
)
```



