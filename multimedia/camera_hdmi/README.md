# PIC64GX OV5647 And HDMI Demo Example Scripts

The live video demo examples scripts perform the following tasks:

- Configure the capture and display pipelines to 720p resolution using v4l2-utils.
- Use standard v4l2-ctl or gst-launch command to get video frames from capture pipeline and push then to display pipeline.

## Prerequisites

- PIC64GX Curiosity Kit.
- HDMI monitor supporting 720p resolution.
- OV5647 camera with 25MHz clock.
- HDMI cable connected from the PIC64GX Curiosity Kit to the monitor
- Type-C cable to power up the board and console access.

### Basic check for video pipeline enumeration after boot

Run the command below to check if the video pipeline enumeration was successful.

```bash
root@pic64gx-curiosity-kit:~# v4l2-ctl --list-devices
```

A successful execution should look like:

```bash
root@pic64gx-curiosity-kit:~# v4l2-ctl --list-devices
MCHP Camera Media Pipeline (platform:mchp-vcpp):
        /dev/video1
        /dev/media1

MCHP Video Out Media Pipeline (platform:mchp-vout):
        /dev/video0
        /dev/media0
```

### Live video using gst-launch command

Run the script below to get the camera frames and push them to the HDMI display using gst-launch.

```bash
root@pic64gx-curiosity-kit:~# /opt/microchip/multimedia/camera_hdmi/demo_pic64gx_hdmi_and_ov5647_gst_launch.sh
```

A successful execution should look like:

```bash
root@pic64gx-curiosity-kit:~# /opt/microchip/multimedia/camera_hdmi/demo_pic64gx_hdmi_and_ov5647_gst_launch.sh
Opening media device /dev/media1
Enumerating entities
looking up device: 81:3
looking up device: 81:4
looking up device: 81:5
looking up device: 81:6
looking up device: 81:7
looking up device: 81:8
looking up device: 81:9
looking up device: 81:10
Found 8 entities
Enumerating p[  365.259542] microchip-csi2rxss 60001000.csi2rx: csi_fixed_out_raw8 is enabled
ads and links
Setting up format SBGGR10_1X10 1920x1080 on pad ov5647 1-0036/0
Format set: SBGGR10_1X10 1920x1080
Setting up format SBGGR10_1X10 1920x1080 on pad 60001000.csi2rx/0
Format set: SBGGR10_1X10 1920x1080
Opening media device /dev/media1
Enumerating entities
looking up device: 81:3
looking up device: 81:4
looking up device: 81:5
looking up device: 81:6
looking up device: 81:7
looking up device: 81:8
looking up device: 81:9
looking up device: 81:10
Found 8 entities
Enumerating pads and links
Setting up format SBGGR10_1X10 1920x1080 on pad 60001000.csi2rx/1
Format set: SRGGB8_1X8 1920x1080
Setting up format SRGGB8_1X8 1920x1080 on pad 60008000.demosaic-0/0
Format set: SRGGB8_1X8 1920x1080
Opening media device /dev/media1
Enumerating entities
looking up device: 81:3
looking up device: 81:4
looking up device: 81:5
looking up device: 81:6
looking up device: 81:7
looking up device: 81:8
looking up device: 81:9
looking up device: 81:10
Found 8 entities
Enumerating pads and links
Setting up format SBGGR8_1X8 1920x1080 on pad 60008000.demosaic-0/0
Format set: SBGGR8_1X8 1920x1080
Opening media device /dev/media1
Enumerating entities
looking up device: 81:3
looking up device: 81:4
looking up device: 81:5
looking up device: 81:6
looking up device: 81:7
looking up device: 81:8
looking up device: 81:9
looking up device: 81:10
Found 8 entities
Enumerating pads and links
Setting up format RBG888_1X24 1920x1080 on pad 6000b000.white-balance/0
Format set: RGB888_1X24 1920x1080
Opening media device /dev/media1
Enumerating entities
looking up device: 81:3
looking up device: 81:4
looking up device: 81:5
looking up device: 81:6
looking up device: 81:7
looking up device: 81:8
looking up device: 81:9
looking up device: 81:10
Found 8 entities
Enumerating pads and links
Setting up format RBG888_1X24 1920x1080 on pad 60004000.image-enhancement/0
Format set: RGB888_1X24 1920x1080
Opening media device /dev/media1
Enumerating entities
looking up device: 81:3
looking up device: 81:4
looking up device: 81:5
looking up device: 81:6
looking up device: 81:7
looking up device: 81:8
looking up device: 81:9
looking up device: 81:10
Found 8 entities
Enumerating pads and links
Setting up format RBG888_1X24 1920x1080 on pad 60005000.rgb-scaler/0
Format set: RGB888_1X24 1920x1080
Setting up selection target 0 rectangle (0,0)/1280x720 on pad 60005000.rgb-scaler/0
Selection rectangle set: (0,0)/1280x720
Opening media device /dev/media1
Enumerating entities
looking up device: 81:3
looking up device: 81:4
looking up device: 81:5
looking up device: 81:6
looking up device: 81:7
looking up device: 81:8
looking up device: 81:9
looking up device: 81:10
Found 8 entities
Enumerating pads and links
Setting up format RBG888_1X24 1280x720 on pad 60007000.generic-video-pipeline/0
Format set: RGB888_1X24 1280x720
Opening media device /dev/media0
Enumerating entities
looking up device: 81:0
looking up device: 81:1
looking up device: 81:2
Found 3 entities
Enumerating pads and links
Setting up format RGB888_1X24 1280x720 on pad 60009000.generic-video-pipeline/0
Format set: UYVY8_1X16 1280x720
Opening media device /dev/media0
Enumerating entities
looking up device: 81:0
looking up device: 81:1
looking up device: 81:2
Found 3 entities
Enumerating pads and links
Setting up format RGB888_1X24 1280x720 on pad 6000c000.display-controller-0/0
Format set: RGB888_1X24 1280x720
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps = video/x-raw, format=(string)YUY2, width=(int)1280, height=(int)720, interlace-mode=(string)progressive, colorimetry=(string)21
/GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: caps = video/x-raw, format=(string)YUY2, width=(int)1280, height=(int)720, interlace-mode=(string)progressive, colorimetry=(st1
/GstPipeline:pipeline0/GstV4l2Sink:v4l2sink0.GstPad:sink: caps = video/x-raw, format=(string)YUY2, width=(int)1280, height=(int)720, interlace-mode=(string)progressive, colorimetry=(strin1
/GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: caps = video/x-raw, format=(string)YUY2, width=(int)1280, height=(int)720, interlace-mode=(string)progressive, colorimetry=(s1
Redistribute latency...
0:01:29.5 / 99:99:99.
```

### Live video using v4l2-ctl command

Run the script below to get the camera frames and push them to the HDMI display using the v4l2-ctl command.

```bash
root@pic64gx-curiosity-kit:~# /opt/microchip/multimedia/camera_hdmi/demo_pic64gx_hdmi_and_ov5647_v4l2_ctl.sh
```

A successful execution should look like:

```bash
root@pic64gx-curiosity-kit:~# /opt/microchip/multimedia/camera_hdmi/demo_pic64gx_hdmi_and_ov5647_v4l2_ctl.sh
Opening media device /dev/media1
Enumerating entities
looking up device: 81:3
looking up device: 81:4
looking up device: 81:5
looking up device: 81:6
looking up device: 81:7
looking up device: 81:8
looking up device: 81:9
looking up device: 81:10
Found 8 entities
Enumerating p[  504.642545] microchip-csi2rxss 60001000.csi2rx: csi_fixed_out_raw8 is enabled
ads and links
Setting up format SBGGR10_1X10 1920x1080 on pad ov5647 1-0036/0
Format set: SBGGR10_1X10 1920x1080
Setting up format SBGGR10_1X10 1920x1080 on pad 60001000.csi2rx/0
Format set: SBGGR10_1X10 1920x1080
Opening media device /dev/media1
Enumerating entities
looking up device: 81:3
looking up device: 81:4
looking up device: 81:5
looking up device: 81:6
looking up device: 81:7
looking up device: 81:8
looking up device: 81:9
looking up device: 81:10
Found 8 entities
Enumerating pads and links
Setting up format SBGGR10_1X10 1920x1080 on pad 60001000.csi2rx/1
Format set: SRGGB8_1X8 1920x1080
Setting up format SRGGB8_1X8 1920x1080 on pad 60008000.demosaic-0/0
Format set: SRGGB8_1X8 1920x1080
Opening media device /dev/media1
Enumerating entities
looking up device: 81:3
looking up device: 81:4
looking up device: 81:5
looking up device: 81:6
looking up device: 81:7
looking up device: 81:8
looking up device: 81:9
looking up device: 81:10
Found 8 entities
Enumerating pads and links
Setting up format SBGGR8_1X8 1920x1080 on pad 60008000.demosaic-0/0
Format set: SBGGR8_1X8 1920x1080
Opening media device /dev/media1
Enumerating entities
looking up device: 81:3
looking up device: 81:4
looking up device: 81:5
looking up device: 81:6
looking up device: 81:7
looking up device: 81:8
looking up device: 81:9
looking up device: 81:10
Found 8 entities
Enumerating pads and links
Setting up format RBG888_1X24 1920x1080 on pad 6000b000.white-balance/0
Format set: RGB888_1X24 1920x1080
Opening media device /dev/media1
Enumerating entities
looking up device: 81:3
looking up device: 81:4
looking up device: 81:5
looking up device: 81:6
looking up device: 81:7
looking up device: 81:8
looking up device: 81:9
looking up device: 81:10
Found 8 entities
Enumerating pads and links
Setting up format RBG888_1X24 1920x1080 on pad 60004000.image-enhancement/0
Format set: RGB888_1X24 1920x1080
Opening media device /dev/media1
Enumerating entities
looking up device: 81:3
looking up device: 81:4
looking up device: 81:5
looking up device: 81:6
looking up device: 81:7
looking up device: 81:8
looking up device: 81:9
looking up device: 81:10
Found 8 entities
Enumerating pads and links
Setting up format RBG888_1X24 1920x1080 on pad 60005000.rgb-scaler/0
Format set: RGB888_1X24 1920x1080
Setting up selection target 0 rectangle (0,0)/1280x720 on pad 60005000.rgb-scaler/0
Selection rectangle set: (0,0)/1280x720
Opening media device /dev/media1
Enumerating entities
looking up device: 81:3
looking up device: 81:4
looking up device: 81:5
looking up device: 81:6
looking up device: 81:7
looking up device: 81:8
looking up device: 81:9
looking up device: 81:10
Found 8 entities
Enumerating pads and links
Setting up format RBG888_1X24 1280x720 on pad 60007000.generic-video-pipeline/0
Format set: RGB888_1X24 1280x720
Opening media device /dev/media0
Enumerating entities
looking up device: 81:0
looking up device: 81:1
looking up device: 81:2
Found 3 entities
Enumerating pads and links
Setting up format RGB888_1X24 1280x720 on pad 60009000.generic-video-pipeline/0
Format set: UYVY8_1X16 1280x720
Opening media device /dev/media0
Enumerating entities
looking up device: 81:0
looking up device: 81:1
looking up device: 81:2
Found 3 entities
Enumerating pads and links
Setting up format RGB888_1X24 1280x720 on pad 6000c000.display-controller-0/0
Format set: RGB888_1X24 1280x720
                VIDIOC_G_FMT returned -1 (Invalid argument)
<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>< 30.62 fps
><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>< 30.62 fps
><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>< 30.62 fps
```
