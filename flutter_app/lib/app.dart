import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers/router_provider.dart';
import 'providers/theme_provider.dart';

class App extends HookWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = useProvider(routerProvider);
    final theme = useProvider(themeProvider);

    // Set status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      title: 'CMA Collections',
      theme: theme.state,
      initialRoute: 'home',
      onGenerateRoute: router.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
