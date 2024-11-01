# The Wonders of Text Ellipsis

2016-11-15

A common issue when working with constrained UI elements is text overflowing outside of it's parent or breaking into addition lines (thus breaking the layout).

This is most commonly seen with the direct and placeholder values for input fields on form elements. For example, the following input placeholder will be cutoff from the user's view:

[CodePen live example](https://codepen.io/bradleytaunt/pen/OgpzyY/)

Luckily, 3 simple CSS parameters can fix this.

    input::placeholder {
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

This allows the user to understand there is more content cut out from their current view. It's not ideal to ever have content overflowing outside of the parent container, but if you need to the best workaround is to use text-overflow.
