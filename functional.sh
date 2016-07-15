# functional.sh - Curiously robust functional implementations for BASH
#
# Copyright © 2016 Jonathan Storm <the.jonathan.storm@gmail.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See the COPYING.WTFPL file for more details.

map()
{
  local fun=$1
  shift

  case $# in
    0)
      for e in $(cat); do
        echo "\"$(eval $fun $e)\""
      done
      ;;
    1)
      eval "map $fun $(echo $@)"
      ;;
    *)
      for e in "$@"; do
        echo "\"$(eval $fun $e)\""
      done
      ;;
  esac
}

reduce(){
  local fun=$1
  local acc=$2
  shift
  shift

  case $# in
    0)
      for e in $(cat); do
        acc=$(eval "$fun '$e' '$acc'")
      done

      echo "$acc"
      ;;
    1)
      eval "$fun '$1' '$acc'"
      ;;
    *)
      for e in "$@"; do
        acc=$(eval "$fun '$e' '$acc'")
      done

      echo "$acc"
      ;;
  esac
}

elem()
{
  local index=$1
  shift

  case $index in
    [1-9])
      eval "echo \"\$$index\""
      ;;
    [1-9][0-9])
      eval "echo \"\$$index\""
      ;;
    [1-9][0-9][0-9])
      eval "echo \"\$$index\""
      ;;
    [1-9][0-9][0-9][0-9])
      eval "echo \"\$$index\""
      ;;
    [1-9][0-9][0-9][0-9][0-9])
      eval "echo \"\$$index\""
      ;;
  esac
}