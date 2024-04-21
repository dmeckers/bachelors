// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register.view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterModel {
  JamBaseFormModel get emailModel => throw _privateConstructorUsedError;
  JamBaseFormModel get fullNameModel => throw _privateConstructorUsedError;
  JamBaseFormModel get passwordModel => throw _privateConstructorUsedError;
  JamBaseFormModel get confirmPasswordModel =>
      throw _privateConstructorUsedError;
  bool get agreeWithTerms => throw _privateConstructorUsedError;
  List<VibeModel> get vibes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterModelCopyWith<RegisterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterModelCopyWith<$Res> {
  factory $RegisterModelCopyWith(
          RegisterModel value, $Res Function(RegisterModel) then) =
      _$RegisterModelCopyWithImpl<$Res, RegisterModel>;
  @useResult
  $Res call(
      {JamBaseFormModel emailModel,
      JamBaseFormModel fullNameModel,
      JamBaseFormModel passwordModel,
      JamBaseFormModel confirmPasswordModel,
      bool agreeWithTerms,
      List<VibeModel> vibes});
}

/// @nodoc
class _$RegisterModelCopyWithImpl<$Res, $Val extends RegisterModel>
    implements $RegisterModelCopyWith<$Res> {
  _$RegisterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailModel = null,
    Object? fullNameModel = null,
    Object? passwordModel = null,
    Object? confirmPasswordModel = null,
    Object? agreeWithTerms = null,
    Object? vibes = null,
  }) {
    return _then(_value.copyWith(
      emailModel: null == emailModel
          ? _value.emailModel
          : emailModel // ignore: cast_nullable_to_non_nullable
              as JamBaseFormModel,
      fullNameModel: null == fullNameModel
          ? _value.fullNameModel
          : fullNameModel // ignore: cast_nullable_to_non_nullable
              as JamBaseFormModel,
      passwordModel: null == passwordModel
          ? _value.passwordModel
          : passwordModel // ignore: cast_nullable_to_non_nullable
              as JamBaseFormModel,
      confirmPasswordModel: null == confirmPasswordModel
          ? _value.confirmPasswordModel
          : confirmPasswordModel // ignore: cast_nullable_to_non_nullable
              as JamBaseFormModel,
      agreeWithTerms: null == agreeWithTerms
          ? _value.agreeWithTerms
          : agreeWithTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      vibes: null == vibes
          ? _value.vibes
          : vibes // ignore: cast_nullable_to_non_nullable
              as List<VibeModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterModelImplCopyWith<$Res>
    implements $RegisterModelCopyWith<$Res> {
  factory _$$RegisterModelImplCopyWith(
          _$RegisterModelImpl value, $Res Function(_$RegisterModelImpl) then) =
      __$$RegisterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {JamBaseFormModel emailModel,
      JamBaseFormModel fullNameModel,
      JamBaseFormModel passwordModel,
      JamBaseFormModel confirmPasswordModel,
      bool agreeWithTerms,
      List<VibeModel> vibes});
}

/// @nodoc
class __$$RegisterModelImplCopyWithImpl<$Res>
    extends _$RegisterModelCopyWithImpl<$Res, _$RegisterModelImpl>
    implements _$$RegisterModelImplCopyWith<$Res> {
  __$$RegisterModelImplCopyWithImpl(
      _$RegisterModelImpl _value, $Res Function(_$RegisterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailModel = null,
    Object? fullNameModel = null,
    Object? passwordModel = null,
    Object? confirmPasswordModel = null,
    Object? agreeWithTerms = null,
    Object? vibes = null,
  }) {
    return _then(_$RegisterModelImpl(
      emailModel: null == emailModel
          ? _value.emailModel
          : emailModel // ignore: cast_nullable_to_non_nullable
              as JamBaseFormModel,
      fullNameModel: null == fullNameModel
          ? _value.fullNameModel
          : fullNameModel // ignore: cast_nullable_to_non_nullable
              as JamBaseFormModel,
      passwordModel: null == passwordModel
          ? _value.passwordModel
          : passwordModel // ignore: cast_nullable_to_non_nullable
              as JamBaseFormModel,
      confirmPasswordModel: null == confirmPasswordModel
          ? _value.confirmPasswordModel
          : confirmPasswordModel // ignore: cast_nullable_to_non_nullable
              as JamBaseFormModel,
      agreeWithTerms: null == agreeWithTerms
          ? _value.agreeWithTerms
          : agreeWithTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      vibes: null == vibes
          ? _value._vibes
          : vibes // ignore: cast_nullable_to_non_nullable
              as List<VibeModel>,
    ));
  }
}

/// @nodoc

class _$RegisterModelImpl extends _RegisterModel {
  const _$RegisterModelImpl(
      {required this.emailModel,
      required this.fullNameModel,
      required this.passwordModel,
      required this.confirmPasswordModel,
      this.agreeWithTerms = false,
      required final List<VibeModel> vibes})
      : _vibes = vibes,
        super._();

  @override
  final JamBaseFormModel emailModel;
  @override
  final JamBaseFormModel fullNameModel;
  @override
  final JamBaseFormModel passwordModel;
  @override
  final JamBaseFormModel confirmPasswordModel;
  @override
  @JsonKey()
  final bool agreeWithTerms;
  final List<VibeModel> _vibes;
  @override
  List<VibeModel> get vibes {
    if (_vibes is EqualUnmodifiableListView) return _vibes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vibes);
  }

  @override
  String toString() {
    return 'RegisterModel(emailModel: $emailModel, fullNameModel: $fullNameModel, passwordModel: $passwordModel, confirmPasswordModel: $confirmPasswordModel, agreeWithTerms: $agreeWithTerms, vibes: $vibes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterModelImpl &&
            (identical(other.emailModel, emailModel) ||
                other.emailModel == emailModel) &&
            (identical(other.fullNameModel, fullNameModel) ||
                other.fullNameModel == fullNameModel) &&
            (identical(other.passwordModel, passwordModel) ||
                other.passwordModel == passwordModel) &&
            (identical(other.confirmPasswordModel, confirmPasswordModel) ||
                other.confirmPasswordModel == confirmPasswordModel) &&
            (identical(other.agreeWithTerms, agreeWithTerms) ||
                other.agreeWithTerms == agreeWithTerms) &&
            const DeepCollectionEquality().equals(other._vibes, _vibes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      emailModel,
      fullNameModel,
      passwordModel,
      confirmPasswordModel,
      agreeWithTerms,
      const DeepCollectionEquality().hash(_vibes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterModelImplCopyWith<_$RegisterModelImpl> get copyWith =>
      __$$RegisterModelImplCopyWithImpl<_$RegisterModelImpl>(this, _$identity);
}

abstract class _RegisterModel extends RegisterModel {
  const factory _RegisterModel(
      {required final JamBaseFormModel emailModel,
      required final JamBaseFormModel fullNameModel,
      required final JamBaseFormModel passwordModel,
      required final JamBaseFormModel confirmPasswordModel,
      final bool agreeWithTerms,
      required final List<VibeModel> vibes}) = _$RegisterModelImpl;
  const _RegisterModel._() : super._();

  @override
  JamBaseFormModel get emailModel;
  @override
  JamBaseFormModel get fullNameModel;
  @override
  JamBaseFormModel get passwordModel;
  @override
  JamBaseFormModel get confirmPasswordModel;
  @override
  bool get agreeWithTerms;
  @override
  List<VibeModel> get vibes;
  @override
  @JsonKey(ignore: true)
  _$$RegisterModelImplCopyWith<_$RegisterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
