---
layout: page
title: Xbox Softmodding
permalink: /wiki/xbox/softmodding
---

This page details the instructions on how to soft mod an original Xbox console (v1.6 in this instance) using a USB flash drive.

## Materials

* A Female USB to Xbox controller port adapter
* A USB flash drive that is 4GB or smaller 
* (Optional) If running MacOS, a working install of Windows via UTM

## Preparing the USB Drive

* Turn on your console and connect your USB drive via the controller port adapter
* Navigate to `Memory` from the Xbox Dashboard
* Select the device from the available options (WARNING: This is erase everything on the USB)
* Remove the USB

## Running the Exploit

* Download the [Xbox Softmodding Tool.zip](https://drive.google.com/drive/folders/1Gs_yYVotDxAxtHZeHUVr_ts7KeMgqEmQ), open it, open the Softmod Package folder, and extract the contents of Endgame.zip. It should be a folder named `helper`, a folder named `trigger`, and a file called `payload.xbe`.
* Copy the helper folder, trigger folder, and payload.xbe to the root of your flash drive or memory unit.
* Plug the memory device into your controller and turn on the Xbox. Select "Memory", then click your memory device. It will freeze for a minute and then the LED ring on the front of your Xbox should cycle colors before booting into the softmod installer.
* Press A to install the softmod. Read the prompts that come up and press A to acknowledge them. Your Xbox will reboot.
* The tool will finish setting up. You will be left on the Xbox Softmodding Tool dashboard, which is just a skinned UnleashX dashboard. You can change the skin under System → Skins.
