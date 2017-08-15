# Skill

---

```go
import "mind/core/framework/skill"
```

The skill package provides an interface to be implemented by the robot part of a Skill.

This function must be implemented in your Skill package:

```go
func NewSkill() skill.Interface
```

## Usage

#### type Base

```go
type Base struct{}
```

struct Base implements the base Skill interface

#### func \(\*Base\) OnClose

```go
func (b *Base) OnClose()
```

#### func \(\*Base\) OnConnect

```go
func (b *Base) OnConnect()
```

#### func \(\*Base\) OnDisconnect

```go
func (b *Base) OnDisconnect()
```

#### func \(\*Base\) OnRecvJSON

```go
func (b *Base) OnRecvJSON(data []byte)
```

#### func \(\*Base\) OnRecvString

```go
func (b *Base) OnRecvString(data string)
```

#### func \(\*Base\) OnStart

```go
func (b *Base) OnStart()
```

#### type Interface

```go
type Interface interface {
    OnStart()            // Called when Skill is started.
    OnConnect()          // OnConnect is called when robot has connected to remote.
    OnClose()            // OnClose is called when Skill is closed. You have 1 second to do clean up before Skill is force terminated.
    OnRecvJSON([]byte)   // OnRecvJSON is called when remote send JSON data to robot. Use json.Unmarshal to parse.
    OnRecvString(string) // OnRecvString will be called when remote send string data ro robot.
    OnDisconnect()       // OnDisconnect is called when remote disconnected from robot.
}
```

This interface must be implemented in every skill.

