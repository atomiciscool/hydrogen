#!/bin/bash

main() {
    echo -e "Downloading Latest Roblox - bomb version"
    [ -f ./RobloxPlayer.zip ] && rm ./RobloxPlayer.zip
    curl "https://setup.rbxcdn.com/mac/version-02b4c0594723475b-RobloxPlayer.zip" -o "./RobloxPlayer.zip"

    echo -e "Installing Latest Roblox - bomb version"
    [ -d "/Applications/Roblox.app" ] && rm -rf "/Applications/Roblox.app"
    unzip -o -q "./RobloxPlayer.zip"
    mv ./RobloxPlayer.app /Applications/Roblox.app
    rm ./RobloxPlayer.zip

    echo -e "Downloading libHydrogen - bomb version"
    rm ./libHydrogen.dylib
    curl -LJO "https://github.com/JordTheCord/hydrogen/raw/main/libHydrogen.dylib"

    rm ./insert_dylib
    echo -e "Downloading insert_dylib - bomb version"
    curl -LJO "https://github.com/JordTheCord/hydrogen/raw/main/insert_dylib"

    chmod +x "./insert_dylib"

    echo -e "Patching Roblox"
    mv ./libHydrogen.dylib "/Applications/Roblox.app/Contents/MacOS/libHydrogen.dylib"
    ./insert_dylib "/Applications/Roblox.app/Contents/MacOS/libHydrogen.dylib" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer" --strip-codesig --all-yes
    mv "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer_patched" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer"

    chmod +x "/Applications/Roblox.app/Contents/MacOS/libHydrogen.dylib"

    echo -e "Install Complete!"
}

main
