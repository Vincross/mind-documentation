# log

---

```go
import "mind/core/framework/log"
```

The log package provides a logging API to send log messages from the robot to the developer's console.

Logging will only work after `OnConnect()` has been invoked by a connected remote.

Example:

```go
log.Debug.Println("This is a debug message")
log.Info.Println("This is an info message")
log.Warn.Println("This is a warning message")
log.Error.Println("This is a error message")
log.Fatal.Println("This is a fatal message")
```

## Usage

```go
var (
    Fatal *log.Logger
    Error *log.Logger
    Warn  *log.Logger
    Info  *log.Logger
    Debug *log.Logger
)
```



