import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../screens/detail.dart';
import '../screens/home.dart';
import '../screens/intro.dart';
import '../widgets/simple_layout.dart';
import 'config_provider.dart';
import 'state_provider.dart';

final routerProvider = Provider<AppRouter>((ref) {
  final config = ref.watch(configProvider);
  return AppRouter(config);
});

class AppRouter {
  AppRouter(this.config);

  Configuration config;

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(
          // maintainState: false,
          settings: settings,
          builder: (_) => Shield(child: SimpleLayout(child: HomeScreen())),
        );
      case 'detail':
        final args = settings.arguments as DetailScreenArguments;
        return MaterialPageRoute(
          // maintainState: false,
          settings: settings,
          builder: (_) => Shield(
            child: SimpleLayout(
                child: DetailScreen(
              artwork: args.artwork,
              heroTag: args.heroTag,
            )),
          ),
        );
      default:
        return MaterialPageRoute(
          // maintainState: false,
          settings: settings,
          builder: (_) => Shield(child: SimpleLayout(child: NotFoundScreen())),
        );
    }
  }

  void pushNamedAndRemoveUntil(
    BuildContext context,
    String name, {
    Object arguments,
  }) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      name,
      (route) => false,
      arguments: arguments,
    );
  }

  void pushNamed(BuildContext context, String name, {Object arguments}) {
    Navigator.of(context).pushNamed(name, arguments: arguments);
  }

  void back(BuildContext context) {
    Navigator.of(context).maybePop();
  }
}

class Shield extends HookWidget {
  const Shield({@required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final state = useProvider(stateProvider).state;

    if (!state.hasOnboarded) {
      return SimpleLayout(child: IntroScreen());
    }

    return child;
  }
}

class NotFoundScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Page not found!'),
            ],
          ),
        ),
      ),
    );
  }
}
