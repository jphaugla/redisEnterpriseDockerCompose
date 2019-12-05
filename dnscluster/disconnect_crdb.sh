sudo docker exec --user root  n1 bash -c "iptables -A INPUT -s 172.18.0.31  -p tcp --destination-port 12000 -j DROP"
sudo docker exec --user root  n1 bash -c "iptables -A OUTPUT -s 172.18.0.31  -p tcp --destination-port 12000 -j DROP"
sudo docker exec --user root  s1 bash -c "iptables -A INPUT -s 172.18.0.21  -p tcp --destination-port 12000 -j DROP"
sudo docker exec --user root  s1 bash -c "iptables -A OUTPUT -s 172.18.0.21  -p tcp --destination-port 12000 -j DROP"
