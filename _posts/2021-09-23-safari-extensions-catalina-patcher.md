---
layout: post
title: "Enabling Safari Extensions with the macOS Catalina Patcher"
date: 2021-09-23
---


I have an old 2011 MacBook Air that is running the latest version of macOS Catalina thanks to the very wonderful [Catalina Patcher](http://dosdude1.com/catalina/) by dosdude1. This project has made it possible for me to run and test some of the latest software from Apple - namely Safari 15.

I ran into a small bug early on though – Safari extensions couldn’t be activated via the preferences menu. Luckily I discovered a very simple fix. My hope is this might help others (as small of a demographic that might be) who run into the same issue with the Catalina Patcher.

- Close/Quit Safari completely
- Open the Finder and use the shortcut `⌘ Shift G`
- Paste the following to navigate to the proper folder: `~/Library/Containers/com.apple.Safari/Data/Library/Safari/AppExtensions`
- Open the `Extensions.plist` in your favourite text editor (I’m a big fan of Panic's Nova)
- Below each extensions `<dict>` tag, add the following: `<key>Enabled</key><true/>`
- Save the file and relaunch Safari

Reference of what it should look like (AdBlock for this example):


    <key>org.adblockplus...</key>
        <dict>
            <key>AddedDate</key>
            <date>2021-09-23T14:00:47Z</date>
            <key>Enabled</key>
            <true/>
        <key>WebsiteAccess</key>
        <dict>
            <key>Allowed Domains</key>
            <array/>
            <key>Has Injected Content</key>
            <true/>
            <key>Level</key>
            <string>All</string>
            </dict>
        </dict>


After following those simple steps you should have working extensions in Safari. Have fun on your old, "unsupported" Apple devices!

