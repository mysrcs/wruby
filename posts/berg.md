# Hosting with Codeberg Pages

2022-07-29

I recently switched the [pblog](https://pblog.btxx.org) project repo over from Sourcehut to Codeberg (mostly for UX reasons) and it got me looking into [Codeberg Pages](https://codeberg.page). It seemed like a cleaner approach to host my personal blog on the same platform I planned to also share the source code.

I decided to share the setup process here since I couldn't find a straightforward guide explaining everything required to get going. So, let's dig in.

## Create the Repos

**Disclaimer**: My personal blog uses [pblog](https://pblog.btxx.org), so although these instructions will be catered towards that SSG the same concept *should* apply for any other generator (Jekyll, Hugo, Next, etc.).

The first step is to create the main repo that would house the core files of `pblog`. Then we need to make a separate repo simply called `pages`. This second project is where all the generated "static" files get rendered.

*Side note*: Be sure to at least include a `README` file in that `pages` repo. This will avoid any errors or warnings when setting up our submodules in the next steps.

## Configuration Edits

Once your two repos are created, you will need to make some minor edits to the `_config.sh` in the core `pblog` project to tell the build script where the generated files should go (in this case the `pages` repo):

~~~sh
OUTPUT="_output/pages/"
~~~


## The Submodule

Using terminal, navigate to the `_output/` directory in your core `pblog` project. Run the following, remembering to replace the USERNAME parameter with your own:

~~~sh
git submodule add git@codeberg.org:USERNAME/pages.git
~~~

If everything worked correctly you should now have a `.gitmodules` file in your main `pblog` project. If you get any errors, you might need to include the name of the directory at the end of the command:


~~~sh
git submodule add git@codeberg.org:USERNAME/pages.git pages
~~~

## The Workflow

Now you can make changes, add new posts and pages in the main `pblog` project and have those generated files render into your other `pages` repo. For this workflow, I simply push commits to both projects when I am happy with my changes but I'm sure you could look into automating this process (ie. a single push from the `pblog` repo forces a the `pages` repo to also update).

Now you can navigate to the standard Codeberg Pages URL to see it in action:

~~~sh
USERNAME.codeberg.page
~~~

If you want to use your own custom domain (who doesn't?) then continue reading.

## Custom Domains (Optional)

The first thing you will need to do is add a `.domains` file to your `pages` root directory. In this file you will want to list your custom domain on the first line, followed by the standard Codeberg pages URL below it. Like so:

~~~sh
yourcustomdomain.com
USERNAME.codeberg.page
~~~

I'm keeping this very basic, but I suggest you look further into the [official documentation](https://docs.codeberg.org/codeberg-pages/#custom-domains) if there are any extra settings you'd like to tinker with.

The final step is configuring a `CNAME` DNS setting through your registrar:

~~~sh
@ -> USERNAME.codeberg.page
~~~

Give the DNS settings a bit of time to take (24-48 hours) and you'll have your custom domain working just fine.

Happy hosting!
