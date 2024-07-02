# Improving Laptop Battery Performance on OpenBSD

2023-06-13

It is no secret that OpenBSD has poor battery performance on laptops. Although not as impressive as something like Alpine Linux or FreeBSD, you can tweak OpenBSD *just enough* to squeeze more life out of your machine's battery.

## Our New Best Friend: `ampd`

I won't go into great detail about `ampd` here - that's what the incredible [documentation is for](https://man.openbsd.org/apmd). You'll want to make sure to start it before trying to configure it:

```
doas rcctl start apmd
```

If already running in a live session, you can default to `-A` (auto) but I suggest setting cpu performance to low:

```
apm -L
```

To make these changes permanent on boot:

```
doas rcctl set apmd flags -L
```

Optimizating battery life via `ampd` will have the most noticable impact but you can improve things even further by implementing some extra "small" performance wins.

## Small Performance Wins

1. Reduce your screen's brightness (`xbacklight -set 50`)
2. Use a lightweight window manager instead of a beefer desktop environment
3. Enable battery saving options in your system BIOS (if available)
4. Disable the fingerprint scanner and bluetooth in your system BIOS (if available)
5. Use utilities such as `mpv` and `ffmpeg` for media consumption
6. Reduce the number of open applications at any given time