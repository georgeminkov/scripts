$path='/var/logs/someappslogs' # path where the logs are
$pattern='*.log'   # matching pattern for the files

cd $path
for i in $(ls $pattern -t | tail -n +2); do # select all but the last one ordered by time / just schedule as per file/logs rotation
echo $i # echo could be removed
tar -czf $i.tar.gz $i # archive 
rm $i # remove the original file
done
