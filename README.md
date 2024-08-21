# Rahmat Hidayatullah - Bigio Mobile Internship Test (Rick and Morty App)

This project showcases a clean architecture with a feature-driven approach to create a mobile application inspired by the popular TV show, "Rick and Morty." The app allows users to explore characters, episodes, and locations from the series, providing a seamless and engaging experience. With a strong emphasis on modularity and scalability, this project highlights best practices in mobile app development, utilizing modern technologies and libraries to deliver a robust and maintainable codebase.

## Introduction

This project is developed as part of the Bigio Mobile Internship Test. Inspired by the "Rick and Morty" universe, the application provides features such as browsing character profiles, episodes, and locations, marking favorites, and a search function. Built using Flutter, the app follows a clean architecture pattern, ensuring a well-organized and maintainable codebase. The project also supports localization in English and Bahasa Indonesia, and includes a dark mode option for an enhanced user experience.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Libraries](#libraries)
- [Project Structure](#project-structure)
- [APK Link](#apk-link)
- [Test Result Snippet](#test-result-snippet)

## Features

- **List of Characters, Episodes, and Locations**: Browse an extensive list of characters, episodes, and locations from the "Rick and Morty" series, each with detailed information.
- **Detail Views**: Access comprehensive information and insights about your favorite characters, episodes, and locations.
- **Favorite Functionality**: Mark characters, episodes, and locations as favorites for easy access.
- **Search Functionality**: Use advanced search capabilities to quickly find specific characters, episodes, or locations.
- **Localization**: The app supports multiple languages, currently offering English and Bahasa Indonesia.
- **Dark Mode**: A dark mode option enhances user experience, especially in low-light environments.
- **Infinite Scrolling**: Experience smooth and seamless browsing with infinite scrolling for character, episode, and location lists.
- **Multithreading**: The app utilizes Dart Isolate for multithreading, improving performance and responsiveness when handling large amounts of data.
- **Responsive Design**: The app is designed to be responsive and adaptive, providing an optimal user experience across various devices and screen sizes.
- **Unit Testing**: Unit tests validate the functionality and behavior of key components, ensuring the app's reliability.
- **Modularity**: The app's modular, feature-driven structure promotes scalability, maintainability, and reusability of code.

## Libraries

The project leverages several powerful libraries to ensure a smooth and efficient development process. Key libraries include:

- **Flutter 3.24.0**: The core framework for building the mobile application.
- **Flutter Bloc**: Provides a state management solution that ensures predictable state transitions and a scalable architecture.
- **Dio**: A powerful HTTP client used for API calls and network communication.
- **GetIt**: Simplifies dependency management through a service locator package.
- **Freezed**: A code generator for immutable classes and union types, streamlining model creation.
- **Injectable**: Facilitates dependency injection, promoting loose coupling and enhancing testability.
- **Flutter Localizations**: Enables internationalization, allowing the app to support multiple languages.
- **Isar**: A highly efficient local database solution for storing favorites and other persistent data.
- **Auto Route**: Simplifies routing and deep linking within the app.
- **[etc](https://github.com/erhahahaa/rahmat_bigio_mobile_intern_test/blob/main/pubspec.yaml)**: Additional libraries and dependencies as listed in the project's `pubspec.yaml` file.

## Project Structure

The project is organized to reflect a clean architecture and feature-based structure:

- `app`: Contains the main application entry point, including initialization and configuration.
- `core`: Houses core modules such as shared utilities, constants, themes, and configurations used across the application.
- `features`: Encapsulates the various features of the application, such as characters, episodes, and locations, each with its own data, domain, and presentation layers.
- `utils`: Contains utility classes and functions providing reusable components across the app, such as helpers, extensions, and common widgets.
- `main.dart`: The entry point to the application, responsible for initializing the app and setting up necessary configurations.

## APK Link

To try out the application, download the APK from the following link: [APK Download](https://drive.google.com/file/d/1aR4gZvPA5NUKlbyM9khExWhDWiZcyHr-/view?usp=sharing) or check the release tab in this repository.

## Test Result Snippet

![Test Result Snippet](https://raw.githubusercontent.com/erhahahaa/rahmat_bigio_mobile_intern_test/main/resources/test/result_snippet.png "Test Result Snippet")
