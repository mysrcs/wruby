# The Lazy Developer's Dark Mode

2021-04-12

After recently jumping back to Jekyll for my personal blog, I decided to take a closer look at how I was supporting `dark mode` for my visitors. I was using the proper CSS query to target those who had system-wide dark mode enabled, but I found that the code had far too many caveats and targeted too many custom classes.

So I thought to myself, "There *has* to be a simpler way..."

## Introducing Dark Mode - The Lazy Way

Here is the default dark mode for my current website in all it's glory:


    @media (prefers-color-scheme: dark) {
        body{background:#2d2d2d;filter:invert(1);}
        img,.cp_embed_wrapper,pre{filter:invert(1);}
    }


Not much to look at, eh? Well, let's still break it down.

First we set the `body` to use a nice dark background color (avoid using `#000000` directly since that can cause some minor eye strain). Next we tell the browser to invert all the child elements by using `filter:invert(1)`. At this point, you could consider your work done - but there are some edge case elements...

## Images, CodePens &amp; Code - Oh My!

Most of my articles on this site will include either an image(s), embedded CodePen examples or code snippets directly in the page. For these elements we probably *don't* want to invert their color/text etc. All we need to do is run the filter property on these a second time (*after* the main `body` attribute):


    @media (prefers-color-scheme: dark) {
        img,.cp_embed_wrapper,pre{filter:invert(1);}
    }


Of course, YMMV depending on what other custom elements you want to avoid inverting.

## Minor Caveats

I should mention that since my website doesn't use any custom coloring for anchor links, inverting `ahref` elements works out of the box. Certain projects might still require some custom overrides if the inverted version of a certain custom color looks poor.

That's it - enjoy being lazy!
