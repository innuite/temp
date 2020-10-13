date
echo "============= checking load average - start ================================"
top -n1 | grep 'load average'
echo "============= checking load average - end =================================="

echo "============= checking tcpdump latency - start ================================"
CRT_TCP_DUMP_TO=15s
sudo timeout $CRT_TCP_DUMP_TO tcpdump -ttttt -G 15  &
CRT_TCP_DUMP_PID=$!
sleep $CRT_TCP_DUMP_TO
sudo kill -9 $CRT_TCP_DUMP_PID
echo "============= checking tcpdump average - end =================================="

echo "============= tracert of integration systems - start ================================"
traceroute www.google.co.in --mtu --back
nslookup www.google.co.in
echo "============= tracert of integration systems - end =================================="

echo "============= details of interrupts - start ================================"
cat /proc/interrupts
echo "============= details of interrupts - end ================================"

echo "============= DNS RTT time check - start ================================"
awk '/nameserver/{print $2}' /etc/resolv.conf | while read line; do
echo $line
    traceroute $line
    ping -c 5 $line
done
echo "============= DNS RTT time check - end ================================"


