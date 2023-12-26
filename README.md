# Josh's Custom Emacs Setup

This is my personal Emacs config, currently set up to just support a
few programming languages that I'm using right now.

## Get Started

Clone this repo, and then, from the root of the cloned project, run

    ./setup.sh

Yup! That's it!

## Cheatsheet

### Misc

`M-q` - Reformat paragraph to fit into `fill-width` characters per
line (default is 70)

### Eglot

`M-.` - Open the definition of a function or class (I've had some
trouble getting this to work reliably in Elixir projects)

`M-,` - After `M-.`, go back to where you ran `M-.` from

`M-?` - Find usages of the token that the cursor is currently on

### Elixir (Mix minor mode)

`C-c d` - Open a menu (with `which-key`) of the various mix commands
that are available

`C-c d o` - Run tests in the current buffer

`C-c d f` - Run the test that the cursor is currently in

`C-c d t` - Run all tests for the project

### Jest

`C-c C-t` - Open a menu (with `which-key`) of the various jest
commands that are available

`C-c C-t n` - Run tests in the current buffer

`C-c C-t t` = Run the test that the cursor is currently in

`C-c C-t p` - Run all tests for the project
