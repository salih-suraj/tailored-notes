// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'behaviour_incident.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BehaviourIncident _$BehaviourIncidentFromJson(Map<String, dynamic> json) {
  return _BehaviourIncident.fromJson(json);
}

/// @nodoc
mixin _$BehaviourIncident {
  String get id => throw _privateConstructorUsedError;
  String get homeId => throw _privateConstructorUsedError;
  String get childId => throw _privateConstructorUsedError;
  ShiftType get shift => throw _privateConstructorUsedError;
  DateTime get occurredAt => throw _privateConstructorUsedError;
  BehaviourSeverity get severity => throw _privateConstructorUsedError;

  /// What happened immediately before — triggers, environment, context.
  String get antecedent => throw _privateConstructorUsedError;

  /// Description of the behaviour itself.
  String get behaviour => throw _privateConstructorUsedError;

  /// Staff response and what happened as a result.
  String get consequence => throw _privateConstructorUsedError;
  int? get durationMinutes => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  bool get physicalIntervention => throw _privateConstructorUsedError;
  String? get interventionDetails => throw _privateConstructorUsedError;
  bool get injuryOccurred => throw _privateConstructorUsedError;
  String? get injuryDetails => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String get recordedById => throw _privateConstructorUsedError;
  String get recordedByName => throw _privateConstructorUsedError;
  String? get createdById => throw _privateConstructorUsedError;
  String? get updatedById => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isSynced => throw _privateConstructorUsedError;

  /// Serializes this BehaviourIncident to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BehaviourIncident
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BehaviourIncidentCopyWith<BehaviourIncident> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BehaviourIncidentCopyWith<$Res> {
  factory $BehaviourIncidentCopyWith(
    BehaviourIncident value,
    $Res Function(BehaviourIncident) then,
  ) = _$BehaviourIncidentCopyWithImpl<$Res, BehaviourIncident>;
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    ShiftType shift,
    DateTime occurredAt,
    BehaviourSeverity severity,
    String antecedent,
    String behaviour,
    String consequence,
    int? durationMinutes,
    String? location,
    bool physicalIntervention,
    String? interventionDetails,
    bool injuryOccurred,
    String? injuryDetails,
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
class _$BehaviourIncidentCopyWithImpl<$Res, $Val extends BehaviourIncident>
    implements $BehaviourIncidentCopyWith<$Res> {
  _$BehaviourIncidentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BehaviourIncident
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? shift = null,
    Object? occurredAt = null,
    Object? severity = null,
    Object? antecedent = null,
    Object? behaviour = null,
    Object? consequence = null,
    Object? durationMinutes = freezed,
    Object? location = freezed,
    Object? physicalIntervention = null,
    Object? interventionDetails = freezed,
    Object? injuryOccurred = null,
    Object? injuryDetails = freezed,
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
            shift: null == shift
                ? _value.shift
                : shift // ignore: cast_nullable_to_non_nullable
                      as ShiftType,
            occurredAt: null == occurredAt
                ? _value.occurredAt
                : occurredAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            severity: null == severity
                ? _value.severity
                : severity // ignore: cast_nullable_to_non_nullable
                      as BehaviourSeverity,
            antecedent: null == antecedent
                ? _value.antecedent
                : antecedent // ignore: cast_nullable_to_non_nullable
                      as String,
            behaviour: null == behaviour
                ? _value.behaviour
                : behaviour // ignore: cast_nullable_to_non_nullable
                      as String,
            consequence: null == consequence
                ? _value.consequence
                : consequence // ignore: cast_nullable_to_non_nullable
                      as String,
            durationMinutes: freezed == durationMinutes
                ? _value.durationMinutes
                : durationMinutes // ignore: cast_nullable_to_non_nullable
                      as int?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            physicalIntervention: null == physicalIntervention
                ? _value.physicalIntervention
                : physicalIntervention // ignore: cast_nullable_to_non_nullable
                      as bool,
            interventionDetails: freezed == interventionDetails
                ? _value.interventionDetails
                : interventionDetails // ignore: cast_nullable_to_non_nullable
                      as String?,
            injuryOccurred: null == injuryOccurred
                ? _value.injuryOccurred
                : injuryOccurred // ignore: cast_nullable_to_non_nullable
                      as bool,
            injuryDetails: freezed == injuryDetails
                ? _value.injuryDetails
                : injuryDetails // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$BehaviourIncidentImplCopyWith<$Res>
    implements $BehaviourIncidentCopyWith<$Res> {
  factory _$$BehaviourIncidentImplCopyWith(
    _$BehaviourIncidentImpl value,
    $Res Function(_$BehaviourIncidentImpl) then,
  ) = __$$BehaviourIncidentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    ShiftType shift,
    DateTime occurredAt,
    BehaviourSeverity severity,
    String antecedent,
    String behaviour,
    String consequence,
    int? durationMinutes,
    String? location,
    bool physicalIntervention,
    String? interventionDetails,
    bool injuryOccurred,
    String? injuryDetails,
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
class __$$BehaviourIncidentImplCopyWithImpl<$Res>
    extends _$BehaviourIncidentCopyWithImpl<$Res, _$BehaviourIncidentImpl>
    implements _$$BehaviourIncidentImplCopyWith<$Res> {
  __$$BehaviourIncidentImplCopyWithImpl(
    _$BehaviourIncidentImpl _value,
    $Res Function(_$BehaviourIncidentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BehaviourIncident
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? shift = null,
    Object? occurredAt = null,
    Object? severity = null,
    Object? antecedent = null,
    Object? behaviour = null,
    Object? consequence = null,
    Object? durationMinutes = freezed,
    Object? location = freezed,
    Object? physicalIntervention = null,
    Object? interventionDetails = freezed,
    Object? injuryOccurred = null,
    Object? injuryDetails = freezed,
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
      _$BehaviourIncidentImpl(
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
        shift: null == shift
            ? _value.shift
            : shift // ignore: cast_nullable_to_non_nullable
                  as ShiftType,
        occurredAt: null == occurredAt
            ? _value.occurredAt
            : occurredAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        severity: null == severity
            ? _value.severity
            : severity // ignore: cast_nullable_to_non_nullable
                  as BehaviourSeverity,
        antecedent: null == antecedent
            ? _value.antecedent
            : antecedent // ignore: cast_nullable_to_non_nullable
                  as String,
        behaviour: null == behaviour
            ? _value.behaviour
            : behaviour // ignore: cast_nullable_to_non_nullable
                  as String,
        consequence: null == consequence
            ? _value.consequence
            : consequence // ignore: cast_nullable_to_non_nullable
                  as String,
        durationMinutes: freezed == durationMinutes
            ? _value.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        physicalIntervention: null == physicalIntervention
            ? _value.physicalIntervention
            : physicalIntervention // ignore: cast_nullable_to_non_nullable
                  as bool,
        interventionDetails: freezed == interventionDetails
            ? _value.interventionDetails
            : interventionDetails // ignore: cast_nullable_to_non_nullable
                  as String?,
        injuryOccurred: null == injuryOccurred
            ? _value.injuryOccurred
            : injuryOccurred // ignore: cast_nullable_to_non_nullable
                  as bool,
        injuryDetails: freezed == injuryDetails
            ? _value.injuryDetails
            : injuryDetails // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$BehaviourIncidentImpl implements _BehaviourIncident {
  const _$BehaviourIncidentImpl({
    required this.id,
    required this.homeId,
    required this.childId,
    required this.shift,
    required this.occurredAt,
    required this.severity,
    required this.antecedent,
    required this.behaviour,
    required this.consequence,
    this.durationMinutes,
    this.location,
    this.physicalIntervention = false,
    this.interventionDetails,
    this.injuryOccurred = false,
    this.injuryDetails,
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

  factory _$BehaviourIncidentImpl.fromJson(Map<String, dynamic> json) =>
      _$$BehaviourIncidentImplFromJson(json);

  @override
  final String id;
  @override
  final String homeId;
  @override
  final String childId;
  @override
  final ShiftType shift;
  @override
  final DateTime occurredAt;
  @override
  final BehaviourSeverity severity;

  /// What happened immediately before — triggers, environment, context.
  @override
  final String antecedent;

  /// Description of the behaviour itself.
  @override
  final String behaviour;

  /// Staff response and what happened as a result.
  @override
  final String consequence;
  @override
  final int? durationMinutes;
  @override
  final String? location;
  @override
  @JsonKey()
  final bool physicalIntervention;
  @override
  final String? interventionDetails;
  @override
  @JsonKey()
  final bool injuryOccurred;
  @override
  final String? injuryDetails;
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
    return 'BehaviourIncident(id: $id, homeId: $homeId, childId: $childId, shift: $shift, occurredAt: $occurredAt, severity: $severity, antecedent: $antecedent, behaviour: $behaviour, consequence: $consequence, durationMinutes: $durationMinutes, location: $location, physicalIntervention: $physicalIntervention, interventionDetails: $interventionDetails, injuryOccurred: $injuryOccurred, injuryDetails: $injuryDetails, notes: $notes, recordedById: $recordedById, recordedByName: $recordedByName, createdById: $createdById, updatedById: $updatedById, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BehaviourIncidentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.childId, childId) || other.childId == childId) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.occurredAt, occurredAt) ||
                other.occurredAt == occurredAt) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.antecedent, antecedent) ||
                other.antecedent == antecedent) &&
            (identical(other.behaviour, behaviour) ||
                other.behaviour == behaviour) &&
            (identical(other.consequence, consequence) ||
                other.consequence == consequence) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.physicalIntervention, physicalIntervention) ||
                other.physicalIntervention == physicalIntervention) &&
            (identical(other.interventionDetails, interventionDetails) ||
                other.interventionDetails == interventionDetails) &&
            (identical(other.injuryOccurred, injuryOccurred) ||
                other.injuryOccurred == injuryOccurred) &&
            (identical(other.injuryDetails, injuryDetails) ||
                other.injuryDetails == injuryDetails) &&
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
    shift,
    occurredAt,
    severity,
    antecedent,
    behaviour,
    consequence,
    durationMinutes,
    location,
    physicalIntervention,
    interventionDetails,
    injuryOccurred,
    injuryDetails,
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

  /// Create a copy of BehaviourIncident
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BehaviourIncidentImplCopyWith<_$BehaviourIncidentImpl> get copyWith =>
      __$$BehaviourIncidentImplCopyWithImpl<_$BehaviourIncidentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BehaviourIncidentImplToJson(this);
  }
}

abstract class _BehaviourIncident implements BehaviourIncident {
  const factory _BehaviourIncident({
    required final String id,
    required final String homeId,
    required final String childId,
    required final ShiftType shift,
    required final DateTime occurredAt,
    required final BehaviourSeverity severity,
    required final String antecedent,
    required final String behaviour,
    required final String consequence,
    final int? durationMinutes,
    final String? location,
    final bool physicalIntervention,
    final String? interventionDetails,
    final bool injuryOccurred,
    final String? injuryDetails,
    final String? notes,
    required final String recordedById,
    required final String recordedByName,
    final String? createdById,
    final String? updatedById,
    final DateTime? deletedAt,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final bool isSynced,
  }) = _$BehaviourIncidentImpl;

  factory _BehaviourIncident.fromJson(Map<String, dynamic> json) =
      _$BehaviourIncidentImpl.fromJson;

  @override
  String get id;
  @override
  String get homeId;
  @override
  String get childId;
  @override
  ShiftType get shift;
  @override
  DateTime get occurredAt;
  @override
  BehaviourSeverity get severity;

  /// What happened immediately before — triggers, environment, context.
  @override
  String get antecedent;

  /// Description of the behaviour itself.
  @override
  String get behaviour;

  /// Staff response and what happened as a result.
  @override
  String get consequence;
  @override
  int? get durationMinutes;
  @override
  String? get location;
  @override
  bool get physicalIntervention;
  @override
  String? get interventionDetails;
  @override
  bool get injuryOccurred;
  @override
  String? get injuryDetails;
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

  /// Create a copy of BehaviourIncident
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BehaviourIncidentImplCopyWith<_$BehaviourIncidentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
