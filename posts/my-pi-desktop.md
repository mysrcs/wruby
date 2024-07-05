# My Raspberry Pi Desktop

2020-09-02

I use a Raspberry Pi 4 as my personal daily driver and it's pretty great. I know these types of devices tend to be used for smaller pet-projects or fun experiments, but I thought I would share my experience using one as my main computer. Hopefully this can be a solid guide to help others who might be interested in creating a similar setup.

My desktop Pi working away on a regular morning:

<figure>
    <img src="/public/images/rpi-desktop.webp" alt="Raspberry Pi 4 desktop">
    <figcaption>The final Raspberry Pi desktop in all it's glory. (<a href="/public/images/rpi-desktop.webp">direct link to image</a>)</figcaption>
</figure>

## Table of Contents

1. [My Use Case](#use-case)
2. [The Hardware](#hardware)
3. [The Software](#software)
4. [Performance & Stats](#stats)

<h2 id="use-case">My Use Case</h2>

I'm a web designer and developer by trade. Therefore, I require a decent amount of functionality from my computer - more than just simple web browsing and document editing. When I first set out testing if the RPi4 *could* become my main device, I was surprised at how capable the hardware / software was at running all my required applications. My workload comprises of:

- Using Github/Gitlab to pull/push repos, open PRs, etc
- Run SSG (Jekyll mostly) locally for testing
- Run multiple WordPress instances locally
- Edit design files (Photoshop, Illustrator, direct SVGs)
- Simple web chat / email

Basic stuff, but I was originally doubtful of the RPi4 to be able to handle it all smoothly. I'm happy to say I was wrong.

<h2 id="hardware">The Hardware</h2>

The following hardware list is what I use specifically for my intended use case. I'm also a sucker for having cool looking SBC builds. By no means is this the "best setup" for everyone - I'm sure other combinations of gear might better suit your own personal needs.

> **Note**: products in the hardware section are Amazon affiliate links

- <a href="https://amzn.to/33BAVn2" target="_blank">Raspberry Pi 4</a>
- <a href="https://amzn.to/3nu55Aq" target="_blank">X857 V1.0 mSATA SSD Shield Expansion Board</a> (I'm using the X856)
- <a href="https://amzn.to/3jEgWd5" target="_blank">128GB mSATA SSD</a>
- <a href="https://amzn.to/3nqeJUK" target="_blank">Acrylic Case with Heatsinks &amp; Fan</a>
- <a href="https://amzn.to/34w60I1" target="_blank">Raspberry Pi Keyboard & Mouse</a>
- <a href="https://amzn.to/3jDKLdT" target="_blank">21.5" Acer Monitor</a>

<h2 id="software">The Software</h2>

The 32-bit version of Raspberry Pi OS ('Debian Buster' at the time of writing) is my OS of choice. Stable, reliable, and officially supported by the RPi community. It does the job.

The Pi has been overclocked to 2GHz in order to squeeze just a *little* extra out of the hardware. This has caused zero issues.

I'm also booting directly from the mSATA SSD (via USB booting) instead of relying on a slower microSD card. You can find tons of tutorials online on how to do the same, but I would recommend this one: [How to Boot Raspberry Pi 4 From a USB SSD or Flash Drive](https://www.tomshardware.com/how-to/boot-raspberry-pi-4-usb)

After that, I simply installed my required apps / configs (where applicable):

- Chromium (*preinstalled*)
- Firefox ESR
- Pale Moon
- Code OSS
- Terminal (*preinstalled*)
- Libre Office Suite
- Evolution
- Figma (Web - no install needed)
- Apache2 / MySQL
- Blueman (helpful GUI for bluetooth)

What my plain desktop looks like:

<figure>
    <img src="/public/images/rpi-desktop-screenshot.webp" alt="Raspberry Pi 4 desktop and wallpaper">
    <figcaption>My very basic Raspberry Pi desktop/wallpaper view. (<a href="/public/images/rpi-desktop-screenshot.webp">direct link to image</a>)</figcaption>
</figure>

<h2 id="stats">Performance &amp; Stats</h2>

Using this build day-to-day, I can honestly say I don't hit any hiccups or lag at all. Multiple applications and WordPress instances are running in the background, while 10-15 tabs are open in the Chromium browser. The little Pi just chugs along without breaking a sweat.

My average CPU temperature sits around 51&deg; (with heatsinks & fan active) while CPU usage never really cranks past 90% during even "intensive" processes.

Since *actual* data speaks louder than anecdotal chit-chat, I performed a very simple read/write test on my mSATA SSD.

First, clear the cache to avoid conflicting data:

~~~sh
sync; echo 3 | sudo tee /proc/sys/vm/drop_caches
~~~

### Write

Write script run:


    dd if=/dev/zero of=~/test.tmp bs=500K count=1024


Write output:


    524288000 bytes (524 MB, 500 MiB) copied, 1.95478 s, 268 MB/s


### Read

Read script:


    dd if=~/test.tmp of=/dev/null bs=500K count=1024


Read output:


    524288000 bytes (524 MB, 500 MiB) copied, 0.770993 s, 680 MB/s


This gives a total read/write value of: **268 MB / 680 MB** per second. Compare that to average microSD card speeds floating around **22 MB / 170MB** per second and you can see (and feel) the massive speed difference. Things are just snappier.

**Note**: Obviously extremely high-end (read: expensive) microSD cards *might* hit read/write speeds similar to that of an SSD. The issue is that you are more likely to corrupt or reach end-of-life with a microSD card - hence why I don't recommend them.

## Final Thoughts

I love that I can use a fairly cheap Raspberry Pi 4 as my main, personal desktop. Of course, some people might roll their eyes at this build and say, "why not just get a cheaper, more powerful laptop off eBay?". To that I would respond: *you're missing the point*. 

It was fun to put together this simple desktop. The fact that it runs fast and stable enough to be my daily driver is a great bonus. If this build interests you at all, I highly recommend giving it a go.
