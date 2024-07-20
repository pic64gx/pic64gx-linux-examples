# PIC64GX HDMI (Video Out) Examples Scripts

The HDMI demo examples scripts perform the following tasks:

- Configure the display pipelines to 720p resolution using v4l2-utils.
- Use standard v4l2-ctl or gst-launch command to show some test pattern or image on the HDMI screen.

## Prerequisites

- PIC64GX Curiosity Kit.
- HDMI monitor supporting 720p resolution.
- OV5647 camera with 25MHz clock.
- HDMI cable connected from the PIC64GX Curiosity Kit to the monitor
- Type-C cable to power up the board and console access.

### Basic check for video pipeline enumerated after boot

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

### Configure and run the v4l2-ctl command test pattern demo

Run the script below to configure the video output pipeline to a 720p resolution and run the test pattern using the v4l2-ctl command.
Expected output: The HDMI display will show a scrolling checker box pattern.

```bash
root@pic64gx-curiosity-kit:~# /opt/microchip/multimedia/hdmi/demo_pic64gx_hdmi_test_pattern_v4l2_ctl.sh
```

A successful execution should look like:

```bash
root@pic64gx-curiosity-kit:~# /opt/microchip/multimedia/hdmi/demo_pic64gx_hdmi_test_pattern_v4l2_ctl.sh
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
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 53.61 fps
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 53.61 fps
```

### Configure and run the gstreamer command test pattern demo

Run below script to configure the video out pipeline to 720p resolution and run the test pattern with gestremer command.
Expected output: HDMI Display will show colour bars pattern.

```bash
root@pic64gx-curiosity-kit:~# /opt/microchip/multimedia/hdmi/demo_pic64gx_hdmi_test_pattern_gst_launch.sh
```

A successful execution should look like:

```bash
root@pic64gx-curiosity-kit:~# /opt/microchip/multimedia/hdmi/demo_pic64gx_hdmi_test_pattern_gst_launch.sh
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
Pipeline is PREROLLING ...
/GstPipeline:pipeline0/GstVideoTestSrc:videotestsrc0.GstPad:src: caps = video/x-raw, width=(int)1280, height=(int)720, framerate=(fraction)30/1, multiview-mode=(string)mono, format=(string)YUY2, interlace-mode=(string)progressive, colorimetry=(string)2:4:7:1, pixel-aspect-ratio=(fraction)1/1
/GstPipeline:pipeline0/GstVideoConvert:videoconvert0.GstPad:src: caps = video/x-raw, width=(int)1280, height=(int)720, framerate=(fraction)30/1, multiview-mode=(string)mono, format=(string)YUY2, interlace-mode=(string)progressive, colorimetry=(string)2:4:7:1, pixel-aspect-ratio=(fraction)1/1
/GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: caps = video/x-raw, width=(int)1280, height=(int)720, framerate=(fraction)30/1, multiview-mode=(string)mono, format=(string)YUY2, interlace-mode=(string)progressive, colorimetry=(string)2:4:7:1, pixel-aspect-ratio=(fraction)1/1
/GstPipeline:pipeline0/GstV4l2Sink:v4l2sink0.GstPad:sink: caps = video/x-raw, width=(int)1280, height=(int)720, framerate=(fraction)30/1, multiview-mode=(string)mono, format=(string)YUY2, interlace-mode=(string)progressive, colorimetry=(string)2:4:7:1, pixel-aspect-ratio=(fraction)1/1
/GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: caps = video/x-raw, width=(int)1280, height=(int)720, framerate=(fraction)30/1, multiview-mode=(string)mono, format=(string)YUY2, interlace-mode=(string)progressive, colorimetry=(string)2:4:7:1, pixel-aspect-ratio=(fraction)1/1
/GstPipeline:pipeline0/GstVideoConvert:videoconvert0.GstPad:sink: caps = video/x-raw, width=(int)1280, height=(int)720, framerate=(fraction)30/1, multiview-mode=(string)mono, format=(string)YUY2, interlace-mode=(string)progressive, colorimetry=(string)2:4:7:1, pixel-aspect-ratio=(fraction)1/1
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
Redistribute latency...
New clock: GstSystemClock
0:00:03.1 / 99:99:99.
```

### Configure and run the gestremer to display jpg file demo

Run the script below to configure the video output pipeline to a 720p resolution and display a JPG file on HDMI using the GStreamer command.
Expected output: HDMI Display will show the Microchip logo.

```bash
root@pic64gx-curiosity-kit:~# /opt/microchip/multimedia/hdmi/demo_pic64gx_hdmi_display_jpg_gst_launch.sh
```

A successful execution should look like:

```bash
root@pic64gx-curiosity-kit:~# /opt/microchip/multimedia/hdmi/demo_pic64gx_hdmi_display_jpg_gst_launch.sh
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
Pipeline is PREROLLING ...
/GstPipeline:pipeline0/GstJpegDec:jpegdec0.GstPad:src: caps = video/x-raw, format=(string)I420, width=(int)1280, height=(int)720, interlace-mode=(string)progressive, multiview-mode=(string)mono, multiview-flags=(GstVideoMultiviewFlagsSet)0:ffffffff:/right-view-first/left-flipped/left-flopped/right-flipped/right-flopped/half-aspect/mixed-mono, pixel-aspect-ratio=(fraction)1/1, chroma-site=(string)jpeg, colorimetry=(string)1:4:0:0, framerate=(fraction)0/1
/GstPipeline:pipeline0/GstVideoConvert:videoconvert0.GstPad:src: caps = video/x-raw, width=(int)1280, height=(int)720, interlace-mode=(string)progressive, multiview-mode=(string)mono, multiview-flags=(GstVideoMultiviewFlagsSet)0:ffffffff:/right-view-first/left-flipped/left-flopped/right-flipped/right-flopped/half-aspect/mixed-mono, pixel-aspect-ratio=(fraction)1/1, framerate=(fraction)0/1, format=(string)YUY2, colorimetry=(string)2:4:7:1
/GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: caps = video/x-raw, width=(int)1280, height=(int)720, interlace-mode=(string)progressive, multiview-mode=(string)mono, multiview-flags=(GstVideoMultiviewFlagsSet)0:ffffffff:/right-view-first/left-flipped/left-flopped/right-flipped/right-flopped/half-aspect/mixed-mono, pixel-aspect-ratio=(fraction)1/1, framerate=(fraction)0/1, format=(string)YUY2, colorimetry=(string)2:4:7:1
/GstPipeline:pipeline0/GstV4l2Sink:v4l2sink0.GstPad:sink: caps = video/x-raw, width=(int)1280, height=(int)720, interlace-mode=(string)progressive, multiview-mode=(string)mono, multiview-flags=(GstVideoMultiviewFlagsSet)0:ffffffff:/right-view-first/left-flipped/left-flopped/right-flipped/right-flopped/half-aspect/mixed-mono, pixel-aspect-ratio=(fraction)1/1, framerate=(fraction)0/1, format=(string)YUY2, colorimetry=(string)2:4:7:1
/GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: caps = video/x-raw, width=(int)1280, height=(int)720, interlace-mode=(string)progressive, multiview-mode=(string)mono, multiview-flags=(GstVideoMultiviewFlagsSet)0:ffffffff:/right-view-first/left-flipped/left-flopped/right-flipped/right-flopped/half-aspect/mixed-mono, pixel-aspect-ratio=(fraction)1/1, framerate=(fraction)0/1, format=(string)YUY2, colorimetry=(string)2:4:7:1
/GstPipeline:pipeline0/GstVideoConvert:videoconvert0.GstPad:sink: caps = video/x-raw, format=(string)I420, width=(int)1280, height=(int)720, interlace-mode=(string)progressive, multiview-mode=(string)mono, multiview-flags=(GstVideoMultiviewFlagsSet)0:ffffffff:/right-view-first/left-flipped/left-flopped/right-flipped/right-flopped/half-aspect/mixed-mono, pixel-aspect-ratio=(fraction)1/1, chroma-site=(string)jpeg, colorimetry=(string)1:4:0:0, framerate=(fraction)0/1
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
Redistribute latency...
New clock: GstSystemClock
0:00:03.9 / 99:99:99.
```

### Configure the video out pipeline

Run the script below to configure the video output pipeline to a 720p resolution.

```bash
root@pic64gx-curiosity-kit:~# /opt/microchip/multimedia/hdmi/pic64gx_hdmi_pipeline_config_720p.sh
```
