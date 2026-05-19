// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'care_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CarePlan _$CarePlanFromJson(Map<String, dynamic> json) {
  return _CarePlan.fromJson(json);
}

/// @nodoc
mixin _$CarePlan {
  String get id => throw _privateConstructorUsedError;
  String get homeId => throw _privateConstructorUsedError;
  String get childId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  CarePlanStatus get status => throw _privateConstructorUsedError;
  String? get reviewDate => throw _privateConstructorUsedError; // 'YYYY-MM-DD'
  String? get notes => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String get authorName => throw _privateConstructorUsedError;
  String? get approvedById => throw _privateConstructorUsedError;
  String? get approvedByName => throw _privateConstructorUsedError;
  DateTime? get approvedAt => throw _privateConstructorUsedError;
  String? get createdById => throw _privateConstructorUsedError;
  String? get updatedById => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isSynced => throw _privateConstructorUsedError;

  /// Serializes this CarePlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarePlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarePlanCopyWith<CarePlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarePlanCopyWith<$Res> {
  factory $CarePlanCopyWith(CarePlan value, $Res Function(CarePlan) then) =
      _$CarePlanCopyWithImpl<$Res, CarePlan>;
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    String title,
    CarePlanStatus status,
    String? reviewDate,
    String? notes,
    String authorId,
    String authorName,
    String? approvedById,
    String? approvedByName,
    DateTime? approvedAt,
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    DateTime createdAt,
    DateTime updatedAt,
    bool isSynced,
  });
}

/// @nodoc
class _$CarePlanCopyWithImpl<$Res, $Val extends CarePlan>
    implements $CarePlanCopyWith<$Res> {
  _$CarePlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarePlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? title = null,
    Object? status = null,
    Object? reviewDate = freezed,
    Object? notes = freezed,
    Object? authorId = null,
    Object? authorName = null,
    Object? approvedById = freezed,
    Object? approvedByName = freezed,
    Object? approvedAt = freezed,
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
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as CarePlanStatus,
            reviewDate: freezed == reviewDate
                ? _value.reviewDate
                : reviewDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            authorId: null == authorId
                ? _value.authorId
                : authorId // ignore: cast_nullable_to_non_nullable
                      as String,
            authorName: null == authorName
                ? _value.authorName
                : authorName // ignore: cast_nullable_to_non_nullable
                      as String,
            approvedById: freezed == approvedById
                ? _value.approvedById
                : approvedById // ignore: cast_nullable_to_non_nullable
                      as String?,
            approvedByName: freezed == approvedByName
                ? _value.approvedByName
                : approvedByName // ignore: cast_nullable_to_non_nullable
                      as String?,
            approvedAt: freezed == approvedAt
                ? _value.approvedAt
                : approvedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
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
abstract class _$$CarePlanImplCopyWith<$Res>
    implements $CarePlanCopyWith<$Res> {
  factory _$$CarePlanImplCopyWith(
    _$CarePlanImpl value,
    $Res Function(_$CarePlanImpl) then,
  ) = __$$CarePlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    String title,
    CarePlanStatus status,
    String? reviewDate,
    String? notes,
    String authorId,
    String authorName,
    String? approvedById,
    String? approvedByName,
    DateTime? approvedAt,
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    DateTime createdAt,
    DateTime updatedAt,
    bool isSynced,
  });
}

/// @nodoc
class __$$CarePlanImplCopyWithImpl<$Res>
    extends _$CarePlanCopyWithImpl<$Res, _$CarePlanImpl>
    implements _$$CarePlanImplCopyWith<$Res> {
  __$$CarePlanImplCopyWithImpl(
    _$CarePlanImpl _value,
    $Res Function(_$CarePlanImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CarePlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? title = null,
    Object? status = null,
    Object? reviewDate = freezed,
    Object? notes = freezed,
    Object? authorId = null,
    Object? authorName = null,
    Object? approvedById = freezed,
    Object? approvedByName = freezed,
    Object? approvedAt = freezed,
    Object? createdById = freezed,
    Object? updatedById = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isSynced = null,
  }) {
    return _then(
      _$CarePlanImpl(
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
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as CarePlanStatus,
        reviewDate: freezed == reviewDate
            ? _value.reviewDate
            : reviewDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        authorId: null == authorId
            ? _value.authorId
            : authorId // ignore: cast_nullable_to_non_nullable
                  as String,
        authorName: null == authorName
            ? _value.authorName
            : authorName // ignore: cast_nullable_to_non_nullable
                  as String,
        approvedById: freezed == approvedById
            ? _value.approvedById
            : approvedById // ignore: cast_nullable_to_non_nullable
                  as String?,
        approvedByName: freezed == approvedByName
            ? _value.approvedByName
            : approvedByName // ignore: cast_nullable_to_non_nullable
                  as String?,
        approvedAt: freezed == approvedAt
            ? _value.approvedAt
            : approvedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
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
class _$CarePlanImpl implements _CarePlan {
  const _$CarePlanImpl({
    required this.id,
    required this.homeId,
    required this.childId,
    required this.title,
    required this.status,
    this.reviewDate,
    this.notes,
    required this.authorId,
    required this.authorName,
    this.approvedById,
    this.approvedByName,
    this.approvedAt,
    this.createdById,
    this.updatedById,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    this.isSynced = false,
  });

  factory _$CarePlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarePlanImplFromJson(json);

  @override
  final String id;
  @override
  final String homeId;
  @override
  final String childId;
  @override
  final String title;
  @override
  final CarePlanStatus status;
  @override
  final String? reviewDate;
  // 'YYYY-MM-DD'
  @override
  final String? notes;
  @override
  final String authorId;
  @override
  final String authorName;
  @override
  final String? approvedById;
  @override
  final String? approvedByName;
  @override
  final DateTime? approvedAt;
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
    return 'CarePlan(id: $id, homeId: $homeId, childId: $childId, title: $title, status: $status, reviewDate: $reviewDate, notes: $notes, authorId: $authorId, authorName: $authorName, approvedById: $approvedById, approvedByName: $approvedByName, approvedAt: $approvedAt, createdById: $createdById, updatedById: $updatedById, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarePlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.childId, childId) || other.childId == childId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reviewDate, reviewDate) ||
                other.reviewDate == reviewDate) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.approvedById, approvedById) ||
                other.approvedById == approvedById) &&
            (identical(other.approvedByName, approvedByName) ||
                other.approvedByName == approvedByName) &&
            (identical(other.approvedAt, approvedAt) ||
                other.approvedAt == approvedAt) &&
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
    title,
    status,
    reviewDate,
    notes,
    authorId,
    authorName,
    approvedById,
    approvedByName,
    approvedAt,
    createdById,
    updatedById,
    deletedAt,
    createdAt,
    updatedAt,
    isSynced,
  );

  /// Create a copy of CarePlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarePlanImplCopyWith<_$CarePlanImpl> get copyWith =>
      __$$CarePlanImplCopyWithImpl<_$CarePlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarePlanImplToJson(this);
  }
}

abstract class _CarePlan implements CarePlan {
  const factory _CarePlan({
    required final String id,
    required final String homeId,
    required final String childId,
    required final String title,
    required final CarePlanStatus status,
    final String? reviewDate,
    final String? notes,
    required final String authorId,
    required final String authorName,
    final String? approvedById,
    final String? approvedByName,
    final DateTime? approvedAt,
    final String? createdById,
    final String? updatedById,
    final DateTime? deletedAt,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final bool isSynced,
  }) = _$CarePlanImpl;

  factory _CarePlan.fromJson(Map<String, dynamic> json) =
      _$CarePlanImpl.fromJson;

  @override
  String get id;
  @override
  String get homeId;
  @override
  String get childId;
  @override
  String get title;
  @override
  CarePlanStatus get status;
  @override
  String? get reviewDate; // 'YYYY-MM-DD'
  @override
  String? get notes;
  @override
  String get authorId;
  @override
  String get authorName;
  @override
  String? get approvedById;
  @override
  String? get approvedByName;
  @override
  DateTime? get approvedAt;
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

  /// Create a copy of CarePlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarePlanImplCopyWith<_$CarePlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
