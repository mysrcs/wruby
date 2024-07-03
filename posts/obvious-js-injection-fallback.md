# Obvious Javascript 'Injection' Fallback

2020-12-04

Sometimes websites and web apps might require content to be "injected" via Javascript. I should mention that I am strongly against this practice - but often this kind of thing is out of one's hands. So, the least I can do is setup these "injections" to have proper fallbacks for users who disable JS. You would be surprised how many developers build *empty* HTML elements with the assumption they will be filled via Javascript.

## Our Hypothetical Project

Let's pretend that we have a total tally that pulls in the number of current users using our fake SaaS app. We would do something like this:

### HTML

Here we create an empty `h2` tag that will update with the current number of users via js:

```html
<main>
    <h2 class="total-tally"></h2>
</main>
```

### Javascript

You'll have to use your imagination here and assume that the `totalTally` variable pulls in the numbers dynamically via API:

~~~js
var totalTally = "273,677" /* This would pull something dynamically in prod */
document.getElementsByClassName("total-tally")[0].innerHTML=totalTally;
~~~

## The Problem

The big issue we have now occurs when a user visits this page without JS enabled. The `h2` tag will remain empty and they won't see anything. I know this seems like a very avoidable issue, but you would be surprised how often it actually happens on the web.

## The (overly simple) Solution

The easiest way to avoid these types of empty tags - add static content. I know - mind blowing, right?

### HTML (updated)

~~~html
<main>
    <h2 class="total-tally">200,000+</h2>
</main>
~~~

You might be reading this and saying to yourself, "Wow! Thanks Captain Obvious!" and that's a fair reaction. This is an *obvious* demo on purpose. If even one single reader learns to avoid leaving empty HTML tags that are solely dependent on Javascript injection, then I'd say this demo was a huge success.

Rule of thumb: don't make assumption about your users. Play it safe.
