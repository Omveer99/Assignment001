# ** Question 1 - Create an OpenSSL Certificate on your local machine and push it to the device:**

 # Generate certificate and key
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 365 -nodes        

# Push certificate and key to the device
adb push key.pem /sdcard/
adb push cert.pem /sdcard/

Question 2- Get the serial number of the certificate

#Read certificate Details 
openssl x509 -in cert.pem -text

output - 
Serial Number:
    3f:d1:74:b7:c7:09:07:c4:c4:f7:1e:a1:77:5a:81:9c:51:60:00:2f

Question 3- Get the battery level of the device using ADB

adb shell dumpsys battery

Question 4 - Create one file inside the device shell and pull it to your local machine

#entering into shell
adb shell

#create a file 
cd > imp.txt

#Enter the content 
Hii Android !

#exit shell
exit

# Pull the file from the device to MacBook 
adb pull /sdcard/imp.txt /Users/apple/downloads

# Navigate to the directory and list the file
cd /Users/apple/downloads

#list files
ls

# Display the content of the pulled file
cat imp.txt



