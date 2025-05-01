#!/bin/bash

show-help() {
  echo "Usage: convert-seconds <number> <unit> [<number> <unit> ...]"
  echo
  echo "Supported units:"
  echo "  second(s), minute(s), hour(s), day(s)"
  echo
  echo "Examples:"
  echo "  convert-seconds 1 day"
  echo "  convert-seconds 3 hours 2 days"
  echo
  echo "Use -h or --help to show this message."
}

if [[ $# -eq 0 || "$1" == "-h" || "$1" == "--help" ]]; then
  show-help
  exit 0
fi

total_seconds=0

while [[ $# -gt 0 ]]; do
  num=$1
  unit=$2
  shift 2

  case "$unit" in
    second|seconds)
      seconds=$((num))
      ;;
    minute|minutes)
      seconds=$((num * 60))
      ;;
    hour|hours)
      seconds=$((num * 3600))
      ;;
    day|days)
      seconds=$((num * 86400))
      ;;
    *)
      echo "Unknown unit: $unit"
      exit 1
      ;;
  esac

  total_seconds=$((total_seconds + seconds))
done

echo "$total_seconds seconds"
