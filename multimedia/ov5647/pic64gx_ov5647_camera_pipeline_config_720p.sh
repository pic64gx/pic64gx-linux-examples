#!/bin/sh

cd /boot/ || exit

FILE=pic64gx_curiosity_kit_capture_pipeline_with_ov5647.dtbo

if [ -f $FILE ]; then
	echo "File $FILE exists."
	/opt/microchip/dt-overlays/overlay.sh $FILE
	cd || exit
	# Wait for the video pipeline enumeration to complete
	sleep 0.5
else
	echo "File $FILE does not exist."
	exit 1
fi

capture_media0=$(/usr/bin/media-ctl -p -d /dev/media0 | grep "entity 1:" | awk '{print $4}')
capture_video0=$(/usr/bin/v4l2-ctl -d /dev/video0  -D | grep "Name" | awk '{print $3}' )

if [ "$capture_video0" = "microchip_vcpp" ]; then
        capture_video=/dev/video0
        echo "Found capture device $capture_video"
else
	echo "Capture device /dev/video0 not found"
	exit 1
fi

if [ "$capture_media0" = "microchip_vcpp" ]; then
        capture_media=/dev/media0
        echo "Found capture media device $capture_media"
else
	echo "Capture media device /dev/media0 not found"
	exit 1
fi

media-ctl -v -V '"ov5647 1-0036":0 [fmt:SBGGR10_1X10/1920x1080 field:none colorspace:raw xfer:none]' -d $capture_media
media-ctl -v -V '"60001000.csi2rx":1 [fmt:SBGGR10_1X10/1920x1080 field:none colorspace:srgb xfer:none]' -d $capture_media
media-ctl -v -V '"60008000.demosaic":0 [fmt:SBGGR8_1X8/1920x1080 field:none colorspace:raw xfer:none]' -d $capture_media
media-ctl -v -V '"6000b000.white-balance":0  [fmt:RBG888_1X24/1920x1080 field:none colorspace:srgb]' -d $capture_media
media-ctl -v -V '"60004000.image-enhancement":0  [fmt:RBG888_1X24/1920x1080 field:none colorspace:srgb]' -d $capture_media
media-ctl -v -V '"60005000.rgb-scaler":0 [fmt:RBG888_1X24/1920x1080 crop: (0,0)/1280x720 field:none colorspace:srgb]' -d $capture_media
media-ctl -v -V '"60007000.generic-video-pipeline":0 [fmt:RBG888_1X24/1280x720 field:none colorspace:srgb]' -d $capture_media
v4l2-ctl --device $capture_video --set-fmt-video=width=1280,height=720,pixelformat=YUYV
 
v4l2-ctl -d $capture_video --set-ctrl=auto_exposure=0 --set-ctrl=gain_automatic=1 --set-ctrl=white_balance_automatic=1

