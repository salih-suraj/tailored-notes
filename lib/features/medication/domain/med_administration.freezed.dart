// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'med_administration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MedAdministration _$MedAdministrationFromJson(Map<String, dynamic> json) {
  return _MedAdministration.fromJson(json);
}

/// @nodoc
mixin _$MedAdministration {
  String get id => throw _privateConstructorUsedError;
  String get homeId => throw _privateConstructorUsedError;
  String get childId => throw _privateConstructorUsedError;
  String get prescribedMedId => throw _privateConstructorUsedError;
  String get medicationName =>
      throw _privateConstructorUsedError; // denormalised for audit readability
  String get dose => throw _privateConstructorUsedError;
  AdminOutcome get outcome => throw _privateConstructorUsedError;
  ShiftType get shift => throw _privateConstructorUsedError;
  DateTime get administeredAt => throw _privateConstructorUsedError;
  String get administeredById => throw _privateConstructorUsedError;
  String get administeredByName => throw _privateConstructorUsedError;
  String? get reason =>
      throw _privateConstructorUsedError; // required for refused/held and PRN; optional otherwise
  String? get notes => throw _privateConstructorUsedError;
  String? get createdById => throw _privateConstructorUsedError;
  String? get updatedById => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isSynced => throw _privateConstructorUsedError;

  /// Serializes this MedAdministration to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MedAdministration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedAdministrationCopyWith<MedAdministration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedAdministrationCopyWith<$Res> {
  factory $MedAdministrationCopyWith(
    MedAdministration value,
    $Res Function(MedAdministration) then,
  ) = _$MedAdministrationCopyWithImpl<$Res, MedAdministration>;
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    String prescribedMedId,
    String medicationName,
    String dose,
    AdminOutcome outcome,
    ShiftType shift,
    DateTime administeredAt,
    String administeredById,
    String administeredByName,
    String? reason,
    String? notes,
    String? createdById,
    String? updatedById,
    DateTime createdAt,
    DateTime updatedAt,
    bool isSynced,
  });
}

/// @nodoc
class _$MedAdministrationCopyWithImpl<$Res, $Val extends MedAdministration>
    implements $MedAdministrationCopyWith<$Res> {
  _$MedAdministrationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedAdministration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? prescribedMedId = null,
    Object? medicationName = null,
    Object? dose = null,
    Object? outcome = null,
    Object? shift = null,
    Object? administeredAt = null,
    Object? administeredById = null,
    Object? administeredByName = null,
    Object? reason = freezed,
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
            prescribedMedId: null == prescribedMedId
                ? _value.prescribedMedId
                : prescribedMedId // ignore: cast_nullable_to_non_nullable
                      as String,
            medicationName: null == medicationName
                ? _value.medicationName
                : medicationName // ignore: cast_nullable_to_non_nullable
                      as String,
            dose: null == dose
                ? _value.dose
                : dose // ignore: cast_nullable_to_non_nullable
                      as String,
            outcome: null == outcome
                ? _value.outcome
                : outcome // ignore: cast_nullable_to_non_nullable
                      as AdminOutcome,
            shift: null == shift
                ? _value.shift
                : shift // ignore: cast_nullable_to_non_nullable
                      as ShiftType,
            administeredAt: null == administeredAt
                ? _value.administeredAt
                : administeredAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            administeredById: null == administeredById
                ? _value.administeredById
                : administeredById // ignore: cast_nullable_to_non_nullable
                      as String,
            administeredByName: null == administeredByName
                ? _value.administeredByName
                : administeredByName // ignore: cast_nullable_to_non_nullable
                      as String,
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$MedAdministrationImplCopyWith<$Res>
    implements $MedAdministrationCopyWith<$Res> {
  factory _$$MedAdministrationImplCopyWith(
    _$MedAdministrationImpl value,
    $Res Function(_$MedAdministrationImpl) then,
  ) = __$$MedAdministrationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    String prescribedMedId,
    String medicationName,
    String dose,
    AdminOutcome outcome,
    ShiftType shift,
    DateTime administeredAt,
    String administeredById,
    String administeredByName,
    String? reason,
    String? notes,
    String? createdById,
    String? updatedById,
    DateTime createdAt,
    DateTime updatedAt,
    bool isSynced,
  });
}

/// @nodoc
class __$$MedAdministrationImplCopyWithImpl<$Res>
    extends _$MedAdministrationCopyWithImpl<$Res, _$MedAdministrationImpl>
    implements _$$MedAdministrationImplCopyWith<$Res> {
  __$$MedAdministrationImplCopyWithImpl(
    _$MedAdministrationImpl _value,
    $Res Function(_$MedAdministrationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MedAdministration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? prescribedMedId = null,
    Object? medicationName = null,
    Object? dose = null,
    Object? outcome = null,
    Object? shift = null,
    Object? administeredAt = null,
    Object? administeredById = null,
    Object? administeredByName = null,
    Object? reason = freezed,
    Object? notes = freezed,
    Object? createdById = freezed,
    Object? updatedById = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isSynced = null,
  }) {
    return _then(
      _$MedAdministrationImpl(
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
        prescribedMedId: null == prescribedMedId
            ? _value.prescribedMedId
            : prescribedMedId // ignore: cast_nullable_to_non_nullable
                  as String,
        medicationName: null == medicationName
            ? _value.medicationName
            : medicationName // ignore: cast_nullable_to_non_nullable
                  as String,
        dose: null == dose
            ? _value.dose
            : dose // ignore: cast_nullable_to_non_nullable
                  as String,
        outcome: null == outcome
            ? _value.outcome
            : outcome // ignore: cast_nullable_to_non_nullable
                  as AdminOutcome,
        shift: null == shift
            ? _value.shift
            : shift // ignore: cast_nullable_to_non_nullable
                  as ShiftType,
        administeredAt: null == administeredAt
            ? _value.administeredAt
            : administeredAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        administeredById: null == administeredById
            ? _value.administeredById
            : administeredById // ignore: cast_nullable_to_non_nullable
                  as String,
        administeredByName: null == administeredByName
            ? _value.administeredByName
            : administeredByName // ignore: cast_nullable_to_non_nullable
                  as String,
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$MedAdministrationImpl implements _MedAdministration {
  const _$MedAdministrationImpl({
    required this.id,
    required this.homeId,
    required this.childId,
    required this.prescribedMedId,
    required this.medicationName,
    required this.dose,
    required this.outcome,
    required this.shift,
    required this.administeredAt,
    required this.administeredById,
    required this.administeredByName,
    this.reason,
    this.notes,
    this.createdById,
    this.updatedById,
    required this.createdAt,
    required this.updatedAt,
    this.isSynced = false,
  });

  factory _$MedAdministrationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedAdministrationImplFromJson(json);

  @override
  final String id;
  @override
  final String homeId;
  @override
  final String childId;
  @override
  final String prescribedMedId;
  @override
  final String medicationName;
  // denormalised for audit readability
  @override
  final String dose;
  @override
  final AdminOutcome outcome;
  @override
  final ShiftType shift;
  @override
  final DateTime administeredAt;
  @override
  final String administeredById;
  @override
  final String administeredByName;
  @override
  final String? reason;
  // required for refused/held and PRN; optional otherwise
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
    return 'MedAdministration(id: $id, homeId: $homeId, childId: $childId, prescribedMedId: $prescribedMedId, medicationName: $medicationName, dose: $dose, outcome: $outcome, shift: $shift, administeredAt: $administeredAt, administeredById: $administeredById, administeredByName: $administeredByName, reason: $reason, notes: $notes, createdById: $createdById, updatedById: $updatedById, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedAdministrationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.childId, childId) || other.childId == childId) &&
            (identical(other.prescribedMedId, prescribedMedId) ||
                other.prescribedMedId == prescribedMedId) &&
            (identical(other.medicationName, medicationName) ||
                other.medicationName == medicationName) &&
            (identical(other.dose, dose) || other.dose == dose) &&
            (identical(other.outcome, outcome) || other.outcome == outcome) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.administeredAt, administeredAt) ||
                other.administeredAt == administeredAt) &&
            (identical(other.administeredById, administeredById) ||
                other.administeredById == administeredById) &&
            (identical(other.administeredByName, administeredByName) ||
                other.administeredByName == administeredByName) &&
            (identical(other.reason, reason) || other.reason == reason) &&
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
    prescribedMedId,
    medicationName,
    dose,
    outcome,
    shift,
    administeredAt,
    administeredById,
    administeredByName,
    reason,
    notes,
    createdById,
    updatedById,
    createdAt,
    updatedAt,
    isSynced,
  );

  /// Create a copy of MedAdministration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedAdministrationImplCopyWith<_$MedAdministrationImpl> get copyWith =>
      __$$MedAdministrationImplCopyWithImpl<_$MedAdministrationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MedAdministrationImplToJson(this);
  }
}

abstract class _MedAdministration implements MedAdministration {
  const factory _MedAdministration({
    required final String id,
    required final String homeId,
    required final String childId,
    required final String prescribedMedId,
    required final String medicationName,
    required final String dose,
    required final AdminOutcome outcome,
    required final ShiftType shift,
    required final DateTime administeredAt,
    required final String administeredById,
    required final String administeredByName,
    final String? reason,
    final String? notes,
    final String? createdById,
    final String? updatedById,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final bool isSynced,
  }) = _$MedAdministrationImpl;

  factory _MedAdministration.fromJson(Map<String, dynamic> json) =
      _$MedAdministrationImpl.fromJson;

  @override
  String get id;
  @override
  String get homeId;
  @override
  String get childId;
  @override
  String get prescribedMedId;
  @override
  String get medicationName; // denormalised for audit readability
  @override
  String get dose;
  @override
  AdminOutcome get outcome;
  @override
  ShiftType get shift;
  @override
  DateTime get administeredAt;
  @override
  String get administeredById;
  @override
  String get administeredByName;
  @override
  String? get reason; // required for refused/held and PRN; optional otherwise
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

  /// Create a copy of MedAdministration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedAdministrationImplCopyWith<_$MedAdministrationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
