#!/bin/bash
logFile={logPath+file}
scanDist={path to file would be removed}
filesPatt={files pattern}
curr=$(df / 2>&1 | head -n 2 | cut -d'%' -f1 | cut -d ' ' -f 7)
threshold={two digits represent %}
sudo echo "-------$(date +%Y-%m-%d)-------" >>$logFile
echo "Current usage is $curr" >>$logFile
echo "Threshold is to $threshold" >>$logFile
if [ $curr -gt $threshold ]
then

        sudo echo "$(date +%Y-%m-%d) Disk usage limit breached at $curr" >>/backups/logDeletions.txt
        while [ $curr -gt $threshold ]
        do
                sudo echo "usage down to $curr" >>$logFile
                echo "$(ls -t $scanDist/$filesPatt | tail -1)" >>$logFile
                sudo rm $(ls -t $scanDist/$filesPatt | tail -1)
                curr=$(df / 2>&1 | head -n 2 | cut -d'%' -f1 | cut -d ' ' -f 7)
        done
else
sudo echo "$(date +%Y-%m-%d) Disk usage in norm at $curr" >>$logFile
fi
