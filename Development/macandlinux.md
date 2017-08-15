# macOS and Linux

First things first: you'll need a [HEXA](https://www.vincross.com/hexa).

Got one? Good. Read on.

# Install Docker

Vincross uses [Docker](https://www.docker.com/) in order to manage the SDK libraries and dependencies. Doing it this way means you don't have to install a bunch of things on your system, and you can update your environment with one command. If you don't have Docker installed, do so now. Follow these[ installation instructions](https://docs.docker.com/engine/installation/) if you need help.

# MIND Command-line Interface

The MIND command-line interface is where you can update your environment, initialize skills, build your packages, connect to your HEXA, and more. To install `mind`, you'll first need to download it from our CDN and make it executable.

```bash
$ sudo curl -o /usr/local/bin/mind https://cdn-static.vincross.com/downloads/mind/latest/mind-`uname -s`-`uname -m`
$ sudo chmod +x /usr/local/bin/mind
```

Now that it's installed, you should be able to run `mind` at your Terminal. Try that now.

```bash
$ mind
MIND Command-line Interface v0.5.2

Usage:
  mind [command]

Available Commands:
  build                Build a Skill
  flight-test          Flight test a Skill on mobile device
  get-default-robot    Returns the name of the default robot
  get-default-robot-ip Returns the IP of the default robot
  init                 Initialize and scaffold a new Skill
  login                Authenticate yourself
  pack                 Pack a Skill
  run                  Run Skill on robot
  scan                 Scan your network or specific IP for robots
  set-default-robot    Set the default robot name
  upgrade              Upgrades mindcli container to latest version
  x                    Run a command inside of a cross-compiling capable docker container

Use "mind [command] --help" for more information about a command.
```

When you run `mind` without arguments, you can see each of the options for the MIND CLI. For more help on any of the commands, type `mind [command] --help`. For example:

```bash
$ mind upgrade --help
Upgrades mindcli container to latest version

Usage:
  mind upgrade [flags]
```

## Install and initialize MIND CLI Docker image

To install the latest Docker container with all the dependencies and libraries you'll need, simply run `mind upgrade` at the Terminal. This may take a while the first time you run it.

```bash
$ mind upgrade
```

When it's finished, you'll need to configure `mind` to use your [Developer Bridge](https://developer.vincross.com/bridge) account.

```bash
$ mind login <youremail> <yourpassword>
```

## Your First Skill

After you've initialized the `mind` CLI, you can start creating [your first Skill](/Development/yourfirstskill.md).



