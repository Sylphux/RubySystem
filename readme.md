
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
- -als | adds an alias with the name "mkrb" in .bashrc
    - Be sure to launch it from the bin directory
