# Wiki

## Introduction

This is a living document that will expand alongside my own personal experiences and knowledge. Topics range from device settings, computer configurations, household product serial numbers / expiry dates, and so on. Hopefully this can end up being helpful to others as well.

## Open Suck

My personal, lightweight desktop installer for OpenBSD based on the suckless philosophy. Includes my own custom set of suckless tools (dwm, slstatus, dmenu, etc.)

- [https://git.sr.ht/~bt/open-suck](https://git.sr.ht/~bt/open-suck)

## vimrc

~~~sh
" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized
~~~

## .zshrc extras / aliases

~~~sh
export EDITOR="/bin/vim"

alias suck="sudo rm -rf config.h ; sudo make install"
alias fixmonitor="xrandr --auto --output eDP1 --mode 1366x768 --below DP2-2"
alias vscode="alias vscode="ENABLE_WASM=1 chrome --enable-wasm --disable-unveil""
~~~

## mimeapps.list

Place this file under  `/usr/share/applications/mimeapps.list`

~~~sh
[Default Applications]
x-scheme-handler/http=org.qutebrowser.qutebrowser.desktop
x-scheme-handler/https=org.qutebrowser.qutebrowser.desktop
x-scheme-handler/ftp=org.qutebrowser.qutebrowser.desktop
x-scheme-handler/chrome=org.qutebrowser.qutebrowser.desktop
text/html=org.qutebrowser.qutebrowser.desktop
application/x-extension-htm=org.qutebrowser.qutebrowser.desktop
application/x-extension-html=org.qutebrowser.qutebrowser.desktop
application/x-extension-shtml=org.qutebrowser.qutebrowser.desktop
application/xhtml+xml=org.qutebrowser.qutebrowser.desktop
application/x-extension-xhtml=org.qutebrowser.qutebrowser.desktop
application/x-extension-xht=org.qutebrowser.qutebrowser.desktop
image/jpeg=feh
image/png=feh
image/webp=feh
~~~

## qutebrowser

### Greasemonkey

All of these scripts should be added under `~/.local/share/qutebrowser/greasemonkey/`. Then be sure to run the proper command within qutebrowser: `:greasemonkey-reload`

#### Auto Skip YouTube Ads

~~~js
// ==UserScript==
// @name         Auto Skip YouTube Ads 
// @version      1.0.0
// @description  Speed up and skip YouTube ads automatically 
// @author       jso8910
// @match        *://*.youtube.com/*
// @exclude      *://*.youtube.com/subscribe_embed?*
// ==/UserScript==
setInterval(() => {
    const btn = document.querySelector('.videoAdUiSkipButton,.ytp-ad-skip-button')
    if (btn) {
        btn.click()
    }
    const ad = [...document.querySelectorAll('.ad-showing')][0];
    if (ad) {
        document.querySelector('video').playbackRate = 10;
    }
}, 50)
~~~

## `ffmpeg` to MP4

~~~sh
ffmpeg -i input_filename.avi -c:v copy -c:a copy -y output_filename.mp4
~~~

## Mount USB HDD via CLI

~~~sh
mkdir /media/usb-drive
mount /dev/sdX /media/usb-drive/
~~~

## Run Mullvad on Alpine Linux (Wireguard)

~~~sh
# Install wireguard
apk add wireguard-tools
~~~

Login into Mullvad and download the proper wireguard configuration files(s). After downloaded, place in the proper directory:

~~~sh
doas cp <MULLVAD_FILENAME>.conf /etc/wireguard/"
~~~

Then setup an aliases for easier up/down states:

~~~sh
alias vpnup="doas wg-quick up /etc/wireguard/<MULLVAD_FILENAME>.conf"
alias vpndown="doas wg-quick down /etc/wireguard/<MULLVAD_FILENAME>.conf"
~~~

## Alpine Linux `mini_racer` Tweaks

Gem lockfile:

~~~sh
PLATFORMS
  ruby
  x86_64-linux-musl

mini_racer (0.6.3)
 <remove child dependency>
~~~

then run: `bundle update mini_racer`

## Docker

Installing `ghost`

~~~sh
docker pull ghost
~~~

~~~sh
docker run -d \
    --name ghost-name \
    -e NODE_ENV=development \
    -p 2368:2368 \
    -v $HOME/path/to/ghost/blog:/var/lib/ghost/content \
    ghost:alpine
~~~

## MongoDB 3.4 on Ubuntu 23.10

~~~sh
wget http://launchpadlibrarian.net/668089858/libssl1.0.0_1.0.2n-1ubuntu5.13_amd64.deb
sudo apt install ./libssl1.0.0_1.0.2n-1ubuntu5.13_amd64.deb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

echo "deb http://repo.mongodb.org/apt/ubuntu precise/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
~~~

Now edit `/etc/apt/sources.list.d/mongodb-org-3.4.list`:

~~~sh
deb [trusted=yes] http://repo.mongodb.org/apt/ubuntu precise/mongodb-org/3.4...
~~~

Then finish things up:

~~~sh
sudo apt-get update --allow-unauthenticated
sudo apt-get install -y mongodb-org

sudo mkdir -p /data/db
sudo chmod -R 777 /data/db
~~~

## Redis 6.0.7 on Ubuntu 23.10

~~~sh
sudo apt-get install build-essential tcl
cd /tmp
curl -O http://download.redis.io/releases/redis-6.0.7.tar.gz
tar xzvf redis-6.0.7.tar.gz
cd redis-6.0.7
~~~

Install redis:

~~~sh
make
make test
sudo make install

sudo mkdir /etc/redis
sudo cp /tmp/redis-6.0.7redis.conf /etc/redis
~~~

Edit `/etc/redis/redis.conf` with the following changes:

- `supervised systemd`
- `dir /var/lib/redis`

Create systemd unit file for redis: `/etc/systemd/system/redis.service`:

~~~sh
[Unit]
Description=Redis In-Memory Data Store
After=network.target

[Service]
User=redis
Group=redis
ExecStart=/usr/local/bin/redis-server /etc/redis/redis.conf
ExecStop=/usr/local/bin/redis-cli shutdown
Restart=always

[Install]
WantedBy=multi-user.target
~~~

Final steps:

~~~sh
sudo adduser --system --group --no-create-home redis
sudo mkdir /var/lib/redis
sudo chown redis:redis /var/lib/redis
sudo chmod 770 /var/lib/redis
~~~

## Ruby 2.7.2 with rbenv on Ubuntu 23.10

Edit the `/etc/apt/sources.list` file:

~~~sh
deb [trusted=yes] http://security.ubuntu.com/ubuntu bionic-security main
~~~

Then run `sudo apt-get update`. After completion, install `libssl1.0-dev`:

~~~sh
sudo apt-get install libssl1.0-dev
~~~

## Fix screen tearing

~~~sh
sudo micro /etc/X11/xorg.conf.d/20-intel.conf
~~~

Add the following contents to `20-intel.conf`:

~~~sh
Section "OutputClass"
    Identifier  "Intel Graphics"
    MatchDriver "i915"
    Driver      "intel"
    Option      "DRI"       "3"
    Option      "TearFree"  "1"
EndSection
~~~

## Enabling "tap to click"

~~~sh
sudo micro /etc/X11/xorg.conf.d/30-touchpad.conf
~~~

Add the following contents to `30-touchpad.conf`:

~~~sh
Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "TappingButtonMap" "lmr"
EndSection
~~~

## Woocommerce

**Reset all product menu_order to `0`**

~~~sql
UPDATE wp_posts SET menu_order = 0 WHERE post_type = 'product';
~~~
