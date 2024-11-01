# Click to Load Website Images

2021-03-25

In my previous post about [switching my Jekyll blog over to PHPetite](https://uglyduck.ca/#2021-03-22-89-posts-one-file), I briefly mentioned how I only loaded in article images if the user *clicked or tapped* the empty file element.

In this post, I'm going to quickly breakdown the update I've done to my blog's images since then and how you can easily implement the same thing in your own project.

## Update

As pointed out by Gabriel [in this Github issue](https://github.com/bradleytaunt/phpetite/issues/1), this concept breaks things slightly for RSS users. Since then, I have just set the default images on this blog to `display: none` and render them as `block` elements when their specific `section` is loaded into the DOM visibly.

The example below is remaining the same as it was, to still provide context for this post.

## Live Demo

Before we jump head first into the details, let's take a look at what we will be creating:

<figure>
    <div class="img-parent">
    <img loading="lazy" src="/placeholder-image.webp" onclick="this.src='/public/images/aqua-ui-css-buttons.webp'" alt="Aqua UI buttons">
    </div>
    <figcaption><b>Click the placeholder to load in the real image</b><br>Example Dribbble shot for testing. Feel free to click the default image in order to load the correct Dribbble source. <a href="/public/images/aqua-ui-css-buttons.webp">View full size image</a>.</figcaption>
</figure>

Pretty neat, eh? Well let's get into the nitty gritty.

## The Code

Personally, I place everything into a `figure` element to keep things contained and clean - but this isn't required by any means. We then include our `img` and `figcaption` elements. That's it.


    <figure>
        <img src="/placeholder-image.webp" onclick="this.src='https://res.cloudinary.com/bradtaunt/image/fetch/q_auto:low/v1570124593/https://uglyduck.ca/public/images/aqua-ui-css-buttons.webp'" alt="Aqua UI buttons">
        <figcaption><b>Click the placeholder to load in the real image</b><br>
            Example Dribbble shot for testing. Feel free to click the default image in order to load the correct Dribbble source.
            <a href="https://res.cloudinary.com/bradtaunt/image/fetch/q_auto:low/v1570124593/https://uglyduck.ca/public/images/aqua-ui-css-buttons.webp">View full size image</a>.
        </figcaption>
    </figure>


### The Image Element

This is where the *magic* happens. By default all images will target the default placeholder image: `placeholder-image.webp`. This image is just 16KB in size and only needs to load in once.

Next we include an inline `onclick` attribute, which targets the current image's `src` attribute and changes it based on the URL provided. (Note: I use Cloudinary for my blog's image storage, but you could even host your images relative to your root directory if you wanted)

Now when a user clicks on the placeholder image, the inline `onclick` pulls in the correct image in it's place.

### Disabled JavaScript

For users who have JavaScript blocked or disabled we have a decent backup. By including a direct link to the image URL in the `figcaption` element, we give the user the ability to still view the image in a separate browser tab.

You could get extra fancy and include some `noscript` tags in your project that maybe render a different placeholder image mentioning they have JavaScript disabled etc, but for my needs that would be overkill.

## Cool - But Why Do This?

Bandwidth is a limited resource for a lot of users around the world. As designers and developers it's best to respect this fact and only load in elements as the user *requires* them. Every little bit helps.
