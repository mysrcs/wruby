# Keynote Slides with Pure CSS

2020-06-22

There are a great deal of options available on the web and built into most operating systems when you need to create presentation / keynote slides. You could use native software like LibremOffice Impress, Powerpoint, Apple's Keynote, etc. You could also decide to use preexisting web-based apps like Google Slides or an open source project such as RevealJS. All of these are good options.

But thinking more about how overly complex these apps are implemented, it got me wondering if I could quickly code up a presentation slide framework with pure CSS and barely any code.

This is what I came up with:

## The Demo

[Live CodePen Example](https://codepen.io/bradleytaunt/pen/jOWBJZb)

Yes, I know this is _ugly_, but this was created as a barebones skeleton for others to build upon. The demo uses a simple set of `radio` inputs that correspond to their own individual `slide` element. The framework looks at the currently `checked` input, then changes the `opacity` and `z-index` of its corresponding slide item. Pretty straightforward stuff!

Let's break down each piece:

## The HTML


    <div class="slider">
        <input type="radio" name="pagination" value="1" checked>
        <input type="radio" name="pagination" value="2">
        <input type="radio" name="pagination" value="3">
        <input type="radio" name="pagination" value="4">
        <input type="radio" name="pagination" value="5">
    
        <div class="slide">
            <h2>Slide 1</h2>
        </div>
        <div class="slide">
            <h2>Slide 2</h2>
        </div>
        <div class="slide">
            <h2>Slide 3</h2>
        </div>
        <div class="slide">
            <h2>Slide 4</h2>
        </div>
        <div class="slide">
            <h2>Slide 5</h2>
        </div>
    </div>


There isn't a whole lot going on here. We are just including a set of `radio` inputs (based on how many slides are desired) along with their corresponding `slide` class elements. You might notice we don't do anything to specifically target each individual slide item - you'll see why we don't need to in the CSS section!

## The CSS (SCSS)


    /* Basic default styles */
    .slider {
        height: 100%;
        left: 0;
        position: fixed;
        top: 0;
        width: 100%;
    
        .slide {
            height: 100%;
            opacity: 0;
            position: absolute;
            width: 100%;
            z-index: -2;
        }
    }
    
    input[type="radio"] { cursor: pointer; }
    
    /* Target slide item based on currently checked radio */
    input[type="radio"]:nth-of-type(1):checked ~ .slide:nth-of-type(1),
    input[type="radio"]:nth-of-type(2):checked ~ .slide:nth-of-type(2),
    input[type="radio"]:nth-of-type(3):checked ~ .slide:nth-of-type(3),
    input[type="radio"]:nth-of-type(4):checked ~ .slide:nth-of-type(4),
    input[type="radio"]:nth-of-type(5):checked ~ .slide:nth-of-type(5) {
        opacity: 1;
        z-index: 1;
    }
    
    /* Individual slide styling */
    .slide:nth-of-type(1) { background: dodgerblue; }
    .slide:nth-of-type(2) { background: crimson; }
    .slide:nth-of-type(3) { background: rebeccapurple; }
    .slide:nth-of-type(4) { background: goldenrod; }
    .slide:nth-of-type(5) { background: pink; }


Again, not much to see here. We use CSS to look down through the DOM for each `radio` elements slide "partner". We do this by targeting the `nth-of-type` on both elements. Simple stuff.

Some drawbacks to this approach:

- You need to manually target each new slide you add (color, styling, content, etc.)
- Lack of animations might require extra work to implement (maybe 3rd party libraries- ke AOS?)
- Probably won't be best for extremely long/complex presentation slides

That's it! Hope you enjoy playing around with it.
