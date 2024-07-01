---
layout: post
title: "My Static Blog Publishing Setup and an Apology to RSS Subscribers"
date: 2022-03-21
---


In case you missed it, this website is now generated with pure HTML & CSS. Although, generated isn't the proper way to describe it anymore. _Written_ is a better description.

No more Markdown files. No more build scripts. No more Jekyll. Clean, simple, static HTML & CSS is my "CMS". More on that in a moment. First, I must apologize.

## I'm Sorry Dear RSS Subscribers

RSS feeds are tricky things for me personally. I always botch them with a site redesign or a re-structure of my previous posts. Those of you subscribed via RSS were likely bombarded with post spam when I rebuilt this website. Sorry about that - I know how annoying that can be.

Fortunately, that all stops today. Moving forward my RSS feed (Atom) will be edited manually with every new post I write. Each entry will feature the post title, post url, and post date. No summaries or full-inline content will be included (since that would involve a great amount of extra overhead). RSS subs will need to follow the link directly if they are interested in the article itself. I hope this doesn't anger too many readers...

Again, sorry everyone.

## What is this New Blog "System"

This publishing flow isn't for everyone and is less flexible than pre-existing static site generators (referred to as SSGs moving forward). For me though, it works. I find it more flexible than most SSGs.

There are a couple articles that explain the reasoning behind this system better than I could (plus, why would I repeat the same points?):

- [Writing HTML in HTML](http://john.ankarstrom.se/html/)
- [My stack will outlive yours](https://blog.steren.fr/2020/my-stack-will-outlive-yours/)

So, what does my blog-posting system look like?

## Simple Explanation

1. Copy an existing article's `HTML` file
2. Change file name, edit the page title, heading, post date and comment link
3. Write the new article content
4. Make manual new entry in RSS feed
5. Save changes, push to git repo
6. Sync new file(s) / changes to remote server

Pretty simple, eh? Let's break things down into greater detail though...

## Detailed Explanation

#### Text Editor

I code and write everything exclusively in Sublime Text on my MacBook Air. I know, it's not an open source editor, but I love how incredibly fast and intuitive it is. I used VSCode in the past but ended up requiring far too many plugins to get things setup the way I like it. Sublime Text works best for me even right out of the box. (I do need Emmet and theming changes though).

I perform the following for a new article:

- Copy an existing article, ie. `blog-post-1.html`
- Rename article file name, ie. `blog-post-2.html`
- Open this newly created file and change:
  - page `title` tag
  - page `h1` heading and top bar text
  - `time` tag to match publish date
  - comment `mailto:` link url
- Start writing content inside the `article` section

Once the article is complete, I add a static entry in my `feed.xml` and run a crude rsync script. More on that below.

#### Git

Normally I would pull, commit and push directly in my Terminal - but lately I've been enjoying my time using Sublime Merge. I'm a sucker for visually appealing GUI applications and Merge is the perfect balance of simplicity and beauty. I recommend it if you haven't tried it yet.

#### Hosting

This blog is now hosted through NearlyFreeSpeech. I could opt for a free service like Netlify or DigitalOcean Apps but I feel it's important to help support communities that align with my own core beliefs. From their [about page](https://www.nearlyfreespeech.net/about/):

> NearlyFreeSpeech.NET is about three things: fairness, innovation, and free speech.

Hard to argue with those principles. If you're feeling generous, I'd greatly appreciate anyone who considers contributing to [offset this website's hosting costs through NearlyFreeSpeech](https://www.nearlyfreespeech.net/contribute/tdarb.org) (code: tdarb). No money is directly handed to me, it pays NFS directly for hosting fees. Donate if you feel like this humble blog of mine has helped you in any way. No pressure!

NFS gives me server access via `SSH` (and even `SFTP` if I desire) which makes things simple to sync my local files with production code. This is handled via rsync with a basic `deploy.sh` script:


    rsync -vrzc --exclude 'deploy.sh' --exclude '.git' --delete ./ username@my.remote.nfs.server:


The included parameters ensure files with a conflicting checksum are updated on the server, instead of re-syncing all the files every time the script runs. That would be overkill.

## Closing Thoughts

I love this new setup. It's portable, lightweight, has zero dependencies, and gives me the opportunity to write directly in HTML. Others may find this workflow idiotic or cumbersome but I couldn't disagree more. Site wide changes can be made with simple `Find/Replace` actions or even whipping up a basic script. Things should be as complex as you wish to make them!

At the end of the day, anything that helps you be more efficient and gets you producing more content is a winning strategy in my book. Who knows, this concept could even inspire one random reader out there to do the same.
