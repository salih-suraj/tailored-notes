// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inspector_feedback.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

InspectorFeedback _$InspectorFeedbackFromJson(Map<String, dynamic> json) {
  return _InspectorFeedback.fromJson(json);
}

/// @nodoc
mixin _$InspectorFeedback {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_id')
  String get homeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'inspector_user_id')
  String get inspectorUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'inspector_email')
  String get inspectorEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'child_id')
  String? get childId => throw _privateConstructorUsedError;
  @JsonKey(name: 'child_name')
  String? get childName => throw _privateConstructorUsedError;
  String get module => throw _privateConstructorUsedError;
  FeedbackSeverity get severity => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  FeedbackStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'resolved_at')
  DateTime? get resolvedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'resolved_by')
  String? get resolvedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'resolution_notes')
  String? get resolutionNotes => throw _privateConstructorUsedError;

  /// Serializes this InspectorFeedback to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InspectorFeedback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InspectorFeedbackCopyWith<InspectorFeedback> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InspectorFeedbackCopyWith<$Res> {
  factory $InspectorFeedbackCopyWith(
    InspectorFeedback value,
    $Res Function(InspectorFeedback) then,
  ) = _$InspectorFeedbackCopyWithImpl<$Res, InspectorFeedback>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'home_id') String homeId,
    @JsonKey(name: 'inspector_user_id') String inspectorUserId,
    @JsonKey(name: 'inspector_email') String inspectorEmail,
    @JsonKey(name: 'child_id') String? childId,
    @JsonKey(name: 'child_name') String? childName,
    String module,
    FeedbackSeverity severity,
    String content,
    FeedbackStatus status,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'resolved_at') DateTime? resolvedAt,
    @JsonKey(name: 'resolved_by') String? resolvedBy,
    @JsonKey(name: 'resolution_notes') String? resolutionNotes,
  });
}

/// @nodoc
class _$InspectorFeedbackCopyWithImpl<$Res, $Val extends InspectorFeedback>
    implements $InspectorFeedbackCopyWith<$Res> {
  _$InspectorFeedbackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InspectorFeedback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? inspectorUserId = null,
    Object? inspectorEmail = null,
    Object? childId = freezed,
    Object? childName = freezed,
    Object? module = null,
    Object? severity = null,
    Object? content = null,
    Object? status = null,
    Object? createdAt = null,
    Object? resolvedAt = freezed,
    Object? resolvedBy = freezed,
    Object? resolutionNotes = freezed,
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
            inspectorUserId: null == inspectorUserId
                ? _value.inspectorUserId
                : inspectorUserId // ignore: cast_nullable_to_non_nullable
                      as String,
            inspectorEmail: null == inspectorEmail
                ? _value.inspectorEmail
                : inspectorEmail // ignore: cast_nullable_to_non_nullable
                      as String,
            childId: freezed == childId
                ? _value.childId
                : childId // ignore: cast_nullable_to_non_nullable
                      as String?,
            childName: freezed == childName
                ? _value.childName
                : childName // ignore: cast_nullable_to_non_nullable
                      as String?,
            module: null == module
                ? _value.module
                : module // ignore: cast_nullable_to_non_nullable
                      as String,
            severity: null == severity
                ? _value.severity
                : severity // ignore: cast_nullable_to_non_nullable
                      as FeedbackSeverity,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as FeedbackStatus,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            resolvedAt: freezed == resolvedAt
                ? _value.resolvedAt
                : resolvedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            resolvedBy: freezed == resolvedBy
                ? _value.resolvedBy
                : resolvedBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            resolutionNotes: freezed == resolutionNotes
                ? _value.resolutionNotes
                : resolutionNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InspectorFeedbackImplCopyWith<$Res>
    implements $InspectorFeedbackCopyWith<$Res> {
  factory _$$InspectorFeedbackImplCopyWith(
    _$InspectorFeedbackImpl value,
    $Res Function(_$InspectorFeedbackImpl) then,
  ) = __$$InspectorFeedbackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'home_id') String homeId,
    @JsonKey(name: 'inspector_user_id') String inspectorUserId,
    @JsonKey(name: 'inspector_email') String inspectorEmail,
    @JsonKey(name: 'child_id') String? childId,
    @JsonKey(name: 'child_name') String? childName,
    String module,
    FeedbackSeverity severity,
    String content,
    FeedbackStatus status,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'resolved_at') DateTime? resolvedAt,
    @JsonKey(name: 'resolved_by') String? resolvedBy,
    @JsonKey(name: 'resolution_notes') String? resolutionNotes,
  });
}

/// @nodoc
class __$$InspectorFeedbackImplCopyWithImpl<$Res>
    extends _$InspectorFeedbackCopyWithImpl<$Res, _$InspectorFeedbackImpl>
    implements _$$InspectorFeedbackImplCopyWith<$Res> {
  __$$InspectorFeedbackImplCopyWithImpl(
    _$InspectorFeedbackImpl _value,
    $Res Function(_$InspectorFeedbackImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InspectorFeedback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? inspectorUserId = null,
    Object? inspectorEmail = null,
    Object? childId = freezed,
    Object? childName = freezed,
    Object? module = null,
    Object? severity = null,
    Object? content = null,
    Object? status = null,
    Object? createdAt = null,
    Object? resolvedAt = freezed,
    Object? resolvedBy = freezed,
    Object? resolutionNotes = freezed,
  }) {
    return _then(
      _$InspectorFeedbackImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        homeId: null == homeId
            ? _value.homeId
            : homeId // ignore: cast_nullable_to_non_nullable
                  as String,
        inspectorUserId: null == inspectorUserId
            ? _value.inspectorUserId
            : inspectorUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        inspectorEmail: null == inspectorEmail
            ? _value.inspectorEmail
            : inspectorEmail // ignore: cast_nullable_to_non_nullable
                  as String,
        childId: freezed == childId
            ? _value.childId
            : childId // ignore: cast_nullable_to_non_nullable
                  as String?,
        childName: freezed == childName
            ? _value.childName
            : childName // ignore: cast_nullable_to_non_nullable
                  as String?,
        module: null == module
            ? _value.module
            : module // ignore: cast_nullable_to_non_nullable
                  as String,
        severity: null == severity
            ? _value.severity
            : severity // ignore: cast_nullable_to_non_nullable
                  as FeedbackSeverity,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as FeedbackStatus,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        resolvedAt: freezed == resolvedAt
            ? _value.resolvedAt
            : resolvedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        resolvedBy: freezed == resolvedBy
            ? _value.resolvedBy
            : resolvedBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        resolutionNotes: freezed == resolutionNotes
            ? _value.resolutionNotes
            : resolutionNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InspectorFeedbackImpl implements _InspectorFeedback {
  const _$InspectorFeedbackImpl({
    required this.id,
    @JsonKey(name: 'home_id') required this.homeId,
    @JsonKey(name: 'inspector_user_id') required this.inspectorUserId,
    @JsonKey(name: 'inspector_email') required this.inspectorEmail,
    @JsonKey(name: 'child_id') this.childId,
    @JsonKey(name: 'child_name') this.childName,
    required this.module,
    required this.severity,
    required this.content,
    this.status = FeedbackStatus.open,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'resolved_at') this.resolvedAt,
    @JsonKey(name: 'resolved_by') this.resolvedBy,
    @JsonKey(name: 'resolution_notes') this.resolutionNotes,
  });

  factory _$InspectorFeedbackImpl.fromJson(Map<String, dynamic> json) =>
      _$$InspectorFeedbackImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'home_id')
  final String homeId;
  @override
  @JsonKey(name: 'inspector_user_id')
  final String inspectorUserId;
  @override
  @JsonKey(name: 'inspector_email')
  final String inspectorEmail;
  @override
  @JsonKey(name: 'child_id')
  final String? childId;
  @override
  @JsonKey(name: 'child_name')
  final String? childName;
  @override
  final String module;
  @override
  final FeedbackSeverity severity;
  @override
  final String content;
  @override
  @JsonKey()
  final FeedbackStatus status;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'resolved_at')
  final DateTime? resolvedAt;
  @override
  @JsonKey(name: 'resolved_by')
  final String? resolvedBy;
  @override
  @JsonKey(name: 'resolution_notes')
  final String? resolutionNotes;

  @override
  String toString() {
    return 'InspectorFeedback(id: $id, homeId: $homeId, inspectorUserId: $inspectorUserId, inspectorEmail: $inspectorEmail, childId: $childId, childName: $childName, module: $module, severity: $severity, content: $content, status: $status, createdAt: $createdAt, resolvedAt: $resolvedAt, resolvedBy: $resolvedBy, resolutionNotes: $resolutionNotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InspectorFeedbackImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.inspectorUserId, inspectorUserId) ||
                other.inspectorUserId == inspectorUserId) &&
            (identical(other.inspectorEmail, inspectorEmail) ||
                other.inspectorEmail == inspectorEmail) &&
            (identical(other.childId, childId) || other.childId == childId) &&
            (identical(other.childName, childName) ||
                other.childName == childName) &&
            (identical(other.module, module) || other.module == module) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.resolvedAt, resolvedAt) ||
                other.resolvedAt == resolvedAt) &&
            (identical(other.resolvedBy, resolvedBy) ||
                other.resolvedBy == resolvedBy) &&
            (identical(other.resolutionNotes, resolutionNotes) ||
                other.resolutionNotes == resolutionNotes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    homeId,
    inspectorUserId,
    inspectorEmail,
    childId,
    childName,
    module,
    severity,
    content,
    status,
    createdAt,
    resolvedAt,
    resolvedBy,
    resolutionNotes,
  );

  /// Create a copy of InspectorFeedback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InspectorFeedbackImplCopyWith<_$InspectorFeedbackImpl> get copyWith =>
      __$$InspectorFeedbackImplCopyWithImpl<_$InspectorFeedbackImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InspectorFeedbackImplToJson(this);
  }
}

abstract class _InspectorFeedback implements InspectorFeedback {
  const factory _InspectorFeedback({
    required final String id,
    @JsonKey(name: 'home_id') required final String homeId,
    @JsonKey(name: 'inspector_user_id') required final String inspectorUserId,
    @JsonKey(name: 'inspector_email') required final String inspectorEmail,
    @JsonKey(name: 'child_id') final String? childId,
    @JsonKey(name: 'child_name') final String? childName,
    required final String module,
    required final FeedbackSeverity severity,
    required final String content,
    final FeedbackStatus status,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'resolved_at') final DateTime? resolvedAt,
    @JsonKey(name: 'resolved_by') final String? resolvedBy,
    @JsonKey(name: 'resolution_notes') final String? resolutionNotes,
  }) = _$InspectorFeedbackImpl;

  factory _InspectorFeedback.fromJson(Map<String, dynamic> json) =
      _$InspectorFeedbackImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'home_id')
  String get homeId;
  @override
  @JsonKey(name: 'inspector_user_id')
  String get inspectorUserId;
  @override
  @JsonKey(name: 'inspector_email')
  String get inspectorEmail;
  @override
  @JsonKey(name: 'child_id')
  String? get childId;
  @override
  @JsonKey(name: 'child_name')
  String? get childName;
  @override
  String get module;
  @override
  FeedbackSeverity get severity;
  @override
  String get content;
  @override
  FeedbackStatus get status;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'resolved_at')
  DateTime? get resolvedAt;
  @override
  @JsonKey(name: 'resolved_by')
  String? get resolvedBy;
  @override
  @JsonKey(name: 'resolution_notes')
  String? get resolutionNotes;

  /// Create a copy of InspectorFeedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InspectorFeedbackImplCopyWith<_$InspectorFeedbackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
