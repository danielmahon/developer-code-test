import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Hook function that creates a page controller that is automatically
/// disposed when the widget is disposed.
///
PageController usePageController({int initialPage = 0}) {
  final pageController = useMemoized(
    () => PageController(initialPage: initialPage),
  );

  useEffect(
    () => pageController.dispose,
    [pageController],
  );

  return pageController;
}
