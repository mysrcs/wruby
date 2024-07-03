# Text Align: Justify

2019-05-22

The text-align property is fairly well known in the world of CSS, even among those just starting out with the language. Values such as `center`, `left` and `right` are used often with this property, but a more forgotten option is `justify`.

## What does justify do?

The MDN web docs define the `justify` value for `text-align` as such:

> The inline contents are justified. Text should be spaced to line up its left and right edges to the left and right edges of the line box, except for the last line.

### See it in action

[Live CodePen Example](https://codepen.io/bradleytaunt/pen/vwpmNz/)

## When should I use this?

It isn't always appropriate to use `justify` in most instances, although it becomes very useful for long form articles or blog posts. Since it takes a heavy influence from original *print* book layouts, the `justify` value helps improve readability for larger chunks of content.

**Fair warning**: it is best to remove any `justify` values when targeting smaller screen sizes. Mobile devices and/or tablets tend to be small enough to break up the content already. This CSS value is better suited for larger viewports.

## Browser support

The good news is that all major browsers support the `justify` value for the `text-align` CSS property. So have some worry-free fun with it!
