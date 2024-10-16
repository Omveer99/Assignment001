#!/bin/bash

export ANDROID_HOME=/Users/apple/Library/Android/sdk
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

emulator -avd MyAndroid &  
sleep 30  

adb exec-out screencap -p > em_run.png

adb shell am start -n org.mozilla.firefox/org.mozilla.firefox.App
sleep 10  

adb exec-out screencap -p > firefox_screenshot.png

cat <<EOT > test.sh
#!/bin/bash
echo "Hi from Android!"
EOT

adb push test.sh /sdcard/

adb shell <<EOF
cd /sdcard/
chmod 755 test.sh
sh test.sh
EOF

adb exec-out screencap -p > script_output.png
