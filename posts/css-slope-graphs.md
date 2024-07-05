# CSS Slope Graphs

2021-06-07

*I am a huge sucker for simplistic and beautifully designed visual data on the web*. Most data tends to be graphed via line or bar systems - which is fine - but I think slope graphs are highly underrated. Let's change that, shall we?

## The Demo

I'm basing this demo off the design patterns found in [Edward Tufte's visualization work](https://www.edwardtufte.com/tufte/books_vdqi), specifically his slope graph designs:

[Live CodePen Example](https://codepen.io/bradleytaunt/pen/jOBzXMe)

## The HTML

For this concept we will actually be building this graph out of `tables` - crazy, right? The greatest benefit of rendering all the data inside of a `table` element is the ability to easily support smaller screens and mobile devices. Larger viewports will get to see the pretty slope graph, while those below a certain threshold will view a simple table.

(But more on that in the CSS section)

~~~html
<p>Sales of the leading frozen pizza brands of the United States from 2011 to 2017 (in million US dollars) <br><em>Source: Statisa 2018</em></p>
<table>
  <thead>
    <tr>
      <th>Pizza Brand</th>
      <th>2011</th>
      <th>2017</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td data-set="677.0">DiGiorno</td>
      <td><span>677.0</span></td>
      <td data-name="DiGiorno">1014.6</td>
    </tr>
    <tr>
      <td data-set="294.8">Private Label</td>
      <td><span>294.8</span></td>
      <td data-name="Private Label">524.8</td>
    </tr>
    <tr>
      <td data-set="286.1">Red Baron</td>
      <td><span>286.1</span></td>
      <td data-name="Red Baron">572.3</td>
    </tr>
    <tr>
      <td data-set="257.9">Tombstone</td>
      <td><span>257.9</span></td>
      <td data-name="Tombstone">270.6</td>
    </tr>
    <tr>
      <td data-set="164.5">Totino's Party Pizza</td>
      <td><span>164.5</span></td>
      <td data-name="Totino's Party Pizza">347.2</td>
    </tr>
  </tbody>
</table>
~~~

As you can see, nothing too fancy is happpening here. Pay close attention to the `data-set` and `data-name` variables though - those will be important for the CSS portion of this design, mainly the rendering of the line elements.



## The CSS

To avoid overwhelming your brain all-at-once, let's break the CSS down into bite-sized chunks, starting with the base styling:

~~~css
@import url('https://opentype.netlify.com/et-book/index.css');
* {
  box-sizing: border-box;
}

html {
  height: 100%;
}

body {
  background: #fffff8;
  font-family: "et-book", serif;
  height: 100%;
  margin: 0 auto;
  max-width: 800px;
  padding: 0 0.5rem;
}

p {
  font-size: 18px;
  margin: 4rem 0 6rem;
}

table {
  border-collapse: collapse;
  text-align: left;
  width: 100%;
}
~~~

Pretty basic stuff.

Now we need to design how our slope graph will look on larger screens / desktops. For this instance, we will target these larger devices with a `min-width` media query of `800px`. The rest of the CSS might look a little confusing but I assure you it is quite simple.

1. On larger devices we hide the first `thead tr th` element with `display: none`
2. The first and second `td` elements inside each `tbody` row need to be set as `position: absolute` to avoid duplicate content
3. The inner `span` that we include in our HTML inside the second `tbody tr td` also needs to be `display: none`
4. Remember that `data-set` variable? We now use that for our `:before` pseudo element for `table tbody tr td:nth-of-type(1)`
5. Remember that `data-name` variable? We now use that for our `:before` pseudo element for `table tbody tr td:nth-of-type(3)`
6. After that, you can see the simple customization we include to render the angle / position of the slope lines and the corresponding labels

~~~css
@media(min-width:800px) {
  table {
    display: block;
    position: relative;
    margin-bottom: 25rem;
  }

  table thead th {
    border-bottom: 1px solid lightgrey;
    font-size: 24px;
    position: absolute;
    top: -50px;
    width: 45%;
  }
  table thead th:nth-child(1){ display: none; }
  table thead th:nth-child(2){ left: 0; }
  table thead th:nth-child(3){ right: 0; text-align: right; }

  table tbody tr td:nth-of-type(1),
  table tbody tr td:nth-of-type(2) { position: absolute;}

  table tbody tr td:nth-of-type(2) span { display: none; }
  table tbody tr td:nth-of-type(1):before {
    content: attr(data-set);
    margin-right: 10px;
    position: relative;
  }

  table tbody tr td:nth-of-type(2) { padding-left: 10px; }

  table tbody tr td:nth-of-type(3) {
    position: absolute;
    right: 0;
  }
  table tbody tr td:nth-of-type(3):before {
    content: attr(data-name);
    margin-right: 10px;
    position: relative;
  }

  /* Custom individual slopes -- Left */
  tbody tr:nth-child(1) td:nth-child(1),
  tbody tr:nth-child(1) td:nth-child(2) { top: 60px; }
  tbody tr:nth-child(2) td:nth-child(1),
  tbody tr:nth-child(2) td:nth-child(2) { top: 140px; }
  tbody tr:nth-child(3) td:nth-child(1),
  tbody tr:nth-child(3) td:nth-child(2) { top: 165px; }
  tbody tr:nth-child(4) td:nth-child(1),
  tbody tr:nth-child(4) td:nth-child(2) { top: 220px; }
  tbody tr:nth-child(5) td:nth-child(1),
  tbody tr:nth-child(5) td:nth-child(2) { top: 270px; }

  /* Custom individual slopes -- Right */
  [data-name="DiGiorno"] { top: 0; }
  [data-name="Red Baron"] { top: 65px; }
  [data-name="Private Label"] { top: 100px; }
  [data-name="Tombstone"] { top: 180px; }
  [data-name="Totino's Party Pizza"] { top: 150px; }

  /* The custom visual lines */
  tbody tr:after {
    background: black;
    content: '';
    height: 1px;
    left: 14.5%;
    position: absolute;
    width: 70%;
  }
  tbody tr:nth-child(1):after {
    top: 40px;
    transform: rotate(-6deg);
  }
  tbody tr:nth-child(2):after {
    left: 17.5%;
    top: 130px;
    transform: rotate(-4deg);
    width: 65%;
  }
  tbody tr:nth-child(3):after {
    left: 15%;
    top: 125px;
    transform: rotate(-10.25deg);
    width: 70%;
  }
  tbody tr:nth-child(4):after {
    left: 16%;
    top: 210px;
    transform: rotate(-4deg);
    width: 68%;
  }
  tbody tr:nth-child(5):after {
    left: 22%;
    top: 222px;
    transform: rotate(-16deg);
    width: 56%;
  }
}
~~~

All that's left are some minor styles to make everything look nice on mobile:

~~~css
@media(max-width:800px) {
  p {
    margin: 2rem 0;
  }
  table td, table th {
    border-bottom: 1px solid grey;
    padding: 10px;
  }
  table td:last-of-type, table th:last-of-type {
    text-align: right;
  }
}
~~~

## Not the most practical
This slope graph concept is far from perfect for use in real-world situations. The fact that you need to manually render each point of data yourself makes this implementation quite annoying for more in-depth projects.

But it was fun to mess around with and create, so who cares!
