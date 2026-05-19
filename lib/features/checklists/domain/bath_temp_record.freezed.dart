// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bath_temp_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BathTempRecord _$BathTempRecordFromJson(Map<String, dynamic> json) {
  return _BathTempRecord.fromJson(json);
}

/// @nodoc
mixin _$BathTempRecord {
  String get id => throw _privateConstructorUsedError;
  String get homeId => throw _privateConstructorUsedError;
  String get childId => throw _privateConstructorUsedError;
  double get temperatureCelsius => throw _privateConstructorUsedError;
  ShiftType get shift => throw _privateConstructorUsedError;
  DateTime get recordedAt => throw _privateConstructorUsedError;
  String get recordedById => throw _privateConstructorUsedError;
  String get recordedByName => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get createdById => throw _privateConstructorUsedError;
  String? get updatedById => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isSynced => throw _privateConstructorUsedError;

  /// Serializes this BathTempRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BathTempRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BathTempRecordCopyWith<BathTempRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BathTempRecordCopyWith<$Res> {
  factory $BathTempRecordCopyWith(
    BathTempRecord value,
    $Res Function(BathTempRecord) then,
  ) = _$BathTempRecordCopyWithImpl<$Res, BathTempRecord>;
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    double temperatureCelsius,
    ShiftType shift,
    DateTime recordedAt,
    String recordedById,
    String recordedByName,
    String? notes,
    String? createdById,
    String? updatedById,
    DateTime createdAt,
    DateTime updatedAt,
    bool isSynced,
  });
}

/// @nodoc
class _$BathTempRecordCopyWithImpl<$Res, $Val extends BathTempRecord>
    implements $BathTempRecordCopyWith<$Res> {
  _$BathTempRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BathTempRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? temperatureCelsius = null,
    Object? shift = null,
    Object? recordedAt = null,
    Object? recordedById = null,
    Object? recordedByName = null,
    Object? notes = freezed,
    Object? createdById = freezed,
    Object? updatedById = freezed,
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
            temperatureCelsius: null == temperatureCelsius
                ? _value.temperatureCelsius
                : temperatureCelsius // ignore: cast_nullable_to_non_nullable
                      as double,
            shift: null == shift
                ? _value.shift
                : shift // ignore: cast_nullable_to_non_nullable
                      as ShiftType,
            recordedAt: null == recordedAt
                ? _value.recordedAt
                : recordedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            recordedById: null == recordedById
                ? _value.recordedById
                : recordedById // ignore: cast_nullable_to_non_nullable
                      as String,
            recordedByName: null == recordedByName
                ? _value.recordedByName
                : recordedByName // ignore: cast_nullable_to_non_nullable
                      as String,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdById: freezed == createdById
                ? _value.createdById
                : createdById // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedById: freezed == updatedById
                ? _value.updatedById
                : updatedById // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$BathTempRecordImplCopyWith<$Res>
    implements $BathTempRecordCopyWith<$Res> {
  factory _$$BathTempRecordImplCopyWith(
    _$BathTempRecordImpl value,
    $Res Function(_$BathTempRecordImpl) then,
  ) = __$$BathTempRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    double temperatureCelsius,
    ShiftType shift,
    DateTime recordedAt,
    String recordedById,
    String recordedByName,
    String? notes,
    String? createdById,
    String? updatedById,
    DateTime createdAt,
    DateTime updatedAt,
    bool isSynced,
  });
}

/// @nodoc
class __$$BathTempRecordImplCopyWithImpl<$Res>
    extends _$BathTempRecordCopyWithImpl<$Res, _$BathTempRecordImpl>
    implements _$$BathTempRecordImplCopyWith<$Res> {
  __$$BathTempRecordImplCopyWithImpl(
    _$BathTempRecordImpl _value,
    $Res Function(_$BathTempRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BathTempRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? temperatureCelsius = null,
    Object? shift = null,
    Object? recordedAt = null,
    Object? recordedById = null,
    Object? recordedByName = null,
    Object? notes = freezed,
    Object? createdById = freezed,
    Object? updatedById = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isSynced = null,
  }) {
    return _then(
      _$BathTempRecordImpl(
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
        temperatureCelsius: null == temperatureCelsius
            ? _value.temperatureCelsius
            : temperatureCelsius // ignore: cast_nullable_to_non_nullable
                  as double,
        shift: null == shift
            ? _value.shift
            : shift // ignore: cast_nullable_to_non_nullable
                  as ShiftType,
        recordedAt: null == recordedAt
            ? _value.recordedAt
            : recordedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        recordedById: null == recordedById
            ? _value.recordedById
            : recordedById // ignore: cast_nullable_to_non_nullable
                  as String,
        recordedByName: null == recordedByName
            ? _value.recordedByName
            : recordedByName // ignore: cast_nullable_to_non_nullable
                  as String,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdById: freezed == createdById
            ? _value.createdById
            : createdById // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedById: freezed == updatedById
            ? _value.updatedById
            : updatedById // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$BathTempRecordImpl implements _BathTempRecord {
  const _$BathTempRecordImpl({
    required this.id,
    required this.homeId,
    required this.childId,
    required this.temperatureCelsius,
    required this.shift,
    required this.recordedAt,
    required this.recordedById,
    required this.recordedByName,
    this.notes,
    this.createdById,
    this.updatedById,
    required this.createdAt,
    required this.updatedAt,
    this.isSynced = false,
  });

  factory _$BathTempRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$BathTempRecordImplFromJson(json);

  @override
  final String id;
  @override
  final String homeId;
  @override
  final String childId;
  @override
  final double temperatureCelsius;
  @override
  final ShiftType shift;
  @override
  final DateTime recordedAt;
  @override
  final String recordedById;
  @override
  final String recordedByName;
  @override
  final String? notes;
  @override
  final String? createdById;
  @override
  final String? updatedById;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final bool isSynced;

  @override
  String toString() {
    return 'BathTempRecord(id: $id, homeId: $homeId, childId: $childId, temperatureCelsius: $temperatureCelsius, shift: $shift, recordedAt: $recordedAt, recordedById: $recordedById, recordedByName: $recordedByName, notes: $notes, createdById: $createdById, updatedById: $updatedById, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BathTempRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.childId, childId) || other.childId == childId) &&
            (identical(other.temperatureCelsius, temperatureCelsius) ||
                other.temperatureCelsius == temperatureCelsius) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt) &&
            (identical(other.recordedById, recordedById) ||
                other.recordedById == recordedById) &&
            (identical(other.recordedByName, recordedByName) ||
                other.recordedByName == recordedByName) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
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
    childId,
    temperatureCelsius,
    shift,
    recordedAt,
    recordedById,
    recordedByName,
    notes,
    createdById,
    updatedById,
    createdAt,
    updatedAt,
    isSynced,
  );

  /// Create a copy of BathTempRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BathTempRecordImplCopyWith<_$BathTempRecordImpl> get copyWith =>
      __$$BathTempRecordImplCopyWithImpl<_$BathTempRecordImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BathTempRecordImplToJson(this);
  }
}

abstract class _BathTempRecord implements BathTempRecord {
  const factory _BathTempRecord({
    required final String id,
    required final String homeId,
    required final String childId,
    required final double temperatureCelsius,
    required final ShiftType shift,
    required final DateTime recordedAt,
    required final String recordedById,
    required final String recordedByName,
    final String? notes,
    final String? createdById,
    final String? updatedById,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final bool isSynced,
  }) = _$BathTempRecordImpl;

  factory _BathTempRecord.fromJson(Map<String, dynamic> json) =
      _$BathTempRecordImpl.fromJson;

  @override
  String get id;
  @override
  String get homeId;
  @override
  String get childId;
  @override
  double get temperatureCelsius;
  @override
  ShiftType get shift;
  @override
  DateTime get recordedAt;
  @override
  String get recordedById;
  @override
  String get recordedByName;
  @override
  String? get notes;
  @override
  String? get createdById;
  @override
  String? get updatedById;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  bool get isSynced;

  /// Create a copy of BathTempRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BathTempRecordImplCopyWith<_$BathTempRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
