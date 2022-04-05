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

workspace_script_name=$0
vim_config_root="${HOME}/github.com/derwiath/vim-config"
vim_runit_root="${vim_config_root}/pack/derwiath/start/vim-runit"
source "${vim_runit_root}/runit-cmd.sh" -- "${workspace_script_name}" $@
