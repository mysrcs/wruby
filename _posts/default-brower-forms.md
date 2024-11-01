# Very Basic Form Styling

2019-11-13

Web forms can be great - I'm borderline obsessed with them. I love tinkering with pre-existing logins / sign up pages and I've also open sourced a minimal CSS form-styling plugin: [Normform](https://normform.netlify.com/). While simple CSS plugins like these can be helpful, I often feel like we are over-engineering our web forms. I'm certainly guilty of it.

That's not to say developers should just use default browser styling for their forms and call it a day - that is far from ideal. Just pull-back on adding so much styling garbage to the forms themselves.

Let's check out an embedded demo below to see what some bare-bones form styling could look like:

[Live CodePen Example](https://codepen.io/bradleytaunt/pen/oNwzvMa)

This form isn't going to win any design awards or blow anyone away with its creativity. That's okay - because it gets the job done. Users understand it's a form and items are broken down into digestible chunks. Mission accomplished, right?

## Breaking the form down

Let's take a look at the HTML of the entire form:

~~~html
<form action="">
  <fieldset>
      <legend>Personal Details</legend>
      <label for="username">Desired Username:</label>
      <input type="text" id="username">
      <label for="name">Full Name:</label>
      <input type="text" id="name">
      <label for="email">Email Address:</label>
      <input type="email" id="email">
      <label for="date">Date of Birth:</label>
      <input type="date" id="date">
  </fieldset>
  <br>
  <fieldset>
      <legend>Contact Details</legend>
      <label for="address">Home Address:</label>
      <input type="text" id="address">
      <label for="postal">Postal Code:</label>
      <input type="text" id="postal">
      <label for="phone">Phone Number:</label>
      <input type="tel" id="phone">
  </fieldset>
  <br>
  <fieldset>
      <legend>Select an Option</legend>
      <label for="radio-1">
          <input type="radio" id="radio-1" name="radio-choice">
          The option is pretty nice
      </label>
      <label for="radio-2">
          <input type="radio" id="radio-2" name="radio-choice">
          This option is a little bit better
      </label>
      <label for="radio-3">
          <input type="radio" id="radio-3" name="radio-choice">
          This option is the best
      </label>
  </fieldset>
  <br>
  <fieldset>
      <legend>Notifications</legend>
      <label for="checkbox-1">
          <input type="checkbox" id="checkbox-1">
          I would like to receive email notifications
      </label>
      <label for="checkbox-2">
          <input type="checkbox" id="checkbox-2">
          I would like to subscribe to the weekly newsletter
      </label>
  </fieldset>
  <br>
  <input type="reset" value="Reset">
  <input type="submit" value="Submit">
</form>
~~~

Notice the `fieldset` and `legend` elements? I bet you don't see or hear about those HTML items very often. By default, `fieldset` allows sibling or related inputs to be semantically grouped together. The `legend` elements give the user great visual cues about which items are grouped together, helping to focus on each section individually as they complete the form. Use these grouping elements as much as possible (when it makes sense of course) for a better guided experience for your users. 

Avoid making your own custom sections and instead use these existing HTML semantics.

## Almost no CSS at all

Now it's time to style this form with only 6 property declarations:

~~~css
form label {
  display: block;
}
form input {
  display: inline-block;
  margin-bottom: 10px;
  padding: 10px;
  width: 100%;
}
form input[type="radio"],
form input[type="checkbox"],
form input[type="reset"],
form input[type="submit"] {
  width: auto;
}
~~~

Of course, you can always add minor adjustments (like in my demo example above)

- Legend typeface and sizing
- Form and fieldset background colors
- Extra margin and padding
- Custom reset / submit buttons

But the main point of this post is to showcase how little CSS is needed to implement decent web forms - so any further improvements are up to you, dear reader. 

Just try not to reinvent the wheel.

## Final rant - don't ignore the reset

A lot of "modern" web forms have moved away from including the reset input on their forms, which I think is fairly short-sighted. Resetting all form fields might be a smaller edge case, but it is certainly a better option than relying on the user to <i>refresh</i> or in some cases, individually deleting each input. Yikes.

Happy form building!
