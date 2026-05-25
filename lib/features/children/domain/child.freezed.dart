// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'child.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Child _$ChildFromJson(Map<String, dynamic> json) {
  return _Child.fromJson(json);
}

/// @nodoc
mixin _$Child {
  String get id => throw _privateConstructorUsedError;
  String get homeId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get dateOfBirth => throw _privateConstructorUsedError; // YYYY-MM-DD
  String get room => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  String? get createdById => throw _privateConstructorUsedError;
  String? get updatedById => throw _privateConstructorUsedError;
  bool get isSynced => throw _privateConstructorUsedError;

  /// Serializes this Child to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Child
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChildCopyWith<Child> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChildCopyWith<$Res> {
  factory $ChildCopyWith(Child value, $Res Function(Child) then) =
      _$ChildCopyWithImpl<$Res, Child>;
  @useResult
  $Res call({
    String id,
    String homeId,
    String name,
    String dateOfBirth,
    String room,
    String? photoUrl,
    String? notes,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? deletedAt,
    String? createdById,
    String? updatedById,
    bool isSynced,
  });
}

/// @nodoc
class _$ChildCopyWithImpl<$Res, $Val extends Child>
    implements $ChildCopyWith<$Res> {
  _$ChildCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Child
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? name = null,
    Object? dateOfBirth = null,
    Object? room = null,
    Object? photoUrl = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
    Object? createdById = freezed,
    Object? updatedById = freezed,
    Object? isSynced = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            homeId: null == homeId
                ? _value.homeId
                : homeId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            dateOfBirth: null == dateOfBirth
                ? _value.dateOfBirth
                : dateOfBirth // ignore: cast_nullable_to_non_nullable
                      as String,
            room: null == room
                ? _value.room
                : room // ignore: cast_nullable_to_non_nullable
                      as String,
            photoUrl: freezed == photoUrl
                ? _value.photoUrl
                : photoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            deletedAt: freezed == deletedAt
                ? _value.deletedAt
                : deletedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            createdById: freezed == createdById
                ? _value.createdById
                : createdById // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedById: freezed == updatedById
                ? _value.updatedById
                : updatedById // ignore: cast_nullable_to_non_nullable
                      as String?,
            isSynced: null == isSynced
                ? _value.isSynced
                : isSynced // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChildImplCopyWith<$Res> implements $ChildCopyWith<$Res> {
  factory _$$ChildImplCopyWith(
    _$ChildImpl value,
    $Res Function(_$ChildImpl) then,
  ) = __$$ChildImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String homeId,
    String name,
    String dateOfBirth,
    String room,
    String? photoUrl,
    String? notes,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? deletedAt,
    String? createdById,
    String? updatedById,
    bool isSynced,
  });
}

/// @nodoc
class __$$ChildImplCopyWithImpl<$Res>
    extends _$ChildCopyWithImpl<$Res, _$ChildImpl>
    implements _$$ChildImplCopyWith<$Res> {
  __$$ChildImplCopyWithImpl(
    _$ChildImpl _value,
    $Res Function(_$ChildImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Child
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? name = null,
    Object? dateOfBirth = null,
    Object? room = null,
    Object? photoUrl = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
    Object? createdById = freezed,
    Object? updatedById = freezed,
    Object? isSynced = null,
  }) {
    return _then(
      _$ChildImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        homeId: null == homeId
            ? _value.homeId
            : homeId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        dateOfBirth: null == dateOfBirth
            ? _value.dateOfBirth
            : dateOfBirth // ignore: cast_nullable_to_non_nullable
                  as String,
        room: null == room
            ? _value.room
            : room // ignore: cast_nullable_to_non_nullable
                  as String,
        photoUrl: freezed == photoUrl
            ? _value.photoUrl
            : photoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        deletedAt: freezed == deletedAt
            ? _value.deletedAt
            : deletedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdById: freezed == createdById
            ? _value.createdById
            : createdById // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedById: freezed == updatedById
            ? _value.updatedById
            : updatedById // ignore: cast_nullable_to_non_nullable
                  as String?,
        isSynced: null == isSynced
            ? _value.isSynced
            : isSynced // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChildImpl extends _Child {
  const _$ChildImpl({
    required this.id,
    required this.homeId,
    required this.name,
    required this.dateOfBirth,
    required this.room,
    this.photoUrl,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.createdById,
    this.updatedById,
    this.isSynced = false,
  }) : super._();

  factory _$ChildImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChildImplFromJson(json);

  @override
  final String id;
  @override
  final String homeId;
  @override
  final String name;
  @override
  final String dateOfBirth;
  // YYYY-MM-DD
  @override
  final String room;
  @override
  final String? photoUrl;
  @override
  final String? notes;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;
  @override
  final String? createdById;
  @override
  final String? updatedById;
  @override
  @JsonKey()
  final bool isSynced;

  @override
  String toString() {
    return 'Child(id: $id, homeId: $homeId, name: $name, dateOfBirth: $dateOfBirth, room: $room, photoUrl: $photoUrl, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, createdById: $createdById, updatedById: $updatedById, isSynced: $isSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChildImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.isSynced, isSynced) ||
                other.isSynced == isSynced));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    homeId,
    name,
    dateOfBirth,
    room,
    photoUrl,
    notes,
    createdAt,
    updatedAt,
    deletedAt,
    createdById,
    updatedById,
    isSynced,
  );

  /// Create a copy of Child
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChildImplCopyWith<_$ChildImpl> get copyWith =>
      __$$ChildImplCopyWithImpl<_$ChildImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChildImplToJson(this);
  }
}

abstract class _Child extends Child {
  const factory _Child({
    required final String id,
    required final String homeId,
    required final String name,
    required final String dateOfBirth,
    required final String room,
    final String? photoUrl,
    final String? notes,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final DateTime? deletedAt,
    final String? createdById,
    final String? updatedById,
    final bool isSynced,
  }) = _$ChildImpl;
  const _Child._() : super._();

  factory _Child.fromJson(Map<String, dynamic> json) = _$ChildImpl.fromJson;

  @override
  String get id;
  @override
  String get homeId;
  @override
  String get name;
  @override
  String get dateOfBirth; // YYYY-MM-DD
  @override
  String get room;
  @override
  String? get photoUrl;
  @override
  String? get notes;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get deletedAt;
  @override
  String? get createdById;
  @override
  String? get updatedById;
  @override
  bool get isSynced;

  /// Create a copy of Child
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChildImplCopyWith<_$ChildImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
