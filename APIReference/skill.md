# skill
----
    import "mind/core/framework/skill"

Package skill provides an interface to be implemented by the robot part of a
Skill.

This function must be implemented in your skill package:

    func NewSkill() skill.Interface

## Usage

#### func  OnClose

```go
func OnClose()
```

#### func  OnConnect

```go
func OnConnect()
```

#### func  OnDisconnect

```go
func OnDisconnect()
```

#### func  OnRecvJSON

```go
func OnRecvJSON(data []byte)
```

#### func  OnRecvString

```go
func OnRecvString(data string)
```

#### func  OnStart

```go
func OnStart()
```

#### type Base

```go
type Base struct{}
```

struct Base implements the base Skill interface

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

Interface must be implemented in every skill.
