# Raycast-Tailscale-File-Copy

Raycast-Tailscale-File-Copy is a Raycast script designed to securely copy files across devices on your [Tailscale](https://tailscale.com/) network. This script uses Tailscale device name to transfer files using `scp`, streamlining the process of sending files between your devices directly from Raycast.

---

## Features

- Copy files between devices using Tailscale IPs
- Secure transfer via SCP
- Easy integration with Raycast
- No additional dependencies beyond Tailscale and SCP
- Automatically detects the file selected in the finder

---

## Requirements

- [Raycast](https://raycast.com) installed on your macOS device
- [Tailscale](https://tailscale.com/download) configured and running on both source and destination devices

---

## Setup

1. **Clone the Repository**
   ```bash
   git clone https://github.com/rafaelrosars/Raycast-Tailscale-File-Copy.git
2. Configure device name from tailscale network
    ```bash
    DEVICE="xxx"
    ```
3. **Move the Script to Raycast Scripts Folder**

    Place `enviar-tailscale.sh` into your Raycast scripts directory, or reference its location in Raycast's script command configuration.

4. **Make the Script Executable**

    ```bash
    chmod +x enviar-tailscale.sh
    ````

5. **Configure Raycast Script Command**

    In Raycast, add a new script command pointing to `enviar-tailscale.sh`.
---
## Usage
>The best way to use is trough a shortcut like Hyper Key.
1. **Invoke the Script from Raycast**

- With a file selected in Finder
- Open Raycast
- Search for the script command (e.g., “Send File via Tailscale”)

2. **Script Execution**

- The script will use scp to securely copy the specified file to the remote device using its Tailscale network.
- Tailscale File Transfer by default sends files to the remote user's downloads folder and does not allow specifying an arbitrary path directly via the command.
