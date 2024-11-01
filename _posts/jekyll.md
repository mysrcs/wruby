# Setup Jekyll from Scratch on a New Linux System

2022-09-19

**Special Note:** Credit needs to be given to user [Achraf JEDAY](https://stackoverflow.com/users/4974784/achraf-jeday) for putting these instructions together on Stack Overflow (although his comments were targeting an older version of Ruby). This post is more for my own personal notes than anything else.

I find myself constantly running into small issues when trying to setup existing Jekyll projects on new Linux systems. I *could* use something like Docker, but that just seems so beefy and slow to me. So here is a step-by-step way (and foolproof from my own testing) to get Jekyll running smoothly in no time!

## Figuring out Ruby First

The first item of business is removing the default Ruby that ships with most Linux distros:


    sudo apt-get remove ruby


Then we check for updates and install everything we need:


    sudo apt update
    sudo apt install git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev


Now we can install `rbenv` and `ruby-build`:


    curl -sL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-installer | bash -


After both of those install, you will want to add those to your system **PATH**:

### Bash


    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    source ~/.bashrc


### ZSH


    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(rbenv init -)"' >> ~/.zshrc
    source ~/.zshrc


With that complete, we can now install the version of Ruby we wish to use and set it globally (at this time of writing it is `3.1.2`):


    rbenv install 3.1.2
    rbenv global 3.1.2


And `rehash` so our changes take:


    rbenv rehash


Now you should see the properly set Ruby version when you run the following:


    ruby -v


## Getting Ruby Gems

In case you don't have it installed already, be sure to grab `rubygems`:


    sudo apt install rubygems


## Running Jekyll

We are almost done! Navigate to your Jekyll project's directory and run:


    gem install jekyll bundler
    bundle install


That's it! Now if you run `bundle exec jekyll serve` you'll find your Jekyll project running locally! Hopefully this helps others when needing to port any Jekyll projects over to a new Linux system. I know it will save me time!

## Alpine Linux on Wayland

Save yourself a world of trouble: just use `docker`. The docker image below (jekyll-serve) works out-of-the-box:

[https://github.com/BretFisher/jekyll-serve](https://github.com/BretFisher/jekyll-serve)

Then run the following inside your project:


    docker run -p 4000:4000 -v $(pwd):/site bretfisher/jekyll-serve

