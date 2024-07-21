# Fixing Jekyll's dart-sass Dependency on OpenBSD

2024-06-30

I recently wrote about [working with multiple Ruby versions on OpenBSD](https://btxx.org/posts/Building_rbenv_on_OpenBSD_7.5/) which still works just fine, but I noticed a bug when trying to build a couple of my Jekyll projects locally:

    NotImplementedError: dart-sass for x86_64-openbsd7.5

For reference, these projects are being built with Ruby 3.3.0 against Jekyll 4.3.3. After doing some research, I came across this ticket that was somewhat buried in the search results: [https://github.com/jekyll/jekyll/issues/9493](https://github.com/jekyll/jekyll/issues/9493)

The issue *seems* to be caused by the lack of the `dart-sass` gem in OpenBSD. Luckily there is a fairly easy fix - we just need to hard-set the `jekyll-sass-converter` version in our `Gemfile`:

    gem 'jekyll-sass-converter', '~> 2.2'

After making this change and running `bundle install` again, my Jekyll projects started building (and serving) perfectly! Hopefully this helps others trying to build their own Jekyll projects on OpenBSD.
