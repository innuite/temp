date
gapPrint=3
echo"============= checking memory faults - start ================================"
# A minor fault means the page is in memory but not allocated to the requesting process or not marked as present in the memory management unit. A major fault means the page in no longer in memory.
# Displays the faults sorted by major faults along with the process.
ps -eo min_flt,maj_flt,pcpu,cmd --sort=-maj_flt
echo"============= checking memory faults - end =================================="
yes ''| sed ${gapPrint}q
echo"============= checking oom score - start ================================"
sudo ps aux | grep java  &
CRT_MEM_PNAME_PID=$!
cat /proc/$CRT_MEM_PNAME_PID/oom_score
echo"============= checking oom score - end =================================="
yes ''| sed ${gapPrint}q
echo"============= checking swap memory issues - start ================================"
# Printing free memory and available memory in megabytes
free -w -t --mega 
echo "---------------------------------------"
vmstat
echo "---------------------------------------"
sar -S 1 3
echo"============= checking swap memory issues - end =================================="
yes ''| sed ${gapPrint}q
echo"============= checking low level memory metrics - start ================================"
sar -r ALL 1 25
echo"============= checking low level memory metrics - end ================================"
yes ''| sed ${gapPrint}q
echo"============= checking file handler metrics - start ================================"
echo ":total allocated - currently used handles - maximum file handles:"
sysctl fs.file-nr
echo"============= checking file handler metrics - end ================================"
yes ''| sed ${gapPrint}q
echo"============= checking io stats for block devices - start ================================"
iostat -p | grep -v loop
echo"============= checking io stats for block devices - end ================================"
yes ''| sed ${gapPrint}q
exit 0

