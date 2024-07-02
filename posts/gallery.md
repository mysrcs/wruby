# Simplifying the Craigslist Gallery

2022-10-03

**This article was updated on October 11, 2022**

I'm a big fan of [craigslist.org](https://craigslist.org) and the overall UX used throughout their application. My own website is an ever-changing example of "brutalist" or minimalist design, so I'm always inspired by existing web apps out in the wild using the same principles.

One nitpick I have with the current craigslist design is their approach to image galleries inside their listings. They use a chunk of bloated JavaScript (more than `380kB` total) to render something as simple as a collection of images. This seems like overkill to me.

<figure>
    <img src="/public/images/craigslist-gallery.webp" alt="Current craigslist.org gallery view">
    <figcaption>The current look of image galleries on craigslist</figcaption>
</figure>

## Simplifying Things

My first suggestion would be to remove JavaScript altogether. We can replicate most of the required features with just HTML &amp; CSS. Let's start with our core HTML structure:

### HTML


    <div class="gallery-wrapper">
        <div class="full-size">
            <a name="p1"><img src="https://picsum.photos/id/100/400" alt="Picture 1" class="gallery-item"></a>
            <a name="p2"><img src="https://picsum.photos/id/101/400" alt="Picture 2" class="gallery-item"></a>
            <a name="p3"><img src="https://picsum.photos/id/106/400" alt="Picture 3" class="gallery-item"></a>
        </div>
        <div class="thumbnails">
            <a href="#p1"><img src="https://picsum.photos/id/100/100" alt="Picture 1 Thumbnail" class="thumbnail-1"></a>
            <a href="#p2"><img src="https://picsum.photos/id/101/100" alt="Picture 2 Thumbnail" class="thumbnail-2"></a>
            <a href="#p3"><img src="https://picsum.photos/id/106/100" alt="Picture 3 Thumbnail" class="thumbnail-3"></a>
        </div>
    </div>


Here we are placing the full-size gallery images directly inside a single `div.full-size` as - you guessed it - `img` elements. This already helps us avoid the pitfall of building out spaghetti `div` containers.

Below this parent container we have another element, `div.thumbnails`, which will be used for our separate, smaller thumbnail versions of our main images. The most important items to note are the associated `ahref` elements surrounding each `img` element. By setting the `id` parameter on our thumbnails to match that of the `name` on our full-sized images, we can "scroll" the proper image into view without the need for JavaScript.

Now for the *fancy* stuff - the CSS!

### CSS


    .gallery-wrapper {
        position: relative;
    }
    .gallery-wrapper:before {
        background: rgba(255,255,255,0.8);
        content: "Scroll / Swipe 🡢";
        display: block;
        padding: 5px;
        position: relative;
    }
    
    .full-size {
        display: flex;
        scroll-snap-type: x mandatory;
        margin-bottom: 10px;
        max-width: 400px;
        overflow-x: scroll;
    }
    .full-size .gallery-item {
        scroll-snap-align: start;
    }

    .thumbnails img {
        cursor: pointer;
        margin-right: 10px;
    }


Okay, so it isn't *that* fancy. It's actually very basic, which is exactly what we were going for. The images are "stacked" inline thanks to the parent container being set to `display: flex`, even though it has a set width of `600px`. The included `scroll-snap-type: x mandatory` tells the browser to allow users to scroll/swipe horizontally through the parent container.

The last important piece of this CSS is the `scroll-snap-align: start` added to the individual image elements. This parameter *snaps* the next image into the starting position of the parent container on scroll, giving a behavior users have come to expect from media galleries.

You will also see the included `:before` pseudo element attached to the main `.gallery-wrapper` element. This isn't *required* but it certainly helps from a UX standpoint.

## Live Demo

Check out the embedded CodePen below to see it in action. More functionality could always be built on top of this, such as rendering all images dynamically on "build", but for a starting point I think it's great.

[Live CodePen Example](https://codepen.io/bradleytaunt/pen/ExLRyXz)
