#!/bin/sh

export POWERPAL_DEVICE_SERIAL=`cat POWERPAL_DEVICE_SERIAL`
export POWERPAL_API_TOKEN=`cat POWERPAL_API_TOKEN`
export INFLUX_API_TOKEN=`cat INFLUX_API_TOKEN`

# InfluxDB 1.8: 
# The organization parameter is not used. Use an empty string ("") where necessary.
# Use the form database/retention-policy where a bucket is required. Skip retention policy if the default retention policy should be used. Examples: telegraf/autogen, telegraf.  
while [ true ]; do
    go run ./examples/powerpal2influxdb -s "http://docker.lan:8086" -o "" -b "home_assistant";
    echo "Sleep 60s";
    sleep 60;
done