# Using User-Select

2019-06-04

Highlighting text in order to copy, cut or paste content is a staple action across the web. Now, what if I told you the ability to control what a user can select is configurable with a single CSS property?

## Introducing the CSS property

Simply put, the `user-select` property is defined as follows:

> `user-select` controls whether the user can select text (cursor or otherwise)

## The CSS

The property's available attributes are very straightforward (just remember to target specific browsers for full support!)


    /* Default */
    p.default {
        user-select: auto;
        -moz-user-select: auto;
        -webkit-user-select: auto;
    }
    
    /* Disable the user from selecting text */
    p.no-select {
        user-select: none;
        -moz-user-select: none;
        -webkit-user-select: none;
    }
    
    /* Select all text when user clicks */
    p.select-all {
        user-select: all;
        -moz-user-select: all;
        -webkit-user-select: all;
    }


## Let's see it in action

Try selecting the separate paragraph elements in the CodePen below:

[Live CodePen Example](https://codepen.io/bradleytaunt/pen/QRooZp/)

## Browser Support

The great news is `user-select` is fully supported across all modern browsers (even as far back as IE10!)
