#!/bin/bash

while getopts u:a:f: flag
do
    case "${flag}" in
        u) first=${OPTARG};;
        a) second=${OPTARG};;
        f) third=${OPTARG};;
        *) echo "usage: $0 [-u] [-a] [-f]" >&2;;
    esac
done
echo "the script works with arguments: $first $second $third" >> /tmp/diditwork.txt