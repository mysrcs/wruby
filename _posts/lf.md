# Installing Custom Fonts on Linux from the Command Line

2022-09-20

Installing custom fonts is a fairly streamlined feature on operating systems like MacOS and Windows. Linux, on the other hand, struggles to make this workflow *easy* for everyday users. Many newcomers tend to get frustrated with using the default "Fonts" application managers shipped with most Linux distros.

But I'm here to tell you to **ditch** those GUI font installers. Let's install our custom fonts in the command line!

## Get Your Font Files

You can't install custom fonts if you don't have any. For this tutorial we are going to assume that we are trying to install a typeface set named `LinuxFont`. We are going to assume that we have already downloaded and extracted a folder named `LinuxFont` into our `Downloads` directory.

Inside this hypothetical folder is a collection of `OTF` (opentype) font files. This will be important information in a moment.

## Terminal Time

Now our goal is to simply copy this new typeface folder into our user font directory. Open Terminal and run the following from your `Downloads` directory:


    sudo cp -r LinuxFont /usr/local/share/fonts/opentype/


**Important**: If your font files are NOT opentype format, be sure to copy your files to the proper directory (truetype for TTF, etc.)

Next we need to make sure we have full read and write privileges for this new folder:


    sudo chmod -R 0777 /usr/local/share/fonts/opentype/LinuxFont


The last thing we need to do is reload the font cache on our system:


    sudo fc-cache -fv


That's it! You should now have access to your custom typeface in all your applications system wide.