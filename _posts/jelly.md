# Transferring Media from macOS to a Jellyfin Server (Raspberry Pi 4)

2022-03-12

I run a personal media server using Jellyfin on a Raspberry Pi 4 in my home. It's pretty great and works well across most devices - Google TV, iOS and Android devices, Chromebooks, etc.

The only small headache is adding content (ie. audio, videos) to the existing hard drive that Jellyfin reads from. The last thing you want to do is connect a keyboard and monitor to your Pi to add a few files. Especially if your Pi is setup like mine and buried at the back of a hidden cabinet.

More annoying would be the need to remove the hard drive itself, connect it to your device that has the new files you wish to transfer and then port them over. Big ol' pass on that system.

## SSH/SCP to the Rescue

*Important*: before we begin, I should mention that this article assumes the following:

- The files you plan to transfer from are on a macOS device
- You have setup Jellyfin on your Raspberry Pi device
- SSH is enabled and accessible on the Pi (across your local network)
- The Jellyfin server's hard drive is mounted in the root directory via something like `/mnt`

Good? Moving on then...

Open your terminal of choice and use the following command:


    scp movie.mp4 pi_user_name@PI_IP_ADDRESS:/mnt/movies/movie.mp4


1. `movie.mp4` is the file in the current macOS directory we plan to copy over
2. `pi_user_name` is the username you setup on your Raspberry Pi
3. `PI_IP_ADDRESS` is, of course, your Pi's IP address
4. The appended `:/mnt/movies/movie.mp4` is the directory your Jellyfin server uses to pull-in media

You'll be prompted for the user password. Once entered the file will begin copying over to your remote Jellyfin server. That's it! Although, I should mention a little bonus feature that you should always have in your back pocket, since Jellyfin can sometimes be picky with media file formats:

## Converting Media Files with Ease

This is where your new best friend `FFmpeg` comes into your life (if they weren't there already).

- Download and install `FFmpeg` --> [ffmpeg.org/download.html](https://www.ffmpeg.org/download.html)

Now navigate to the directory containing the media file you wish to convert via your Terminal and run the following command:


    ffmpeg -i input.mp4 output.mkv


1. `input.mp4` is the initial file we wish to convert
2. `output.mkv` will be the name and file type of our converted media

Now you can circle back and run the previous `scp` command once you have converted your files to the desired format. Hopefully Jellyfin doesn't complain about the formatting!