# GEMINI.md

## Project Overview

This is a Flutter-based mobile application that implements a simple bank account, created as an exercise in Test-Driven Development (TDD).

The application allows users to:
*   Deposit money into an account.
*   Withdraw money from an account.
*   Print a formatted statement of transactions to the console.

The project follows a clean architecture, separating business logic (account, transactions) from UI concerns. The core logic is tested with unit tests, and there is an acceptance test to verify the end-to-end functionality of printing a statement.

## Building and Running

### Prerequisites

*   Flutter SDK: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
*   A configured emulator or physical device.

### Running the Application

1.  **Get dependencies:**
    ```shell
    flutter pub get
    ```
2.  **Run the app:**
    ```shell
    flutter run
    ```

### Running Tests

To run the unit and acceptance tests, use the following command:

```shell
flutter test
```

## Development Conventions

### Testing

*   **Test-Driven Development (TDD):** The project is structured to follow TDD principles. New features should be added by first writing a failing test and then implementing the feature to make the test pass.
*   **Mocking:** The `mocktail` package is used for creating mocks for dependencies in unit tests. Mocks are stored in the `test/` directory with a `mock_` prefix.
*   **Test Organization:**
    *   Unit tests are placed in the `test/` directory and have a `_test.dart` suffix.
    *   Acceptance tests are also in the `test/` directory, demonstrated by `acceptance_test.dart`.

### Code Style

*   **Linting:** The project uses `flutter_lints` to enforce good coding practices. The linting rules are configured in `analysis_options.yaml`.
*   **Formatting:** Code should be formatted using the standard Dart formatter (`dart format .`).

### Architecture

*   **Dependency Injection:** Dependencies are manually injected via constructors. This is evident in the `Account` class, which receives `TransactionRepository` and `StatementPrinter` instances.
*   **Separation of Concerns:** The project separates the core business logic from the UI and infrastructure concerns. For example, `MyClock` and `MyConsole` are abstractions over the system clock and console, allowing for easier testing.
