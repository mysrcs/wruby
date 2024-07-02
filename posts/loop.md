# Looping Through Jekyll Collections

2022-08-12

I recently needed to add a couple new items to my wife's personal recipe website ([cookingwith.casa](https://cookingwith.casa)) which I hadn't touched in quite a while. The Jekyll build still worked fine, but I realized I was statically adding each `collection` by hand on the main homepage[^1].

Not so good.

Of course, this wasn't difficult at all to fix. Now everything is much more "hands free" moving forward. I figured I would share the details here in the hopes that others mind find it useful. Plus, it's my blog - so I'll do what I want!

## Looping Our Collections

We want Jekyll to make things as streamlined as possible for us. This means that if I decide to add a new collection it will automatically render it along the others on the homepage.

Work smart not hard!

Let's take a look at the bare-bones collections loop:



    {% for collection in site.collections %}
        <!-- Our code goes here -->
    {% endfor %}



Then we need to include an `if` statement to avoid pulling in standard `post` items (or leave this in if that is desired):


    {% for collection in site.collections %}
        {% if collection.label != 'posts' %}
        {% endif %}
    {% endfor %}


Now for my specific use case, we want to display each collection label and then list its corresponding items below that label (see the `site[collection.label]` for reference)


    {% for collection in site.collections %}
        {% if collection.label != 'posts' %}
            <h2>{{ collection.label }}</h2>
            <ul class="recipe-list">
            {% for item in site[collection.label] %}
                <li>
                    <a href="{{ item.url }}">{{ item.title }}</a>
                </li>
            {% endfor %}
            </ul>
            <hr>
        {% endif %}
    {% endfor %}


That's it! Now if I plan to add any new collections down the line, I just need to include it in the `_config.yml` file and I'm set. The homepage will take care of the rest once rendered.

Enjoy looping through your Jekyll collections!


## Refs

1. Just the sections were statically rendered. All the recipes were pulled in dynamically - I'm not that insane!
