#!/usr/bin/env bash

# Terminate any currently running instances
killall -q polybar

# Pause while killall completes
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    tray=""
    if [ "$m" = "eDP-1-1" ]; then
        tray="right"
    fi

    TRAY=$tray MONITOR=$m polybar --reload example -c ~/.config/polybar/config &
  done
else
  polybar --reload example -c ~/.config/polybar/config &
fi

# Launch bar(s)
# polybar dummy -q &
# polybar top -q &
# polybar bottom -q  &

echo "polybars launched..."
