#!/bin/sh
media-ctl -v -V '"ov5647 1-0036":0 [fmt:SBGGR10_1X10/1920x1080 field:none colorspace:raw xfer:none]' -d /dev/media1
media-ctl -v -V '"60001000.csi2rx":1 [fmt:SBGGR10_1X10/1920x1080 field:none colorspace:srgb xfer:none]' -d /dev/media1
media-ctl -v -V '"60008000.demosaic-0":0 [fmt:SBGGR8_1X8/1920x1080 field:none colorspace:raw xfer:none]' -d /dev/media1
media-ctl -v -V '"6000b000.white-balance":0  [fmt:RBG888_1X24/1920x1080 field:none colorspace:srgb]' -d /dev/media1
media-ctl -v -V '"60004000.image-enhancement":0  [fmt:RBG888_1X24/1920x1080 field:none colorspace:srgb]' -d /dev/media1
media-ctl -v -V '"60005000.rgb-scaler":0 [fmt:RBG888_1X24/1920x1080 crop: (0,0)/1280x720 field:none colorspace:srgb]' -d /dev/media1
media-ctl -v -V '"60007000.generic-video-pipeline":0 [fmt:RBG888_1X24/1280x720 field:none colorspace:srgb]' -d /dev/media1
v4l2-ctl --device /dev/video1 --set-fmt-video=width=1280,height=720,pixelformat=YUYV
 
v4l2-ctl --device /dev/video0 --set-fmt-video-out=width=1280,height=720,pixelformat=YUYV
media-ctl -v -V '"60009000.generic-video-pipeline":0 [fmt:RGB888_1X24/1280x720]' -d /dev/media0
media-ctl -v -V '"6000c000.display-controller-0":0 [fmt:RGB888_1X24/1280x720]' -d /dev/media0

v4l2-ctl -d /dev/video1 --set-ctrl=auto_exposure=0 --set-ctrl=gain_automatic=1 --set-ctrl=white_balance_automatic=1

gst-launch-1.0 -v v4l2src device=/dev/video1 io-mode=2 ! video/x-raw, format=YUY2, width=1280, height=720, interlace-mode=progressive ! v4l2sink device=/dev/video0

