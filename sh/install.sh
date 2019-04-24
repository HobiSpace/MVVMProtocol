#!/bin/sh

Path=$(pwd)/Template/HobiCustom

sudo rm -fr /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File\ Templates/HobiCustom
sudo cp -R ${Path} /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File\ Templates
# echo ${Path} ${DesPath}
# sudo cp -R ${Path} ${DesPath}


