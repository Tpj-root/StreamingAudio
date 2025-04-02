#!/bin/bash

# Replace with your headphone's MAC address
# BT_MAC="XX:XX:XX:XX:XX:XX"

function myhead_connect() {
    BT_MAC="36:48:13:76:54:0B"

    bluetoothctl power on
    sleep 1
    bluetoothctl agent on
    sleep 1
    bluetoothctl scan on
    sleep 3
    bluetoothctl pair $BT_MAC
    sleep 2
    bluetoothctl connect $BT_MAC
    sleep 2
    bluetoothctl trust $BT_MAC
    sleep 1
    bluetoothctl scan off

    echo "Bluetooth headphones connected!"
}

function myhead_disconnect() {
    BT_MAC="36:48:13:76:54:0B"

    bluetoothctl disconnect $BT_MAC
    sleep 1
    echo "Bluetooth headphones disconnected!"
}
