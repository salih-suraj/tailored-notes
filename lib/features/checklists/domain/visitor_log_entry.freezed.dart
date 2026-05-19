// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visitor_log_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VisitorLogEntry _$VisitorLogEntryFromJson(Map<String, dynamic> json) {
  return _VisitorLogEntry.fromJson(json);
}

/// @nodoc
mixin _$VisitorLogEntry {
  String get id => throw _privateConstructorUsedError;
  String get homeId => throw _privateConstructorUsedError;
  String get visitorName => throw _privateConstructorUsedError;
  String? get relation => throw _privateConstructorUsedError;
  String get purpose => throw _privateConstructorUsedError;
  String get authorisedBy => throw _privateConstructorUsedError;
  DateTime get arrivedAt => throw _privateConstructorUsedError;
  DateTime? get departedAt => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String get recordedById => throw _privateConstructorUsedError;
  String get recordedByName => throw _privateConstructorUsedError;
  String? get createdById => throw _privateConstructorUsedError;
  String? get updatedById => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isSynced => throw _privateConstructorUsedError;

  /// Serializes this VisitorLogEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VisitorLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VisitorLogEntryCopyWith<VisitorLogEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitorLogEntryCopyWith<$Res> {
  factory $VisitorLogEntryCopyWith(
    VisitorLogEntry value,
    $Res Function(VisitorLogEntry) then,
  ) = _$VisitorLogEntryCopyWithImpl<$Res, VisitorLogEntry>;
  @useResult
  $Res call({
    String id,
    String homeId,
    String visitorName,
    String? relation,
    String purpose,
    String authorisedBy,
    DateTime arrivedAt,
    DateTime? departedAt,
    String? notes,
    String recordedById,
    String recordedByName,
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    DateTime createdAt,
    DateTime updatedAt,
    bool isSynced,
  });
}

/// @nodoc
class _$VisitorLogEntryCopyWithImpl<$Res, $Val extends VisitorLogEntry>
    implements $VisitorLogEntryCopyWith<$Res> {
  _$VisitorLogEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VisitorLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? visitorName = null,
    Object? relation = freezed,
    Object? purpose = null,
    Object? authorisedBy = null,
    Object? arrivedAt = null,
    Object? departedAt = freezed,
    Object? notes = freezed,
    Object? recordedById = null,
    Object? recordedByName = null,
    Object? createdById = freezed,
    Object? updatedById = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
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
            visitorName: null == visitorName
                ? _value.visitorName
                : visitorName // ignore: cast_nullable_to_non_nullable
                      as String,
            relation: freezed == relation
                ? _value.relation
                : relation // ignore: cast_nullable_to_non_nullable
                      as String?,
            purpose: null == purpose
                ? _value.purpose
                : purpose // ignore: cast_nullable_to_non_nullable
                      as String,
            authorisedBy: null == authorisedBy
                ? _value.authorisedBy
                : authorisedBy // ignore: cast_nullable_to_non_nullable
                      as String,
            arrivedAt: null == arrivedAt
                ? _value.arrivedAt
                : arrivedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            departedAt: freezed == departedAt
                ? _value.departedAt
                : departedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            recordedById: null == recordedById
                ? _value.recordedById
                : recordedById // ignore: cast_nullable_to_non_nullable
                      as String,
            recordedByName: null == recordedByName
                ? _value.recordedByName
                : recordedByName // ignore: cast_nullable_to_non_nullable
                      as String,
            createdById: freezed == createdById
                ? _value.createdById
                : createdById // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedById: freezed == updatedById
                ? _value.updatedById
                : updatedById // ignore: cast_nullable_to_non_nullable
                      as String?,
            deletedAt: freezed == deletedAt
                ? _value.deletedAt
                : deletedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
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
abstract class _$$VisitorLogEntryImplCopyWith<$Res>
    implements $VisitorLogEntryCopyWith<$Res> {
  factory _$$VisitorLogEntryImplCopyWith(
    _$VisitorLogEntryImpl value,
    $Res Function(_$VisitorLogEntryImpl) then,
  ) = __$$VisitorLogEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String homeId,
    String visitorName,
    String? relation,
    String purpose,
    String authorisedBy,
    DateTime arrivedAt,
    DateTime? departedAt,
    String? notes,
    String recordedById,
    String recordedByName,
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    DateTime createdAt,
    DateTime updatedAt,
    bool isSynced,
  });
}

/// @nodoc
class __$$VisitorLogEntryImplCopyWithImpl<$Res>
    extends _$VisitorLogEntryCopyWithImpl<$Res, _$VisitorLogEntryImpl>
    implements _$$VisitorLogEntryImplCopyWith<$Res> {
  __$$VisitorLogEntryImplCopyWithImpl(
    _$VisitorLogEntryImpl _value,
    $Res Function(_$VisitorLogEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VisitorLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? visitorName = null,
    Object? relation = freezed,
    Object? purpose = null,
    Object? authorisedBy = null,
    Object? arrivedAt = null,
    Object? departedAt = freezed,
    Object? notes = freezed,
    Object? recordedById = null,
    Object? recordedByName = null,
    Object? createdById = freezed,
    Object? updatedById = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isSynced = null,
  }) {
    return _then(
      _$VisitorLogEntryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        homeId: null == homeId
            ? _value.homeId
            : homeId // ignore: cast_nullable_to_non_nullable
                  as String,
        visitorName: null == visitorName
            ? _value.visitorName
            : visitorName // ignore: cast_nullable_to_non_nullable
                  as String,
        relation: freezed == relation
            ? _value.relation
            : relation // ignore: cast_nullable_to_non_nullable
                  as String?,
        purpose: null == purpose
            ? _value.purpose
            : purpose // ignore: cast_nullable_to_non_nullable
                  as String,
        authorisedBy: null == authorisedBy
            ? _value.authorisedBy
            : authorisedBy // ignore: cast_nullable_to_non_nullable
                  as String,
        arrivedAt: null == arrivedAt
            ? _value.arrivedAt
            : arrivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        departedAt: freezed == departedAt
            ? _value.departedAt
            : departedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        recordedById: null == recordedById
            ? _value.recordedById
            : recordedById // ignore: cast_nullable_to_non_nullable
                  as String,
        recordedByName: null == recordedByName
            ? _value.recordedByName
            : recordedByName // ignore: cast_nullable_to_non_nullable
                  as String,
        createdById: freezed == createdById
            ? _value.createdById
            : createdById // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedById: freezed == updatedById
            ? _value.updatedById
            : updatedById // ignore: cast_nullable_to_non_nullable
                  as String?,
        deletedAt: freezed == deletedAt
            ? _value.deletedAt
            : deletedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
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
class _$VisitorLogEntryImpl implements _VisitorLogEntry {
  const _$VisitorLogEntryImpl({
    required this.id,
    required this.homeId,
    required this.visitorName,
    this.relation,
    required this.purpose,
    required this.authorisedBy,
    required this.arrivedAt,
    this.departedAt,
    this.notes,
    required this.recordedById,
    required this.recordedByName,
    this.createdById,
    this.updatedById,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    this.isSynced = false,
  });

  factory _$VisitorLogEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$VisitorLogEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String homeId;
  @override
  final String visitorName;
  @override
  final String? relation;
  @override
  final String purpose;
  @override
  final String authorisedBy;
  @override
  final DateTime arrivedAt;
  @override
  final DateTime? departedAt;
  @override
  final String? notes;
  @override
  final String recordedById;
  @override
  final String recordedByName;
  @override
  final String? createdById;
  @override
  final String? updatedById;
  @override
  final DateTime? deletedAt;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final bool isSynced;

  @override
  String toString() {
    return 'VisitorLogEntry(id: $id, homeId: $homeId, visitorName: $visitorName, relation: $relation, purpose: $purpose, authorisedBy: $authorisedBy, arrivedAt: $arrivedAt, departedAt: $departedAt, notes: $notes, recordedById: $recordedById, recordedByName: $recordedByName, createdById: $createdById, updatedById: $updatedById, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitorLogEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.visitorName, visitorName) ||
                other.visitorName == visitorName) &&
            (identical(other.relation, relation) ||
                other.relation == relation) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            (identical(other.authorisedBy, authorisedBy) ||
                other.authorisedBy == authorisedBy) &&
            (identical(other.arrivedAt, arrivedAt) ||
                other.arrivedAt == arrivedAt) &&
            (identical(other.departedAt, departedAt) ||
                other.departedAt == departedAt) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.recordedById, recordedById) ||
                other.recordedById == recordedById) &&
            (identical(other.recordedByName, recordedByName) ||
                other.recordedByName == recordedByName) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isSynced, isSynced) ||
                other.isSynced == isSynced));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    homeId,
    visitorName,
    relation,
    purpose,
    authorisedBy,
    arrivedAt,
    departedAt,
    notes,
    recordedById,
    recordedByName,
    createdById,
    updatedById,
    deletedAt,
    createdAt,
    updatedAt,
    isSynced,
  );

  /// Create a copy of VisitorLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitorLogEntryImplCopyWith<_$VisitorLogEntryImpl> get copyWith =>
      __$$VisitorLogEntryImplCopyWithImpl<_$VisitorLogEntryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VisitorLogEntryImplToJson(this);
  }
}

abstract class _VisitorLogEntry implements VisitorLogEntry {
  const factory _VisitorLogEntry({
    required final String id,
    required final String homeId,
    required final String visitorName,
    final String? relation,
    required final String purpose,
    required final String authorisedBy,
    required final DateTime arrivedAt,
    final DateTime? departedAt,
    final String? notes,
    required final String recordedById,
    required final String recordedByName,
    final String? createdById,
    final String? updatedById,
    final DateTime? deletedAt,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final bool isSynced,
  }) = _$VisitorLogEntryImpl;

  factory _VisitorLogEntry.fromJson(Map<String, dynamic> json) =
      _$VisitorLogEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get homeId;
  @override
  String get visitorName;
  @override
  String? get relation;
  @override
  String get purpose;
  @override
  String get authorisedBy;
  @override
  DateTime get arrivedAt;
  @override
  DateTime? get departedAt;
  @override
  String? get notes;
  @override
  String get recordedById;
  @override
  String get recordedByName;
  @override
  String? get createdById;
  @override
  String? get updatedById;
  @override
  DateTime? get deletedAt;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  bool get isSynced;

  /// Create a copy of VisitorLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VisitorLogEntryImplCopyWith<_$VisitorLogEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
