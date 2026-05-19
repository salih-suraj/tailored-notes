// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChecklistItem _$ChecklistItemFromJson(Map<String, dynamic> json) {
  return _ChecklistItem.fromJson(json);
}

/// @nodoc
mixin _$ChecklistItem {
  String get id => throw _privateConstructorUsedError;
  String get homeId => throw _privateConstructorUsedError;
  String? get childId => throw _privateConstructorUsedError;
  String get areaKey => throw _privateConstructorUsedError;
  String get areaLabel => throw _privateConstructorUsedError;
  String get taskKey => throw _privateConstructorUsedError;
  String get taskLabel => throw _privateConstructorUsedError;
  ShiftType get shift => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError; // 'YYYY-MM-DD'
  bool get isComplete => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String? get completedByName => throw _privateConstructorUsedError;
  String? get createdById => throw _privateConstructorUsedError;
  String? get updatedById => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isSynced => throw _privateConstructorUsedError;

  /// Serializes this ChecklistItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChecklistItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChecklistItemCopyWith<ChecklistItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistItemCopyWith<$Res> {
  factory $ChecklistItemCopyWith(
    ChecklistItem value,
    $Res Function(ChecklistItem) then,
  ) = _$ChecklistItemCopyWithImpl<$Res, ChecklistItem>;
  @useResult
  $Res call({
    String id,
    String homeId,
    String? childId,
    String areaKey,
    String areaLabel,
    String taskKey,
    String taskLabel,
    ShiftType shift,
    String date,
    bool isComplete,
    DateTime? completedAt,
    String? completedByName,
    String? createdById,
    String? updatedById,
    DateTime createdAt,
    DateTime updatedAt,
    bool isSynced,
  });
}

/// @nodoc
class _$ChecklistItemCopyWithImpl<$Res, $Val extends ChecklistItem>
    implements $ChecklistItemCopyWith<$Res> {
  _$ChecklistItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChecklistItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = freezed,
    Object? areaKey = null,
    Object? areaLabel = null,
    Object? taskKey = null,
    Object? taskLabel = null,
    Object? shift = null,
    Object? date = null,
    Object? isComplete = null,
    Object? completedAt = freezed,
    Object? completedByName = freezed,
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
            childId: freezed == childId
                ? _value.childId
                : childId // ignore: cast_nullable_to_non_nullable
                      as String?,
            areaKey: null == areaKey
                ? _value.areaKey
                : areaKey // ignore: cast_nullable_to_non_nullable
                      as String,
            areaLabel: null == areaLabel
                ? _value.areaLabel
                : areaLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            taskKey: null == taskKey
                ? _value.taskKey
                : taskKey // ignore: cast_nullable_to_non_nullable
                      as String,
            taskLabel: null == taskLabel
                ? _value.taskLabel
                : taskLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            shift: null == shift
                ? _value.shift
                : shift // ignore: cast_nullable_to_non_nullable
                      as ShiftType,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            isComplete: null == isComplete
                ? _value.isComplete
                : isComplete // ignore: cast_nullable_to_non_nullable
                      as bool,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            completedByName: freezed == completedByName
                ? _value.completedByName
                : completedByName // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ChecklistItemImplCopyWith<$Res>
    implements $ChecklistItemCopyWith<$Res> {
  factory _$$ChecklistItemImplCopyWith(
    _$ChecklistItemImpl value,
    $Res Function(_$ChecklistItemImpl) then,
  ) = __$$ChecklistItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String homeId,
    String? childId,
    String areaKey,
    String areaLabel,
    String taskKey,
    String taskLabel,
    ShiftType shift,
    String date,
    bool isComplete,
    DateTime? completedAt,
    String? completedByName,
    String? createdById,
    String? updatedById,
    DateTime createdAt,
    DateTime updatedAt,
    bool isSynced,
  });
}

/// @nodoc
class __$$ChecklistItemImplCopyWithImpl<$Res>
    extends _$ChecklistItemCopyWithImpl<$Res, _$ChecklistItemImpl>
    implements _$$ChecklistItemImplCopyWith<$Res> {
  __$$ChecklistItemImplCopyWithImpl(
    _$ChecklistItemImpl _value,
    $Res Function(_$ChecklistItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChecklistItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = freezed,
    Object? areaKey = null,
    Object? areaLabel = null,
    Object? taskKey = null,
    Object? taskLabel = null,
    Object? shift = null,
    Object? date = null,
    Object? isComplete = null,
    Object? completedAt = freezed,
    Object? completedByName = freezed,
    Object? createdById = freezed,
    Object? updatedById = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isSynced = null,
  }) {
    return _then(
      _$ChecklistItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        homeId: null == homeId
            ? _value.homeId
            : homeId // ignore: cast_nullable_to_non_nullable
                  as String,
        childId: freezed == childId
            ? _value.childId
            : childId // ignore: cast_nullable_to_non_nullable
                  as String?,
        areaKey: null == areaKey
            ? _value.areaKey
            : areaKey // ignore: cast_nullable_to_non_nullable
                  as String,
        areaLabel: null == areaLabel
            ? _value.areaLabel
            : areaLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        taskKey: null == taskKey
            ? _value.taskKey
            : taskKey // ignore: cast_nullable_to_non_nullable
                  as String,
        taskLabel: null == taskLabel
            ? _value.taskLabel
            : taskLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        shift: null == shift
            ? _value.shift
            : shift // ignore: cast_nullable_to_non_nullable
                  as ShiftType,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        isComplete: null == isComplete
            ? _value.isComplete
            : isComplete // ignore: cast_nullable_to_non_nullable
                  as bool,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        completedByName: freezed == completedByName
            ? _value.completedByName
            : completedByName // ignore: cast_nullable_to_non_nullable
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
class _$ChecklistItemImpl implements _ChecklistItem {
  const _$ChecklistItemImpl({
    required this.id,
    required this.homeId,
    this.childId,
    required this.areaKey,
    required this.areaLabel,
    required this.taskKey,
    required this.taskLabel,
    required this.shift,
    required this.date,
    this.isComplete = false,
    this.completedAt,
    this.completedByName,
    this.createdById,
    this.updatedById,
    required this.createdAt,
    required this.updatedAt,
    this.isSynced = false,
  });

  factory _$ChecklistItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChecklistItemImplFromJson(json);

  @override
  final String id;
  @override
  final String homeId;
  @override
  final String? childId;
  @override
  final String areaKey;
  @override
  final String areaLabel;
  @override
  final String taskKey;
  @override
  final String taskLabel;
  @override
  final ShiftType shift;
  @override
  final String date;
  // 'YYYY-MM-DD'
  @override
  @JsonKey()
  final bool isComplete;
  @override
  final DateTime? completedAt;
  @override
  final String? completedByName;
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
    return 'ChecklistItem(id: $id, homeId: $homeId, childId: $childId, areaKey: $areaKey, areaLabel: $areaLabel, taskKey: $taskKey, taskLabel: $taskLabel, shift: $shift, date: $date, isComplete: $isComplete, completedAt: $completedAt, completedByName: $completedByName, createdById: $createdById, updatedById: $updatedById, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecklistItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.childId, childId) || other.childId == childId) &&
            (identical(other.areaKey, areaKey) || other.areaKey == areaKey) &&
            (identical(other.areaLabel, areaLabel) ||
                other.areaLabel == areaLabel) &&
            (identical(other.taskKey, taskKey) || other.taskKey == taskKey) &&
            (identical(other.taskLabel, taskLabel) ||
                other.taskLabel == taskLabel) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.completedByName, completedByName) ||
                other.completedByName == completedByName) &&
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
    areaKey,
    areaLabel,
    taskKey,
    taskLabel,
    shift,
    date,
    isComplete,
    completedAt,
    completedByName,
    createdById,
    updatedById,
    createdAt,
    updatedAt,
    isSynced,
  );

  /// Create a copy of ChecklistItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecklistItemImplCopyWith<_$ChecklistItemImpl> get copyWith =>
      __$$ChecklistItemImplCopyWithImpl<_$ChecklistItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecklistItemImplToJson(this);
  }
}

abstract class _ChecklistItem implements ChecklistItem {
  const factory _ChecklistItem({
    required final String id,
    required final String homeId,
    final String? childId,
    required final String areaKey,
    required final String areaLabel,
    required final String taskKey,
    required final String taskLabel,
    required final ShiftType shift,
    required final String date,
    final bool isComplete,
    final DateTime? completedAt,
    final String? completedByName,
    final String? createdById,
    final String? updatedById,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final bool isSynced,
  }) = _$ChecklistItemImpl;

  factory _ChecklistItem.fromJson(Map<String, dynamic> json) =
      _$ChecklistItemImpl.fromJson;

  @override
  String get id;
  @override
  String get homeId;
  @override
  String? get childId;
  @override
  String get areaKey;
  @override
  String get areaLabel;
  @override
  String get taskKey;
  @override
  String get taskLabel;
  @override
  ShiftType get shift;
  @override
  String get date; // 'YYYY-MM-DD'
  @override
  bool get isComplete;
  @override
  DateTime? get completedAt;
  @override
  String? get completedByName;
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

  /// Create a copy of ChecklistItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecklistItemImplCopyWith<_$ChecklistItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
