// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) {
  return _CharacterModel.fromJson(json);
}

/// @nodoc
mixin _$CharacterModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  CharacterStatus get status => throw _privateConstructorUsedError;
  String get species => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  CharacterGender get gender => throw _privateConstructorUsedError;
  CharacterOriginModel get origin => throw _privateConstructorUsedError;
  CharacterLocationModel get location => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  List<String> get episode => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;

  /// Serializes this CharacterModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CharacterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharacterModelCopyWith<CharacterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterModelCopyWith<$Res> {
  factory $CharacterModelCopyWith(
          CharacterModel value, $Res Function(CharacterModel) then) =
      _$CharacterModelCopyWithImpl<$Res, CharacterModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      CharacterStatus status,
      String species,
      String type,
      CharacterGender gender,
      CharacterOriginModel origin,
      CharacterLocationModel location,
      String image,
      List<String> episode,
      String url,
      DateTime created});

  $CharacterOriginModelCopyWith<$Res> get origin;
  $CharacterLocationModelCopyWith<$Res> get location;
}

/// @nodoc
class _$CharacterModelCopyWithImpl<$Res, $Val extends CharacterModel>
    implements $CharacterModelCopyWith<$Res> {
  _$CharacterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CharacterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? species = null,
    Object? type = null,
    Object? gender = null,
    Object? origin = null,
    Object? location = null,
    Object? image = null,
    Object? episode = null,
    Object? url = null,
    Object? created = null,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CharacterStatus,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as CharacterGender,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as CharacterOriginModel,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as CharacterLocationModel,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      episode: null == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as List<String>,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of CharacterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacterOriginModelCopyWith<$Res> get origin {
    return $CharacterOriginModelCopyWith<$Res>(_value.origin, (value) {
      return _then(_value.copyWith(origin: value) as $Val);
    });
  }

  /// Create a copy of CharacterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacterLocationModelCopyWith<$Res> get location {
    return $CharacterLocationModelCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CharacterModelImplCopyWith<$Res>
    implements $CharacterModelCopyWith<$Res> {
  factory _$$CharacterModelImplCopyWith(_$CharacterModelImpl value,
          $Res Function(_$CharacterModelImpl) then) =
      __$$CharacterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      CharacterStatus status,
      String species,
      String type,
      CharacterGender gender,
      CharacterOriginModel origin,
      CharacterLocationModel location,
      String image,
      List<String> episode,
      String url,
      DateTime created});

  @override
  $CharacterOriginModelCopyWith<$Res> get origin;
  @override
  $CharacterLocationModelCopyWith<$Res> get location;
}

/// @nodoc
class __$$CharacterModelImplCopyWithImpl<$Res>
    extends _$CharacterModelCopyWithImpl<$Res, _$CharacterModelImpl>
    implements _$$CharacterModelImplCopyWith<$Res> {
  __$$CharacterModelImplCopyWithImpl(
      _$CharacterModelImpl _value, $Res Function(_$CharacterModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CharacterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? species = null,
    Object? type = null,
    Object? gender = null,
    Object? origin = null,
    Object? location = null,
    Object? image = null,
    Object? episode = null,
    Object? url = null,
    Object? created = null,
  }) {
    return _then(_$CharacterModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CharacterStatus,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as CharacterGender,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as CharacterOriginModel,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as CharacterLocationModel,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      episode: null == episode
          ? _value._episode
          : episode // ignore: cast_nullable_to_non_nullable
              as List<String>,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterModelImpl extends _CharacterModel {
  const _$CharacterModelImpl(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.image,
      required final List<String> episode,
      required this.url,
      required this.created})
      : _episode = episode,
        super._();

  factory _$CharacterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final CharacterStatus status;
  @override
  final String species;
  @override
  final String type;
  @override
  final CharacterGender gender;
  @override
  final CharacterOriginModel origin;
  @override
  final CharacterLocationModel location;
  @override
  final String image;
  final List<String> _episode;
  @override
  List<String> get episode {
    if (_episode is EqualUnmodifiableListView) return _episode;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_episode);
  }

  @override
  final String url;
  @override
  final DateTime created;

  @override
  String toString() {
    return 'CharacterModel(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episode: $episode, url: $url, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._episode, _episode) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      status,
      species,
      type,
      gender,
      origin,
      location,
      image,
      const DeepCollectionEquality().hash(_episode),
      url,
      created);

  /// Create a copy of CharacterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterModelImplCopyWith<_$CharacterModelImpl> get copyWith =>
      __$$CharacterModelImplCopyWithImpl<_$CharacterModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterModelImplToJson(
      this,
    );
  }
}

abstract class _CharacterModel extends CharacterModel {
  const factory _CharacterModel(
      {required final int id,
      required final String name,
      required final CharacterStatus status,
      required final String species,
      required final String type,
      required final CharacterGender gender,
      required final CharacterOriginModel origin,
      required final CharacterLocationModel location,
      required final String image,
      required final List<String> episode,
      required final String url,
      required final DateTime created}) = _$CharacterModelImpl;
  const _CharacterModel._() : super._();

  factory _CharacterModel.fromJson(Map<String, dynamic> json) =
      _$CharacterModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  CharacterStatus get status;
  @override
  String get species;
  @override
  String get type;
  @override
  CharacterGender get gender;
  @override
  CharacterOriginModel get origin;
  @override
  CharacterLocationModel get location;
  @override
  String get image;
  @override
  List<String> get episode;
  @override
  String get url;
  @override
  DateTime get created;

  /// Create a copy of CharacterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterModelImplCopyWith<_$CharacterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CharacterOriginModel _$CharacterOriginModelFromJson(Map<String, dynamic> json) {
  return _CharacterOriginModel.fromJson(json);
}

/// @nodoc
mixin _$CharacterOriginModel {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this CharacterOriginModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CharacterOriginModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharacterOriginModelCopyWith<CharacterOriginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterOriginModelCopyWith<$Res> {
  factory $CharacterOriginModelCopyWith(CharacterOriginModel value,
          $Res Function(CharacterOriginModel) then) =
      _$CharacterOriginModelCopyWithImpl<$Res, CharacterOriginModel>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$CharacterOriginModelCopyWithImpl<$Res,
        $Val extends CharacterOriginModel>
    implements $CharacterOriginModelCopyWith<$Res> {
  _$CharacterOriginModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CharacterOriginModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CharacterOriginModelImplCopyWith<$Res>
    implements $CharacterOriginModelCopyWith<$Res> {
  factory _$$CharacterOriginModelImplCopyWith(_$CharacterOriginModelImpl value,
          $Res Function(_$CharacterOriginModelImpl) then) =
      __$$CharacterOriginModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$CharacterOriginModelImplCopyWithImpl<$Res>
    extends _$CharacterOriginModelCopyWithImpl<$Res, _$CharacterOriginModelImpl>
    implements _$$CharacterOriginModelImplCopyWith<$Res> {
  __$$CharacterOriginModelImplCopyWithImpl(_$CharacterOriginModelImpl _value,
      $Res Function(_$CharacterOriginModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CharacterOriginModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$CharacterOriginModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterOriginModelImpl extends _CharacterOriginModel {
  const _$CharacterOriginModelImpl({required this.name, required this.url})
      : super._();

  factory _$CharacterOriginModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterOriginModelImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'CharacterOriginModel(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterOriginModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of CharacterOriginModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterOriginModelImplCopyWith<_$CharacterOriginModelImpl>
      get copyWith =>
          __$$CharacterOriginModelImplCopyWithImpl<_$CharacterOriginModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterOriginModelImplToJson(
      this,
    );
  }
}

abstract class _CharacterOriginModel extends CharacterOriginModel {
  const factory _CharacterOriginModel(
      {required final String name,
      required final String url}) = _$CharacterOriginModelImpl;
  const _CharacterOriginModel._() : super._();

  factory _CharacterOriginModel.fromJson(Map<String, dynamic> json) =
      _$CharacterOriginModelImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of CharacterOriginModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterOriginModelImplCopyWith<_$CharacterOriginModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CharacterLocationModel _$CharacterLocationModelFromJson(
    Map<String, dynamic> json) {
  return _CharacterLocationModel.fromJson(json);
}

/// @nodoc
mixin _$CharacterLocationModel {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this CharacterLocationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CharacterLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharacterLocationModelCopyWith<CharacterLocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterLocationModelCopyWith<$Res> {
  factory $CharacterLocationModelCopyWith(CharacterLocationModel value,
          $Res Function(CharacterLocationModel) then) =
      _$CharacterLocationModelCopyWithImpl<$Res, CharacterLocationModel>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$CharacterLocationModelCopyWithImpl<$Res,
        $Val extends CharacterLocationModel>
    implements $CharacterLocationModelCopyWith<$Res> {
  _$CharacterLocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CharacterLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CharacterLocationModelImplCopyWith<$Res>
    implements $CharacterLocationModelCopyWith<$Res> {
  factory _$$CharacterLocationModelImplCopyWith(
          _$CharacterLocationModelImpl value,
          $Res Function(_$CharacterLocationModelImpl) then) =
      __$$CharacterLocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$CharacterLocationModelImplCopyWithImpl<$Res>
    extends _$CharacterLocationModelCopyWithImpl<$Res,
        _$CharacterLocationModelImpl>
    implements _$$CharacterLocationModelImplCopyWith<$Res> {
  __$$CharacterLocationModelImplCopyWithImpl(
      _$CharacterLocationModelImpl _value,
      $Res Function(_$CharacterLocationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CharacterLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$CharacterLocationModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterLocationModelImpl extends _CharacterLocationModel {
  const _$CharacterLocationModelImpl({required this.name, required this.url})
      : super._();

  factory _$CharacterLocationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterLocationModelImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'CharacterLocationModel(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterLocationModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of CharacterLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterLocationModelImplCopyWith<_$CharacterLocationModelImpl>
      get copyWith => __$$CharacterLocationModelImplCopyWithImpl<
          _$CharacterLocationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterLocationModelImplToJson(
      this,
    );
  }
}

abstract class _CharacterLocationModel extends CharacterLocationModel {
  const factory _CharacterLocationModel(
      {required final String name,
      required final String url}) = _$CharacterLocationModelImpl;
  const _CharacterLocationModel._() : super._();

  factory _CharacterLocationModel.fromJson(Map<String, dynamic> json) =
      _$CharacterLocationModelImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of CharacterLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterLocationModelImplCopyWith<_$CharacterLocationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
