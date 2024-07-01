---
layout: post
title: "Using Netlify for Dynamic URL Redirects"
date: 2021-12-03
---


With the [recent domain switch](/minor-website-changes/) that took place on this website, I needed to have a dependable setup to forward my old domain URLs to the new one. While using something like "URL forwarding" through your domain provider could work, it doesn't natively support *dynamic* linking. Let me explain using a basic example:

- A user clicks on a link that targets a post on your old domain:<br> `olddomain.com/random-post`
- You want that link to forward using the same permalink structure:<br> `newdomain.com/random-post`
- "URL forwarding" through your domain provider **does not** support this

Simple stuff. So, let's breakdown how to easily set this up on Netlify *for free*.

## Setting Up Netlify

- Create an account (or login to an existing one) and setup a new site[^1]
- Change your "old" domain name nameservers to match Netlify's (normally done through your domain register)
  - `dns1.p03.nsone.net`
  - `dns2.p03.nsone.net`
  - `dns3.p03.nsone.net`
  - `dns4.p03.nsone.net`
- Back in Netlify: under **Domain Settings** you need to add your custom "old" domain under the **Custom domains** section under **Domain management**
- Lastly, add the following content inside a `_redirects` file (no extension) to your website content/build (changing to your own domains, of course)


    https://olddomain.com/* https://newdomain.com/:splat 301!


That's it! Now Netlify will dynamically forward all your pre-existing URLs from your old domain to the new one. No pesky `.htaccess` files or running your own basic web server(s)!

Hopefully this helps others trying to dynamically redirect their domains without the headache.

[^1]: I normally set this up through Github / git hosting
