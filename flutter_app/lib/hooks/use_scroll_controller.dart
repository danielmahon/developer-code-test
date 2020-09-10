import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Creates and dispose of a [ScrollController].
///
/// See also:
/// - [ScrollController]
ScrollController useScrollController({
  double initialScrollOffset,
  bool keepScrollOffset,
  String debugLabel,
}) =>
    use(_ScrollControllerHook(
      initialScrollOffset: initialScrollOffset,
      keepScrollOffset: keepScrollOffset,
      debugLabel: debugLabel,
    ));

class _ScrollControllerHook extends Hook<ScrollController> {
  const _ScrollControllerHook({
    this.initialScrollOffset,
    this.keepScrollOffset,
    this.debugLabel,
  });

  final double initialScrollOffset;
  final bool keepScrollOffset;
  final String debugLabel;

  @override
  _ScrollControllerHookState createState() {
    return _ScrollControllerHookState();
  }
}

class _ScrollControllerHookState
    extends HookState<ScrollController, _ScrollControllerHook> {
  ScrollController _scrollController;

  @override
  void initHook() {
    super.initHook();
    _scrollController = ScrollController(
      initialScrollOffset: hook.initialScrollOffset,
      keepScrollOffset: hook.keepScrollOffset,
      debugLabel: hook.debugLabel,
    );
  }

  @override
  ScrollController build(BuildContext context) => _scrollController;

  @override
  void dispose() => _scrollController?.dispose();
}
