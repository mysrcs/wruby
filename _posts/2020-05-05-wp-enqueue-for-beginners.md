---
layout: post
title: "WP Enqueue for Beginners"
date: 2020-05-05
---


Throughout my career designing, developing and auditing WordPress themes, I've come across many that include their custom styles / scripts as static HTML elements inside their respective `header` and `footer` templates. This is perfectly _fine_, but there is a cleaner way to include these files.

This post is purposefully catered for WordPress beginners, so if this seems overly simple, then you're probably already developing WordPress themes that utilize these techniques. (Which is awesome!)

## Introducing WP Enqueue

The description of Wp Enqueue from the WordPress documentation:

<blockquote class="wp-block-quote">
  <p>
    Registers the style [script] if source provided (does NOT overwrite) and enqueues
  </p>
</blockquote>

In a nutshell: Placing a `wp_enqueue_script` or `wp_enqueue_style` script in the `functions.php` of your custom theme tells WordPress to pull external files into the header or footer of your website. Best practice being: _styles into the header, scripts into the footer_.

I suggest you read the official documentation for more details: [wp\_enqueue\_script](https://developer.wordpress.org/reference/functions/wp_enqueue_script/) and [wp\_enqueue\_style](https://developer.wordpress.org/reference/functions/wp_enqueue_style/).

## Enqueue Stylesheets

The default script to enqueue a CSS stylesheet:


    wp_enqueue_style( $handle, $src, $deps, $ver, $media );


- `$handle` - the name associated with your stylesheet
- `$src` - URL pointing to the directory of the stylesheet itself
- `$deps` - An array of any other stylesheets needed as dependencies
- `$ver` - The version number of the stylesheet (used for cache busting)
- `$media` - Specify media type (`all`, `print`, `screen`, etc.)

So, with all those parameters in mind, here is what a standard default enqueue of a CSS stylesheet looks like:


    wp_enqueue_style( 'google-fonts', 'https://fonts.googleapis.com/css?family=Montserrat:200,300,300i,400,600,700,800,900', '', '1.0', '');


In this example we have rendered the following:

- `$handle`: google-fonts
- `$src`: https://fonts.googleapis.com/css?family=Montserrat:200,300,300i,400,600,700,800- 0
- `$deps`: Null (left blank)
- `$ver`: 1.0
- `$media`: Null (left blank)

**Important:** Keep in mind that the `wp_enqueue_style` script will render the stylesheet link into the WordPress header automatically.

## Enqueue Scripts

The default script to enqueue an external JS file:


    wp_enqueue_script( $handle, $src, $deps, $ver, $in_footer );


- `$handle` - the name associated with your script
- `$src` - URL pointing to the directory of the script itself
- `$deps` - An array of any other scripts needed as dependencies
- `$ver` - The version number of the script (used for cache busting)
- `$in_footer` - Set whether the script is loaded in the `<head>` or just before the `</body>`

With all those parameters in mind, here is what a standard default enqueue of a Javascript file looks like:


    wp_enqueue_script( 'bxslider', get_template_directory_uri() . '/js/bxslider.js', array('jquery'), '1.0.0', true );


In this example we have rendered the following:

- `$handle`: bxslider
- `$src`: get\_template\_directory_uri() . /js/bxslider.js'
- `$deps`: array(jquery')
- `$ver`: 1.0.0
- `$in_footer`: True (_places script before closing body tag_)

## Packaging Everything Together

Now that we have the custom stylesheet and script ready to be loaded into our custom WordPress theme, we just need to properly package them together as a function in our `functions.php` file:


    // Add styles and scripts to the header/footer
    function custom_enqueue_scripts() {
            wp_enqueue_style( 'google-fonts', 'https://fonts.googleapis.com/css?family=Montserrat:200,300,300i,400,600,700,800,900');
            wp_enqueue_script( 'bxslider', get_template_directory_uri() . '/js/bxslider.js', array('jquery'), '1.0.0', true );
    }
    
    add_action( 'wp_enqueue_scripts', 'custom_enqueue_scripts');


That's it! Hopefully this helps prevent WordPress newbies from statically rendering their external CSS and JS files directly in template files. Let WordPress do that for you!
