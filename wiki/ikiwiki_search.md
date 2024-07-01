---
layout: page
title: ikiwiki Search
permalink: /wiki/ikiwiki/search
---

This page focuses on properly setting up ikiwiki search on [[ikiwiki/NearlyFreeSpeech]].

## Proper Packages

You will need to install/enable `xapian-omega` in order to use the default ikiwiki search plugin. Switching your NFS realm to "white" should fix this problem but if not, you will need to reach out to support and request they add it for you.

Once that is complete, edit your `foo.setup` file and update the `omega` path to:


    /usr/local/www/xapian-omega/cgi-bin/omega


Then rebuild your ikiwiki:


    ikiwiki --setup foo.setup


Now your web search should be working!
