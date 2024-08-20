// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_episodes_by_filter_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetEpisodesByFilterParams {
  String? get name => throw _privateConstructorUsedError;
  String? get episode => throw _privateConstructorUsedError;

  /// Create a copy of GetEpisodesByFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetEpisodesByFilterParamsCopyWith<GetEpisodesByFilterParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetEpisodesByFilterParamsCopyWith<$Res> {
  factory $GetEpisodesByFilterParamsCopyWith(GetEpisodesByFilterParams value,
          $Res Function(GetEpisodesByFilterParams) then) =
      _$GetEpisodesByFilterParamsCopyWithImpl<$Res, GetEpisodesByFilterParams>;
  @useResult
  $Res call({String? name, String? episode});
}

/// @nodoc
class _$GetEpisodesByFilterParamsCopyWithImpl<$Res,
        $Val extends GetEpisodesByFilterParams>
    implements $GetEpisodesByFilterParamsCopyWith<$Res> {
  _$GetEpisodesByFilterParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetEpisodesByFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? episode = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      episode: freezed == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetEpisodesByFilterParamsImplCopyWith<$Res>
    implements $GetEpisodesByFilterParamsCopyWith<$Res> {
  factory _$$GetEpisodesByFilterParamsImplCopyWith(
          _$GetEpisodesByFilterParamsImpl value,
          $Res Function(_$GetEpisodesByFilterParamsImpl) then) =
      __$$GetEpisodesByFilterParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? episode});
}

/// @nodoc
class __$$GetEpisodesByFilterParamsImplCopyWithImpl<$Res>
    extends _$GetEpisodesByFilterParamsCopyWithImpl<$Res,
        _$GetEpisodesByFilterParamsImpl>
    implements _$$GetEpisodesByFilterParamsImplCopyWith<$Res> {
  __$$GetEpisodesByFilterParamsImplCopyWithImpl(
      _$GetEpisodesByFilterParamsImpl _value,
      $Res Function(_$GetEpisodesByFilterParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetEpisodesByFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? episode = freezed,
  }) {
    return _then(_$GetEpisodesByFilterParamsImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      episode: freezed == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GetEpisodesByFilterParamsImpl extends _GetEpisodesByFilterParams {
  const _$GetEpisodesByFilterParamsImpl({this.name, this.episode}) : super._();

  @override
  final String? name;
  @override
  final String? episode;

  @override
  String toString() {
    return 'GetEpisodesByFilterParams(name: $name, episode: $episode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetEpisodesByFilterParamsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.episode, episode) || other.episode == episode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, episode);

  /// Create a copy of GetEpisodesByFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetEpisodesByFilterParamsImplCopyWith<_$GetEpisodesByFilterParamsImpl>
      get copyWith => __$$GetEpisodesByFilterParamsImplCopyWithImpl<
          _$GetEpisodesByFilterParamsImpl>(this, _$identity);
}

abstract class _GetEpisodesByFilterParams extends GetEpisodesByFilterParams {
  const factory _GetEpisodesByFilterParams(
      {final String? name,
      final String? episode}) = _$GetEpisodesByFilterParamsImpl;
  const _GetEpisodesByFilterParams._() : super._();

  @override
  String? get name;
  @override
  String? get episode;

  /// Create a copy of GetEpisodesByFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetEpisodesByFilterParamsImplCopyWith<_$GetEpisodesByFilterParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
