# CSS: Indenting Text

2019-04-05

A lot of developers tend to do the bare minimum when it comes to implementing proper website typography. This isn't an insult - I'm happy that typography is given any thought at all during development, I just believe more can always be done to improve upon it.

In today's *TypeTip* we're going to play around with the `text-indent` property, look into when it's best to use it and how to implement it properly.

## The property and browser support

Browser support is actually pretty great for such a regularly over-looked CSS property. All major desktop and mobile browsers support it:

<figure>
    <img src="/public/images/text-indent-compatibility.webp" alt="Text indent browser compatibility">
    <figcaption>Full support across all browsers.</figcaption>
</figure>

Now that doesn't mean you should just slap this property on all your type elements and call it a day - there are specific use cases for `text-indent` and some basic rules to follow:

## Use Cases

1. Increasing readability of large text blocks that would otherwise overwhelm the reader
2. Replicating book or report typography layouts


## Basic Rules

1. Best to set this property on inner type children only - meaning items like `p` or `blockquotes` instead of main headings
2. When used on paragraph tags it's best to target only `p` elements that directly follow a sibling tag (see "The CSS" below)

## The CSS

Adding the property is extremely trivial, all you need is the following:


    /* Best practice for paragraphs */
    p + p {
        text-indent: 1rem; /* whatever you want */
    }


## Let's see it in action

[Live CodePen Example](https://codepen.io/bradleytaunt/pen/OGXLEd/)
