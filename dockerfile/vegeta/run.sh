#!/bin/bash
echo "GET $URL" | vegeta attack -duration=$DURATIONs -rate $RATE  | tee results.bin | vegeta report
