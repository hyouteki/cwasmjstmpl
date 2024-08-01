#!/bin/bash

set -e

MODULE_NAME="module"
WARNS="-Wall -Wextra -Wswitch-enum"

clang -Os -fno-builtin $WARNS --target=wasm32 \
	  --no-standard-libraries -Wl,--export=sum \
	  -Wl,--no-entry -Wl,--allow-undefined \
	  -o ${MODULE_NAME}.wasm ${MODULE_NAME}.c

wasm2wat ${MODULE_NAME}.wasm > ${MODULE_NAME}.wat

python3 -m http.server &
SERVER_PID=$!

open localhost:8000

# close the python server after 5 seconds
sleep 5
kill $SERVER_PID
wait $SERVER_PID 2>/dev/null
