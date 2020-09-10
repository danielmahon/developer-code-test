import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Logo extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return WebsafeSvg.asset(
      'assets/cma-logo.svg',
      semanticsLabel: 'CMA Logo',
      color: Colors.white,
    );
  }
}
