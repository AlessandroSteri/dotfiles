#!/usr/bin/env bash


# make the all thing very fast and idempotent
echo -n [Detecting OS] ..

case "$OSTYPE" in
  linux*)
      echo "LINUX"
      ;;
  darwin*)
      echo "MacOS"
      sh ./osx_bootstrap.sh
      ;;
  win*)
      echo "Windows..no bootstrap available!"
      ;;
  cygwin*)
      echo "Cygwin..no bootstrap available!"
      ;;
  bsd*)
      echo "BSD..no bootstrap available!"
      ;;
  solaris*)
      echo "SOLARIS"
      ;;
  *)
      echo "unknown: $OSTYPE ..no bootstrap available!"
      ;;
esac
