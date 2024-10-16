Question 1 - Create an OpenSSL Certificate on your local machine and push it to the device:

openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 365 -nodes         #( Generate a self-signed certificate and key)

adb push key.pem /sdcard/
adb push cert.pem /sdcard/


