
# RubySystem
Rubysystem is a small project intended to make annoying actions simpler by using some automatisation.
I use these programs with aliases on my WSL and its makes my life simpler.
Might add other little programs later.

## mkdir_ruby

mkdir ruby is a small program that created a folder that's ready to host a Ruby project.
It creates the folder structure, the gemfile, and auto initialises a git and tries to add a remote.

There are some parameters that can or must be added after the program launch line to make it work as intended.

Obligatory parameter : The name of the project
after that, there are optional parameters you can specify

- -nogit | skips the creation of a git local repo
- -norspec | skips the initialisation of rspec
- -dotenv | adds dotenv to the project

I personally added it to the mkrub alias

## Google Search

This program was a simple test to use the launchy gem

allows to make a google search from the terminal using "GoogleSearch.rb your research string"

You can add this program as an alias to use it from anywhere

workaround for being able to open a link with GoogleSearch.rb directly into windows from WSL

type following command in terminal

`export BROWSER='/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe'`

