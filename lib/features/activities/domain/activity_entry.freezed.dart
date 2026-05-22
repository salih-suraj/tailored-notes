// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ActivityEntry _$ActivityEntryFromJson(Map<String, dynamic> json) {
  return _ActivityEntry.fromJson(json);
}

/// @nodoc
mixin _$ActivityEntry {
  String get id => throw _privateConstructorUsedError;
  String get homeId => throw _privateConstructorUsedError;
  String get childId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError; // 'YYYY-MM-DD'
  ShiftType get shift => throw _privateConstructorUsedError;
  ActivityCategory get category => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get durationMinutes => throw _privateConstructorUsedError;
  bool get rewardEarned => throw _privateConstructorUsedError;
  String? get achievement =>
      throw _privateConstructorUsedError; // positive milestone to highlight
  String get recordedById => throw _privateConstructorUsedError;
  String get recordedByName => throw _privateConstructorUsedError;
  String? get createdById => throw _privateConstructorUsedError;
  String? get updatedById => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isSynced => throw _privateConstructorUsedError;

  /// Serializes this ActivityEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActivityEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityEntryCopyWith<ActivityEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityEntryCopyWith<$Res> {
  factory $ActivityEntryCopyWith(
    ActivityEntry value,
    $Res Function(ActivityEntry) then,
  ) = _$ActivityEntryCopyWithImpl<$Res, ActivityEntry>;
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    String date,
    ShiftType shift,
    ActivityCategory category,
    String title,
    String? description,
    int? durationMinutes,
    bool rewardEarned,
    String? achievement,
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
class _$ActivityEntryCopyWithImpl<$Res, $Val extends ActivityEntry>
    implements $ActivityEntryCopyWith<$Res> {
  _$ActivityEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? date = null,
    Object? shift = null,
    Object? category = null,
    Object? title = null,
    Object? description = freezed,
    Object? durationMinutes = freezed,
    Object? rewardEarned = null,
    Object? achievement = freezed,
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
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            shift: null == shift
                ? _value.shift
                : shift // ignore: cast_nullable_to_non_nullable
                      as ShiftType,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as ActivityCategory,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            durationMinutes: freezed == durationMinutes
                ? _value.durationMinutes
                : durationMinutes // ignore: cast_nullable_to_non_nullable
                      as int?,
            rewardEarned: null == rewardEarned
                ? _value.rewardEarned
                : rewardEarned // ignore: cast_nullable_to_non_nullable
                      as bool,
            achievement: freezed == achievement
                ? _value.achievement
                : achievement // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ActivityEntryImplCopyWith<$Res>
    implements $ActivityEntryCopyWith<$Res> {
  factory _$$ActivityEntryImplCopyWith(
    _$ActivityEntryImpl value,
    $Res Function(_$ActivityEntryImpl) then,
  ) = __$$ActivityEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    String date,
    ShiftType shift,
    ActivityCategory category,
    String title,
    String? description,
    int? durationMinutes,
    bool rewardEarned,
    String? achievement,
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
class __$$ActivityEntryImplCopyWithImpl<$Res>
    extends _$ActivityEntryCopyWithImpl<$Res, _$ActivityEntryImpl>
    implements _$$ActivityEntryImplCopyWith<$Res> {
  __$$ActivityEntryImplCopyWithImpl(
    _$ActivityEntryImpl _value,
    $Res Function(_$ActivityEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ActivityEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? date = null,
    Object? shift = null,
    Object? category = null,
    Object? title = null,
    Object? description = freezed,
    Object? durationMinutes = freezed,
    Object? rewardEarned = null,
    Object? achievement = freezed,
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
      _$ActivityEntryImpl(
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
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        shift: null == shift
            ? _value.shift
            : shift // ignore: cast_nullable_to_non_nullable
                  as ShiftType,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as ActivityCategory,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        durationMinutes: freezed == durationMinutes
            ? _value.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        rewardEarned: null == rewardEarned
            ? _value.rewardEarned
            : rewardEarned // ignore: cast_nullable_to_non_nullable
                  as bool,
        achievement: freezed == achievement
            ? _value.achievement
            : achievement // ignore: cast_nullable_to_non_nullable
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
class _$ActivityEntryImpl implements _ActivityEntry {
  const _$ActivityEntryImpl({
    required this.id,
    required this.homeId,
    required this.childId,
    required this.date,
    required this.shift,
    required this.category,
    required this.title,
    this.description,
    this.durationMinutes,
    this.rewardEarned = false,
    this.achievement,
    required this.recordedById,
    required this.recordedByName,
    this.createdById,
    this.updatedById,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    this.isSynced = false,
  });

  factory _$ActivityEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String homeId;
  @override
  final String childId;
  @override
  final String date;
  // 'YYYY-MM-DD'
  @override
  final ShiftType shift;
  @override
  final ActivityCategory category;
  @override
  final String title;
  @override
  final String? description;
  @override
  final int? durationMinutes;
  @override
  @JsonKey()
  final bool rewardEarned;
  @override
  final String? achievement;
  // positive milestone to highlight
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
    return 'ActivityEntry(id: $id, homeId: $homeId, childId: $childId, date: $date, shift: $shift, category: $category, title: $title, description: $description, durationMinutes: $durationMinutes, rewardEarned: $rewardEarned, achievement: $achievement, recordedById: $recordedById, recordedByName: $recordedByName, createdById: $createdById, updatedById: $updatedById, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.childId, childId) || other.childId == childId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.rewardEarned, rewardEarned) ||
                other.rewardEarned == rewardEarned) &&
            (identical(other.achievement, achievement) ||
                other.achievement == achievement) &&
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
    date,
    shift,
    category,
    title,
    description,
    durationMinutes,
    rewardEarned,
    achievement,
    recordedById,
    recordedByName,
    createdById,
    updatedById,
    deletedAt,
    createdAt,
    updatedAt,
    isSynced,
  ]);

  /// Create a copy of ActivityEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityEntryImplCopyWith<_$ActivityEntryImpl> get copyWith =>
      __$$ActivityEntryImplCopyWithImpl<_$ActivityEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityEntryImplToJson(this);
  }
}

abstract class _ActivityEntry implements ActivityEntry {
  const factory _ActivityEntry({
    required final String id,
    required final String homeId,
    required final String childId,
    required final String date,
    required final ShiftType shift,
    required final ActivityCategory category,
    required final String title,
    final String? description,
    final int? durationMinutes,
    final bool rewardEarned,
    final String? achievement,
    required final String recordedById,
    required final String recordedByName,
    final String? createdById,
    final String? updatedById,
    final DateTime? deletedAt,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final bool isSynced,
  }) = _$ActivityEntryImpl;

  factory _ActivityEntry.fromJson(Map<String, dynamic> json) =
      _$ActivityEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get homeId;
  @override
  String get childId;
  @override
  String get date; // 'YYYY-MM-DD'
  @override
  ShiftType get shift;
  @override
  ActivityCategory get category;
  @override
  String get title;
  @override
  String? get description;
  @override
  int? get durationMinutes;
  @override
  bool get rewardEarned;
  @override
  String? get achievement; // positive milestone to highlight
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

  /// Create a copy of ActivityEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityEntryImplCopyWith<_$ActivityEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
