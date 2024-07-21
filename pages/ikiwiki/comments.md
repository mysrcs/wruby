# Comments in ikiwiki

Content on this page is based off the discussions found here: [ikiwiki.info/tips/comments_feed/](http://ikiwiki.info/tips/comments_feed/)

You've enabled the comments plugin, so a set of pages on your blog can have comments added to them. Pages with comments even have special feeds that can be used to subscribe to those comments. But you'd like to add a feed that contains all the comments posted to any page. Here's how:

    \[[!inline pages="comment(*)" template=comment]]

The special PageSpec matches all comments. The template causes the comments to be displayed formatted nicely.

---

It's also possible to make a feed of comments that are held pending moderation.

    \[[!inline pages="comment_pending(*)" template=comment]]
