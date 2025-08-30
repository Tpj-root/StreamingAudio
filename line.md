# StreamingAudio
Streaming Browser Audio into Video Calls on Debian







**step-by-step guide** to send **Firefox YouTube audio** into a **Telegram call** using **PulseAudio virtual sink** on **Debian**.

---

## 🧰 Step 0: Requirements

Install PulseAudio tools:

```bash
sudo apt install pavucontrol pulseaudio
```

---

## 🧱 Step 1: Create Virtual Audio Output

In terminal, run:

```bash
pactl load-module module-null-sink sink_name=virt_out sink_properties=device.description=VirtualOutput
```

This creates a **virtual output** called `VirtualOutput`.

---

## 📺 Step 2: Play YouTube in Firefox

* Open Firefox
* Play any YouTube video (keep it running)

---

## 🎛 Step 3: Open PulseAudio Volume Control

Run:

```bash
pavucontrol
```

Go to the **Playback tab**:

* Locate **Firefox audio stream**
* Change its output from `Built-in Audio` → `VirtualOutput`

---

## 🔄 Step 4: Loop VirtualOutput to Mic Input

In terminal, run:

```bash
pactl load-module module-loopback source=virt_out.monitor
```

This links the virtual output to system mic input.

---

## 📞 Step 5: Start Telegram Call

* Open **Telegram Desktop**
* Start a call with a friend

---

## 🎙 Step 6: Set Telegram Input to Virtual Audio

In **pavucontrol → “Recording” tab**:

* You’ll see **Telegram** listed
* Change its input from `Microphone` → `Monitor of VirtualOutput`

---

## ✅ Final Result

* Firefox → VirtualOutput → Loopback → Telegram call
* The other user hears YouTube audio instead of your mic

---

Let me know if you want to **auto-disable loopback** after the call or use **PipeWire** instead.


