#!/bin/bash
nohup parity --db-compaction=hdd --no-config --base-path=blockchain --no-ui --no-ipc --jsonrpc-port=5544 >> output.log 2>&1 &
echo $! > parity.pid
