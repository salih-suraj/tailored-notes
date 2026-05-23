// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

IncidentReport _$IncidentReportFromJson(Map<String, dynamic> json) {
  return _IncidentReport.fromJson(json);
}

/// @nodoc
mixin _$IncidentReport {
  String get id => throw _privateConstructorUsedError;
  String get homeId => throw _privateConstructorUsedError;
  String get childId => throw _privateConstructorUsedError;
  IncidentType get incidentType => throw _privateConstructorUsedError;
  IncidentSeverity get severity => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get occurredAt => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get immediateAction => throw _privateConstructorUsedError;
  String? get injuryDetails => throw _privateConstructorUsedError;
  bool get policeNotified => throw _privateConstructorUsedError;
  bool get parentNotified => throw _privateConstructorUsedError;
  bool get managerNotified => throw _privateConstructorUsedError;
  bool get followUpRequired => throw _privateConstructorUsedError;
  String? get followUpDetails => throw _privateConstructorUsedError;
  String get reportedById => throw _privateConstructorUsedError;
  String get reportedByName => throw _privateConstructorUsedError;
  String? get createdById => throw _privateConstructorUsedError;
  String? get updatedById => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isSynced => throw _privateConstructorUsedError;

  /// Serializes this IncidentReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IncidentReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IncidentReportCopyWith<IncidentReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncidentReportCopyWith<$Res> {
  factory $IncidentReportCopyWith(
    IncidentReport value,
    $Res Function(IncidentReport) then,
  ) = _$IncidentReportCopyWithImpl<$Res, IncidentReport>;
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    IncidentType incidentType,
    IncidentSeverity severity,
    String title,
    DateTime occurredAt,
    String? location,
    String description,
    String immediateAction,
    String? injuryDetails,
    bool policeNotified,
    bool parentNotified,
    bool managerNotified,
    bool followUpRequired,
    String? followUpDetails,
    String reportedById,
    String reportedByName,
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    DateTime createdAt,
    DateTime updatedAt,
    bool isSynced,
  });
}

/// @nodoc
class _$IncidentReportCopyWithImpl<$Res, $Val extends IncidentReport>
    implements $IncidentReportCopyWith<$Res> {
  _$IncidentReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IncidentReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? incidentType = null,
    Object? severity = null,
    Object? title = null,
    Object? occurredAt = null,
    Object? location = freezed,
    Object? description = null,
    Object? immediateAction = null,
    Object? injuryDetails = freezed,
    Object? policeNotified = null,
    Object? parentNotified = null,
    Object? managerNotified = null,
    Object? followUpRequired = null,
    Object? followUpDetails = freezed,
    Object? reportedById = null,
    Object? reportedByName = null,
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
            incidentType: null == incidentType
                ? _value.incidentType
                : incidentType // ignore: cast_nullable_to_non_nullable
                      as IncidentType,
            severity: null == severity
                ? _value.severity
                : severity // ignore: cast_nullable_to_non_nullable
                      as IncidentSeverity,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            occurredAt: null == occurredAt
                ? _value.occurredAt
                : occurredAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            immediateAction: null == immediateAction
                ? _value.immediateAction
                : immediateAction // ignore: cast_nullable_to_non_nullable
                      as String,
            injuryDetails: freezed == injuryDetails
                ? _value.injuryDetails
                : injuryDetails // ignore: cast_nullable_to_non_nullable
                      as String?,
            policeNotified: null == policeNotified
                ? _value.policeNotified
                : policeNotified // ignore: cast_nullable_to_non_nullable
                      as bool,
            parentNotified: null == parentNotified
                ? _value.parentNotified
                : parentNotified // ignore: cast_nullable_to_non_nullable
                      as bool,
            managerNotified: null == managerNotified
                ? _value.managerNotified
                : managerNotified // ignore: cast_nullable_to_non_nullable
                      as bool,
            followUpRequired: null == followUpRequired
                ? _value.followUpRequired
                : followUpRequired // ignore: cast_nullable_to_non_nullable
                      as bool,
            followUpDetails: freezed == followUpDetails
                ? _value.followUpDetails
                : followUpDetails // ignore: cast_nullable_to_non_nullable
                      as String?,
            reportedById: null == reportedById
                ? _value.reportedById
                : reportedById // ignore: cast_nullable_to_non_nullable
                      as String,
            reportedByName: null == reportedByName
                ? _value.reportedByName
                : reportedByName // ignore: cast_nullable_to_non_nullable
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
abstract class _$$IncidentReportImplCopyWith<$Res>
    implements $IncidentReportCopyWith<$Res> {
  factory _$$IncidentReportImplCopyWith(
    _$IncidentReportImpl value,
    $Res Function(_$IncidentReportImpl) then,
  ) = __$$IncidentReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    IncidentType incidentType,
    IncidentSeverity severity,
    String title,
    DateTime occurredAt,
    String? location,
    String description,
    String immediateAction,
    String? injuryDetails,
    bool policeNotified,
    bool parentNotified,
    bool managerNotified,
    bool followUpRequired,
    String? followUpDetails,
    String reportedById,
    String reportedByName,
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    DateTime createdAt,
    DateTime updatedAt,
    bool isSynced,
  });
}

/// @nodoc
class __$$IncidentReportImplCopyWithImpl<$Res>
    extends _$IncidentReportCopyWithImpl<$Res, _$IncidentReportImpl>
    implements _$$IncidentReportImplCopyWith<$Res> {
  __$$IncidentReportImplCopyWithImpl(
    _$IncidentReportImpl _value,
    $Res Function(_$IncidentReportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IncidentReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? incidentType = null,
    Object? severity = null,
    Object? title = null,
    Object? occurredAt = null,
    Object? location = freezed,
    Object? description = null,
    Object? immediateAction = null,
    Object? injuryDetails = freezed,
    Object? policeNotified = null,
    Object? parentNotified = null,
    Object? managerNotified = null,
    Object? followUpRequired = null,
    Object? followUpDetails = freezed,
    Object? reportedById = null,
    Object? reportedByName = null,
    Object? createdById = freezed,
    Object? updatedById = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isSynced = null,
  }) {
    return _then(
      _$IncidentReportImpl(
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
        incidentType: null == incidentType
            ? _value.incidentType
            : incidentType // ignore: cast_nullable_to_non_nullable
                  as IncidentType,
        severity: null == severity
            ? _value.severity
            : severity // ignore: cast_nullable_to_non_nullable
                  as IncidentSeverity,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        occurredAt: null == occurredAt
            ? _value.occurredAt
            : occurredAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        immediateAction: null == immediateAction
            ? _value.immediateAction
            : immediateAction // ignore: cast_nullable_to_non_nullable
                  as String,
        injuryDetails: freezed == injuryDetails
            ? _value.injuryDetails
            : injuryDetails // ignore: cast_nullable_to_non_nullable
                  as String?,
        policeNotified: null == policeNotified
            ? _value.policeNotified
            : policeNotified // ignore: cast_nullable_to_non_nullable
                  as bool,
        parentNotified: null == parentNotified
            ? _value.parentNotified
            : parentNotified // ignore: cast_nullable_to_non_nullable
                  as bool,
        managerNotified: null == managerNotified
            ? _value.managerNotified
            : managerNotified // ignore: cast_nullable_to_non_nullable
                  as bool,
        followUpRequired: null == followUpRequired
            ? _value.followUpRequired
            : followUpRequired // ignore: cast_nullable_to_non_nullable
                  as bool,
        followUpDetails: freezed == followUpDetails
            ? _value.followUpDetails
            : followUpDetails // ignore: cast_nullable_to_non_nullable
                  as String?,
        reportedById: null == reportedById
            ? _value.reportedById
            : reportedById // ignore: cast_nullable_to_non_nullable
                  as String,
        reportedByName: null == reportedByName
            ? _value.reportedByName
            : reportedByName // ignore: cast_nullable_to_non_nullable
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
class _$IncidentReportImpl implements _IncidentReport {
  const _$IncidentReportImpl({
    required this.id,
    required this.homeId,
    required this.childId,
    required this.incidentType,
    required this.severity,
    required this.title,
    required this.occurredAt,
    this.location,
    required this.description,
    required this.immediateAction,
    this.injuryDetails,
    this.policeNotified = false,
    this.parentNotified = false,
    this.managerNotified = false,
    this.followUpRequired = false,
    this.followUpDetails,
    required this.reportedById,
    required this.reportedByName,
    this.createdById,
    this.updatedById,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    this.isSynced = false,
  });

  factory _$IncidentReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$IncidentReportImplFromJson(json);

  @override
  final String id;
  @override
  final String homeId;
  @override
  final String childId;
  @override
  final IncidentType incidentType;
  @override
  final IncidentSeverity severity;
  @override
  final String title;
  @override
  final DateTime occurredAt;
  @override
  final String? location;
  @override
  final String description;
  @override
  final String immediateAction;
  @override
  final String? injuryDetails;
  @override
  @JsonKey()
  final bool policeNotified;
  @override
  @JsonKey()
  final bool parentNotified;
  @override
  @JsonKey()
  final bool managerNotified;
  @override
  @JsonKey()
  final bool followUpRequired;
  @override
  final String? followUpDetails;
  @override
  final String reportedById;
  @override
  final String reportedByName;
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
    return 'IncidentReport(id: $id, homeId: $homeId, childId: $childId, incidentType: $incidentType, severity: $severity, title: $title, occurredAt: $occurredAt, location: $location, description: $description, immediateAction: $immediateAction, injuryDetails: $injuryDetails, policeNotified: $policeNotified, parentNotified: $parentNotified, managerNotified: $managerNotified, followUpRequired: $followUpRequired, followUpDetails: $followUpDetails, reportedById: $reportedById, reportedByName: $reportedByName, createdById: $createdById, updatedById: $updatedById, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncidentReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.childId, childId) || other.childId == childId) &&
            (identical(other.incidentType, incidentType) ||
                other.incidentType == incidentType) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.occurredAt, occurredAt) ||
                other.occurredAt == occurredAt) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.immediateAction, immediateAction) ||
                other.immediateAction == immediateAction) &&
            (identical(other.injuryDetails, injuryDetails) ||
                other.injuryDetails == injuryDetails) &&
            (identical(other.policeNotified, policeNotified) ||
                other.policeNotified == policeNotified) &&
            (identical(other.parentNotified, parentNotified) ||
                other.parentNotified == parentNotified) &&
            (identical(other.managerNotified, managerNotified) ||
                other.managerNotified == managerNotified) &&
            (identical(other.followUpRequired, followUpRequired) ||
                other.followUpRequired == followUpRequired) &&
            (identical(other.followUpDetails, followUpDetails) ||
                other.followUpDetails == followUpDetails) &&
            (identical(other.reportedById, reportedById) ||
                other.reportedById == reportedById) &&
            (identical(other.reportedByName, reportedByName) ||
                other.reportedByName == reportedByName) &&
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
    incidentType,
    severity,
    title,
    occurredAt,
    location,
    description,
    immediateAction,
    injuryDetails,
    policeNotified,
    parentNotified,
    managerNotified,
    followUpRequired,
    followUpDetails,
    reportedById,
    reportedByName,
    createdById,
    updatedById,
    deletedAt,
    createdAt,
    updatedAt,
    isSynced,
  ]);

  /// Create a copy of IncidentReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IncidentReportImplCopyWith<_$IncidentReportImpl> get copyWith =>
      __$$IncidentReportImplCopyWithImpl<_$IncidentReportImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$IncidentReportImplToJson(this);
  }
}

abstract class _IncidentReport implements IncidentReport {
  const factory _IncidentReport({
    required final String id,
    required final String homeId,
    required final String childId,
    required final IncidentType incidentType,
    required final IncidentSeverity severity,
    required final String title,
    required final DateTime occurredAt,
    final String? location,
    required final String description,
    required final String immediateAction,
    final String? injuryDetails,
    final bool policeNotified,
    final bool parentNotified,
    final bool managerNotified,
    final bool followUpRequired,
    final String? followUpDetails,
    required final String reportedById,
    required final String reportedByName,
    final String? createdById,
    final String? updatedById,
    final DateTime? deletedAt,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final bool isSynced,
  }) = _$IncidentReportImpl;

  factory _IncidentReport.fromJson(Map<String, dynamic> json) =
      _$IncidentReportImpl.fromJson;

  @override
  String get id;
  @override
  String get homeId;
  @override
  String get childId;
  @override
  IncidentType get incidentType;
  @override
  IncidentSeverity get severity;
  @override
  String get title;
  @override
  DateTime get occurredAt;
  @override
  String? get location;
  @override
  String get description;
  @override
  String get immediateAction;
  @override
  String? get injuryDetails;
  @override
  bool get policeNotified;
  @override
  bool get parentNotified;
  @override
  bool get managerNotified;
  @override
  bool get followUpRequired;
  @override
  String? get followUpDetails;
  @override
  String get reportedById;
  @override
  String get reportedByName;
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

  /// Create a copy of IncidentReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IncidentReportImplCopyWith<_$IncidentReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
