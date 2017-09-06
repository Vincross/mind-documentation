# framework
----
    import "mind/core/framework"

Package framework provides an API the enables robot to send messages to remote

## Usage

#### func  SendJSON

```go
func SendJSON(data json.RawMessage)
```
SendJSON sends message with type json.RawMessage to remote.

#### func  SendString

```go
func SendString(str string)
```
SendString sends message with type string to remote.
