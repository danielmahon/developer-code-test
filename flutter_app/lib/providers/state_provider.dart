import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'data_provider.dart';

part 'state_provider.freezed.dart';

final stateProvider = StateProvider((_) => const AppState());

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    @Default(false) bool hasOnboarded,
    Widget fab,
    @Default([]) List<DepartmentModel> favorites,
  }) = _AppState;
}
