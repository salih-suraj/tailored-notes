// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DailyNote _$DailyNoteFromJson(Map<String, dynamic> json) {
  return _DailyNote.fromJson(json);
}

/// @nodoc
mixin _$DailyNote {
  String get id => throw _privateConstructorUsedError;
  String get homeId => throw _privateConstructorUsedError;
  String get childId => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String get authorName => throw _privateConstructorUsedError;
  ShiftType get shift => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get occurredAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  String? get updatedById => throw _privateConstructorUsedError;
  String? get updatedByName => throw _privateConstructorUsedError;
  bool get isSynced => throw _privateConstructorUsedError;

  /// Serializes this DailyNote to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyNoteCopyWith<DailyNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyNoteCopyWith<$Res> {
  factory $DailyNoteCopyWith(DailyNote value, $Res Function(DailyNote) then) =
      _$DailyNoteCopyWithImpl<$Res, DailyNote>;
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    String authorId,
    String authorName,
    ShiftType shift,
    String content,
    DateTime occurredAt,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? deletedAt,
    String? updatedById,
    String? updatedByName,
    bool isSynced,
  });
}

/// @nodoc
class _$DailyNoteCopyWithImpl<$Res, $Val extends DailyNote>
    implements $DailyNoteCopyWith<$Res> {
  _$DailyNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? authorId = null,
    Object? authorName = null,
    Object? shift = null,
    Object? content = null,
    Object? occurredAt = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
    Object? updatedById = freezed,
    Object? updatedByName = freezed,
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
            childId: null == childId
                ? _value.childId
                : childId // ignore: cast_nullable_to_non_nullable
                      as String,
            authorId: null == authorId
                ? _value.authorId
                : authorId // ignore: cast_nullable_to_non_nullable
                      as String,
            authorName: null == authorName
                ? _value.authorName
                : authorName // ignore: cast_nullable_to_non_nullable
                      as String,
            shift: null == shift
                ? _value.shift
                : shift // ignore: cast_nullable_to_non_nullable
                      as ShiftType,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            occurredAt: null == occurredAt
                ? _value.occurredAt
                : occurredAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
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
            updatedById: freezed == updatedById
                ? _value.updatedById
                : updatedById // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedByName: freezed == updatedByName
                ? _value.updatedByName
                : updatedByName // ignore: cast_nullable_to_non_nullable
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
abstract class _$$DailyNoteImplCopyWith<$Res>
    implements $DailyNoteCopyWith<$Res> {
  factory _$$DailyNoteImplCopyWith(
    _$DailyNoteImpl value,
    $Res Function(_$DailyNoteImpl) then,
  ) = __$$DailyNoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    String authorId,
    String authorName,
    ShiftType shift,
    String content,
    DateTime occurredAt,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? deletedAt,
    String? updatedById,
    String? updatedByName,
    bool isSynced,
  });
}

/// @nodoc
class __$$DailyNoteImplCopyWithImpl<$Res>
    extends _$DailyNoteCopyWithImpl<$Res, _$DailyNoteImpl>
    implements _$$DailyNoteImplCopyWith<$Res> {
  __$$DailyNoteImplCopyWithImpl(
    _$DailyNoteImpl _value,
    $Res Function(_$DailyNoteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? authorId = null,
    Object? authorName = null,
    Object? shift = null,
    Object? content = null,
    Object? occurredAt = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
    Object? updatedById = freezed,
    Object? updatedByName = freezed,
    Object? isSynced = null,
  }) {
    return _then(
      _$DailyNoteImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        homeId: null == homeId
            ? _value.homeId
            : homeId // ignore: cast_nullable_to_non_nullable
                  as String,
        childId: null == childId
            ? _value.childId
            : childId // ignore: cast_nullable_to_non_nullable
                  as String,
        authorId: null == authorId
            ? _value.authorId
            : authorId // ignore: cast_nullable_to_non_nullable
                  as String,
        authorName: null == authorName
            ? _value.authorName
            : authorName // ignore: cast_nullable_to_non_nullable
                  as String,
        shift: null == shift
            ? _value.shift
            : shift // ignore: cast_nullable_to_non_nullable
                  as ShiftType,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        occurredAt: null == occurredAt
            ? _value.occurredAt
            : occurredAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
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
        updatedById: freezed == updatedById
            ? _value.updatedById
            : updatedById // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedByName: freezed == updatedByName
            ? _value.updatedByName
            : updatedByName // ignore: cast_nullable_to_non_nullable
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
class _$DailyNoteImpl implements _DailyNote {
  const _$DailyNoteImpl({
    required this.id,
    required this.homeId,
    required this.childId,
    required this.authorId,
    required this.authorName,
    required this.shift,
    required this.content,
    required this.occurredAt,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.updatedById,
    this.updatedByName,
    this.isSynced = false,
  });

  factory _$DailyNoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyNoteImplFromJson(json);

  @override
  final String id;
  @override
  final String homeId;
  @override
  final String childId;
  @override
  final String authorId;
  @override
  final String authorName;
  @override
  final ShiftType shift;
  @override
  final String content;
  @override
  final DateTime occurredAt;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;
  @override
  final String? updatedById;
  @override
  final String? updatedByName;
  @override
  @JsonKey()
  final bool isSynced;

  @override
  String toString() {
    return 'DailyNote(id: $id, homeId: $homeId, childId: $childId, authorId: $authorId, authorName: $authorName, shift: $shift, content: $content, occurredAt: $occurredAt, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, updatedById: $updatedById, updatedByName: $updatedByName, isSynced: $isSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyNoteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.childId, childId) || other.childId == childId) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.occurredAt, occurredAt) ||
                other.occurredAt == occurredAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.updatedByName, updatedByName) ||
                other.updatedByName == updatedByName) &&
            (identical(other.isSynced, isSynced) ||
                other.isSynced == isSynced));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    homeId,
    childId,
    authorId,
    authorName,
    shift,
    content,
    occurredAt,
    createdAt,
    updatedAt,
    deletedAt,
    updatedById,
    updatedByName,
    isSynced,
  );

  /// Create a copy of DailyNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyNoteImplCopyWith<_$DailyNoteImpl> get copyWith =>
      __$$DailyNoteImplCopyWithImpl<_$DailyNoteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyNoteImplToJson(this);
  }
}

abstract class _DailyNote implements DailyNote {
  const factory _DailyNote({
    required final String id,
    required final String homeId,
    required final String childId,
    required final String authorId,
    required final String authorName,
    required final ShiftType shift,
    required final String content,
    required final DateTime occurredAt,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final DateTime? deletedAt,
    final String? updatedById,
    final String? updatedByName,
    final bool isSynced,
  }) = _$DailyNoteImpl;

  factory _DailyNote.fromJson(Map<String, dynamic> json) =
      _$DailyNoteImpl.fromJson;

  @override
  String get id;
  @override
  String get homeId;
  @override
  String get childId;
  @override
  String get authorId;
  @override
  String get authorName;
  @override
  ShiftType get shift;
  @override
  String get content;
  @override
  DateTime get occurredAt;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get deletedAt;
  @override
  String? get updatedById;
  @override
  String? get updatedByName;
  @override
  bool get isSynced;

  /// Create a copy of DailyNote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyNoteImplCopyWith<_$DailyNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
