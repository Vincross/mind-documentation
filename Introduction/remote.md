# Remote

```
myskill
├── manifest.json
├── remote <-- YOU ARE HERE
│   ├── assets
│   │   ├── myskill.js
│   │   └── style.css
│   └── index.html
└── robot 
    ├── deps 
    ├── assets
    └── src
        └── myskill.go
```

The Remote part of a HEXA skill contains the application that communicates _with_ the HEXA robot. 

It is written in JavaScript and can be used as a standard web application in both browsers and mobile devices. This remote part is useful if you want the robot to respond to user input or controls. Here are some things you could use the remote part for:

* Cycling through different movements
* Moving the camera around and taking photos
* Triggering an action via a button press on your device

Of course, you can create a totally autonomous HEXA skill. In that case, your application would not need a remote part. MIND will generate a boilerplate remote application containing Start/Stop functionality for you.

