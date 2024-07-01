---
layout: post
title: "First Letter Pseudo Element"
date: 2019-05-03
---


In today's TypeTip we will be taking a look at the often overlooked `:first-letter` CSS pseudo element. Though you might only use this for specific article-format web pages, it's still a nice-to-have in your web dev toolset.

## The HTML

Like most pseudo elements, nothing has to change with your pre-existing HTML structure:


    <article>
        <p>It was a bright cold day in April, and the clocks were striking thirteen.</p>
    </article>


## The CSS

Here's where the magic happens:


    p:first-letter {
        color: orangered;
        font-size: 250%;
    }


## Live CodePen

[Live CodePen Example](https://codepen.io/bradleytaunt/pen/gJYbev/)



