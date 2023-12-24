#!/bin/bash
d_delta=$(date +'%R'| awk -F ':' '{print $1}')
d=$(date +'%e/%b/%Y')
curr_date=$(date +'%e/%b/%Y %R')

echo $curr_date > send.txt
echo "-----------------------" >> send.txt
echo "List IP address" >> send.txt
echo "count IP" >> send.txt
less ./logs/access.log | egrep "($d):($d_delta)" | cut -d ' ' -f1 | sort | uniq -c | sort -nrk 1 >> send.txt
#less ./logs/access.log | egrep "[0-9][0-9]\/[A-z][a-z][a-z]\/2023:($d_delta)" | cut -d ' ' -f1 | sort | uniq -c | sort -nrk 1 | awk '$1 > 9 {print $0}' >> send.txt
echo "-----------------------" >> send.txt

echo "List URL" >> send.txt
echo "count URL" >> send.txt
less ./logs/access.log | egrep "($d):($d_delta)" | cut -d ' ' -f11 | sort | uniq -c | sort -nrk 1 | awk '$1 > 9 {print $0}' >> send.txt
echo "-----------------------" >> send.txt

echo "Error WEB-server" >> send.txt
less ./logs/access.log | egrep "($d):($d_delta)" | awk '$7 = 500 {print $0}' >> send.txt
echo "-----------------------" >> send.txt

echo "List HTTP response codes" >> send.txt
echo "count code" >> send.txt
less ./logs/access.log | egrep "($d):($d_delta)" | cut -d ' ' -f9 | sort | uniq -c | sort -nrk 1 >> send.txt

echo 'Attachment' | mail -s 'Subject attachment message' -a /home/vagrant/send.txt mail@mydomain.com
