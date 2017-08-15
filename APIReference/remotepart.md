# Remote Part

Welcome to the Remote SDK Reference. Here you will find the various JavaScript methods you can use to send data between HEXA and your device.

### Usage

Include MIND Remote SDK in`index.html`

```html
<script src="mind-framework.js">
</script>
```

Invoke`mind.init`to initialize MIND.

```js
mind.init({
  callback: function(robot) { } 
  error: function(err) { } 
})
```

### API Methods

In the callback of`mind.init`you can invoke the following API methods:

`getInfo`- Get basic information from the robot.

```js
robot.getInfo({
  callback: function(info) { },
  error: function(err) { }
})
```

`connectSkill`- Has to be invoked before using your Skill.

```js
robot.connectSkill({
  skillID: skillID,
  callback: function() { },
  error: function(err) { }
})
```

`sendData`- Sends a JSON or string message to the robot.

```js
robot.sendData({
  skillID: skillID,
  data: {}, 
  callback: function() { },
  error: function(err) { }
})
```

`disconnectSkill`- Disconnects one skill, but it will still be running on the robot in the background.

```js
robot.disconnectSkill({
  skillID: skillID,
  callback: function() { },
  error: function(err) { }
})
```

`stopSkill`- Stops one skill.

```js
robot.stopSkill({
  skillID: skillID,
  callback: function() { },
  error: function(err) { }
})
```

`onRecvSkillData`- Callback function for receiving JSON data from the robot.

```js
robot.onRecvSkillData(function(skillID, data) { 
})
```

`onDisconnected`- Callback function triggers when connection to robot is lost.

```js
robot.onDisconnect(function(reason) {  
})
```

### Storage

You can use [LocalStorage](https://developer.mozilla.org/en/docs/Web/API/Window/localStorage) to store your data.

