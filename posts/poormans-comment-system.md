# My Cheapskate Commenting System

2022-02-03

My blog now has comments! Well, *kind of*...

I went down a two day long rabbit-hole trying to find the best solution for implementing comments on my static website (generated via Jekyll FYI). There are a ton of options out there and many open source models that allow you to spin up your own instance with something like DigitalOcean or AWS. But I'm a cheap bastard. I refuse to spend $5/month on a blog mostly used for fun and one that I have zero incentive to "monetize".

So, what *free* options did this old miser have left to chose from? To my surprise, there were two solid options that initially caught my eye! Let's take a look then, shall we?

## Remarkbox

Overall I don't have many bad things to say about [Remarkbox](https://www.remarkbox.com). It looks nice, is easy to implement and runs a "pay what you can" pricing model. What more could you ask for?! The major issue (for me, *personally*) is precisely **that**; the free model. This makes it difficult for me to trust 100% that this system will still be around in 3-4 years. Now I know - even paid systems can shutdown unexpectedly, but I find free tier options end up shutting their doors sooner. There is an option to self-host Remarkbox, but that requires a yearly license and also comes back to the point I made about not wanting to pay for hosting...

## Utterances (Github-based)

The other major option was [Utterances](https://utteranc.es). This system was almost the winner due to it's pretty great feature set:

1. Open source
2. No tracking, no ads
3. All data stored in GitHub issues
4. Free!

But take a look above at point number three. The fact that readers wishing to leave a comment are **required to have a Github account**. For me, this is a non-starter. I don't want to force my audience to sign up for or sign in to *any* account just to leave a simple comment on my humble blog. Considering a number of my readers are part of the FOSS community, this just seemed like a bad fit.

## Finding Inspiration

I absolutely love the [solar.lowtechmagazine.com](https://solar.lowtechmagazine.com) website (both for it's content and design) and indirectly found my comment system inspiration there. Okay let's be honest, I completely stole their commenting system "concept". Imitation is the sincerest form of flattery, right?

## My Comment System is...

E-mail. It's just **plain e-mail**.

I've setup a basic `comment-prompt.html` in my `_includes` folder that contains a `mailto` action button[^1]:


    <a href="mailto:myemail.com?subject=RE: { { page.title | uri_escape } }">
        <button>Comment via email</button>
    </a>


This include template is placed at the bottom of every article automatically. Then, that action pulls in the article's title as the e-mail subject line in the user's default mailing app. That's it.

## Pros

- No third party application needed
- Privacy focused
- More direct interaction with my audience/readers
- Builds a much more close-knit community
- Completely free!

## Cons

- Must be manually curated and posted
- No notifications
- No "built-in" reply functionality
- Has the potential to become unwieldy...

## Fun Experiment

I figure either way, this will be an interesting experiment. I don't know my audience size (since I don't use any type of tracking) but I assume it's very small. Those willing to write me a personal e-mail in order to share their thoughts on my stupid little blog probably have something interesting to say. At least I hope so. 

Let's see how this thing goes...
