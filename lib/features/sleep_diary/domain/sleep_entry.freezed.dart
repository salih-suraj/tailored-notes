// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SleepEntry _$SleepEntryFromJson(Map<String, dynamic> json) {
  return _SleepEntry.fromJson(json);
}

/// @nodoc
mixin _$SleepEntry {
  String get id => throw _privateConstructorUsedError;
  String get homeId => throw _privateConstructorUsedError;
  String get childId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError; // 'YYYY-MM-DD'
  ShiftType get shift => throw _privateConstructorUsedError;
  String? get bedTime => throw _privateConstructorUsedError; // 'HH:mm'
  String? get settledTime =>
      throw _privateConstructorUsedError; // 'HH:mm' — when child fell asleep
  String? get wakeTime => throw _privateConstructorUsedError; // 'HH:mm'
  int get numberOfWakings => throw _privateConstructorUsedError;
  SleepQuality get quality => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String get recordedById => throw _privateConstructorUsedError;
  String get recordedByName => throw _privateConstructorUsedError;
  String? get createdById => throw _privateConstructorUsedError;
  String? get updatedById => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isSynced => throw _privateConstructorUsedError;

  /// Serializes this SleepEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SleepEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SleepEntryCopyWith<SleepEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepEntryCopyWith<$Res> {
  factory $SleepEntryCopyWith(
    SleepEntry value,
    $Res Function(SleepEntry) then,
  ) = _$SleepEntryCopyWithImpl<$Res, SleepEntry>;
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    String date,
    ShiftType shift,
    String? bedTime,
    String? settledTime,
    String? wakeTime,
    int numberOfWakings,
    SleepQuality quality,
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
class _$SleepEntryCopyWithImpl<$Res, $Val extends SleepEntry>
    implements $SleepEntryCopyWith<$Res> {
  _$SleepEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SleepEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? date = null,
    Object? shift = null,
    Object? bedTime = freezed,
    Object? settledTime = freezed,
    Object? wakeTime = freezed,
    Object? numberOfWakings = null,
    Object? quality = null,
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
            childId: null == childId
                ? _value.childId
                : childId // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            shift: null == shift
                ? _value.shift
                : shift // ignore: cast_nullable_to_non_nullable
                      as ShiftType,
            bedTime: freezed == bedTime
                ? _value.bedTime
                : bedTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            settledTime: freezed == settledTime
                ? _value.settledTime
                : settledTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            wakeTime: freezed == wakeTime
                ? _value.wakeTime
                : wakeTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            numberOfWakings: null == numberOfWakings
                ? _value.numberOfWakings
                : numberOfWakings // ignore: cast_nullable_to_non_nullable
                      as int,
            quality: null == quality
                ? _value.quality
                : quality // ignore: cast_nullable_to_non_nullable
                      as SleepQuality,
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
abstract class _$$SleepEntryImplCopyWith<$Res>
    implements $SleepEntryCopyWith<$Res> {
  factory _$$SleepEntryImplCopyWith(
    _$SleepEntryImpl value,
    $Res Function(_$SleepEntryImpl) then,
  ) = __$$SleepEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    String date,
    ShiftType shift,
    String? bedTime,
    String? settledTime,
    String? wakeTime,
    int numberOfWakings,
    SleepQuality quality,
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
class __$$SleepEntryImplCopyWithImpl<$Res>
    extends _$SleepEntryCopyWithImpl<$Res, _$SleepEntryImpl>
    implements _$$SleepEntryImplCopyWith<$Res> {
  __$$SleepEntryImplCopyWithImpl(
    _$SleepEntryImpl _value,
    $Res Function(_$SleepEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SleepEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? date = null,
    Object? shift = null,
    Object? bedTime = freezed,
    Object? settledTime = freezed,
    Object? wakeTime = freezed,
    Object? numberOfWakings = null,
    Object? quality = null,
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
      _$SleepEntryImpl(
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
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        shift: null == shift
            ? _value.shift
            : shift // ignore: cast_nullable_to_non_nullable
                  as ShiftType,
        bedTime: freezed == bedTime
            ? _value.bedTime
            : bedTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        settledTime: freezed == settledTime
            ? _value.settledTime
            : settledTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        wakeTime: freezed == wakeTime
            ? _value.wakeTime
            : wakeTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        numberOfWakings: null == numberOfWakings
            ? _value.numberOfWakings
            : numberOfWakings // ignore: cast_nullable_to_non_nullable
                  as int,
        quality: null == quality
            ? _value.quality
            : quality // ignore: cast_nullable_to_non_nullable
                  as SleepQuality,
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
class _$SleepEntryImpl implements _SleepEntry {
  const _$SleepEntryImpl({
    required this.id,
    required this.homeId,
    required this.childId,
    required this.date,
    required this.shift,
    this.bedTime,
    this.settledTime,
    this.wakeTime,
    this.numberOfWakings = 0,
    required this.quality,
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

  factory _$SleepEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SleepEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String homeId;
  @override
  final String childId;
  @override
  final String date;
  // 'YYYY-MM-DD'
  @override
  final ShiftType shift;
  @override
  final String? bedTime;
  // 'HH:mm'
  @override
  final String? settledTime;
  // 'HH:mm' — when child fell asleep
  @override
  final String? wakeTime;
  // 'HH:mm'
  @override
  @JsonKey()
  final int numberOfWakings;
  @override
  final SleepQuality quality;
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
    return 'SleepEntry(id: $id, homeId: $homeId, childId: $childId, date: $date, shift: $shift, bedTime: $bedTime, settledTime: $settledTime, wakeTime: $wakeTime, numberOfWakings: $numberOfWakings, quality: $quality, notes: $notes, recordedById: $recordedById, recordedByName: $recordedByName, createdById: $createdById, updatedById: $updatedById, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.childId, childId) || other.childId == childId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.bedTime, bedTime) || other.bedTime == bedTime) &&
            (identical(other.settledTime, settledTime) ||
                other.settledTime == settledTime) &&
            (identical(other.wakeTime, wakeTime) ||
                other.wakeTime == wakeTime) &&
            (identical(other.numberOfWakings, numberOfWakings) ||
                other.numberOfWakings == numberOfWakings) &&
            (identical(other.quality, quality) || other.quality == quality) &&
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
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    homeId,
    childId,
    date,
    shift,
    bedTime,
    settledTime,
    wakeTime,
    numberOfWakings,
    quality,
    notes,
    recordedById,
    recordedByName,
    createdById,
    updatedById,
    deletedAt,
    createdAt,
    updatedAt,
    isSynced,
  ]);

  /// Create a copy of SleepEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepEntryImplCopyWith<_$SleepEntryImpl> get copyWith =>
      __$$SleepEntryImplCopyWithImpl<_$SleepEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SleepEntryImplToJson(this);
  }
}

abstract class _SleepEntry implements SleepEntry {
  const factory _SleepEntry({
    required final String id,
    required final String homeId,
    required final String childId,
    required final String date,
    required final ShiftType shift,
    final String? bedTime,
    final String? settledTime,
    final String? wakeTime,
    final int numberOfWakings,
    required final SleepQuality quality,
    final String? notes,
    required final String recordedById,
    required final String recordedByName,
    final String? createdById,
    final String? updatedById,
    final DateTime? deletedAt,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final bool isSynced,
  }) = _$SleepEntryImpl;

  factory _SleepEntry.fromJson(Map<String, dynamic> json) =
      _$SleepEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get homeId;
  @override
  String get childId;
  @override
  String get date; // 'YYYY-MM-DD'
  @override
  ShiftType get shift;
  @override
  String? get bedTime; // 'HH:mm'
  @override
  String? get settledTime; // 'HH:mm' — when child fell asleep
  @override
  String? get wakeTime; // 'HH:mm'
  @override
  int get numberOfWakings;
  @override
  SleepQuality get quality;
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

  /// Create a copy of SleepEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SleepEntryImplCopyWith<_$SleepEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
