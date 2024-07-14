# Poor Man's CSS Full-Bleed Layout

2020-10-07

I recently came across the very well written and interesting article, [Full-Bleed Layout Using CSS Grid](https://joshwcomeau.com/css/full-bleed/), while browsing my daily designer feeds. I won't go into the post's specifics here (I recommend you read the article for yourself) but it details how to render full-bleed element effects utilizing the CSS `grid` property.

While the approach in the article works perfectly fine, I thought to myself, "Is there not a simpler, more backwards compatible way to do this?". Indeed there is.

## Make the Web Backwards Compatible

I try my best when creating specific element designs or layouts to have everything render consistently across almost *all* browsers. This tends to include the obvious front-runners: Chrome, Firefox, Safari - but I also try my best not to ignore the oldies: IE11, Edge and older versions of Opera. I believe if most web designers even loosely followed this concept we wouldn't be stringing together barely implemented CSS properties and hacking together polyfills for all the unsupported browsers. Just my two cents.

What does this have to do with full-bleed exactly? Well, the CSS we will be using in this demo is fully compatible with pretty much *any browser* that can run the basic version of CSS rendering. If the browser you're targeting supports `max-width` and `margins` - then have no fear, full-bleeds are here.

## Our HTML Example

Let's create a single-column blog layout for this example. We will include a heading, some paragraphs, an image, and a blockquote to keep it simple:

```html
<main>
  <article>
    <h1>Main Heading</h1>
    <p>Et non consequat eiusmod minim fugiat. Magna duis veniam ex reprehenderit occaecat sit. Nisi ut ex aliquip magna enim.</p>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Laborum repellat ab earum commodi, consequuntur totam adipisci doloremque asperiores quae at quia non temporibus ipsam voluptate voluptatem ipsa nostrum suscipit aliquid!</p>
    <img src='https://images.unsplash.com/photo-1569083692634-f8db90c093ef?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE0NTg5fQ' alt="Some Image">
    <p>Ex excepteur Lorem reprehenderit dolore in consequat voluptate commodo ipsum consequat ea et. Nisi tempor proident anim tempor. Laboris est sunt cillum deserunt culpa proident cillum laborum voluptate. Est exercitation Lorem reprehenderit eu ipsum nisi et.</p>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus dicta perspiciatis vel ex officiis, nisi optio nihil aspernatur exercitationem sed nobis architecto maxime eaque omnis eos, repellendus necessitatibus provident explicabo?</p>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid placeat ipsum totam, facere animi tenetur explicabo at veniam, culpa vitae debitis hic modi velit cum perferendis minima quos sit quisquam.</p>
    <blockquote>
      <p>To be, or not to be, that is the question:<br>Whether 'tis nobler in the mind to suffer<br>The slings and arrows of outrageous fortune,<br>Or to take Arms against a Sea of troubles,<br>And by opposing end them: to die, to sleep;</p>
      <cite>- Some guy</cite>
    </blockquote>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus dicta perspiciatis vel ex officiis, nisi optio nihil aspernatur exercitationem sed nobis architecto maxime eaque omnis eos, repellendus necessitatibus provident explicabo?</p>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid placeat ipsum totam, facere animi tenetur explicabo at veniam, culpa vitae debitis hic modi velit cum perferendis minima quos sit quisquam.</p>
  </article>
</main>
```

This works well as it is, but we will need to "section" off our different areas of content based on whether we want them `full-bleed` or not. We do this with - you guessed it - the `section` element. In this demo we want the image and blockquote to become `full-bleed` when rendered, so we'll add the `full-bleed` class to those sections for now (more on that later):

```html
<main>
  <article>
    <section>
      <h1>Main Heading</h1>
      <p>Et non consequat eiusmod minim fugiat. Magna duis veniam ex reprehenderit occaecat sit. Nisi ut ex aliquip magna enim.</p>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Laborum repellat ab earum commodi, consequuntur totam adipisci doloremque asperiores quae at quia non temporibus ipsam voluptate voluptatem ipsa nostrum suscipit aliquid!</p>
    </section>
    <section class="full-bleed">
      <img src='https://images.unsplash.com/photo-1569083692634-f8db90c093ef?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE0NTg5fQ' alt="Some Image">
    </section>
    <section>
      <p>Ex excepteur Lorem reprehenderit dolore in consequat voluptate commodo ipsum consequat ea et. Nisi tempor proident anim tempor. Laboris est sunt cillum deserunt culpa proident cillum laborum voluptate. Est exercitation Lorem reprehenderit eu ipsum nisi et.</p>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus dicta perspiciatis vel ex officiis, nisi optio nihil aspernatur exercitationem sed nobis architecto maxime eaque omnis eos, repellendus necessitatibus provident explicabo?</p>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid placeat ipsum totam, facere animi tenetur explicabo at veniam, culpa vitae debitis hic modi velit cum perferendis minima quos sit quisquam.</p>
    </section>
    <section class="full-bleed">
      <blockquote>
          <p>To be, or not to be, that is the question:<br>Whether 'tis nobler in the mind to suffer<br>The slings and arrows of outrageous fortune,<br>Or to take Arms against a Sea of troubles,<br>And by opposing end them: to die, to sleep;</p>
          <cite>- Some guy</cite>
      </blockquote>
    </section>
    <section>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus dicta perspiciatis vel ex officiis, nisi optio nihil aspernatur exercitationem sed nobis architecto maxime eaque omnis eos, repellendus necessitatibus provident explicabo?</p>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid placeat ipsum totam, facere animi tenetur explicabo at veniam, culpa vitae debitis hic modi velit cum perferendis minima quos sit quisquam.</p>
    </section>
  </article>
</main>
```

That's it for the HTML!

## The Magic CSS (Not Really)

Now take a deep breath and get ready for some hard CSS work:

```css
article {
    width: 100%;
}

article section {
    margin: 0 auto;
    max-width: 480px; /* This can be whatever you want */
    width: 100%;
}
article section.full-bleed {
    max-width: 100%;
}
```

That's it. *Really*. Now any element (blockquotes, specific headers, navigations, footers, etc) that you want to layout as "full-bleed", just wrap it in a `section` tag and sick the `full-bleed` class on it. Done and done.

Obviously you'll want to add more styling to clean-up and make your full-bleed layouts more beautiful. This demo was just more of a starting point.

### Maybe Not-Quite-Full-Bleed?

You could also further customize your options by including a class like `half-bleed`, which maybe only expands slightly outside the main section `max-width`:

```css
article section.half-bleed {
    max-width: 960px;
}
```

### Sidenote

For those concerned about accessibility: The [section element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/section) is a flow content element, so it can contain almost all HTML elements.

## Live Demo

[Live CodePen Example](https://codepen.io/bradleytaunt/pen/mdEdjzz)
