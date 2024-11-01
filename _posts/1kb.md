# Making a Website Under 1kB

2022-08-02

I recently launched (another) website club called [the 1kB Club](https://1kb.club). Unlike [the 1MB Club](https://1mb.club), it isn't as accessible for most modern websites to become official members. Building a website that actually serves useful content while squeezing its page size under 1,024 bytes is no easy feat.

But it is possible. And I did it myself!

*Note:* Big shout-out to [Tanner](https://t0.vc), who inspired this whole "movement" with his own minimal website. (He also has some really great creations/articles there too!)

## The HTML

For reference, you can view my "mini" website here: [cv.tdarb.org](https://cv.tdarb.org). It is *very* minimal and serves only as a personal curriculum vitae. It also weighs only **920 bytes** and is valid HTML.

Let's take a look at the full HTML and then break things down from there:


    <!DOCTYPE html><link rel="icon" href="data:,"><meta name="viewport" content="width=device-width,initial-scale=1.0"><title>CV</title><p>Hi, I'm <a href="t">Brad Taunt</a>! I'm a UX designer.<p>Email: hello@tdarb.org<p>Resume<p>Senior Product Designer @ Donorbox, 2021-<br>Web Designer @ Purism, 2019-2021<br>Product Designer @ Benbria, 2013-2019<br>Web Designer @ Netvatise, 2009-2013<p>Projects<p><a href="1">1MB Club</a><br><a href="k">1kB Club</a><br><a href="p">pblog</a><br><a href="s">shinobi</a><br><a href="h">PHPetite</a><br><a href="v">Vanilla CSS</a><p>Writing<p><a href="d">The Death of Personality</a><br><a href="u">Simple Does Not Mean Ugly</a><br><a href="e">Plain Text Emails, Please</a><br><a href="tb">[more]</a>


## Sneaky "Hacks"

The first thing you'll notice is that the HTML is compressed. White space adds extra bytes of data to the page weight - so it needs to go. Next, you might have caught the *odd* favicon meta tag:


    <link rel="icon" href="data:,">


This is required to stop the browser from making the standard favicon request (normally pulling from `favicon.ico`). By adding this meta tag you are telling the browser to load in an empty image without running another server request. This saves about 400 bytes of bandwidth on its own!

The next two meta tags after the `icon` are technically optional. These are the `viewport` and `title` tags. You could save a good amount of data by excluding them altogether, but I had my own personal reasons for keeping them:

1. I wanted the web page to be responsive
2. I wanted the page to be [valid HTML](https://validator.w3.org/nu/?doc=https%3A%2F%2Fcv.tdarb.org%2F)

So, I kept these tags but made them as minimal as I possibly could (looking at you `title` tag). After that, it was time to add my content!

## Where We're Going, We Don't Need Tags...

The beauty of using HTML5 is the ability to ditch "default" and closing tags on most elements. Think of all those bytes we can save!

In the HTML above you will notice:

1. There is no `html` element
2. There is no `head` element
3. There is no `body` element
4. There are no closing `p` tags

Even with all those "missing" elements, the webpage is still valid HTML5! Craziness.

The final hack that saved a *ton* of bandwidth was implementing custom `href` URLs. Most of the links on the page take the user to another website altogether - which is fine. The problem is including these full domains inside the `a:href` tag. Those can start to eat up a lot of data.

Luckily, I host this mini-site through Netlify so I can take full advantage of their optional `_redirects` file. Links are now set with a single character (ie. "1" for the 1MB Club link) and the `_redirects` file simply forwards the user to the custom domain. Pretty sneaky!

## Closing Thoughts

This is a silly project that isn't meant to be taken so seriously. That being said, I'd love to see what other pages people are able to create while being limited to just 1kB.
