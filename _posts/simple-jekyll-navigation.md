# Simple Navigation Setup in Jekyll 3.9.0

2020-09-29

I have found that there is a lot of information on the internet in regards to setting up "dynamic" navigation in Jekyll. The problem I've noticed is that a good amount of these implementations are overly complex. Here is the simplest way that I tend to use when building out `nav` elements in Jekyll (3.9.0 as of this writing).

## Creating the Directories &amp; Files

In your Jekyll project, at the top level, you need to create a directory called `_data`. Inside this folder we will be creating a new file called `navigation.yml`. The contents of this file will contain all your navigation links and they are rendered like so:


    - title: Home
    url: /
    
    - title: Articles
    url: /articles/
    
    - title: About
    url: /about/


## Dynamically Rendering the Navigation

The next and final step is rendering out the navigation with a simple loop:


    {% for item in site.data.navigation %}
        <li>
            <a href="{{ item.url }}"><span>{{ item.title }}</span></a>
        </li>
    {% endfor %}


## Highlight Current Page

It's also very easy to extend this method to add a CSS class based on whether a user is on the currently selected page or not:


    {% for item in site.data.navigation %}
        <li>
            {% if item.url == page.url %}
            <a class="active" href="{{ item.url }}"><span>{{ item.title }}</span></a>
            {% else %}
            <a href="{{ item.url }}"><span>{{ item.title }}</span></a>
            {% endif %}
        </li>
    {% endfor %}



    /* Custom styling for active class */
    li a.active { color: red; }


Congrats! You now have fully functional, dynamic navigation on your Jekyll site.
