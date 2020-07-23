#!/bin/sh

killall -q polybar

polybar -r main &
polybar -r secondary &
