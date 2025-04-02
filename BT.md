# StreamingAudio


### AIM:

I have one USB headphone for myself and another Bluetooth headphone for my brother.

Both are connected but with different audio streams.



### Device:

I have two low-cost modules.
The other one is a Tb-link module.
Rockerz 558.

https://www.amazon.in/TP-Link-Bluetooth-Receiver-UB500-Controllers/dp/B098K3H92Z/?th=1
https://www.vijaysales.com/p/194121/boat-rockerz-558-bluetooth-headphone-with-50mm-premium-drivers-immersive-audio-physical-noise-isolation-black?utm_source=google&utm_medium=cpc&utm_campaign=pt-google-vijaysales-pmax-purchase-audio-accessories-feed-na-in-all-27-06-2024&gad_source=1&gclid=CjwKCAjwwLO_BhB2EiwAx2e-3xY26s2lywom3RJe62D1fvcLyuGo0ktbyvuod-atrL2_dEv5GnvtiBoCpS8QAvD_BwE


```
lsusb
```

```
Bus 002 Device 008: ID 0a12:0001 Cambridge Silicon Radio, Ltd Bluetooth Dongle (HCI mode)
Bus 002 Device 009: ID 2357:0604 TP-Link TP-Link UB500 Adapter
```




DEVICE_STATUS:

Low-range audio quality, perfect performance, streaming time, and connection time.







### PROCEDURE:

**Install Required Packages**

```
sudo apt update
sudo apt install bluetooth bluez bluez-tools pulseaudio pulseaudio-module-bluetooth pavucontrol
```


**Enable & Start Bluetooth Service**

```
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

```


**Check Bluetooth Status**


```
bluetoothctl show

```


**If Bluetooth is blocked, unblock it:**


```
rfkill unblock bluetooth
```

**Pair & Connect Headphones**

```
bluetoothctl
```

**Then, inside the Bluetooth prompt:**



```
power on
agent on
scan on  # Wait for your headphones to appear
pair XX:XX:XX:XX:XX:XX  # Replace with your device MAC address
connect XX:XX:XX:XX:XX:XX
trust XX:XX:XX:XX:XX:XX  # Optional, to auto-connect next time
exit

```



**Set Audio Output**
**Open PulseAudio Volume Control:**

```
pavucontrol
```






**HELLO**

```

```




```
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


```





**Troubleshooting Tips**

Sometimes, you need to remove the module and reconnect it.

You may also need to restart the headphones.
