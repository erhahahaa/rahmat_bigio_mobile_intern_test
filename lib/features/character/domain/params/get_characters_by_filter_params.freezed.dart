// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_characters_by_filter_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetCharactersByFilterParams {
  String? get name => throw _privateConstructorUsedError;
  CharacterStatus? get status => throw _privateConstructorUsedError;
  String? get species => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  CharacterGender? get gender => throw _privateConstructorUsedError;

  /// Create a copy of GetCharactersByFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetCharactersByFilterParamsCopyWith<GetCharactersByFilterParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCharactersByFilterParamsCopyWith<$Res> {
  factory $GetCharactersByFilterParamsCopyWith(
          GetCharactersByFilterParams value,
          $Res Function(GetCharactersByFilterParams) then) =
      _$GetCharactersByFilterParamsCopyWithImpl<$Res,
          GetCharactersByFilterParams>;
  @useResult
  $Res call(
      {String? name,
      CharacterStatus? status,
      String? species,
      String? type,
      CharacterGender? gender});
}

/// @nodoc
class _$GetCharactersByFilterParamsCopyWithImpl<$Res,
        $Val extends GetCharactersByFilterParams>
    implements $GetCharactersByFilterParamsCopyWith<$Res> {
  _$GetCharactersByFilterParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetCharactersByFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? status = freezed,
    Object? species = freezed,
    Object? type = freezed,
    Object? gender = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CharacterStatus?,
      species: freezed == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as CharacterGender?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetCharactersByFilterParamsImplCopyWith<$Res>
    implements $GetCharactersByFilterParamsCopyWith<$Res> {
  factory _$$GetCharactersByFilterParamsImplCopyWith(
          _$GetCharactersByFilterParamsImpl value,
          $Res Function(_$GetCharactersByFilterParamsImpl) then) =
      __$$GetCharactersByFilterParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      CharacterStatus? status,
      String? species,
      String? type,
      CharacterGender? gender});
}

/// @nodoc
class __$$GetCharactersByFilterParamsImplCopyWithImpl<$Res>
    extends _$GetCharactersByFilterParamsCopyWithImpl<$Res,
        _$GetCharactersByFilterParamsImpl>
    implements _$$GetCharactersByFilterParamsImplCopyWith<$Res> {
  __$$GetCharactersByFilterParamsImplCopyWithImpl(
      _$GetCharactersByFilterParamsImpl _value,
      $Res Function(_$GetCharactersByFilterParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetCharactersByFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? status = freezed,
    Object? species = freezed,
    Object? type = freezed,
    Object? gender = freezed,
  }) {
    return _then(_$GetCharactersByFilterParamsImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CharacterStatus?,
      species: freezed == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as CharacterGender?,
    ));
  }
}

/// @nodoc

class _$GetCharactersByFilterParamsImpl extends _GetCharactersByFilterParams {
  const _$GetCharactersByFilterParamsImpl(
      {this.name, this.status, this.species, this.type, this.gender})
      : super._();

  @override
  final String? name;
  @override
  final CharacterStatus? status;
  @override
  final String? species;
  @override
  final String? type;
  @override
  final CharacterGender? gender;

  @override
  String toString() {
    return 'GetCharactersByFilterParams(name: $name, status: $status, species: $species, type: $type, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCharactersByFilterParamsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, status, species, type, gender);

  /// Create a copy of GetCharactersByFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCharactersByFilterParamsImplCopyWith<_$GetCharactersByFilterParamsImpl>
      get copyWith => __$$GetCharactersByFilterParamsImplCopyWithImpl<
          _$GetCharactersByFilterParamsImpl>(this, _$identity);
}

abstract class _GetCharactersByFilterParams
    extends GetCharactersByFilterParams {
  const factory _GetCharactersByFilterParams(
      {final String? name,
      final CharacterStatus? status,
      final String? species,
      final String? type,
      final CharacterGender? gender}) = _$GetCharactersByFilterParamsImpl;
  const _GetCharactersByFilterParams._() : super._();

  @override
  String? get name;
  @override
  CharacterStatus? get status;
  @override
  String? get species;
  @override
  String? get type;
  @override
  CharacterGender? get gender;

  /// Create a copy of GetCharactersByFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetCharactersByFilterParamsImplCopyWith<_$GetCharactersByFilterParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
