// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArtworkModel _$_$_ArtworkModelFromJson(Map<String, dynamic> json) {
  return _$_ArtworkModel(
    id: json['id'] as int,
    accession: json['accession_number'] as String,
    title: json['title'] as String,
    tombstone: json['tombstone'] as String,
    department: json['department'] == null
        ? null
        : DepartmentModel.fromJson(json['department'] as Map<String, dynamic>),
    creators: (json['creators'] as List)
        ?.map((e) =>
            e == null ? null : CreatorModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_ArtworkModelToJson(_$_ArtworkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accession_number': instance.accession,
      'title': instance.title,
      'tombstone': instance.tombstone,
      'department': instance.department,
      'creators': instance.creators,
    };

_$_DepartmentModel _$_$_DepartmentModelFromJson(Map<String, dynamic> json) {
  return _$_DepartmentModel(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$_$_DepartmentModelToJson(_$_DepartmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$_CreatorModel _$_$_CreatorModelFromJson(Map<String, dynamic> json) {
  return _$_CreatorModel(
    id: json['id'] as int,
    role: json['role'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$_$_CreatorModelToJson(_$_CreatorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'description': instance.description,
    };
