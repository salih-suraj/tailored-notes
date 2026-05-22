// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'step_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StepProgress _$StepProgressFromJson(Map<String, dynamic> json) {
  return _StepProgress.fromJson(json);
}

/// @nodoc
mixin _$StepProgress {
  String get id => throw _privateConstructorUsedError;
  String get homeId => throw _privateConstructorUsedError;
  String get childId => throw _privateConstructorUsedError;
  String get stepId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError; // 'YYYY-MM-DD'
  ShiftType get shift => throw _privateConstructorUsedError;
  ProgressOutcome get outcome => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  String get recordedById => throw _privateConstructorUsedError;
  String get recordedByName => throw _privateConstructorUsedError;
  String? get createdById => throw _privateConstructorUsedError;
  String? get updatedById => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isSynced => throw _privateConstructorUsedError;

  /// Serializes this StepProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StepProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StepProgressCopyWith<StepProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepProgressCopyWith<$Res> {
  factory $StepProgressCopyWith(
    StepProgress value,
    $Res Function(StepProgress) then,
  ) = _$StepProgressCopyWithImpl<$Res, StepProgress>;
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    String stepId,
    String date,
    ShiftType shift,
    ProgressOutcome outcome,
    String note,
    String recordedById,
    String recordedByName,
    String? createdById,
    String? updatedById,
    DateTime createdAt,
    DateTime updatedAt,
    bool isSynced,
  });
}

/// @nodoc
class _$StepProgressCopyWithImpl<$Res, $Val extends StepProgress>
    implements $StepProgressCopyWith<$Res> {
  _$StepProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StepProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? stepId = null,
    Object? date = null,
    Object? shift = null,
    Object? outcome = null,
    Object? note = null,
    Object? recordedById = null,
    Object? recordedByName = null,
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
            stepId: null == stepId
                ? _value.stepId
                : stepId // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            shift: null == shift
                ? _value.shift
                : shift // ignore: cast_nullable_to_non_nullable
                      as ShiftType,
            outcome: null == outcome
                ? _value.outcome
                : outcome // ignore: cast_nullable_to_non_nullable
                      as ProgressOutcome,
            note: null == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$StepProgressImplCopyWith<$Res>
    implements $StepProgressCopyWith<$Res> {
  factory _$$StepProgressImplCopyWith(
    _$StepProgressImpl value,
    $Res Function(_$StepProgressImpl) then,
  ) = __$$StepProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    String stepId,
    String date,
    ShiftType shift,
    ProgressOutcome outcome,
    String note,
    String recordedById,
    String recordedByName,
    String? createdById,
    String? updatedById,
    DateTime createdAt,
    DateTime updatedAt,
    bool isSynced,
  });
}

/// @nodoc
class __$$StepProgressImplCopyWithImpl<$Res>
    extends _$StepProgressCopyWithImpl<$Res, _$StepProgressImpl>
    implements _$$StepProgressImplCopyWith<$Res> {
  __$$StepProgressImplCopyWithImpl(
    _$StepProgressImpl _value,
    $Res Function(_$StepProgressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StepProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? stepId = null,
    Object? date = null,
    Object? shift = null,
    Object? outcome = null,
    Object? note = null,
    Object? recordedById = null,
    Object? recordedByName = null,
    Object? createdById = freezed,
    Object? updatedById = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isSynced = null,
  }) {
    return _then(
      _$StepProgressImpl(
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
        stepId: null == stepId
            ? _value.stepId
            : stepId // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        shift: null == shift
            ? _value.shift
            : shift // ignore: cast_nullable_to_non_nullable
                  as ShiftType,
        outcome: null == outcome
            ? _value.outcome
            : outcome // ignore: cast_nullable_to_non_nullable
                  as ProgressOutcome,
        note: null == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$StepProgressImpl implements _StepProgress {
  const _$StepProgressImpl({
    required this.id,
    required this.homeId,
    required this.childId,
    required this.stepId,
    required this.date,
    required this.shift,
    required this.outcome,
    required this.note,
    required this.recordedById,
    required this.recordedByName,
    this.createdById,
    this.updatedById,
    required this.createdAt,
    required this.updatedAt,
    this.isSynced = false,
  });

  factory _$StepProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$StepProgressImplFromJson(json);

  @override
  final String id;
  @override
  final String homeId;
  @override
  final String childId;
  @override
  final String stepId;
  @override
  final String date;
  // 'YYYY-MM-DD'
  @override
  final ShiftType shift;
  @override
  final ProgressOutcome outcome;
  @override
  final String note;
  @override
  final String recordedById;
  @override
  final String recordedByName;
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
    return 'StepProgress(id: $id, homeId: $homeId, childId: $childId, stepId: $stepId, date: $date, shift: $shift, outcome: $outcome, note: $note, recordedById: $recordedById, recordedByName: $recordedByName, createdById: $createdById, updatedById: $updatedById, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepProgressImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.childId, childId) || other.childId == childId) &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.outcome, outcome) || other.outcome == outcome) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.recordedById, recordedById) ||
                other.recordedById == recordedById) &&
            (identical(other.recordedByName, recordedByName) ||
                other.recordedByName == recordedByName) &&
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
    stepId,
    date,
    shift,
    outcome,
    note,
    recordedById,
    recordedByName,
    createdById,
    updatedById,
    createdAt,
    updatedAt,
    isSynced,
  );

  /// Create a copy of StepProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StepProgressImplCopyWith<_$StepProgressImpl> get copyWith =>
      __$$StepProgressImplCopyWithImpl<_$StepProgressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StepProgressImplToJson(this);
  }
}

abstract class _StepProgress implements StepProgress {
  const factory _StepProgress({
    required final String id,
    required final String homeId,
    required final String childId,
    required final String stepId,
    required final String date,
    required final ShiftType shift,
    required final ProgressOutcome outcome,
    required final String note,
    required final String recordedById,
    required final String recordedByName,
    final String? createdById,
    final String? updatedById,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final bool isSynced,
  }) = _$StepProgressImpl;

  factory _StepProgress.fromJson(Map<String, dynamic> json) =
      _$StepProgressImpl.fromJson;

  @override
  String get id;
  @override
  String get homeId;
  @override
  String get childId;
  @override
  String get stepId;
  @override
  String get date; // 'YYYY-MM-DD'
  @override
  ShiftType get shift;
  @override
  ProgressOutcome get outcome;
  @override
  String get note;
  @override
  String get recordedById;
  @override
  String get recordedByName;
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

  /// Create a copy of StepProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StepProgressImplCopyWith<_$StepProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
