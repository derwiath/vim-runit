#!/bin/bash

function runItMakeCmd()
{
  exit 1
}

function runItMakeFileCmd()
{
  exit 1
}

function runItTestCmd()
{
  exit 1
}

function runItExtraCmd()
{
  exit 1
}

function runItMakeTagsCmd()
{
  exit 1
}

script_name=$0
source "${HOME}/github.com/derwiath/vim-runit/runit-cmd.sh" "${script_name}" $@
