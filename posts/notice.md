# RE: Creating a Simple HTML/CSS Notice Box

2022-09-22

I recently read Kev Quirk's post, [How to Create a Simple HTML/CSS Notice Box](https://kevquirk.com/how-to-create-a-simple-html-css-notice-box/) and loved the simplicity of it. I'm a sucker for using pseudo elements in creative ways but still managing to make them useful. Of course, this got me thinking as to whether or not the same style of box could be achieved *without* the use of static, pseudo elements...

## Bad Semantics

I need to make it clear right away: **these implementations are not semantic**. They are valid HTML, but I am technically using these tags incorrectly. *You have been warned!*

## Setting Fieldsets

The first approach is to wrap everything inside HTML `fieldset` tags:


    <fieldset>
        <legend>Notice</legend>
        <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Totam nihil velit vitae sed beatae earum assumenda deleniti, inventore repellendus, sequi distinctio delectus porro explicabo quidem hic quo quasi voluptas temporibus.</p>
    </fieldset>


Then you can include minor styling to closely match the design of Kev's notice box:


    fieldset {
        border: 3px solid;
        font-family: sans-serif;
        padding: 30px 10px 10px;
        position: relative;
    }
    fieldset legend {
        background: #AACCFF;
        border-bottom: 3px solid;
        border-right: 3px solid;
        left: 0;
        margin: 0;
        padding: 5px 10px;
        position: absolute;
        top: 0;
        text-transform: uppercase;
    }


## The Devil is in the Details

The other option is utilizing the HTML `details` tag:


    <details open>
        <summary>Notice</summary>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Assumenda sequi esse reprehenderit facilis aperiam labore optio minus doloremque nesciunt! Voluptatem esse tempore asperiores recusandae rerum facere, reiciendis officia repudiandae similique?</p>
    </details>


You'll obviously want to include the `open` attribute to avoid users needing to toggle the content manually (unless that is your desired UX). Then add similar styling options to match the `fieldset` example:


    details {
        border: 3px solid;
        font-family: sans-serif;
        padding: 0 10px 10px;
    }
    details summary {
        background: #AACCFF;
        border-bottom: 3px solid;
        border-right: 3px solid;
        display: inline-block;
        margin-left: -10px;
        padding: 5px 10px;
        text-transform: uppercase;
    }


Important to note: you can hide the default "arrow toggle" on `summary` elements by including the following:


    details > summary {
    list-style: none;
    }
    details > summary::-webkit-details-marker {
    display: none;
    }


## Seeing is Believing

I've put together two versions of each implementation (one custom designed and one using default browser styling). You can check them out in the CodePen below:

[Live CodePen Example](https://codepen.io/bradleytaunt/pen/jOxLdQP)
