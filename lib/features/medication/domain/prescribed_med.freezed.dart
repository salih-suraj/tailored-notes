// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescribed_med.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PrescribedMed _$PrescribedMedFromJson(Map<String, dynamic> json) {
  return _PrescribedMed.fromJson(json);
}

/// @nodoc
mixin _$PrescribedMed {
  String get id => throw _privateConstructorUsedError;
  String get homeId => throw _privateConstructorUsedError;
  String get childId => throw _privateConstructorUsedError;
  String get medicationName => throw _privateConstructorUsedError;
  String get dose => throw _privateConstructorUsedError;
  MedRoute get route => throw _privateConstructorUsedError;
  MedFrequency get frequency => throw _privateConstructorUsedError;
  String? get instructions => throw _privateConstructorUsedError;
  String? get prescribedBy => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError; // 'YYYY-MM-DD'
  String? get endDate =>
      throw _privateConstructorUsedError; // 'YYYY-MM-DD' — null means ongoing
  bool get isActive => throw _privateConstructorUsedError;
  String? get createdById => throw _privateConstructorUsedError;
  String? get updatedById => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isSynced => throw _privateConstructorUsedError;

  /// Serializes this PrescribedMed to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrescribedMed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrescribedMedCopyWith<PrescribedMed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescribedMedCopyWith<$Res> {
  factory $PrescribedMedCopyWith(
    PrescribedMed value,
    $Res Function(PrescribedMed) then,
  ) = _$PrescribedMedCopyWithImpl<$Res, PrescribedMed>;
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    String medicationName,
    String dose,
    MedRoute route,
    MedFrequency frequency,
    String? instructions,
    String? prescribedBy,
    String startDate,
    String? endDate,
    bool isActive,
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    DateTime createdAt,
    DateTime updatedAt,
    bool isSynced,
  });
}

/// @nodoc
class _$PrescribedMedCopyWithImpl<$Res, $Val extends PrescribedMed>
    implements $PrescribedMedCopyWith<$Res> {
  _$PrescribedMedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrescribedMed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? medicationName = null,
    Object? dose = null,
    Object? route = null,
    Object? frequency = null,
    Object? instructions = freezed,
    Object? prescribedBy = freezed,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? isActive = null,
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
            medicationName: null == medicationName
                ? _value.medicationName
                : medicationName // ignore: cast_nullable_to_non_nullable
                      as String,
            dose: null == dose
                ? _value.dose
                : dose // ignore: cast_nullable_to_non_nullable
                      as String,
            route: null == route
                ? _value.route
                : route // ignore: cast_nullable_to_non_nullable
                      as MedRoute,
            frequency: null == frequency
                ? _value.frequency
                : frequency // ignore: cast_nullable_to_non_nullable
                      as MedFrequency,
            instructions: freezed == instructions
                ? _value.instructions
                : instructions // ignore: cast_nullable_to_non_nullable
                      as String?,
            prescribedBy: freezed == prescribedBy
                ? _value.prescribedBy
                : prescribedBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as String,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$PrescribedMedImplCopyWith<$Res>
    implements $PrescribedMedCopyWith<$Res> {
  factory _$$PrescribedMedImplCopyWith(
    _$PrescribedMedImpl value,
    $Res Function(_$PrescribedMedImpl) then,
  ) = __$$PrescribedMedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    String medicationName,
    String dose,
    MedRoute route,
    MedFrequency frequency,
    String? instructions,
    String? prescribedBy,
    String startDate,
    String? endDate,
    bool isActive,
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    DateTime createdAt,
    DateTime updatedAt,
    bool isSynced,
  });
}

/// @nodoc
class __$$PrescribedMedImplCopyWithImpl<$Res>
    extends _$PrescribedMedCopyWithImpl<$Res, _$PrescribedMedImpl>
    implements _$$PrescribedMedImplCopyWith<$Res> {
  __$$PrescribedMedImplCopyWithImpl(
    _$PrescribedMedImpl _value,
    $Res Function(_$PrescribedMedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PrescribedMed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? medicationName = null,
    Object? dose = null,
    Object? route = null,
    Object? frequency = null,
    Object? instructions = freezed,
    Object? prescribedBy = freezed,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? isActive = null,
    Object? createdById = freezed,
    Object? updatedById = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isSynced = null,
  }) {
    return _then(
      _$PrescribedMedImpl(
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
        medicationName: null == medicationName
            ? _value.medicationName
            : medicationName // ignore: cast_nullable_to_non_nullable
                  as String,
        dose: null == dose
            ? _value.dose
            : dose // ignore: cast_nullable_to_non_nullable
                  as String,
        route: null == route
            ? _value.route
            : route // ignore: cast_nullable_to_non_nullable
                  as MedRoute,
        frequency: null == frequency
            ? _value.frequency
            : frequency // ignore: cast_nullable_to_non_nullable
                  as MedFrequency,
        instructions: freezed == instructions
            ? _value.instructions
            : instructions // ignore: cast_nullable_to_non_nullable
                  as String?,
        prescribedBy: freezed == prescribedBy
            ? _value.prescribedBy
            : prescribedBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as String,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$PrescribedMedImpl implements _PrescribedMed {
  const _$PrescribedMedImpl({
    required this.id,
    required this.homeId,
    required this.childId,
    required this.medicationName,
    required this.dose,
    required this.route,
    required this.frequency,
    this.instructions,
    this.prescribedBy,
    required this.startDate,
    this.endDate,
    this.isActive = true,
    this.createdById,
    this.updatedById,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    this.isSynced = false,
  });

  factory _$PrescribedMedImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrescribedMedImplFromJson(json);

  @override
  final String id;
  @override
  final String homeId;
  @override
  final String childId;
  @override
  final String medicationName;
  @override
  final String dose;
  @override
  final MedRoute route;
  @override
  final MedFrequency frequency;
  @override
  final String? instructions;
  @override
  final String? prescribedBy;
  @override
  final String startDate;
  // 'YYYY-MM-DD'
  @override
  final String? endDate;
  // 'YYYY-MM-DD' — null means ongoing
  @override
  @JsonKey()
  final bool isActive;
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
    return 'PrescribedMed(id: $id, homeId: $homeId, childId: $childId, medicationName: $medicationName, dose: $dose, route: $route, frequency: $frequency, instructions: $instructions, prescribedBy: $prescribedBy, startDate: $startDate, endDate: $endDate, isActive: $isActive, createdById: $createdById, updatedById: $updatedById, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrescribedMedImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.childId, childId) || other.childId == childId) &&
            (identical(other.medicationName, medicationName) ||
                other.medicationName == medicationName) &&
            (identical(other.dose, dose) || other.dose == dose) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            (identical(other.prescribedBy, prescribedBy) ||
                other.prescribedBy == prescribedBy) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
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
    childId,
    medicationName,
    dose,
    route,
    frequency,
    instructions,
    prescribedBy,
    startDate,
    endDate,
    isActive,
    createdById,
    updatedById,
    deletedAt,
    createdAt,
    updatedAt,
    isSynced,
  );

  /// Create a copy of PrescribedMed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrescribedMedImplCopyWith<_$PrescribedMedImpl> get copyWith =>
      __$$PrescribedMedImplCopyWithImpl<_$PrescribedMedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrescribedMedImplToJson(this);
  }
}

abstract class _PrescribedMed implements PrescribedMed {
  const factory _PrescribedMed({
    required final String id,
    required final String homeId,
    required final String childId,
    required final String medicationName,
    required final String dose,
    required final MedRoute route,
    required final MedFrequency frequency,
    final String? instructions,
    final String? prescribedBy,
    required final String startDate,
    final String? endDate,
    final bool isActive,
    final String? createdById,
    final String? updatedById,
    final DateTime? deletedAt,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final bool isSynced,
  }) = _$PrescribedMedImpl;

  factory _PrescribedMed.fromJson(Map<String, dynamic> json) =
      _$PrescribedMedImpl.fromJson;

  @override
  String get id;
  @override
  String get homeId;
  @override
  String get childId;
  @override
  String get medicationName;
  @override
  String get dose;
  @override
  MedRoute get route;
  @override
  MedFrequency get frequency;
  @override
  String? get instructions;
  @override
  String? get prescribedBy;
  @override
  String get startDate; // 'YYYY-MM-DD'
  @override
  String? get endDate; // 'YYYY-MM-DD' — null means ongoing
  @override
  bool get isActive;
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

  /// Create a copy of PrescribedMed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrescribedMedImplCopyWith<_$PrescribedMedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
