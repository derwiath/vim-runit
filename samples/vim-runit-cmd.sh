#!/bin/bash

function runItMakeCmd() {
  echo "Making"
  exit 1
}

function runItMakeFileCmd() {
  echo "Making file"
  exit 1
}

function runItTestCmd() {
  echo "Testing"
  exit 1
}

function runItExtraCmd() {
  echo "Extra"
  exit 1
}

function runItMakeTagsCmd() {
  echo "Making tags"
  exit 1
}

script_name=$0
source "${HOME}/github.com/derwiath/vim-runit/runit-cmd.sh" "${script_name}" $@
