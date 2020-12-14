date
gapPrint=3
echo "============= checking load average - start ================================"
top -n1 | grep 'load average'
echo "---------------------------------------"
sar -q 1 3
echo "============= checking load average - end =================================="
yes ''| sed ${gapPrint}q
echo "============= checking tcpdump latency - start ================================"
#CRT_TCP_DUMP_TO=15s
#sudo timeout $CRT_TCP_DUMP_TO tcpdump -ttttt -G 15  &
#CRT_TCP_DUMP_PID=$!
#sleep $CRT_TCP_DUMP_TO
#sudo kill -9 $CRT_TCP_DUMP_PID
echo "============= checking tcpdump average - end =================================="
yes ''| sed ${gapPrint}q
echo "============= tracert of integration systems - start ================================"
# Select the target URL or DNS name to check the trace details.
traceroute www.google.co.in --mtu --back
nslookup www.google.co.in
echo "============= tracert of integration systems - end =================================="
yes ''| sed ${gapPrint}q
echo "============= details of interrupts - start ================================"
cat /proc/interrupts
echo "============= details of interrupts - end ================================"
yes ''| sed ${gapPrint}q
echo "============= DNS RTT time check - start ================================"
awk '/nameserver/{print $2}' /etc/resolv.conf | while read line; do
echo $line
    traceroute $line
    ping -c 5 $line
done
echo "============= DNS RTT time check - end ================================"
yes ''| sed ${gapPrint}q
echo "============= SOCKET DETAILS check - start ================================"
sar -n SOCK
echo "============= SOCKET DETAILS check - end ================================"
yes ''| sed ${gapPrint}q
echo "============= Network interface errors check - start ================================"
sar -n EDEV
echo "============= Network interface errors check - end ================================"
yes ''| sed ${gapPrint}q
echo "============= Network interface statistics check - start ================================"
sar -n DEV
echo "============= Network interface statistics check - end ================================"
yes ''| sed ${gapPrint}q
echo "============= Asynchronous io requests check - start ================================"
sysctl fs.aio-max-nr
sysctl fs.aio-nr
echo "============= Asynchronous io requests check - end ================================"
yes ''| sed ${gapPrint}q
exit 0

