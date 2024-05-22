#!/usr/bin/env bash

killall -q polybar
#wait until process is down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#Launch bar1 and bar2
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload root &
        MONITOR=$m polybar --reload back &
        MONITOR=$m polybar --reload left &
        MONITOR=$m polybar --reload right &
        MONITOR=$m polybar --reload center &
    done
else
    polybar --reload root &
    polybar --reload back &
    polybar --reload left &
    polybar --reload right &
    polybar --reload center &
fi
