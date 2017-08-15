# Framework

---

```go
import "mind/core/framework"
```

The MIND framework provides an API that enables the robot to send messages to the remote.

## Usage

#### func SendJSON

```go
func SendJSON(data json.RawMessage)
```

SendJSON sends message with type `json.RawMessage` to the remote.

#### func SendString

```go
func SendString(str string)
```

SendString sends message with type `string` to the remote.

