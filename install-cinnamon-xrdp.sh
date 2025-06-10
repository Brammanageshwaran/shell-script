#!/bin/bash

# Step 1: Update system
echo "[INFO] Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Step 2: Install Cinnamon Desktop Environment
echo "[INFO] Installing Cinnamon Desktop Environment..."
sudo apt install -y cinnamon-desktop-environment

# Step 3: Install xrdp and enable it
echo "[INFO] Installing xrdp and enabling the service..."
sudo apt install -y xrdp
sudo systemctl enable xrdp

# Step 4: Configure Cinnamon session for xrdp
echo "[INFO] Configuring Cinnamon session..."
echo "cinnamon-session" > ~/.xsession
chmod +x ~/.xsession

# Add user to ssl-cert group
echo "[INFO] Adding user $USER to ssl-cert group..."
sudo adduser $USER ssl-cert

# Restart xrdp to apply changes
echo "[INFO] Restarting xrdp..."
sudo systemctl restart xrdp

echo "[✅ DONE] Cinnamon + xrdp setup completed!"
echo "Now run: hostname -I to get your WSL IP and connect via Remote Desktop."
