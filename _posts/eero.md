# Setting Up a Pi-hole Server with Eero

2022-03-14

For the past few years, I've been using a set of Eero routers as my home mesh network. It's worked fairly great in that time and even seamlessly transitioned without any hiccups when my family moved house. During the initial setup, I installed <a href="https://pi-hole.net">Pi-hole</a> on a Raspberry Pi Zero WH because advertisements and tracking scripts suck.

It was an easy process to get everything up and running, but I did notice a lack of detailed steps online for those specifically using Eero systems. So, I thought I would document this process here with the hope that it will help someone else along the way (or at the very least remain a semi-permanent place for my own reference).

---

FYI: You can pay for Eero Secure and allow them to handle ad/tracker blocking for you. Personally, I prefer to have complete control over my blocklists and usage data. YMMV.

---

## Setting Up the Pi-hole Server

Before we get into the step-by-step details, here are the required items you'll need:

1. Raspberry Pi device (I recommend the Pi Zero for simplicity and low cost)
2. microSD card preloaded with [Raspberry Pi OS Lite](https://www.raspberrypi.com/software/operating-systems/) (having a desktop GUI is overkill for our use case)
3. micro USB to ethernet adapter (check your local Amazon)
4. Patience!

Before you place your microSD card into the Pi and boot it up, connect it to your local computer (via USB adapter) - we will need to add some files first. Once loaded into the `boot` folder, add an empty file simply called `ssh` (no extensions). Next open your preferred text editor and enter the following code, editing the content to match your own country code and home network settings:


    country=US
    ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
    update_config=1
    
    network={
        ssid="WIFI_SSID"
        scan_ssid=1
        psk="WIFI_PASSWORD"
        key_mgmt=WPA-PSK
    }


Save this file as `wpa_supplicant.conf` and add it to the `boot` directory as well.

You can now safely eject the microSD card and place it into your Raspberry Pi.

## Plug it in and Boot!

Connect power to your Pi and give it a bit of time to boot up. Once you see a nice solid green LED, go back to your local computer's terminal and enter the following command:


    ssh pi@raspberrypi.local


If everything was set up properly you will be asked to trust this device. Next, you will be prompted to enter the device password. The default password will be: `raspberry`

**Important**: This is assuming you don't currently have any other Pi devices using this hostname parameter!

Once you are connected directly to the Pi, it's best to check for updates:


    sudo apt update


...and if updates are in fact available, install them via:


    sudo apt upgrade


This next step is optional but I highly recommend it for security purposes. You should change both the hostname and password of this soon-to-be Pi-hole server. To do this simply run:


    sudo raspi-config


1. Edit Hostname: navigate to `System Settings` --> `Hostname`
2. Edit Password: navigate to `System Settings` --> `Password`

Once complete, reboot the Pi. Just remember that when you try to reconnect to this device via SSH you'll need to use both of these new parameters instead of the defaults.

## Installing Pi-hole

This is the easy part:


    curl -sSL https://install.pi-hole.net | bash


Pi-hole runs a full install script that walks you through step-by-step on setting things up. It's best to use the suggested defaults during the install - everything is pretty simple.

Near the end of the setup you'll be show the newly created static IP for this Pi-hole server (both IPv4 and IPv6). Write these down for easy reference in a moment.

Once it's finished, shutdown the Pi safely by running:


    sudo shutdown now


## Hardware Setup

With the Pi shutdown you can safely relocate it to where you have your modem and gateway Eero setup. Connect your new Pi-hole device to the secondary ethernet port on your gateway Eero[^1] and power it up. (This is where the microUSB to ethernet adapter for our Pi device is needed)

See the crude diagram below for visual reference:

<figure>
    <img src="/public/images/eero-pi-hole.webp" alt="Eero Pi-hole connection diagram">
    <figcaption>Internet modem --> Eero gateway --> Pi-hole device</figcaption>
</figure>

- **Grey Wire**: Incoming internet connection from ISP
- **Blue Wire**: Ethernet cord connecting modem to gateway Eero
- **Red Wire**: Ethernet cord connecting secondary Eero port to Pi Zero

That's all we need to do on the hardware side of things.

## Configuring the Eero App

With everything connected properly it's finally time to setup our custom DNS settings through Eero.

1. Open the Eero app (iOS or Android)
2. Navigate to **Settings** > **Network Settings** > **DNS**
3. Select **Customized DNS** and enter both your saved IPv4 / IPv6 values
4. Eero will prompt you to reboot your network - do it

Next we need to add your Pi-hole's address as an IPv4 reservation:[^2]

1. In the Eero app, navigate to **Settings** > **Network Settings** > **Reservations & port forwarding**
2. Tap **Add a reservation** and include your Pi-hole's IP address

After the system reboots everything *should* be working as intended! You can check by navigating to your Pi-hole IP address in your browser.

## Closing Thoughts

None of this stuff if groundbreaking, but my hope is that even one person across the internet finds this helpful! If you run into any major bugs, please leave a comment below and I'll do my best to help out!

Best of luck blocking those pesky ads and trackers!

[^1]: You don't *have* to use your Eero gateway for this step (credit: [/u/RollMeAway83](https://old.reddit.com/user/RollMeAway83))
[^2]: Thanks to [u/YankeesIT](https://old.reddit.com/user/YankeesIT) for pointing out that this is required not *optional*