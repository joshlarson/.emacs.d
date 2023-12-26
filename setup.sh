#!/bin/bash

git submodule update --init

(
    cd elixir-ls/
    mix deps.get
    MIX_ENV=prod mix compile
    MIX_ENV=prod mix elixir_ls.release2
)

echo "All set!"
