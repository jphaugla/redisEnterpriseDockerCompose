for i in {0..120}
do
  echo INCRBY mykey 2 | redis-cli -p 14555
  sleep 1
  echo $i
done
