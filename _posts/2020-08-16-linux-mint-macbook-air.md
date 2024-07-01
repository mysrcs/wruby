---
layout: post
title: "Linux Mint MacBook Air Setup"
date: 2020-08-16
---


I don't like the idea of throwing away old or outdated tech (within reason), so I try to find a new purpose for some of my "retired" devices. This article will cover how to switch over a mid-2011 model MacBook Air to utilize Linux Mint.

**Important**: This setup will completely wipe your existing disk and create a fresh install of Linux Mint on the SSD. You have been warned.

## The Specs

My old MacBook Air has a pretty decent spec sheet:

- Processor: **1.7GHz dual-core Intel Core i5**
- Memory: **4GB of 1333MHz DDR3**
- Graphics: **Advanced Intel HD Graphics 3000**
- SSD: **128 GB**

And let's take a look at the basic system requirements Linux Mint suggests:

- 2GB RAM
- Dual Core Processor
- 20GB free disk space

We are looking pretty good!

## Step 1: Download Linux Mint

For this setup we will be using the latest, stable version (at this time of writing) of Linux Mint 20 "Ulyana" - Xfce which is 20. You can download the necessary files here: 

- [Linux Mint 20 "Ulyana" - Xfce](https://www.linuxmint.com/edition.php?id=283) [1.8GB]

## Step 2: Flash Linux Mint to USB Stick

Next we just need to flash the Linux Mint OS to a USB storage device. If you need to purchase some, you can easily find them on Amazon (affliate link):

- [Kootion 10 Pack 4GB Flash Drive 4gb USB 2.0 Flash Drives Keychain USB Drive Bulk Thumb Drive Swivel Memory Stick Black](https://www.amazon.com/gp/product/B00JB3NXIS/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B00JB3NXIS&linkCode=as2&tag=uglyduck-20&linkId=494f4c1dd4e21782ecb865bcaa5a526b)

- Download [Balena Etcher](https://www.balena.io/etcher/) for your current operating system
- Run the installer

Once installed, open Etcher do the following:

1. Select your downloaded Linux Mint ISO file
2. Select your USB stick/device as the media
3. Flash media
4. ???
5. Profit!!

## Step 3: Boot from USB

- Make sure your Macbook Air is turned off
- Plug your newly flashed USB stick into the MacBook Air
- Turn on the MacBook Air
- Immediately hold down the **alt/option** button (keep holding until the prompt screen is visible)
- You will be shown drive "icons" - you want to select your USB drive (normally the far right icon)
- Press **Enter**
- Select the first item in the list that appears "Start Linux Mint"

After this you will boot into a "live session" of the Linux Mint operating system.

## Step 4: Installing Linux Mint

Linux Mint makes it very easy for you to install it's OS step-by-step (similar to most other Linux distros). Simply **double-click** on the "Install Linux Mint" CD icon on the main desktop.

- Choose your language. then hit **Continue**
- Select your preferred keyboard layout, then hit **Continue**
- *Optional*: You might be asked to connect to a WiFi network, if you are set it up now
- I would suggest downloading the multimedia codecs to make things easier, then hit **Continue**
- For installation type, select "Erase disk and install Linux Mint", then hit **Continue**
  - WARNING: This will wipe your current drive completely - make sure you are okay with this!
- It will issue you with a warning prompt, simply click **Continue**
- Select your timezone, then hit **Continue**
- Enter your name, a username, a name for your computer, and set a password (you will use this to login moving forward)
- Wait for the installation to complete
- Once complete, you will be prompted to **reboot your system**
- After a reboot you will be prompted to remove the USB device and then press **Enter**
- Welcome to Linux Mint!

## Conclusion

Linux Mint is not only a great operating system, but it is also an excellent starting point for newcomers to Linux in general. It's stable enough to be used as a daily driver and popular enough that most minor issues can be solved with a quick internet search.

Hopefully this inspires others to try "recycling" their older Apple products instead of tossing them away or having them collect dust.
