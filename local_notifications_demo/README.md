# Local Notifications 

This project is a demo usage of Local Notifications with custom icon. It was created 

## Prepare to run

To run this project you need to install all packages using `flutter packages get`.

## Custom Icons

Notifications are awesome when we can use our icons. In this project you can see the definition of custom icons at `android/app/main/res`.

In this folder, you can see a subfolder called `drawable` inside of it you will see our icon called `ic_stat_adb.png`.

In addition to `drawable`, you can see other subfolders like` drawable- *`.

Each folder has a icon with one density. 

More informations see

- https://developer.android.com/guide/topics/resources/providing-resources
- https://developer.android.com/studio/write/image-asset-studio#notification

The icons present here were generated with [Android Asset Studio](http://romannurik.github.io/AndroidAssetStudio/)

## Changes icons

To add your icons, you need to replace the current `ic_stat_adb.png` in at least the drawable folder and add your new icon name to ` main.dart`

## Getting Started with Flutter

Run it with `flutter run` or with you favorite IDE to run

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
