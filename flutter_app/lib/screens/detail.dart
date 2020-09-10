import 'dart:ui';

import 'package:floating_pullup_card/floating_layout.dart';
import 'package:floating_pullup_card/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/data_provider.dart';
import '../providers/router_provider.dart';
import '../providers/state_provider.dart';
import '../widgets/logo.dart';

class DetailScreenArguments {
  DetailScreenArguments({@required this.artwork, @required this.heroTag});
  ArtworkModel artwork;
  ValueKey heroTag;
}

class DetailScreen extends HookWidget {
  const DetailScreen({@required this.artwork, @required this.heroTag});
  final ArtworkModel artwork;
  final ValueKey heroTag;

  @override
  Widget build(BuildContext context) {
    final stateController = useProvider(stateProvider);
    final router = useProvider(routerProvider);
    final topPadding = MediaQuery.of(context).viewPadding.top;
    final textTheme = Theme.of(context).textTheme;
    final bottomScrollController = useScrollController();
    final pullUpState = useState(FloatingPullUpState.collapsed);
    final src = 'assets/images/${artwork.accession}_reduced.jpg';
    final remoteLink = 'https://www.clevelandart.org/art/${artwork.accession}';

    useEffect(() {
      Future.microtask(() {
        stateController.state = stateController.state.copyWith(
          fab: FloatingActionButton(
            backgroundColor: Theme.of(context).accentColor,
            onPressed: () {},
            child: PopupMenuButton(
              onSelected: (String result) async {
                switch (result) {
                  case 'open':
                    if (await canLaunch(remoteLink)) {
                      await launch(remoteLink);
                    } else {
                      throw 'Could not launch $remoteLink';
                    }
                    break;
                  case 'share':
                    Share.share(remoteLink);
                    break;
                }
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  value: 'open',
                  child: Text('Open on website'),
                ),
                const PopupMenuItem(
                  value: 'share',
                  child: Text('Share'),
                ),
              ],
              icon: const Icon(Icons.share),
            ),
          ),
        );
      });
      return () {
        Future.microtask(() {
          stateController.state = stateController.state.copyWith(fab: null);
        });
      };
    }, [stateController]);

    return FloatingPullUpCardLayout(
      cardColor: const Color.fromARGB(255, 41, 45, 62).withOpacity(0.9),
      collpsedStateOffset: (x, y) => x - 195,
      state: pullUpState.value,
      // width: MediaQuery.of(context).size.width - 50,
      onStateChange: (state) {
        bottomScrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 250),
          curve: Curves.ease,
        );
        pullUpState.value = state;
      },
      onOutsideTap: () {
        return FloatingPullUpState.collapsed;
      },
      uncollpsedStateOffset: (x) => topPadding + 100,
      autoPadding: false,
      body: SingleChildScrollView(
        controller: bottomScrollController,
        physics: pullUpState.value == FloatingPullUpState.collapsed
            ? const NeverScrollableScrollPhysics()
            : const AlwaysScrollableScrollPhysics(),
        child: BottomInfo(artwork),
      ),
      child: Center(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(src),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7), BlendMode.multiply),
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                child: PhotoView(
                  heroAttributes: PhotoViewHeroAttributes(
                    tag: heroTag,
                    transitionOnUserGestures: true,
                  ),
                  basePosition: const Alignment(0, -0.2),
                  backgroundDecoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  initialScale: PhotoViewComputedScale.contained,
                  imageProvider: AssetImage(src),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: topPadding, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    height: 64,
                    width: 64,
                    padding: const EdgeInsets.only(right: 16),
                    child: Logo(),
                  ),
                  OutlineButton.icon(
                    icon: const Icon(Icons.navigate_before),
                    onPressed: () => router.back(context),
                    label: const Text('BACK'),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        'Pinch, drag and double tap to explore artwork',
                        textAlign: TextAlign.left,
                        style: textTheme.overline
                            .copyWith(color: Colors.white.withOpacity(0.75)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreatorChip extends StatelessWidget {
  const CreatorChip(this.role, this.name, {this.isLast = false});
  final String role;
  final String name;
  final bool isLast;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final trimmedName = name.split('(')[0].trim();
    final exp = RegExp(r'\((.*)\)');
    final meta = exp.firstMatch(name)?.group(1)?.trim() ?? '';
    const color = Color.fromARGB(255, 32, 108, 94);

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                color: color,
                padding: const EdgeInsets.all(4),
                child: Text(role, style: textTheme.overline),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(trimmedName),
                ),
              ),
            ],
          ),
          if (meta.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 8.0),
              child: Text(meta, style: textTheme.caption),
            ),
          if (!isLast) const Divider(color: Colors.grey),
        ],
      ),
    );
  }
}

class BottomInfo extends HookWidget {
  const BottomInfo(this.artwork);
  final ArtworkModel artwork;
  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;

    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: bottomPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            artwork.department.name.toUpperCase(),
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .overline
                .copyWith(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8.0),
            child: Text(
              artwork.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          if (artwork.creators.isNotEmpty)
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
          ...artwork.creators.asMap().entries.map((entry) {
            final index = entry.key;
            final creator = entry.value;
            final name = creator.description ?? 'Unknown Creator';
            final role = creator.role ?? 'Unknown Role';
            return CreatorChip(
              role,
              name,
              isLast: index >= artwork.creators.length - 1,
            );
          }).toList(),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                artwork.tombstone,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text('Accession # ${artwork.accession}',
                style: Theme.of(context).textTheme.caption),
          ),
        ],
      ),
    );
  }
}
