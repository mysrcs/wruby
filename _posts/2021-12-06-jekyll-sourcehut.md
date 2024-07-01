---
layout: post
title: "Hosting a Jekyll Site on Sourcehut"
date: 2021-12-06
---


I recently decided to switch my personal, static site's hosting from Netlify to [sourcehut pages](https://srht.site). The process went *fairly* smoothly with only a couple minor hiccups; nothing rage-inducing. After everything was up and running smoothly, I figured writing out a step-by-step tutorial might help others who are thinking of doing a similar switch (or looking to host their first static site).

But first, let me briefly explain why I made the switch in the first place...

## Why sourcehut pages?

Using Netlify as your static host is simple, intuitive and comes packed with a great deal of extra functionality you can easily add-on. So, why would I decide to switch over to sourcehut? The best answer comes directly off the main homepage of [sourcehut.org](https://sourcehut.org):

- Absolutely no tracking or advertising
- All features work without JavaScript
- Many features work without an account
- The fastest & lightest software forge
- 100% free and open source software

After realizing all that, it's pretty difficult to stick with Netlify's *proprietary* stack...

## Free but not *"free"*

I should note that using sourcehut pages *does* require you to be a contributing (read: paying) member on the platform. I'm a cheapo and selected the $2/month option but you might be inclined to donate more. Paying this "fee" is perfectly fine for me, considering the hosting quality (speed and storage) it affords me. It also doesn't hurt that I get the "feel good vibes" of supporting an important, open source product.

Keeping that in mind, let's get into setting up our static site!

## Setting up your repo locally

1. Create a new account on [sourcehut](https://sourcehut.org) (or log in to an existing one)
2. Setup your billing to contribute monthly (tier amount is up to you)
3. Create a new repo under the **git** section[^1]
4. Connect this repo locally (as you would via any other git host)
5. In this new local directory, place all your Jekyll files as you would with any other static hosting provider

## The sourcehut build file

In order to have your Jekyll site build and push the correct files live, you will need to use sourcehut's build system. This will run every time you push out a new change to your repo (new blog post, page content changes, styling updates).

To make things easier, you can copy the build file below (remember to use your *own* information for usernames, git repo naming etc):


    image: debian/stable
    oauth: pages.sr.ht/PAGES:RW
    packages:
    - ruby-full
    - ruby-dev
    environment:
    site: yourusername.srht.site
    sources:
    - https://git.sr.ht/~yourusername/your-repo-name
    tasks:
    - install-bundler: |
        sudo gem install bundler
    - build: |
        cd your-repo-name
        bundle install
        bundle exec jekyll build
    - package: |
        cd your-repo-name/_site
        tar -cvz . > ../../site.tar.gz
    - upload: |
        acurl -f https://pages.sr.ht/publish/$site -Fcontent=@site.tar.gz


Save this file as `.build.yml` and place it in the root directory of your Jekyll source code.

Then, you just need to push your changes to the repo. If everything was setup properly, you'll be able to see your live site at `https://yourusername.srht.site` (just give it a little bit of time to run the full build process)

## Custom Domains

If you're like me and want to use your own custom domain - have no fear! This process is actually quite easy.

First, add a new A Record through your domain provider:


    @ IN A 173.195.146.139


Then change the following `environment` parameter inside your existing `.build.yml` file:


    environment:
    site: yourcustomdomain.com


And that's it - custom domain set! If you run into any issues check out the [official documentation on custom domains](https://srht.site/custom-domains).

## Wrapping Up

Hopefully this helps to streamline the process for others to host their static sites through sourcehut. Having open and healthy competition among host providers and `git` workflows is essential to avoiding vendor lock-in. 

Even low-effort support for open-source products (like where you host your static site or FOSS projects) can go a long way. Just some food for thought.

[^1]: Thanks to [McSinyx](https://cnx.srht.site/) for pointing out that the repo used for creating your website can be named anything (instead of defaulting to your sourcehut username)
