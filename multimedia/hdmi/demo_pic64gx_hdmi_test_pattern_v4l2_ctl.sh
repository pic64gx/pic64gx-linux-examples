#!/bin/sh
v4l2-ctl --device /dev/video0 --set-fmt-video-out=width=1280,height=720,pixelformat=YUYV
media-ctl -v -V '"60009000.generic-video-pipeline":0 [fmt:RGB888_1X24/1280x720]' -d /dev/media0
media-ctl -v -V '"6000c000.display-controller-0":0 [fmt:RGB888_1X24/1280x720]' -d /dev/media0

v4l2-ctl --stream-out-pattern=4 --stream-out-border  --stream-out-vert-speed=1 --stream-out-hor-speed=1 --out-device /dev/video0 --stream-out-mmap

