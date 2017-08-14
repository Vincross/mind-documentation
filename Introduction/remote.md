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

# Building a Skill

To use the[ MIND SDK](/Introduction/mindsdk.md), you'll need to have it [installed](/Development/installmind.md) on your machine and import the necessary JS library in your `index.html` file.

```html
<script src="mind-framework.js"></script>
```

Invoke `mind.init` to initialize MIND. This code is provided for you when you create a new skill using `mind init`.

```js
<script type="text/javascript">
  mind.init({
    callback: function(robot){
      skillID="testskill";
      robot.connectSkill({
        skillID: skillID
    });
  }});
</script>
```

Within the callback function for `mind.init`, you also need to invoke the `connectSkill` function before you can run the skill. Here we set a sample `skillID` and pass that to the `connectSkill` function. It doesn't do anything else at present, just initializes the necessary information.

For more information on the SDK methods available for developers in the Remote SDK, see our [Developer Documentation](/APIReference/remotepart.md).

