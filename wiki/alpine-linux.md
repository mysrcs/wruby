---
layout: page
title: Alpine Linux
permalink: /wiki/alpine-linux
---

This page contains a helpful collection of configuration and application setups for Alpine Linux.

## Run Mullvad on Alpine Linux (Wireguard)


    # Install wireguard
    apk add wireguard-tools


Login into Mullvad and download the proper wireguard configuration files(s). After downloaded, place in the proper directory:


    doas cp <MULLVAD_FILENAME>.conf /etc/wireguard/"


Then setup an aliases for easier up/down states:


    alias vpnup="doas wg-quick up /etc/wireguard/<MULLVAD_FILENAME>.conf"
    alias vpndown="doas wg-quick down /etc/wireguard/<MULLVAD_FILENAME>.conf"

## Alpine Linux `mini_racer` Tweaks

Gem lockfile:


    PLATFORMS
      ruby
      x86_64-linux-musl

    mini_racer (0.6.3)
      <remove child dependency>


then run: `bundle update mini_racer`
