# Using a New Domain and Switching Static Hosts

2021-11-25

As you can most likely tell by looking at your browser's URL - I've swapped over to a new domain for my personal website: [tdarb.org](https://tdarb.org). I'm a fickle person and this is a random change - but it is one I've been planning to do for some time.

Let me give some minor background information and then get into the changes...

## What about Ugly Duck?

I had originally used the [uglyduck.ca](https://uglyduck.ca) domain for this personal blog as a *loosely* based reference to the "ugly duckling" story. This was based on the fact that I *mainly* focus on CSS and making the web more visually appealing - or beautiful, if you will - so the comparison to an ugly duckling becoming a swan made sense in my oddball mind.

But overtime I came to somewhat dislike[^1] it and set out to change it.

## So what the heck is "tdarb"?

I explain this on my updated [about page](/about) but I will mention it again here:

**tdarb**[^2] is simply my first name and last initial spelt backwards – Brad T. Mind blowing, right?

I've switched over to this naming convention to avoid having such a random "phrase" domain name while at the same time having a little more fun than just *mylegalname.com*. I also am a sucker for `.org` TLDs (although I don't know why).

I'm sure some readers will prefer it, some will be indifferent and others will hate it. Either way, it's my personal site and I'll do as I please!

## Breaking My Website for a Day and Fixing Potential Link Rot

The transition I made yesterday from [uglyduck.ca](https://uglyduck.ca) to [tdarb.org](https://tdarb.org) was *rough*. I thought that I could simply launch the identical content on the new domain, test everything, and then simply set a URL redirect from the old domain through Namecheap[^3]. Oh boy, was I wrong!

The bulk of my evening was spent figuring out why the redirect wouldn't propagate across all networks and why multiple forwards were occurring. In the end, I just tossed [uglyduck.ca](https://uglyduck.ca) back up on Netlify and set global redirect rules in their handy-dandy `_redirects` file. (I will write-up a small post about this soon to help others). After a few minutes everything was working perfectly fine and best of all - no broken links or potential link rot! All thanks to the `:splat` parameter in the redirects.

As for my RSS feed, everything *should* forward correctly? I state that as a question since I can't confirm this 100% and RSS feeds are not my expertise. If I broke this for any of you, I apologize. I will pray to the internet gods for your forgiveness...

## From Github to Sourcehut

That's right, I've switched this static site's hosting over to [sourcehut pages](https://srht.site) and couldn't be happier. My reasons for switching:

1. I'm happy to pay and support the ongoing work at sourcehut (open source alternatives to Netlify, Github, etc. is important)
2. I've been wanting to become more comfortable with the sourcehut ecosystem - there might be projects in the future I would like to help with on that platform and it helps if you know how to use it :P
3. Sourcehut pages are fast - I mean *really* fast

It *was* slightly confusing for my ape brain to figure out the setup, but I got there eventually. I plan to do a detailed step-by-step tutorial to help those like me who may find it a little daunting. It's well worth the minor effort.

## The Lifespan of uglyduck.ca

I still have ownership of the old domain for almost another full year. I feel like that gives users enough time to adjust and become accustomed to the new one. My plan is to let the domain die entirely when it goes up for renewal but who knows - I might very well keep it going if the mood strikes me.

## That's All Folks!

I don't have much else to report besides having made minor tweaks to this website design (yet again) and I have also finally added a picture of [workstation on the "Things I Use" page](/uses). That's it.

[^1]: not *hate* - just discontent
[^2]: pronounced tee-darb
[^3]: Namecheap support were very helpful - this was more of a limitation of what their redirects can do

