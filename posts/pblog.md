# Yet Another Static Site Generator Switch

2022-07-06

If you're an RSS subscriber, I've probably blown up your feed reader (again). This seems to be an on-going theme with this blog. I can't help it.

This website now uses my *new* Pandoc-based static blog generator: [pblog](https://pblog.bt.ht). I won't go into great detail about it's features (or lack thereof) - if you're interested in that, check out the ["Introducing pblog" article](https://pblog.bt.ht/blog/pblog-intro.html).

The bigger question is, "Why the change?"

## Where's the Love for "Shinobi"?

Switching over to `pblog` wasn't caused by a dislike of using [Shinobi](https://shinobi.bt.ht). In fact, I still really enjoy the work flow that that plain-text focused SSG provides. The main issues that popped up for my own blog was *accessibility* and *poor user experience*.

I had multiple readers reach out and mention poor rendering of content in their RSS reader of choice. That's kind of a **big deal**. I test that project as best I can with my limited access to all available RSS readers - but I can only test so much. It became one of those "Well, it works on my machine!" meme. So instead of spending an untold amount of time debugging every RSS reader known to man, I figured my best bet was to render things as `HTML`.

The next big issue was *accessibility*. Screen readers can read `txt` formatted files perfectly fine but since elements aren't categorized everything ends up with the same level hierarchy. This can cause confusion between headers, list items, URLs, footers etc. For my personal use-case (sharing tutorials and covering design topics) it didn't make sense to sacrifice user accessibility for minimalism.

## The Search for Simplicity

My initial thought process was to include some form of "plus" add-on to the existing Shinobi build script. The idea was to render `HTML` versions of each post and dump those into the generated RSS file. Although maybe good in theory, it ended up impractical because:

1. No utility or existing tool could render the style of text-based formatting I implemented as semantic HTML (at least not without heavy customization and tinkering)
2. I was actually adding extra bloat to the Shinobi project (true minimalism is the point, right?)

So, that option was ruled out pretty quickly.

The next option didn't take me long to land on: *Pandoc*. I've used Pandoc for years and have nothing but great experiences tweaking it for my own needs. I knew that I could piggyback off the original `shell` commands in the Shinobi project and alter them as needed to incorporate Pandoc.

I honestly didn't run into many issues while rolling this out. Fairly seamless!

## New Workflow

With this new blog switch I also decided to try out a new *deploy* workflow. I've used `rsync` for the longest time but wanted to have something more GUI-based on macOS. I know, *blasphemy*!

Since I already have a Transmit license, that seemed like the best fit since it is designed specifically for macOS. Now my workflow process is as follows:

1. Write new posts in my root `posts` folder
2. Rebuild the `pblog` with `make`
3. Use the built-in sync function of Transmit to mirror my local `_output` with my web server

![The Transmit UI in all of its wonderful glory (before I updated)](/public/images/transmit-ftp.webp)

### Wrapping Up

Will there be bugs with this switch-over? Most likely. Will some URLs be left behind or broken? Possibly. These small issues will be ironed out over time. For now, I'm quite happy with keeping things minimal on the workflow side of things, while preserving accessibility and user experience with the output.

Thanks for reading!
