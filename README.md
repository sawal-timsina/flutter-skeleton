# flutter_skeleton

Flutter Skeleton

## Getting Started

This project is a starting point for a Flutter application that follows the
[simple app state management tutorial](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple).

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on mobile development, and a
full API reference.

## Assets

The `assets` directory houses images, fonts, and any other files you want to include with your application.

The `assets/images` directory
contains [resolution-aware images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

The `assets/translations` directory contains translation files in json format. File name format : <country-code>.json

## Firebase setup

### Android

Goto `android/build.gradle` and add this line inside dependency

`classpath "com.google.gms:google-services:4.3.10"`

Now, goto `android/app/build.gradle` and add this line

`apply plugin: 'com.google.gms.google-services'`

below `apply plugin: 'com.android.application'`

### IOS

Goto `ios?Runner/AppDelegate.swift` and add this line on top

`import Firebase`

and inside application function of AppDelegate class before return

`FirebaseApp.configure()`

now goto `ios/podfile` add this line

`pod 'Firebase/Auth'`

below

`target 'Runner' do`

# Environments

Place the env files like `config.dart, google-services.json, GoogleService.plist` inside respective `env/<dev|prod>`
folder.

And you can run `make set-env-dev | make set-env-prod` in terminal to set the required environment files.
