import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/state_provider.dart';

class SimpleLayout extends HookWidget {
  const SimpleLayout({@required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final fab = useProvider(stateProvider).state.fab;

    return MediaQuery(
      // Disable system font scaling
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: ColorfulSafeArea(
          overflowRules: const OverflowRules.all(true),
          child: child,
        ),
        floatingActionButton: fab,
      ),
    );
  }
}
