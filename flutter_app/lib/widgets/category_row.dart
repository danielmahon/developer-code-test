import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/data_provider.dart';
import '../providers/router_provider.dart';
import '../screens/detail.dart';

class CategoryRow extends HookWidget {
  const CategoryRow({
    Key key,
    @required this.title,
    @required this.artworks,
    this.subtitle = '',
  }) : super(key: key);

  final String title;
  final String subtitle;
  final List<ArtworkModel> artworks;

  @override
  Widget build(BuildContext context) {
    final controller = useScrollController();
    final router = useProvider(routerProvider);
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, bottom: 4),
          child: Text(
            title,
            style: textTheme.subtitle1.copyWith(fontSize: 18),
          ),
        ),
        if (subtitle.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 4),
            child: Text(
              subtitle,
              style: textTheme.caption,
            ),
          ),
        Container(
          height: 100,
          child: ListView.builder(
            controller: controller,
            itemCount: artworks.length,
            padding: const EdgeInsets.symmetric(vertical: 8),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              final artwork = artworks[i];
              final heroTag = ValueKey('$title: ${artwork.accession}');
              return ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 64,
                ),
                child: Card(
                  elevation: 4,
                  clipBehavior: Clip.antiAlias,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: InkWell(
                    onTap: () {
                      router.pushNamed(
                        context,
                        'detail',
                        arguments: DetailScreenArguments(
                          artwork: artwork,
                          heroTag: heroTag,
                        ),
                      );
                    },
                    child: Hero(
                      tag: heroTag,
                      child: Image.asset(
                        'assets/images/${artwork.accession}_reduced.jpg',
                        height: 100,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
