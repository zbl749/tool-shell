#!/bin/bash
date=`date +%Y%m%d%H%M`
echo $date
/usr/bin/mysqldump -h{{ host }} --port={{ port }} -u{{ user }} -p{{ password }} {{ dbname }} > {{ path }}/{{ dbname }}_$date.sql;

/usr/bin/mysqldump -h{{ host }} --port={{ port }} -u{{ user }} -p{{ password }}  --no-tablespaces {{ dbname }} > {{ path }}/{{ dbname }}_$date.sql;