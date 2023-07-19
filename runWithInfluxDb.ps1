#!/bin/sh

$Env:POWERPAL_DEVICE_SERIAL = Get-Content POWERPAL_DEVICE_SERIAL
$Env:POWERPAL_API_TOKEN = Get-Content POWERPAL_API_TOKEN
$Env:INFLUX_API_TOKEN = Get-Content INFLUX_API_TOKEN

# InfluxDB 1.8: 
# The organization parameter is not used. Use an empty string ("") where necessary.
# Use the form database/retention-policy where a bucket is required. Skip retention policy if the default retention policy should be used. Examples: telegraf/autogen, telegraf.  

while ($true) {
    go run ./examples/powerpal2influxdb -s "http://docker.lan:8086" -o "" -b "home_assistant"
    Write-Host "Sleep 60s"
    Start-Sleep -Seconds 60
}

