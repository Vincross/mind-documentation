# audio
----
    import "mind/core/framework/drivers/audio"

Package audio provides API for interfacing with audio interface, e.g. playback
or capture sound.

## Usage

```go
var (
	ErrNoDataRead       = errors.New("No data read from sound card")
	ErrNilDevicePointer = errors.New("Nil pointer for sound card device")
)
```

#### func  Available

```go
func Available() bool
```
Available returns whether driver is available or not.

#### func  Close

```go
func Close() (err error)
```

#### func  Init

```go
func Init(channels int, rate int, format Format) (err error)
```
Init setup the channels, sample rate and sample format for audio interface.

#### func  Read

```go
func Read() (buffer []byte, err error)
```
Read will read from the audio interface, and return raw data in buffer.

#### func  Start

```go
func Start() (err error)
```

#### func  Write

```go
func Write(buffer []byte) (bufferLength int, err error)
```
Write writes raw data to audio interface.

#### type Format

```go
type Format int
```


```go
const (
	FormatS8 Format = iota
	FormatU8
	FormatS16LE
	FormatS16BE
	FormatU16LE
	FormatU16BE
)
```
