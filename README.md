# Farm Fresh Grocery App

## Project Overview

Farm Fresh Grocery App is a Flutter-based mobile application that allows users to browse, order, and receive fresh groceries at their doorstep. The app provides an intuitive user interface, real-time order tracking, and multiple payment options. Designed for both Android and iOS, the app ensures a seamless shopping experience with features like personalized recommendations and fast checkout.

## Features

- User authentication (Sign Up, Login, Social Login)
- Product browsing and search
- Cart and checkout process
- Multiple payment methods
- Order tracking and history
- Push notifications
- User profile management
- Admin dashboard integration (if applicable)

## Technology Stack

- **Frontend:** Flutter (Dart)
- **Backend:** Firebase / Node.js (Optional, based on implementation)
- **Database:** Firestore / MySQL / PostgreSQL (Depends on backend choice)
- **Payment Gateway:** Stripe / Razorpay / PayPal

---

## Getting Started

### Prerequisites

Ensure you have the following installed before setting up the project:

- Flutter SDK (Latest stable version) - [Install Flutter](https://flutter.dev/docs/get-started/install)
- Android Studio / VS Code (Preferred IDEs)
- Xcode (For iOS development)
- Dart SDK (Included with Flutter)
- Android Emulator / Physical Device
- iOS Simulator / Physical Device (Mac Required for iOS)

### Project Setup

#### 1. Clone the Repository

```sh
 git clone https://github.com/immithlesh/farm-fresh-ktr.git
 cd farm-fresh-grocery
```

#### 2. Install Dependencies

```sh
 flutter pub get
```

#### 3. Run the App

- **For Android:**

```sh
 flutter run --release
```

- **For iOS:**

```sh
 flutter run --release --no-codesign
```

(For iOS, you may need to open the project in Xcode and configure signing.)

---

## Android Setup

### Enable AndroidX

Ensure `android/gradle.properties` includes:

```
android.useAndroidX=true
android.enableJetifier=true
```

### Configure `AndroidManifest.xml`

Update permissions and deep linking in `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
```

### Update Gradle Files

Modify `android/app/build.gradle` to ensure compatibility:

```gradle
minSdkVersion 21
targetSdkVersion 33
compileSdkVersion 33
```

Run:

```sh
 flutter clean
 flutter pub get
```

---

## iOS Setup

### Configure `Info.plist`

Modify `ios/Runner/Info.plist` with necessary permissions:

```xml
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsArbitraryLoads</key>
  <true/>
</dict>
```

### Pod Installation

Run the following commands:

```sh
 cd ios
 pod install
 cd ..
```

---

## Flutter Integration

### Add Dependencies

Update `pubspec.yaml` with required dependencies:

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: latest_version
  provider: latest_version
  firebase_core: latest_version
  cloud_firestore: latest_version
  flutter_stripe: latest_version
```

Run:

```sh
 flutter pub get
```

### Firebase Setup (Optional)

- Register the app in Firebase Console
- Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
- Place them in respective directories:
  - `android/app/google-services.json`
  - `ios/Runner/GoogleService-Info.plist`

---

## Building the App

### Generate APK (Android)

```sh
 flutter build apk --release
```

### Generate iOS Build

```sh
 flutter build ios --release
```

(For iOS, open Xcode and configure signing for App Store submission.)

---

## Contribution

1. Fork the repository
2. Create a new branch (`feature/your-feature`)
3. Commit your changes (`git commit -m "Added new feature"`)
4. Push to the branch (`git push origin feature/your-feature`)
5. Open a pull request

---

## License

This project is licensed under the MIT License - see the `LICENSE` file for details.

---

## Contact

For any queries or support, contact:

- Email: [support@farmfreshapp.com](mailto\:support@farmfreshapp.com)
- GitHub Issues: [Open an issue](https://github.com/immithlesh/farm-fresh-ktr.git/issues)
