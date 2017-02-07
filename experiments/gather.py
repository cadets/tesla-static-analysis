#!/usr/local/bin/python3
from subprocess import Popen, PIPE
import sys
import statistics

def get_wall_time(prog, t, n):
    p = Popen(["/usr/bin/time", "-p", prog, str(t), str(n)], stdout=PIPE, stderr=PIPE)
    o, e = p.communicate()
    line = str(e).split('\\n')[0]
    val = line.split(' ')[-1]
    return float(val)

if __name__ == "__main__":
    prog = sys.argv[2]
    runs = int(sys.argv[1])
    times = []
    threads = int(sys.argv[3])
    n = int(sys.argv[4])
    for i in range(0, runs):
        time = get_wall_time(prog, threads, n)
        times.append(time)
    for i in range(0, runs-1):
        print(times[i], end=",")
    print(times[runs-1])
    print("{:.2f} +- {:.2f}s".format(statistics.mean(times), statistics.pstdev(times)))
