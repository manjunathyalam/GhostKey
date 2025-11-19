# 🔑 GhostKey v2.0

<p align="center">
  <img src="https://img.shields.io/badge/Version-2.0-purple?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Platform-Linux-blue?style=for-the-badge&logo=linux" />
  <img src="https://img.shields.io/badge/Language-Bash-green?style=for-the-badge&logo=gnu-bash" />
  <img src="https://img.shields.io/badge/License-Educational-red?style=for-the-badge" />
</p>

<p align="center">
  <strong>Advanced Lockscreen Credential Harvesting Tool</strong><br>
  <em>Invisible. Silent. Effective.</em>
</p>

---

## 📋 Description

**GhostKey** is an advanced penetration testing tool designed for authorized security assessments. It creates realistic lockscreen phishing pages for Windows, Android, and iOS devices to test user awareness and credential security.

### ✨ Key Features

- 🎯 **Multi-Platform Support**: Windows, Android, and iOS lockscreens
- 🌐 **Auto Device Detection**: Automatically serves the correct lockscreen
- 🔒 **Secure Tunneling**: Uses ngrok for HTTPS connections
- 📊 **Real-time Monitoring**: Live credential capture notifications
- 💾 **Organized Logging**: Separate logs for each platform
- 🎨 **Modern UI**: Beautiful, professional terminal interface
- ⚡ **Fast Deployment**: Quick setup and execution

---

## 🚀 Installation

### Prerequisites

```bash
# Install required packages
sudo apt-get update
sudo apt-get install php curl wget unzip -y

# For Termux (Android)
pkg install php curl wget unzip -y
```

### Quick Install

```bash
# Clone the repository
git clone https://github.com/yourusername/ghostkey.git
cd ghostkey

# Make executable
chmod +x ghostkey.sh

# Setup ngrok authentication (REQUIRED)
./ngrok authtoken YOUR_AUTH_TOKEN
# Get your token from: https://dashboard.ngrok.com/get-started/your-authtoken
```

---

## 💻 Usage

### Basic Usage

```bash
# Run GhostKey
bash ghostkey.sh
```

### Workflow

1. **Start GhostKey**: Run the script
2. **Enter Redirect URL**: Specify where targets go after entering credentials
3. **Share Link**: Send the generated ngrok link to target device
4. **Monitor**: Watch real-time credential captures
5. **Review Logs**: Check `ghostkey.*.txt` files for saved data

### Example Session

```
🔑 GhostKey v2.0 - Advanced Lockscreen Credential Harvesting

[✓] Starting PHP web server on localhost:3333...
[✓] Launching ngrok tunnel service...
[✓] Tunnel established successfully!

╔═════════════════════════════════════════════════════════╗
║  ✓ GhostKey Phishing Link:                             ║
║    https://a1b2c3d4.ngrok.io                           ║
║                                                         ║
║  ✓ Target Redirect URL:                                ║
║    https://www.youtube.com                             ║
╚═════════════════════════════════════════════════════════╝

👻 GhostKey is listening for targets...
```

---

## 📁 Output Files

GhostKey saves all captured data to organized log files:

| File | Description |
|------|-------------|
| `ghostkey.logs.txt` | IP addresses and device information |
| `ghostkey.android.txt` | Android PIN codes |
| `ghostkey.windows.txt` | Windows usernames and passwords |
| `ghostkey.ios.txt` | iOS passcodes |

---

## 🛠️ Configuration

### Custom Redirect URL

When prompted, enter any URL where targets should be redirected after entering credentials:

```bash
[?] Enter redirect URL after credential capture
   (Target will be redirected here after entering credentials)
   Default: https://www.youtube.com
└─> https://www.example.com
```

### Ngrok Authentication

GhostKey requires ngrok authentication (free):

1. Sign up at [ngrok.com](https://ngrok.com)
2. Get your authtoken from [dashboard](https://dashboard.ngrok.com/get-started/your-authtoken)
3. Run: `./ngrok authtoken YOUR_TOKEN`

---

## 🎯 Supported Platforms

### Windows
- Realistic Windows 10/11 lockscreen
- Captures username and password
- Blur effect on background

### Android
- Material Design PIN pad
- 4-digit PIN capture
- Fullscreen experience

### iOS
- Authentic iPhone lockscreen
- Passcode capture
- iOS-style animations

---

## ⚠️ Legal Disclaimer

**IMPORTANT**: This tool is for **EDUCATIONAL and AUTHORIZED TESTING ONLY**.

### Legal Use Cases:
✅ Authorized penetration testing  
✅ Security awareness training  
✅ Research in controlled environments  
✅ Personal network testing with permission  

### Illegal Activities:
❌ Unauthorized access to systems  
❌ Stealing credentials without permission  
❌ Harassment or malicious intent  
❌ Any use without explicit authorization  

**WARNING**: Unauthorized use of this tool is a **CRIMINAL OFFENSE** in most jurisdictions. You are solely responsible for your actions.

---

## 🐛 Troubleshooting

### Ngrok Link Not Generated

**Problem**: "Direct link:" shows empty

**Solutions**:
1. Authenticate ngrok: `./ngrok authtoken YOUR_TOKEN`
2. Check ngrok status: `curl http://127.0.0.1:4040/api/tunnels`
3. Test manually: `./ngrok http 3333`
4. Ensure internet connection is stable

### PHP Server Issues

**Problem**: Port 3333 already in use

**Solution**:
```bash
# Kill existing PHP processes
killall php
# Or find and kill specific process
lsof -ti:3333 | xargs kill -9
```

### Credentials Not Captured

**Problem**: Target enters credentials but nothing is logged

**Solutions**:
1. Check file permissions: `ls -la ghostkey.*.txt`
2. Verify PHP is running: `ps aux | grep php`
3. Test localhost: `curl http://localhost:3333`

---

## 🔄 Updates

### Version 2.0 (Latest)
- ✅ Modern UI with colored output
- ✅ Improved ngrok URL detection (triple fallback)
- ✅ Better error messages and troubleshooting
- ✅ Organized log files with clear naming
- ✅ Real-time capture notifications
- ✅ Enhanced stability and reliability

### Version 1.0
- Initial release as "Lockphish"
- Basic lockscreen phishing functionality

---

## 🤝 Contributing

Contributions are welcome! Please follow these guidelines:

1. Fork the repository
2. Create a feature branch
3. Test your changes thoroughly
4. Submit a pull request with clear description

---

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/yourusername/ghostkey/issues)
- **Discussions**: [GitHub Discussions](https://github.com/yourusername/ghostkey/discussions)
- **Email**: your.email@example.com

---

## 📜 License

This project is licensed for **Educational Purposes Only**.

```
MIT License with Educational Restriction

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software for EDUCATIONAL and AUTHORIZED TESTING purposes only.

Unauthorized use for malicious purposes is strictly prohibited and illegal.
```

---

## 👏 Credits

- **Original Concept**: Inspired by Lockphish
- **Developer**: Your Name
- **Contributors**: [See Contributors](https://github.com/yourusername/ghostkey/graphs/contributors)

---

## 🌟 Star History

If you find GhostKey useful, please consider giving it a ⭐ on GitHub!

---

<p align="center">
  <strong>Made with 💜 for the security community</strong><br>
  <em>Use responsibly. Stay legal. Test ethically.</em>
</p>

<p align="center">
  <img src="https://img.shields.io/github/stars/yourusername/ghostkey?style=social" />
  <img src="https://img.shields.io/github/forks/yourusername/ghostkey?style=social" />
  <img src="https://img.shields.io/github/watchers/yourusername/ghostkey?style=social" />
</p>