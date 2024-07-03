# Please Make Your Table Headings Sticky

2024-02-23

I often stumble upon large data sets or table layouts across the web. When these tables contain hundreds of rows of content, things become problematic once you start to scroll...

<video width="100%" controls="">
  <source src="/public/videos/not-fixed-header-tables.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>

<h2>This should be a header</h2>

Look at that table header disappear! Now, if I scroll all the way down to item #300 (for example) will I remember what each column's data is associated with? If this is my first time looking at this table - probably not. Luckily we can fix this (no pun intended!) with a tiny amount of CSS.

## Sticky Header

Check it out:

<video width="100%" controls="">
  <source src="/public/videos/fixed-header-tables.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>

Pretty awesome, right? It might look like magic but it's actually very easy to implement. You only need to add 2 CSS properties on your `thead`:

    position: sticky;
    top: 0;

That's it! Best of all, `sticky` has [~96% global support](https://caniuse.com/?search=sticky) which means this isn't some "bleeding-edge" property and can safely support a ton of browsers. Not to mention the improved experience for your end-users!

You can view a live demo of this table on the [CodePen example pen](https://codepen.io/bradleytaunt/pen/bGZyJBj).

If you found this interesting, feel free to check out my other table-focused post: [Making Tables Responsive With Minimal CSS](/posts/tables/)
