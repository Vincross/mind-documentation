# Manifest

```
myskill
├── manifest.json <-- YOU ARE HERE
├── remote 
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

The manifest section of a HEXA Skill consists of a `manifest.json` file at the top level of your Skill's directory. Within this file, you define metadata and configuration options for your Skill. 

* `name` -- Enter the name of your Skill.
* `skillID` -- this is a unique ID generated when creating a Skill in the [Developer Bridge](https://developer.vincross.com/developer/bridge).
* `version` -- Specify the version of your Skill. We use `<major>.<minor>.<build>` syntax.
* `remote.orientation` -- Specify the orientation of the remote application running on your mobile device. You can choose `"portrait"` or `"landscape"`, but it defaults to `"portrait"`.

Here's a `manifest.json` you can look at as an example:

```
{
 "name": "myskill",
 "skillID": "9fdb98fd9feef97bd8c4e14r425ac196",
 "author": "example@vincross.com",
 "version": "1.0.2",
 "remote": {
     "orientation": "portrait"
 }
}
```



