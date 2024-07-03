# Migrating from GitHub to sourcehut

2022-11-14

It has taken a little bit longer than I anticipated, but I have finally started to port over all my personal open-source projects to [sourcehut.org](https://sourcehut.org). I'll get into the *why* and *how* momentarily, but first let's take a look at all the impacted projects:

## Ported Projects

- [Vanilla CSS](https://vanillacss.com)
- [The 1MB Club](https://1mb.club)
- [pblog](https://pblog.bt.ht)
- [shinobi](https://shinobi.bt.ht)
- [Web Audit](https://audit.bt.ht)

## Still WIP

- [The 1KB Club](https://1kb.club)
- [phpetite.org](https://phpetite.org)

*Some others are being worked on but have less "popularity"*

## Why?

GitHub has landed itself in some hot water with their [recent lawsuit(s) surrounding their Copilot feature](https://githubcopilotlitigation.com/). I was already on the fence about keeping GitHub as my main "code forge" after they were scooped up by Microsoft, who then killed off Atom and then started collecting telemetry data through VSCode. This seemed like a good excuse as any to finally leave the platform. The *straw*, if you will.

*>> Sourcehut has entered the chat <<*

We, as designers and developers, shouldn't be supporting crap like this. I would much rather put my money where my mouth is and directly support a truly transparent alternative[^1]. Although I might only be paying for the **Typical Hacker** tier on [sourcehut](https://sourcehut.org/pricing/), I like to think that every little bit helps the platform. Even if you choose a different code forge, please consider donating to support independent alternatives!

## Git Email? Jump into the Deep End

One aspect of sourcehut that initially scared me off was the lack of a proper "PR-flow", web UI-based system[^2]. Instead, reporting bugs, creating tickets, and submitting PATCHES are generally done through regular, plain-text email.

In the end, I'm glad I stuck it out. I'm still pretty slow with this new workflow (so please be patient with me if you submit a patch on a project!) but it actually seems cleaner. The phrase "streamlined" is what comes to mind.

And really, if you think about it, at one point in time GitHub's PR system would have been "new" for most users. Everything takes time to learn. This workflow is no different.

Drew (creator of sourcehut) actually put together an extremely helpful guide on getting [setup with git send-email](https://git-send-email.io/). I still reference back to this if/when I need to get up-and-running on a new machine. I highly recommend checking it out.

## Wrapping Up

That's it really. I'm still in the process of moving over some projects, archiving original GitHub repos and becoming more adapted to the whole sourcehut "workflow". I'm enjoying it and it feels good to pay for something that is not only useful but open source at its core.

Will I be deleting my GitHub profile outright? Maybe. I'm not sure. For now the first step is removing any dependence I once had on that platform. Baby steps.

For those interested, my sourcehut public profile is: [https://sr.ht/~bt/](https://sr.ht/~bt/). Maybe I'll see you on the other side ;)

[^1]: I keep an up-to-date document of all the open source software/communities I pay for on [my "Uses" page](/uses) for reference.
[^2]: Put your pitchforks and torches away - I'm aware that a web-facing UI exists on sourcehut as well!
