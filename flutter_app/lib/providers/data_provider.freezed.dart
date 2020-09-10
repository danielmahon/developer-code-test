// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'data_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ArtworkModel _$ArtworkModelFromJson(Map<String, dynamic> json) {
  return _ArtworkModel.fromJson(json);
}

class _$ArtworkModelTearOff {
  const _$ArtworkModelTearOff();

// ignore: unused_element
  _ArtworkModel call(
      {int id,
      @JsonKey(name: 'accession_number') String accession,
      String title,
      String tombstone,
      DepartmentModel department,
      List<CreatorModel> creators}) {
    return _ArtworkModel(
      id: id,
      accession: accession,
      title: title,
      tombstone: tombstone,
      department: department,
      creators: creators,
    );
  }
}

// ignore: unused_element
const $ArtworkModel = _$ArtworkModelTearOff();

mixin _$ArtworkModel {
  int get id;
  @JsonKey(name: 'accession_number')
  String get accession;
  String get title;
  String get tombstone;
  DepartmentModel get department;
  List<CreatorModel> get creators;

  Map<String, dynamic> toJson();
  $ArtworkModelCopyWith<ArtworkModel> get copyWith;
}

abstract class $ArtworkModelCopyWith<$Res> {
  factory $ArtworkModelCopyWith(
          ArtworkModel value, $Res Function(ArtworkModel) then) =
      _$ArtworkModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: 'accession_number') String accession,
      String title,
      String tombstone,
      DepartmentModel department,
      List<CreatorModel> creators});

  $DepartmentModelCopyWith<$Res> get department;
}

class _$ArtworkModelCopyWithImpl<$Res> implements $ArtworkModelCopyWith<$Res> {
  _$ArtworkModelCopyWithImpl(this._value, this._then);

  final ArtworkModel _value;
  // ignore: unused_field
  final $Res Function(ArtworkModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object accession = freezed,
    Object title = freezed,
    Object tombstone = freezed,
    Object department = freezed,
    Object creators = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      accession: accession == freezed ? _value.accession : accession as String,
      title: title == freezed ? _value.title : title as String,
      tombstone: tombstone == freezed ? _value.tombstone : tombstone as String,
      department: department == freezed
          ? _value.department
          : department as DepartmentModel,
      creators: creators == freezed
          ? _value.creators
          : creators as List<CreatorModel>,
    ));
  }

  @override
  $DepartmentModelCopyWith<$Res> get department {
    if (_value.department == null) {
      return null;
    }
    return $DepartmentModelCopyWith<$Res>(_value.department, (value) {
      return _then(_value.copyWith(department: value));
    });
  }
}

abstract class _$ArtworkModelCopyWith<$Res>
    implements $ArtworkModelCopyWith<$Res> {
  factory _$ArtworkModelCopyWith(
          _ArtworkModel value, $Res Function(_ArtworkModel) then) =
      __$ArtworkModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: 'accession_number') String accession,
      String title,
      String tombstone,
      DepartmentModel department,
      List<CreatorModel> creators});

  @override
  $DepartmentModelCopyWith<$Res> get department;
}

class __$ArtworkModelCopyWithImpl<$Res> extends _$ArtworkModelCopyWithImpl<$Res>
    implements _$ArtworkModelCopyWith<$Res> {
  __$ArtworkModelCopyWithImpl(
      _ArtworkModel _value, $Res Function(_ArtworkModel) _then)
      : super(_value, (v) => _then(v as _ArtworkModel));

  @override
  _ArtworkModel get _value => super._value as _ArtworkModel;

  @override
  $Res call({
    Object id = freezed,
    Object accession = freezed,
    Object title = freezed,
    Object tombstone = freezed,
    Object department = freezed,
    Object creators = freezed,
  }) {
    return _then(_ArtworkModel(
      id: id == freezed ? _value.id : id as int,
      accession: accession == freezed ? _value.accession : accession as String,
      title: title == freezed ? _value.title : title as String,
      tombstone: tombstone == freezed ? _value.tombstone : tombstone as String,
      department: department == freezed
          ? _value.department
          : department as DepartmentModel,
      creators: creators == freezed
          ? _value.creators
          : creators as List<CreatorModel>,
    ));
  }
}

@JsonSerializable()
class _$_ArtworkModel implements _ArtworkModel {
  _$_ArtworkModel(
      {this.id,
      @JsonKey(name: 'accession_number') this.accession,
      this.title,
      this.tombstone,
      this.department,
      this.creators});

  factory _$_ArtworkModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ArtworkModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'accession_number')
  final String accession;
  @override
  final String title;
  @override
  final String tombstone;
  @override
  final DepartmentModel department;
  @override
  final List<CreatorModel> creators;

  @override
  String toString() {
    return 'ArtworkModel(id: $id, accession: $accession, title: $title, tombstone: $tombstone, department: $department, creators: $creators)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ArtworkModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.accession, accession) ||
                const DeepCollectionEquality()
                    .equals(other.accession, accession)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.tombstone, tombstone) ||
                const DeepCollectionEquality()
                    .equals(other.tombstone, tombstone)) &&
            (identical(other.department, department) ||
                const DeepCollectionEquality()
                    .equals(other.department, department)) &&
            (identical(other.creators, creators) ||
                const DeepCollectionEquality()
                    .equals(other.creators, creators)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(accession) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(tombstone) ^
      const DeepCollectionEquality().hash(department) ^
      const DeepCollectionEquality().hash(creators);

  @override
  _$ArtworkModelCopyWith<_ArtworkModel> get copyWith =>
      __$ArtworkModelCopyWithImpl<_ArtworkModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ArtworkModelToJson(this);
  }
}

abstract class _ArtworkModel implements ArtworkModel {
  factory _ArtworkModel(
      {int id,
      @JsonKey(name: 'accession_number') String accession,
      String title,
      String tombstone,
      DepartmentModel department,
      List<CreatorModel> creators}) = _$_ArtworkModel;

  factory _ArtworkModel.fromJson(Map<String, dynamic> json) =
      _$_ArtworkModel.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'accession_number')
  String get accession;
  @override
  String get title;
  @override
  String get tombstone;
  @override
  DepartmentModel get department;
  @override
  List<CreatorModel> get creators;
  @override
  _$ArtworkModelCopyWith<_ArtworkModel> get copyWith;
}

DepartmentModel _$DepartmentModelFromJson(Map<String, dynamic> json) {
  return _DepartmentModel.fromJson(json);
}

class _$DepartmentModelTearOff {
  const _$DepartmentModelTearOff();

// ignore: unused_element
  _DepartmentModel call({int id, String name}) {
    return _DepartmentModel(
      id: id,
      name: name,
    );
  }
}

// ignore: unused_element
const $DepartmentModel = _$DepartmentModelTearOff();

mixin _$DepartmentModel {
  int get id;
  String get name;

  Map<String, dynamic> toJson();
  $DepartmentModelCopyWith<DepartmentModel> get copyWith;
}

abstract class $DepartmentModelCopyWith<$Res> {
  factory $DepartmentModelCopyWith(
          DepartmentModel value, $Res Function(DepartmentModel) then) =
      _$DepartmentModelCopyWithImpl<$Res>;
  $Res call({int id, String name});
}

class _$DepartmentModelCopyWithImpl<$Res>
    implements $DepartmentModelCopyWith<$Res> {
  _$DepartmentModelCopyWithImpl(this._value, this._then);

  final DepartmentModel _value;
  // ignore: unused_field
  final $Res Function(DepartmentModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

abstract class _$DepartmentModelCopyWith<$Res>
    implements $DepartmentModelCopyWith<$Res> {
  factory _$DepartmentModelCopyWith(
          _DepartmentModel value, $Res Function(_DepartmentModel) then) =
      __$DepartmentModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name});
}

class __$DepartmentModelCopyWithImpl<$Res>
    extends _$DepartmentModelCopyWithImpl<$Res>
    implements _$DepartmentModelCopyWith<$Res> {
  __$DepartmentModelCopyWithImpl(
      _DepartmentModel _value, $Res Function(_DepartmentModel) _then)
      : super(_value, (v) => _then(v as _DepartmentModel));

  @override
  _DepartmentModel get _value => super._value as _DepartmentModel;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
  }) {
    return _then(_DepartmentModel(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

@JsonSerializable()
class _$_DepartmentModel implements _DepartmentModel {
  _$_DepartmentModel({this.id, this.name});

  factory _$_DepartmentModel.fromJson(Map<String, dynamic> json) =>
      _$_$_DepartmentModelFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'DepartmentModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DepartmentModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name);

  @override
  _$DepartmentModelCopyWith<_DepartmentModel> get copyWith =>
      __$DepartmentModelCopyWithImpl<_DepartmentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DepartmentModelToJson(this);
  }
}

abstract class _DepartmentModel implements DepartmentModel {
  factory _DepartmentModel({int id, String name}) = _$_DepartmentModel;

  factory _DepartmentModel.fromJson(Map<String, dynamic> json) =
      _$_DepartmentModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  _$DepartmentModelCopyWith<_DepartmentModel> get copyWith;
}

CreatorModel _$CreatorModelFromJson(Map<String, dynamic> json) {
  return _CreatorModel.fromJson(json);
}

class _$CreatorModelTearOff {
  const _$CreatorModelTearOff();

// ignore: unused_element
  _CreatorModel call({int id, String role, String description}) {
    return _CreatorModel(
      id: id,
      role: role,
      description: description,
    );
  }
}

// ignore: unused_element
const $CreatorModel = _$CreatorModelTearOff();

mixin _$CreatorModel {
  int get id;
  String get role;
  String get description;

  Map<String, dynamic> toJson();
  $CreatorModelCopyWith<CreatorModel> get copyWith;
}

abstract class $CreatorModelCopyWith<$Res> {
  factory $CreatorModelCopyWith(
          CreatorModel value, $Res Function(CreatorModel) then) =
      _$CreatorModelCopyWithImpl<$Res>;
  $Res call({int id, String role, String description});
}

class _$CreatorModelCopyWithImpl<$Res> implements $CreatorModelCopyWith<$Res> {
  _$CreatorModelCopyWithImpl(this._value, this._then);

  final CreatorModel _value;
  // ignore: unused_field
  final $Res Function(CreatorModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object role = freezed,
    Object description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      role: role == freezed ? _value.role : role as String,
      description:
          description == freezed ? _value.description : description as String,
    ));
  }
}

abstract class _$CreatorModelCopyWith<$Res>
    implements $CreatorModelCopyWith<$Res> {
  factory _$CreatorModelCopyWith(
          _CreatorModel value, $Res Function(_CreatorModel) then) =
      __$CreatorModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String role, String description});
}

class __$CreatorModelCopyWithImpl<$Res> extends _$CreatorModelCopyWithImpl<$Res>
    implements _$CreatorModelCopyWith<$Res> {
  __$CreatorModelCopyWithImpl(
      _CreatorModel _value, $Res Function(_CreatorModel) _then)
      : super(_value, (v) => _then(v as _CreatorModel));

  @override
  _CreatorModel get _value => super._value as _CreatorModel;

  @override
  $Res call({
    Object id = freezed,
    Object role = freezed,
    Object description = freezed,
  }) {
    return _then(_CreatorModel(
      id: id == freezed ? _value.id : id as int,
      role: role == freezed ? _value.role : role as String,
      description:
          description == freezed ? _value.description : description as String,
    ));
  }
}

@JsonSerializable()
class _$_CreatorModel implements _CreatorModel {
  _$_CreatorModel({this.id, this.role, this.description});

  factory _$_CreatorModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CreatorModelFromJson(json);

  @override
  final int id;
  @override
  final String role;
  @override
  final String description;

  @override
  String toString() {
    return 'CreatorModel(id: $id, role: $role, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CreatorModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(description);

  @override
  _$CreatorModelCopyWith<_CreatorModel> get copyWith =>
      __$CreatorModelCopyWithImpl<_CreatorModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CreatorModelToJson(this);
  }
}

abstract class _CreatorModel implements CreatorModel {
  factory _CreatorModel({int id, String role, String description}) =
      _$_CreatorModel;

  factory _CreatorModel.fromJson(Map<String, dynamic> json) =
      _$_CreatorModel.fromJson;

  @override
  int get id;
  @override
  String get role;
  @override
  String get description;
  @override
  _$CreatorModelCopyWith<_CreatorModel> get copyWith;
}
