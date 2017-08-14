# HEXA Skills

You can create new functionality for the HEXA robot by creating Skills. A skill is simply a HEXA application packaged as an `.mpk` file containing a directory structure as specified below.

```
myskill
├── manifest.json
├── remote
│   ├── assets
│   │   ├── myskill.js
│   │   └── style.css
│   └── index.html
└── robot
      ├── deps 
      ├── assets
      └── src
          └── myskill.go
```

There are two main folders that you need: [`remote`](/Introduction/remote.md) and [`robot`](/Introduction/robot.md), which refer to the two parts of the [MIND SDK](/Introduction/mindsdk.md). 

In addition, you'll also need a [`manifest.json`](/Introduction/manifest.md) file to contain metadata about your application.







