# example

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## dependencies

### flutter_launcher_icons

    1. dart run flutter_launcher_icons:generate
    2. flutter_launcher_icons.yaml: assets/icon/icon.png
    3. dart run flutter_launcher_icons

### flutter_native_splash

    1. flutter_native_splash.yaml
    2. dart run flutter_native_splash:create

### flutter_gen_runner

    1. pubspec.yaml: flutter_gen
    2. dart run build_runner build --delete-conflicting-outputs

### flutter_intl

    1. Flutter Intl Initialize
    2. pubspec.yaml: flutter_intl
    3. Flutter Intl Add Locale
    4. MaterialApp: localizationsDelegates
    5. Info.plist: CFBundleLocalizations
