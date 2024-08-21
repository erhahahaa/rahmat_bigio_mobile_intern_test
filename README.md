# Rahmat Hidayatullah - Bigio Mobile Internship Test (Rick and Morty App)

This project implements a clean architecture with a feature-driven approach to create a comprehensive mobile application inspired by the popular TV show, "Rick and Morty." The app allows users to explore characters, episodes, and locations from the series, offering a seamless and engaging experience. With a strong emphasis on modularity and scalability, this project showcases best practices in mobile app development, leveraging modern technologies and libraries to deliver a robust and maintainable codebase.

## <a name="introduction"></a> Introduction :

This project is a mobile application developed as part of the Bigio Mobile Internship Test. It is inspired by the "Rick and Morty" universe, providing users with a variety of features such as browsing character profiles, episodes, and locations, marking favorites, and utilizing a search function. The application is built using Flutter and follows a clean architecture pattern, ensuring a well-organized and easily maintainable codebase. The project also supports localization in English and Bahasa Indonesia and includes a dark mode option for enhanced user experience.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Libraries](#libraries)
- [Project Structure](#project-structures)
- [APK Link](#apk-link)

## <a name="features"></a> Features :

- [x] **List of Characters, Episodes, and Locations**: Users can browse through an extensive list of characters, episodes, and locations from the "Rick and Morty" series, each with detailed information.
- [x] **Detail Views**: Detailed views for each character, episode, and location, providing users with comprehensive information and insights about their favorite elements from the show.
- [x] **Favorite Functionality**: Users can mark characters, episodes, and locations as favorites, allowing easy access to their preferred content.
- [x] **Search Functionality**: Advanced search capabilities enable users to quickly find specific characters, episodes, or locations within the app.
- [x] **Localization**: The app supports multiple languages, currently offering English and Bahasa Indonesia, to cater to a wider audience.
- [x] **Dark Mode**: A dark mode option is available, enhancing the user experience, especially in low-light environments.

## <a name="libraries"></a> Libraries :

The project leverages several powerful libraries to ensure a smooth and efficient development process. Some of the key libraries used include:

- **Flutter 3.24.0**: The core framework for building the mobile application.
- **Flutter Bloc**: State management solution, ensuring predictable state transitions and a scalable architecture.
- **Dio**: A powerful HTTP client used for API calls and network communication.
- **GetIt**: A service locator package that simplifies dependency management.
- **Freezed**: A code generator for immutable classes and union types, streamlining model creation.
- **Injectable**: Facilitates dependency injection, promoting loose coupling and enhancing testability.
- **Flutter Localizations**: Enables internationalization, allowing the app to support multiple languages.
- **Isar**: A highly efficient local database solution for storing favorites and other persistent data.
- **Auto Route**: A navigation library that simplifies routing and deep linking within the app.
- **[etc](https://github.com/erhahahaa/rahmat_bigio_mobile_intern_test/blob/main/pubspec.yaml)**: Additional libraries and dependencies as listed in the project's `pubspec.yaml` file.

## <a name="project-structures"></a> Project Structure :

The project is organized into the following directories and files, reflecting a clean architecture and feature-based structure:

- `app` : Contains the main application entry point, including initialization and configuration.
- `core` : Contains core modules, including shared utilities, constants, themes, and configurations that are used across the application.
- `features` : Encapsulates the various features of the application, such as characters, episodes, and locations. Each feature is self-contained with its own data, domain, and presentation layers.
- `utils` : Houses utility classes and functions that provide reusable components across the app, such as helpers, extensions, and common widgets.
- `main.dart` : The main file that serves as the entry point to the application, initializing the app and setting up the necessary configurations.

## <a name="apk-link"></a> APK Link :

To try out the application, you can download the APK from the following link: [APK Download](https://drive.google.com/file/d/1aR4gZvPA5NUKlbyM9khExWhDWiZcyHr-/view?usp=sharing) or check release tab in this repository.

## <a name="test-result-snippet"></a> Test Result Snippet :

<!-- image -->

![Test Result Snippet](https://raw.githubusercontent.com/erhahahaa/rahmat_bigio_mobile_intern_test/main/resources/test/result_snippet.png "Test Result Snippet")
