---
layout: post
title: "Dynamic Checkboxes"
date: 2019-07-30
---


Checkboxes are used quite frequently on forms across the web. Whether you're selecting a pricing plan during a site's sign-up process or just simply selecting to opt-out from a newsletter, you have most likely interacted with some form of checkbox element.

What if we could make everyday checkboxes more beautiful *and* more intuitive? *It's easier than you think*. We only need a small amount of CSS and JavaScript to make considerable improvements to your average checkbox UX.

Let's get into it.

## What we are building
Take a look and play around with the CodePen below to get an idea of what we are going to build. The premise is a simple add-on pricing form which calculates the additional monthly total to the user in real-time.

[Live CodePen Example](https://codepen.io/bradleytaunt/pen/rXWEpy/)

## The Structure (HTML)

As always, we will start by breaking down the "bones" of the HTML structure for this checkbox form. Let's take a look at the HTML in it's entirety (don't worry, it is a lot more simple than it seems at first glance):


    <h2>Add-ons</h2>
    
    <input class="checkbox-btn" name="checkbox-collection" id="checkbox-1" type="checkbox" value="49">
    <label class="checkbox-label" for="checkbox-1">
        <span>
            White-labeled Domain
            <em>Use your own custom domain with SSL security included.</em>
        </span>
        <span>$49/mo</span>
    </label>
    
    <input class="checkbox-btn" name="checkbox-collection" id="checkbox-2" type="checkbox" value="49">
    <label class="checkbox-label" for="checkbox-2">
        <span>
            API Access
            <em>Make API calls to perform custom serving and account actions.</em>
        </span>
        <span>$49/mo</span>
    </label>
    
    <input class="checkbox-btn" name="checkbox-collection" id="checkbox-3" type="checkbox" value="349">
    <label class="checkbox-label" for="checkbox-3">
        <span>
            Priority Support
            <em>A dedicated account manager to assist your team with ongoing deployments.</em>
        </span>
        <span>$349/mo</span>
    </label>
    
    <div class="total-cost">
        <h2>Your Plan</h2>
        <div>
            <span>$</span>
            <span id="total-cost-inner">0</span>
            <input id="output" type="text" value="0" disabled/>
            <span>/mo</span>
        </div>
    </div>


### The checkbox inputs &amp; labels


    <!-- #1 -->
    <input class="checkbox-btn" name="checkbox-collection" id="checkbox-1" type="checkbox" value="49">
    
    <!-- #2 -->
    <label class="checkbox-label" for="checkbox-1">
    
        <!-- #2i -->
        <span>
            White-labeled Domain
            <em>Use your own custom domain with SSL security included.</em>
        </span>
        
        <!-- #2ii -->
        <span>$49/mo</span>
    
    </label>


1. This input will be hidden via `position:absolute` by default. All checkbox inputs need to share the same `name` value and all checkboxes require their our custom `id` that will link with the corresponding `for` value on the label.

2. This label needs it's `for` value to correspond with it's partnered checkbox.
  - i) The first span holds the title and description information of the add-on
  - ii) The last span holds the cost associated with the current add-on

### The total cost container output


    <!-- #1 -->
    <div class="total-cost">
    
        <h2>Your Plan</h2>
    
        <!-- #2 -->
        <div>
    
            <!-- #2i -->
            <span>$</span>
    
            <!-- #2ii -->
            <span id="total-cost-inner">0</span>
    
            <!-- #2iii -->
            <input id="output" type="text" value="0" disabled/>
    
            <!-- #2iv -->
            <span>/mo</span>
    
        </div>
    
    </div>


1. A simple `div` with a class we can easily target later

2. A `div` parent container is needed to house all the total `spans` together (more on this when we get into the CSS)
    - i) The first `span` holds the static currency symbol
    - ii) The second `span` is where our updated cost will be injected
    - iii) This input field is required for us to take-in the `value` of the associated `:checked` inputs and add them together. This current value is then used for the injection into the second `span`
    - iv) The final `span` simply holds the static monthly duration content

All that's all we need for the HTML!

## The Visuals (CSS)

Again, lets take a look at the entire file before we break it down step-by-step:


    .checkbox-label {
        align-items: center;
        background-color: none;
        border: 1px solid lightgrey;
        border-radius: 5px;
        cursor: pointer;
        display: flex;
        font-weight: 600;
        justify-content: space-between;
        margin: 0 auto 10px;
        padding: 20px 20px 20px 70px;
        position: relative;
        transition: .3s ease all;
        width: 100%;
    }
    .checkbox-label span:last-child {
        padding: 0 0 0 20px;
    }
    .checkbox-label:hover {
        background-color: rgba(255,255,255,0.2);
    }
    .checkbox-label:before {
        background-repeat: no-repeat;
        background-position: center;
        background-size: 15px;
        border: 1px solid lightgrey;
        border-radius: 50%;
        content:'';
        height: 30px;
        left: 20px;
        position: absolute;
        top: calc(50% - 15px);
        transition: .3s ease background-color;
        width: 30px;
    }
    .checkbox-label:hover:before {
        background-image:
            url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="23.571429" height="23.571429" viewBox="0.000000 -47.142857 23.571429 23.571429"><path fill="lightgrey" d="M23.571429 -36.964286L23.571429 -33.750000C23.571429 -33.303571 23.415179 -32.924107 23.102679 -32.611607C22.790179 -32.299107 22.410714 -32.142857 21.964286 -32.142857L15.000000 -32.142857L15.000000 -25.178571C15.000000 -24.732143 14.843750 -24.352679 14.531250 -24.040179C14.218750 -23.727679 13.839286 -23.571429 13.392857 -23.571429L10.178571 -23.571429C9.732143 -23.571429 9.352679 -23.727679 9.040179 -24.040179C8.727679 -24.352679 8.571429 -24.732143 8.571429 -25.178571L8.571429 -32.142857L1.607143 -32.142857C1.160714 -32.142857 0.781250 -32.299107 0.468750 -32.611607C0.156250 -32.924107 0.000000 -33.303571 0.000000 -33.750000L0.000000 -36.964286C0.000000 -37.410714 0.156250 -37.790179 0.468750 -38.102679C0.781250 -38.415179 1.160714 -38.571429 1.607143 -38.571429L8.571429 -38.571429L8.571429 -45.535714C8.571429 -45.982143 8.727679 -46.361607 9.040179 -46.674107C9.352679 -46.986607 9.732143 -47.142857 10.178571 -47.142857L13.392857 -47.142857C13.839286 -47.142857 14.218750 -46.986607 14.531250 -46.674107C14.843750 -46.361607 15.000000 -45.982143 15.000000 -45.535714L15.000000 -38.571429L21.964286 -38.571429C22.410714 -38.571429 22.790179 -38.415179 23.102679 -38.102679C23.415179 -37.790179 23.571429 -37.410714 23.571429 -36.964286ZM23.571429 -36.964286"></path></svg>');
    }
    .checkbox-label span {
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
    }
    .checkbox-label span em {
        display: block;
        font-size: 80%;
        font-style: normal;
        font-weight: 400;
        line-height: 1.2;
    }
    .checkbox-btn {
        position: absolute;
        visibility: hidden;
    }
    .checkbox-btn:checked + .checkbox-label {
        background-color: white;
        border-color: mediumpurple;
        box-shadow: 0 2px 4px rgba(0,0,0,0.05);
    }
    .checkbox-btn:checked + .checkbox-label:before {
        background-color: mediumpurple;
        background-image:
            url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="25.948661" height="19.888393" viewBox="2.025670 -40.011161 25.948661 19.888393"><path fill="white" d="M27.974330 -36.127232C27.974330 -35.680804 27.818080 -35.301339 27.505580 -34.988839L15.385045 -22.868304L13.108259 -20.591518C12.795759 -20.279018 12.416295 -20.122768 11.969866 -20.122768C11.523438 -20.122768 11.143973 -20.279018 10.831473 -20.591518L8.554688 -22.868304L2.494420 -28.928571C2.181920 -29.241071 2.025670 -29.620536 2.025670 -30.066964C2.025670 -30.513393 2.181920 -30.892857 2.494420 -31.205357L4.771205 -33.482143C5.083705 -33.794643 5.463170 -33.950893 5.909598 -33.950893C6.356027 -33.950893 6.735491 -33.794643 7.047991 -33.482143L11.969866 -28.543527L22.952009 -39.542411C23.264509 -39.854911 23.643973 -40.011161 24.090402 -40.011161C24.536830 -40.011161 24.916295 -39.854911 25.228795 -39.542411L27.505580 -37.265625C27.818080 -36.953125 27.974330 -36.573661 27.974330 -36.127232ZM27.974330 -36.127232"></path></svg>');
        border-color: mediumpurple;
    }
    
    .total-cost {
        align-items: baseline;
        border-top: 1px solid lightgrey;
        display: flex;
        justify-content: space-between;
        margin-top: 40px;
        padding: 40px 20px 0;
    }
    .total-cost div {
        align-items: baseline;
        display: flex;
    }
    .total-cost span:nth-child(1) {
        align-self: flex-start;
        padding-top: 5px;
    }
    .total-cost span:nth-child(2) {
        font-size: 32px;
        font-weight: bold;
    }
    .total-cost input {
        display: none;
    }
    
    @media(max-width:480px) {
        .checkbox-label {
            align-items: flex-start;
            flex-direction: column;
            flex-wrap: wrap;
        }
        .checkbox-label span:last-child {
            padding: 10px 0 0 0;
        }
    }


### The checkbox label


    /*
    This is the main element for each checkbox "container".
    Inside it houses the title, description and price.
    */
    .checkbox-label {
        align-items: center;
        background-color: none;
        border: 1px solid lightgrey;
        border-radius: 5px;
        cursor: pointer;
        display: flex;
        font-weight: 600;
        justify-content: space-between;
        margin: 0 auto 10px;
        padding: 20px 20px 20px 70px;
        position: relative;
        transition: .3s ease all;
        width: 100%;
    }
    .checkbox-label:hover {
        background-color: rgba(255,255,255,0.2);
    }
    
    /* Update the label styling when the input is :checked */
    .checkbox-btn:checked + .checkbox-label {
        background-color: white;
        border-color: mediumpurple;
        box-shadow: 0 2px 4px rgba(0,0,0,0.05);
    }


### The custom checkbox input

We need to hide the browser's default checkbox input and replace it with our own using pseudo selectors.


    /* Hide browser default input */
    .checkbox-btn {
        position: absolute;
        visibility: hidden;
    }
    
    /* Our custom input checkbox */
    .checkbox-label:before {
        background-repeat: no-repeat;
        background-position: center;
        background-size: 15px;
        border: 1px solid lightgrey;
        border-radius: 50%;
        content:'';
        height: 30px;
        left: 20px;
        position: absolute;
        top: calc(50% - 15px);
        transition: .3s ease background-color;
        width: 30px;
    }
    
    /*
    Here we add a simple '+' icon on hover
    to our custom pseudo element.
    Adding it as an inline SVG gives us the
    ability to fully customize it's styling
    */
    .checkbox-label:hover:before {
        background-image:
            url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="23.571429" height="23.571429" viewBox="0.000000 -47.142857 23.571429 23.571429"><path fill="lightgrey" d="M23.571429 -36.964286L23.571429 -33.750000C23.571429 -33.303571 23.415179 -32.924107 23.102679 -32.611607C22.790179 -32.299107 22.410714 -32.142857 21.964286 -32.142857L15.000000 -32.142857L15.000000 -25.178571C15.000000 -24.732143 14.843750 -24.352679 14.531250 -24.040179C14.218750 -23.727679 13.839286 -23.571429 13.392857 -23.571429L10.178571 -23.571429C9.732143 -23.571429 9.352679 -23.727679 9.040179 -24.040179C8.727679 -24.352679 8.571429 -24.732143 8.571429 -25.178571L8.571429 -32.142857L1.607143 -32.142857C1.160714 -32.142857 0.781250 -32.299107 0.468750 -32.611607C0.156250 -32.924107 0.000000 -33.303571 0.000000 -33.750000L0.000000 -36.964286C0.000000 -37.410714 0.156250 -37.790179 0.468750 -38.102679C0.781250 -38.415179 1.160714 -38.571429 1.607143 -38.571429L8.571429 -38.571429L8.571429 -45.535714C8.571429 -45.982143 8.727679 -46.361607 9.040179 -46.674107C9.352679 -46.986607 9.732143 -47.142857 10.178571 -47.142857L13.392857 -47.142857C13.839286 -47.142857 14.218750 -46.986607 14.531250 -46.674107C14.843750 -46.361607 15.000000 -45.982143 15.000000 -45.535714L15.000000 -38.571429L21.964286 -38.571429C22.410714 -38.571429 22.790179 -38.415179 23.102679 -38.102679C23.415179 -37.790179 23.571429 -37.410714 23.571429 -36.964286ZM23.571429 -36.964286"></path></svg>');
    }
    
    /*
    When the checkbox input is :checked we need to
    update the inline SVG to use a checkmark symbol
    */
    .checkbox-btn:checked + .checkbox-label:before {
        background-color: mediumpurple;
        background-image:
            url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="25.948661" height="19.888393" viewBox="2.025670 -40.011161 25.948661 19.888393"><path fill="white" d="M27.974330 -36.127232C27.974330 -35.680804 27.818080 -35.301339 27.505580 -34.988839L15.385045 -22.868304L13.108259 -20.591518C12.795759 -20.279018 12.416295 -20.122768 11.969866 -20.122768C11.523438 -20.122768 11.143973 -20.279018 10.831473 -20.591518L8.554688 -22.868304L2.494420 -28.928571C2.181920 -29.241071 2.025670 -29.620536 2.025670 -30.066964C2.025670 -30.513393 2.181920 -30.892857 2.494420 -31.205357L4.771205 -33.482143C5.083705 -33.794643 5.463170 -33.950893 5.909598 -33.950893C6.356027 -33.950893 6.735491 -33.794643 7.047991 -33.482143L11.969866 -28.543527L22.952009 -39.542411C23.264509 -39.854911 23.643973 -40.011161 24.090402 -40.011161C24.536830 -40.011161 24.916295 -39.854911 25.228795 -39.542411L27.505580 -37.265625C27.818080 -36.953125 27.974330 -36.573661 27.974330 -36.127232ZM27.974330 -36.127232"></path></svg>');
        border-color: mediumpurple;
    }


### The total cost container

We only need some very basic flexbox styling for our bottom "total" container:


    .total-cost {
        align-items: baseline;
        border-top: 1px solid lightgrey;
        display: flex;
        justify-content: space-between;
        margin-top: 40px;
        padding: 40px 20px 0;
    }
    .total-cost div {
        align-items: baseline;
        display: flex;
    }
    .total-cost span:nth-child(1) {
        align-self: flex-start;
        padding-top: 5px;
    }
    .total-cost span:nth-child(2) {
        font-size: 32px;
        font-weight: bold;
    }
    
    /*
    This input is used in our JavaScript - look at the
    function part of this post to understand why
    */
    .total-cost input {
        display: none;
    }


### Last but not least - mobile

Now we just ensure that on smaller devices our checkbox labels render nicely:


    @media(max-width:480px) {
        /*
        Avoids the inner label content from squishing together
        and becoming unreadable
        */
        .checkbox-label {
            align-items: flex-start;
            flex-direction: column;
            flex-wrap: wrap;
        }
        .checkbox-label span:last-child {
            padding: 10px 0 0 0;
        }
    }


That's it for the styling!

## The Function (JS)

As you can see below, we only need a very minor amount of JavaScript to accomplish our total cost "injection".


    window.onload=function(){
    
    // Place the default browser checkbox inputs into a variable
    var inputs = document.getElementsByClassName('checkbox-btn')
    
    // Now we loop through the inputs and check if they are
    // greater than zero. If so, we run our function.
    for (var i=0; i < inputs.length; i++) {
    
        inputs[i].onchange = function() {
    
            // Create `add` variable which takes the :checked input value
            var add = this.value * (this.checked ? 1 : -1);
    
            // We grab the current total value on our hidden input field and return it
            // as a floating point number
            // (since in this use case it will be a price number based on currency)
            var new_total = parseFloat(document.getElementById('output').value);
    
            // Now we simply add the existing total value with the newly ":checked" input value
            var updated_total = document.getElementById('output').value=new_total + add
    
            // Place the new updated total directly inside the `total-cost-inner` span element
            document.getElementById('total-cost-inner').innerHTML = updated_total;
        }
    
    }
    }


That's it! Feel free to play with the demo some more at the top of the post, or check out the [CodePen source directly](https://codepen.io/bradleytaunt/pen/rXWEpy).
