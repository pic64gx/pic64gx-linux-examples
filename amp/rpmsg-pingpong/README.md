# PIC64GX AMP RPMsg PingPong Example

This application can be used to test data integrity of inter-hart communication
from linux userspace to a remote software context.

This application sends chunks of data (payloads) of variable sizes to the remote
software context.
The remote side echoes the data back to the application which then validates
the data returned.

This application uses the RPMsg char driver to create an endpoint using an ioctl
control interface (/dev/rpmsg_ctrlX) and exposes the endpoint to user space by
creating a /dev/rpmsgX device.

For more information on RPMsg protocol, please refer to the
[PIC64GX RPMsg documentation][1].

[1]: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU64/ProductDocuments/SupportingCollateral/Booting_Application_Workloads_on_PIC64GX_White_Paper.pdf

## Pre-requisites

This application should be run on a PIC64GX configured in AMP mode.
Instructions on how to run a Linux + Zephyr AMP configuration using Yocto or
Buildroot can be found in the [PIC64GX AMP documentation][2].

[2]: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU64/ProductDocuments/SupportingCollateral/Booting_Application_Workloads_on_PIC64GX_White_Paper.pdf

## Building the Application

Before running the example program, build it by running make:

```sh
make
```

## Running the Application

Once built, it can be run:

```sh
./rpmsg-pingpong
```

By default the application will try to open the virtio0.rpmsg-amp-demo-channel.-1.0 channel.

This channel will then be used to create an endpoint with the following
destination and source addresses:

source address: 0

destination address: 0xFFFFFFFF

Once run, the following information should be displayed on the console:

```text
root@pic64gx-curiosity-kit-amp: ./rpmsg-pingpong
        Open rpmsg dev virtio0.rpmsg-amp-demo-channel.-1.0!
        Opening file rpmsg_ctrl0.
        checking /sys/class/rpmsg/rpmsg_ctrl0/rpmsg0/name
        svc_name: rpmsg-amp-demo-channel

        **************************************

          Echo Test Round 0

        **************************************
        sending payload number 0 of size 17
        echo test: sent : 17
        received payload number 0 of size 17
```

The test should continue until the application sends and receives back the last
payload of size 232.

At the end, a test report should be displayed on the console:

```sh
 **************************************

 Echo Test Round 0 Test Results: Error count = 0

 **************************************
```
