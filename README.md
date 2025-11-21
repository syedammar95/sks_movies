# SKS Movies

SKS Movies is a Flutter application designed to provide movie-related content. This project leverages Flutter's cross-platform capabilities for mobile development and includes a web view for displaying web-based content in-app.

## Features

- **WebView Integration**: The app uses a WebView to display web pages, offering users a seamless browsing experience within the app.
- **Well-Structured Codebase**: The source code is organized under the `lib` directory, including subfolders for Providers, Screens, and Utility classes for maintainability and scalability.
- **Flutter Best Practices**: Utilizes Provider for state management and follows recommended Flutter patterns.

## Project Structure

The main folders and files in this Flutter project include:

- `lib/`
  - `main.dart`: The entry point of the application, responsible for bootstrapping the app and usually initializing the WebView.
  - `Providers/`: Contains Provider classes for managing and accessing app state.
  - `Screens/`: Includes different screens/views of the app, likely including the WebView screen and others for app navigation and UI.
  - `Utils/`: Helper and utility functions used throughout the application.

- `android/` & `ios/`: Native files and configuration for Android and iOS platforms.
- `assets/`: Resources like images and fonts.
- `pubspec.yaml`: Manages Flutter dependencies (likely includes packages for webview, provider, etc).

## Getting Started

1. **Clone the Repository**

   ```sh
   gh repo clone syedammar95/sks_movies
   ```

2. **Install Dependencies**

   From the root of the repo, run:
   ```sh
   flutter pub get
   ```

3. **Run the App**

   ```sh
   flutter run
   ```

## WebView Details

This project integrates WebView, which allows the app to display web content directly within the app. Make sure you configure platform-specific settings for WebView in Android (`android/`) and iOS (`ios/`) as needed.

## Additional Resources

- [Flutter Official Documentation](https://docs.flutter.dev/)
- [Provider Package](https://pub.dev/packages/provider)
- [WebView Package](https://pub.dev/packages/webview_flutter)

---

> **Note**: Look in `lib/main.dart` and the `lib/Screens` folder for main WebView implementation and customize it as per your project needs.
