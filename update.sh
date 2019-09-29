#!/bin/bash

hostname=''
username=''
password=''

print_usage() {
  cat USAGE
}

while getopts 'h:u:p:' flag; do
  case "${flag}" in
    h) hostname="${OPTARG}" ;;
    u) username="${OPTARG}" ;;
    p) password="${OPTARG}" ;;
    *) print_usage
       exit 1 ;;
  esac
done

if [ -z $hostname ] || [ -z $password ] || [ -z $username ]
then
	print_usage
	exit 1
fi

curl "https://svc.joker.com/nic/update?username=${username}&password=${password}&hostname=${hostname}"

