import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:jam/domain/domain.dart';

part 'vibe.model.freezed.dart';
part 'vibe.model.g.dart';

@freezed
class VibeModel with _$VibeModel implements Jsonable<VibeModel> {
  @HiveType(typeId: 15)
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory VibeModel({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) required String? description,
    @HiveField(3) required String? iconUrl,
    @HiveField(4) @Default([]) List<VibeModel>? childVibes,
    @HiveField(5) @Default([]) List<VibeModel>? parentVibes,
  }) = _VibeModel;

  const VibeModel._();

  factory VibeModel.fromJson(Map<String, dynamic> json) =>
      _$VibeModelFromJson(json);

  @override
  VibeModel fromJson(Map<String, dynamic> json) => VibeModel.fromJson(json);

  // static identifier for go router codec converter
  static const jsonClassId = 'VibeModel';

  @override
  String getJsonClassId() => jsonClassId;
}
