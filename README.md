# Flutter Skeleton

This is a skeleton project for Flutter that provides a basic structure and configuration to kickstart your Flutter application development.

This project is a starting point for a Flutter application that follows the
[simple app state management tutorial](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple).

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on mobile development, and a
full API reference.

## Features

- Boilerplate code and folder structure for a Flutter project.
- Pre-configured dependencies and packages commonly used in Flutter development.
- Example code and comments to help you get started quickly.

## Table of Contents

- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Project Structure](#project-structure)
- [Coding Guidelines](#coding-guidelines)
- [Usage](#usage)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgments](#acknowledgments)

## Getting Started

These instructions will help you get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Make sure you have Flutter installed on your machine. If you haven't installed Flutter yet, you can follow the official Flutter installation guide: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)

### Installation

1. Clone the repository to your local machine using the following command:

```
   git clone https://github.com/sawal-timsina/flutter-skeleton.git
```

2. Change into the project directory using the following command:

```
   cd flutter-skeleton
```

3. Fetch the dependencies using the following command:

```
 flutter clean
 flutter pub get
```

4. Run the project using the following command:

```
  flutter run
```

This will launch the app on your connected device or emulator.

## Project Structure

The project structure follows a common Flutter project layout:

```
├── Android/
├── Assets/
├── Ios/
├── lib/
  ├── src/
     ── config/
     ── core/utils/
     ── models/
     ── pages/
     ── providers/
     ── widgets/
        ── atoms/
        ── molecules/
        ── organisms/
  ├──  app.dart
  ├──  injector.dart
  ├──  environment
```

## Assets

The `assets` directory houses images, fonts, and any other files you want to include with your application.

The `assets/images` directory
contains [resolution-aware images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

The `assets/translations` directory contains translation files in json format. File name format : <country-code>.json

## Firebase setup

### Android

Goto `android/build.gradle` and add this line inside dependency

`classpath "com.google.gms:google-services:4.3.10"`

Now, goto `android/app/build.gradle` and add this line

`apply plugin: 'com.google.gms.google-services'`

below `apply plugin: 'com.android.application'`

### IOS

Goto `ios?Runner/AppDelegate.swift` and add this line on top

`import Firebase`

and inside application function of AppDelegate class before return

`FirebaseApp.configure()`

now goto `ios/podfile` add this line

`pod 'Firebase/Auth'`

below

`target 'Runner' do`

## src

The src directory typically contains the main Dart code for your Flutter application.

## Config

The config directory is used to store configuration-related files for your application.

## Core/utils

The core directory might contain core functionality or utilities that are used throughout the application. It could include files such as `constants.dart`, `enums.dart`, `utils.dart`, or any other shared code that doesn't fit into other specific categories.

## Modals

The models directory is where you define the data models for your application. These models represent the structure and behavior of your data objects. For example, you might have files such as `user.dart`, `product.dart`, `drop_down.dart`, etc., representing different entities in your application.

## pages

The pages directory typically contains the different screens or pages of your application. Each page is often a separate Dart file and represents a unique UI component or view. For instance, you might have files like `home_page.dart`, `splash_page.dart`, `profile_page.dart`,`login_page.dart` and `register_page.dart`etc., defining the UI and behavior of each screen/page in your app.

## providers

The providers directory might include files related to state management or dependency injection. It is common to use packages like Provider, Riverpod, or Getx for state management and dependency injection in Flutter. You might have files such as `auth_provider.dart`, `onboarding_provider.dart`, `router_provider.dart`, etc. which provide and manage specific data or services throughout the app.

### Widgets

The widgets directory contains reusable UI components that can be used across multiple screens or views in your application, following the atomic structure pattern.

- ### Atoms

  The atoms directory contains the smallest and simplest UI components in the atomic structure pattern. These components are typically reusable and represent basic visual elements, such as `buttons`, `icons`, `text_fields` etc. Atoms are designed to be highly independent and self-contained, usually without any direct dependencies on other components.

- ### Molecules

  The molecules directory includes more complex UI components that are composed of one or more atoms. These components are considered a step above atoms in terms of complexity and functionality. Molecules represent reusable and relatively independent units of UI, such as a `form field with a label and an input`, or a `card component with an image and text`.

- ### Organisms
  The organisms directory consists of even more complex UI components that are composed of atoms, molecules, and sometimes other organisms. Organisms represent complete, reusable sections or modules of UI that can function independently within an application. Examples could include a `header section with a logo`, `navigation and user profile`, or a `search results list with filtering options`.

### `app.dart`

This file is not within any specific folder. It likely serves as the entry point of your Flutter application, defining the main App widget and its configuration. It might set up `MaterialApp`, `theme`, `routes` or other app-level settings.

### `injector.dart`

This file is not within any specific folder. It could be responsible for providing dependency injection or service location capabilities to the application. It might define a dependency injection container or a class responsible for registering and retrieving dependencies throughout the app.

### Environments

Place the env files like `config.dart, google-services.json, GoogleService.plist` inside respective `env/<dev|prod>`
folder.

And you can run `make set-env-dev | make set-env-prod` in terminal to set the required environment files.

## Coding Guidelines

Additionally, utilize this article to enhance the quality of your code. This resource encompasses guidelines for naming conventions, code style and formatting, as well as other best practices.

- [medium-article](https://medium.com/readytowork-org/flutter-best-practices-and-coding-guidelines-f494b1ad2369)

## Usage

You can start building your Flutter application on top of this skeleton project. Modify or replace the existing code to fit your application's requirements. The skeleton project provides an example structure and initial code to get you started quickly.

## Testing

The `test/` directory contains files and examples to help you write tests for your Flutter application. It is recommended to follow good testing practices and write unit, integration, and widget tests to ensure the stability and correctness of your code.

## Contributing

Contributions are welcome! If you have any ideas, suggestions, or bug reports, please open an issue on the GitHub repository. If you'd like to contribute code, you can fork the repository, create a new branch, make your changes, and submit a pull request.

Please make sure to follow the existing coding style and conventions in the project.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

- This project was inspired by the need for a starter template for Flutter projects.
- Special thanks to the Flutter community for their valuable contributions and support.
