#!/usr/bin/env bash

ts=`date +%s`

main() {
 ffmpeg -f video4linux2 -s vga -i /dev/video0 -vframes 3 /tmp/vid-$ts.%01d.jpg
 exit 0  #important - has to exit with status 0
}

main()
