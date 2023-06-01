#!/usr/bin/env python3

# /usr/local/lib/collectd/iio.py

import os
import fcntl
import sys
import time

if "COLLECTD_HOSTNAME" in os.environ.keys():
    HOSTNAME = os.environ["COLLECTD_HOSTNAME"]
else:
    HOSTNAME = os.uname()[1]

if "COLLECTD_INTERVAL" in os.environ.keys():
    INTERVAL = os.environ["COLLECTD_INTERVAL"]
else:
    INTERVAL = 60

LOGDIR = "/var/lib/collectd/" + HOSTNAME + "/sensors-microchip,pac1934/"
SENSORDIR = "/sys/bus/iio/devices/iio:device0/"
SENSORNAME = "microchip,pac1934"
MAXLINES = 50
MINLINES = 30


def traverse_links(filename):
    if not os.path.islink(filename):
        return filename
    return traverse_links(
        os.path.normpath(os.path.join(os.path.dirname(filename), os.readlink(filename)))
    )


def get_old_files(topdir, howold=24 * 3600):
    now = time.time()
    filelist = []

    for dirpath, dirnames, filenames in os.walk(topdir):
        for name in [traverse_links(os.path.join(dirpath, f)) for f in filenames]:
            try:
                if os.path.isfile(name) and now - os.path.getmtime(name) > howold:
                    filelist.append(name)
            except OSError:
                pass  # ignore bad symlinks
    return filelist


def lock_file(f):
    fcntl.lockf(f, fcntl.LOCK_EX | fcntl.LOCK_NB)


def unlock_file(f):
    fcntl.lockf(f, fcntl.LOCK_UN | fcntl.LOCK_NB)


def ensure_dir(file_path):
    directory = os.path.dirname(file_path)
    if not os.path.exists(directory):
        os.makedirs(directory)


ensure_dir(LOGDIR + ".lock")
f = open(LOGDIR + ".lock", "w")
try:
    lock_file(f)
except:
    sys.exit(0)

if os.path.isfile(SENSORDIR + "name"):
    fd = open(SENSORDIR + "name", "r")
    name = fd.read()
    fd.close()
    name = name.strip()
    if name != SENSORNAME:
        sys.exit(0)

    current = [0, 0, 0, 0]
    current_scale = [0, 0, 0, 0]
    voltage = [0, 0, 0, 0]
    # Voltage scale is not an array
    voltage_scale = 0
    for i in range(4):
        fd = open(SENSORDIR + "in_current{}_raw".format(i))
        if fd:
            current[i] = fd.read()
            fd.close()
            current[i] = current[i].strip()
        else:
            sys.exit(0)

        fd = open(SENSORDIR + "in_current{}_scale".format(i))
        if fd:
            current_scale[i] = fd.read()
            fd.close()
            current_scale[i] = current_scale[i].strip()
        else:
            sys.exit(0)

        current[i] = str(float(current[i]) * float(current_scale[i]))

        fd = open(SENSORDIR + "in_voltage{}_raw".format(i))
        if fd:
            voltage[i] = fd.read()
            fd.close()
            voltage[i] = voltage[i].strip()
        else:
            sys.exit(0)

        fd = open(SENSORDIR + "in_voltage_scale")
        if fd:
            voltage_scale = fd.read()
            fd.close()
            voltage_scale = voltage_scale.strip()
        else:
            sys.exit(0)

        voltage[i] = str(float(voltage[i]) * float(voltage_scale))

        # convert from mV to V
        voltage[i] = str(float(voltage[i]) / 1000)

        print(
            "PUTVAL {}/sensors-{}/current-channel{} interval={} N:{}".format(
                HOSTNAME, SENSORNAME, i, INTERVAL, current[i]
            )
        )
        print(
            "PUTVAL {}/sensors-{}/voltage-channel{} interval={} N:{}".format(
                HOSTNAME, SENSORNAME, i, INTERVAL, voltage[i]
            )
        )

    # Remove files older than 24 hours)
    old_files = get_old_files(LOGDIR, 24 * 3600)
    for old_file in old_files:
        os.remove(old_file)

    # constantly self trim - target between 30 and 50 readings
    for dirpath, dirnames, filenames in os.walk(LOGDIR):
        for name in [traverse_links(os.path.join(dirpath, f)) for f in filenames]:
            fd = open(name, "r")
            if fd:
                try:
                    lines = fd.readlines()
                    num_lines = len(lines)
                except:
                    num_lines = 0
                fd.close()

            if num_lines > MAXLINES:
                fd = open(name, "w")
                if fd:
                    # write the first line from its old instance
                    fd.write(lines[0])
                    # write the last 29 lines from the old instance
                    fd.writelines(lines[-29:])
                fd.close()
