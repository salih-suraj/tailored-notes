// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'care_plan_goal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CarePlanGoal _$CarePlanGoalFromJson(Map<String, dynamic> json) {
  return _CarePlanGoal.fromJson(json);
}

/// @nodoc
mixin _$CarePlanGoal {
  String get id => throw _privateConstructorUsedError;
  String get carePlanId => throw _privateConstructorUsedError;
  String get homeId => throw _privateConstructorUsedError;
  String get childId => throw _privateConstructorUsedError;
  GoalCategory get category => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get strategy => throw _privateConstructorUsedError;
  String? get targetDate => throw _privateConstructorUsedError; // 'YYYY-MM-DD'
  GoalStatus get status => throw _privateConstructorUsedError;
  String? get progressNotes => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;
  String? get createdById => throw _privateConstructorUsedError;
  String? get updatedById => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isSynced => throw _privateConstructorUsedError;

  /// Serializes this CarePlanGoal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarePlanGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarePlanGoalCopyWith<CarePlanGoal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarePlanGoalCopyWith<$Res> {
  factory $CarePlanGoalCopyWith(
    CarePlanGoal value,
    $Res Function(CarePlanGoal) then,
  ) = _$CarePlanGoalCopyWithImpl<$Res, CarePlanGoal>;
  @useResult
  $Res call({
    String id,
    String carePlanId,
    String homeId,
    String childId,
    GoalCategory category,
    String title,
    String? description,
    String? strategy,
    String? targetDate,
    GoalStatus status,
    String? progressNotes,
    int sortOrder,
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    DateTime createdAt,
    DateTime updatedAt,
    bool isSynced,
  });
}

/// @nodoc
class _$CarePlanGoalCopyWithImpl<$Res, $Val extends CarePlanGoal>
    implements $CarePlanGoalCopyWith<$Res> {
  _$CarePlanGoalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarePlanGoal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? carePlanId = null,
    Object? homeId = null,
    Object? childId = null,
    Object? category = null,
    Object? title = null,
    Object? description = freezed,
    Object? strategy = freezed,
    Object? targetDate = freezed,
    Object? status = null,
    Object? progressNotes = freezed,
    Object? sortOrder = null,
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
            carePlanId: null == carePlanId
                ? _value.carePlanId
                : carePlanId // ignore: cast_nullable_to_non_nullable
                      as String,
            homeId: null == homeId
                ? _value.homeId
                : homeId // ignore: cast_nullable_to_non_nullable
                      as String,
            childId: null == childId
                ? _value.childId
                : childId // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as GoalCategory,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            strategy: freezed == strategy
                ? _value.strategy
                : strategy // ignore: cast_nullable_to_non_nullable
                      as String?,
            targetDate: freezed == targetDate
                ? _value.targetDate
                : targetDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as GoalStatus,
            progressNotes: freezed == progressNotes
                ? _value.progressNotes
                : progressNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
            sortOrder: null == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as int,
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
abstract class _$$CarePlanGoalImplCopyWith<$Res>
    implements $CarePlanGoalCopyWith<$Res> {
  factory _$$CarePlanGoalImplCopyWith(
    _$CarePlanGoalImpl value,
    $Res Function(_$CarePlanGoalImpl) then,
  ) = __$$CarePlanGoalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String carePlanId,
    String homeId,
    String childId,
    GoalCategory category,
    String title,
    String? description,
    String? strategy,
    String? targetDate,
    GoalStatus status,
    String? progressNotes,
    int sortOrder,
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    DateTime createdAt,
    DateTime updatedAt,
    bool isSynced,
  });
}

/// @nodoc
class __$$CarePlanGoalImplCopyWithImpl<$Res>
    extends _$CarePlanGoalCopyWithImpl<$Res, _$CarePlanGoalImpl>
    implements _$$CarePlanGoalImplCopyWith<$Res> {
  __$$CarePlanGoalImplCopyWithImpl(
    _$CarePlanGoalImpl _value,
    $Res Function(_$CarePlanGoalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CarePlanGoal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? carePlanId = null,
    Object? homeId = null,
    Object? childId = null,
    Object? category = null,
    Object? title = null,
    Object? description = freezed,
    Object? strategy = freezed,
    Object? targetDate = freezed,
    Object? status = null,
    Object? progressNotes = freezed,
    Object? sortOrder = null,
    Object? createdById = freezed,
    Object? updatedById = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isSynced = null,
  }) {
    return _then(
      _$CarePlanGoalImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        carePlanId: null == carePlanId
            ? _value.carePlanId
            : carePlanId // ignore: cast_nullable_to_non_nullable
                  as String,
        homeId: null == homeId
            ? _value.homeId
            : homeId // ignore: cast_nullable_to_non_nullable
                  as String,
        childId: null == childId
            ? _value.childId
            : childId // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as GoalCategory,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        strategy: freezed == strategy
            ? _value.strategy
            : strategy // ignore: cast_nullable_to_non_nullable
                  as String?,
        targetDate: freezed == targetDate
            ? _value.targetDate
            : targetDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as GoalStatus,
        progressNotes: freezed == progressNotes
            ? _value.progressNotes
            : progressNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
        sortOrder: null == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int,
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
class _$CarePlanGoalImpl implements _CarePlanGoal {
  const _$CarePlanGoalImpl({
    required this.id,
    required this.carePlanId,
    required this.homeId,
    required this.childId,
    required this.category,
    required this.title,
    this.description,
    this.strategy,
    this.targetDate,
    required this.status,
    this.progressNotes,
    this.sortOrder = 0,
    this.createdById,
    this.updatedById,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    this.isSynced = false,
  });

  factory _$CarePlanGoalImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarePlanGoalImplFromJson(json);

  @override
  final String id;
  @override
  final String carePlanId;
  @override
  final String homeId;
  @override
  final String childId;
  @override
  final GoalCategory category;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String? strategy;
  @override
  final String? targetDate;
  // 'YYYY-MM-DD'
  @override
  final GoalStatus status;
  @override
  final String? progressNotes;
  @override
  @JsonKey()
  final int sortOrder;
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
    return 'CarePlanGoal(id: $id, carePlanId: $carePlanId, homeId: $homeId, childId: $childId, category: $category, title: $title, description: $description, strategy: $strategy, targetDate: $targetDate, status: $status, progressNotes: $progressNotes, sortOrder: $sortOrder, createdById: $createdById, updatedById: $updatedById, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarePlanGoalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.carePlanId, carePlanId) ||
                other.carePlanId == carePlanId) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.childId, childId) || other.childId == childId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.strategy, strategy) ||
                other.strategy == strategy) &&
            (identical(other.targetDate, targetDate) ||
                other.targetDate == targetDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.progressNotes, progressNotes) ||
                other.progressNotes == progressNotes) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
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
    carePlanId,
    homeId,
    childId,
    category,
    title,
    description,
    strategy,
    targetDate,
    status,
    progressNotes,
    sortOrder,
    createdById,
    updatedById,
    deletedAt,
    createdAt,
    updatedAt,
    isSynced,
  );

  /// Create a copy of CarePlanGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarePlanGoalImplCopyWith<_$CarePlanGoalImpl> get copyWith =>
      __$$CarePlanGoalImplCopyWithImpl<_$CarePlanGoalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarePlanGoalImplToJson(this);
  }
}

abstract class _CarePlanGoal implements CarePlanGoal {
  const factory _CarePlanGoal({
    required final String id,
    required final String carePlanId,
    required final String homeId,
    required final String childId,
    required final GoalCategory category,
    required final String title,
    final String? description,
    final String? strategy,
    final String? targetDate,
    required final GoalStatus status,
    final String? progressNotes,
    final int sortOrder,
    final String? createdById,
    final String? updatedById,
    final DateTime? deletedAt,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final bool isSynced,
  }) = _$CarePlanGoalImpl;

  factory _CarePlanGoal.fromJson(Map<String, dynamic> json) =
      _$CarePlanGoalImpl.fromJson;

  @override
  String get id;
  @override
  String get carePlanId;
  @override
  String get homeId;
  @override
  String get childId;
  @override
  GoalCategory get category;
  @override
  String get title;
  @override
  String? get description;
  @override
  String? get strategy;
  @override
  String? get targetDate; // 'YYYY-MM-DD'
  @override
  GoalStatus get status;
  @override
  String? get progressNotes;
  @override
  int get sortOrder;
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

  /// Create a copy of CarePlanGoal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarePlanGoalImplCopyWith<_$CarePlanGoalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
