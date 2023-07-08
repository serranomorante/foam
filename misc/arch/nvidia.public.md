# NVIDIA

All related with setting up Nvidia on my arch system.

## Tech specs

- sddm
- optimus-manager
- optimus-manager-qt
- mons
- xrandr
- nvidia
- nvidia-prime
- autorandr
- internal monitor from the laptop
- external ultra wide LG monitor

## Daily driver commands

My commands of daily use that are nvidia realted, are these:

```sh
# With `autorandr` this is no longer necessary but is good having it documented in here.
# This command let's me to extend my current monitor to the monitor on the left.
mons -e left

# This command lets me switch between my previously saved nvidia profiles: default, nvidia, hybrid.
# default is the same as hybrid but I need to have it as a fallback
# hybrid means my primary monitor will be extended to the left (both monitor will be running on nvidia graphics)
autorandr --cycle
```

## Optimus manager

My use of the optimus/prime functionality of nvidia is like this:

- My laptop starts in hybrid mode from the BIOS (the other option was it starts only on discrete graphics but I don't want that)
- Then I let optimus manager to decide whether to start nvidia-only mode or integrated-mode (if the laptop is plugged or not). I don't like how hybrid mode is handled by arch right now so that's why I'm not doing anything with that right now.
- If started in nvidia-only mode, there's a script that will be executed before the login window. The thing that script does is to activate only the external monitor.


This is the script

> /etc/optimus-manager/xsetup-nvidia.sh

```sh
#!/bin/sh

# Everything you write here will be executed by the display manager when setting up the login screen in "nvidia" mode.
# (but before optimus-manager sets up PRIME with xrandr commands).

xrandr --output $(xrandr | grep "DP.* connected" | cut -d " " -f 1) --off
xrandr --output $(xrandr | grep "HDMI.* connected" | cut -d " " -f 1) --primary --mode 3440x1440 --dpi 96 --pos 0x0 --rotate normal
```

The `cut` command on the previous script is making sure not to return the whole line:

```sh
HDMI-0 connected primary 3440x1440+0+0 (normal left inverted right x axis y axis) 800mm x 335mm
```

but only the name of the connected monitor:

```sh
HDMI-0
```

## FAQ

### Why not hybrid mode?

- Because whenever I try to use excalidraw in hybrid more and present my screen, it freezes now and then...

### Why not using the `Xsetup` script from your ssdm display manager?

- Because optimus-manager ask you not to. You should only use the optimus-manager scripts.

### Why optimus-manager stopped working after python update

This problem was specifically difficult for me because I'm using `pyenv` to manager python versions on my machine. I didn't knew until now that doing that has the side effect of compatibility issues between AUR packages that depend on python and the systemd process.

It seemed like the systemd process was using a different python binary for it's execution that the one that was used by AUR on build and installation.

My solution for this was to stop using `pyenv global 3.11.3` and just use `pyenv global system`. That help me to solve the issue and now whenever I do `pyenv which python` this is the result:

```sh
pyenv which python
/usr/bin/python
```

Of course after confirming that my global python version is `/usr/bin/python` I had to rebuild optimus-manager again and now it worked.