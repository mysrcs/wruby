# Create a Mac App Icon with Pure HTML and CSS

2021-04-13

I have always been a huge fan of [Bogdan's work on Dribbble](https://dribbble.com/bg-d) and was recently inspired to see if I could replicate one of his awesome icon designs with only HTML &amp; CSS. What was the outcome? I think it's a half-way decent copy - of course the original will always look significantly better.

Don't care about reading through the tutorial? No problem! You can [jump right down to the live demo](#demo)

## The Comparison

Let's take a look at the original Dribbble shot:

<figure>
    <img src="/public/images/e54ac9b2850f786471d7790bec3844a6.webp" alt="Big Sur Icon">
    <figcaption>The original Dribbble shot (<a href="/public/images/e54ac9b2850f786471d7790bec3844a6.webp">direct link to image</a>)</figcaption>
</figure>

And now let's see what we will be creating with only HTML &amp; CSS:

<figure>
    <img src="/public/images/big-sur-css.webp" alt="Big Sur Icon">
    <figcaption>What we are going to create with pure HTML &amp; CSS (<a href="/public/images/big-sur-css.webp">direct link to image</a>)</figcaption>
</figure>

Like I said - far from perfect but still a fun experiment!

## The HTML

Let's jump right in and build out the main skeleton of our project:


    <div class="white-square"></div>
    <div class="blue-square">
        <div class="row">
            <div class="item"></div>
            <div class="item"></div>
        </div>
        <div class="row">
            <div class="item"></div>
            <div class="item"></div>
        </div>
        <div class="row">
            <div class="item"></div>
            <div class="item"></div>
        </div>
        <div class="row">
            <div class="item"></div>
            <div class="item"></div>
        </div>
        <div class="row">
            <div class="item"></div>
            <div class="item"></div>
        </div>
        <div class="row">
            <div class="item"></div>
            <div class="item"></div>
        </div>
        <div class="row">
            <div class="item"></div>
            <div class="item"></div>
        </div>
    </div>
    <div class="play-button">
        <div class="triangle"></div>
    </div>


 - The `white-square` element is the white, rounded square in the background
 - The `blue-square` is the main blue square of the icon
 - The `row` elements inside the `blue-square` will be our individual *lines* spread across the icon
 - The `play-button` is obviously - the play button

 Right now it will look like nothing, but we can change that by adding the most important part...

## The CSS

Pasting the entire CSS styling here would end up looking a little daunting. Instead, I'm just going to breakdown each individual section to make things more digestible.

### Defaults &amp; the White Square


    * {
        box-sizing: border-box;
    }
    :root {
        --row-distance: 42px;
    }

    .white-square {
        background: white;
        border-radius: 105px;
        box-shadow: inset 0 -5px 8px rgba(0,0,0,0.25), 0 12px 10px rgba(0,0,0,0.15), 0 2px 4px rgba(0,0,0,0.1);
        height: 420px;
        left: 165px;
        position: absolute;
        transform: rotate(-8deg);
        top: 95px;
        width: 420px;
    }


See that `--row-distance` variable? That will come into play a bit later. For now, we want to lay the Blue Square on top of this newly creating White Square:


    .blue-square {
        background: linear-gradient(#04BDFD 0%, #0585E4 100%);
        border-radius: 105px;
        box-shadow: inset 0 5px 8px rgba(255,255,255,0.5), inset 0 -5px 8px rgba(0,0,0,0.32), 0 12px 10px rgba(0,0,0,0.18), 0 2px 4px rgba(0,0,0,0.15);
        height: 420px;
        left: 205px;
        padding: 75px 0 0;
        position: absolute;
        top: 75px;
        width: 420px;
    }


## Targeting the Inner Rows

So far so good. The next part *looks* like a lot, but I assure you it's fairly straightforward. We need to include each row inside the Blue Square like in the original Dribbble shot (7 total). First we start with the parent `row` styling:


    .blue-square .row {
        display: flex;
        height: 20px;
        justify-content: space-between;
        padding: 0 55px;
        position: absolute;
        width: 100%;
    }


Now we style each individual row item via the `nth-of-type` attribute:


    .blue-square .row:nth-of-type(2) { margin-top: var(--row-distance); }
    .blue-square .row:nth-of-type(2) .item:nth-of-type(odd) {
        width: 85px;
    }
    .blue-square .row:nth-of-type(2) .item:nth-of-type(even) {
        width: calc(100% - 100px);
    }
    .blue-square .row:nth-of-type(3) { margin-top: calc(var(--row-distance) * 2); }
    .blue-square .row:nth-of-type(3) .item:nth-of-type(odd) {
        width: 115px;
    }
    .blue-square .row:nth-of-type(3) .item:nth-of-type(even) {
        width: calc(100% - 130px);
    }
    .blue-square .row:nth-of-type(4) { margin-top: calc(var(--row-distance) * 3); }
    .blue-square .row:nth-of-type(4) .item:nth-of-type(odd) {
        width: 185px;
    }
    .blue-square .row:nth-of-type(4) .item:nth-of-type(even) {
        width: calc(100% - 200px);
    }
    .blue-square .row:nth-of-type(5) { margin-top: calc(var(--row-distance) * 4); width: calc(100% - 115px); }
    .blue-square .row:nth-of-type(5) .item:nth-of-type(odd) {
        width: 105px;
    }
    .blue-square .row:nth-of-type(5) .item:nth-of-type(even) {
        width: calc(100% - 120px);
    }
    .blue-square .row:nth-of-type(6) { margin-top: calc(var(--row-distance) * 5); width: calc(100% - 140px); }
    .blue-square .row:nth-of-type(6) .item:nth-of-type(odd) {
        width: 65px;
    }
    .blue-square .row:nth-of-type(6) .item:nth-of-type(even) {
        width: calc(100% - 80px);
    }
    .blue-square .row:nth-of-type(7) { margin-top: calc(var(--row-distance) * 6); width: calc(100% - 160px); }
    .blue-square .row:nth-of-type(7) .item:nth-of-type(odd) {
        width: 40px;
    }
    .blue-square .row:nth-of-type(7) .item:nth-of-type(even) {
        width: calc(100% - 55px);
    }
    .blue-square .row .item {
        background: white;
        border-radius: 20px;
        box-shadow: inset 0 -2px 4px rgba(0,0,0,0.06), inset 0 2px 4px rgba(255,255,255,0.1), 0 4px 6px rgba(0,0,0,0.05);
        width: 40px;
    }
    .blue-square .row .item:nth-of-type(even) {
        background: #3FC0F5;
        width: calc(100% - 55px);
    }


Take a few moments to read everything over - it will help you better understand what's going on. Basically, we are adding two inner elements to each row element. We calculate the `margin-top` distance by using that `--row-distance` variable I mentioned earlier. The inner elements are then styled based on their placement inside the row (`nth-of-type`).

### The Play Button

Now we finish things off with a much simpler element to style:


    .play-button {
        backdrop-filter: blur(6px);
        border-radius: 9999px;
        box-shadow: inset 0 4px 0 rgba(255,255,255,0.3), inset 0 20px 15px rgba(255,255,255,0.6), 0 8px 12px rgba(0,0,0,0.1), 0 4px 6px rgba(0,0,0,0.05);
        height: 220px;
        overflow: hidden;
        position: absolute;
        right: 140px;
        top: 320px;
        width: 220px;
    }
    .play-button::before {
        background: rgba(255,255,255,0.9);
        border-radius: 9999px;
        content:'';
        filter: blur(40px);
        height: 150%;
        left: -25%;
        opacity: 0.8;
        position: absolute;
        top: -25%;
        width: 150%;
    }
    
    .triangle {
        position: absolute;
        left: calc(50% - 2em);
        background-color: #315074;
        top: calc(50% - 2.1em);
        text-align: left;
    }
    .triangle:before,
    .triangle:after {
        content: '';
        position: absolute;
        background-color: inherit;
    }
    .triangle,
    .triangle:before,
    .triangle:after {
        width:  3.2em;
        height: 3.2em;
        border-top-right-radius: 30%;
    }
    
    .triangle {
        transform: rotate(-90deg) skewX(-30deg) scale(1,.866);
    }
    .triangle:before {
        transform: rotate(-135deg) skewX(-45deg) scale(1.414,.707) translate(0,-50%);
    }
    .triangle:after {
        transform: rotate(135deg) skewY(-45deg) scale(.707,1.414) translate(50%);
    }


Thanks to [meduz](https://m.nintendojo.fr/@meduz/106059826445460903) for pointing out the `backdrop-filter` property. This allows for a frosted glass look on Chromium &amp; Safari (although sadly not on Firefox). The `triangle` element could also be improved by using an embedded `SVG` but I was determined to use only CSS for this experiment :P

That's really all there is to it! You can see the embedded CodePen example below or [check it out directly here &rarr;](https://codepen.io/bradleytaunt/pen/bGgBRaV)

---

### Special Thanks

Thanks to Bogdan for letting me butcher the original Dribbble shot :D

- [bg-d.net](http://bg-d.net/)
- [Bogdan on Dribbble](https://dribbble.com/bg-d)

---

<h2 id="demo">Live Demo (CodePen)</h2>

[Live CodePen Demo](https://codepen.io/bradleytaunt/pen/bGgBRaV)
