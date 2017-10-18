# Older Windows

First things first: you'll need a [HEXA](https://www.vincross.com/hexa).

Got one? Good. Read on.

# Install Docker Toolbox

Vincross uses [Docker](https://www.docker.com/) in order to manage the SDK libraries and dependencies. Doing it this way means you don't have to install a bunch of things on your system, and you can update your environment with one command. If you don't have Docker installed, do so now. Follow these [installation instructions](https://docs.docker.com/toolbox/toolbox_install_windows/) if you need help.

If your Windows is 64bit Windows 10 Pro, Enterprise or Education (1511 November update, Build 10586 or later), use [64bit Windows 10 version](/Development/windowshyperv.md) is recommended. See [requirements](https://docs.docker.com/docker-for-windows/install/#what-to-know-before-you-install) for details.

# MIND Command-line Interface

The MIND command-line interface is where you can update your environment, initialize skills, build your packages, connect to your HEXA, and more.

1. Download the [Windows Version of MIND](https://cdn-static.vincross.com/downloads/mind/latest/windows-x86_64/mind.exe).

2. Copy `mind.exe` into your PATH.

![](/assets/download %284%29.png)

1. Start _Docker Quickstart_ and execute `mind upgrade`. This will pull the latest dependencies from Docker. The first time you run this, it might take a while.  
   ![](/assets/download %285%29.png)

2. Open VirtualBox Settings and forward port TCP/8888 and TCP/7597. _\(Windows Firewall may pop up asking for permission to open these ports. Be sure you confirm access.\)_![](/assets/download %286%29.png)![](/assets/download %287%29.png)![](/assets/download %288%29.png)

Now you will be able to use `mind` from _Docker Quickstart._

Finally, you'll need to configure `mind` to use your [Developer Bridge](https://developer.vincross.com/bridge) account.

```bash
$ mind login <youremail> <yourpassword>
```

## Your First Skill

After you've initialized the `mind` CLI, you can start creating [your first Skill](/Development/yourfirstskill.md).

