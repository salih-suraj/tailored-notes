// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medical_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MedicalProfile _$MedicalProfileFromJson(Map<String, dynamic> json) {
  return _MedicalProfile.fromJson(json);
}

/// @nodoc
mixin _$MedicalProfile {
  String get id => throw _privateConstructorUsedError;
  String get homeId => throw _privateConstructorUsedError;
  String get childId => throw _privateConstructorUsedError;
  String? get nhsNumber => throw _privateConstructorUsedError;
  String? get bloodType => throw _privateConstructorUsedError;

  /// Free-text list of diagnoses and conditions (e.g. "ASD, ADHD, Epilepsy")
  String? get conditions => throw _privateConstructorUsedError;

  /// Free-text allergies and adverse reactions — treated as critical information
  String? get allergies => throw _privateConstructorUsedError;
  String? get immunisationNotes => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get createdById => throw _privateConstructorUsedError;
  String? get updatedById => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isSynced => throw _privateConstructorUsedError;

  /// Serializes this MedicalProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MedicalProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicalProfileCopyWith<MedicalProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicalProfileCopyWith<$Res> {
  factory $MedicalProfileCopyWith(
    MedicalProfile value,
    $Res Function(MedicalProfile) then,
  ) = _$MedicalProfileCopyWithImpl<$Res, MedicalProfile>;
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    String? nhsNumber,
    String? bloodType,
    String? conditions,
    String? allergies,
    String? immunisationNotes,
    String? notes,
    String? createdById,
    String? updatedById,
    DateTime createdAt,
    DateTime updatedAt,
    bool isSynced,
  });
}

/// @nodoc
class _$MedicalProfileCopyWithImpl<$Res, $Val extends MedicalProfile>
    implements $MedicalProfileCopyWith<$Res> {
  _$MedicalProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicalProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? nhsNumber = freezed,
    Object? bloodType = freezed,
    Object? conditions = freezed,
    Object? allergies = freezed,
    Object? immunisationNotes = freezed,
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
            nhsNumber: freezed == nhsNumber
                ? _value.nhsNumber
                : nhsNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            bloodType: freezed == bloodType
                ? _value.bloodType
                : bloodType // ignore: cast_nullable_to_non_nullable
                      as String?,
            conditions: freezed == conditions
                ? _value.conditions
                : conditions // ignore: cast_nullable_to_non_nullable
                      as String?,
            allergies: freezed == allergies
                ? _value.allergies
                : allergies // ignore: cast_nullable_to_non_nullable
                      as String?,
            immunisationNotes: freezed == immunisationNotes
                ? _value.immunisationNotes
                : immunisationNotes // ignore: cast_nullable_to_non_nullable
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
abstract class _$$MedicalProfileImplCopyWith<$Res>
    implements $MedicalProfileCopyWith<$Res> {
  factory _$$MedicalProfileImplCopyWith(
    _$MedicalProfileImpl value,
    $Res Function(_$MedicalProfileImpl) then,
  ) = __$$MedicalProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    String? nhsNumber,
    String? bloodType,
    String? conditions,
    String? allergies,
    String? immunisationNotes,
    String? notes,
    String? createdById,
    String? updatedById,
    DateTime createdAt,
    DateTime updatedAt,
    bool isSynced,
  });
}

/// @nodoc
class __$$MedicalProfileImplCopyWithImpl<$Res>
    extends _$MedicalProfileCopyWithImpl<$Res, _$MedicalProfileImpl>
    implements _$$MedicalProfileImplCopyWith<$Res> {
  __$$MedicalProfileImplCopyWithImpl(
    _$MedicalProfileImpl _value,
    $Res Function(_$MedicalProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MedicalProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? nhsNumber = freezed,
    Object? bloodType = freezed,
    Object? conditions = freezed,
    Object? allergies = freezed,
    Object? immunisationNotes = freezed,
    Object? notes = freezed,
    Object? createdById = freezed,
    Object? updatedById = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isSynced = null,
  }) {
    return _then(
      _$MedicalProfileImpl(
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
        nhsNumber: freezed == nhsNumber
            ? _value.nhsNumber
            : nhsNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        bloodType: freezed == bloodType
            ? _value.bloodType
            : bloodType // ignore: cast_nullable_to_non_nullable
                  as String?,
        conditions: freezed == conditions
            ? _value.conditions
            : conditions // ignore: cast_nullable_to_non_nullable
                  as String?,
        allergies: freezed == allergies
            ? _value.allergies
            : allergies // ignore: cast_nullable_to_non_nullable
                  as String?,
        immunisationNotes: freezed == immunisationNotes
            ? _value.immunisationNotes
            : immunisationNotes // ignore: cast_nullable_to_non_nullable
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
class _$MedicalProfileImpl implements _MedicalProfile {
  const _$MedicalProfileImpl({
    required this.id,
    required this.homeId,
    required this.childId,
    this.nhsNumber,
    this.bloodType,
    this.conditions,
    this.allergies,
    this.immunisationNotes,
    this.notes,
    this.createdById,
    this.updatedById,
    required this.createdAt,
    required this.updatedAt,
    this.isSynced = false,
  });

  factory _$MedicalProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicalProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String homeId;
  @override
  final String childId;
  @override
  final String? nhsNumber;
  @override
  final String? bloodType;

  /// Free-text list of diagnoses and conditions (e.g. "ASD, ADHD, Epilepsy")
  @override
  final String? conditions;

  /// Free-text allergies and adverse reactions — treated as critical information
  @override
  final String? allergies;
  @override
  final String? immunisationNotes;
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
    return 'MedicalProfile(id: $id, homeId: $homeId, childId: $childId, nhsNumber: $nhsNumber, bloodType: $bloodType, conditions: $conditions, allergies: $allergies, immunisationNotes: $immunisationNotes, notes: $notes, createdById: $createdById, updatedById: $updatedById, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicalProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.childId, childId) || other.childId == childId) &&
            (identical(other.nhsNumber, nhsNumber) ||
                other.nhsNumber == nhsNumber) &&
            (identical(other.bloodType, bloodType) ||
                other.bloodType == bloodType) &&
            (identical(other.conditions, conditions) ||
                other.conditions == conditions) &&
            (identical(other.allergies, allergies) ||
                other.allergies == allergies) &&
            (identical(other.immunisationNotes, immunisationNotes) ||
                other.immunisationNotes == immunisationNotes) &&
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
    nhsNumber,
    bloodType,
    conditions,
    allergies,
    immunisationNotes,
    notes,
    createdById,
    updatedById,
    createdAt,
    updatedAt,
    isSynced,
  );

  /// Create a copy of MedicalProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicalProfileImplCopyWith<_$MedicalProfileImpl> get copyWith =>
      __$$MedicalProfileImplCopyWithImpl<_$MedicalProfileImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicalProfileImplToJson(this);
  }
}

abstract class _MedicalProfile implements MedicalProfile {
  const factory _MedicalProfile({
    required final String id,
    required final String homeId,
    required final String childId,
    final String? nhsNumber,
    final String? bloodType,
    final String? conditions,
    final String? allergies,
    final String? immunisationNotes,
    final String? notes,
    final String? createdById,
    final String? updatedById,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final bool isSynced,
  }) = _$MedicalProfileImpl;

  factory _MedicalProfile.fromJson(Map<String, dynamic> json) =
      _$MedicalProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get homeId;
  @override
  String get childId;
  @override
  String? get nhsNumber;
  @override
  String? get bloodType;

  /// Free-text list of diagnoses and conditions (e.g. "ASD, ADHD, Epilepsy")
  @override
  String? get conditions;

  /// Free-text allergies and adverse reactions — treated as critical information
  @override
  String? get allergies;
  @override
  String? get immunisationNotes;
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

  /// Create a copy of MedicalProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicalProfileImplCopyWith<_$MedicalProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
