---
layout: post
title: "HTML Dark Mode"
date: 2023-04-11
---


I wrote an article back in 2021 called [The Lazy Developer's Dark Mode](https://bt.ht/lazy-dev-dark-mode/) where I explained how to implement
a very basic "dark mode" by using the `prefers-color-scheme` CSS attribute. This stills works perfectly fine, and in fact there is a cleaner variation of this created by *jacksonchen666*: [These 3 Lines of CSS Will Give You Dark Mode for Free](https://jacksonchen666.com/posts/2023-04-09/13-47-16/).

But today I wanted to show how to add dark mode functionality to a website without *any CSS at all*.


    <meta name="color-scheme" content="dark light">


Add that line inside the `head` tags on your HTML files and you're good to go.

## Minor Caveat

I mentioned this same issue on the official [barf blog post](https://barf.bt.ht/dark-mode/) but it doesn't hurt to repeat it here. Safari still has minor ahref / link color issue when defaulting to browser dark mode. If supporting that browser is a deal-breaker for you, I suggest looking at my [hacky solution](https://bt.ht/safari-default-dark-mode/).

Hopefully this helps others to add dark mode to their existing websites and projects with minimal effort!

