#!/bin/bash

#!/bin/bash
echo "[!] Make sure your URL ends with /FUZZ"
set -x

$target=$1
$worlist=$2
# Scan
ffuf -w $worlist \
    -u $target \
    -H "X-Scanner: FFUF" \
    -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0" \
    -of all \
    -o /var/reports/ffuf_scan \
    -ac \
    -mc 200 \
    ${@:2}

# Parse the report
python3 ffuf_qt.py
