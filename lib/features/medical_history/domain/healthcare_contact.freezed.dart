// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'healthcare_contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HealthcareContact _$HealthcareContactFromJson(Map<String, dynamic> json) {
  return _HealthcareContact.fromJson(json);
}

/// @nodoc
mixin _$HealthcareContact {
  String get id => throw _privateConstructorUsedError;
  String get homeId => throw _privateConstructorUsedError;
  String get childId => throw _privateConstructorUsedError;
  ContactType get contactType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get createdById => throw _privateConstructorUsedError;
  String? get updatedById => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isSynced => throw _privateConstructorUsedError;

  /// Serializes this HealthcareContact to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthcareContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthcareContactCopyWith<HealthcareContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthcareContactCopyWith<$Res> {
  factory $HealthcareContactCopyWith(
    HealthcareContact value,
    $Res Function(HealthcareContact) then,
  ) = _$HealthcareContactCopyWithImpl<$Res, HealthcareContact>;
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    ContactType contactType,
    String name,
    String? role,
    String? phone,
    String? email,
    String? address,
    String? notes,
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    DateTime createdAt,
    DateTime updatedAt,
    bool isSynced,
  });
}

/// @nodoc
class _$HealthcareContactCopyWithImpl<$Res, $Val extends HealthcareContact>
    implements $HealthcareContactCopyWith<$Res> {
  _$HealthcareContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthcareContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? contactType = null,
    Object? name = null,
    Object? role = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? notes = freezed,
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
            contactType: null == contactType
                ? _value.contactType
                : contactType // ignore: cast_nullable_to_non_nullable
                      as ContactType,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            role: freezed == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
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
abstract class _$$HealthcareContactImplCopyWith<$Res>
    implements $HealthcareContactCopyWith<$Res> {
  factory _$$HealthcareContactImplCopyWith(
    _$HealthcareContactImpl value,
    $Res Function(_$HealthcareContactImpl) then,
  ) = __$$HealthcareContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String homeId,
    String childId,
    ContactType contactType,
    String name,
    String? role,
    String? phone,
    String? email,
    String? address,
    String? notes,
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    DateTime createdAt,
    DateTime updatedAt,
    bool isSynced,
  });
}

/// @nodoc
class __$$HealthcareContactImplCopyWithImpl<$Res>
    extends _$HealthcareContactCopyWithImpl<$Res, _$HealthcareContactImpl>
    implements _$$HealthcareContactImplCopyWith<$Res> {
  __$$HealthcareContactImplCopyWithImpl(
    _$HealthcareContactImpl _value,
    $Res Function(_$HealthcareContactImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HealthcareContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeId = null,
    Object? childId = null,
    Object? contactType = null,
    Object? name = null,
    Object? role = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? notes = freezed,
    Object? createdById = freezed,
    Object? updatedById = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isSynced = null,
  }) {
    return _then(
      _$HealthcareContactImpl(
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
        contactType: null == contactType
            ? _value.contactType
            : contactType // ignore: cast_nullable_to_non_nullable
                  as ContactType,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        role: freezed == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
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
class _$HealthcareContactImpl implements _HealthcareContact {
  const _$HealthcareContactImpl({
    required this.id,
    required this.homeId,
    required this.childId,
    required this.contactType,
    required this.name,
    this.role,
    this.phone,
    this.email,
    this.address,
    this.notes,
    this.createdById,
    this.updatedById,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    this.isSynced = false,
  });

  factory _$HealthcareContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthcareContactImplFromJson(json);

  @override
  final String id;
  @override
  final String homeId;
  @override
  final String childId;
  @override
  final ContactType contactType;
  @override
  final String name;
  @override
  final String? role;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? address;
  @override
  final String? notes;
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
    return 'HealthcareContact(id: $id, homeId: $homeId, childId: $childId, contactType: $contactType, name: $name, role: $role, phone: $phone, email: $email, address: $address, notes: $notes, createdById: $createdById, updatedById: $updatedById, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthcareContactImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.childId, childId) || other.childId == childId) &&
            (identical(other.contactType, contactType) ||
                other.contactType == contactType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.notes, notes) || other.notes == notes) &&
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
    contactType,
    name,
    role,
    phone,
    email,
    address,
    notes,
    createdById,
    updatedById,
    deletedAt,
    createdAt,
    updatedAt,
    isSynced,
  );

  /// Create a copy of HealthcareContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthcareContactImplCopyWith<_$HealthcareContactImpl> get copyWith =>
      __$$HealthcareContactImplCopyWithImpl<_$HealthcareContactImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthcareContactImplToJson(this);
  }
}

abstract class _HealthcareContact implements HealthcareContact {
  const factory _HealthcareContact({
    required final String id,
    required final String homeId,
    required final String childId,
    required final ContactType contactType,
    required final String name,
    final String? role,
    final String? phone,
    final String? email,
    final String? address,
    final String? notes,
    final String? createdById,
    final String? updatedById,
    final DateTime? deletedAt,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final bool isSynced,
  }) = _$HealthcareContactImpl;

  factory _HealthcareContact.fromJson(Map<String, dynamic> json) =
      _$HealthcareContactImpl.fromJson;

  @override
  String get id;
  @override
  String get homeId;
  @override
  String get childId;
  @override
  ContactType get contactType;
  @override
  String get name;
  @override
  String? get role;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get address;
  @override
  String? get notes;
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

  /// Create a copy of HealthcareContact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthcareContactImplCopyWith<_$HealthcareContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
