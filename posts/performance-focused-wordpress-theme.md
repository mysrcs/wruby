# Create a Performance-Focused WordPress Blog

2021-09-08

With my recent switch back to WordPress, and having read Kev Quirk’s <a href="https://kevq.uk/core-web-vitals-and-wordpress/" target="_blank" rel="noreferrer noopener">latest post about Core Web Vitals</a>, I wanted to make sure my blog still prioritized speed and performance above all else. I’m happy to say that I have closely replicated the same speed of my original *static* Jekyll-based version of this blog.

And I've achieved this with barely any effort at all. All that's needed is: 

- a lightweight WordPress theme
- two free WordPress plugins
- cheap &amp; fast web hosting

Let me breakdown each component so those of you interested can do the same without hitting any roadblocks.

## Choosing Your WordPress Theme

Selecting an existing theme or trying to build your own can be a daunting experience. For my needs, I forced myself to find an existing theme and just run with it. This gives me more time to focus on writing instead of constantly tweaking the blog’s visuals.

I would suggest either using the default starter theme (as of this writing: Twenty Twenty One theme by Automattic) or looking for specific “lightweight” themes across the web. I highly recommend checking out Anders Norén’s [theme collection](https://andersnoren.se/teman/). Others can be found on the official [wordpress.org](https://wordpress.org/) website.

## Two Simple Plugins

Once you have decided on a theme, you'll also want to be sure to install two very important plugins that greatly help with performance:

1. Jetpack Boost – [wordpress.org/plugins/jetpack-boost/](https://wordpress.org/plugins/jetpack-boost/)
2. Yoast SEO – [wordpress.org/plugins/wordpress-seo/](https://wordpress.org/plugins/wordpress-seo/)

## Jetpack Boost

This plugin is fantastic. Not only will it run a proper audit (based off Google’s Lighthouse tool) but also gives you the ability to activate optimized CSS, lazy image loading and deferring non-essential JavaScript (if applicable). All of this is done in a super-clean user interface directly inside your WordPress admin.

Check out my own testing site metrics below:

<figure>
    <img src="/public/images/jetpack-boost.webp" alt="Jetpack boost numbers">
    <figcaption>The Jetpack Boost metrics for this website (and yes, that 99 score for mobile kills me)</figcaption>
</figure>

## Yoast SEO

If you’ve worked with WordPress at all you have surely heard of Yoast. Adding this plugin to your site is really a no-brainer. The automatic generation of meta data and SEO tags can save you a lot of time while also improving your overall Lighthouse score.

Here is the Lighthouse audit for the test WordPress website:

<figure>
    <img src="/public/images/ugly-duck-audit.webp" alt="Lighthouse audit">
    <figcaption>It might not be perfect, but it’s pretty damn close!</figcaption>
</figure>

Those scores were achieved without any custom work on my end – I simply activated the plugin and let it work it’s magic. Great stuff.

## Host Everything on EasyWP

Up to this point we haven’t spent a single penny. Unfortunately, web hosting isn’t free and you’re going to need it if you actually want your website to have a home on the interwebs!

I know – I can hear your collective voices shouting out:

> Isn't web hosting a little expensive just for my simple hobby blog/site?
>
> -- <cite>Some of you</cite>

I host this test blog for just **$3.88/month** and the service is actually good. Unreal, right? That’s the price of a medium coffee, so I’m pretty sure it won’t break the bank.

This “cheap” hosting is through EasyWP and the Starter plan ($3.88/month) comes with the following:

- 10 GB SSD storage
- 50k visitors/month
- Unlimited bandwidth
- Backups (though not automatic)
- SFTP access
- EasyWP Cache plugin (and it's actually good!)

You will need to snag your own SSL certificate though, but this is easily obtained with something like [letsencrypt.org](https://letsencrypt.org).

Best of all, if in the future you require more features the next pricing tier is still only $7.88. Not too shabby!

## Try Yourself

The fact that EasyWP gives you a free month trial, there really is no reason not to try spinning up your own blog or online store or whatever the heck you want to build. The more people with personal spaces on the web the better.
