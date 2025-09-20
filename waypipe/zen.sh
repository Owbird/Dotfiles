#!/bin/bash
flatpak run \
          --env=WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
          --filesystem=/run/user/1000/$WAYLAND_DISPLAY \
          --socket=wayland \
          app.zen_browser.zen
