#!/bin/bash

echo "Choose which option you would like.
        1. Number of CPU Cores
        2. Disk space
        3. Size of RAM
        4. Last users on the host
        5. Number of active python/perl process
        6. Report information sent to email address
" 
read number

cores=$(nproc)
disk=$(df)
ram=$(free -m)
lastuser=$(last)
processes=$(pgrep -i 'python|perl' |wc -l)



if [ $number -eq 1 ]
then
    echo "The number of CPU cores is $cores"
fi


if [ $number -eq 2 ]
then
    echo -e "The disk space is $disk"
fi

if [ $number -eq 3 ]
then
    echo -e "The size of RAM is $ram"
fi


if [ $number -eq 4 ]
then
    echo -e "Info about last users: $lastusers"
fi


if [ $number -eq 5 ]
then
    echo "The number of active python/perl proccess is $processes"
fi


if [ $number -eq 6 ]
then
    echo "Enter an email address to send it to: "
    read email
    $(sudo apt install mailutils)
    $(/root/script.sh 2>&1 | tee output.txt | mail -s "Report Information" $email)
    echo "Report has been sent"
fi