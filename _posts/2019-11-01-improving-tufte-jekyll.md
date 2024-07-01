---
layout: post
title: "Improving Tufte CSS for Jekyll"
date: 2019-11-01
---


After creating the ET-Jekyll theme almost two years ago, I finally got around to revamping the structure and improving a lot of minor performance issues. Items that have been surely needing of updates for the last couple of years.

## Introductions

I've always been a sucker for Edward Tufte's incredibly simple, yet powerful design work used in his books and handout projects. So, in 2018 I released a Tufte CSS inspired Jekyll theme for the open source community. I called it [ET-Jekyll](https://et-jekyll.netlify.com) (so original, I know). Tufte CSS was a great starting point for my Jekyll theme, but there were areas I thought could use some minor improvements.

Feel free to read all the details on the design here: [ET-Jekyll theme details](https://et-jekyll.netlify.com/et-jekyll-theme/)

## Minor Fixes One Year Later

When I finally circled back to this project recently, I noticed some minor issues that could be improved right away with little to no effort. Let's see the changes made at a glance:

- Sidenote, marginnote and figure element restyling (flexbox)
- Table styling fixes (right alignment issues)
- Switch MathJax over to SVG embeds (performance fixes)
- Simplify HTML skeleton of main pages, remove overkill classes
- Remove lazysizes.js to save on load times
- Fallback on font-display for font loading
- Inline all CSS for faster initial paint
- Minor link :hover coloring (accessibility)
- Add missing image link on example page
- Update details post structure

You can view all the updates in more detail [here](https://github.com/bradleytaunt/ET-Jekyll/commit/254f9e8f28764c9525ba7405bbbfa18a3867d241).

**So what did this accomplish?** Let's break it down below.

## First Contentful Paint & Input Delay

The new improvements have netted the theme a savings of 300ms on first paint and reduced the input delay by 150ms. Small wins - but wins nonetheless since every millisecond counts.

<figure>
    <img src="/public/images/tufte-first-paint.webp" alt="First paint comparison" />
    <figcaption>First contentful paint savings: 300ms (<a href="/public/images/tufte-first-paint.webp">direct link to image)</a></figcaption>
</figure>

<figure>
    <img src="/public/images/tufte-input-delay.webp" alt="Input delay comparison" />
    <figcaption>Reduction in input delay: 370ms down to 220ms (<a href="/public/images/tufte-input-delay.webp">direct link to image</a>)</figcaption>
</figure>

## Fixing Render Blocking Items

The original theme reported a few items that were slowing down the initial render for the end-users:


| URL | Size (KB) | Savings (ms) |
|-----|------|---------|
| /css/style.css | 2.0 | 150 |
| /lazysizes@4.0.1/lazysizes.js | 5.0 | 960 |
| MathJax.js?config=TeX-MML-AM_CHTML | 18.0 | 1,260 |


These items were resolved by:

- Rendering all styling inline (therefore removing the extra HTTP request)
- Removing the lazysizes library altogether (browsers plan to support lazy loading natively in the future)
  - The future plan is to integrate something like Cloudinary for out-of-the-box image processing
- Switch over MathJax to render equations as embedded SVGs (saves on bandwidth rendering an entire extra typeface)

## Lighthouse Numbers

Though it might not look like much, the updated theme receives a 4-point boost to its performance rating during a Lighthouse audit. Having a perfect score would be even better, but I can settle for 2-points under (for now).

#### Old Version


| Performance | Accessibility | Best Practices | SEO |
|---|---|---|---|
| 94 | 100 | 100 | 100 |


#### New Version


| Performance | Accessibility | Best Practices | SEO |
|---|---|---|---|
| 98 | 100 | 100 | 100 |


## Final Thoughts

This project could still use some more fine-tuning, but for now I'm fairly happy with the outcome. Even the smallest boost in performance and rendering time makes me feel like I accomplished something worthwhile. 

Please don't hesitate to suggest features or point out any issues you happen to stumble across if you plan to use ET-Jekyll. Thanks for reading!
