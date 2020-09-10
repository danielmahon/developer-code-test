import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';

Future<void> main() async {
  // Ensure flutter bindings are ready (needed with async main)
  WidgetsFlutterBinding.ensureInitialized();

  // Run app
  runApp(ProviderScope(child: App()));
}
