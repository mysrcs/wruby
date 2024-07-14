# Audio Hotkeys on Linux Mint

2020-06-14

I recently switched out the OS on my old 2011 MacBook Air with Linux Mint. It's a distro I've used a few times in the past, but never set it as one of my main daily drivers until now.

Setting up all my go-to applications (Sublime, LocalWP, Riot, Evolution, etc) was a breeze. The only snag I ran into was properly setting up the volume shortcuts on my wireless [Logitech MK235 keyboard](https://www.amazon.com/gp/product/B01AROOL12/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B01AROOL12&linkCode=as2&tag=uglyduck-20&linkId=5cfe5875a0f263b933692c381a6a88a9). After looking a little too long on DDG & even Google, I finally found [this forum thread with the solution](https://forums.linuxmint.com/viewtopic.php?t=253048).

For my own personal reference, I'm also going to include those code snippets here since you never know when you might need it again! And who knows, maybe this will help someone else stumbling around the internet.

```sh
// Volume Up
pactl set-sink-volume @DEFAULT_SINK@ +5%

// Volume Down
pactl set-sink-volume @DEFAULT_SINK@ -5%

// Toggle Mute
pactl set-sink-mute @DEFAULT_SINK@ toggle
```

