// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_locations_by_filter_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetLocationsByFilterParams {
  String? get name => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get dimension => throw _privateConstructorUsedError;

  /// Create a copy of GetLocationsByFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetLocationsByFilterParamsCopyWith<GetLocationsByFilterParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetLocationsByFilterParamsCopyWith<$Res> {
  factory $GetLocationsByFilterParamsCopyWith(GetLocationsByFilterParams value,
          $Res Function(GetLocationsByFilterParams) then) =
      _$GetLocationsByFilterParamsCopyWithImpl<$Res,
          GetLocationsByFilterParams>;
  @useResult
  $Res call({String? name, String? type, String? dimension});
}

/// @nodoc
class _$GetLocationsByFilterParamsCopyWithImpl<$Res,
        $Val extends GetLocationsByFilterParams>
    implements $GetLocationsByFilterParamsCopyWith<$Res> {
  _$GetLocationsByFilterParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetLocationsByFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? type = freezed,
    Object? dimension = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      dimension: freezed == dimension
          ? _value.dimension
          : dimension // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetLocationsByFilterParamsImplCopyWith<$Res>
    implements $GetLocationsByFilterParamsCopyWith<$Res> {
  factory _$$GetLocationsByFilterParamsImplCopyWith(
          _$GetLocationsByFilterParamsImpl value,
          $Res Function(_$GetLocationsByFilterParamsImpl) then) =
      __$$GetLocationsByFilterParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? type, String? dimension});
}

/// @nodoc
class __$$GetLocationsByFilterParamsImplCopyWithImpl<$Res>
    extends _$GetLocationsByFilterParamsCopyWithImpl<$Res,
        _$GetLocationsByFilterParamsImpl>
    implements _$$GetLocationsByFilterParamsImplCopyWith<$Res> {
  __$$GetLocationsByFilterParamsImplCopyWithImpl(
      _$GetLocationsByFilterParamsImpl _value,
      $Res Function(_$GetLocationsByFilterParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetLocationsByFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? type = freezed,
    Object? dimension = freezed,
  }) {
    return _then(_$GetLocationsByFilterParamsImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      dimension: freezed == dimension
          ? _value.dimension
          : dimension // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GetLocationsByFilterParamsImpl extends _GetLocationsByFilterParams {
  const _$GetLocationsByFilterParamsImpl({this.name, this.type, this.dimension})
      : super._();

  @override
  final String? name;
  @override
  final String? type;
  @override
  final String? dimension;

  @override
  String toString() {
    return 'GetLocationsByFilterParams(name: $name, type: $type, dimension: $dimension)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLocationsByFilterParamsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.dimension, dimension) ||
                other.dimension == dimension));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, type, dimension);

  /// Create a copy of GetLocationsByFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetLocationsByFilterParamsImplCopyWith<_$GetLocationsByFilterParamsImpl>
      get copyWith => __$$GetLocationsByFilterParamsImplCopyWithImpl<
          _$GetLocationsByFilterParamsImpl>(this, _$identity);
}

abstract class _GetLocationsByFilterParams extends GetLocationsByFilterParams {
  const factory _GetLocationsByFilterParams(
      {final String? name,
      final String? type,
      final String? dimension}) = _$GetLocationsByFilterParamsImpl;
  const _GetLocationsByFilterParams._() : super._();

  @override
  String? get name;
  @override
  String? get type;
  @override
  String? get dimension;

  /// Create a copy of GetLocationsByFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetLocationsByFilterParamsImplCopyWith<_$GetLocationsByFilterParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
