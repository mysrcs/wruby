# Schools Should Be Using Open Source Software

2022-05-30

I firmly believe that proprietary software has no business in any school environment. Educational institutions lean heavily on Windows systems in the name of "security" or "easier platform management". This approach forces students into using locked-down, closed sourced software applications.

Word, Excel, PowerPoint. Why have these become the "standard" of text manipulation and processing?

Photoshop. Illustrator. Why are these the first applications used for image editing and creation?

Schools should only be allowed to use and teach with open source software. Starting students off down the path of vendor lock-in is only beneficial to the companies building those software systems.


## The Internet

I'm an older fart, so my elementary school experience only included computers near the tail-end of mid-school. As such, it was forgivable to have students locked-in to using Internet Explorer (which would have been version 4 or 5 during my time) since there wasn't a great deal of competition.

The major problem is that IE/Edge is still the default and often times ONLY browser available in these classrooms. Again, I believe IT departments use the excuse of "security" to keep students on such dated browsers.

Firefox, anyone? LibreWolf? Pale Moon?

Any of these browsers can be easily managed and secured by school IT departments. It doesn't HAVE to be IE...


## Reducing Hardware Cost

By shifting towards a purely "open" software stack, schools then have the ability to purchase older, cheaper hardware. Instead of running bloated spyware (Windows) IT departments could opt to use any one of the lightweight Linux distros available.

This would reduce e-waste, save school districts significant amounts of money (no need to purchase Windows licenses or beefy hardware to be able to even _run_ the operating system) all while still maintaining a high level of user/network security.

Heck, you could even have a fleet of Raspberry Pi devices as your main student "computers". The cost of replacement also becomes less significant (these are children using these devices remember).


## Security

I briefly mentioned user and network security above but figured it deserved its own section. A great deal of push-back comes from stubborn IT professionals[^0] determined to keep things running on Windows - since this is mostly what they are familiar with.

My mother-in-law was an "at-risk" educator for most of her career. She explained to me that their IT department did a major switch over to use BRAND NEW Apple laptops for all the students just before her retirement. I can't even begin to imagine the cost associated with this change. Not to mention the cost of repair for any of these devices when (not if) damaged.

Who the hell is making these decisions? Even worse, who is approving them?! The school board had the opportunity to switch away from Windows devices and decided on Apple? Education reform is greatly needed[^1].


## What About The "Job Market"

I'm not ignorant to the fact that many businesses in the real world require familiarity with some of these more popular closed source applications (Word, Excel). I don't have a magic solution to instantly convert all applications used by the companies, but beginning the process in the education system is a solid start. Over time, the standard will _become_ these open platforms. The initial change just needs to be made.

It should also be mentioned that these open source applications carry over a lot of similar functionality to their closed-sourced counterparts. So it isn't as if a user with extensive LibreOffice experience would be utterly lost while using Microsoft Word.


## Looking Under the Hood

Another bonus in using fully open source software is the ability for the students to deep dive into the code itself. This can be a great resource for early programming fundamentals and beginner coding classes. Why not dissect the very program used in your other classes? Here's an example of a possible class project: students could build out their own plugins or extensions for an existing application!


## Suggested Alternatives

So what are these "open source" alternatives? Check out my simple suggestions below:

MS Office Suite ==> LibreOffice Suite[^2]

Photoshop ==> GIMP

Illustrator ==> Inkscape

IE/Edge ==> Firefox[^3]

Coding IDE (optional) ===> vim

You could easily expand upon these options, but for most elementary school task these are more than enough.

[^1]: Not _all_ IT workers in the school system fall into this category. But most of the underlining structure prevents them from changing much.
[^2]: At least in my country of Canada. I can't speak for others.
[^3]: `groff` would be my personal suggestion instead, since it helps introduce children into the structure of basic file formatting and "programming". I'll go into greater details about this in another post.
[^4]: As mentioned in the beginning of the post, I'd even suggest forks of Firefox -> LibreWolf or Pale Moon (if possible)
