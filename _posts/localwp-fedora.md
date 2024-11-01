# Fixing LocalWP on Fedora 32

2020-05-06

I recently upgraded from Fedora 31 to 32 and everything went very smoothly - except for one application: **LocalWP**. After the upgrade, all local WordPress builds would fail and complain about two missing packages:

- libnettle6
- libhogweed4

After wasting far too much time rolling back to older LocalWP versions and reaching out into the community forums, I found a simply solution to the problem. You just need to download and install the following packages manually:

- libnettle6: [libnettle6-3.4.1-lp152.3.1.x86_64.rpm](https://pkgs.org/download/libnettle6)
- libhogweed4: [libhogweed4-3.4.1-lp152.3.1.x86_64.rpm](https://pkgs.org/download/libhogweed4)

Although these packages are built for OpenSuse, it still worked perfectly fine for me. My hope is that this quick post might be helpful for others who possibly run into the same issue.

For reference, here is the Local Community ticket I created: [Local not working with Fedora 32](https://localwp.com/community/t/local-not-working-fedora-32-workstation-edition/19219)
