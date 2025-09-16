#!/usr/bin/env bash

addr=$(ip route show default | awk '{print $3}')

scrcpy --tcpip=$addr:5555 $1