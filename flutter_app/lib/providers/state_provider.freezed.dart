// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'state_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AppStateTearOff {
  const _$AppStateTearOff();

// ignore: unused_element
  _AppState call(
      {bool hasOnboarded = false,
      Widget fab,
      List<DepartmentModel> favorites = const []}) {
    return _AppState(
      hasOnboarded: hasOnboarded,
      fab: fab,
      favorites: favorites,
    );
  }
}

// ignore: unused_element
const $AppState = _$AppStateTearOff();

mixin _$AppState {
  bool get hasOnboarded;
  Widget get fab;
  List<DepartmentModel> get favorites;

  $AppStateCopyWith<AppState> get copyWith;
}

abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
  $Res call({bool hasOnboarded, Widget fab, List<DepartmentModel> favorites});
}

class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object hasOnboarded = freezed,
    Object fab = freezed,
    Object favorites = freezed,
  }) {
    return _then(_value.copyWith(
      hasOnboarded:
          hasOnboarded == freezed ? _value.hasOnboarded : hasOnboarded as bool,
      fab: fab == freezed ? _value.fab : fab as Widget,
      favorites: favorites == freezed
          ? _value.favorites
          : favorites as List<DepartmentModel>,
    ));
  }
}

abstract class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) then) =
      __$AppStateCopyWithImpl<$Res>;
  @override
  $Res call({bool hasOnboarded, Widget fab, List<DepartmentModel> favorites});
}

class __$AppStateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(_AppState _value, $Res Function(_AppState) _then)
      : super(_value, (v) => _then(v as _AppState));

  @override
  _AppState get _value => super._value as _AppState;

  @override
  $Res call({
    Object hasOnboarded = freezed,
    Object fab = freezed,
    Object favorites = freezed,
  }) {
    return _then(_AppState(
      hasOnboarded:
          hasOnboarded == freezed ? _value.hasOnboarded : hasOnboarded as bool,
      fab: fab == freezed ? _value.fab : fab as Widget,
      favorites: favorites == freezed
          ? _value.favorites
          : favorites as List<DepartmentModel>,
    ));
  }
}

class _$_AppState implements _AppState {
  const _$_AppState(
      {this.hasOnboarded = false, this.fab, this.favorites = const []})
      : assert(hasOnboarded != null),
        assert(favorites != null);

  @JsonKey(defaultValue: false)
  @override
  final bool hasOnboarded;
  @override
  final Widget fab;
  @JsonKey(defaultValue: const [])
  @override
  final List<DepartmentModel> favorites;

  @override
  String toString() {
    return 'AppState(hasOnboarded: $hasOnboarded, fab: $fab, favorites: $favorites)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppState &&
            (identical(other.hasOnboarded, hasOnboarded) ||
                const DeepCollectionEquality()
                    .equals(other.hasOnboarded, hasOnboarded)) &&
            (identical(other.fab, fab) ||
                const DeepCollectionEquality().equals(other.fab, fab)) &&
            (identical(other.favorites, favorites) ||
                const DeepCollectionEquality()
                    .equals(other.favorites, favorites)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(hasOnboarded) ^
      const DeepCollectionEquality().hash(fab) ^
      const DeepCollectionEquality().hash(favorites);

  @override
  _$AppStateCopyWith<_AppState> get copyWith =>
      __$AppStateCopyWithImpl<_AppState>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {bool hasOnboarded,
      Widget fab,
      List<DepartmentModel> favorites}) = _$_AppState;

  @override
  bool get hasOnboarded;
  @override
  Widget get fab;
  @override
  List<DepartmentModel> get favorites;
  @override
  _$AppStateCopyWith<_AppState> get copyWith;
}
