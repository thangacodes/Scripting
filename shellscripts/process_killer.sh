#!/bin/bash
echo "find process using port 5000..."
# Find the PID of the process using port 5000
PID=$(lsof -ti :5000)       # -ti -> option ensures that only PIDs are returned, omitting other details.

# Check if a PID was found
if [ -z "$PID" ]; then
    echo "No process found using port 5000."
else
    echo "Process ID(s) using port 5000: $PID"
    echo "Killing the process(es)..."
    # Kill the process using the PID(s)
    kill -9 $PID
    echo "Process(es) killed."
fi
