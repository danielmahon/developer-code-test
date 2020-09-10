import 'package:flutter/material.dart';

class Notifications {
  /// Private constructor, can only be invoked inside of this file (library).
  Notifications._();

  static void showSnackBarWithException(
    BuildContext context,
    Exception exception, {
    Duration duration = const Duration(seconds: 4),
    bool force = false,
  }) {
    final ScaffoldState rootScaffold =
        context.findRootAncestorStateOfType<ScaffoldState>();
    if (force) rootScaffold.hideCurrentSnackBar();
    final message = exception.toString().replaceFirst('Exception:', '');
    rootScaffold.showSnackBar(SnackBar(
      // behavior: SnackBarBehavior.floating,
      duration: duration,
      content: Text(
        message.trim() ?? 'Sorry, an error has ocurred',
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red[500],
    ));
  }

  static void showSnackBarWithSuccess(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 4),
    bool force = false,
  }) {
    final ScaffoldState rootScaffold =
        context.findRootAncestorStateOfType<ScaffoldState>();
    if (force) rootScaffold.hideCurrentSnackBar();
    rootScaffold.showSnackBar(SnackBar(
      // behavior: SnackBarBehavior.floating,
      duration: duration,
      content: Text(
        message ?? 'Success!',
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green[500],
    ));
  }

  static void showSnackBar(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 4),
    bool force = false,
  }) {
    final ScaffoldState rootScaffold =
        context.findRootAncestorStateOfType<ScaffoldState>();
    if (force) rootScaffold.hideCurrentSnackBar();
    rootScaffold.showSnackBar(SnackBar(
      // behavior: SnackBarBehavior.floating,
      duration: duration,
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.grey[850],
      action: SnackBarAction(
        label: 'DISMISS',
        onPressed: rootScaffold.hideCurrentSnackBar,
      ),
    ));
  }
}
