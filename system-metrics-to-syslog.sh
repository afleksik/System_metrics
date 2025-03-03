#!/bin/bash

ram_used=$(free | grep Mem | awk '{printf "%.2f", $3/$2 * 100}')
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{printf "%.2f", 100 - $1}')

message="RAM_usage = ${ram_used}%  CPU_usage: ${cpu_usage}%"

logger -t system-metrics "$message"
