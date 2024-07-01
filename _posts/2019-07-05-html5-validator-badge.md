---
layout: post
title: "Using HTML Validator Badges Again"
date: 2019-07-05
---


There was a time on the Internet when websites wore badges of honor, declaring that their code was semantic and followed the W3C guidelines. The validators we used weren't great (and **still** aren't perfect) but they represented a community that took pride in caring about the quality of their work. I think it's time we bring HTML badges back.

## Getting the flaws out of the way

Of course, there were reasons why these badges slowly faded out of popularity. Some of the reasoning made sense, but most felt like a stretch in logic from my perspective. I always looked at it as a "the good outweighs the bad".

Jukka Korpela's post way back in 2003, [HTML validation is a good tool but just a tool](http://jkorpela.fi/html/validation.html), highlighted a lot of problems with relying so heavily on these HTML validators. I suggest you give it a read if this kind of thing interests you. I found it fascinating, even though I disagree with most of the points he makes.

Some negatives used to dismiss HTML badges:

- **The badge system is outdated**
    - Dismissing the worth of something based on how long it has been around is foolish. Many tools and frameworks are "outdated" but are still used to this day with great success.
- **HTML5 doesn't *require* validation**
    - Technically *no subset of HTML* requires validation - but developers should aim for it. The W3C validators perform a solid job of keeping a standard for web development, so by following a standard we can keep experiences consistent for users.
- **Validation is too formal**
    - I believe in the ability to achieve your desired outcome based on almost any constraints. If a project leans you towards invalid or non-semantic structure to fulfill requirements, a better approach needs to be evaluated. We as developers tend to settle too quickly on the easiest option available to us.
- **Websites / web apps are just *too complex* to follow the W3C guidelines**
    - I call *BS* on this argument. The complexity of a website should have nothing to do with keeping semantic standards. *This is your job.*
- **It only exists to catch syntax errors**
    - For the record, I still see this more of a positive take on using validators. Subtle and nuanced syntax mistakes can be easily overlooked by the human eye.

## "Nobody puts *badges* in a corner"

A large of amount of designers / developers tend to forget that there are new people entering our industry everyday and they might not be as well versed in the basics of the web (HTML &amp; CSS specifically). Since so many newcomers start out with JavaScript frameworks or jump onto pre-existing projects, they don't always grasp the core foundation of valid markup. Some frameworks even break basic standards for visuals or easier development environments - setting their initial expectations that ugly semantics is acceptable code. The ends justify the means, etc.

Guiding first-timers towards HTML validators let's them rethink their structure when building products or at least give some forethought to their outputted code. We, the more *verteran* members of the community, have the knowledge of proper semantics since we grew our careers around this "trend". We shouldn't assume newbies have the same understanding. The basics are important.

## Open source HTML5 badge

Since the W3C doesn't officially produce any badges for HTML5 validation[^1], I've gone ahead and open sourced `SVG` and `PNG` versions of a badge based off the current W3C designs. You can check out the Github repo: [HTML5 Valid Badge](https://github.com/bradleytaunt/html5-valid-badge)

If you decide to use these badges, be sure to link these images to your valid passing URL ([html5.validator.nu](https://html5.validator.nu)). You can see an example of the link in the footer of this website.

Please feel free to reach out and share your websites / projects that pass as valid HTML and include an HTML valid badge. I'd love to check them out!

[^1]: [Interview with Mike Smith](http://html5doctor.com/html5-check-it-before-you-wreck-it-with-miketm-smith/): "There won't be any proper Valid HTML5 icon forthcoming, so if you'd like to use one in your content, you'll probably need to create one on your own."

