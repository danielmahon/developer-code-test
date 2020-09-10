import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/data_provider.dart';
import '../providers/state_provider.dart';

class Favorites extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final dataAsync = useProvider(dataProvider);
    final stateController = useProvider(stateProvider);
    final selectedChips = useState<Set<int>>({});

    return dataAsync.when(
      data: (data) {
        final departments = data.fold<Set<DepartmentModel>>({}, (acc, artwork) {
          acc.add(artwork.department);
          return acc;
        }).toList();

        void handleSelectChip(int index) {
          if (selectedChips.value.contains(index)) {
            selectedChips.value.remove(index);
          } else {
            selectedChips.value.add(index);
          }
          selectedChips.value = {...selectedChips.value};
          // Set state
          stateController.state = stateController.state.copyWith(
            favorites: departments
                .where(
                    (department) => selectedChips.value.contains(department.id))
                .toList(),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            // runSpacing: 8,
            children: departments.take(6).map((department) {
              return ChoiceChip(
                label: Text(department.name),
                selected: selectedChips.value.contains(department.id),
                onSelected: (sel) => handleSelectChip(department.id),
                selectedColor: const Color.fromARGB(255, 32, 108, 94),
              );
            }).toList(),
          ),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, _) => Center(
        child: Text(error.toString()),
      ),
    );
  }
}
