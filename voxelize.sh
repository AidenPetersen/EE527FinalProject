Xvfb :99 -screen 0 640x480x24 &
export DISPLAY=:99
./binvox $1
