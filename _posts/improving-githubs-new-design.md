# Improving Github's New Design

2020-07-07

Like many other Github users, I am not a big fan of their recent repository page redesign. In my mind it seems like a change just for the sake of change - the original UI worked perfectly fine.

_Sigh._

I was planning on recreating the original Github layout with custom CSS but decided against it. Tackling such a big change in design would cause headaches if Github ever changed even one simple class or id on a given element. My final conclusion was to just improve their new design with my own personal quality of life improvements.

So, enough chit-chat. Let's get into it.

## Current Design (2020)

The default view for a repo's homepage and ticket items are locked at a set `max-width`. This causes some visual strain in comparison to the full-width headers and navigations directly above. I use a decently sized montior when using your app Gitub - **let me use all the space available to me**!

<figure>
<img src="/public/images/github-design-current.webp" alt="Current Github design">
<figcaption>The current design of a repo's homepage. (<a href="/public/images/github-design-current.webp">direct link to image</a>)</figcaption>
</figure>

<figure>
<img src="/public/images/github-ticket.webp" alt="Github ticket design">
<figcaption>The current design of a ticket item (<a href="/public/images/github-ticket.webp">direct link to image</a>)</figcaption>
</figure> 

## My Improvements

Your users shouldn't have to jump around the page looking for the important information they want to see. Resetting the basic repo information to the left side of the screen allows user to _instantly_ read-up on the project details. (This design is catered towards left-to-right readers mind you).

We now also utilize all the available screen space, dependent on the user's browser window size.

<figure>
<img src="/public/images/github-design-current-redesign.webp" alt="Current Github redesign">
<figcaption>The repo's homepage now uses all available space (<a href="/public/images/github-design-current-redesign.webp">direct link to image</a></figcaption>
</figure>

We make similar updates to the ticket item view and also remove the out-of-place `margin-bottom` from the project link headers.

<figure>
<img src="/public/images/github-ticket-redesign.webp" alt="Github ticket redesign">
<figcaption>Github ticket items now align better with their header siblings (<a href="/public/images/github-ticket-redesign.webp">direct link to image</a>)</figcaption>
</figure> 

## Try It Yourself!

You can very easily implement these custom CSS changes with an extension for the browser of your choice:

  * Firefox: [Stylus](https://addons.mozilla.org/en-US/firefox/addon/styl-us/)
  * Chrome: [Stylebot](https://chrome.google.com/webstore/detail/stylebot/oiaejidbmkiecgbjeifoejpgmdaleoha)

Then create a new custom CSS file to target `github.com` with the following properties:


    .container-xl {
        max-width: 100%;
    }
    
    .repository-content .gutter-condensed.gutter-lg {
        flex-direction: row-reverse !important;
    }
    
    .repository-content #discussion_bucket .gutter-condensed.gutter-lg {
        flex-direction: row !important;
    }
    
    .repohead > div.d-flex {
        margin-bottom: 0 !important;
    }
    
    #show_issue {
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
    }
    
    .repository-content #discussion_bucket,
    #partial-discussion-header {
        width: 100%;
    }


That's it! Feel free to improve on this and further make it your own! I might create a new repo for this project if I end up adding even more improvements to the core CSS.
