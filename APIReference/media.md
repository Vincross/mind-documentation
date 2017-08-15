# media

---

```go
import "mind/core/framework/drivers/media"
```

The media driver provides an API for interfacing with media devices such as a camera.

## Usage

```go
const (
    FrameWidth  = 1280
    FrameHeight = 720
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

Close closes the media driver.

#### func SnapshotJPEG

```go
func SnapshotJPEG(location string, quality int) (err error)
```

SnapshotJPEG writes a camera snapshot to location. Compression used is JPEG 4:2:0 baseline format with the given quality. Quality range is 1 to 100 where 100 is highest quality. Location must be an absolute path.

#### func SnapshotRGBA

```go
func SnapshotRGBA() *image.RGBA
```

SnapshotRGBA returns a RGBA image from camera with size FrameWidth x FrameHeight. This function is slower than SnapshotYCbCr since it redraws the whole image after snapshot to convert it from YCbCr to RGBA.

#### func SnapshotYCbCr

```go
func SnapshotYCbCr() *image.YCbCr
```

SnapshotYCbCr returns a 4:2:0 Y’CbCr 8-bit image from camera with size FrameWidth x FrameHeight. See [https://en.wikipedia.org/wiki/YUV](https://en.wikipedia.org/wiki/YUV) for further infomation.

#### func Start

```go
func Start() (err error)
```

Start starts the media driver.

#### func StartVideoRecording

```go
func StartVideoRecording(location string) (err error)
```

StartVideoRecording starts recording an MP4 video to location. Compression format is H264 with a bitrate of 5000 Kbps and frame size of video is 1280x720. Location must be an absolute path. StopVideoRecording must be called after recording is finished, otherwise the video file might get corrupted.

#### func StopVideoRecording

```go
func StopVideoRecording(location string) (err error)
```

StopVideoRecording stops the video recording process. Location must be an absolute path.

