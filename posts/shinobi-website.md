# This Site is Now a Shinobi Website

2022-05-13

**Update 2023**: this website is now built with [barf](https://barf.bt.ht)

- - -

My personal website is now an RSS-focused blog, generated from a collection of plain text files.

But before we get into greater details about the switch, let me first introduce the concept of a "shinobi website".

## The Shinobi Website Project

Instead of repeating myself in this post, feel free to read up about the project at the official site:

[https://shinobi.bt.ht](https://shinobi.bt.ht)

To summarize: by using a simple `shell` script I'm able to render all my plain text files (which is now how I solely write my articles) into a structured RSS 2.0 `xml` file. Subscribers can now consume my posts directly in their RSS reader of choice without the need to directly visit the article's URL.[^1]

## Why the Change?

I'm a hardcore minimalist at heart and have a tendency to make my own personal projects _leaner_ all the time. I also have been trying my best to find the most refined writing workflow to keep myself posting consistently (and hopefully keeping the quality high). My first iteration towards this step was switching over to hand-coding everything via HTML & CSS[^2]. That worked well - for a very brief time.

After recently launching the Shinobi project, I kept toying with the idea of switching my personal website over to use the same format. There was a heavy internal debate about ditching HTML in favour of plain text. What kind of impact would this have on both my site and audience? Would people be pissed about yet _another_ radical change?

After sleeping on it for a couple nights, I decide to say screw it. This is my personal website and it should ultimately reflect who I am and what I prefer. Dwelling too long on the opinion of others (as much as I respect any of you kind enough to follow along) can lead to decisions that negatively impact ones own well being.

So here we are. Blogging in plain text.

## Avoiding Link-Rot

I've manually added this blog post to my original `feed.xml`, in order to help inform those of you following that feed of this change. But this will be the last entry of that feed.

If you decide not to re-sub, I completely understand and thank you for your time! Those of you choosing to still follow along: welcome aboard a new adventure!

As for the older HTML-based articles, no worries. They will remain on this site under the standard `blog` directory so that old links don't break or cause conflicts. You can find that directory here:

[https://tdarb.org/feeds/posts.xml](https://tdarb.org/feeds/posts.xml)


## Tutorials and Demos

I will still be writing up detailed tutorials and interactive demos going forward - no need to worry. My plan is to link directly to a collaborative coding site like CodePen, etc. I haven't decided on the best option yet (want to keep things as easy for my readers as possible) so only time will tell what my decision will be.

Feel free to comment below if you have any suggestions! Preferably one that respects user privacy and advocates for a more open web.


## Speaking of Comments...

Since the old commenting system[^3] required me to manually add each comment individually, I assumed I would just do the same here. Then I got a hack-y idea. What if I used a mailing list linked through this website's sourcehut project?

It might not be the most user friendly or sustainable but I think it could be an interesting experiment at the very least!

Now each new article will have a link (which I will generate manually) that users can email directly to in order to share their comments. I have no idea how spam will work with this concept. This whole idea could blow up in my face. Only time will tell.


## Closing Thoughts

This workflow is clean and simple. It allows me to open a blank text file and instantly start writing. Once I'm happy with it, I run a simple shell command to update the RSS feed and sync it with my web server. Local testing is dead simple too since everything is set as `.txt`.

Some may like the concept of reading my new articles in their RSS reader, others might hate it. I've learned over the years that you can't please everyone.

Thanks for taking the time to read my jumbled thoughts.

[^1]: Users can _of course_ still visit the individual article `.txt` files in their browser, if they so wish.
[^2]: https://tdarb.org/blog/my-static-blog-publishing-setup.html
[^3]: https://tdarb.org/blog/poormans-comment-system.html
