#!/bin/bash
flutter clean

cd lib
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
