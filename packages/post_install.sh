#!/usr/bin/env bash
brew services start yabai
yabai --start-service
# sudo visudo -f /private/etc/sudoers.d/yabai
skhd --start-service
