#!/bin/sh

capture_media0=$(/usr/bin/media-ctl -p -d /dev/media0 | grep "entity 1:" | awk '{print $4}')
capture_video0=$(/usr/bin/v4l2-ctl -d /dev/video0  -D | grep "Name" | awk '{print $3}' )

if [ "$capture_video0" = "microchip_vcpp" ]; then
        echo "found capture device /dev/video0"
        capture_video=/dev/video0
else
	echo "not found capture device"
	exit 1
fi

if [ "$capture_media0" = "microchip_vcpp" ]; then
        echo "found capture media device /dev/media0"
        capture_media=/dev/media0
else
	echo "not found capture media device"
	exit 1
fi

media-ctl -v -V '"ov5647 1-0036":0 [fmt:SBGGR10_1X10/640x480 field:none colorspace:raw xfer:none]' -d $capture_media
media-ctl -v -V '"60001000.csi2rx":1 [fmt:SBGGR10_1X10/640x480 field:none colorspace:srgb xfer:none]' -d $capture_media
media-ctl -v -V '"60008000.demosaic":0 [fmt:SBGGR8_1X8/640x480 field:none colorspace:raw xfer:none]' -d $capture_media
media-ctl -v -V '"6000b000.white-balance":0  [fmt:RBG888_1X24/640x480 field:none colorspace:srgb]' -d $capture_media
media-ctl -v -V '"60004000.image-enhancement":0  [fmt:RBG888_1X24/640x480 field:none colorspace:srgb]' -d $capture_media
media-ctl -v -V '"60005000.rgb-scaler":0 [fmt:RBG888_1X24/640x480 crop: (0,0)/640x480 field:none colorspace:srgb]' -d $capture_media
media-ctl -v -V '"60007000.generic-video-pipeline":0 [fmt:RBG888_1X24/640x480 field:none colorspace:srgb]' -d $capture_media
v4l2-ctl --device $capture_video --set-fmt-video=width=640,height=480,pixelformat=YUYV
 
v4l2-ctl -d $capture_video --set-ctrl=auto_exposure=0 --set-ctrl=gain_automatic=1 --set-ctrl=white_balance_automatic=1

