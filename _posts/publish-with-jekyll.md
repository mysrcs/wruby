# Publishing Simple Books With Jekyll

2019-06-20

When thinking about writing, designing and ultimately publishing an ebook, most people don't think of using a static site generator. Having products like Amazon Publishing, LaTeX or even Microsoft Word available, why should you use Jekyll?

Two reasons:

- extremely easy to use
- total customization

I know these same arguments could be made towards the other options mentioned above, but I'm biased towards Jekyll since I love the simplicity of HTML and CSS. Hopefully, after reading this post, you will feel the same as well!

## No developer skills needed

You won't need any hardcore development skills or in-depth knowledge of Jekyll to get the most out of this publishing technique. The theme ([Jekyll Book Theme](https://github.com/henrythemes/jekyll-book-theme))  will allow you to focus on your book's content rather than wrestling with typography and page layouts. A basic command line script will perform all the heavy lifting for us at the end.

## What are we creating?

You can see the demo of the *online* and PDF versions of the book below: 

- [Jekyll Book Theme (Website)](http://henrythemes.github.io/jekyll-book-theme/)
- [Jekyll Book Theme (PDF Sample)](/public/jekyll-book-theme-sample.pdf)

So without wasting anymore time, let's get started!

## Table of Contents

1. [Setup Jekyll](#setup-jekyll)
2. [Using the "Book" Jekyll Theme](#book-theme)
3. [Writing Chapters](#chapter-collections)
4. [HTML to PDF](#html-to-pdf)
5. [Closing Thoughts](#closing-thoughts)

<h2 id="setup-jekyll">1. Setup Jekyll</h2>

Before we can really do anything else, you will need to install and setup Jekyll. The best way to do so is by following the instructions on the official Jekyll website:

- [Installing Jekyll](https://jekyllrb.com/docs/installation/)

Run through the simple step-by-step installation instructions based on your operating system.

### Basic requirements

- Ruby version 2.4.0 or above
- RubyGems
- GCC and Make (in case your system doesn’t have them installed)

<h2 id="book-theme">2. Using the "Book" template</h2>

The example we will be referencing in this post is the open source Jekyll theme called "Jekyll Book Theme". This theme as been designed and optimized for publishing ebooks with Jekyll.

Simply following the instructions on the main README page of the [jekyll-book-theme repo](https://github.com/henrythemes/jekyll-book-theme).

**Important**: Take the time to edit the `title`, and `author` properties in the `_config.yml` file in the root directory. Make sure these reflect your own book's content.

That's it. Now let's tell Jekyll how we want it to format our chapters.

<h2 id="chapter-collections">3. Working with chapter collections</h2>

By default, Jekyll will look for latest posts in the `_post` directory. This is useful for blogs and basic static websites - but not for us. We want chapters.

### Using custom collections

Thankfully, Jekyll is flexible and allows us to set our own custom "collections". Collections are ways to group related content together for easier use dynamically. Our plan is to setup a collection that will house our chapter markdown files in numeric order. You can see this in the "book" template top level directory. It should look like the following:

- `_chapters`
  - `01.md`
  - `02.md`
  - `03.md`
  - `etc..`

### But the template already has this setup

By default the Jekyll Book Theme template has this chapters collection implemented and working as intended. The reason I broke it down step-by-step is so that you can have some better understanding about what is happening "under the hood". 

Teach a person to fish and all that jazz.

Now all you need to do is break your chapters down into their own numbered markdown files inside `_chapters`.

<h2 id="html-to-pdf">4. HTML to PDF</h2>

![Publishing with Jekyll](/public/images/publishing-with-jekyll.webp)

Before you can convert your digital book "website", you need to install the `wkhtmltopdf` package. Download and follow the instructions below:

- [wkhtmltopdf](https://wkhtmltopdf.org/)

### Command line conversion

In your terminal, navigate inside the `_site` folder of your jekyll build and then run the following command:


    for f in *.html; do wkhtmltopdf -g -s Letter --no-background "$f" "${f/_*_/_}.pdf";done


Shortly after you should have a generated PDF file inside the `_site` folder - most likely named `index.html.pdf`. That's it! Enjoy your fully formatted PDF version of your book!

<h2 id="closing-thoughts">5. Closing Thoughts</h2>

There are a good amount of pros and cons to this approach of "publishing" PDF versions of your book. Since I'm a sucker for *good* and *bad* bullet lists, let's do just that:

**The Good**

- Online version and PDF versions share same styling (keeps things consistent)
- Chapters are written in `markdown` (increased flexibility of writing apps etc.)
- Very fast and streamlined build process
- PDF format renders out the chapter headers for built-in navigation

**The Bad**

- Chapters are spit out as one long, single page (I'm sure this could be rectified with some custom work)
- More suited for short stories, papers, essay articles (not so great for epic novels)
- I'm sure there are other cons I am missing?

In the end, using something like LaTeX would certainly grant the user more flexibility in design and layout of the final "print" PDF product - but I'm a sucker for using Jekyll when I can. 

Please let me know if you decide to use this method and end up publishing your own book 😀 I would love to check it out!
