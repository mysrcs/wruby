# Styling Empty Table Cells

2019-07-17

Often when designing tables on the web you're bound to come across empty pockets of data. These will be rendered as "blank" table cells, which isn't always the intended outcome. Let's take a quick look at how to target and style empty table cells.

## The easy `:empty` way

The most popular way to target *any* empty element is by using - you guessed it - the `empty` pseudo-class. This pseudo-class is incredibly simple. You target an element's `empty` state that same way you would target `hover` or `active`:


    table tr td:empty {
        opacity: 0;
    }


Check out the CodePen examples below for more advanced styling options:

[Live CodePen Example 1](https://codepen.io/bradleytaunt/pen/EBBLEx/)

You can also include additional pseudo elements to give the user more context about what the empty cells represent:

[Live CodePen Example 2](https://codepen.io/bradleytaunt/pen/bPXqLa/)

## More specific `empty-cells` property

Although using the `:empty` pseudo-class can be helpful, it isn't used just for tables. It can be used for any HTML elements that have a lack of content. So, is there a CSS specific property that can target *just* table cells? 

Let's take a look at the `empty-cells` property:


    table {
        empty-cells: hide;
    }


[Live CodePen Example 3](https://codepen.io/bradleytaunt/pen/XLLqOW/)

Pros of using `empty-cells`:

- Only one CSS property
- Targets the table elements specifically
- No need for custom styles since it simply *hides* empty cell borders

Some downsides to using this property:

- No styling customization
- Trickier to use pseudo-element helpers without invoking the `:empty` state

## Pick your preference

It doesn't matter semantically which option you decide to take when styling / hiding empty table cells. Using the `:empty` state gives you a lot more flexibility in terms of what you can target (full rows, columns etc), but using the `empty-cells` property let's you simply hide the cells and focus on more important items.
