# PIC64GX OV5647 Example Scripts

The OV5647 camera example scripts perform the following tasks:
 
- Configure the capture pipelines to 720p resolution using v4l2-utils.
- Use standard v4l2-ctl or gst-launch command to get video frames from capture pipeline (raw, jpg formats).

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

## Capture jpeg image using fswebcam command

Run the script below to configure the capture pipeline to a 720p resolution and capture one JPG frame using the fswebcam command.

```bash
root@pic64gx-curiosity-kit:~# /opt/microchip/multimedia/ov5647/demo_pic64gx_ov5647_capture_jpeg_fswebcam.sh
```

A successful execution should look like:

```bash
root@pic64gx-curiosity-kit:~# /opt/microchip/multimedia/ov5647/demo_pic64gx_ov5647_capture_jpeg_fswebcam.sh
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
Enumerating p[ 1103.366830] microchip-csi2rxss 60001000.csi2rx: csi_fixed_out_raw8 is enabled
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
--- Opening /dev/video1...
Trying source module v4l2...
/dev/video1 opened.
No input was specified, using the first.
--- Capturing frame...
Captured frame in 0.00 seconds.
--- Processing captured image...
Disabling banner.
Writing JPEG image to '/home/root/test.jpg'.
```

## Capture jpeg image using gst-launch command

Run the script below to configure the capture pipeline to 720p resolution and capture 10 JPEG files using the gst-launch command.

```bash
root@pic64gx-curiosity-kit:~# /opt/microchip/multimedia/ov5647/demo_pic64gx_ov5647_capture_jpeg_gst_launch.sh
```

A successful execution should look like:

```bash
root@pic64gx-curiosity-kit:~# /opt/microchip/multimedia/ov5647/demo_pic64gx_ov5647_capture_jpeg_gst_launch.sh
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
Enumerating p[ 2015.787340] microchip-csi2rxss 60001000.csi2rx: csi_fixed_out_raw8 is enabled
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
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Redistribute latency...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
Redistribute latency...
Got EOS from element "pipeline0".
Execution ended after 0:00:03.152671000
Setting pipeline to NULL ...
Freeing pipeline ...
root@pic64gx-curiosity-kit:~# ls
frame0000.jpg  frame0002.jpg  frame0004.jpg  frame0006.jpg  frame0008.jpg
frame0001.jpg  frame0003.jpg  frame0005.jpg  frame0007.jpg  frame0009.jpg
root@pic64gx-curiosity-kit:~#
```

## Capture raw frames using v4l2-ctl command

Run the script below to configure the capture pipeline to 720p resolution and capture 10 raw frames in a file (file.raw) using the gst-launch command.

```bash
root@pic64gx-curiosity-kit:~# /opt/microchip/multimedia/ov5647/demo_pic64gx_ov5647_capture_raw_frames_v4l2_ctl.sh
```

A successful execution should look like:

```bash
root@pic64gx-curiosity-kit:~# /opt/microchip/multimedia/ov5647/demo_pic64gx_ov5647_capture_raw_frames_v4l2_ctl.sh
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
Enumerating p[ 2138.825151] microchip-csi2rxss 60001000.csi2rx: csi_fixed_out_raw8 is enabled
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
<<<<<<<<<<
```

## Configure the capture pipeline with different resolution

Run the script below to configure the capture pipeline to different resolutions using media-ctl command.

```bash
root@pic64gx-curiosity-kit:~# /opt/microchip/multimedia/ov5647/pic64gx_ov5647_camera_pipeline_config_1080p.sh
```

```bash
root@pic64gx-curiosity-kit:~# /opt/microchip/multimedia/ov5647/pic64gx_ov5647_camera_pipeline_config_480p.sh
```

```bash
root@pic64gx-curiosity-kit:~# /opt/microchip/multimedia/ov5647/pic64gx_ov5647_camera_pipeline_config_720p.sh
```
