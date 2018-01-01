#!/bin/bash
echo "GET $URL" | vegeta attack -duration=$DURATION -rate $RATE  | tee results.bin | vegeta report
