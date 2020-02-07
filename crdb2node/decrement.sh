for i in {0..120}
do
  echo DECRBY mykey 1 | redis-cli -p 12005
  sleep 1
  echo $i
done
