# Clickable Links Inside XML

2022-06-20

With the recent patch[^1] to the Shinobi Website project, I thought it would be best to share my experience implementing clickable links inside a rendered XML RSS file directly through a browser. This is made possible thanks to the awesome power of XSL formatting.

Before we begin, it should be noted that both Safari for macOS and *all* browsers on iOS do NOT support the ability to render XML files. Instead you are required to download the feeds as static files to your system. Major bummmer. Hopefully this will be fixed in the near future.

## The Code

Rendering your entry links as interactive URLs is fairly intuitive. You just need to:

1. Tell the file which tag it needs to render as the "a:link" element
2. Set the inner child attribute to "href"
3. Set the value of that attribute to use the entry's `link` parameter


    <xsl:element name="a">
        <xsl:attribute name="href">
            <xsl:value-of select="link"/>
        </xsl:attribute>
        <pre><xsl:value-of select="title"/></pre>
    </xsl:element>


In the instance above I am rendering the entry title as a clickable element which will direct users to the specific entry URL. You could simply render the full entry link URL text as the interactive link if you prefer. Something like:


    <xsl:element name="a">
        <xsl:attribute name="href">
            <xsl:value-of select="link"/>
        </xsl:attribute>
        <pre><xsl:value-of select="link"/></pre>
    </xsl:element>


## Live Example

In a supported browser, you can see the code in action here: https://pblog.bt.ht/feed.xml

That's really all there is to it.

[^1]: https://shinobi.bt.ht/posts/patch-3.txt
