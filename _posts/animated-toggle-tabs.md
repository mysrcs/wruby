# Animated Radio Tab Toggles

2021-01-05

*In this demo tutorial, we are making the assumption* that we need to create a radio slide toggle for our made-up payment options. For this we want to display 3 simple payment choices to the user:

- One-time payment
- Recurring payment
- Free tier payment

## The Final Demo

[Live CodePen](https://codepen.io/bradleytaunt/embed/vYXjpLO)

Let’s get started with the base skeleton.

## The HTML

<p>There isn't anything special happening here. We just contain all our <code>labels</code> and <code>inputs</code> into a <code>.radio-toggles</code> wrapper, make sure those <code>labels</code> are each properly connected to their corresponding <code>inputs</code>, and then add an empty <code>.slide-item</code> element (more on that later).</p>

~~~html
<div class="radio-toggles">
  <input type="radio" id="option-1" name="radio-options">
  <label for="option-1">One-Time</label>
  <input type="radio" id="option-2" name="radio-options" checked>
  <label for="option-2">Recurring</label>
  <input type="radio" id="option-3" name="radio-options">
  <label for="option-3">Free</label>
  <div class="slide-item"></div>
</div>
~~~


## The CSS

Now for the main event – the CSS. First we want to style the wrapper that holds all of our pieces together. You can tweak this to your liking, but I prefer a simple and clean style:

~~~css
.radio-toggles {
  align-items: center;
  background: #eee;
  border: 1px solid lightgrey;
  border-radius: 9999px;
  display: flex;
  justify-content: center;
  margin: 20px auto;
  max-width: 400px;
  overflow: hidden;
  padding: 4px;
  position: relative;
}
~~~

Next, we “hide” (only visually) the default `radio` inputs:

~~~css
input[type="radio"] {
  left: -9999px;
  position: absolute;
  z-index: -1;
}
~~~

Then we give the corresponding `label` elements a little spacing and breathing room:

~~~css
label {
  cursor: pointer;
  padding: 10px 20px;
  text-align: center;
  width: 33.33%;
  z-index: 2;
}
~~~

Remember that `.slide-item` I referenced earlier? That element will be the visual “slider” that animates between the individual radio options. We style that like so:

~~~sh
.slide-item {
  background: white;
  border-radius: 9999px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.15);
  height: calc(100% - 8px);
  left: calc(33.33% + 4px);
  position: absolute;
  width: calc(33.33% - 8px);
  transition: left .4s;
  z-index: 0;
}
~~~

You'll notice the `left`, `height`, and `width` properties utilize the CSS `calc` attributes – this just gives some much needed padding and visual clean-up to the whole tabbed interface.

For the finishing touches, we just need to tell the `.slide-item` where to position itself based on which `radio` input is currently selected:

~~~css
input[type="radio"]:nth-of-type(1):checked ~ .slide-item {
  left: 4px;
}
input[type="radio"]:nth-of-type(3):checked ~ .slide-item {
  left: calc(66.66% + 4px);
}
~~~

That's pretty much it! You now have a fully functional, animated toggle slider with just a set of simple `radio` inputs and pure CSS.



