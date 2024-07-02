# Browser History Sucks

2019-04-20

*Have you ever needed to step back through your browser history* to find a particular site or product? Do you remember that experience being good? Most likely not.


Much like printers, the design of browser history interfaces hasn't changed in years. This would be fine if these UIs had been well thought out and optimized for an easy user experience - but they weren't.

Browser history views rely on the user's own memory for more in-depth searches. This defeats the whole purpose of having a robust, documented history. The browser should be doing this heavy-lifting.

## What browsers get wrong

Modern browsers give the general public too much credit when it comes to memory (I don't mean this as an insult!). To assume users remember the URL or site name when browsing random pages is short-sighted. I find myself asking these types of questions when jumping back into my view history far too often:

- "That article had *something* to do with CSS..."
- "I remember seeing a beautifully designed site a month ago but have no clue what the URL was..."
- "My browser crashed and I can't recall that [example website] I had pinned in my tab for weeks..."

For reference, let's take a look at the current Chrome (73) history view:

![Default Chrome History](/public/images/browser-history-01.webp)

As you may have noticed - this UI is lackluster at best. An oversimplified search field in the header is the only means of filtering items.

## Why not use extensions?

I know using browser extensions or tagging favorites can alleviate some of these issues. This is great, but why not simplify everything by having these features *inside* the history view? If an extension can add these features, why not have those extras built-in?

## Two subtle improvements

A little goes a long way. With just two small changes, we can drastically increase the history view's UX.

We start by adding <u>a date picker</u>. Users open the new calendar icon to filter by days, months or years before searching. Seems trivial, but this saves the headache of filtering through all saved history.

![Chrome History with date picker](/public/images/browser-history-02.webp)

The second small functional change we can make is including extra subcategories. These new options allow users to focus their searches based on:

- Session length
- Number of return visits
- Last restored tabs

### Session length

![Chrome History by session length](/public/images/browser-history-03.webp)

Allow users to display their history filtered by session duration. This helps when searching for an stagnant page or pinned site  during a user's long session. An example default would allow filtering by:

- longest to shortest
- shortest to longest
- pinned tabs

### Return visits

![Chrome History by return visits](/public/images/browser-history-04.webp)

When users make repeat visits to a site or web app, the browser should keep a record of return sessions. This allows the user to refine their search by many or singular visits.

### Last restored tabs

![Chrome History by restored tabs](/public/images/browser-history-05.webp)

A basic concept, but the ability for users to view all previous  instances of restored tabs is helpful. This would fix most edge cases not covered by the other two categories.

## Far from perfect

The Chrome (or any browser for that matter) browser history view is simplistic to a fault. The current UI is prone to human error, since it makes assumptions and relies heavily on user memory.

These are simple fixes that attempt to boost the basic UX of the history view. Are these concepts absolutely perfect? Not at all. Is it at least an improvement? I believe it is. When products decrease the effort required of it's users, I see that as a positive.
