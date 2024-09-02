# Burning & Playing PS2 Games without a Modded Console

2024-09-02

> **Important**: I do not support pirating or obtaining illegal copies of video games. This process should only be used to copy your existing PS2 games for backup, in case of accidental damage to the original disc.

## Requirements

**Note**: This tutorial is tailored towards macOS users, but most things should work similar on Windows or Linux.

You will need:

1. An official PS2 game disc (the one you wish to copy)
2. A PS2 **Slim** console
3. An Apple device with a optical DVD drive (or a portable USB DVD drive)
4. Some time and a coffee! (or tea)

## Create an ISO Image of Your PS2 Disc:

1. Insert your PS2 disc into your optical drive.
2. Open **Disk Utility** (Applications > Utilities)
3. In Disk Utility, select your PS2 disc from the sidebar
4. Click on the **File** menu, then select **New Image > Image from [Disc Name]**
5. Choose a destination to save the ISO file and select the format as DVD/CD Master
6. Name your file and click **Save**. Disk Utility will create a `.cdr` file, which is essentially an ISO file

Before we move on, we will need to convert that newly created `cdr` file into `ISO`.

Navigate to the directory where the `.cdr` file is located and use the `hdiutil` command to convert the .`cdr` file to an ISO file:

~~~sh
hdiutil convert yourfile.cdr -format UDTO -o yourfile.iso
~~~

You'll end up with a file named `yourfile.iso.cdr`. Rename it by removing the `.cdr` extension to make it an `.iso` file:

~~~sh
mv yourfile.iso.cdr yourfile.iso
~~~

Done and done.

## Getting Started

For Mac and Linux users, you will need to install Wine in order to run the patcher:

~~~sh
# macOS
brew install wine-stable

# Linux (Debian)
apt install wine
~~~

## Clone & Run the Patcher

1. Clone the FreeDVDBoot ESR Patcher:<br> `git clone https://git.sr.ht/~bt/fdvdb-esr`
2. Navigate to the cloned project folder:<br> `cd /path/to/fdvdb-esr`
3. The run the executable:<br> `wine FDVDB_ESR_Patcher.exe`

![The patcher running through Wine on macOS](/public/images/patcher-gui.png)

Now you need to select your previously cloned `ISO` file, use the default Payload setting and then click **Patch!**. After a few seconds your file should be patched.

## Burning Our ISO to DVD

It's time for the main event! Insert a blank DVD-R into your disc drive and mount it. Then right click on your patched `ISO` file and run "Burn Disk Image <filename> to Disc...".

From here, you want to make sure you select the slowest write speed and enable verification. Once the file is written to the disc and verified (verification might fail - it is safe to ignore) you can remove the disc from the drive.

## Before Playing the Game

Make sure you change the PS2 disc speed from **Standard** to **Fast** in the main "Browser" setting before you put the game into your console. After that, enjoy playing your cloned PS2 game!

