# Hoppin — On-Demand Local Services Booking App

Runs on Android, iOS, and Web from the same Dart code.

## Setup
    cd hoppin
    flutter pub get

## Run as mobile app
    flutter run

## Run as a website
    flutter config --enable-web
    flutter create .
    flutter run -d chrome

## Build a deployable website
    flutter build web
    # output goes to build/web/ — upload that folder to any static host

## What's real vs mocked
All UI, navigation, pricing logic (fixed vs quote-based), search/filters, and the
accept-delay booking flow are fully working Flutter code. Map, live location, and
payment are UI-accurate placeholders — swap in google_maps_flutter, geolocator, and
razorpay_flutter with API keys to make them live.
