# PIC64GX Video Examples

Microchip's PIC64GX1000 enables customers to develop video processing applications using it's built-in video engine and programming interface. The raw data captured from the camera is processed through elements of the video engine, which writes the YUV422 format data into the processor's memory space


The PIC64GX video example scripts perform the following tasks:

- Configure the capture pipeline with 720p resolution using v4l2-utils.
- Use v4l2-ctl or gst-launch command to get video frames from the capture pipeline (raw, jpg formats).

[Camera Demo's](./ov5647/README.md).

