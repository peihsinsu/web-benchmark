#!/bin/bash
docker logs web | grep -v error | goaccess -o out.html --log-format=COMBINED --real-time-html -
