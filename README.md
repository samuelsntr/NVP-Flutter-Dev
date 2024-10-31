# NVP Flutter App Test

A Flutter application with features including user authentication, profile management, Google Maps integration, theme support, and internationalization. Built with GetX for state management and Firebase for backend services.

## Features

1. **State Management with GetX**: Efficient state management across the app.
2. **Google Maps Integration**: Display user location, allow location selection, and view/edit markers.
3. **Dark & Light Theme Support**: Toggle between light and dark themes.
4. **Internationalization (i18n)**: Language support for English and Indonesian.
5. **Firebase Messaging**: Push notifications handled in all app states.
6. **User Registration & Authentication**: Secure login, registration, and logout with persistent sessions.
7. **Profile Management**: Editable user profile with name, email, and location.
8. **Settings**: Customize themes and language preferences.

## Project Structure

```plaintext
lib/
├── controllers/                 # State management controllers
│   ├── auth_controller.dart     # Handles authentication & profile updates
│   ├── theme_controller.dart    # Manages dark & light theme toggling
│   ├── locale_controller.dart   # Manages language selection for i18n
│   └── notification_controller.dart # Manages Firebase notifications
├── screens/                     # UI screens
│   ├── home_screen.dart         # Home screen with authentication check
│   ├── login_screen.dart        # Login screen for user authentication
│   ├── registration_screen.dart # Registration screen with location picker
│   ├── profile_screen.dart      # Profile screen to view and edit user info
│   ├── settings_screen.dart     # Settings screen for themes and language
│   └── map_screen.dart          # Google Maps screen for location display
├── l10n/                        # Localization files for i18n
│   ├── en.json                  # English translations
│   └── id.json                  # Indonesian translations
└── main.dart                    # App entry point with Firebase and GetX setup

```

Getting Started
Prerequisites
- Flutter SDK
- Firebase Project with Firebase Authentication and Cloud Messaging enabled
Setup
- Clone the repository:

bash
Copy code
git clone https://github.com/samuelsntr/NPV-Flutter-Test.git
cd yourprojectname
Install dependencies:

bash
Copy code
flutter pub get
Firebase Configuration:

Add google-services.json in android/app.
Add GoogleService-Info.plist in ios/Runner.
Update Android’s build.gradle and iOS’s Podfile if required.
Run the App:

bash
Copy code
flutter run
Usage
Registration: Register with an email, password, and location selection on Google Maps.
Login: Log in with registered credentials.
Profile Management: View and edit profile information, including name and location.
Settings: Customize theme and language settings.
Notifications: Receive push notifications from Firebase Cloud Messaging.
Firebase Setup Instructions
Go to Firebase Console and create a new project.
Add an Android and/or iOS app to your project.
Download and add google-services.json (Android) and GoogleService-Info.plist (iOS) to the respective directories.
Enable Firebase Authentication (email/password) and Cloud Messaging in your Firebase project.
Dependencies
flutter: ^2.0.0 or later
get: ^4.6.5 (for state management)
firebase_core: ^2.10.0 (core Firebase integration)
firebase_auth: ^4.3.0 (for authentication)
firebase_messaging: ^14.3.0 (for push notifications)
google_maps_flutter: ^2.0.10 (Google Maps integration)
intl: ^0.17.0 (for internationalization)
Folder Structure
controllers/: All GetX controllers managing app state and interactions with Firebase.
screens/: Flutter widgets representing different app screens.
l10n/: Localization files for English and Indonesian.
Contributing
Fork the project.
Create your feature branch:
bash
Copy code
git checkout -b feature/YourFeature
Commit your changes:
bash
Copy code
git commit -m 'Add some feature'
Push to the branch:
bash
Copy code
git push origin feature/YourFeature
Open a pull request.
```
