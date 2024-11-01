# Website Backups with Apple iCloud

2024-02-16

My main work machine, an M2 MacBook Air, meshes really well with my iPhone SE (they are in the same ecosystem after all - duh!). Since both of these devices are Apple products, it makes sense that I pay for the optional iCloud service for extra storage. 50GB to be exact. I only need to bare minimum which costs just $1.68 a month, making this storage option cheaper than most cups of coffee these days.

Recently I've been using iCloud as my "middle-man" backup system. I still have local, offline storage for most personal data but having additional off-site backups is never a bad thing. I make things easier for myself by taking advantage of `rsync`. You'll need to make sure you have that program installed before trying this yourself:

    # This assumes you have homebrew installed first
    brew install rsync

Then, whenever I feel like backing up an existing project or website I simply run:

    rsync -a user_name@ssh.webserver.domain:/home/var/www/ /Users/username/Library/Mobile\ Documents/com\~apple\~CloudDocs/Backups/site-backup

> Note: The `-a` option tells `rsync` to sync directories recursively, transfer special and block devices, preserve symbolic links, modification times, groups, ownership, and permissions.

The beautiful magic of `rsync`! Obviously, you'd want to properly name your directories (ie. `/Backups/site-backup`) for a cleaner structure and ensure that your iCloud directory is set correctly. (remember to read code before just copy-pasting!). With this approach you can backup entire server directories or be specific with each individual project folder. I would also recommend setting up some alias in your `.bashrc` or `.zshrc` etc. to make things more streamlined when running backups manually:

    alias site-backup="rsync -a user_name@ssh.webserver.domain:/home/var/www/ /Users/username/Library/Mobile\ Documents/com\~apple\~CloudDocs/Backups/site-backup"
    # Then you simply run the following for a manual backup:
    site-backup

You can take this further by automating things via cron jobs, but for my use case that is a little overkill. Hopefully this helps anyone looking for a quick and dirty backup system, especially one that can piggyback of your existing iCloud that you might be paying for already.
