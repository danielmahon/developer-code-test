import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../hooks/use_page_controller.dart';
import '../providers/state_provider.dart';
import '../widgets/favorites.dart';
import '../widgets/logo.dart';

class IntroScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = usePageController();
    final currentPage = useState(0);
    final stateController = useProvider(stateProvider);
    final textTheme = Theme.of(context).textTheme;

    final logo = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0),
      child: Logo(),
    );

    final pages = [
      Container(
        color: const Color.fromARGB(255, 32, 108, 94),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(),
                logo,
                Text(
                  'Welcome, this app will be your gateway to a very limited selection of artwork.',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyText1
                      .copyWith(color: Colors.white.withOpacity(0.6)),
                ),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
      Container(
        color: const Color.fromARGB(255, 0, 87, 171),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(),
                logo,
                Text(
                  'The full collection will unlock after you make a very generous donation.\n\nUpgrade today.\n\nWe accept the following:\nNon-sequential bills\nPiles of gold coins\nVibranium',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyText1
                      .copyWith(color: Colors.white.withOpacity(0.6)),
                ),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
      Container(
        color: const Color.fromARGB(255, 35, 40, 55),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(),
                logo,
                Text(
                  'In the meantime, please choose some of your favorite collections to get started...',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyText1
                      .copyWith(color: Colors.white.withOpacity(0.6)),
                ),
                Favorites(),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
    ];

    return Stack(
      children: [
        PageView(
          controller: controller,
          onPageChanged: (page) {
            currentPage.value = page;
          },
          children: pages,
        ),
        Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pages.asMap().entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Icon(
                  Icons.circle,
                  size: 12,
                  color: currentPage.value == entry.key
                      ? Colors.white
                      : Colors.black.withOpacity(0.4),
                ),
              );
            }).toList(),
          ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.all(16),
          child: FlatButton(
            onPressed: () {
              currentPage.value >= pages.length - 1
                  ? stateController.state =
                      stateController.state.copyWith(hasOnboarded: true)
                  : controller.animateToPage(
                      currentPage.value + 1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
            },
            child: Text(
              currentPage.value >= pages.length - 1 ? 'DONE' : 'NEXT',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
