# Launching Sublime Text with dmenu on Alpine Linux

2023-04-13

Everyone seems to be running some version of VSCode as their main editor these days. But not me. I find VSCode to be too bloated for my needs - not to mention being built on top of electron instead of *native* code. I prefer running programs that don't try to devour all of my machine's available memory or spike my CPU.

> **Note**: It's important to remember my personal machine is a ThinkPad X201 with only 6GB of RAM (plan to upgrade to 8GB soon!). Obviously your mileage may vary if you're using a beefier laptop or desktop...

In case the title of this post didn't make this obvious, my editor of choice is Sublime Text. It's fast, has a robust plugin ecosystem, and a very friendly community of users. Because of its popularity, troubleshooting any issues you might encounter becomes much easier with the amount of information freely available online.

The only minor downside is that it isn't *fully* open source. Personally, I think it is well worth buying a license directly from the developers to support their efforts.

If you haven't played around with it yet, I highly recommend giving it a try. At the very least, I guarantee you'll be impressed with the editor's performance and speed! [<#1>]

## One Small Problem...

Sublime is precompiled against glibc and Alpine uses musl. This makes things a little difficult. Luckily we can get around this roadblock by falling back on flatpak (which is unfortunately still locked at version 3 for Sublime).

You'll need to install flatpak, give your current user permission to install flatpak apps, and then install Sublime.

(The following snippets assume you are using `doas`. If you are using `sudo`, be sure to swap accordingly)

```
apk add flatpak
adduser <YourUsername> flatpak
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

Congrats. You now have setup `flatpak` on your machine! Next we install Sublime Text:

```
flatpak install flathub com.sublimetext.three
```

You could stop now and simply open Sublime anytime by running the following command in your terminal:

```
flatpak run com.sublimetext.three
```

This works perfectly fine but I find it a little cumbersome. I would much rather open my programs directly through dmenu. Let's set that up.

## Creating System Links

```
doas ln -s ~/.local/share/flatpak/exports/bin/com.sublimetext.three /usr/bin/sublimetext
```

Now that those directories are linked, simply open dmenu and start typing `sublimetext`. Done and done. No more terminal commands needed to open Sublime!

- - -

<small>
1. <span id="1">I am aware that using a terminal-based editor such as vim or emacs would be even *more* efficient. For my own personal use I find more classical "IDE" applications to work best for me.</span>
</small>