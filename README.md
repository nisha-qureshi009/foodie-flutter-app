# Foodie – Flutter Food Delivery App

A polished Flutter portfolio project for a food delivery experience. It demonstrates modern Material 3 UI, reusable widgets, state management with Provider, food discovery, favorites, cart calculations and a checkout flow.

## Features

- Home screen with location header, promotional banner and food categories
- Search by dish or restaurant
- Food detail page with description, rating and delivery estimate
- Add to cart, increment/decrement quantities and remove items
- Automatic subtotal, delivery fee, tax and total calculation
- Save/unsave favorite dishes
- Checkout form with required-field validation
- Demo Cash on Delivery / card selection
- Order confirmation with generated reference number
- Profile/help screens
- Responsive two-column food grid and reusable UI components

## Tech stack

- Flutter / Dart
- Material 3
- Provider for app state
- Google Fonts
- Intl dependency included for future date/price formatting

## Getting started

1. Install Flutter SDK and Android Studio.
2. Extract this project.
3. Open a terminal in the extracted project folder and generate the native Android/iOS runner folders once:

```bash
flutter create . --platforms=android,ios
```

4. Open the project folder in VS Code or Android Studio.
5. Run:

```bash
flutter pub get
flutter run
```

Build a release APK:

```bash
flutter build apk --release
```

APK output:

`build/app/outputs/flutter-apk/app-release.apk`

## Project structure

```text
lib/
  data/              # Demo food catalogue and categories
  models/            # Food model
  providers/         # Cart and favorites state
  screens/           # Home, details, cart, checkout, profile
  widgets/           # Reusable food card
  main.dart          # App entry point and theme
```

## Demo data and backend note

This repository currently uses local demo catalogue data and in-memory state. It does not connect to a production API, Firebase, a payment gateway, or a live restaurant dispatch system. Cart/favorite data resets when the app process is restarted. The card payment choice is clearly a demo option and does not process payments.

For a production release, add Firebase Authentication, Firestore or a REST backend, persistent cart/order storage, address validation, secure payment gateway integration, push notifications, and an admin/restaurant dashboard. Never store payment card details directly in the app.

## Screens to showcase

1. Home / Explore
2. Food details
3. Cart with price breakdown
4. Checkout
5. Order confirmation
6. Favorites
7. Profile

## GitHub upload

Create a public repository named `foodie-flutter-app`, then upload the extracted project folder. Do not upload `.dart_tool/`, `build/`, or local IDE secrets. Add screenshots to a `screenshots/` folder before publishing.

## LinkedIn project entry

**Title:** Foodie – Flutter Food Delivery App

**Description:** Designed and developed a modern food delivery mobile application using Flutter and Dart. Implemented food discovery, category filtering, search, detailed food pages, favorites, cart management, dynamic price calculations, checkout validation and order confirmation. Used Provider for clean and reactive state management, reusable widgets and a Material 3 design system.

**Skills:** Flutter, Dart, Provider, State Management, Material 3, Mobile App Development, UI/UX Design, Git, GitHub.

## Author

Add your name, GitHub profile and contact links here before publishing.
