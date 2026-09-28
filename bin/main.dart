import 'dart:io';

import 'package:app_shield/src/features/print_removal/print_modification_service.dart';

/// The main entry point for the Dash Shield console application.
///
/// This script provides a console interface for managing print statements
/// within a Flutter project. Currently, it allows users to either remove
/// all print statements or wrap them with kDebugMode to ensure they
/// only run in debug mode. More options will be added in future updates.
void main() async {
  await showMainMenu();
}

/// Displays the main menu for Dash Shield console options.
///
/// This function presents a prompt with options related to print management
/// in the project. Future updates will add more options to the menu.
Future<void> showMainMenu() async {
  final selectedOption = _select(
    'What do you want to do? (a lot of addons will be added soon)',
    ['Prints Removal & Replace'],
  );

  if (selectedOption == 0) {
    await showPrintsMenu();
  }
}

/// Displays the print management submenu with available actions.
///
/// This function allows the user to choose between removing all print
/// statements or wrapping them with kDebugMode.
Future<void> showPrintsMenu() async {
  final selectedAction = _select(
    'Choose an action:',
    ['Remove All Prints', 'Wrap All Prints with kDebugMode'],
  );

  if (selectedAction == 0) {
    stdout.writeln('Searching for prints in your project..');
    await PrintModificationService.removePrints();
    stdout.writeln('🏆 All prints have been removed for you.');
  } else if (selectedAction == 1) {
    stdout.writeln('Searching for prints in your project..');
    await PrintModificationService.wrapPrintsWithDebugModeChecker();
    stdout
        .writeln('🏆 All prints have been wrapped inside kDebugMode Checker.');
  }
}

/// Prompts the user to pick one of [options] by number and returns its
/// zero-based index. Re-prompts until a valid choice is entered.
int _select(String prompt, List<String> options) {
  stdout.writeln(prompt);
  for (var i = 0; i < options.length; i++) {
    stdout.writeln('  ${i + 1}) ${options[i]}');
  }

  while (true) {
    stdout.write('> ');
    final input = stdin.readLineSync();
    if (input == null) exit(1);

    final choice = int.tryParse(input.trim());
    if (choice != null && choice >= 1 && choice <= options.length) {
      return choice - 1;
    }
    stdout.writeln('Please enter a number between 1 and ${options.length}.');
  }
}
