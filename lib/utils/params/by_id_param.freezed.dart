// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'by_id_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ByIdParam {
  int get id => throw _privateConstructorUsedError;

  /// Create a copy of ByIdParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ByIdParamCopyWith<ByIdParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ByIdParamCopyWith<$Res> {
  factory $ByIdParamCopyWith(ByIdParam value, $Res Function(ByIdParam) then) =
      _$ByIdParamCopyWithImpl<$Res, ByIdParam>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$ByIdParamCopyWithImpl<$Res, $Val extends ByIdParam>
    implements $ByIdParamCopyWith<$Res> {
  _$ByIdParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ByIdParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ByIdParamImplCopyWith<$Res>
    implements $ByIdParamCopyWith<$Res> {
  factory _$$ByIdParamImplCopyWith(
          _$ByIdParamImpl value, $Res Function(_$ByIdParamImpl) then) =
      __$$ByIdParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$ByIdParamImplCopyWithImpl<$Res>
    extends _$ByIdParamCopyWithImpl<$Res, _$ByIdParamImpl>
    implements _$$ByIdParamImplCopyWith<$Res> {
  __$$ByIdParamImplCopyWithImpl(
      _$ByIdParamImpl _value, $Res Function(_$ByIdParamImpl) _then)
      : super(_value, _then);

  /// Create a copy of ByIdParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ByIdParamImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ByIdParamImpl implements _ByIdParam {
  const _$ByIdParamImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'ByIdParam(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ByIdParamImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of ByIdParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ByIdParamImplCopyWith<_$ByIdParamImpl> get copyWith =>
      __$$ByIdParamImplCopyWithImpl<_$ByIdParamImpl>(this, _$identity);
}

abstract class _ByIdParam implements ByIdParam {
  const factory _ByIdParam({required final int id}) = _$ByIdParamImpl;

  @override
  int get id;

  /// Create a copy of ByIdParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ByIdParamImplCopyWith<_$ByIdParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
