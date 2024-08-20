// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'by_ids_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ByIdsParam {
  List<int> get ids => throw _privateConstructorUsedError;

  /// Create a copy of ByIdsParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ByIdsParamCopyWith<ByIdsParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ByIdsParamCopyWith<$Res> {
  factory $ByIdsParamCopyWith(
          ByIdsParam value, $Res Function(ByIdsParam) then) =
      _$ByIdsParamCopyWithImpl<$Res, ByIdsParam>;
  @useResult
  $Res call({List<int> ids});
}

/// @nodoc
class _$ByIdsParamCopyWithImpl<$Res, $Val extends ByIdsParam>
    implements $ByIdsParamCopyWith<$Res> {
  _$ByIdsParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ByIdsParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
  }) {
    return _then(_value.copyWith(
      ids: null == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ByIdsParamImplCopyWith<$Res>
    implements $ByIdsParamCopyWith<$Res> {
  factory _$$ByIdsParamImplCopyWith(
          _$ByIdsParamImpl value, $Res Function(_$ByIdsParamImpl) then) =
      __$$ByIdsParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> ids});
}

/// @nodoc
class __$$ByIdsParamImplCopyWithImpl<$Res>
    extends _$ByIdsParamCopyWithImpl<$Res, _$ByIdsParamImpl>
    implements _$$ByIdsParamImplCopyWith<$Res> {
  __$$ByIdsParamImplCopyWithImpl(
      _$ByIdsParamImpl _value, $Res Function(_$ByIdsParamImpl) _then)
      : super(_value, _then);

  /// Create a copy of ByIdsParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
  }) {
    return _then(_$ByIdsParamImpl(
      ids: null == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$ByIdsParamImpl extends _ByIdsParam {
  const _$ByIdsParamImpl({required final List<int> ids})
      : _ids = ids,
        super._();

  final List<int> _ids;
  @override
  List<int> get ids {
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ids);
  }

  @override
  String toString() {
    return 'ByIdsParam(ids: $ids)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ByIdsParamImpl &&
            const DeepCollectionEquality().equals(other._ids, _ids));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_ids));

  /// Create a copy of ByIdsParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ByIdsParamImplCopyWith<_$ByIdsParamImpl> get copyWith =>
      __$$ByIdsParamImplCopyWithImpl<_$ByIdsParamImpl>(this, _$identity);
}

abstract class _ByIdsParam extends ByIdsParam {
  const factory _ByIdsParam({required final List<int> ids}) = _$ByIdsParamImpl;
  const _ByIdsParam._() : super._();

  @override
  List<int> get ids;

  /// Create a copy of ByIdsParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ByIdsParamImplCopyWith<_$ByIdsParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
