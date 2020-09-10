import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/data_provider.dart';
import '../providers/router_provider.dart';
import '../providers/state_provider.dart';
import '../widgets/category_row.dart';
import '../widgets/logo.dart';
import 'detail.dart';

class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final router = useProvider(routerProvider);
    final dataAsync = useProvider(dataProvider);
    final textTheme = Theme.of(context).textTheme;
    final paddingTop = MediaQuery.of(context).viewPadding.top;
    const coverHeroTag = ValueKey('cover-hero-tag');

    return Container(
      color: Theme.of(context).primaryColor,
      child: dataAsync.when(
        data: (data) {
          final departments =
              data.fold<Set<DepartmentModel>>({}, (acc, artwork) {
            acc.add(artwork.department);
            return acc;
          });
          return Padding(
            padding: EdgeInsets.symmetric(vertical: paddingTop),
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                Row(
                  children: [
                    Container(
                      height: 92,
                      width: 92,
                      padding: const EdgeInsets.all(16),
                      child: Logo(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Collections',
                          style: textTheme.headline5,
                        ),
                        Text(
                          'Exactly one hundred random pieces.',
                          style: textTheme.caption,
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  padding: const EdgeInsets.only(bottom: 16),
                  child: InkWell(
                    onTap: () {
                      router.pushNamed(
                        context,
                        'detail',
                        arguments: DetailScreenArguments(
                          artwork: data[0],
                          heroTag: coverHeroTag,
                        ),
                      );
                    },
                    child: Hero(
                      tag: coverHeroTag,
                      child: Image.asset(
                        'assets/images/${data[0].accession}_reduced.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Recommended(data),
                ...departments.map((department) {
                  final artworks = data.where((artwork) {
                    return artwork.department.id == department.id;
                  }).toList();

                  return CategoryRow(
                    title: department.name,
                    artworks: artworks,
                  );
                }).toList()
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
      ),
    );
  }
}

class Recommended extends HookWidget {
  const Recommended(this.data);
  final List<ArtworkModel> data;

  @override
  Widget build(BuildContext context) {
    final state = useProvider(stateProvider).state;
    final artworks = data.where((artwork) {
      return state.favorites.contains(artwork.department);
    }).toList();

    artworks.shuffle();

    if (artworks.isEmpty) {
      return Container();
    }

    return CategoryRow(
      title: 'Recommended Artwork',
      subtitle: 'Based on your favorite collection selections',
      artworks: artworks,
    );
  }
}
