date
echo"============= checking memory faults - start ================================"
# A minor fault means the page is in memory but not allocated to the requesting process or not marked as present in the memory management unit. A major fault means the page in no longer in memory.
# Displays the faults sorted by major faults along with the process.
ps -eo min_flt,maj_flt,pcpu,cmd --sort=-maj_flt
echo"============= checking memory faults - end =================================="

echo"============= checking ping latency - start ================================"

echo"============= checking ping average - end =================================="

echo"============= checking oom score - start ================================"
sudo ps aux | grep java  &
CRT_MEM_PNAME_PID=$!
cat /proc/$CRT_MEM_PNAME_PID/oom_score
echo"============= checking oom score - end =================================="

echo"============= checking swap memory issues - start ================================"
# Printing free memory and available memory in megabytes
free -w -t --mega 
echo "---------------------------------------"
vmstat
cat /proc/$CRT_MEM_PNAME_PID/oom_score
echo"============= checking swap memory issues - end =================================="
