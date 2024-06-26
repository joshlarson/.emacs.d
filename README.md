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

`C-h .` - Open documentation buffer, which shows the documentation for
whatever is under the cursor

### Elixir (Mix minor mode)

`C-c d` - Open a menu (with `which-key`) of the various mix commands
that are available

`C-c d o` - Run tests in the current buffer

`C-c d f` - Run the test that the cursor is currently in

`C-c d l` - Run the last mix command, regardless of where the cursor
currently is

`C-c d t` - Run all tests for the project

### Jest

`C-c C-t` - Open a menu (with `which-key`) of the various jest
commands that are available

`C-c C-t n` - Run tests in the current buffer

`C-c C-t t` - Run the test that the cursor is currently in

`C-c C-t C-a` - Run the last jest command, regardless of where the
cursor currently is

`C-c C-t p` - Run all tests for the project

### Magit

`C-x g` - Open the git status buffer

`C-c g` - Open a menu with global Magit commands

`C-c f` - Open a menu with file-specific Magit commands

`?` or `h` (from within the git status buffer) - Open a help menu
showing the available commands

### HideShow minor mode

_Enabled by default for Elixir and Typescript modes_

`M-x hs-minor-mode` - Turn this minor mode on or off

`C-c @ C-h` - Hide the block the cursor is currently in

`C-c @ C-s` - Show the block the cursor is currently in

`C-c @ C-l` - Hide all blocks at the level matching where the cursor is

`C-c @ C-a` - Expand everything

`C-c @ C-t` - Collapse all top-level blocks
