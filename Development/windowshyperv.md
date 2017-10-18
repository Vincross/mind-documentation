# 64bit Windows 10

First things first: you'll need a [HEXA](https://www.vincross.com/hexa).

Got one? Good. Read on.

# Install Docker

Vincross uses [Docker](https://www.docker.com/) in order to manage the SDK libraries and dependencies. Doing it this way means you don't have to install a bunch of things on your system, and you can update your environment with one command. If you don't have Docker installed, do so now. Follow these [docker installation instructions](https://docs.docker.com/engine/installation/) if you need help.

If your Windows is not 64bit Windows 10 Pro, Enterprise or Education (1511 November update, Build 10586 or later), use [Docker toolbox version](/Development/windows.md). See [requirements](https://docs.docker.com/docker-for-windows/install/#what-to-know-before-you-install) for details.

After Docker is installed, open Docker -&gt; Settings from the taskbar and share the drive where you intend to do your Skill development.![](/assets/download %289%29.png)

## MIND Command-line Interface

### Installation and configuration

1. Download the [Windows version of`mind`](https://cdn-static.vincross.com/downloads/mind/latest/windows-x86_64/mind.exe)
2. Run Powershell as _Administrator_
3. Copy mind.exe into your PATH
4. Execute `mind upgrade`. This pulls all the needed dependencies from Docker. The first time you run it, it may take a while.![](/assets/download %2810%29.png)

5. Open Windows Firewall and allow incoming ports TCP/8888 and TCP/7597![](/assets/download %2811%29.png)![](/assets/download %2812%29.png)

Now you will be able to use `mind` from your \_Powershell \_account.

Finally, you'll need to configure `mind` to use your [Developer Bridge](https://developer.vincross.com/bridge) account.

```bash
$ mind login <youremail> <yourpassword>
```

## Your First Skill

After you've initialized the `mind` CLI, you can start creating [your first Skill](/Development/yourfirstskill.md).

