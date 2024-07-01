---
layout: post
title: "Goodbye WordPress, Hello Jekyll (Again)"
date: 2020-08-13
---


For the past four months this blog has been running on WordPress - but that ended today. I've officially switched back over to Jekyll. I'm not going to spend too much time delving into *why* I made the transition back, but I'll leave some cliff-notes for any interested parties.

## The big issues with *my* WordPress setup

I have to state that these problems existed based on *my own* setup / hosting choices with WordPress - this is not a direct reflection of WP itself.

1. **No theme editor access**
  - I was using EasyWP (Namecheap etc.) for my web hosting. It only cost me $3.88/month, which was very cheap for the quality of service provided. Unfortunately, this low price came with some setbacks. EasyWP doesn't allow users to edit `header.php` or `functions.php` files directly in the theme editor. Having to resort to FTP for simple one-line change was annoying.
2. **Super cache**
  - Caching web pages is wonderful for users on subsequent visits, but EasyWP took this to the extreme. Making minor styling updates sometimes required code changes in the `header.php` file directly in order to persist (see problem with editing these files in point #1).
3. **Monthly cost**
  - As I stated above, spending $3.88 on a monthly basis was peanuts in the grand scheme of things. Still, an extra monthly subscription for a side hobby seemed overkill for my use case.
4. **Future proofing**
  - In the end, having the core website generate itself into static files means it will stand the test of time on the interwebs. HTML & CSS FTW.

## What I lost in the switch

1. **Comments**
  - I loved the concept of owing / hosting comments directly on each post but this seemed like a fair trade-off when compared to the positives listed above. I might circle back around and use something like [Commento](https://commento.io/) or [Gitment](https://github.com/imsun/gitment)
2. **Blog anywhere**
  - Having the ability to hop on any machine, log in to my site and blog was awesome. Over time though, I found myself not doing this very often. Most times when composing an article I found I would write it out, edit and publish all in one sitting. Cool concept - just not as useful.

## Moving forward

I've learned to stick with what keeps me productive (and in this case, keeps me writing consistently). I still love WordPress and won't hesitate to reach for it when the need arrives. Unfortunately, it seems my personal website isn't one of those instances.
