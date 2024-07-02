# I Want to Suckless and You Can Too

2022-12-23

## The Desire to Suckless

While I have been happy with my [previous desktop setup](/alpine) using Wayland on Alpine Linux, I just couldn't shake the urge to fully embrace the [suckless ecosystem](https://suckless.org). Although, this meant ditching Wayland and returning to X11, which is apparently the new "cool thing to hate" in Linux land. At least, that's what I've seen online lately.

But I'm getting ahead of myself...

## What is Suckless?

I'm not going to spend too much time repeating what you can [already read on the suckless.org website itself](https://suckless.org/philosophy/), but in a nutshell:

> Software with a focus on simplicity, clarity, and frugality.

The developers also pride themselves on catering to *advanced and experienced computer users*, which is actually a refreshing take in my opinion. There are enough pre-existing open source solutions for non-technical or average Linux users looking for a desktop system. Having an option that requires users to deep-dive into the code, compile the programs manually, and better understand the software they are running is a welcome addition.

This process of "owing your software" was one of the core concepts that initially grabbed my attention. I've always been mildly mediocre at reading and writing C (ie. enough to be dangerous), so the thought of jumping head first into a system that would require me to better learn that language was tempting[^1]. And that temptation was enough to give it a shot!

## Let's Get Started

So I made my decision. I would (at the very least) *try* switching my daily driver over to a completely "suckless" system. But I was immediately faced with my first obstacle: *which distro should I use*?

I'm sure many would suggest Gentoo, since it follows the principles of suckless more than any other distribution on the market. But I don't hate myself enough to go down that insane rabbit-hole. I'm hardly advanced enough to take on such a steep challenge, not to mention my plan was to build out a "setup script" so others could roll their own suckless build. Something like that looked daunting under Gentoo. Maybe in the future...

So what's left? Void? Arch? Something fresh, like Metis? I really didn't know the "best" choice. Maybe there were just *too many* options? 

Luckily, I did know of a distro that was my go-to for most projects...

## Trying Alpine

Alpine Linux is one of the best distributions available. If you disagree, you clearly haven't achieved galaxy-brain levels of intelligence and I feel sorry for you[^2].

Having just rolled my own [installer script](https://git.sr.ht/~bt/alpine-linux-setup) for Wayland/Sway on Alpine, I figured why not piggyback off that existing project? Work smart not hard, right? So I started putting together an absolute *bare minimum* list of requirements I needed to get a proper desktop system running:

- working suspend/awake
- working audio
- working wifi/networking
- reduced screen tearing (X11 gave me problems in the past with this)

As you can see, I have very low expectations. But there were issues....

1. I could not build my blog locally (built via Jekyll) since the `sass-embedded` dependencies has not been built against musl-libc.
2. VSCodium would require the extra "bloat" of the flatpak manager (not to mention the spotty support some applications have through flatpak/snap).
3. The distro/system *feels* like it was better designed with Wayland in mind. Too often I felt like I was losing an uphill battle wrestling against Alpine.

## Getting Sucked into the Void

After mentioning my struggles on Mastodon, some [helpful friends suggested taking a look at Void](https://fosstodon.org/@tdarb/109554576434981872). I always knew of the project but never used it as a "daily driver". Since this was overall one *large* experiment, I figured I'd give it a shot.

I'm glad I did. Void Linux is *pretty great*.

The installer seemed more complex than Alpine at first, but I found an excellent walkthrough [here](https://linuxiac.com/void-linux-installation/) (which I was more beginner-friendly than the official docs). Once everything was set, it was time to run my suckless "installer".

## Introducing void-suck

If you don't care about the nitty-gritty details, feel free to just jump over to the [void-suck repo on scourehut](https://git.sr.ht/~bt/void-suck) and read through the code yourself. There is nothing groundbreaking here. A huge inspiration came from [mad-ara's "void-rice" project on Github](https://github.com/mad-ara/void-rice) - so a big thanks to him for making that project in the first place!

You can find the basic instructions in the README of the project itself, but it pulls in just the required dependencies along with my own custom suckless tools. You can easily swap out these with your own or simply default to the standard ones provided by [suckless.org](https://suckless.org).

Everything *should* work out of the box, but in case it doesn't please [open a ticket](https://todo.sr.ht/~bt/void-suck) or [submit a patch](https://lists.sr.ht/~bt/void-suck). I'm certain I overlooked some items!

## Closing Thoughts

We'll see how things go. So far I'm enjoying my time with a much simpler desktop and the "forced" push towards getting better with C is an added bonus. I still love Alpine, but Void is slowly winning me over...

## Refs

1. I find this to be the best way to learn new things. Reading technical books are helpful, but concepts never stick with me unless I am forced to implement them.
2. This is a joke. Alpine is certainly not for everyone. There are many more "fully featured" distros available and everyone should use what they enjoy! Try not to take my blog posts so seriously...