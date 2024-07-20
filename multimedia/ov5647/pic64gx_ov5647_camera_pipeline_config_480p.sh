#!/bin/sh
media-ctl -v -V '"ov5647 1-0036":0 [fmt:SBGGR10_1X10/640x480 field:none colorspace:raw xfer:none]' -d /dev/media1
media-ctl -v -V '"60001000.csi2rx":1 [fmt:SBGGR10_1X10/640x480 field:none colorspace:srgb xfer:none]' -d /dev/media1
media-ctl -v -V '"60008000.demosaic-0":0 [fmt:SBGGR8_1X8/640x480 field:none colorspace:raw xfer:none]' -d /dev/media1
media-ctl -v -V '"6000b000.white-balance":0  [fmt:RBG888_1X24/640x480 field:none colorspace:srgb]' -d /dev/media1
media-ctl -v -V '"60004000.image-enhancement":0  [fmt:RBG888_1X24/640x480 field:none colorspace:srgb]' -d /dev/media1
media-ctl -v -V '"60005000.rgb-scaler":0 [fmt:RBG888_1X24/640x480 crop: (0,0)/640x480 field:none colorspace:srgb]' -d /dev/media1
media-ctl -v -V '"60007000.generic-video-pipeline":0 [fmt:RBG888_1X24/640x480 field:none colorspace:srgb]' -d /dev/media1
v4l2-ctl --device /dev/video1 --set-fmt-video=width=640,height=480,pixelformat=YUYV
 
v4l2-ctl -d /dev/video1 --set-ctrl=auto_exposure=0 --set-ctrl=gain_automatic=1 --set-ctrl=white_balance_automatic=1
