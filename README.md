# dotfiles

These are my personal dotfiles I normally use to have a standard bash environment on some new machines when I need to first use them. Its main purpose is to install a few resources and allow for consistant aliases, environment variables and tools which can be installed for all *nix based systems. 

You can shoot me a fork if you want to improve anything you used / saw. 

### Warning: 

Sorry, I don't really test this on all systems it claims to support. I do my best. 

    Run at own risk lol 



## Usage 

### Standard

```
curl -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/setup/install/bash.sh | bash
```


### Work Profile

For making the server ready for work ...

```
curl -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/setup/install/bash_work.sh | bash
```


### Home Profile

For making the server home ...

```
curl -s https://raw.githubusercontent.com/BeauBouchard/dotfiles/main/.shell/setup/install/bash_home.sh | bash
```

### Pro Usage

When I normally use this, I do 


```
curl http://beau.sh/beau.sh?raw=true | sh
```

for a new MBP or ubuntu setup. the below are normally what I recommend when I need things to work from a docker / instanced server. 

## Commands

There are a few utilities in bash native that can be used.

* [labels.sh](https://github.com/BeauBouchard/dotfiles/tree/main/.shell/commands/github/labels) - rewrites the github labels on a given repo from a template. 
