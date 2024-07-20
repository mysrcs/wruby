# Scripts

This page contains helpful scripts and useful terminal commands.

## Docker

Installing `ghost`


    docker pull ghost
    docker run -d \
        --name ghost-name \
        -e NODE_ENV=development \
        -p 2368:2368 \
        -v $HOME/path/to/ghost/blog:/var/lib/ghost/content \
        ghost:alpine


## `ffmpeg` to MP4


    ffmpeg -i input_filename.avi -c:v copy -c:a copy -y output_filename.mp4


## Mount USB HDD via CLI


    mkdir /media/usb-drive
    mount /dev/sdX /media/usb-drive/


## Fix screen tearing


    sudo vim /etc/X11/xorg.conf.d/20-intel.conf


Add the following contents to `20-intel.conf`:


    Section "OutputClass"
        Identifier  "Intel Graphics"
        MatchDriver "i915"
        Driver      "intel"
        Option      "DRI"       "3"
        Option      "TearFree"  "1"
    EndSection


## Enabling "tap to click"


    sudo micro /etc/X11/xorg.conf.d/30-touchpad.conf


Add the following contents to `30-touchpad.conf`:


    Section "InputClass"
        Identifier "touchpad"
        Driver "libinput"
        MatchIsTouchpad "on"
        Option "Tapping" "on"
        Option "TappingButtonMap" "lmr"
    EndSection


## Woocommerce

**Reset all product menu_order to `0`**


    UPDATE wp_posts SET menu_order = 0 WHERE post_type = 'product';

