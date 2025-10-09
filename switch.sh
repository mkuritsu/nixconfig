#!/usr/bin/env bash

nh os switch . || exit 1
NIXPKGS_ALLOW_UNFREE=1 home-manager switch -f users/kuritsu/dotfiles/default.nix -b backup
