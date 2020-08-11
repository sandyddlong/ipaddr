#/bin/bash
tail -n 20000 /var/log/nginx/access.log>./2000.log
ip=`cat 2000.log |awk '{print $1}'|sort|uniq -c|sort -nr|head -n 10|awk '{print $2}'`
for i in $ip
do
    address=`curl -s freeapi.ipip.net/$i 2>/dev/null`
    echo $i"=>"$address
done
