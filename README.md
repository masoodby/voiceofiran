# ipLive

## Getting Started

A live stream app for android Television. This app is built with flutter and dart. It is a simple
app that shows the list of live stream channels and their details. 
The app is built with a clean and simple UI. 

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Instruction about icon and banner
- In mobile app icon works but in android TV icon icon size is different here it is called banner.
- we also need icon for android TV but not for showing in the home screen but for showing in the settings and apps options in your tv.
- so we need to add banner in the pubspec.yaml file and also need to add banner in the android manifest file.
- after this line:  android:icon="@mipmap/launcher_icon" add android:banner="@mipmap/launcher_banner" in android/app/src/main/AndroidManifest.xml
- NB: launcher_banner is the name of the icon file in the mipmap folder. you can change and add as per your choice.
- Banner size is different from icon size. you can check the size in the link below.
- https://developer.android.com/design/ui/tv/guides/system/tv-app-icon-guidelines
## which size and where to keep banner
- size of 160x90 px will go to android/app/src/main/res/mipmap-mdpi.
- size of 240x135 px will go to android/app/src/main/res/mipmap-hdpi.
- size of 320x180 px will go to android/app/src/main/res/mipmap-xhdpi.
- size of 480x270 px will go to android/app/src/main/res/mipmap-xxhdpi.
- size of 640x360 px will go to android/app/src/main/res/mipmap-xxxhdpi.



```# voiceofiran
