// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommunityModel _$CommunityModelFromJson(Map<String, dynamic> json) {
  return _CommunityModel.fromJson(json);
}

/// @nodoc
mixin _$CommunityModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isPublic => throw _privateConstructorUsedError;
  JUser get owner => throw _privateConstructorUsedError;
  List<JUser> get members => throw _privateConstructorUsedError;
  List<JUser> get admins => throw _privateConstructorUsedError;
  List<JUser> get blocked => throw _privateConstructorUsedError;
  List<ChatModel> get chats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommunityModelCopyWith<CommunityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityModelCopyWith<$Res> {
  factory $CommunityModelCopyWith(
          CommunityModel value, $Res Function(CommunityModel) then) =
      _$CommunityModelCopyWithImpl<$Res, CommunityModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      bool isPublic,
      JUser owner,
      List<JUser> members,
      List<JUser> admins,
      List<JUser> blocked,
      List<ChatModel> chats});
}

/// @nodoc
class _$CommunityModelCopyWithImpl<$Res, $Val extends CommunityModel>
    implements $CommunityModelCopyWith<$Res> {
  _$CommunityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? isPublic = null,
    Object? owner = freezed,
    Object? members = null,
    Object? admins = null,
    Object? blocked = null,
    Object? chats = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as JUser,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<JUser>,
      admins: null == admins
          ? _value.admins
          : admins // ignore: cast_nullable_to_non_nullable
              as List<JUser>,
      blocked: null == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as List<JUser>,
      chats: null == chats
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommunityModelImplCopyWith<$Res>
    implements $CommunityModelCopyWith<$Res> {
  factory _$$CommunityModelImplCopyWith(_$CommunityModelImpl value,
          $Res Function(_$CommunityModelImpl) then) =
      __$$CommunityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      bool isPublic,
      JUser owner,
      List<JUser> members,
      List<JUser> admins,
      List<JUser> blocked,
      List<ChatModel> chats});
}

/// @nodoc
class __$$CommunityModelImplCopyWithImpl<$Res>
    extends _$CommunityModelCopyWithImpl<$Res, _$CommunityModelImpl>
    implements _$$CommunityModelImplCopyWith<$Res> {
  __$$CommunityModelImplCopyWithImpl(
      _$CommunityModelImpl _value, $Res Function(_$CommunityModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? isPublic = null,
    Object? owner = freezed,
    Object? members = null,
    Object? admins = null,
    Object? blocked = null,
    Object? chats = null,
  }) {
    return _then(_$CommunityModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as JUser,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<JUser>,
      admins: null == admins
          ? _value._admins
          : admins // ignore: cast_nullable_to_non_nullable
              as List<JUser>,
      blocked: null == blocked
          ? _value._blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as List<JUser>,
      chats: null == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommunityModelImpl implements _CommunityModel {
  const _$CommunityModelImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.isPublic,
      required this.owner,
      final List<JUser> members = const [],
      final List<JUser> admins = const [],
      final List<JUser> blocked = const [],
      final List<ChatModel> chats = const []})
      : _members = members,
        _admins = admins,
        _blocked = blocked,
        _chats = chats;

  factory _$CommunityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunityModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final bool isPublic;
  @override
  final JUser owner;
  final List<JUser> _members;
  @override
  @JsonKey()
  List<JUser> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  final List<JUser> _admins;
  @override
  @JsonKey()
  List<JUser> get admins {
    if (_admins is EqualUnmodifiableListView) return _admins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_admins);
  }

  final List<JUser> _blocked;
  @override
  @JsonKey()
  List<JUser> get blocked {
    if (_blocked is EqualUnmodifiableListView) return _blocked;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blocked);
  }

  final List<ChatModel> _chats;
  @override
  @JsonKey()
  List<ChatModel> get chats {
    if (_chats is EqualUnmodifiableListView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chats);
  }

  @override
  String toString() {
    return 'CommunityModel(id: $id, name: $name, description: $description, isPublic: $isPublic, owner: $owner, members: $members, admins: $admins, blocked: $blocked, chats: $chats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            const DeepCollectionEquality().equals(other.owner, owner) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality().equals(other._admins, _admins) &&
            const DeepCollectionEquality().equals(other._blocked, _blocked) &&
            const DeepCollectionEquality().equals(other._chats, _chats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      isPublic,
      const DeepCollectionEquality().hash(owner),
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(_admins),
      const DeepCollectionEquality().hash(_blocked),
      const DeepCollectionEquality().hash(_chats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityModelImplCopyWith<_$CommunityModelImpl> get copyWith =>
      __$$CommunityModelImplCopyWithImpl<_$CommunityModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunityModelImplToJson(
      this,
    );
  }
}

abstract class _CommunityModel implements CommunityModel {
  const factory _CommunityModel(
      {required final int id,
      required final String name,
      required final String description,
      required final bool isPublic,
      required final JUser owner,
      final List<JUser> members,
      final List<JUser> admins,
      final List<JUser> blocked,
      final List<ChatModel> chats}) = _$CommunityModelImpl;

  factory _CommunityModel.fromJson(Map<String, dynamic> json) =
      _$CommunityModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  bool get isPublic;
  @override
  JUser get owner;
  @override
  List<JUser> get members;
  @override
  List<JUser> get admins;
  @override
  List<JUser> get blocked;
  @override
  List<ChatModel> get chats;
  @override
  @JsonKey(ignore: true)
  _$$CommunityModelImplCopyWith<_$CommunityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
