#!/bin/bash

i=0

while getopts s:m: arg
do
  case "${arg}" in
     s) second=${OPTARG};;
     m) millisecond=${OPTARG};;
  esac
done

if [ ! -z "$second" ]
then
  sec="$second"
elif [ ! -z "$millisecond" ]
then
  sec=`echo "scale=2; $millisecond / 1000" | bc`
else
  sec=1
fi

while true
do
  echo "test serial $i ..."
  echo "helloworld" > /dev/ttyUSB0
  let i++
  sleep "$sec"
done
