# Setting Up Jekyll on Windows

2022-09-02

I've recently been playing around with using Windows 10 as my daily operating system. So far, it has been going fairly well. Nothing will probably ever feel as "optimized" as running a Linux-based system but it works well for my current needs. Getting a Jekyll development environment setup was a different story though...

One of the first issues with using Windows 10 is the need to run a few of my open source projects that are built off Jekyll locally. This process initially seemed a like complex process to get things running smoothly but in the end was very straightforward. The main issue came from needing to bounce around through a handful of separate tutorials to get everything running smoothly.

So, I thought I would make this quick write-up to help those in the same situation (or even for my future self the need arises). Let's get into it.

## WSL

The first step involves installing [WSL](https://docs.microsoft.com/en-us/windows/wsl/install) in order to run Linux alongside the main Windows OS. The documentation is well written and will get you up-and-running in no time. For quick reference, it essentially comes down to:

1. Opening PowerShell or Command Prompt as an administrator
2. Installing via the command: `wsl --install`
3. Restarting your machine after the install completes
4. Creating your UNIX username and password

## Installing Ruby & Dependencies

Once logged into your UNIX terminal session (with your created user) you can begin installing everything we need for Jekyll to work properly. The first step is to installing `rvm` and the [official project documentation](https://github.com/rvm/ubuntu_rvm) does a very good job of walking you through this.

- Be sure dependencies as installed: `sudo apt-get install software-properties-common`
- Add the PPA and install the package:


    sudo apt-add-repository -y ppa:rael-gc/rvm
    sudo apt-get update
    sudo apt-get install rvm


- Add your existing user to the `rvm` group: `sudo usermod -a -G rvm $USER`

You will need to close and restart your session to your Ubuntu system for these changes to take. After that, we can use `rvm` to install the latest version (at this time of writing) of ruby:


    rvm install 3.1.2


That's it!

## Jekyll - Finally!

The final step is to update our gems and install Jekyll:


    gem update
    gem install jekyll bundler


Once complete you can now run your Jekyll projects locally through WSL! Nothing ground-breaking but still pretty helpful for first-time users. And best of all, at least I have a good reference point in the future if I ever run into this issue again!