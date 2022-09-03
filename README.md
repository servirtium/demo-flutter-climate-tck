Note - The World Bank took down their climate WebAPI. Darn it. We now depend on a docker version of the same until we work out what to do long term. Docker build and deploy this locally - https://github.com/servirtium/worldbank-climate-recordings - see README

TL;DR:

```
docker build git@github.com:servirtium/worldbank-climate-recordings.git#main -t worldbank-api
docker run -d -p 4567:4567 worldbank-api
```

The build for this demo project needs that docker container running

# servertium_flutter_driver_demo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## How to run the example
- Direct test
    - `flutter drive -t test_driver/average_rainfall_direct.dart`
- Recording test
    - `flutter drive -t test_driver/average_rainfall_recording.dart`
- Playback test
    - `flutter drive -t test_driver/average_rainfall_playback.dart`
