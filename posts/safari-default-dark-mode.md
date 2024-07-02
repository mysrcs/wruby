# Dear Apple, Please Fix Safari's Default Dark Mode Link Color

2022-04-18

Supporting dark mode on the modern web falls under the realm of accessibility and should not be ignored. It is important and helps keep the visual flow of your content to match that of your users' operating system UI. Not to mention, it's easy to implement and keep consistent across browsers.

## Support Dark Mode with Zero CSS

A common practice is to include a `@media` query via CSS to target styling changes based on whether `dark-mode` is active. I tend to believe this is overkill for basic websites. Many developers aren't aware of the HTML `color-scheme` parameter. (This website itself is using it in place of CSS media queries)

### HTML "color-scheme"

Adding the following meta tag inside your document's `head` element, you can enable dark mode instantly with zero configuration:


    <meta name="color-scheme" content="dark light" />


There are minor caveats:

1. You should not be specifying any `background` styling to your `body` or `html` elements
2. You should be not specifying any `color` styling across any of your readable content (paragraphs, headings, lists, blockquotes)

That's it! In case you were curious, all major browsers support this color scheme meta tag: [https://caniuse.com/mdn-html_elements_meta_name_color-scheme](https://caniuse.com/mdn-html_elements_meta_name_color-scheme)

## But Wait, What's This About Safari?

Even though by adding the color-scheme meta tag we get ourselves good dark mode support across all browsers - Safari has one big oversight: link color. Take a look at the comparison screenshots below (based on one of my older articles). The first one is taken in Firefox, the second in Safari:

<figure>
<img src="/public/images/firefox-dark-mode.webp" alt="Firefox dark mode example">
<figcaption>Firefox's default dark mode link color</figcaption>
</figure>

<figure>
<img src="/public/images/safari-dark-mode.webp" alt="Safari dark mode example">
<figcaption>Safari's default dark mode link color - yuck!</figcaption>
</figure>

Luckily for us there is a simple solution using minimal amounts of CSS[^1]:


    @supports (color-scheme: dark light) {
        @media screen and (prefers-color-scheme: dark) {
            a:link {color: #9e9eff;}
            a:visited {color: #d0adf0;}
            a:active {color: red;}
        }
    }


We are brute-forcing Safari to implement the same color HEX codes used by both Firefox and Chrome browsers. How a horrible accessibility oversight could happen within a company as large as Apple is astounding...

## Apple: Fix Your Browser's Dark Mode

My hope if that even one Safari design or development team member stumbles across this article and raises this ticket to the rest of the team[^2]. It's an unbelievably easy fix and would save developers the headache of overriding these things ourselves.

Thanks for reading and happy dark mode to you all!

## Refs

1. Special thanks to [Seirdy](https://seirdy.one/) for suggesting the use of :link and :active support. I recommend you check out his take on [dark mode / theme support](https://seirdy.one/2020/11/23/website-best-practices.html#dark-themes).
2. This has an open ticket through [Webkit Bugzilla](https://bugs.webkit.org/show_bug.cgi?id=209851)
