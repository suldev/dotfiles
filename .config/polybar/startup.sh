#!/bin/sh

killall -q polybar

polybar main >>$HOME/logs/polybar.log &
