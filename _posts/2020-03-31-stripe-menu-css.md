---
layout: post
title: "Stripe Menu Dropdowns (CSS)"
date: 2020-03-31
---


In a previous article I wrote, [Minimal CSS: Dropdown Menus](blog/minimal-css-menu), I showed how you could create a basic menu dropdown with only 121 bytes of CSS. While this demo is great for simple text-based menu dropdowns, it doesn't show just how complex (in a good way) you can make CSS-only menus. So, let's do just that.

## What we want to emulate

I think, like most designers, that the UI and web design work from the [Stripe](https://stripe.com/) team is pretty fantastic. Their clean approach using subtle animations and minimal elements make for a pleasant experience. Unfortunately, there is <i>one problem</i> with their current dropdown menus on their main website:

<b>They don't work if JavaScript is disabled.</b>

But we can easily fix that. So enough chit-chat, let's rip-off their menu design and recreate it with only CSS!

### Original ([Stripe Website](https://stripe.com))

<figure>
    <img src="/public/images/stripe-default-menu.webp" alt="Stripe default menu">
    <figcaption>Stripe's default menu dropdown (using both CSS & JavaScript) (<a href="/public/images/stripe-default-menu.webp">direct link to image</a>)</figcaption>
</figure>

### Our recreation ([CodePen Demo](https://codepen.io/bradleytaunt/full/ExjMjLL))

<figure>
    <img src="/public/images/stripe-recreated.webp" alt="Stripe menu recreated">
    <figcaption>Our recreation with pure CSS (zero JavaScript) (<a href="/public/images/stripe-recreated.webp">direct link to image</a>)</figcaption>
</figure>

Although our redesign is far from an exact replica (some subtle animations are missing which could always be added) - it's still impressive what you can do with some bare-bones CSS. Just something to keep in mind the next time you decide to reach for a JavaScript library to implement a similar design.

## See it live in action

Load in the CodePen below and play around with the menu dropdown. Feel free to re-use, break. share or <i>steal</i> this for any and all purposes. Enjoy!

[Live CodePen Example](https://codepen.io/bradleytaunt/pen/ExjMjLL)
