#! /bin/bash

#see Readme
#AAPT needs to be installed, it stands for Android Asset Packaging Tool.Used to view, create, and  update your APKs (as well as zip and jar files).

#installing required plugins
tput setaf 2; echo "please wait, System is getting ready."; tput sgr0

#for closing the app if it is open
adb shell input keyevent KEYCODE_APP_SWITCH
adb shell input keyevent 20 
adb shell input keyevent 67
adb shell input keyevent DEL


echo "Installing the application into the device"
for file in *.apk; do adb install -r $file; done




#val= aapt dump badging pCloudy_Appium_Demo.apk | awk -v FS="'" '/package: name=/{print $2}'
var=$(aapt dump badging *.apk | awk -v FS="'" '/package: name=/{print $2}')

echo "Starting test"
adb shell monkey -p $var 1


#for pressing "agree" and "login"
adb shell input keyevent 66
adb shell input keyevent 66
#adb shell input keyevent 66


#for entry of the "user pin" and "pass pin"
echo "Enter the user number"
read user
adb shell input text $user
echo "Enter the pin"
read pin
adb shell input keyevent 66
adb shell input text $pin
sleep 2


#for "login"
adb shell input keyevent 61
adb shell input keyevent 66
#adb shell input keyevent 22
sleep 1


#for selecting the "destination" and "source"

echo "selecting the destination and source"
adb shell input keyevent 66
adb shell input tap 200 400
#adb shell input keyevent 66


adb shell input keyevent 22
adb shell input keyevent 22
adb shell input keyevent 66
adb shell input tap 200 700
#adb shell input keyevent 66
adb shell input keyevent 20
adb shell input keyevent 20
adb shell input keyevent 66



#To get to book the flight
adb shell input keyevent 20
adb shell input keyevent 20
adb shell input keyevent 20
echo "booking flight"
adb shell input keyevent 20
adb shell input keyevent 66
echo "flight booked"


sleep 4


#go to "home" 
adb shell input keyevent 3

#open the "multitasking window" 
adb shell input keyevent KEYCODE_APP_SWITCH
adb shell input keyevent 20 
adb shell input keyevent 67
adb shell input keyevent DEL
#adb shell input tap 235 835



#device info

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

echo "DEVICE INFO"
adb shell getprop | grep "model\|version.sdk\|manufacturer\|hardware\|platform\|revision\|serialno\|product.name\|brand" $info

adb shell cat /proc/cpuinfo
echo "The os is:-"
adb shell getprop ro.build.version.release

echo " Device "
adb devices -l
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "THE TEST IS COMPLETE"








