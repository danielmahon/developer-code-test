import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'data_provider.freezed.dart';
part 'data_provider.g.dart';

final dataProvider = FutureProvider<List<ArtworkModel>>((_) async {
  final source = await rootBundle.loadString('assets/cma-artworks.json');
  final list = json.decode(source) as List<dynamic>;
  return list
      .map<ArtworkModel>(
          (e) => ArtworkModel.fromJson(e as Map<String, dynamic>))
      .toList();
});

@freezed
abstract class ArtworkModel with _$ArtworkModel {
  factory ArtworkModel({
    int id,
    @JsonKey(name: 'accession_number') String accession,
    String title,
    String tombstone,
    DepartmentModel department,
    List<CreatorModel> creators,
  }) = _ArtworkModel;

  factory ArtworkModel.fromJson(Map<String, dynamic> json) =>
      _$ArtworkModelFromJson(json);
}

@freezed
abstract class DepartmentModel with _$DepartmentModel {
  factory DepartmentModel({
    int id,
    String name,
  }) = _DepartmentModel;

  factory DepartmentModel.fromJson(Map<String, dynamic> json) =>
      _$DepartmentModelFromJson(json);
}

@freezed
abstract class CreatorModel with _$CreatorModel {
  factory CreatorModel({
    int id,
    String role,
    String description,
  }) = _CreatorModel;

  factory CreatorModel.fromJson(Map<String, dynamic> json) =>
      _$CreatorModelFromJson(json);
}
