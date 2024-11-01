# Setting Up Fathom Analytics with Netlify

2021-01-19

It's no secret that I'm passionate about open source software, but I'm also extremely adamant about protecting the privacy of all users across the web. So when I decided to implement analytics on my own personal website, I ended up choosing <a href="https://usefathom.com/ref/DKHJVX">Fathom</a> (*get a $10 credit using that link!*).

You should research further into the company yourself if you're interested, but in a nutshell the Fathom platform provides:

- GDPR, ePrivacy, PECR and CCPA compliance
- ad-blocker bypasses (in a good way -> zero impact on users)
- anonymous visitor stats
- software created by <a href="https://usefathom.com/about">indie developers</a>

Although this might sound like a "paid" blog post, I can assure you this is completely based on my own opinions and experience with the service. I'm just very pleased with the product :)

Enough chit-chat - let's breakdown how to setup Fathom on your own site hosted through Netlify!

## Step 0: Assumptions

I'm going into this tutorial with the assumption that you:

1. Have an active <a href="https://usefathom.com/ref/DKHJVX">Fathom account</a> (or are at least trying the 7-day free trial)
2. Have a website already setup on <a href="https://netlify.com">Netlify (custom domain optional)</a>

And that's all you need.

## Step 1: Adding a Custom Domain (DNS Setup)

Even though you have the option to use the `default` tracking script URL, I would highly recommend setting it up through your own domain. This helps avoid any browser extensions or firewalls that might block outside URL request made by individual sites.

1. Navigate to the Fathom **Settings** page in the bottom footer (must be logged in)
2. Select **Domains** from the sidebar
3. Enter your custom domain in the `Add a new custom domain` input
4. Select **Start Process**
5. Keep note of both the `CNAME` and `VALUE` (we will copy this in a moment)

Open a new tab, and login to your Netlify account:

1. From your `Team Overview` page, navigate to the top-level `Domains` page
2. Select the domain you plan to add Fathom to
3. Under **DNS settings** > **DNS records** select `Add New Record`
4. Select `CNAME` from the dropdown of available options
5. Paste the Fathom `CNAME` (from the steps above) into the **Name** input
6. Paste the Fathom `VALUE` (from the steps above) into the **Value** input
7. Click **Save**

That's it for DNS setup!

## Step 2: Adding Fathom Your Website

Now that we will be using our own custom domain for the script, it's time to actually *add it* to our website. From the same Fathom **Settings** page as before:

1. Navigate to the **Sites** page in the sidebar
2. Enter your custom domain in the `Add a new site` input and click **Get site code**
3. In the modal prompt, select your custom domain from the dropdown list (you'll see the script code change accordingly)
4. Copy the tracking code snippet and add it to all the pages you plan to track on your site
5. When ready, select **Verify site code**
6. If everything went correctly you should be done!

## Step 3: Watch Those Live Stats!

Open a cold beer (or a bubbly soda if you prefer) and watch your website visitor stats come rolling in on the dashboard! Not only do you now have solid analytics on your website but you have the piece of mind that your users' privacy isn't being invaded. Everybody wins!


