# Stop Using Custom Web Fonts

2023-03-14

I recently read an excellent post by Manu Moreale titled [A rant on web font licenses](https://manuelmoreale.com/a-rant-on-web-font-licenses). I highly recommend you give it a read (it's relatively short) since Manu makes a solid argument against existing font licenses. After reading, I found myself thinking about it throughout the rest of the day.

I was trying to understand how we ended up in a situation where web/UI designers (myself included) have started to *insist* on using proprietary, custom web fonts. Do any users actively benefit from custom web fonts? Are there any *useful* and *measurable* goals achieved by including them? Do end-users actually *care* about a website's typeface?

For the most part, I believe the answer to all those questions is: **not really**.

## System Fonts Look Good

We are no longer in the early days of the internet. Browsers have matured. Operating systems already ship with usable and often times pretty typefaces. The "wow factor" of having a custom web font on a website is completely gone. Not to mention, recent trends see designers including *terrible* typefaces that actually make things more difficult to read and break basic accessibility.

All of this for the sake of a company's "brand". I say: **fuck your brand**. Your end-users should always trump your design "guidelines". Period.

## "Think of the Consistency!"

Often times designers will argue that designs will look too different across browsers/operating systems. I'm not sure why this is seen as a bad thing. First, users will be familiar with the fonts already available to them. Second, as designers our work should never rely on one point of failure (in this instance: fonts). Your designs should be agnostic of your typeface selection. 

And what about users with browser extensions that already block your custom web fonts? Screw them I guess?

People work on different systems with different constraints and settings. Embrace that - don't try to override it.

## Loss of Personality

The web is not the same medium as graphic design. Digital designers often get this confused. Web applications serve an action or purpose. The user wants to complete a *task* - not look at a pretty poster. I understand this sounds harsh, but many designers design more for their own ego and portfolio rather than the end-user. That extra *flair* on your lowercase "t" doesn't help the user better interact with your features or UI. It just slows them down.

## Hurting Performance & Wasting Resources

A lot of designers I've worked with or talked to in the past tend to be big supporters of reducing their carbon footprint and minimizing their individual output of "waste". What I always find interesting is how that never seems to translate into their work.

It might be small in the grand scheme of things, but having an extra HTTP request (or more) for your custom fonts and requiring your users to consume more bandwidth on their end is not "eco". As designers we should cut the fat and reduce software bloat in the small areas that we're able to: the front end.

My hope is that even one designer reading this decides to rollout a web app or marketing page without dumping a bunch of custom fonts on their users. It's just the *nice* thing to do.