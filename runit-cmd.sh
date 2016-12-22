#!/bin/sh
script_name=$0

usage_params="<make|make_file|test|extra|tags> [arguments]"
if (($# == 0)); then
  echo "Usage: $script_name [calling_script] $usage_params"
  exit 1
fi
calling_script=$1
shift 1

if (($# == 0)); then
  echo "Usage: $calling_script $usage_params"
  exit 1
fi
command=$1
shift 1

case "$command" in
  make)
    runItMakeCmd
    ;;
  make_file)
    if (($# == 0)); then
      echo "Usage: $script_name make_file <filename>"
      exit 1
    fi
    filename=$1
    shift 1
    runItMakeFileCmd $filename
    ;;
  test)
    runItTestCmd $@
    ;;
  extra)
    runItExtraCmd
    ;;
  tags)
    runItMakeTagsCmd
    ;;
  *)
    echo "Error: Unknown command: $command" >&2
    exit 1
    ;;
esac
