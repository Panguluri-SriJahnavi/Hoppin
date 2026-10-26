# Hoppin

### On-Demand Local Services Booking App

Hoppin is a Flutter application prototype that brings everyday service providers into one place. Users can find cooks, tutors, cleaners, plumbers, electricians, and other workers, then compare their displayed ratings, prices, availability, and distance before starting a booking.

The current project uses demonstration provider data and simulated booking and payment flows. It is intended for learning, interface demonstration, and further development.

## Features

- Browse 11 service categories and 25 demonstration providers.
- Search provider names, category identifiers, and service descriptions.
- Sort results by rating, distance, or displayed base price.
- Filter by verification flag, current availability, price range, and worker preference.
- View provider profiles, experience, pricing, and sample reviews.
- Explore fixed-rate services charged per hour, day, or visit.
- Review a simulated quotation for inspection-based services.
- Follow a booking-request and status demonstration.
- Select a payment method in sandbox checkout.
- View bookings recorded during the current session.
- Access profile, saved-address, language-preference, and settings screens.

## Service Categories

Cooking, tutoring, cleaning, electrical work, plumbing, beauty, moving, AC and appliance services, painting, carpentry, and pet care.

## Technology Stack

| Technology | Purpose |
| --- | --- |
| Flutter and Dart | Application screens, interaction, and business logic |
| Provider | Shared state through `ChangeNotifier` and `AppState` |
| Material widgets | Forms, navigation, cards, and controls |
| Google Fonts | Typography |
| intl | Declared formatting dependency |
| Local Dart data | Demonstration categories and provider records |

Dependencies are declared in `pubspec.yaml`. The declared Dart SDK range is `>=3.0.0 <4.0.0`; use a recent stable Flutter SDK compatible with the APIs and dependencies in the project.

## Project Structure

```text
hoppin/
├── lib/
│   ├── main.dart                  # App entry point and Provider setup
│   ├── data/
│   │   └── mock_data.dart         # Sample categories, providers, payment options
│   ├── models/
│   │   ├── vendor.dart            # Provider and category models
│   │   └── booking.dart           # Booking, quote, and customer models
│   ├── screens/                  # Onboarding, discovery, booking, settings
│   ├── state/
│   │   └── app_state.dart         # Search, filters, sorting, booking state
│   ├── theme/
│   │   └── app_theme.dart         # Theme and color definitions
│   └── widgets/                  # Reusable provider cards and app drawer
├── pubspec.yaml
└── README.md
```

The supplied folder contains application source and dependency configuration. It does not yet contain the generated Android, iOS, or web platform folders.

## Getting Started

### 1. Install Flutter

Follow the [official Flutter installation guide](https://docs.flutter.dev/get-started/install). Install the tooling for the platform you want to run, then check your environment:

```sh
flutter doctor
```

For web development, install Chrome. Android requires Android development tools and an emulator or device. iOS development requires macOS and Xcode.

### 2. Open the project folder

Extract or download the repository, then open a terminal inside the `hoppin` folder containing `pubspec.yaml`.

```sh
cd hoppin
```

### 3. Generate the missing platform files

For a browser demonstration:

```sh
flutter create . --platforms web
flutter pub get
flutter run -d chrome
```

For Android:

```sh
flutter create . --platforms android
flutter pub get
flutter devices
flutter run -d YOUR_DEVICE_ID
```

Replace `YOUR_DEVICE_ID` with an identifier shown by `flutter devices`.

For iOS, on a configured Mac:

```sh
flutter create . --platforms ios
flutter pub get
flutter devices
flutter run -d YOUR_DEVICE_ID
```

Generate only the platform folders you need. Keep a backup or commit of the supplied source before generating project files, and review the generated changes afterward.

### 4. Build for release

After the application runs successfully, build the target you need:

```sh
# Web output: build/web/
flutter build web

# Android APK
flutter build apk --release
```

Web hosting uses the generated `build/web/` files together. Uploading Dart source to a repository alone does not publish a running website.

## How to Use Hoppin

1. Open the app and continue through onboarding.
2. Enter customer details, or use the demonstration existing-account route.
3. Select a service category or search for a provider or service description.
4. Compare the displayed ratings, distance, availability, and charging unit.
5. Open a provider profile and choose **Book now**.
6. Wait for the simulated acceptance, which occurs after approximately three seconds.
7. Review the quotation when required, or continue to booking status.
8. Open checkout, select a payment method, and complete the sandbox flow.
9. View the booking in the session's booking history.

## Pricing Demonstration

**Fixed-rate services** show a price and unit, such as hourly tutoring or daily cooking. The current flow uses one displayed base amount; it does not calculate a booking from a selected number of hours or days.

**Quote-based services** use the provider's starting amount as an inspection charge and add estimated parts and labour equal to a rounded 70% of that starting amount.

Sandbox checkout adds a platform fee of ₹15 and a rounded demonstration tax amount of 6% of the base. For example, a ₹600 base produces a displayed total of ₹651.

These values demonstrate application logic. They are not actual worker quotations, a verified tax policy, or real payment processing. Prices with different charging units should not be treated as directly equivalent.

## Current Limitations

- Provider records, ratings, reviews, verification flags, distances, and availability are demonstration data.
- Booking acceptance is simulated by a timer; no worker receives a real request.
- Map and tracking screens do not use a live GPS or mapping integration.
- The location dialog inserts a sample address rather than obtaining device coordinates.
- Checkout does not contact a payment gateway or process money.
- Customer details and booking history are stored in memory and reset when the app restarts.
- Signup checks required fields but does not authenticate a user or verify a phone number.
- Language choices are present, but complete application translation is not implemented.
- Some settings and profile actions are placeholders. Larger-text controls are present, but their app-wide update behavior needs verification.
- Search uses literal text matching; category browsing can help when a service keyword is not matched.

## Validation

The documentation was prepared by inspecting the supplied Flutter source. No successful Flutter build, device run, or automated test run is claimed.

After generating the platform files and resolving dependencies, run:

```sh
flutter analyze
```

The supplied folder has no project-specific test suite. After adding unit, widget, or integration tests, run:

```sh
flutter test
```

Generated starter tests may require adjustment to use `HoppinApp` and its actual workflow.

## Future Enhancements

- Authentication and persistent customer profiles.
- Provider onboarding and verification.
- Real booking acceptance, scheduling, cancellation, and status updates.
- Live location and accurate distance calculation.
- Payment integration with confirmed transaction status.
- Reviews tied to completed bookings.
- Service duration selection and clearer price comparison.
- Full localization and accessibility testing.
- Automated tests and verified Android, iOS, and web builds.

## Author

**P.Sri jahnavi**  
Computer Science and Engineering — Data Science

## Documentation

- [Flutter documentation](https://docs.flutter.dev/)
- [Flutter command-line reference](https://docs.flutter.dev/reference/flutter-cli)
- [Flutter web setup and builds](https://docs.flutter.dev/platform-integration/web/building)
- [Dart documentation](https://dart.dev/guides)

## License

No license file is included in the supplied project. Add a license that reflects how you want others to use the code before granting reuse permissions.
