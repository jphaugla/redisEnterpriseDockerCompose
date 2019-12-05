sudo docker exec --user root   n1 bash -c "iptables -P INPUT ACCEPT; iptables -P FORWARD ACCEPT; iptables -P OUTPUT ACCEPT; iptables -t 
nat -F ; iptables -t mangle -F; iptables -F; iptables -X;"
sudo docker exec --user root   s1 bash -c "iptables -P INPUT ACCEPT; iptables -P FORWARD ACCEPT; iptables -P OUTPUT ACCEPT; iptables -t 
nat -F ; iptables -t mangle -F; iptables -F; iptables -X;"
