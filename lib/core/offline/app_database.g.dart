// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DailyNotesTableTable extends DailyNotesTable
    with TableInfo<$DailyNotesTableTable, DailyNoteRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyNotesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _homeIdMeta = const VerificationMeta('homeId');
  @override
  late final GeneratedColumn<String> homeId = GeneratedColumn<String>(
    'home_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _childIdMeta = const VerificationMeta(
    'childId',
  );
  @override
  late final GeneratedColumn<String> childId = GeneratedColumn<String>(
    'child_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _authorIdMeta = const VerificationMeta(
    'authorId',
  );
  @override
  late final GeneratedColumn<String> authorId = GeneratedColumn<String>(
    'author_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _authorNameMeta = const VerificationMeta(
    'authorName',
  );
  @override
  late final GeneratedColumn<String> authorName = GeneratedColumn<String>(
    'author_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shiftMeta = const VerificationMeta('shift');
  @override
  late final GeneratedColumn<String> shift = GeneratedColumn<String>(
    'shift',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _occurredAtMeta = const VerificationMeta(
    'occurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByIdMeta = const VerificationMeta(
    'updatedById',
  );
  @override
  late final GeneratedColumn<String> updatedById = GeneratedColumn<String>(
    'updated_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByNameMeta = const VerificationMeta(
    'updatedByName',
  );
  @override
  late final GeneratedColumn<String> updatedByName = GeneratedColumn<String>(
    'updated_by_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    homeId,
    childId,
    authorId,
    authorName,
    shift,
    content,
    occurredAt,
    createdAt,
    updatedAt,
    deletedAt,
    updatedById,
    updatedByName,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_notes';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailyNoteRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('home_id')) {
      context.handle(
        _homeIdMeta,
        homeId.isAcceptableOrUnknown(data['home_id']!, _homeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_homeIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(
        _childIdMeta,
        childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta),
      );
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('author_id')) {
      context.handle(
        _authorIdMeta,
        authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta),
      );
    } else if (isInserting) {
      context.missing(_authorIdMeta);
    }
    if (data.containsKey('author_name')) {
      context.handle(
        _authorNameMeta,
        authorName.isAcceptableOrUnknown(data['author_name']!, _authorNameMeta),
      );
    } else if (isInserting) {
      context.missing(_authorNameMeta);
    }
    if (data.containsKey('shift')) {
      context.handle(
        _shiftMeta,
        shift.isAcceptableOrUnknown(data['shift']!, _shiftMeta),
      );
    } else if (isInserting) {
      context.missing(_shiftMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
        _occurredAtMeta,
        occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('updated_by_id')) {
      context.handle(
        _updatedByIdMeta,
        updatedById.isAcceptableOrUnknown(
          data['updated_by_id']!,
          _updatedByIdMeta,
        ),
      );
    }
    if (data.containsKey('updated_by_name')) {
      context.handle(
        _updatedByNameMeta,
        updatedByName.isAcceptableOrUnknown(
          data['updated_by_name']!,
          _updatedByNameMeta,
        ),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyNoteRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyNoteRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      homeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_id'],
      )!,
      childId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}child_id'],
      )!,
      authorId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author_id'],
      )!,
      authorName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author_name'],
      )!,
      shift: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shift'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      occurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}occurred_at'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      updatedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by_id'],
      ),
      updatedByName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by_name'],
      ),
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $DailyNotesTableTable createAlias(String alias) {
    return $DailyNotesTableTable(attachedDatabase, alias);
  }
}

class DailyNoteRow extends DataClass implements Insertable<DailyNoteRow> {
  final String id;
  final String homeId;
  final String childId;
  final String authorId;
  final String authorName;
  final String shift;
  final String content;
  final DateTime occurredAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String? updatedById;
  final String? updatedByName;
  final bool isSynced;
  const DailyNoteRow({
    required this.id,
    required this.homeId,
    required this.childId,
    required this.authorId,
    required this.authorName,
    required this.shift,
    required this.content,
    required this.occurredAt,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.updatedById,
    this.updatedByName,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['home_id'] = Variable<String>(homeId);
    map['child_id'] = Variable<String>(childId);
    map['author_id'] = Variable<String>(authorId);
    map['author_name'] = Variable<String>(authorName);
    map['shift'] = Variable<String>(shift);
    map['content'] = Variable<String>(content);
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || updatedById != null) {
      map['updated_by_id'] = Variable<String>(updatedById);
    }
    if (!nullToAbsent || updatedByName != null) {
      map['updated_by_name'] = Variable<String>(updatedByName);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  DailyNotesTableCompanion toCompanion(bool nullToAbsent) {
    return DailyNotesTableCompanion(
      id: Value(id),
      homeId: Value(homeId),
      childId: Value(childId),
      authorId: Value(authorId),
      authorName: Value(authorName),
      shift: Value(shift),
      content: Value(content),
      occurredAt: Value(occurredAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      updatedById: updatedById == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedById),
      updatedByName: updatedByName == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedByName),
      isSynced: Value(isSynced),
    );
  }

  factory DailyNoteRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyNoteRow(
      id: serializer.fromJson<String>(json['id']),
      homeId: serializer.fromJson<String>(json['homeId']),
      childId: serializer.fromJson<String>(json['childId']),
      authorId: serializer.fromJson<String>(json['authorId']),
      authorName: serializer.fromJson<String>(json['authorName']),
      shift: serializer.fromJson<String>(json['shift']),
      content: serializer.fromJson<String>(json['content']),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      updatedById: serializer.fromJson<String?>(json['updatedById']),
      updatedByName: serializer.fromJson<String?>(json['updatedByName']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'homeId': serializer.toJson<String>(homeId),
      'childId': serializer.toJson<String>(childId),
      'authorId': serializer.toJson<String>(authorId),
      'authorName': serializer.toJson<String>(authorName),
      'shift': serializer.toJson<String>(shift),
      'content': serializer.toJson<String>(content),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'updatedById': serializer.toJson<String?>(updatedById),
      'updatedByName': serializer.toJson<String?>(updatedByName),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  DailyNoteRow copyWith({
    String? id,
    String? homeId,
    String? childId,
    String? authorId,
    String? authorName,
    String? shift,
    String? content,
    DateTime? occurredAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> updatedById = const Value.absent(),
    Value<String?> updatedByName = const Value.absent(),
    bool? isSynced,
  }) => DailyNoteRow(
    id: id ?? this.id,
    homeId: homeId ?? this.homeId,
    childId: childId ?? this.childId,
    authorId: authorId ?? this.authorId,
    authorName: authorName ?? this.authorName,
    shift: shift ?? this.shift,
    content: content ?? this.content,
    occurredAt: occurredAt ?? this.occurredAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    updatedById: updatedById.present ? updatedById.value : this.updatedById,
    updatedByName: updatedByName.present
        ? updatedByName.value
        : this.updatedByName,
    isSynced: isSynced ?? this.isSynced,
  );
  DailyNoteRow copyWithCompanion(DailyNotesTableCompanion data) {
    return DailyNoteRow(
      id: data.id.present ? data.id.value : this.id,
      homeId: data.homeId.present ? data.homeId.value : this.homeId,
      childId: data.childId.present ? data.childId.value : this.childId,
      authorId: data.authorId.present ? data.authorId.value : this.authorId,
      authorName: data.authorName.present
          ? data.authorName.value
          : this.authorName,
      shift: data.shift.present ? data.shift.value : this.shift,
      content: data.content.present ? data.content.value : this.content,
      occurredAt: data.occurredAt.present
          ? data.occurredAt.value
          : this.occurredAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      updatedById: data.updatedById.present
          ? data.updatedById.value
          : this.updatedById,
      updatedByName: data.updatedByName.present
          ? data.updatedByName.value
          : this.updatedByName,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyNoteRow(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('authorId: $authorId, ')
          ..write('authorName: $authorName, ')
          ..write('shift: $shift, ')
          ..write('content: $content, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('updatedById: $updatedById, ')
          ..write('updatedByName: $updatedByName, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    homeId,
    childId,
    authorId,
    authorName,
    shift,
    content,
    occurredAt,
    createdAt,
    updatedAt,
    deletedAt,
    updatedById,
    updatedByName,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyNoteRow &&
          other.id == this.id &&
          other.homeId == this.homeId &&
          other.childId == this.childId &&
          other.authorId == this.authorId &&
          other.authorName == this.authorName &&
          other.shift == this.shift &&
          other.content == this.content &&
          other.occurredAt == this.occurredAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.updatedById == this.updatedById &&
          other.updatedByName == this.updatedByName &&
          other.isSynced == this.isSynced);
}

class DailyNotesTableCompanion extends UpdateCompanion<DailyNoteRow> {
  final Value<String> id;
  final Value<String> homeId;
  final Value<String> childId;
  final Value<String> authorId;
  final Value<String> authorName;
  final Value<String> shift;
  final Value<String> content;
  final Value<DateTime> occurredAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String?> updatedById;
  final Value<String?> updatedByName;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const DailyNotesTableCompanion({
    this.id = const Value.absent(),
    this.homeId = const Value.absent(),
    this.childId = const Value.absent(),
    this.authorId = const Value.absent(),
    this.authorName = const Value.absent(),
    this.shift = const Value.absent(),
    this.content = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.updatedByName = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DailyNotesTableCompanion.insert({
    required String id,
    required String homeId,
    required String childId,
    required String authorId,
    required String authorName,
    required String shift,
    required String content,
    required DateTime occurredAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.updatedByName = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       homeId = Value(homeId),
       childId = Value(childId),
       authorId = Value(authorId),
       authorName = Value(authorName),
       shift = Value(shift),
       content = Value(content),
       occurredAt = Value(occurredAt),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<DailyNoteRow> custom({
    Expression<String>? id,
    Expression<String>? homeId,
    Expression<String>? childId,
    Expression<String>? authorId,
    Expression<String>? authorName,
    Expression<String>? shift,
    Expression<String>? content,
    Expression<DateTime>? occurredAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? updatedById,
    Expression<String>? updatedByName,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (homeId != null) 'home_id': homeId,
      if (childId != null) 'child_id': childId,
      if (authorId != null) 'author_id': authorId,
      if (authorName != null) 'author_name': authorName,
      if (shift != null) 'shift': shift,
      if (content != null) 'content': content,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (updatedById != null) 'updated_by_id': updatedById,
      if (updatedByName != null) 'updated_by_name': updatedByName,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DailyNotesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? homeId,
    Value<String>? childId,
    Value<String>? authorId,
    Value<String>? authorName,
    Value<String>? shift,
    Value<String>? content,
    Value<DateTime>? occurredAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String?>? updatedById,
    Value<String?>? updatedByName,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return DailyNotesTableCompanion(
      id: id ?? this.id,
      homeId: homeId ?? this.homeId,
      childId: childId ?? this.childId,
      authorId: authorId ?? this.authorId,
      authorName: authorName ?? this.authorName,
      shift: shift ?? this.shift,
      content: content ?? this.content,
      occurredAt: occurredAt ?? this.occurredAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      updatedById: updatedById ?? this.updatedById,
      updatedByName: updatedByName ?? this.updatedByName,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (homeId.present) {
      map['home_id'] = Variable<String>(homeId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<String>(childId.value);
    }
    if (authorId.present) {
      map['author_id'] = Variable<String>(authorId.value);
    }
    if (authorName.present) {
      map['author_name'] = Variable<String>(authorName.value);
    }
    if (shift.present) {
      map['shift'] = Variable<String>(shift.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (updatedById.present) {
      map['updated_by_id'] = Variable<String>(updatedById.value);
    }
    if (updatedByName.present) {
      map['updated_by_name'] = Variable<String>(updatedByName.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyNotesTableCompanion(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('authorId: $authorId, ')
          ..write('authorName: $authorName, ')
          ..write('shift: $shift, ')
          ..write('content: $content, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('updatedById: $updatedById, ')
          ..write('updatedByName: $updatedByName, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChecklistItemsTableTable extends ChecklistItemsTable
    with TableInfo<$ChecklistItemsTableTable, ChecklistItemRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChecklistItemsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _homeIdMeta = const VerificationMeta('homeId');
  @override
  late final GeneratedColumn<String> homeId = GeneratedColumn<String>(
    'home_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _childIdMeta = const VerificationMeta(
    'childId',
  );
  @override
  late final GeneratedColumn<String> childId = GeneratedColumn<String>(
    'child_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _areaKeyMeta = const VerificationMeta(
    'areaKey',
  );
  @override
  late final GeneratedColumn<String> areaKey = GeneratedColumn<String>(
    'area_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _areaLabelMeta = const VerificationMeta(
    'areaLabel',
  );
  @override
  late final GeneratedColumn<String> areaLabel = GeneratedColumn<String>(
    'area_label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taskKeyMeta = const VerificationMeta(
    'taskKey',
  );
  @override
  late final GeneratedColumn<String> taskKey = GeneratedColumn<String>(
    'task_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taskLabelMeta = const VerificationMeta(
    'taskLabel',
  );
  @override
  late final GeneratedColumn<String> taskLabel = GeneratedColumn<String>(
    'task_label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shiftMeta = const VerificationMeta('shift');
  @override
  late final GeneratedColumn<String> shift = GeneratedColumn<String>(
    'shift',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCompleteMeta = const VerificationMeta(
    'isComplete',
  );
  @override
  late final GeneratedColumn<bool> isComplete = GeneratedColumn<bool>(
    'is_complete',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_complete" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _completedByNameMeta = const VerificationMeta(
    'completedByName',
  );
  @override
  late final GeneratedColumn<String> completedByName = GeneratedColumn<String>(
    'completed_by_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdByIdMeta = const VerificationMeta(
    'createdById',
  );
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
    'created_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByIdMeta = const VerificationMeta(
    'updatedById',
  );
  @override
  late final GeneratedColumn<String> updatedById = GeneratedColumn<String>(
    'updated_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
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
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'checklist_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChecklistItemRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('home_id')) {
      context.handle(
        _homeIdMeta,
        homeId.isAcceptableOrUnknown(data['home_id']!, _homeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_homeIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(
        _childIdMeta,
        childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta),
      );
    }
    if (data.containsKey('area_key')) {
      context.handle(
        _areaKeyMeta,
        areaKey.isAcceptableOrUnknown(data['area_key']!, _areaKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_areaKeyMeta);
    }
    if (data.containsKey('area_label')) {
      context.handle(
        _areaLabelMeta,
        areaLabel.isAcceptableOrUnknown(data['area_label']!, _areaLabelMeta),
      );
    } else if (isInserting) {
      context.missing(_areaLabelMeta);
    }
    if (data.containsKey('task_key')) {
      context.handle(
        _taskKeyMeta,
        taskKey.isAcceptableOrUnknown(data['task_key']!, _taskKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_taskKeyMeta);
    }
    if (data.containsKey('task_label')) {
      context.handle(
        _taskLabelMeta,
        taskLabel.isAcceptableOrUnknown(data['task_label']!, _taskLabelMeta),
      );
    } else if (isInserting) {
      context.missing(_taskLabelMeta);
    }
    if (data.containsKey('shift')) {
      context.handle(
        _shiftMeta,
        shift.isAcceptableOrUnknown(data['shift']!, _shiftMeta),
      );
    } else if (isInserting) {
      context.missing(_shiftMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('is_complete')) {
      context.handle(
        _isCompleteMeta,
        isComplete.isAcceptableOrUnknown(data['is_complete']!, _isCompleteMeta),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('completed_by_name')) {
      context.handle(
        _completedByNameMeta,
        completedByName.isAcceptableOrUnknown(
          data['completed_by_name']!,
          _completedByNameMeta,
        ),
      );
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
        _createdByIdMeta,
        createdById.isAcceptableOrUnknown(
          data['created_by_id']!,
          _createdByIdMeta,
        ),
      );
    }
    if (data.containsKey('updated_by_id')) {
      context.handle(
        _updatedByIdMeta,
        updatedById.isAcceptableOrUnknown(
          data['updated_by_id']!,
          _updatedByIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChecklistItemRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChecklistItemRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      homeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_id'],
      )!,
      childId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}child_id'],
      ),
      areaKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}area_key'],
      )!,
      areaLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}area_label'],
      )!,
      taskKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}task_key'],
      )!,
      taskLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}task_label'],
      )!,
      shift: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shift'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      isComplete: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_complete'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      completedByName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}completed_by_name'],
      ),
      createdById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_id'],
      ),
      updatedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $ChecklistItemsTableTable createAlias(String alias) {
    return $ChecklistItemsTableTable(attachedDatabase, alias);
  }
}

class ChecklistItemRow extends DataClass
    implements Insertable<ChecklistItemRow> {
  final String id;
  final String homeId;
  final String? childId;
  final String areaKey;
  final String areaLabel;
  final String taskKey;
  final String taskLabel;
  final String shift;
  final String date;
  final bool isComplete;
  final DateTime? completedAt;
  final String? completedByName;
  final String? createdById;
  final String? updatedById;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSynced;
  const ChecklistItemRow({
    required this.id,
    required this.homeId,
    this.childId,
    required this.areaKey,
    required this.areaLabel,
    required this.taskKey,
    required this.taskLabel,
    required this.shift,
    required this.date,
    required this.isComplete,
    this.completedAt,
    this.completedByName,
    this.createdById,
    this.updatedById,
    required this.createdAt,
    required this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['home_id'] = Variable<String>(homeId);
    if (!nullToAbsent || childId != null) {
      map['child_id'] = Variable<String>(childId);
    }
    map['area_key'] = Variable<String>(areaKey);
    map['area_label'] = Variable<String>(areaLabel);
    map['task_key'] = Variable<String>(taskKey);
    map['task_label'] = Variable<String>(taskLabel);
    map['shift'] = Variable<String>(shift);
    map['date'] = Variable<String>(date);
    map['is_complete'] = Variable<bool>(isComplete);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    if (!nullToAbsent || completedByName != null) {
      map['completed_by_name'] = Variable<String>(completedByName);
    }
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || updatedById != null) {
      map['updated_by_id'] = Variable<String>(updatedById);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  ChecklistItemsTableCompanion toCompanion(bool nullToAbsent) {
    return ChecklistItemsTableCompanion(
      id: Value(id),
      homeId: Value(homeId),
      childId: childId == null && nullToAbsent
          ? const Value.absent()
          : Value(childId),
      areaKey: Value(areaKey),
      areaLabel: Value(areaLabel),
      taskKey: Value(taskKey),
      taskLabel: Value(taskLabel),
      shift: Value(shift),
      date: Value(date),
      isComplete: Value(isComplete),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      completedByName: completedByName == null && nullToAbsent
          ? const Value.absent()
          : Value(completedByName),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      updatedById: updatedById == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedById),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory ChecklistItemRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChecklistItemRow(
      id: serializer.fromJson<String>(json['id']),
      homeId: serializer.fromJson<String>(json['homeId']),
      childId: serializer.fromJson<String?>(json['childId']),
      areaKey: serializer.fromJson<String>(json['areaKey']),
      areaLabel: serializer.fromJson<String>(json['areaLabel']),
      taskKey: serializer.fromJson<String>(json['taskKey']),
      taskLabel: serializer.fromJson<String>(json['taskLabel']),
      shift: serializer.fromJson<String>(json['shift']),
      date: serializer.fromJson<String>(json['date']),
      isComplete: serializer.fromJson<bool>(json['isComplete']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      completedByName: serializer.fromJson<String?>(json['completedByName']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      updatedById: serializer.fromJson<String?>(json['updatedById']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'homeId': serializer.toJson<String>(homeId),
      'childId': serializer.toJson<String?>(childId),
      'areaKey': serializer.toJson<String>(areaKey),
      'areaLabel': serializer.toJson<String>(areaLabel),
      'taskKey': serializer.toJson<String>(taskKey),
      'taskLabel': serializer.toJson<String>(taskLabel),
      'shift': serializer.toJson<String>(shift),
      'date': serializer.toJson<String>(date),
      'isComplete': serializer.toJson<bool>(isComplete),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'completedByName': serializer.toJson<String?>(completedByName),
      'createdById': serializer.toJson<String?>(createdById),
      'updatedById': serializer.toJson<String?>(updatedById),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  ChecklistItemRow copyWith({
    String? id,
    String? homeId,
    Value<String?> childId = const Value.absent(),
    String? areaKey,
    String? areaLabel,
    String? taskKey,
    String? taskLabel,
    String? shift,
    String? date,
    bool? isComplete,
    Value<DateTime?> completedAt = const Value.absent(),
    Value<String?> completedByName = const Value.absent(),
    Value<String?> createdById = const Value.absent(),
    Value<String?> updatedById = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
  }) => ChecklistItemRow(
    id: id ?? this.id,
    homeId: homeId ?? this.homeId,
    childId: childId.present ? childId.value : this.childId,
    areaKey: areaKey ?? this.areaKey,
    areaLabel: areaLabel ?? this.areaLabel,
    taskKey: taskKey ?? this.taskKey,
    taskLabel: taskLabel ?? this.taskLabel,
    shift: shift ?? this.shift,
    date: date ?? this.date,
    isComplete: isComplete ?? this.isComplete,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    completedByName: completedByName.present
        ? completedByName.value
        : this.completedByName,
    createdById: createdById.present ? createdById.value : this.createdById,
    updatedById: updatedById.present ? updatedById.value : this.updatedById,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  ChecklistItemRow copyWithCompanion(ChecklistItemsTableCompanion data) {
    return ChecklistItemRow(
      id: data.id.present ? data.id.value : this.id,
      homeId: data.homeId.present ? data.homeId.value : this.homeId,
      childId: data.childId.present ? data.childId.value : this.childId,
      areaKey: data.areaKey.present ? data.areaKey.value : this.areaKey,
      areaLabel: data.areaLabel.present ? data.areaLabel.value : this.areaLabel,
      taskKey: data.taskKey.present ? data.taskKey.value : this.taskKey,
      taskLabel: data.taskLabel.present ? data.taskLabel.value : this.taskLabel,
      shift: data.shift.present ? data.shift.value : this.shift,
      date: data.date.present ? data.date.value : this.date,
      isComplete: data.isComplete.present
          ? data.isComplete.value
          : this.isComplete,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      completedByName: data.completedByName.present
          ? data.completedByName.value
          : this.completedByName,
      createdById: data.createdById.present
          ? data.createdById.value
          : this.createdById,
      updatedById: data.updatedById.present
          ? data.updatedById.value
          : this.updatedById,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChecklistItemRow(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('areaKey: $areaKey, ')
          ..write('areaLabel: $areaLabel, ')
          ..write('taskKey: $taskKey, ')
          ..write('taskLabel: $taskLabel, ')
          ..write('shift: $shift, ')
          ..write('date: $date, ')
          ..write('isComplete: $isComplete, ')
          ..write('completedAt: $completedAt, ')
          ..write('completedByName: $completedByName, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChecklistItemRow &&
          other.id == this.id &&
          other.homeId == this.homeId &&
          other.childId == this.childId &&
          other.areaKey == this.areaKey &&
          other.areaLabel == this.areaLabel &&
          other.taskKey == this.taskKey &&
          other.taskLabel == this.taskLabel &&
          other.shift == this.shift &&
          other.date == this.date &&
          other.isComplete == this.isComplete &&
          other.completedAt == this.completedAt &&
          other.completedByName == this.completedByName &&
          other.createdById == this.createdById &&
          other.updatedById == this.updatedById &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class ChecklistItemsTableCompanion extends UpdateCompanion<ChecklistItemRow> {
  final Value<String> id;
  final Value<String> homeId;
  final Value<String?> childId;
  final Value<String> areaKey;
  final Value<String> areaLabel;
  final Value<String> taskKey;
  final Value<String> taskLabel;
  final Value<String> shift;
  final Value<String> date;
  final Value<bool> isComplete;
  final Value<DateTime?> completedAt;
  final Value<String?> completedByName;
  final Value<String?> createdById;
  final Value<String?> updatedById;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const ChecklistItemsTableCompanion({
    this.id = const Value.absent(),
    this.homeId = const Value.absent(),
    this.childId = const Value.absent(),
    this.areaKey = const Value.absent(),
    this.areaLabel = const Value.absent(),
    this.taskKey = const Value.absent(),
    this.taskLabel = const Value.absent(),
    this.shift = const Value.absent(),
    this.date = const Value.absent(),
    this.isComplete = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.completedByName = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChecklistItemsTableCompanion.insert({
    required String id,
    required String homeId,
    this.childId = const Value.absent(),
    required String areaKey,
    required String areaLabel,
    required String taskKey,
    required String taskLabel,
    required String shift,
    required String date,
    this.isComplete = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.completedByName = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       homeId = Value(homeId),
       areaKey = Value(areaKey),
       areaLabel = Value(areaLabel),
       taskKey = Value(taskKey),
       taskLabel = Value(taskLabel),
       shift = Value(shift),
       date = Value(date),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ChecklistItemRow> custom({
    Expression<String>? id,
    Expression<String>? homeId,
    Expression<String>? childId,
    Expression<String>? areaKey,
    Expression<String>? areaLabel,
    Expression<String>? taskKey,
    Expression<String>? taskLabel,
    Expression<String>? shift,
    Expression<String>? date,
    Expression<bool>? isComplete,
    Expression<DateTime>? completedAt,
    Expression<String>? completedByName,
    Expression<String>? createdById,
    Expression<String>? updatedById,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (homeId != null) 'home_id': homeId,
      if (childId != null) 'child_id': childId,
      if (areaKey != null) 'area_key': areaKey,
      if (areaLabel != null) 'area_label': areaLabel,
      if (taskKey != null) 'task_key': taskKey,
      if (taskLabel != null) 'task_label': taskLabel,
      if (shift != null) 'shift': shift,
      if (date != null) 'date': date,
      if (isComplete != null) 'is_complete': isComplete,
      if (completedAt != null) 'completed_at': completedAt,
      if (completedByName != null) 'completed_by_name': completedByName,
      if (createdById != null) 'created_by_id': createdById,
      if (updatedById != null) 'updated_by_id': updatedById,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChecklistItemsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? homeId,
    Value<String?>? childId,
    Value<String>? areaKey,
    Value<String>? areaLabel,
    Value<String>? taskKey,
    Value<String>? taskLabel,
    Value<String>? shift,
    Value<String>? date,
    Value<bool>? isComplete,
    Value<DateTime?>? completedAt,
    Value<String?>? completedByName,
    Value<String?>? createdById,
    Value<String?>? updatedById,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return ChecklistItemsTableCompanion(
      id: id ?? this.id,
      homeId: homeId ?? this.homeId,
      childId: childId ?? this.childId,
      areaKey: areaKey ?? this.areaKey,
      areaLabel: areaLabel ?? this.areaLabel,
      taskKey: taskKey ?? this.taskKey,
      taskLabel: taskLabel ?? this.taskLabel,
      shift: shift ?? this.shift,
      date: date ?? this.date,
      isComplete: isComplete ?? this.isComplete,
      completedAt: completedAt ?? this.completedAt,
      completedByName: completedByName ?? this.completedByName,
      createdById: createdById ?? this.createdById,
      updatedById: updatedById ?? this.updatedById,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (homeId.present) {
      map['home_id'] = Variable<String>(homeId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<String>(childId.value);
    }
    if (areaKey.present) {
      map['area_key'] = Variable<String>(areaKey.value);
    }
    if (areaLabel.present) {
      map['area_label'] = Variable<String>(areaLabel.value);
    }
    if (taskKey.present) {
      map['task_key'] = Variable<String>(taskKey.value);
    }
    if (taskLabel.present) {
      map['task_label'] = Variable<String>(taskLabel.value);
    }
    if (shift.present) {
      map['shift'] = Variable<String>(shift.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (isComplete.present) {
      map['is_complete'] = Variable<bool>(isComplete.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (completedByName.present) {
      map['completed_by_name'] = Variable<String>(completedByName.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (updatedById.present) {
      map['updated_by_id'] = Variable<String>(updatedById.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChecklistItemsTableCompanion(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('areaKey: $areaKey, ')
          ..write('areaLabel: $areaLabel, ')
          ..write('taskKey: $taskKey, ')
          ..write('taskLabel: $taskLabel, ')
          ..write('shift: $shift, ')
          ..write('date: $date, ')
          ..write('isComplete: $isComplete, ')
          ..write('completedAt: $completedAt, ')
          ..write('completedByName: $completedByName, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AuditLogTableTable extends AuditLogTable
    with TableInfo<$AuditLogTableTable, AuditLogRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditLogTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userDisplayNameMeta = const VerificationMeta(
    'userDisplayName',
  );
  @override
  late final GeneratedColumn<String> userDisplayName = GeneratedColumn<String>(
    'user_display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _homeIdMeta = const VerificationMeta('homeId');
  @override
  late final GeneratedColumn<String> homeId = GeneratedColumn<String>(
    'home_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityTableMeta = const VerificationMeta(
    'entityTable',
  );
  @override
  late final GeneratedColumn<String> entityTable = GeneratedColumn<String>(
    'entity_table',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordIdMeta = const VerificationMeta(
    'recordId',
  );
  @override
  late final GeneratedColumn<String> recordId = GeneratedColumn<String>(
    'record_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _beforeMeta = const VerificationMeta('before');
  @override
  late final GeneratedColumn<String> before = GeneratedColumn<String>(
    'before',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _afterMeta = const VerificationMeta('after');
  @override
  late final GeneratedColumn<String> after = GeneratedColumn<String>(
    'after',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    userDisplayName,
    homeId,
    action,
    entityTable,
    recordId,
    before,
    after,
    timestamp,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit_log';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuditLogRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('user_display_name')) {
      context.handle(
        _userDisplayNameMeta,
        userDisplayName.isAcceptableOrUnknown(
          data['user_display_name']!,
          _userDisplayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_userDisplayNameMeta);
    }
    if (data.containsKey('home_id')) {
      context.handle(
        _homeIdMeta,
        homeId.isAcceptableOrUnknown(data['home_id']!, _homeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_homeIdMeta);
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('entity_table')) {
      context.handle(
        _entityTableMeta,
        entityTable.isAcceptableOrUnknown(
          data['entity_table']!,
          _entityTableMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_entityTableMeta);
    }
    if (data.containsKey('record_id')) {
      context.handle(
        _recordIdMeta,
        recordId.isAcceptableOrUnknown(data['record_id']!, _recordIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recordIdMeta);
    }
    if (data.containsKey('before')) {
      context.handle(
        _beforeMeta,
        before.isAcceptableOrUnknown(data['before']!, _beforeMeta),
      );
    }
    if (data.containsKey('after')) {
      context.handle(
        _afterMeta,
        after.isAcceptableOrUnknown(data['after']!, _afterMeta),
      );
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuditLogRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditLogRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      userDisplayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_display_name'],
      )!,
      homeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_id'],
      )!,
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      entityTable: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_table'],
      )!,
      recordId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}record_id'],
      )!,
      before: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}before'],
      ),
      after: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}after'],
      ),
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $AuditLogTableTable createAlias(String alias) {
    return $AuditLogTableTable(attachedDatabase, alias);
  }
}

class AuditLogRow extends DataClass implements Insertable<AuditLogRow> {
  final String id;
  final String userId;
  final String userDisplayName;
  final String homeId;

  /// 'insert', 'update', or 'delete'
  final String action;

  /// The Drift table name the mutation affected (e.g. 'daily_notes')
  final String entityTable;
  final String recordId;

  /// JSON snapshot of the record before the change (null for inserts)
  final String? before;

  /// JSON snapshot of the record after the change (null for deletes)
  final String? after;
  final DateTime timestamp;
  final bool isSynced;
  const AuditLogRow({
    required this.id,
    required this.userId,
    required this.userDisplayName,
    required this.homeId,
    required this.action,
    required this.entityTable,
    required this.recordId,
    this.before,
    this.after,
    required this.timestamp,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['user_display_name'] = Variable<String>(userDisplayName);
    map['home_id'] = Variable<String>(homeId);
    map['action'] = Variable<String>(action);
    map['entity_table'] = Variable<String>(entityTable);
    map['record_id'] = Variable<String>(recordId);
    if (!nullToAbsent || before != null) {
      map['before'] = Variable<String>(before);
    }
    if (!nullToAbsent || after != null) {
      map['after'] = Variable<String>(after);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  AuditLogTableCompanion toCompanion(bool nullToAbsent) {
    return AuditLogTableCompanion(
      id: Value(id),
      userId: Value(userId),
      userDisplayName: Value(userDisplayName),
      homeId: Value(homeId),
      action: Value(action),
      entityTable: Value(entityTable),
      recordId: Value(recordId),
      before: before == null && nullToAbsent
          ? const Value.absent()
          : Value(before),
      after: after == null && nullToAbsent
          ? const Value.absent()
          : Value(after),
      timestamp: Value(timestamp),
      isSynced: Value(isSynced),
    );
  }

  factory AuditLogRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuditLogRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      userDisplayName: serializer.fromJson<String>(json['userDisplayName']),
      homeId: serializer.fromJson<String>(json['homeId']),
      action: serializer.fromJson<String>(json['action']),
      entityTable: serializer.fromJson<String>(json['entityTable']),
      recordId: serializer.fromJson<String>(json['recordId']),
      before: serializer.fromJson<String?>(json['before']),
      after: serializer.fromJson<String?>(json['after']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'userDisplayName': serializer.toJson<String>(userDisplayName),
      'homeId': serializer.toJson<String>(homeId),
      'action': serializer.toJson<String>(action),
      'entityTable': serializer.toJson<String>(entityTable),
      'recordId': serializer.toJson<String>(recordId),
      'before': serializer.toJson<String?>(before),
      'after': serializer.toJson<String?>(after),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  AuditLogRow copyWith({
    String? id,
    String? userId,
    String? userDisplayName,
    String? homeId,
    String? action,
    String? entityTable,
    String? recordId,
    Value<String?> before = const Value.absent(),
    Value<String?> after = const Value.absent(),
    DateTime? timestamp,
    bool? isSynced,
  }) => AuditLogRow(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    userDisplayName: userDisplayName ?? this.userDisplayName,
    homeId: homeId ?? this.homeId,
    action: action ?? this.action,
    entityTable: entityTable ?? this.entityTable,
    recordId: recordId ?? this.recordId,
    before: before.present ? before.value : this.before,
    after: after.present ? after.value : this.after,
    timestamp: timestamp ?? this.timestamp,
    isSynced: isSynced ?? this.isSynced,
  );
  AuditLogRow copyWithCompanion(AuditLogTableCompanion data) {
    return AuditLogRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      userDisplayName: data.userDisplayName.present
          ? data.userDisplayName.value
          : this.userDisplayName,
      homeId: data.homeId.present ? data.homeId.value : this.homeId,
      action: data.action.present ? data.action.value : this.action,
      entityTable: data.entityTable.present
          ? data.entityTable.value
          : this.entityTable,
      recordId: data.recordId.present ? data.recordId.value : this.recordId,
      before: data.before.present ? data.before.value : this.before,
      after: data.after.present ? data.after.value : this.after,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('userDisplayName: $userDisplayName, ')
          ..write('homeId: $homeId, ')
          ..write('action: $action, ')
          ..write('entityTable: $entityTable, ')
          ..write('recordId: $recordId, ')
          ..write('before: $before, ')
          ..write('after: $after, ')
          ..write('timestamp: $timestamp, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    userDisplayName,
    homeId,
    action,
    entityTable,
    recordId,
    before,
    after,
    timestamp,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditLogRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.userDisplayName == this.userDisplayName &&
          other.homeId == this.homeId &&
          other.action == this.action &&
          other.entityTable == this.entityTable &&
          other.recordId == this.recordId &&
          other.before == this.before &&
          other.after == this.after &&
          other.timestamp == this.timestamp &&
          other.isSynced == this.isSynced);
}

class AuditLogTableCompanion extends UpdateCompanion<AuditLogRow> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> userDisplayName;
  final Value<String> homeId;
  final Value<String> action;
  final Value<String> entityTable;
  final Value<String> recordId;
  final Value<String?> before;
  final Value<String?> after;
  final Value<DateTime> timestamp;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const AuditLogTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.userDisplayName = const Value.absent(),
    this.homeId = const Value.absent(),
    this.action = const Value.absent(),
    this.entityTable = const Value.absent(),
    this.recordId = const Value.absent(),
    this.before = const Value.absent(),
    this.after = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AuditLogTableCompanion.insert({
    required String id,
    required String userId,
    required String userDisplayName,
    required String homeId,
    required String action,
    required String entityTable,
    required String recordId,
    this.before = const Value.absent(),
    this.after = const Value.absent(),
    required DateTime timestamp,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       userDisplayName = Value(userDisplayName),
       homeId = Value(homeId),
       action = Value(action),
       entityTable = Value(entityTable),
       recordId = Value(recordId),
       timestamp = Value(timestamp);
  static Insertable<AuditLogRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? userDisplayName,
    Expression<String>? homeId,
    Expression<String>? action,
    Expression<String>? entityTable,
    Expression<String>? recordId,
    Expression<String>? before,
    Expression<String>? after,
    Expression<DateTime>? timestamp,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (userDisplayName != null) 'user_display_name': userDisplayName,
      if (homeId != null) 'home_id': homeId,
      if (action != null) 'action': action,
      if (entityTable != null) 'entity_table': entityTable,
      if (recordId != null) 'record_id': recordId,
      if (before != null) 'before': before,
      if (after != null) 'after': after,
      if (timestamp != null) 'timestamp': timestamp,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AuditLogTableCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? userDisplayName,
    Value<String>? homeId,
    Value<String>? action,
    Value<String>? entityTable,
    Value<String>? recordId,
    Value<String?>? before,
    Value<String?>? after,
    Value<DateTime>? timestamp,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return AuditLogTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userDisplayName: userDisplayName ?? this.userDisplayName,
      homeId: homeId ?? this.homeId,
      action: action ?? this.action,
      entityTable: entityTable ?? this.entityTable,
      recordId: recordId ?? this.recordId,
      before: before ?? this.before,
      after: after ?? this.after,
      timestamp: timestamp ?? this.timestamp,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (userDisplayName.present) {
      map['user_display_name'] = Variable<String>(userDisplayName.value);
    }
    if (homeId.present) {
      map['home_id'] = Variable<String>(homeId.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (entityTable.present) {
      map['entity_table'] = Variable<String>(entityTable.value);
    }
    if (recordId.present) {
      map['record_id'] = Variable<String>(recordId.value);
    }
    if (before.present) {
      map['before'] = Variable<String>(before.value);
    }
    if (after.present) {
      map['after'] = Variable<String>(after.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('userDisplayName: $userDisplayName, ')
          ..write('homeId: $homeId, ')
          ..write('action: $action, ')
          ..write('entityTable: $entityTable, ')
          ..write('recordId: $recordId, ')
          ..write('before: $before, ')
          ..write('after: $after, ')
          ..write('timestamp: $timestamp, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BathTempRecordsTableTable extends BathTempRecordsTable
    with TableInfo<$BathTempRecordsTableTable, BathTempRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BathTempRecordsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _homeIdMeta = const VerificationMeta('homeId');
  @override
  late final GeneratedColumn<String> homeId = GeneratedColumn<String>(
    'home_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _childIdMeta = const VerificationMeta(
    'childId',
  );
  @override
  late final GeneratedColumn<String> childId = GeneratedColumn<String>(
    'child_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _temperatureCelsiusMeta =
      const VerificationMeta('temperatureCelsius');
  @override
  late final GeneratedColumn<double> temperatureCelsius =
      GeneratedColumn<double>(
        'temperature_celsius',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _shiftMeta = const VerificationMeta('shift');
  @override
  late final GeneratedColumn<String> shift = GeneratedColumn<String>(
    'shift',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordedByIdMeta = const VerificationMeta(
    'recordedById',
  );
  @override
  late final GeneratedColumn<String> recordedById = GeneratedColumn<String>(
    'recorded_by_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordedByNameMeta = const VerificationMeta(
    'recordedByName',
  );
  @override
  late final GeneratedColumn<String> recordedByName = GeneratedColumn<String>(
    'recorded_by_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdByIdMeta = const VerificationMeta(
    'createdById',
  );
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
    'created_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByIdMeta = const VerificationMeta(
    'updatedById',
  );
  @override
  late final GeneratedColumn<String> updatedById = GeneratedColumn<String>(
    'updated_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    homeId,
    childId,
    temperatureCelsius,
    shift,
    recordedAt,
    recordedById,
    recordedByName,
    notes,
    createdById,
    updatedById,
    deletedAt,
    createdAt,
    updatedAt,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bath_temp_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<BathTempRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('home_id')) {
      context.handle(
        _homeIdMeta,
        homeId.isAcceptableOrUnknown(data['home_id']!, _homeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_homeIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(
        _childIdMeta,
        childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta),
      );
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('temperature_celsius')) {
      context.handle(
        _temperatureCelsiusMeta,
        temperatureCelsius.isAcceptableOrUnknown(
          data['temperature_celsius']!,
          _temperatureCelsiusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_temperatureCelsiusMeta);
    }
    if (data.containsKey('shift')) {
      context.handle(
        _shiftMeta,
        shift.isAcceptableOrUnknown(data['shift']!, _shiftMeta),
      );
    } else if (isInserting) {
      context.missing(_shiftMeta);
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    if (data.containsKey('recorded_by_id')) {
      context.handle(
        _recordedByIdMeta,
        recordedById.isAcceptableOrUnknown(
          data['recorded_by_id']!,
          _recordedByIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recordedByIdMeta);
    }
    if (data.containsKey('recorded_by_name')) {
      context.handle(
        _recordedByNameMeta,
        recordedByName.isAcceptableOrUnknown(
          data['recorded_by_name']!,
          _recordedByNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recordedByNameMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
        _createdByIdMeta,
        createdById.isAcceptableOrUnknown(
          data['created_by_id']!,
          _createdByIdMeta,
        ),
      );
    }
    if (data.containsKey('updated_by_id')) {
      context.handle(
        _updatedByIdMeta,
        updatedById.isAcceptableOrUnknown(
          data['updated_by_id']!,
          _updatedByIdMeta,
        ),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BathTempRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BathTempRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      homeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_id'],
      )!,
      childId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}child_id'],
      )!,
      temperatureCelsius: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}temperature_celsius'],
      )!,
      shift: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shift'],
      )!,
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
      recordedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorded_by_id'],
      )!,
      recordedByName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorded_by_name'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_id'],
      ),
      updatedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by_id'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $BathTempRecordsTableTable createAlias(String alias) {
    return $BathTempRecordsTableTable(attachedDatabase, alias);
  }
}

class BathTempRow extends DataClass implements Insertable<BathTempRow> {
  final String id;
  final String homeId;
  final String childId;
  final double temperatureCelsius;
  final String shift;
  final DateTime recordedAt;
  final String recordedById;
  final String recordedByName;
  final String? notes;
  final String? createdById;
  final String? updatedById;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSynced;
  const BathTempRow({
    required this.id,
    required this.homeId,
    required this.childId,
    required this.temperatureCelsius,
    required this.shift,
    required this.recordedAt,
    required this.recordedById,
    required this.recordedByName,
    this.notes,
    this.createdById,
    this.updatedById,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['home_id'] = Variable<String>(homeId);
    map['child_id'] = Variable<String>(childId);
    map['temperature_celsius'] = Variable<double>(temperatureCelsius);
    map['shift'] = Variable<String>(shift);
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    map['recorded_by_id'] = Variable<String>(recordedById);
    map['recorded_by_name'] = Variable<String>(recordedByName);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || updatedById != null) {
      map['updated_by_id'] = Variable<String>(updatedById);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  BathTempRecordsTableCompanion toCompanion(bool nullToAbsent) {
    return BathTempRecordsTableCompanion(
      id: Value(id),
      homeId: Value(homeId),
      childId: Value(childId),
      temperatureCelsius: Value(temperatureCelsius),
      shift: Value(shift),
      recordedAt: Value(recordedAt),
      recordedById: Value(recordedById),
      recordedByName: Value(recordedByName),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      updatedById: updatedById == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedById),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory BathTempRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BathTempRow(
      id: serializer.fromJson<String>(json['id']),
      homeId: serializer.fromJson<String>(json['homeId']),
      childId: serializer.fromJson<String>(json['childId']),
      temperatureCelsius: serializer.fromJson<double>(
        json['temperatureCelsius'],
      ),
      shift: serializer.fromJson<String>(json['shift']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
      recordedById: serializer.fromJson<String>(json['recordedById']),
      recordedByName: serializer.fromJson<String>(json['recordedByName']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      updatedById: serializer.fromJson<String?>(json['updatedById']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'homeId': serializer.toJson<String>(homeId),
      'childId': serializer.toJson<String>(childId),
      'temperatureCelsius': serializer.toJson<double>(temperatureCelsius),
      'shift': serializer.toJson<String>(shift),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
      'recordedById': serializer.toJson<String>(recordedById),
      'recordedByName': serializer.toJson<String>(recordedByName),
      'notes': serializer.toJson<String?>(notes),
      'createdById': serializer.toJson<String?>(createdById),
      'updatedById': serializer.toJson<String?>(updatedById),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  BathTempRow copyWith({
    String? id,
    String? homeId,
    String? childId,
    double? temperatureCelsius,
    String? shift,
    DateTime? recordedAt,
    String? recordedById,
    String? recordedByName,
    Value<String?> notes = const Value.absent(),
    Value<String?> createdById = const Value.absent(),
    Value<String?> updatedById = const Value.absent(),
    Value<DateTime?> deletedAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
  }) => BathTempRow(
    id: id ?? this.id,
    homeId: homeId ?? this.homeId,
    childId: childId ?? this.childId,
    temperatureCelsius: temperatureCelsius ?? this.temperatureCelsius,
    shift: shift ?? this.shift,
    recordedAt: recordedAt ?? this.recordedAt,
    recordedById: recordedById ?? this.recordedById,
    recordedByName: recordedByName ?? this.recordedByName,
    notes: notes.present ? notes.value : this.notes,
    createdById: createdById.present ? createdById.value : this.createdById,
    updatedById: updatedById.present ? updatedById.value : this.updatedById,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  BathTempRow copyWithCompanion(BathTempRecordsTableCompanion data) {
    return BathTempRow(
      id: data.id.present ? data.id.value : this.id,
      homeId: data.homeId.present ? data.homeId.value : this.homeId,
      childId: data.childId.present ? data.childId.value : this.childId,
      temperatureCelsius: data.temperatureCelsius.present
          ? data.temperatureCelsius.value
          : this.temperatureCelsius,
      shift: data.shift.present ? data.shift.value : this.shift,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
      recordedById: data.recordedById.present
          ? data.recordedById.value
          : this.recordedById,
      recordedByName: data.recordedByName.present
          ? data.recordedByName.value
          : this.recordedByName,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdById: data.createdById.present
          ? data.createdById.value
          : this.createdById,
      updatedById: data.updatedById.present
          ? data.updatedById.value
          : this.updatedById,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BathTempRow(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('temperatureCelsius: $temperatureCelsius, ')
          ..write('shift: $shift, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('recordedById: $recordedById, ')
          ..write('recordedByName: $recordedByName, ')
          ..write('notes: $notes, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    homeId,
    childId,
    temperatureCelsius,
    shift,
    recordedAt,
    recordedById,
    recordedByName,
    notes,
    createdById,
    updatedById,
    deletedAt,
    createdAt,
    updatedAt,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BathTempRow &&
          other.id == this.id &&
          other.homeId == this.homeId &&
          other.childId == this.childId &&
          other.temperatureCelsius == this.temperatureCelsius &&
          other.shift == this.shift &&
          other.recordedAt == this.recordedAt &&
          other.recordedById == this.recordedById &&
          other.recordedByName == this.recordedByName &&
          other.notes == this.notes &&
          other.createdById == this.createdById &&
          other.updatedById == this.updatedById &&
          other.deletedAt == this.deletedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class BathTempRecordsTableCompanion extends UpdateCompanion<BathTempRow> {
  final Value<String> id;
  final Value<String> homeId;
  final Value<String> childId;
  final Value<double> temperatureCelsius;
  final Value<String> shift;
  final Value<DateTime> recordedAt;
  final Value<String> recordedById;
  final Value<String> recordedByName;
  final Value<String?> notes;
  final Value<String?> createdById;
  final Value<String?> updatedById;
  final Value<DateTime?> deletedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const BathTempRecordsTableCompanion({
    this.id = const Value.absent(),
    this.homeId = const Value.absent(),
    this.childId = const Value.absent(),
    this.temperatureCelsius = const Value.absent(),
    this.shift = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.recordedById = const Value.absent(),
    this.recordedByName = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BathTempRecordsTableCompanion.insert({
    required String id,
    required String homeId,
    required String childId,
    required double temperatureCelsius,
    required String shift,
    required DateTime recordedAt,
    required String recordedById,
    required String recordedByName,
    this.notes = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       homeId = Value(homeId),
       childId = Value(childId),
       temperatureCelsius = Value(temperatureCelsius),
       shift = Value(shift),
       recordedAt = Value(recordedAt),
       recordedById = Value(recordedById),
       recordedByName = Value(recordedByName),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<BathTempRow> custom({
    Expression<String>? id,
    Expression<String>? homeId,
    Expression<String>? childId,
    Expression<double>? temperatureCelsius,
    Expression<String>? shift,
    Expression<DateTime>? recordedAt,
    Expression<String>? recordedById,
    Expression<String>? recordedByName,
    Expression<String>? notes,
    Expression<String>? createdById,
    Expression<String>? updatedById,
    Expression<DateTime>? deletedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (homeId != null) 'home_id': homeId,
      if (childId != null) 'child_id': childId,
      if (temperatureCelsius != null) 'temperature_celsius': temperatureCelsius,
      if (shift != null) 'shift': shift,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (recordedById != null) 'recorded_by_id': recordedById,
      if (recordedByName != null) 'recorded_by_name': recordedByName,
      if (notes != null) 'notes': notes,
      if (createdById != null) 'created_by_id': createdById,
      if (updatedById != null) 'updated_by_id': updatedById,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BathTempRecordsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? homeId,
    Value<String>? childId,
    Value<double>? temperatureCelsius,
    Value<String>? shift,
    Value<DateTime>? recordedAt,
    Value<String>? recordedById,
    Value<String>? recordedByName,
    Value<String?>? notes,
    Value<String?>? createdById,
    Value<String?>? updatedById,
    Value<DateTime?>? deletedAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return BathTempRecordsTableCompanion(
      id: id ?? this.id,
      homeId: homeId ?? this.homeId,
      childId: childId ?? this.childId,
      temperatureCelsius: temperatureCelsius ?? this.temperatureCelsius,
      shift: shift ?? this.shift,
      recordedAt: recordedAt ?? this.recordedAt,
      recordedById: recordedById ?? this.recordedById,
      recordedByName: recordedByName ?? this.recordedByName,
      notes: notes ?? this.notes,
      createdById: createdById ?? this.createdById,
      updatedById: updatedById ?? this.updatedById,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (homeId.present) {
      map['home_id'] = Variable<String>(homeId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<String>(childId.value);
    }
    if (temperatureCelsius.present) {
      map['temperature_celsius'] = Variable<double>(temperatureCelsius.value);
    }
    if (shift.present) {
      map['shift'] = Variable<String>(shift.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (recordedById.present) {
      map['recorded_by_id'] = Variable<String>(recordedById.value);
    }
    if (recordedByName.present) {
      map['recorded_by_name'] = Variable<String>(recordedByName.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (updatedById.present) {
      map['updated_by_id'] = Variable<String>(updatedById.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BathTempRecordsTableCompanion(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('temperatureCelsius: $temperatureCelsius, ')
          ..write('shift: $shift, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('recordedById: $recordedById, ')
          ..write('recordedByName: $recordedByName, ')
          ..write('notes: $notes, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VisitorLogTableTable extends VisitorLogTable
    with TableInfo<$VisitorLogTableTable, VisitorLogRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VisitorLogTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _homeIdMeta = const VerificationMeta('homeId');
  @override
  late final GeneratedColumn<String> homeId = GeneratedColumn<String>(
    'home_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _visitorNameMeta = const VerificationMeta(
    'visitorName',
  );
  @override
  late final GeneratedColumn<String> visitorName = GeneratedColumn<String>(
    'visitor_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _relationMeta = const VerificationMeta(
    'relation',
  );
  @override
  late final GeneratedColumn<String> relation = GeneratedColumn<String>(
    'relation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _purposeMeta = const VerificationMeta(
    'purpose',
  );
  @override
  late final GeneratedColumn<String> purpose = GeneratedColumn<String>(
    'purpose',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _authorisedByMeta = const VerificationMeta(
    'authorisedBy',
  );
  @override
  late final GeneratedColumn<String> authorisedBy = GeneratedColumn<String>(
    'authorised_by',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _arrivedAtMeta = const VerificationMeta(
    'arrivedAt',
  );
  @override
  late final GeneratedColumn<DateTime> arrivedAt = GeneratedColumn<DateTime>(
    'arrived_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _departedAtMeta = const VerificationMeta(
    'departedAt',
  );
  @override
  late final GeneratedColumn<DateTime> departedAt = GeneratedColumn<DateTime>(
    'departed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recordedByIdMeta = const VerificationMeta(
    'recordedById',
  );
  @override
  late final GeneratedColumn<String> recordedById = GeneratedColumn<String>(
    'recorded_by_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordedByNameMeta = const VerificationMeta(
    'recordedByName',
  );
  @override
  late final GeneratedColumn<String> recordedByName = GeneratedColumn<String>(
    'recorded_by_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdByIdMeta = const VerificationMeta(
    'createdById',
  );
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
    'created_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByIdMeta = const VerificationMeta(
    'updatedById',
  );
  @override
  late final GeneratedColumn<String> updatedById = GeneratedColumn<String>(
    'updated_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    homeId,
    visitorName,
    relation,
    purpose,
    authorisedBy,
    arrivedAt,
    departedAt,
    notes,
    recordedById,
    recordedByName,
    createdById,
    updatedById,
    deletedAt,
    createdAt,
    updatedAt,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'visitor_log';
  @override
  VerificationContext validateIntegrity(
    Insertable<VisitorLogRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('home_id')) {
      context.handle(
        _homeIdMeta,
        homeId.isAcceptableOrUnknown(data['home_id']!, _homeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_homeIdMeta);
    }
    if (data.containsKey('visitor_name')) {
      context.handle(
        _visitorNameMeta,
        visitorName.isAcceptableOrUnknown(
          data['visitor_name']!,
          _visitorNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_visitorNameMeta);
    }
    if (data.containsKey('relation')) {
      context.handle(
        _relationMeta,
        relation.isAcceptableOrUnknown(data['relation']!, _relationMeta),
      );
    }
    if (data.containsKey('purpose')) {
      context.handle(
        _purposeMeta,
        purpose.isAcceptableOrUnknown(data['purpose']!, _purposeMeta),
      );
    } else if (isInserting) {
      context.missing(_purposeMeta);
    }
    if (data.containsKey('authorised_by')) {
      context.handle(
        _authorisedByMeta,
        authorisedBy.isAcceptableOrUnknown(
          data['authorised_by']!,
          _authorisedByMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_authorisedByMeta);
    }
    if (data.containsKey('arrived_at')) {
      context.handle(
        _arrivedAtMeta,
        arrivedAt.isAcceptableOrUnknown(data['arrived_at']!, _arrivedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_arrivedAtMeta);
    }
    if (data.containsKey('departed_at')) {
      context.handle(
        _departedAtMeta,
        departedAt.isAcceptableOrUnknown(data['departed_at']!, _departedAtMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('recorded_by_id')) {
      context.handle(
        _recordedByIdMeta,
        recordedById.isAcceptableOrUnknown(
          data['recorded_by_id']!,
          _recordedByIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recordedByIdMeta);
    }
    if (data.containsKey('recorded_by_name')) {
      context.handle(
        _recordedByNameMeta,
        recordedByName.isAcceptableOrUnknown(
          data['recorded_by_name']!,
          _recordedByNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recordedByNameMeta);
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
        _createdByIdMeta,
        createdById.isAcceptableOrUnknown(
          data['created_by_id']!,
          _createdByIdMeta,
        ),
      );
    }
    if (data.containsKey('updated_by_id')) {
      context.handle(
        _updatedByIdMeta,
        updatedById.isAcceptableOrUnknown(
          data['updated_by_id']!,
          _updatedByIdMeta,
        ),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VisitorLogRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VisitorLogRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      homeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_id'],
      )!,
      visitorName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}visitor_name'],
      )!,
      relation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relation'],
      ),
      purpose: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}purpose'],
      )!,
      authorisedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}authorised_by'],
      )!,
      arrivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}arrived_at'],
      )!,
      departedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}departed_at'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      recordedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorded_by_id'],
      )!,
      recordedByName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorded_by_name'],
      )!,
      createdById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_id'],
      ),
      updatedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by_id'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $VisitorLogTableTable createAlias(String alias) {
    return $VisitorLogTableTable(attachedDatabase, alias);
  }
}

class VisitorLogRow extends DataClass implements Insertable<VisitorLogRow> {
  final String id;
  final String homeId;
  final String visitorName;
  final String? relation;
  final String purpose;
  final String authorisedBy;
  final DateTime arrivedAt;
  final DateTime? departedAt;
  final String? notes;
  final String recordedById;
  final String recordedByName;
  final String? createdById;
  final String? updatedById;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSynced;
  const VisitorLogRow({
    required this.id,
    required this.homeId,
    required this.visitorName,
    this.relation,
    required this.purpose,
    required this.authorisedBy,
    required this.arrivedAt,
    this.departedAt,
    this.notes,
    required this.recordedById,
    required this.recordedByName,
    this.createdById,
    this.updatedById,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['home_id'] = Variable<String>(homeId);
    map['visitor_name'] = Variable<String>(visitorName);
    if (!nullToAbsent || relation != null) {
      map['relation'] = Variable<String>(relation);
    }
    map['purpose'] = Variable<String>(purpose);
    map['authorised_by'] = Variable<String>(authorisedBy);
    map['arrived_at'] = Variable<DateTime>(arrivedAt);
    if (!nullToAbsent || departedAt != null) {
      map['departed_at'] = Variable<DateTime>(departedAt);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['recorded_by_id'] = Variable<String>(recordedById);
    map['recorded_by_name'] = Variable<String>(recordedByName);
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || updatedById != null) {
      map['updated_by_id'] = Variable<String>(updatedById);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  VisitorLogTableCompanion toCompanion(bool nullToAbsent) {
    return VisitorLogTableCompanion(
      id: Value(id),
      homeId: Value(homeId),
      visitorName: Value(visitorName),
      relation: relation == null && nullToAbsent
          ? const Value.absent()
          : Value(relation),
      purpose: Value(purpose),
      authorisedBy: Value(authorisedBy),
      arrivedAt: Value(arrivedAt),
      departedAt: departedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(departedAt),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      recordedById: Value(recordedById),
      recordedByName: Value(recordedByName),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      updatedById: updatedById == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedById),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory VisitorLogRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VisitorLogRow(
      id: serializer.fromJson<String>(json['id']),
      homeId: serializer.fromJson<String>(json['homeId']),
      visitorName: serializer.fromJson<String>(json['visitorName']),
      relation: serializer.fromJson<String?>(json['relation']),
      purpose: serializer.fromJson<String>(json['purpose']),
      authorisedBy: serializer.fromJson<String>(json['authorisedBy']),
      arrivedAt: serializer.fromJson<DateTime>(json['arrivedAt']),
      departedAt: serializer.fromJson<DateTime?>(json['departedAt']),
      notes: serializer.fromJson<String?>(json['notes']),
      recordedById: serializer.fromJson<String>(json['recordedById']),
      recordedByName: serializer.fromJson<String>(json['recordedByName']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      updatedById: serializer.fromJson<String?>(json['updatedById']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'homeId': serializer.toJson<String>(homeId),
      'visitorName': serializer.toJson<String>(visitorName),
      'relation': serializer.toJson<String?>(relation),
      'purpose': serializer.toJson<String>(purpose),
      'authorisedBy': serializer.toJson<String>(authorisedBy),
      'arrivedAt': serializer.toJson<DateTime>(arrivedAt),
      'departedAt': serializer.toJson<DateTime?>(departedAt),
      'notes': serializer.toJson<String?>(notes),
      'recordedById': serializer.toJson<String>(recordedById),
      'recordedByName': serializer.toJson<String>(recordedByName),
      'createdById': serializer.toJson<String?>(createdById),
      'updatedById': serializer.toJson<String?>(updatedById),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  VisitorLogRow copyWith({
    String? id,
    String? homeId,
    String? visitorName,
    Value<String?> relation = const Value.absent(),
    String? purpose,
    String? authorisedBy,
    DateTime? arrivedAt,
    Value<DateTime?> departedAt = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    String? recordedById,
    String? recordedByName,
    Value<String?> createdById = const Value.absent(),
    Value<String?> updatedById = const Value.absent(),
    Value<DateTime?> deletedAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
  }) => VisitorLogRow(
    id: id ?? this.id,
    homeId: homeId ?? this.homeId,
    visitorName: visitorName ?? this.visitorName,
    relation: relation.present ? relation.value : this.relation,
    purpose: purpose ?? this.purpose,
    authorisedBy: authorisedBy ?? this.authorisedBy,
    arrivedAt: arrivedAt ?? this.arrivedAt,
    departedAt: departedAt.present ? departedAt.value : this.departedAt,
    notes: notes.present ? notes.value : this.notes,
    recordedById: recordedById ?? this.recordedById,
    recordedByName: recordedByName ?? this.recordedByName,
    createdById: createdById.present ? createdById.value : this.createdById,
    updatedById: updatedById.present ? updatedById.value : this.updatedById,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  VisitorLogRow copyWithCompanion(VisitorLogTableCompanion data) {
    return VisitorLogRow(
      id: data.id.present ? data.id.value : this.id,
      homeId: data.homeId.present ? data.homeId.value : this.homeId,
      visitorName: data.visitorName.present
          ? data.visitorName.value
          : this.visitorName,
      relation: data.relation.present ? data.relation.value : this.relation,
      purpose: data.purpose.present ? data.purpose.value : this.purpose,
      authorisedBy: data.authorisedBy.present
          ? data.authorisedBy.value
          : this.authorisedBy,
      arrivedAt: data.arrivedAt.present ? data.arrivedAt.value : this.arrivedAt,
      departedAt: data.departedAt.present
          ? data.departedAt.value
          : this.departedAt,
      notes: data.notes.present ? data.notes.value : this.notes,
      recordedById: data.recordedById.present
          ? data.recordedById.value
          : this.recordedById,
      recordedByName: data.recordedByName.present
          ? data.recordedByName.value
          : this.recordedByName,
      createdById: data.createdById.present
          ? data.createdById.value
          : this.createdById,
      updatedById: data.updatedById.present
          ? data.updatedById.value
          : this.updatedById,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VisitorLogRow(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('visitorName: $visitorName, ')
          ..write('relation: $relation, ')
          ..write('purpose: $purpose, ')
          ..write('authorisedBy: $authorisedBy, ')
          ..write('arrivedAt: $arrivedAt, ')
          ..write('departedAt: $departedAt, ')
          ..write('notes: $notes, ')
          ..write('recordedById: $recordedById, ')
          ..write('recordedByName: $recordedByName, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    homeId,
    visitorName,
    relation,
    purpose,
    authorisedBy,
    arrivedAt,
    departedAt,
    notes,
    recordedById,
    recordedByName,
    createdById,
    updatedById,
    deletedAt,
    createdAt,
    updatedAt,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VisitorLogRow &&
          other.id == this.id &&
          other.homeId == this.homeId &&
          other.visitorName == this.visitorName &&
          other.relation == this.relation &&
          other.purpose == this.purpose &&
          other.authorisedBy == this.authorisedBy &&
          other.arrivedAt == this.arrivedAt &&
          other.departedAt == this.departedAt &&
          other.notes == this.notes &&
          other.recordedById == this.recordedById &&
          other.recordedByName == this.recordedByName &&
          other.createdById == this.createdById &&
          other.updatedById == this.updatedById &&
          other.deletedAt == this.deletedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class VisitorLogTableCompanion extends UpdateCompanion<VisitorLogRow> {
  final Value<String> id;
  final Value<String> homeId;
  final Value<String> visitorName;
  final Value<String?> relation;
  final Value<String> purpose;
  final Value<String> authorisedBy;
  final Value<DateTime> arrivedAt;
  final Value<DateTime?> departedAt;
  final Value<String?> notes;
  final Value<String> recordedById;
  final Value<String> recordedByName;
  final Value<String?> createdById;
  final Value<String?> updatedById;
  final Value<DateTime?> deletedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const VisitorLogTableCompanion({
    this.id = const Value.absent(),
    this.homeId = const Value.absent(),
    this.visitorName = const Value.absent(),
    this.relation = const Value.absent(),
    this.purpose = const Value.absent(),
    this.authorisedBy = const Value.absent(),
    this.arrivedAt = const Value.absent(),
    this.departedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.recordedById = const Value.absent(),
    this.recordedByName = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VisitorLogTableCompanion.insert({
    required String id,
    required String homeId,
    required String visitorName,
    this.relation = const Value.absent(),
    required String purpose,
    required String authorisedBy,
    required DateTime arrivedAt,
    this.departedAt = const Value.absent(),
    this.notes = const Value.absent(),
    required String recordedById,
    required String recordedByName,
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       homeId = Value(homeId),
       visitorName = Value(visitorName),
       purpose = Value(purpose),
       authorisedBy = Value(authorisedBy),
       arrivedAt = Value(arrivedAt),
       recordedById = Value(recordedById),
       recordedByName = Value(recordedByName),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<VisitorLogRow> custom({
    Expression<String>? id,
    Expression<String>? homeId,
    Expression<String>? visitorName,
    Expression<String>? relation,
    Expression<String>? purpose,
    Expression<String>? authorisedBy,
    Expression<DateTime>? arrivedAt,
    Expression<DateTime>? departedAt,
    Expression<String>? notes,
    Expression<String>? recordedById,
    Expression<String>? recordedByName,
    Expression<String>? createdById,
    Expression<String>? updatedById,
    Expression<DateTime>? deletedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (homeId != null) 'home_id': homeId,
      if (visitorName != null) 'visitor_name': visitorName,
      if (relation != null) 'relation': relation,
      if (purpose != null) 'purpose': purpose,
      if (authorisedBy != null) 'authorised_by': authorisedBy,
      if (arrivedAt != null) 'arrived_at': arrivedAt,
      if (departedAt != null) 'departed_at': departedAt,
      if (notes != null) 'notes': notes,
      if (recordedById != null) 'recorded_by_id': recordedById,
      if (recordedByName != null) 'recorded_by_name': recordedByName,
      if (createdById != null) 'created_by_id': createdById,
      if (updatedById != null) 'updated_by_id': updatedById,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VisitorLogTableCompanion copyWith({
    Value<String>? id,
    Value<String>? homeId,
    Value<String>? visitorName,
    Value<String?>? relation,
    Value<String>? purpose,
    Value<String>? authorisedBy,
    Value<DateTime>? arrivedAt,
    Value<DateTime?>? departedAt,
    Value<String?>? notes,
    Value<String>? recordedById,
    Value<String>? recordedByName,
    Value<String?>? createdById,
    Value<String?>? updatedById,
    Value<DateTime?>? deletedAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return VisitorLogTableCompanion(
      id: id ?? this.id,
      homeId: homeId ?? this.homeId,
      visitorName: visitorName ?? this.visitorName,
      relation: relation ?? this.relation,
      purpose: purpose ?? this.purpose,
      authorisedBy: authorisedBy ?? this.authorisedBy,
      arrivedAt: arrivedAt ?? this.arrivedAt,
      departedAt: departedAt ?? this.departedAt,
      notes: notes ?? this.notes,
      recordedById: recordedById ?? this.recordedById,
      recordedByName: recordedByName ?? this.recordedByName,
      createdById: createdById ?? this.createdById,
      updatedById: updatedById ?? this.updatedById,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (homeId.present) {
      map['home_id'] = Variable<String>(homeId.value);
    }
    if (visitorName.present) {
      map['visitor_name'] = Variable<String>(visitorName.value);
    }
    if (relation.present) {
      map['relation'] = Variable<String>(relation.value);
    }
    if (purpose.present) {
      map['purpose'] = Variable<String>(purpose.value);
    }
    if (authorisedBy.present) {
      map['authorised_by'] = Variable<String>(authorisedBy.value);
    }
    if (arrivedAt.present) {
      map['arrived_at'] = Variable<DateTime>(arrivedAt.value);
    }
    if (departedAt.present) {
      map['departed_at'] = Variable<DateTime>(departedAt.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (recordedById.present) {
      map['recorded_by_id'] = Variable<String>(recordedById.value);
    }
    if (recordedByName.present) {
      map['recorded_by_name'] = Variable<String>(recordedByName.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (updatedById.present) {
      map['updated_by_id'] = Variable<String>(updatedById.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VisitorLogTableCompanion(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('visitorName: $visitorName, ')
          ..write('relation: $relation, ')
          ..write('purpose: $purpose, ')
          ..write('authorisedBy: $authorisedBy, ')
          ..write('arrivedAt: $arrivedAt, ')
          ..write('departedAt: $departedAt, ')
          ..write('notes: $notes, ')
          ..write('recordedById: $recordedById, ')
          ..write('recordedByName: $recordedByName, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CarePlansTableTable extends CarePlansTable
    with TableInfo<$CarePlansTableTable, CarePlanRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CarePlansTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _homeIdMeta = const VerificationMeta('homeId');
  @override
  late final GeneratedColumn<String> homeId = GeneratedColumn<String>(
    'home_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _childIdMeta = const VerificationMeta(
    'childId',
  );
  @override
  late final GeneratedColumn<String> childId = GeneratedColumn<String>(
    'child_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reviewDateMeta = const VerificationMeta(
    'reviewDate',
  );
  @override
  late final GeneratedColumn<String> reviewDate = GeneratedColumn<String>(
    'review_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _authorIdMeta = const VerificationMeta(
    'authorId',
  );
  @override
  late final GeneratedColumn<String> authorId = GeneratedColumn<String>(
    'author_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _authorNameMeta = const VerificationMeta(
    'authorName',
  );
  @override
  late final GeneratedColumn<String> authorName = GeneratedColumn<String>(
    'author_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _approvedByIdMeta = const VerificationMeta(
    'approvedById',
  );
  @override
  late final GeneratedColumn<String> approvedById = GeneratedColumn<String>(
    'approved_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _approvedByNameMeta = const VerificationMeta(
    'approvedByName',
  );
  @override
  late final GeneratedColumn<String> approvedByName = GeneratedColumn<String>(
    'approved_by_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _approvedAtMeta = const VerificationMeta(
    'approvedAt',
  );
  @override
  late final GeneratedColumn<DateTime> approvedAt = GeneratedColumn<DateTime>(
    'approved_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdByIdMeta = const VerificationMeta(
    'createdById',
  );
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
    'created_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByIdMeta = const VerificationMeta(
    'updatedById',
  );
  @override
  late final GeneratedColumn<String> updatedById = GeneratedColumn<String>(
    'updated_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
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
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'care_plans';
  @override
  VerificationContext validateIntegrity(
    Insertable<CarePlanRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('home_id')) {
      context.handle(
        _homeIdMeta,
        homeId.isAcceptableOrUnknown(data['home_id']!, _homeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_homeIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(
        _childIdMeta,
        childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta),
      );
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('review_date')) {
      context.handle(
        _reviewDateMeta,
        reviewDate.isAcceptableOrUnknown(data['review_date']!, _reviewDateMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('author_id')) {
      context.handle(
        _authorIdMeta,
        authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta),
      );
    } else if (isInserting) {
      context.missing(_authorIdMeta);
    }
    if (data.containsKey('author_name')) {
      context.handle(
        _authorNameMeta,
        authorName.isAcceptableOrUnknown(data['author_name']!, _authorNameMeta),
      );
    } else if (isInserting) {
      context.missing(_authorNameMeta);
    }
    if (data.containsKey('approved_by_id')) {
      context.handle(
        _approvedByIdMeta,
        approvedById.isAcceptableOrUnknown(
          data['approved_by_id']!,
          _approvedByIdMeta,
        ),
      );
    }
    if (data.containsKey('approved_by_name')) {
      context.handle(
        _approvedByNameMeta,
        approvedByName.isAcceptableOrUnknown(
          data['approved_by_name']!,
          _approvedByNameMeta,
        ),
      );
    }
    if (data.containsKey('approved_at')) {
      context.handle(
        _approvedAtMeta,
        approvedAt.isAcceptableOrUnknown(data['approved_at']!, _approvedAtMeta),
      );
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
        _createdByIdMeta,
        createdById.isAcceptableOrUnknown(
          data['created_by_id']!,
          _createdByIdMeta,
        ),
      );
    }
    if (data.containsKey('updated_by_id')) {
      context.handle(
        _updatedByIdMeta,
        updatedById.isAcceptableOrUnknown(
          data['updated_by_id']!,
          _updatedByIdMeta,
        ),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CarePlanRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CarePlanRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      homeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_id'],
      )!,
      childId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}child_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      reviewDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}review_date'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      authorId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author_id'],
      )!,
      authorName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author_name'],
      )!,
      approvedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}approved_by_id'],
      ),
      approvedByName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}approved_by_name'],
      ),
      approvedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}approved_at'],
      ),
      createdById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_id'],
      ),
      updatedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by_id'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $CarePlansTableTable createAlias(String alias) {
    return $CarePlansTableTable(attachedDatabase, alias);
  }
}

class CarePlanRow extends DataClass implements Insertable<CarePlanRow> {
  final String id;
  final String homeId;
  final String childId;
  final String title;
  final String status;
  final String? reviewDate;
  final String? notes;
  final String authorId;
  final String authorName;
  final String? approvedById;
  final String? approvedByName;
  final DateTime? approvedAt;
  final String? createdById;
  final String? updatedById;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSynced;
  const CarePlanRow({
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
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['home_id'] = Variable<String>(homeId);
    map['child_id'] = Variable<String>(childId);
    map['title'] = Variable<String>(title);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || reviewDate != null) {
      map['review_date'] = Variable<String>(reviewDate);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['author_id'] = Variable<String>(authorId);
    map['author_name'] = Variable<String>(authorName);
    if (!nullToAbsent || approvedById != null) {
      map['approved_by_id'] = Variable<String>(approvedById);
    }
    if (!nullToAbsent || approvedByName != null) {
      map['approved_by_name'] = Variable<String>(approvedByName);
    }
    if (!nullToAbsent || approvedAt != null) {
      map['approved_at'] = Variable<DateTime>(approvedAt);
    }
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || updatedById != null) {
      map['updated_by_id'] = Variable<String>(updatedById);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  CarePlansTableCompanion toCompanion(bool nullToAbsent) {
    return CarePlansTableCompanion(
      id: Value(id),
      homeId: Value(homeId),
      childId: Value(childId),
      title: Value(title),
      status: Value(status),
      reviewDate: reviewDate == null && nullToAbsent
          ? const Value.absent()
          : Value(reviewDate),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      authorId: Value(authorId),
      authorName: Value(authorName),
      approvedById: approvedById == null && nullToAbsent
          ? const Value.absent()
          : Value(approvedById),
      approvedByName: approvedByName == null && nullToAbsent
          ? const Value.absent()
          : Value(approvedByName),
      approvedAt: approvedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(approvedAt),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      updatedById: updatedById == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedById),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory CarePlanRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CarePlanRow(
      id: serializer.fromJson<String>(json['id']),
      homeId: serializer.fromJson<String>(json['homeId']),
      childId: serializer.fromJson<String>(json['childId']),
      title: serializer.fromJson<String>(json['title']),
      status: serializer.fromJson<String>(json['status']),
      reviewDate: serializer.fromJson<String?>(json['reviewDate']),
      notes: serializer.fromJson<String?>(json['notes']),
      authorId: serializer.fromJson<String>(json['authorId']),
      authorName: serializer.fromJson<String>(json['authorName']),
      approvedById: serializer.fromJson<String?>(json['approvedById']),
      approvedByName: serializer.fromJson<String?>(json['approvedByName']),
      approvedAt: serializer.fromJson<DateTime?>(json['approvedAt']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      updatedById: serializer.fromJson<String?>(json['updatedById']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'homeId': serializer.toJson<String>(homeId),
      'childId': serializer.toJson<String>(childId),
      'title': serializer.toJson<String>(title),
      'status': serializer.toJson<String>(status),
      'reviewDate': serializer.toJson<String?>(reviewDate),
      'notes': serializer.toJson<String?>(notes),
      'authorId': serializer.toJson<String>(authorId),
      'authorName': serializer.toJson<String>(authorName),
      'approvedById': serializer.toJson<String?>(approvedById),
      'approvedByName': serializer.toJson<String?>(approvedByName),
      'approvedAt': serializer.toJson<DateTime?>(approvedAt),
      'createdById': serializer.toJson<String?>(createdById),
      'updatedById': serializer.toJson<String?>(updatedById),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  CarePlanRow copyWith({
    String? id,
    String? homeId,
    String? childId,
    String? title,
    String? status,
    Value<String?> reviewDate = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    String? authorId,
    String? authorName,
    Value<String?> approvedById = const Value.absent(),
    Value<String?> approvedByName = const Value.absent(),
    Value<DateTime?> approvedAt = const Value.absent(),
    Value<String?> createdById = const Value.absent(),
    Value<String?> updatedById = const Value.absent(),
    Value<DateTime?> deletedAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
  }) => CarePlanRow(
    id: id ?? this.id,
    homeId: homeId ?? this.homeId,
    childId: childId ?? this.childId,
    title: title ?? this.title,
    status: status ?? this.status,
    reviewDate: reviewDate.present ? reviewDate.value : this.reviewDate,
    notes: notes.present ? notes.value : this.notes,
    authorId: authorId ?? this.authorId,
    authorName: authorName ?? this.authorName,
    approvedById: approvedById.present ? approvedById.value : this.approvedById,
    approvedByName: approvedByName.present
        ? approvedByName.value
        : this.approvedByName,
    approvedAt: approvedAt.present ? approvedAt.value : this.approvedAt,
    createdById: createdById.present ? createdById.value : this.createdById,
    updatedById: updatedById.present ? updatedById.value : this.updatedById,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  CarePlanRow copyWithCompanion(CarePlansTableCompanion data) {
    return CarePlanRow(
      id: data.id.present ? data.id.value : this.id,
      homeId: data.homeId.present ? data.homeId.value : this.homeId,
      childId: data.childId.present ? data.childId.value : this.childId,
      title: data.title.present ? data.title.value : this.title,
      status: data.status.present ? data.status.value : this.status,
      reviewDate: data.reviewDate.present
          ? data.reviewDate.value
          : this.reviewDate,
      notes: data.notes.present ? data.notes.value : this.notes,
      authorId: data.authorId.present ? data.authorId.value : this.authorId,
      authorName: data.authorName.present
          ? data.authorName.value
          : this.authorName,
      approvedById: data.approvedById.present
          ? data.approvedById.value
          : this.approvedById,
      approvedByName: data.approvedByName.present
          ? data.approvedByName.value
          : this.approvedByName,
      approvedAt: data.approvedAt.present
          ? data.approvedAt.value
          : this.approvedAt,
      createdById: data.createdById.present
          ? data.createdById.value
          : this.createdById,
      updatedById: data.updatedById.present
          ? data.updatedById.value
          : this.updatedById,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CarePlanRow(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('title: $title, ')
          ..write('status: $status, ')
          ..write('reviewDate: $reviewDate, ')
          ..write('notes: $notes, ')
          ..write('authorId: $authorId, ')
          ..write('authorName: $authorName, ')
          ..write('approvedById: $approvedById, ')
          ..write('approvedByName: $approvedByName, ')
          ..write('approvedAt: $approvedAt, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CarePlanRow &&
          other.id == this.id &&
          other.homeId == this.homeId &&
          other.childId == this.childId &&
          other.title == this.title &&
          other.status == this.status &&
          other.reviewDate == this.reviewDate &&
          other.notes == this.notes &&
          other.authorId == this.authorId &&
          other.authorName == this.authorName &&
          other.approvedById == this.approvedById &&
          other.approvedByName == this.approvedByName &&
          other.approvedAt == this.approvedAt &&
          other.createdById == this.createdById &&
          other.updatedById == this.updatedById &&
          other.deletedAt == this.deletedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class CarePlansTableCompanion extends UpdateCompanion<CarePlanRow> {
  final Value<String> id;
  final Value<String> homeId;
  final Value<String> childId;
  final Value<String> title;
  final Value<String> status;
  final Value<String?> reviewDate;
  final Value<String?> notes;
  final Value<String> authorId;
  final Value<String> authorName;
  final Value<String?> approvedById;
  final Value<String?> approvedByName;
  final Value<DateTime?> approvedAt;
  final Value<String?> createdById;
  final Value<String?> updatedById;
  final Value<DateTime?> deletedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const CarePlansTableCompanion({
    this.id = const Value.absent(),
    this.homeId = const Value.absent(),
    this.childId = const Value.absent(),
    this.title = const Value.absent(),
    this.status = const Value.absent(),
    this.reviewDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.authorId = const Value.absent(),
    this.authorName = const Value.absent(),
    this.approvedById = const Value.absent(),
    this.approvedByName = const Value.absent(),
    this.approvedAt = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CarePlansTableCompanion.insert({
    required String id,
    required String homeId,
    required String childId,
    required String title,
    required String status,
    this.reviewDate = const Value.absent(),
    this.notes = const Value.absent(),
    required String authorId,
    required String authorName,
    this.approvedById = const Value.absent(),
    this.approvedByName = const Value.absent(),
    this.approvedAt = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       homeId = Value(homeId),
       childId = Value(childId),
       title = Value(title),
       status = Value(status),
       authorId = Value(authorId),
       authorName = Value(authorName),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<CarePlanRow> custom({
    Expression<String>? id,
    Expression<String>? homeId,
    Expression<String>? childId,
    Expression<String>? title,
    Expression<String>? status,
    Expression<String>? reviewDate,
    Expression<String>? notes,
    Expression<String>? authorId,
    Expression<String>? authorName,
    Expression<String>? approvedById,
    Expression<String>? approvedByName,
    Expression<DateTime>? approvedAt,
    Expression<String>? createdById,
    Expression<String>? updatedById,
    Expression<DateTime>? deletedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (homeId != null) 'home_id': homeId,
      if (childId != null) 'child_id': childId,
      if (title != null) 'title': title,
      if (status != null) 'status': status,
      if (reviewDate != null) 'review_date': reviewDate,
      if (notes != null) 'notes': notes,
      if (authorId != null) 'author_id': authorId,
      if (authorName != null) 'author_name': authorName,
      if (approvedById != null) 'approved_by_id': approvedById,
      if (approvedByName != null) 'approved_by_name': approvedByName,
      if (approvedAt != null) 'approved_at': approvedAt,
      if (createdById != null) 'created_by_id': createdById,
      if (updatedById != null) 'updated_by_id': updatedById,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CarePlansTableCompanion copyWith({
    Value<String>? id,
    Value<String>? homeId,
    Value<String>? childId,
    Value<String>? title,
    Value<String>? status,
    Value<String?>? reviewDate,
    Value<String?>? notes,
    Value<String>? authorId,
    Value<String>? authorName,
    Value<String?>? approvedById,
    Value<String?>? approvedByName,
    Value<DateTime?>? approvedAt,
    Value<String?>? createdById,
    Value<String?>? updatedById,
    Value<DateTime?>? deletedAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return CarePlansTableCompanion(
      id: id ?? this.id,
      homeId: homeId ?? this.homeId,
      childId: childId ?? this.childId,
      title: title ?? this.title,
      status: status ?? this.status,
      reviewDate: reviewDate ?? this.reviewDate,
      notes: notes ?? this.notes,
      authorId: authorId ?? this.authorId,
      authorName: authorName ?? this.authorName,
      approvedById: approvedById ?? this.approvedById,
      approvedByName: approvedByName ?? this.approvedByName,
      approvedAt: approvedAt ?? this.approvedAt,
      createdById: createdById ?? this.createdById,
      updatedById: updatedById ?? this.updatedById,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (homeId.present) {
      map['home_id'] = Variable<String>(homeId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<String>(childId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (reviewDate.present) {
      map['review_date'] = Variable<String>(reviewDate.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (authorId.present) {
      map['author_id'] = Variable<String>(authorId.value);
    }
    if (authorName.present) {
      map['author_name'] = Variable<String>(authorName.value);
    }
    if (approvedById.present) {
      map['approved_by_id'] = Variable<String>(approvedById.value);
    }
    if (approvedByName.present) {
      map['approved_by_name'] = Variable<String>(approvedByName.value);
    }
    if (approvedAt.present) {
      map['approved_at'] = Variable<DateTime>(approvedAt.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (updatedById.present) {
      map['updated_by_id'] = Variable<String>(updatedById.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CarePlansTableCompanion(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('title: $title, ')
          ..write('status: $status, ')
          ..write('reviewDate: $reviewDate, ')
          ..write('notes: $notes, ')
          ..write('authorId: $authorId, ')
          ..write('authorName: $authorName, ')
          ..write('approvedById: $approvedById, ')
          ..write('approvedByName: $approvedByName, ')
          ..write('approvedAt: $approvedAt, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CarePlanGoalsTableTable extends CarePlanGoalsTable
    with TableInfo<$CarePlanGoalsTableTable, CarePlanGoalRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CarePlanGoalsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _carePlanIdMeta = const VerificationMeta(
    'carePlanId',
  );
  @override
  late final GeneratedColumn<String> carePlanId = GeneratedColumn<String>(
    'care_plan_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _homeIdMeta = const VerificationMeta('homeId');
  @override
  late final GeneratedColumn<String> homeId = GeneratedColumn<String>(
    'home_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _childIdMeta = const VerificationMeta(
    'childId',
  );
  @override
  late final GeneratedColumn<String> childId = GeneratedColumn<String>(
    'child_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _strategyMeta = const VerificationMeta(
    'strategy',
  );
  @override
  late final GeneratedColumn<String> strategy = GeneratedColumn<String>(
    'strategy',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetDateMeta = const VerificationMeta(
    'targetDate',
  );
  @override
  late final GeneratedColumn<String> targetDate = GeneratedColumn<String>(
    'target_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _progressNotesMeta = const VerificationMeta(
    'progressNotes',
  );
  @override
  late final GeneratedColumn<String> progressNotes = GeneratedColumn<String>(
    'progress_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdByIdMeta = const VerificationMeta(
    'createdById',
  );
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
    'created_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByIdMeta = const VerificationMeta(
    'updatedById',
  );
  @override
  late final GeneratedColumn<String> updatedById = GeneratedColumn<String>(
    'updated_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
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
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'care_plan_goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<CarePlanGoalRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('care_plan_id')) {
      context.handle(
        _carePlanIdMeta,
        carePlanId.isAcceptableOrUnknown(
          data['care_plan_id']!,
          _carePlanIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_carePlanIdMeta);
    }
    if (data.containsKey('home_id')) {
      context.handle(
        _homeIdMeta,
        homeId.isAcceptableOrUnknown(data['home_id']!, _homeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_homeIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(
        _childIdMeta,
        childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta),
      );
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('strategy')) {
      context.handle(
        _strategyMeta,
        strategy.isAcceptableOrUnknown(data['strategy']!, _strategyMeta),
      );
    }
    if (data.containsKey('target_date')) {
      context.handle(
        _targetDateMeta,
        targetDate.isAcceptableOrUnknown(data['target_date']!, _targetDateMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('progress_notes')) {
      context.handle(
        _progressNotesMeta,
        progressNotes.isAcceptableOrUnknown(
          data['progress_notes']!,
          _progressNotesMeta,
        ),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
        _createdByIdMeta,
        createdById.isAcceptableOrUnknown(
          data['created_by_id']!,
          _createdByIdMeta,
        ),
      );
    }
    if (data.containsKey('updated_by_id')) {
      context.handle(
        _updatedByIdMeta,
        updatedById.isAcceptableOrUnknown(
          data['updated_by_id']!,
          _updatedByIdMeta,
        ),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CarePlanGoalRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CarePlanGoalRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      carePlanId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}care_plan_id'],
      )!,
      homeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_id'],
      )!,
      childId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}child_id'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      strategy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}strategy'],
      ),
      targetDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_date'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      progressNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}progress_notes'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      createdById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_id'],
      ),
      updatedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by_id'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $CarePlanGoalsTableTable createAlias(String alias) {
    return $CarePlanGoalsTableTable(attachedDatabase, alias);
  }
}

class CarePlanGoalRow extends DataClass implements Insertable<CarePlanGoalRow> {
  final String id;
  final String carePlanId;
  final String homeId;
  final String childId;
  final String category;
  final String title;
  final String? description;
  final String? strategy;
  final String? targetDate;
  final String status;
  final String? progressNotes;
  final int sortOrder;
  final String? createdById;
  final String? updatedById;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSynced;
  const CarePlanGoalRow({
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
    required this.sortOrder,
    this.createdById,
    this.updatedById,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['care_plan_id'] = Variable<String>(carePlanId);
    map['home_id'] = Variable<String>(homeId);
    map['child_id'] = Variable<String>(childId);
    map['category'] = Variable<String>(category);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || strategy != null) {
      map['strategy'] = Variable<String>(strategy);
    }
    if (!nullToAbsent || targetDate != null) {
      map['target_date'] = Variable<String>(targetDate);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || progressNotes != null) {
      map['progress_notes'] = Variable<String>(progressNotes);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || updatedById != null) {
      map['updated_by_id'] = Variable<String>(updatedById);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  CarePlanGoalsTableCompanion toCompanion(bool nullToAbsent) {
    return CarePlanGoalsTableCompanion(
      id: Value(id),
      carePlanId: Value(carePlanId),
      homeId: Value(homeId),
      childId: Value(childId),
      category: Value(category),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      strategy: strategy == null && nullToAbsent
          ? const Value.absent()
          : Value(strategy),
      targetDate: targetDate == null && nullToAbsent
          ? const Value.absent()
          : Value(targetDate),
      status: Value(status),
      progressNotes: progressNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(progressNotes),
      sortOrder: Value(sortOrder),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      updatedById: updatedById == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedById),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory CarePlanGoalRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CarePlanGoalRow(
      id: serializer.fromJson<String>(json['id']),
      carePlanId: serializer.fromJson<String>(json['carePlanId']),
      homeId: serializer.fromJson<String>(json['homeId']),
      childId: serializer.fromJson<String>(json['childId']),
      category: serializer.fromJson<String>(json['category']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      strategy: serializer.fromJson<String?>(json['strategy']),
      targetDate: serializer.fromJson<String?>(json['targetDate']),
      status: serializer.fromJson<String>(json['status']),
      progressNotes: serializer.fromJson<String?>(json['progressNotes']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      updatedById: serializer.fromJson<String?>(json['updatedById']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'carePlanId': serializer.toJson<String>(carePlanId),
      'homeId': serializer.toJson<String>(homeId),
      'childId': serializer.toJson<String>(childId),
      'category': serializer.toJson<String>(category),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'strategy': serializer.toJson<String?>(strategy),
      'targetDate': serializer.toJson<String?>(targetDate),
      'status': serializer.toJson<String>(status),
      'progressNotes': serializer.toJson<String?>(progressNotes),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdById': serializer.toJson<String?>(createdById),
      'updatedById': serializer.toJson<String?>(updatedById),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  CarePlanGoalRow copyWith({
    String? id,
    String? carePlanId,
    String? homeId,
    String? childId,
    String? category,
    String? title,
    Value<String?> description = const Value.absent(),
    Value<String?> strategy = const Value.absent(),
    Value<String?> targetDate = const Value.absent(),
    String? status,
    Value<String?> progressNotes = const Value.absent(),
    int? sortOrder,
    Value<String?> createdById = const Value.absent(),
    Value<String?> updatedById = const Value.absent(),
    Value<DateTime?> deletedAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
  }) => CarePlanGoalRow(
    id: id ?? this.id,
    carePlanId: carePlanId ?? this.carePlanId,
    homeId: homeId ?? this.homeId,
    childId: childId ?? this.childId,
    category: category ?? this.category,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    strategy: strategy.present ? strategy.value : this.strategy,
    targetDate: targetDate.present ? targetDate.value : this.targetDate,
    status: status ?? this.status,
    progressNotes: progressNotes.present
        ? progressNotes.value
        : this.progressNotes,
    sortOrder: sortOrder ?? this.sortOrder,
    createdById: createdById.present ? createdById.value : this.createdById,
    updatedById: updatedById.present ? updatedById.value : this.updatedById,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  CarePlanGoalRow copyWithCompanion(CarePlanGoalsTableCompanion data) {
    return CarePlanGoalRow(
      id: data.id.present ? data.id.value : this.id,
      carePlanId: data.carePlanId.present
          ? data.carePlanId.value
          : this.carePlanId,
      homeId: data.homeId.present ? data.homeId.value : this.homeId,
      childId: data.childId.present ? data.childId.value : this.childId,
      category: data.category.present ? data.category.value : this.category,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      strategy: data.strategy.present ? data.strategy.value : this.strategy,
      targetDate: data.targetDate.present
          ? data.targetDate.value
          : this.targetDate,
      status: data.status.present ? data.status.value : this.status,
      progressNotes: data.progressNotes.present
          ? data.progressNotes.value
          : this.progressNotes,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdById: data.createdById.present
          ? data.createdById.value
          : this.createdById,
      updatedById: data.updatedById.present
          ? data.updatedById.value
          : this.updatedById,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CarePlanGoalRow(')
          ..write('id: $id, ')
          ..write('carePlanId: $carePlanId, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('category: $category, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('strategy: $strategy, ')
          ..write('targetDate: $targetDate, ')
          ..write('status: $status, ')
          ..write('progressNotes: $progressNotes, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CarePlanGoalRow &&
          other.id == this.id &&
          other.carePlanId == this.carePlanId &&
          other.homeId == this.homeId &&
          other.childId == this.childId &&
          other.category == this.category &&
          other.title == this.title &&
          other.description == this.description &&
          other.strategy == this.strategy &&
          other.targetDate == this.targetDate &&
          other.status == this.status &&
          other.progressNotes == this.progressNotes &&
          other.sortOrder == this.sortOrder &&
          other.createdById == this.createdById &&
          other.updatedById == this.updatedById &&
          other.deletedAt == this.deletedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class CarePlanGoalsTableCompanion extends UpdateCompanion<CarePlanGoalRow> {
  final Value<String> id;
  final Value<String> carePlanId;
  final Value<String> homeId;
  final Value<String> childId;
  final Value<String> category;
  final Value<String> title;
  final Value<String?> description;
  final Value<String?> strategy;
  final Value<String?> targetDate;
  final Value<String> status;
  final Value<String?> progressNotes;
  final Value<int> sortOrder;
  final Value<String?> createdById;
  final Value<String?> updatedById;
  final Value<DateTime?> deletedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const CarePlanGoalsTableCompanion({
    this.id = const Value.absent(),
    this.carePlanId = const Value.absent(),
    this.homeId = const Value.absent(),
    this.childId = const Value.absent(),
    this.category = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.strategy = const Value.absent(),
    this.targetDate = const Value.absent(),
    this.status = const Value.absent(),
    this.progressNotes = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CarePlanGoalsTableCompanion.insert({
    required String id,
    required String carePlanId,
    required String homeId,
    required String childId,
    required String category,
    required String title,
    this.description = const Value.absent(),
    this.strategy = const Value.absent(),
    this.targetDate = const Value.absent(),
    required String status,
    this.progressNotes = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       carePlanId = Value(carePlanId),
       homeId = Value(homeId),
       childId = Value(childId),
       category = Value(category),
       title = Value(title),
       status = Value(status),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<CarePlanGoalRow> custom({
    Expression<String>? id,
    Expression<String>? carePlanId,
    Expression<String>? homeId,
    Expression<String>? childId,
    Expression<String>? category,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? strategy,
    Expression<String>? targetDate,
    Expression<String>? status,
    Expression<String>? progressNotes,
    Expression<int>? sortOrder,
    Expression<String>? createdById,
    Expression<String>? updatedById,
    Expression<DateTime>? deletedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (carePlanId != null) 'care_plan_id': carePlanId,
      if (homeId != null) 'home_id': homeId,
      if (childId != null) 'child_id': childId,
      if (category != null) 'category': category,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (strategy != null) 'strategy': strategy,
      if (targetDate != null) 'target_date': targetDate,
      if (status != null) 'status': status,
      if (progressNotes != null) 'progress_notes': progressNotes,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdById != null) 'created_by_id': createdById,
      if (updatedById != null) 'updated_by_id': updatedById,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CarePlanGoalsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? carePlanId,
    Value<String>? homeId,
    Value<String>? childId,
    Value<String>? category,
    Value<String>? title,
    Value<String?>? description,
    Value<String?>? strategy,
    Value<String?>? targetDate,
    Value<String>? status,
    Value<String?>? progressNotes,
    Value<int>? sortOrder,
    Value<String?>? createdById,
    Value<String?>? updatedById,
    Value<DateTime?>? deletedAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return CarePlanGoalsTableCompanion(
      id: id ?? this.id,
      carePlanId: carePlanId ?? this.carePlanId,
      homeId: homeId ?? this.homeId,
      childId: childId ?? this.childId,
      category: category ?? this.category,
      title: title ?? this.title,
      description: description ?? this.description,
      strategy: strategy ?? this.strategy,
      targetDate: targetDate ?? this.targetDate,
      status: status ?? this.status,
      progressNotes: progressNotes ?? this.progressNotes,
      sortOrder: sortOrder ?? this.sortOrder,
      createdById: createdById ?? this.createdById,
      updatedById: updatedById ?? this.updatedById,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (carePlanId.present) {
      map['care_plan_id'] = Variable<String>(carePlanId.value);
    }
    if (homeId.present) {
      map['home_id'] = Variable<String>(homeId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<String>(childId.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (strategy.present) {
      map['strategy'] = Variable<String>(strategy.value);
    }
    if (targetDate.present) {
      map['target_date'] = Variable<String>(targetDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (progressNotes.present) {
      map['progress_notes'] = Variable<String>(progressNotes.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (updatedById.present) {
      map['updated_by_id'] = Variable<String>(updatedById.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CarePlanGoalsTableCompanion(')
          ..write('id: $id, ')
          ..write('carePlanId: $carePlanId, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('category: $category, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('strategy: $strategy, ')
          ..write('targetDate: $targetDate, ')
          ..write('status: $status, ')
          ..write('progressNotes: $progressNotes, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PrescribedMedsTableTable extends PrescribedMedsTable
    with TableInfo<$PrescribedMedsTableTable, PrescribedMedRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrescribedMedsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _homeIdMeta = const VerificationMeta('homeId');
  @override
  late final GeneratedColumn<String> homeId = GeneratedColumn<String>(
    'home_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _childIdMeta = const VerificationMeta(
    'childId',
  );
  @override
  late final GeneratedColumn<String> childId = GeneratedColumn<String>(
    'child_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _medicationNameMeta = const VerificationMeta(
    'medicationName',
  );
  @override
  late final GeneratedColumn<String> medicationName = GeneratedColumn<String>(
    'medication_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _doseMeta = const VerificationMeta('dose');
  @override
  late final GeneratedColumn<String> dose = GeneratedColumn<String>(
    'dose',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _routeMeta = const VerificationMeta('route');
  @override
  late final GeneratedColumn<String> route = GeneratedColumn<String>(
    'route',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _frequencyMeta = const VerificationMeta(
    'frequency',
  );
  @override
  late final GeneratedColumn<String> frequency = GeneratedColumn<String>(
    'frequency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _instructionsMeta = const VerificationMeta(
    'instructions',
  );
  @override
  late final GeneratedColumn<String> instructions = GeneratedColumn<String>(
    'instructions',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _prescribedByMeta = const VerificationMeta(
    'prescribedBy',
  );
  @override
  late final GeneratedColumn<String> prescribedBy = GeneratedColumn<String>(
    'prescribed_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<String> startDate = GeneratedColumn<String>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<String> endDate = GeneratedColumn<String>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdByIdMeta = const VerificationMeta(
    'createdById',
  );
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
    'created_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByIdMeta = const VerificationMeta(
    'updatedById',
  );
  @override
  late final GeneratedColumn<String> updatedById = GeneratedColumn<String>(
    'updated_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
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
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'prescribed_medications';
  @override
  VerificationContext validateIntegrity(
    Insertable<PrescribedMedRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('home_id')) {
      context.handle(
        _homeIdMeta,
        homeId.isAcceptableOrUnknown(data['home_id']!, _homeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_homeIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(
        _childIdMeta,
        childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta),
      );
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('medication_name')) {
      context.handle(
        _medicationNameMeta,
        medicationName.isAcceptableOrUnknown(
          data['medication_name']!,
          _medicationNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_medicationNameMeta);
    }
    if (data.containsKey('dose')) {
      context.handle(
        _doseMeta,
        dose.isAcceptableOrUnknown(data['dose']!, _doseMeta),
      );
    } else if (isInserting) {
      context.missing(_doseMeta);
    }
    if (data.containsKey('route')) {
      context.handle(
        _routeMeta,
        route.isAcceptableOrUnknown(data['route']!, _routeMeta),
      );
    } else if (isInserting) {
      context.missing(_routeMeta);
    }
    if (data.containsKey('frequency')) {
      context.handle(
        _frequencyMeta,
        frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta),
      );
    } else if (isInserting) {
      context.missing(_frequencyMeta);
    }
    if (data.containsKey('instructions')) {
      context.handle(
        _instructionsMeta,
        instructions.isAcceptableOrUnknown(
          data['instructions']!,
          _instructionsMeta,
        ),
      );
    }
    if (data.containsKey('prescribed_by')) {
      context.handle(
        _prescribedByMeta,
        prescribedBy.isAcceptableOrUnknown(
          data['prescribed_by']!,
          _prescribedByMeta,
        ),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
        _createdByIdMeta,
        createdById.isAcceptableOrUnknown(
          data['created_by_id']!,
          _createdByIdMeta,
        ),
      );
    }
    if (data.containsKey('updated_by_id')) {
      context.handle(
        _updatedByIdMeta,
        updatedById.isAcceptableOrUnknown(
          data['updated_by_id']!,
          _updatedByIdMeta,
        ),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PrescribedMedRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrescribedMedRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      homeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_id'],
      )!,
      childId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}child_id'],
      )!,
      medicationName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medication_name'],
      )!,
      dose: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dose'],
      )!,
      route: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}route'],
      )!,
      frequency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}frequency'],
      )!,
      instructions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}instructions'],
      ),
      prescribedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prescribed_by'],
      ),
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}end_date'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_id'],
      ),
      updatedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by_id'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $PrescribedMedsTableTable createAlias(String alias) {
    return $PrescribedMedsTableTable(attachedDatabase, alias);
  }
}

class PrescribedMedRow extends DataClass
    implements Insertable<PrescribedMedRow> {
  final String id;
  final String homeId;
  final String childId;
  final String medicationName;
  final String dose;
  final String route;
  final String frequency;
  final String? instructions;
  final String? prescribedBy;
  final String startDate;
  final String? endDate;
  final bool isActive;
  final String? createdById;
  final String? updatedById;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSynced;
  const PrescribedMedRow({
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
    required this.isActive,
    this.createdById,
    this.updatedById,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['home_id'] = Variable<String>(homeId);
    map['child_id'] = Variable<String>(childId);
    map['medication_name'] = Variable<String>(medicationName);
    map['dose'] = Variable<String>(dose);
    map['route'] = Variable<String>(route);
    map['frequency'] = Variable<String>(frequency);
    if (!nullToAbsent || instructions != null) {
      map['instructions'] = Variable<String>(instructions);
    }
    if (!nullToAbsent || prescribedBy != null) {
      map['prescribed_by'] = Variable<String>(prescribedBy);
    }
    map['start_date'] = Variable<String>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<String>(endDate);
    }
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || updatedById != null) {
      map['updated_by_id'] = Variable<String>(updatedById);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  PrescribedMedsTableCompanion toCompanion(bool nullToAbsent) {
    return PrescribedMedsTableCompanion(
      id: Value(id),
      homeId: Value(homeId),
      childId: Value(childId),
      medicationName: Value(medicationName),
      dose: Value(dose),
      route: Value(route),
      frequency: Value(frequency),
      instructions: instructions == null && nullToAbsent
          ? const Value.absent()
          : Value(instructions),
      prescribedBy: prescribedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(prescribedBy),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      isActive: Value(isActive),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      updatedById: updatedById == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedById),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory PrescribedMedRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrescribedMedRow(
      id: serializer.fromJson<String>(json['id']),
      homeId: serializer.fromJson<String>(json['homeId']),
      childId: serializer.fromJson<String>(json['childId']),
      medicationName: serializer.fromJson<String>(json['medicationName']),
      dose: serializer.fromJson<String>(json['dose']),
      route: serializer.fromJson<String>(json['route']),
      frequency: serializer.fromJson<String>(json['frequency']),
      instructions: serializer.fromJson<String?>(json['instructions']),
      prescribedBy: serializer.fromJson<String?>(json['prescribedBy']),
      startDate: serializer.fromJson<String>(json['startDate']),
      endDate: serializer.fromJson<String?>(json['endDate']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      updatedById: serializer.fromJson<String?>(json['updatedById']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'homeId': serializer.toJson<String>(homeId),
      'childId': serializer.toJson<String>(childId),
      'medicationName': serializer.toJson<String>(medicationName),
      'dose': serializer.toJson<String>(dose),
      'route': serializer.toJson<String>(route),
      'frequency': serializer.toJson<String>(frequency),
      'instructions': serializer.toJson<String?>(instructions),
      'prescribedBy': serializer.toJson<String?>(prescribedBy),
      'startDate': serializer.toJson<String>(startDate),
      'endDate': serializer.toJson<String?>(endDate),
      'isActive': serializer.toJson<bool>(isActive),
      'createdById': serializer.toJson<String?>(createdById),
      'updatedById': serializer.toJson<String?>(updatedById),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  PrescribedMedRow copyWith({
    String? id,
    String? homeId,
    String? childId,
    String? medicationName,
    String? dose,
    String? route,
    String? frequency,
    Value<String?> instructions = const Value.absent(),
    Value<String?> prescribedBy = const Value.absent(),
    String? startDate,
    Value<String?> endDate = const Value.absent(),
    bool? isActive,
    Value<String?> createdById = const Value.absent(),
    Value<String?> updatedById = const Value.absent(),
    Value<DateTime?> deletedAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
  }) => PrescribedMedRow(
    id: id ?? this.id,
    homeId: homeId ?? this.homeId,
    childId: childId ?? this.childId,
    medicationName: medicationName ?? this.medicationName,
    dose: dose ?? this.dose,
    route: route ?? this.route,
    frequency: frequency ?? this.frequency,
    instructions: instructions.present ? instructions.value : this.instructions,
    prescribedBy: prescribedBy.present ? prescribedBy.value : this.prescribedBy,
    startDate: startDate ?? this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    isActive: isActive ?? this.isActive,
    createdById: createdById.present ? createdById.value : this.createdById,
    updatedById: updatedById.present ? updatedById.value : this.updatedById,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  PrescribedMedRow copyWithCompanion(PrescribedMedsTableCompanion data) {
    return PrescribedMedRow(
      id: data.id.present ? data.id.value : this.id,
      homeId: data.homeId.present ? data.homeId.value : this.homeId,
      childId: data.childId.present ? data.childId.value : this.childId,
      medicationName: data.medicationName.present
          ? data.medicationName.value
          : this.medicationName,
      dose: data.dose.present ? data.dose.value : this.dose,
      route: data.route.present ? data.route.value : this.route,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      instructions: data.instructions.present
          ? data.instructions.value
          : this.instructions,
      prescribedBy: data.prescribedBy.present
          ? data.prescribedBy.value
          : this.prescribedBy,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdById: data.createdById.present
          ? data.createdById.value
          : this.createdById,
      updatedById: data.updatedById.present
          ? data.updatedById.value
          : this.updatedById,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PrescribedMedRow(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('medicationName: $medicationName, ')
          ..write('dose: $dose, ')
          ..write('route: $route, ')
          ..write('frequency: $frequency, ')
          ..write('instructions: $instructions, ')
          ..write('prescribedBy: $prescribedBy, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isActive: $isActive, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrescribedMedRow &&
          other.id == this.id &&
          other.homeId == this.homeId &&
          other.childId == this.childId &&
          other.medicationName == this.medicationName &&
          other.dose == this.dose &&
          other.route == this.route &&
          other.frequency == this.frequency &&
          other.instructions == this.instructions &&
          other.prescribedBy == this.prescribedBy &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.isActive == this.isActive &&
          other.createdById == this.createdById &&
          other.updatedById == this.updatedById &&
          other.deletedAt == this.deletedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class PrescribedMedsTableCompanion extends UpdateCompanion<PrescribedMedRow> {
  final Value<String> id;
  final Value<String> homeId;
  final Value<String> childId;
  final Value<String> medicationName;
  final Value<String> dose;
  final Value<String> route;
  final Value<String> frequency;
  final Value<String?> instructions;
  final Value<String?> prescribedBy;
  final Value<String> startDate;
  final Value<String?> endDate;
  final Value<bool> isActive;
  final Value<String?> createdById;
  final Value<String?> updatedById;
  final Value<DateTime?> deletedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const PrescribedMedsTableCompanion({
    this.id = const Value.absent(),
    this.homeId = const Value.absent(),
    this.childId = const Value.absent(),
    this.medicationName = const Value.absent(),
    this.dose = const Value.absent(),
    this.route = const Value.absent(),
    this.frequency = const Value.absent(),
    this.instructions = const Value.absent(),
    this.prescribedBy = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PrescribedMedsTableCompanion.insert({
    required String id,
    required String homeId,
    required String childId,
    required String medicationName,
    required String dose,
    required String route,
    required String frequency,
    this.instructions = const Value.absent(),
    this.prescribedBy = const Value.absent(),
    required String startDate,
    this.endDate = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       homeId = Value(homeId),
       childId = Value(childId),
       medicationName = Value(medicationName),
       dose = Value(dose),
       route = Value(route),
       frequency = Value(frequency),
       startDate = Value(startDate),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<PrescribedMedRow> custom({
    Expression<String>? id,
    Expression<String>? homeId,
    Expression<String>? childId,
    Expression<String>? medicationName,
    Expression<String>? dose,
    Expression<String>? route,
    Expression<String>? frequency,
    Expression<String>? instructions,
    Expression<String>? prescribedBy,
    Expression<String>? startDate,
    Expression<String>? endDate,
    Expression<bool>? isActive,
    Expression<String>? createdById,
    Expression<String>? updatedById,
    Expression<DateTime>? deletedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (homeId != null) 'home_id': homeId,
      if (childId != null) 'child_id': childId,
      if (medicationName != null) 'medication_name': medicationName,
      if (dose != null) 'dose': dose,
      if (route != null) 'route': route,
      if (frequency != null) 'frequency': frequency,
      if (instructions != null) 'instructions': instructions,
      if (prescribedBy != null) 'prescribed_by': prescribedBy,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (isActive != null) 'is_active': isActive,
      if (createdById != null) 'created_by_id': createdById,
      if (updatedById != null) 'updated_by_id': updatedById,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PrescribedMedsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? homeId,
    Value<String>? childId,
    Value<String>? medicationName,
    Value<String>? dose,
    Value<String>? route,
    Value<String>? frequency,
    Value<String?>? instructions,
    Value<String?>? prescribedBy,
    Value<String>? startDate,
    Value<String?>? endDate,
    Value<bool>? isActive,
    Value<String?>? createdById,
    Value<String?>? updatedById,
    Value<DateTime?>? deletedAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return PrescribedMedsTableCompanion(
      id: id ?? this.id,
      homeId: homeId ?? this.homeId,
      childId: childId ?? this.childId,
      medicationName: medicationName ?? this.medicationName,
      dose: dose ?? this.dose,
      route: route ?? this.route,
      frequency: frequency ?? this.frequency,
      instructions: instructions ?? this.instructions,
      prescribedBy: prescribedBy ?? this.prescribedBy,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isActive: isActive ?? this.isActive,
      createdById: createdById ?? this.createdById,
      updatedById: updatedById ?? this.updatedById,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (homeId.present) {
      map['home_id'] = Variable<String>(homeId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<String>(childId.value);
    }
    if (medicationName.present) {
      map['medication_name'] = Variable<String>(medicationName.value);
    }
    if (dose.present) {
      map['dose'] = Variable<String>(dose.value);
    }
    if (route.present) {
      map['route'] = Variable<String>(route.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<String>(frequency.value);
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    if (prescribedBy.present) {
      map['prescribed_by'] = Variable<String>(prescribedBy.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<String>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<String>(endDate.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (updatedById.present) {
      map['updated_by_id'] = Variable<String>(updatedById.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrescribedMedsTableCompanion(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('medicationName: $medicationName, ')
          ..write('dose: $dose, ')
          ..write('route: $route, ')
          ..write('frequency: $frequency, ')
          ..write('instructions: $instructions, ')
          ..write('prescribedBy: $prescribedBy, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isActive: $isActive, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MedAdministrationsTableTable extends MedAdministrationsTable
    with TableInfo<$MedAdministrationsTableTable, MedAdministrationRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedAdministrationsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _homeIdMeta = const VerificationMeta('homeId');
  @override
  late final GeneratedColumn<String> homeId = GeneratedColumn<String>(
    'home_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _childIdMeta = const VerificationMeta(
    'childId',
  );
  @override
  late final GeneratedColumn<String> childId = GeneratedColumn<String>(
    'child_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _prescribedMedIdMeta = const VerificationMeta(
    'prescribedMedId',
  );
  @override
  late final GeneratedColumn<String> prescribedMedId = GeneratedColumn<String>(
    'prescribed_med_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _medicationNameMeta = const VerificationMeta(
    'medicationName',
  );
  @override
  late final GeneratedColumn<String> medicationName = GeneratedColumn<String>(
    'medication_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _doseMeta = const VerificationMeta('dose');
  @override
  late final GeneratedColumn<String> dose = GeneratedColumn<String>(
    'dose',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _outcomeMeta = const VerificationMeta(
    'outcome',
  );
  @override
  late final GeneratedColumn<String> outcome = GeneratedColumn<String>(
    'outcome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shiftMeta = const VerificationMeta('shift');
  @override
  late final GeneratedColumn<String> shift = GeneratedColumn<String>(
    'shift',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _administeredAtMeta = const VerificationMeta(
    'administeredAt',
  );
  @override
  late final GeneratedColumn<DateTime> administeredAt =
      GeneratedColumn<DateTime>(
        'administered_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _administeredByIdMeta = const VerificationMeta(
    'administeredById',
  );
  @override
  late final GeneratedColumn<String> administeredById = GeneratedColumn<String>(
    'administered_by_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _administeredByNameMeta =
      const VerificationMeta('administeredByName');
  @override
  late final GeneratedColumn<String> administeredByName =
      GeneratedColumn<String>(
        'administered_by_name',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
    'reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdByIdMeta = const VerificationMeta(
    'createdById',
  );
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
    'created_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByIdMeta = const VerificationMeta(
    'updatedById',
  );
  @override
  late final GeneratedColumn<String> updatedById = GeneratedColumn<String>(
    'updated_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
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
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'med_administrations';
  @override
  VerificationContext validateIntegrity(
    Insertable<MedAdministrationRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('home_id')) {
      context.handle(
        _homeIdMeta,
        homeId.isAcceptableOrUnknown(data['home_id']!, _homeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_homeIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(
        _childIdMeta,
        childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta),
      );
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('prescribed_med_id')) {
      context.handle(
        _prescribedMedIdMeta,
        prescribedMedId.isAcceptableOrUnknown(
          data['prescribed_med_id']!,
          _prescribedMedIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_prescribedMedIdMeta);
    }
    if (data.containsKey('medication_name')) {
      context.handle(
        _medicationNameMeta,
        medicationName.isAcceptableOrUnknown(
          data['medication_name']!,
          _medicationNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_medicationNameMeta);
    }
    if (data.containsKey('dose')) {
      context.handle(
        _doseMeta,
        dose.isAcceptableOrUnknown(data['dose']!, _doseMeta),
      );
    } else if (isInserting) {
      context.missing(_doseMeta);
    }
    if (data.containsKey('outcome')) {
      context.handle(
        _outcomeMeta,
        outcome.isAcceptableOrUnknown(data['outcome']!, _outcomeMeta),
      );
    } else if (isInserting) {
      context.missing(_outcomeMeta);
    }
    if (data.containsKey('shift')) {
      context.handle(
        _shiftMeta,
        shift.isAcceptableOrUnknown(data['shift']!, _shiftMeta),
      );
    } else if (isInserting) {
      context.missing(_shiftMeta);
    }
    if (data.containsKey('administered_at')) {
      context.handle(
        _administeredAtMeta,
        administeredAt.isAcceptableOrUnknown(
          data['administered_at']!,
          _administeredAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_administeredAtMeta);
    }
    if (data.containsKey('administered_by_id')) {
      context.handle(
        _administeredByIdMeta,
        administeredById.isAcceptableOrUnknown(
          data['administered_by_id']!,
          _administeredByIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_administeredByIdMeta);
    }
    if (data.containsKey('administered_by_name')) {
      context.handle(
        _administeredByNameMeta,
        administeredByName.isAcceptableOrUnknown(
          data['administered_by_name']!,
          _administeredByNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_administeredByNameMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(
        _reasonMeta,
        reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
        _createdByIdMeta,
        createdById.isAcceptableOrUnknown(
          data['created_by_id']!,
          _createdByIdMeta,
        ),
      );
    }
    if (data.containsKey('updated_by_id')) {
      context.handle(
        _updatedByIdMeta,
        updatedById.isAcceptableOrUnknown(
          data['updated_by_id']!,
          _updatedByIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedAdministrationRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedAdministrationRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      homeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_id'],
      )!,
      childId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}child_id'],
      )!,
      prescribedMedId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prescribed_med_id'],
      )!,
      medicationName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medication_name'],
      )!,
      dose: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dose'],
      )!,
      outcome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}outcome'],
      )!,
      shift: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shift'],
      )!,
      administeredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}administered_at'],
      )!,
      administeredById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}administered_by_id'],
      )!,
      administeredByName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}administered_by_name'],
      )!,
      reason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reason'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_id'],
      ),
      updatedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $MedAdministrationsTableTable createAlias(String alias) {
    return $MedAdministrationsTableTable(attachedDatabase, alias);
  }
}

class MedAdministrationRow extends DataClass
    implements Insertable<MedAdministrationRow> {
  final String id;
  final String homeId;
  final String childId;
  final String prescribedMedId;
  final String medicationName;
  final String dose;
  final String outcome;
  final String shift;
  final DateTime administeredAt;
  final String administeredById;
  final String administeredByName;
  final String? reason;
  final String? notes;
  final String? createdById;
  final String? updatedById;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSynced;
  const MedAdministrationRow({
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
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['home_id'] = Variable<String>(homeId);
    map['child_id'] = Variable<String>(childId);
    map['prescribed_med_id'] = Variable<String>(prescribedMedId);
    map['medication_name'] = Variable<String>(medicationName);
    map['dose'] = Variable<String>(dose);
    map['outcome'] = Variable<String>(outcome);
    map['shift'] = Variable<String>(shift);
    map['administered_at'] = Variable<DateTime>(administeredAt);
    map['administered_by_id'] = Variable<String>(administeredById);
    map['administered_by_name'] = Variable<String>(administeredByName);
    if (!nullToAbsent || reason != null) {
      map['reason'] = Variable<String>(reason);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || updatedById != null) {
      map['updated_by_id'] = Variable<String>(updatedById);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  MedAdministrationsTableCompanion toCompanion(bool nullToAbsent) {
    return MedAdministrationsTableCompanion(
      id: Value(id),
      homeId: Value(homeId),
      childId: Value(childId),
      prescribedMedId: Value(prescribedMedId),
      medicationName: Value(medicationName),
      dose: Value(dose),
      outcome: Value(outcome),
      shift: Value(shift),
      administeredAt: Value(administeredAt),
      administeredById: Value(administeredById),
      administeredByName: Value(administeredByName),
      reason: reason == null && nullToAbsent
          ? const Value.absent()
          : Value(reason),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      updatedById: updatedById == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedById),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory MedAdministrationRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedAdministrationRow(
      id: serializer.fromJson<String>(json['id']),
      homeId: serializer.fromJson<String>(json['homeId']),
      childId: serializer.fromJson<String>(json['childId']),
      prescribedMedId: serializer.fromJson<String>(json['prescribedMedId']),
      medicationName: serializer.fromJson<String>(json['medicationName']),
      dose: serializer.fromJson<String>(json['dose']),
      outcome: serializer.fromJson<String>(json['outcome']),
      shift: serializer.fromJson<String>(json['shift']),
      administeredAt: serializer.fromJson<DateTime>(json['administeredAt']),
      administeredById: serializer.fromJson<String>(json['administeredById']),
      administeredByName: serializer.fromJson<String>(
        json['administeredByName'],
      ),
      reason: serializer.fromJson<String?>(json['reason']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      updatedById: serializer.fromJson<String?>(json['updatedById']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'homeId': serializer.toJson<String>(homeId),
      'childId': serializer.toJson<String>(childId),
      'prescribedMedId': serializer.toJson<String>(prescribedMedId),
      'medicationName': serializer.toJson<String>(medicationName),
      'dose': serializer.toJson<String>(dose),
      'outcome': serializer.toJson<String>(outcome),
      'shift': serializer.toJson<String>(shift),
      'administeredAt': serializer.toJson<DateTime>(administeredAt),
      'administeredById': serializer.toJson<String>(administeredById),
      'administeredByName': serializer.toJson<String>(administeredByName),
      'reason': serializer.toJson<String?>(reason),
      'notes': serializer.toJson<String?>(notes),
      'createdById': serializer.toJson<String?>(createdById),
      'updatedById': serializer.toJson<String?>(updatedById),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  MedAdministrationRow copyWith({
    String? id,
    String? homeId,
    String? childId,
    String? prescribedMedId,
    String? medicationName,
    String? dose,
    String? outcome,
    String? shift,
    DateTime? administeredAt,
    String? administeredById,
    String? administeredByName,
    Value<String?> reason = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> createdById = const Value.absent(),
    Value<String?> updatedById = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
  }) => MedAdministrationRow(
    id: id ?? this.id,
    homeId: homeId ?? this.homeId,
    childId: childId ?? this.childId,
    prescribedMedId: prescribedMedId ?? this.prescribedMedId,
    medicationName: medicationName ?? this.medicationName,
    dose: dose ?? this.dose,
    outcome: outcome ?? this.outcome,
    shift: shift ?? this.shift,
    administeredAt: administeredAt ?? this.administeredAt,
    administeredById: administeredById ?? this.administeredById,
    administeredByName: administeredByName ?? this.administeredByName,
    reason: reason.present ? reason.value : this.reason,
    notes: notes.present ? notes.value : this.notes,
    createdById: createdById.present ? createdById.value : this.createdById,
    updatedById: updatedById.present ? updatedById.value : this.updatedById,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  MedAdministrationRow copyWithCompanion(
    MedAdministrationsTableCompanion data,
  ) {
    return MedAdministrationRow(
      id: data.id.present ? data.id.value : this.id,
      homeId: data.homeId.present ? data.homeId.value : this.homeId,
      childId: data.childId.present ? data.childId.value : this.childId,
      prescribedMedId: data.prescribedMedId.present
          ? data.prescribedMedId.value
          : this.prescribedMedId,
      medicationName: data.medicationName.present
          ? data.medicationName.value
          : this.medicationName,
      dose: data.dose.present ? data.dose.value : this.dose,
      outcome: data.outcome.present ? data.outcome.value : this.outcome,
      shift: data.shift.present ? data.shift.value : this.shift,
      administeredAt: data.administeredAt.present
          ? data.administeredAt.value
          : this.administeredAt,
      administeredById: data.administeredById.present
          ? data.administeredById.value
          : this.administeredById,
      administeredByName: data.administeredByName.present
          ? data.administeredByName.value
          : this.administeredByName,
      reason: data.reason.present ? data.reason.value : this.reason,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdById: data.createdById.present
          ? data.createdById.value
          : this.createdById,
      updatedById: data.updatedById.present
          ? data.updatedById.value
          : this.updatedById,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MedAdministrationRow(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('prescribedMedId: $prescribedMedId, ')
          ..write('medicationName: $medicationName, ')
          ..write('dose: $dose, ')
          ..write('outcome: $outcome, ')
          ..write('shift: $shift, ')
          ..write('administeredAt: $administeredAt, ')
          ..write('administeredById: $administeredById, ')
          ..write('administeredByName: $administeredByName, ')
          ..write('reason: $reason, ')
          ..write('notes: $notes, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedAdministrationRow &&
          other.id == this.id &&
          other.homeId == this.homeId &&
          other.childId == this.childId &&
          other.prescribedMedId == this.prescribedMedId &&
          other.medicationName == this.medicationName &&
          other.dose == this.dose &&
          other.outcome == this.outcome &&
          other.shift == this.shift &&
          other.administeredAt == this.administeredAt &&
          other.administeredById == this.administeredById &&
          other.administeredByName == this.administeredByName &&
          other.reason == this.reason &&
          other.notes == this.notes &&
          other.createdById == this.createdById &&
          other.updatedById == this.updatedById &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class MedAdministrationsTableCompanion
    extends UpdateCompanion<MedAdministrationRow> {
  final Value<String> id;
  final Value<String> homeId;
  final Value<String> childId;
  final Value<String> prescribedMedId;
  final Value<String> medicationName;
  final Value<String> dose;
  final Value<String> outcome;
  final Value<String> shift;
  final Value<DateTime> administeredAt;
  final Value<String> administeredById;
  final Value<String> administeredByName;
  final Value<String?> reason;
  final Value<String?> notes;
  final Value<String?> createdById;
  final Value<String?> updatedById;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const MedAdministrationsTableCompanion({
    this.id = const Value.absent(),
    this.homeId = const Value.absent(),
    this.childId = const Value.absent(),
    this.prescribedMedId = const Value.absent(),
    this.medicationName = const Value.absent(),
    this.dose = const Value.absent(),
    this.outcome = const Value.absent(),
    this.shift = const Value.absent(),
    this.administeredAt = const Value.absent(),
    this.administeredById = const Value.absent(),
    this.administeredByName = const Value.absent(),
    this.reason = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedAdministrationsTableCompanion.insert({
    required String id,
    required String homeId,
    required String childId,
    required String prescribedMedId,
    required String medicationName,
    required String dose,
    required String outcome,
    required String shift,
    required DateTime administeredAt,
    required String administeredById,
    required String administeredByName,
    this.reason = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       homeId = Value(homeId),
       childId = Value(childId),
       prescribedMedId = Value(prescribedMedId),
       medicationName = Value(medicationName),
       dose = Value(dose),
       outcome = Value(outcome),
       shift = Value(shift),
       administeredAt = Value(administeredAt),
       administeredById = Value(administeredById),
       administeredByName = Value(administeredByName),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<MedAdministrationRow> custom({
    Expression<String>? id,
    Expression<String>? homeId,
    Expression<String>? childId,
    Expression<String>? prescribedMedId,
    Expression<String>? medicationName,
    Expression<String>? dose,
    Expression<String>? outcome,
    Expression<String>? shift,
    Expression<DateTime>? administeredAt,
    Expression<String>? administeredById,
    Expression<String>? administeredByName,
    Expression<String>? reason,
    Expression<String>? notes,
    Expression<String>? createdById,
    Expression<String>? updatedById,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (homeId != null) 'home_id': homeId,
      if (childId != null) 'child_id': childId,
      if (prescribedMedId != null) 'prescribed_med_id': prescribedMedId,
      if (medicationName != null) 'medication_name': medicationName,
      if (dose != null) 'dose': dose,
      if (outcome != null) 'outcome': outcome,
      if (shift != null) 'shift': shift,
      if (administeredAt != null) 'administered_at': administeredAt,
      if (administeredById != null) 'administered_by_id': administeredById,
      if (administeredByName != null)
        'administered_by_name': administeredByName,
      if (reason != null) 'reason': reason,
      if (notes != null) 'notes': notes,
      if (createdById != null) 'created_by_id': createdById,
      if (updatedById != null) 'updated_by_id': updatedById,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedAdministrationsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? homeId,
    Value<String>? childId,
    Value<String>? prescribedMedId,
    Value<String>? medicationName,
    Value<String>? dose,
    Value<String>? outcome,
    Value<String>? shift,
    Value<DateTime>? administeredAt,
    Value<String>? administeredById,
    Value<String>? administeredByName,
    Value<String?>? reason,
    Value<String?>? notes,
    Value<String?>? createdById,
    Value<String?>? updatedById,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return MedAdministrationsTableCompanion(
      id: id ?? this.id,
      homeId: homeId ?? this.homeId,
      childId: childId ?? this.childId,
      prescribedMedId: prescribedMedId ?? this.prescribedMedId,
      medicationName: medicationName ?? this.medicationName,
      dose: dose ?? this.dose,
      outcome: outcome ?? this.outcome,
      shift: shift ?? this.shift,
      administeredAt: administeredAt ?? this.administeredAt,
      administeredById: administeredById ?? this.administeredById,
      administeredByName: administeredByName ?? this.administeredByName,
      reason: reason ?? this.reason,
      notes: notes ?? this.notes,
      createdById: createdById ?? this.createdById,
      updatedById: updatedById ?? this.updatedById,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (homeId.present) {
      map['home_id'] = Variable<String>(homeId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<String>(childId.value);
    }
    if (prescribedMedId.present) {
      map['prescribed_med_id'] = Variable<String>(prescribedMedId.value);
    }
    if (medicationName.present) {
      map['medication_name'] = Variable<String>(medicationName.value);
    }
    if (dose.present) {
      map['dose'] = Variable<String>(dose.value);
    }
    if (outcome.present) {
      map['outcome'] = Variable<String>(outcome.value);
    }
    if (shift.present) {
      map['shift'] = Variable<String>(shift.value);
    }
    if (administeredAt.present) {
      map['administered_at'] = Variable<DateTime>(administeredAt.value);
    }
    if (administeredById.present) {
      map['administered_by_id'] = Variable<String>(administeredById.value);
    }
    if (administeredByName.present) {
      map['administered_by_name'] = Variable<String>(administeredByName.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (updatedById.present) {
      map['updated_by_id'] = Variable<String>(updatedById.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedAdministrationsTableCompanion(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('prescribedMedId: $prescribedMedId, ')
          ..write('medicationName: $medicationName, ')
          ..write('dose: $dose, ')
          ..write('outcome: $outcome, ')
          ..write('shift: $shift, ')
          ..write('administeredAt: $administeredAt, ')
          ..write('administeredById: $administeredById, ')
          ..write('administeredByName: $administeredByName, ')
          ..write('reason: $reason, ')
          ..write('notes: $notes, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MedicalProfileTableTable extends MedicalProfileTable
    with TableInfo<$MedicalProfileTableTable, MedicalProfileRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicalProfileTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _homeIdMeta = const VerificationMeta('homeId');
  @override
  late final GeneratedColumn<String> homeId = GeneratedColumn<String>(
    'home_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _childIdMeta = const VerificationMeta(
    'childId',
  );
  @override
  late final GeneratedColumn<String> childId = GeneratedColumn<String>(
    'child_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nhsNumberMeta = const VerificationMeta(
    'nhsNumber',
  );
  @override
  late final GeneratedColumn<String> nhsNumber = GeneratedColumn<String>(
    'nhs_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bloodTypeMeta = const VerificationMeta(
    'bloodType',
  );
  @override
  late final GeneratedColumn<String> bloodType = GeneratedColumn<String>(
    'blood_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _conditionsMeta = const VerificationMeta(
    'conditions',
  );
  @override
  late final GeneratedColumn<String> conditions = GeneratedColumn<String>(
    'conditions',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _allergiesMeta = const VerificationMeta(
    'allergies',
  );
  @override
  late final GeneratedColumn<String> allergies = GeneratedColumn<String>(
    'allergies',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _immunisationNotesMeta = const VerificationMeta(
    'immunisationNotes',
  );
  @override
  late final GeneratedColumn<String> immunisationNotes =
      GeneratedColumn<String>(
        'immunisation_notes',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdByIdMeta = const VerificationMeta(
    'createdById',
  );
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
    'created_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByIdMeta = const VerificationMeta(
    'updatedById',
  );
  @override
  late final GeneratedColumn<String> updatedById = GeneratedColumn<String>(
    'updated_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
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
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medical_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<MedicalProfileRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('home_id')) {
      context.handle(
        _homeIdMeta,
        homeId.isAcceptableOrUnknown(data['home_id']!, _homeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_homeIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(
        _childIdMeta,
        childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta),
      );
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('nhs_number')) {
      context.handle(
        _nhsNumberMeta,
        nhsNumber.isAcceptableOrUnknown(data['nhs_number']!, _nhsNumberMeta),
      );
    }
    if (data.containsKey('blood_type')) {
      context.handle(
        _bloodTypeMeta,
        bloodType.isAcceptableOrUnknown(data['blood_type']!, _bloodTypeMeta),
      );
    }
    if (data.containsKey('conditions')) {
      context.handle(
        _conditionsMeta,
        conditions.isAcceptableOrUnknown(data['conditions']!, _conditionsMeta),
      );
    }
    if (data.containsKey('allergies')) {
      context.handle(
        _allergiesMeta,
        allergies.isAcceptableOrUnknown(data['allergies']!, _allergiesMeta),
      );
    }
    if (data.containsKey('immunisation_notes')) {
      context.handle(
        _immunisationNotesMeta,
        immunisationNotes.isAcceptableOrUnknown(
          data['immunisation_notes']!,
          _immunisationNotesMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
        _createdByIdMeta,
        createdById.isAcceptableOrUnknown(
          data['created_by_id']!,
          _createdByIdMeta,
        ),
      );
    }
    if (data.containsKey('updated_by_id')) {
      context.handle(
        _updatedByIdMeta,
        updatedById.isAcceptableOrUnknown(
          data['updated_by_id']!,
          _updatedByIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedicalProfileRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicalProfileRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      homeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_id'],
      )!,
      childId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}child_id'],
      )!,
      nhsNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nhs_number'],
      ),
      bloodType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}blood_type'],
      ),
      conditions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conditions'],
      ),
      allergies: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}allergies'],
      ),
      immunisationNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}immunisation_notes'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_id'],
      ),
      updatedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $MedicalProfileTableTable createAlias(String alias) {
    return $MedicalProfileTableTable(attachedDatabase, alias);
  }
}

class MedicalProfileRow extends DataClass
    implements Insertable<MedicalProfileRow> {
  final String id;
  final String homeId;
  final String childId;
  final String? nhsNumber;
  final String? bloodType;
  final String? conditions;
  final String? allergies;
  final String? immunisationNotes;
  final String? notes;
  final String? createdById;
  final String? updatedById;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSynced;
  const MedicalProfileRow({
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
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['home_id'] = Variable<String>(homeId);
    map['child_id'] = Variable<String>(childId);
    if (!nullToAbsent || nhsNumber != null) {
      map['nhs_number'] = Variable<String>(nhsNumber);
    }
    if (!nullToAbsent || bloodType != null) {
      map['blood_type'] = Variable<String>(bloodType);
    }
    if (!nullToAbsent || conditions != null) {
      map['conditions'] = Variable<String>(conditions);
    }
    if (!nullToAbsent || allergies != null) {
      map['allergies'] = Variable<String>(allergies);
    }
    if (!nullToAbsent || immunisationNotes != null) {
      map['immunisation_notes'] = Variable<String>(immunisationNotes);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || updatedById != null) {
      map['updated_by_id'] = Variable<String>(updatedById);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  MedicalProfileTableCompanion toCompanion(bool nullToAbsent) {
    return MedicalProfileTableCompanion(
      id: Value(id),
      homeId: Value(homeId),
      childId: Value(childId),
      nhsNumber: nhsNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(nhsNumber),
      bloodType: bloodType == null && nullToAbsent
          ? const Value.absent()
          : Value(bloodType),
      conditions: conditions == null && nullToAbsent
          ? const Value.absent()
          : Value(conditions),
      allergies: allergies == null && nullToAbsent
          ? const Value.absent()
          : Value(allergies),
      immunisationNotes: immunisationNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(immunisationNotes),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      updatedById: updatedById == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedById),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory MedicalProfileRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicalProfileRow(
      id: serializer.fromJson<String>(json['id']),
      homeId: serializer.fromJson<String>(json['homeId']),
      childId: serializer.fromJson<String>(json['childId']),
      nhsNumber: serializer.fromJson<String?>(json['nhsNumber']),
      bloodType: serializer.fromJson<String?>(json['bloodType']),
      conditions: serializer.fromJson<String?>(json['conditions']),
      allergies: serializer.fromJson<String?>(json['allergies']),
      immunisationNotes: serializer.fromJson<String?>(
        json['immunisationNotes'],
      ),
      notes: serializer.fromJson<String?>(json['notes']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      updatedById: serializer.fromJson<String?>(json['updatedById']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'homeId': serializer.toJson<String>(homeId),
      'childId': serializer.toJson<String>(childId),
      'nhsNumber': serializer.toJson<String?>(nhsNumber),
      'bloodType': serializer.toJson<String?>(bloodType),
      'conditions': serializer.toJson<String?>(conditions),
      'allergies': serializer.toJson<String?>(allergies),
      'immunisationNotes': serializer.toJson<String?>(immunisationNotes),
      'notes': serializer.toJson<String?>(notes),
      'createdById': serializer.toJson<String?>(createdById),
      'updatedById': serializer.toJson<String?>(updatedById),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  MedicalProfileRow copyWith({
    String? id,
    String? homeId,
    String? childId,
    Value<String?> nhsNumber = const Value.absent(),
    Value<String?> bloodType = const Value.absent(),
    Value<String?> conditions = const Value.absent(),
    Value<String?> allergies = const Value.absent(),
    Value<String?> immunisationNotes = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> createdById = const Value.absent(),
    Value<String?> updatedById = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
  }) => MedicalProfileRow(
    id: id ?? this.id,
    homeId: homeId ?? this.homeId,
    childId: childId ?? this.childId,
    nhsNumber: nhsNumber.present ? nhsNumber.value : this.nhsNumber,
    bloodType: bloodType.present ? bloodType.value : this.bloodType,
    conditions: conditions.present ? conditions.value : this.conditions,
    allergies: allergies.present ? allergies.value : this.allergies,
    immunisationNotes: immunisationNotes.present
        ? immunisationNotes.value
        : this.immunisationNotes,
    notes: notes.present ? notes.value : this.notes,
    createdById: createdById.present ? createdById.value : this.createdById,
    updatedById: updatedById.present ? updatedById.value : this.updatedById,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  MedicalProfileRow copyWithCompanion(MedicalProfileTableCompanion data) {
    return MedicalProfileRow(
      id: data.id.present ? data.id.value : this.id,
      homeId: data.homeId.present ? data.homeId.value : this.homeId,
      childId: data.childId.present ? data.childId.value : this.childId,
      nhsNumber: data.nhsNumber.present ? data.nhsNumber.value : this.nhsNumber,
      bloodType: data.bloodType.present ? data.bloodType.value : this.bloodType,
      conditions: data.conditions.present
          ? data.conditions.value
          : this.conditions,
      allergies: data.allergies.present ? data.allergies.value : this.allergies,
      immunisationNotes: data.immunisationNotes.present
          ? data.immunisationNotes.value
          : this.immunisationNotes,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdById: data.createdById.present
          ? data.createdById.value
          : this.createdById,
      updatedById: data.updatedById.present
          ? data.updatedById.value
          : this.updatedById,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MedicalProfileRow(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('nhsNumber: $nhsNumber, ')
          ..write('bloodType: $bloodType, ')
          ..write('conditions: $conditions, ')
          ..write('allergies: $allergies, ')
          ..write('immunisationNotes: $immunisationNotes, ')
          ..write('notes: $notes, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicalProfileRow &&
          other.id == this.id &&
          other.homeId == this.homeId &&
          other.childId == this.childId &&
          other.nhsNumber == this.nhsNumber &&
          other.bloodType == this.bloodType &&
          other.conditions == this.conditions &&
          other.allergies == this.allergies &&
          other.immunisationNotes == this.immunisationNotes &&
          other.notes == this.notes &&
          other.createdById == this.createdById &&
          other.updatedById == this.updatedById &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class MedicalProfileTableCompanion extends UpdateCompanion<MedicalProfileRow> {
  final Value<String> id;
  final Value<String> homeId;
  final Value<String> childId;
  final Value<String?> nhsNumber;
  final Value<String?> bloodType;
  final Value<String?> conditions;
  final Value<String?> allergies;
  final Value<String?> immunisationNotes;
  final Value<String?> notes;
  final Value<String?> createdById;
  final Value<String?> updatedById;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const MedicalProfileTableCompanion({
    this.id = const Value.absent(),
    this.homeId = const Value.absent(),
    this.childId = const Value.absent(),
    this.nhsNumber = const Value.absent(),
    this.bloodType = const Value.absent(),
    this.conditions = const Value.absent(),
    this.allergies = const Value.absent(),
    this.immunisationNotes = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicalProfileTableCompanion.insert({
    required String id,
    required String homeId,
    required String childId,
    this.nhsNumber = const Value.absent(),
    this.bloodType = const Value.absent(),
    this.conditions = const Value.absent(),
    this.allergies = const Value.absent(),
    this.immunisationNotes = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       homeId = Value(homeId),
       childId = Value(childId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<MedicalProfileRow> custom({
    Expression<String>? id,
    Expression<String>? homeId,
    Expression<String>? childId,
    Expression<String>? nhsNumber,
    Expression<String>? bloodType,
    Expression<String>? conditions,
    Expression<String>? allergies,
    Expression<String>? immunisationNotes,
    Expression<String>? notes,
    Expression<String>? createdById,
    Expression<String>? updatedById,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (homeId != null) 'home_id': homeId,
      if (childId != null) 'child_id': childId,
      if (nhsNumber != null) 'nhs_number': nhsNumber,
      if (bloodType != null) 'blood_type': bloodType,
      if (conditions != null) 'conditions': conditions,
      if (allergies != null) 'allergies': allergies,
      if (immunisationNotes != null) 'immunisation_notes': immunisationNotes,
      if (notes != null) 'notes': notes,
      if (createdById != null) 'created_by_id': createdById,
      if (updatedById != null) 'updated_by_id': updatedById,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicalProfileTableCompanion copyWith({
    Value<String>? id,
    Value<String>? homeId,
    Value<String>? childId,
    Value<String?>? nhsNumber,
    Value<String?>? bloodType,
    Value<String?>? conditions,
    Value<String?>? allergies,
    Value<String?>? immunisationNotes,
    Value<String?>? notes,
    Value<String?>? createdById,
    Value<String?>? updatedById,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return MedicalProfileTableCompanion(
      id: id ?? this.id,
      homeId: homeId ?? this.homeId,
      childId: childId ?? this.childId,
      nhsNumber: nhsNumber ?? this.nhsNumber,
      bloodType: bloodType ?? this.bloodType,
      conditions: conditions ?? this.conditions,
      allergies: allergies ?? this.allergies,
      immunisationNotes: immunisationNotes ?? this.immunisationNotes,
      notes: notes ?? this.notes,
      createdById: createdById ?? this.createdById,
      updatedById: updatedById ?? this.updatedById,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (homeId.present) {
      map['home_id'] = Variable<String>(homeId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<String>(childId.value);
    }
    if (nhsNumber.present) {
      map['nhs_number'] = Variable<String>(nhsNumber.value);
    }
    if (bloodType.present) {
      map['blood_type'] = Variable<String>(bloodType.value);
    }
    if (conditions.present) {
      map['conditions'] = Variable<String>(conditions.value);
    }
    if (allergies.present) {
      map['allergies'] = Variable<String>(allergies.value);
    }
    if (immunisationNotes.present) {
      map['immunisation_notes'] = Variable<String>(immunisationNotes.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (updatedById.present) {
      map['updated_by_id'] = Variable<String>(updatedById.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicalProfileTableCompanion(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('nhsNumber: $nhsNumber, ')
          ..write('bloodType: $bloodType, ')
          ..write('conditions: $conditions, ')
          ..write('allergies: $allergies, ')
          ..write('immunisationNotes: $immunisationNotes, ')
          ..write('notes: $notes, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HealthcareContactsTableTable extends HealthcareContactsTable
    with TableInfo<$HealthcareContactsTableTable, HealthcareContactRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HealthcareContactsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _homeIdMeta = const VerificationMeta('homeId');
  @override
  late final GeneratedColumn<String> homeId = GeneratedColumn<String>(
    'home_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _childIdMeta = const VerificationMeta(
    'childId',
  );
  @override
  late final GeneratedColumn<String> childId = GeneratedColumn<String>(
    'child_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contactTypeMeta = const VerificationMeta(
    'contactType',
  );
  @override
  late final GeneratedColumn<String> contactType = GeneratedColumn<String>(
    'contact_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdByIdMeta = const VerificationMeta(
    'createdById',
  );
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
    'created_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByIdMeta = const VerificationMeta(
    'updatedById',
  );
  @override
  late final GeneratedColumn<String> updatedById = GeneratedColumn<String>(
    'updated_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
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
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'healthcare_contacts';
  @override
  VerificationContext validateIntegrity(
    Insertable<HealthcareContactRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('home_id')) {
      context.handle(
        _homeIdMeta,
        homeId.isAcceptableOrUnknown(data['home_id']!, _homeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_homeIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(
        _childIdMeta,
        childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta),
      );
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('contact_type')) {
      context.handle(
        _contactTypeMeta,
        contactType.isAcceptableOrUnknown(
          data['contact_type']!,
          _contactTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_contactTypeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
        _createdByIdMeta,
        createdById.isAcceptableOrUnknown(
          data['created_by_id']!,
          _createdByIdMeta,
        ),
      );
    }
    if (data.containsKey('updated_by_id')) {
      context.handle(
        _updatedByIdMeta,
        updatedById.isAcceptableOrUnknown(
          data['updated_by_id']!,
          _updatedByIdMeta,
        ),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HealthcareContactRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HealthcareContactRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      homeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_id'],
      )!,
      childId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}child_id'],
      )!,
      contactType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact_type'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_id'],
      ),
      updatedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by_id'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $HealthcareContactsTableTable createAlias(String alias) {
    return $HealthcareContactsTableTable(attachedDatabase, alias);
  }
}

class HealthcareContactRow extends DataClass
    implements Insertable<HealthcareContactRow> {
  final String id;
  final String homeId;
  final String childId;
  final String contactType;
  final String name;
  final String? role;
  final String? phone;
  final String? email;
  final String? address;
  final String? notes;
  final String? createdById;
  final String? updatedById;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSynced;
  const HealthcareContactRow({
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
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['home_id'] = Variable<String>(homeId);
    map['child_id'] = Variable<String>(childId);
    map['contact_type'] = Variable<String>(contactType);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || role != null) {
      map['role'] = Variable<String>(role);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || updatedById != null) {
      map['updated_by_id'] = Variable<String>(updatedById);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  HealthcareContactsTableCompanion toCompanion(bool nullToAbsent) {
    return HealthcareContactsTableCompanion(
      id: Value(id),
      homeId: Value(homeId),
      childId: Value(childId),
      contactType: Value(contactType),
      name: Value(name),
      role: role == null && nullToAbsent ? const Value.absent() : Value(role),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      updatedById: updatedById == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedById),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory HealthcareContactRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HealthcareContactRow(
      id: serializer.fromJson<String>(json['id']),
      homeId: serializer.fromJson<String>(json['homeId']),
      childId: serializer.fromJson<String>(json['childId']),
      contactType: serializer.fromJson<String>(json['contactType']),
      name: serializer.fromJson<String>(json['name']),
      role: serializer.fromJson<String?>(json['role']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      address: serializer.fromJson<String?>(json['address']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      updatedById: serializer.fromJson<String?>(json['updatedById']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'homeId': serializer.toJson<String>(homeId),
      'childId': serializer.toJson<String>(childId),
      'contactType': serializer.toJson<String>(contactType),
      'name': serializer.toJson<String>(name),
      'role': serializer.toJson<String?>(role),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'address': serializer.toJson<String?>(address),
      'notes': serializer.toJson<String?>(notes),
      'createdById': serializer.toJson<String?>(createdById),
      'updatedById': serializer.toJson<String?>(updatedById),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  HealthcareContactRow copyWith({
    String? id,
    String? homeId,
    String? childId,
    String? contactType,
    String? name,
    Value<String?> role = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> address = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> createdById = const Value.absent(),
    Value<String?> updatedById = const Value.absent(),
    Value<DateTime?> deletedAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
  }) => HealthcareContactRow(
    id: id ?? this.id,
    homeId: homeId ?? this.homeId,
    childId: childId ?? this.childId,
    contactType: contactType ?? this.contactType,
    name: name ?? this.name,
    role: role.present ? role.value : this.role,
    phone: phone.present ? phone.value : this.phone,
    email: email.present ? email.value : this.email,
    address: address.present ? address.value : this.address,
    notes: notes.present ? notes.value : this.notes,
    createdById: createdById.present ? createdById.value : this.createdById,
    updatedById: updatedById.present ? updatedById.value : this.updatedById,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  HealthcareContactRow copyWithCompanion(
    HealthcareContactsTableCompanion data,
  ) {
    return HealthcareContactRow(
      id: data.id.present ? data.id.value : this.id,
      homeId: data.homeId.present ? data.homeId.value : this.homeId,
      childId: data.childId.present ? data.childId.value : this.childId,
      contactType: data.contactType.present
          ? data.contactType.value
          : this.contactType,
      name: data.name.present ? data.name.value : this.name,
      role: data.role.present ? data.role.value : this.role,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      address: data.address.present ? data.address.value : this.address,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdById: data.createdById.present
          ? data.createdById.value
          : this.createdById,
      updatedById: data.updatedById.present
          ? data.updatedById.value
          : this.updatedById,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HealthcareContactRow(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('contactType: $contactType, ')
          ..write('name: $name, ')
          ..write('role: $role, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('notes: $notes, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HealthcareContactRow &&
          other.id == this.id &&
          other.homeId == this.homeId &&
          other.childId == this.childId &&
          other.contactType == this.contactType &&
          other.name == this.name &&
          other.role == this.role &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.address == this.address &&
          other.notes == this.notes &&
          other.createdById == this.createdById &&
          other.updatedById == this.updatedById &&
          other.deletedAt == this.deletedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class HealthcareContactsTableCompanion
    extends UpdateCompanion<HealthcareContactRow> {
  final Value<String> id;
  final Value<String> homeId;
  final Value<String> childId;
  final Value<String> contactType;
  final Value<String> name;
  final Value<String?> role;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> address;
  final Value<String?> notes;
  final Value<String?> createdById;
  final Value<String?> updatedById;
  final Value<DateTime?> deletedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const HealthcareContactsTableCompanion({
    this.id = const Value.absent(),
    this.homeId = const Value.absent(),
    this.childId = const Value.absent(),
    this.contactType = const Value.absent(),
    this.name = const Value.absent(),
    this.role = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HealthcareContactsTableCompanion.insert({
    required String id,
    required String homeId,
    required String childId,
    required String contactType,
    required String name,
    this.role = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       homeId = Value(homeId),
       childId = Value(childId),
       contactType = Value(contactType),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<HealthcareContactRow> custom({
    Expression<String>? id,
    Expression<String>? homeId,
    Expression<String>? childId,
    Expression<String>? contactType,
    Expression<String>? name,
    Expression<String>? role,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? address,
    Expression<String>? notes,
    Expression<String>? createdById,
    Expression<String>? updatedById,
    Expression<DateTime>? deletedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (homeId != null) 'home_id': homeId,
      if (childId != null) 'child_id': childId,
      if (contactType != null) 'contact_type': contactType,
      if (name != null) 'name': name,
      if (role != null) 'role': role,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (address != null) 'address': address,
      if (notes != null) 'notes': notes,
      if (createdById != null) 'created_by_id': createdById,
      if (updatedById != null) 'updated_by_id': updatedById,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HealthcareContactsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? homeId,
    Value<String>? childId,
    Value<String>? contactType,
    Value<String>? name,
    Value<String?>? role,
    Value<String?>? phone,
    Value<String?>? email,
    Value<String?>? address,
    Value<String?>? notes,
    Value<String?>? createdById,
    Value<String?>? updatedById,
    Value<DateTime?>? deletedAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return HealthcareContactsTableCompanion(
      id: id ?? this.id,
      homeId: homeId ?? this.homeId,
      childId: childId ?? this.childId,
      contactType: contactType ?? this.contactType,
      name: name ?? this.name,
      role: role ?? this.role,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      notes: notes ?? this.notes,
      createdById: createdById ?? this.createdById,
      updatedById: updatedById ?? this.updatedById,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (homeId.present) {
      map['home_id'] = Variable<String>(homeId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<String>(childId.value);
    }
    if (contactType.present) {
      map['contact_type'] = Variable<String>(contactType.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (updatedById.present) {
      map['updated_by_id'] = Variable<String>(updatedById.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HealthcareContactsTableCompanion(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('contactType: $contactType, ')
          ..write('name: $name, ')
          ..write('role: $role, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('notes: $notes, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BehaviourIncidentsTableTable extends BehaviourIncidentsTable
    with TableInfo<$BehaviourIncidentsTableTable, BehaviourIncidentRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BehaviourIncidentsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _homeIdMeta = const VerificationMeta('homeId');
  @override
  late final GeneratedColumn<String> homeId = GeneratedColumn<String>(
    'home_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _childIdMeta = const VerificationMeta(
    'childId',
  );
  @override
  late final GeneratedColumn<String> childId = GeneratedColumn<String>(
    'child_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shiftMeta = const VerificationMeta('shift');
  @override
  late final GeneratedColumn<String> shift = GeneratedColumn<String>(
    'shift',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _occurredAtMeta = const VerificationMeta(
    'occurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _severityMeta = const VerificationMeta(
    'severity',
  );
  @override
  late final GeneratedColumn<String> severity = GeneratedColumn<String>(
    'severity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _antecedentMeta = const VerificationMeta(
    'antecedent',
  );
  @override
  late final GeneratedColumn<String> antecedent = GeneratedColumn<String>(
    'antecedent',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _behaviourMeta = const VerificationMeta(
    'behaviour',
  );
  @override
  late final GeneratedColumn<String> behaviour = GeneratedColumn<String>(
    'behaviour',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _consequenceMeta = const VerificationMeta(
    'consequence',
  );
  @override
  late final GeneratedColumn<String> consequence = GeneratedColumn<String>(
    'consequence',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationMinutesMeta = const VerificationMeta(
    'durationMinutes',
  );
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
    'duration_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _physicalInterventionMeta =
      const VerificationMeta('physicalIntervention');
  @override
  late final GeneratedColumn<bool> physicalIntervention = GeneratedColumn<bool>(
    'physical_intervention',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("physical_intervention" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _interventionDetailsMeta =
      const VerificationMeta('interventionDetails');
  @override
  late final GeneratedColumn<String> interventionDetails =
      GeneratedColumn<String>(
        'intervention_details',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _injuryOccurredMeta = const VerificationMeta(
    'injuryOccurred',
  );
  @override
  late final GeneratedColumn<bool> injuryOccurred = GeneratedColumn<bool>(
    'injury_occurred',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("injury_occurred" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _injuryDetailsMeta = const VerificationMeta(
    'injuryDetails',
  );
  @override
  late final GeneratedColumn<String> injuryDetails = GeneratedColumn<String>(
    'injury_details',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recordedByIdMeta = const VerificationMeta(
    'recordedById',
  );
  @override
  late final GeneratedColumn<String> recordedById = GeneratedColumn<String>(
    'recorded_by_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordedByNameMeta = const VerificationMeta(
    'recordedByName',
  );
  @override
  late final GeneratedColumn<String> recordedByName = GeneratedColumn<String>(
    'recorded_by_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdByIdMeta = const VerificationMeta(
    'createdById',
  );
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
    'created_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByIdMeta = const VerificationMeta(
    'updatedById',
  );
  @override
  late final GeneratedColumn<String> updatedById = GeneratedColumn<String>(
    'updated_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    homeId,
    childId,
    shift,
    occurredAt,
    severity,
    antecedent,
    behaviour,
    consequence,
    durationMinutes,
    location,
    physicalIntervention,
    interventionDetails,
    injuryOccurred,
    injuryDetails,
    notes,
    recordedById,
    recordedByName,
    createdById,
    updatedById,
    deletedAt,
    createdAt,
    updatedAt,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'behaviour_incidents';
  @override
  VerificationContext validateIntegrity(
    Insertable<BehaviourIncidentRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('home_id')) {
      context.handle(
        _homeIdMeta,
        homeId.isAcceptableOrUnknown(data['home_id']!, _homeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_homeIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(
        _childIdMeta,
        childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta),
      );
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('shift')) {
      context.handle(
        _shiftMeta,
        shift.isAcceptableOrUnknown(data['shift']!, _shiftMeta),
      );
    } else if (isInserting) {
      context.missing(_shiftMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
        _occurredAtMeta,
        occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    if (data.containsKey('severity')) {
      context.handle(
        _severityMeta,
        severity.isAcceptableOrUnknown(data['severity']!, _severityMeta),
      );
    } else if (isInserting) {
      context.missing(_severityMeta);
    }
    if (data.containsKey('antecedent')) {
      context.handle(
        _antecedentMeta,
        antecedent.isAcceptableOrUnknown(data['antecedent']!, _antecedentMeta),
      );
    } else if (isInserting) {
      context.missing(_antecedentMeta);
    }
    if (data.containsKey('behaviour')) {
      context.handle(
        _behaviourMeta,
        behaviour.isAcceptableOrUnknown(data['behaviour']!, _behaviourMeta),
      );
    } else if (isInserting) {
      context.missing(_behaviourMeta);
    }
    if (data.containsKey('consequence')) {
      context.handle(
        _consequenceMeta,
        consequence.isAcceptableOrUnknown(
          data['consequence']!,
          _consequenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_consequenceMeta);
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
        _durationMinutesMeta,
        durationMinutes.isAcceptableOrUnknown(
          data['duration_minutes']!,
          _durationMinutesMeta,
        ),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('physical_intervention')) {
      context.handle(
        _physicalInterventionMeta,
        physicalIntervention.isAcceptableOrUnknown(
          data['physical_intervention']!,
          _physicalInterventionMeta,
        ),
      );
    }
    if (data.containsKey('intervention_details')) {
      context.handle(
        _interventionDetailsMeta,
        interventionDetails.isAcceptableOrUnknown(
          data['intervention_details']!,
          _interventionDetailsMeta,
        ),
      );
    }
    if (data.containsKey('injury_occurred')) {
      context.handle(
        _injuryOccurredMeta,
        injuryOccurred.isAcceptableOrUnknown(
          data['injury_occurred']!,
          _injuryOccurredMeta,
        ),
      );
    }
    if (data.containsKey('injury_details')) {
      context.handle(
        _injuryDetailsMeta,
        injuryDetails.isAcceptableOrUnknown(
          data['injury_details']!,
          _injuryDetailsMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('recorded_by_id')) {
      context.handle(
        _recordedByIdMeta,
        recordedById.isAcceptableOrUnknown(
          data['recorded_by_id']!,
          _recordedByIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recordedByIdMeta);
    }
    if (data.containsKey('recorded_by_name')) {
      context.handle(
        _recordedByNameMeta,
        recordedByName.isAcceptableOrUnknown(
          data['recorded_by_name']!,
          _recordedByNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recordedByNameMeta);
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
        _createdByIdMeta,
        createdById.isAcceptableOrUnknown(
          data['created_by_id']!,
          _createdByIdMeta,
        ),
      );
    }
    if (data.containsKey('updated_by_id')) {
      context.handle(
        _updatedByIdMeta,
        updatedById.isAcceptableOrUnknown(
          data['updated_by_id']!,
          _updatedByIdMeta,
        ),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BehaviourIncidentRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BehaviourIncidentRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      homeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_id'],
      )!,
      childId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}child_id'],
      )!,
      shift: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shift'],
      )!,
      occurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}occurred_at'],
      )!,
      severity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}severity'],
      )!,
      antecedent: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}antecedent'],
      )!,
      behaviour: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}behaviour'],
      )!,
      consequence: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}consequence'],
      )!,
      durationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_minutes'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      physicalIntervention: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}physical_intervention'],
      )!,
      interventionDetails: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}intervention_details'],
      ),
      injuryOccurred: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}injury_occurred'],
      )!,
      injuryDetails: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}injury_details'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      recordedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorded_by_id'],
      )!,
      recordedByName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorded_by_name'],
      )!,
      createdById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_id'],
      ),
      updatedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by_id'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $BehaviourIncidentsTableTable createAlias(String alias) {
    return $BehaviourIncidentsTableTable(attachedDatabase, alias);
  }
}

class BehaviourIncidentRow extends DataClass
    implements Insertable<BehaviourIncidentRow> {
  final String id;
  final String homeId;
  final String childId;
  final String shift;
  final DateTime occurredAt;
  final String severity;
  final String antecedent;
  final String behaviour;
  final String consequence;
  final int? durationMinutes;
  final String? location;
  final bool physicalIntervention;
  final String? interventionDetails;
  final bool injuryOccurred;
  final String? injuryDetails;
  final String? notes;
  final String recordedById;
  final String recordedByName;
  final String? createdById;
  final String? updatedById;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSynced;
  const BehaviourIncidentRow({
    required this.id,
    required this.homeId,
    required this.childId,
    required this.shift,
    required this.occurredAt,
    required this.severity,
    required this.antecedent,
    required this.behaviour,
    required this.consequence,
    this.durationMinutes,
    this.location,
    required this.physicalIntervention,
    this.interventionDetails,
    required this.injuryOccurred,
    this.injuryDetails,
    this.notes,
    required this.recordedById,
    required this.recordedByName,
    this.createdById,
    this.updatedById,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['home_id'] = Variable<String>(homeId);
    map['child_id'] = Variable<String>(childId);
    map['shift'] = Variable<String>(shift);
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    map['severity'] = Variable<String>(severity);
    map['antecedent'] = Variable<String>(antecedent);
    map['behaviour'] = Variable<String>(behaviour);
    map['consequence'] = Variable<String>(consequence);
    if (!nullToAbsent || durationMinutes != null) {
      map['duration_minutes'] = Variable<int>(durationMinutes);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    map['physical_intervention'] = Variable<bool>(physicalIntervention);
    if (!nullToAbsent || interventionDetails != null) {
      map['intervention_details'] = Variable<String>(interventionDetails);
    }
    map['injury_occurred'] = Variable<bool>(injuryOccurred);
    if (!nullToAbsent || injuryDetails != null) {
      map['injury_details'] = Variable<String>(injuryDetails);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['recorded_by_id'] = Variable<String>(recordedById);
    map['recorded_by_name'] = Variable<String>(recordedByName);
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || updatedById != null) {
      map['updated_by_id'] = Variable<String>(updatedById);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  BehaviourIncidentsTableCompanion toCompanion(bool nullToAbsent) {
    return BehaviourIncidentsTableCompanion(
      id: Value(id),
      homeId: Value(homeId),
      childId: Value(childId),
      shift: Value(shift),
      occurredAt: Value(occurredAt),
      severity: Value(severity),
      antecedent: Value(antecedent),
      behaviour: Value(behaviour),
      consequence: Value(consequence),
      durationMinutes: durationMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(durationMinutes),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      physicalIntervention: Value(physicalIntervention),
      interventionDetails: interventionDetails == null && nullToAbsent
          ? const Value.absent()
          : Value(interventionDetails),
      injuryOccurred: Value(injuryOccurred),
      injuryDetails: injuryDetails == null && nullToAbsent
          ? const Value.absent()
          : Value(injuryDetails),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      recordedById: Value(recordedById),
      recordedByName: Value(recordedByName),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      updatedById: updatedById == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedById),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory BehaviourIncidentRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BehaviourIncidentRow(
      id: serializer.fromJson<String>(json['id']),
      homeId: serializer.fromJson<String>(json['homeId']),
      childId: serializer.fromJson<String>(json['childId']),
      shift: serializer.fromJson<String>(json['shift']),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
      severity: serializer.fromJson<String>(json['severity']),
      antecedent: serializer.fromJson<String>(json['antecedent']),
      behaviour: serializer.fromJson<String>(json['behaviour']),
      consequence: serializer.fromJson<String>(json['consequence']),
      durationMinutes: serializer.fromJson<int?>(json['durationMinutes']),
      location: serializer.fromJson<String?>(json['location']),
      physicalIntervention: serializer.fromJson<bool>(
        json['physicalIntervention'],
      ),
      interventionDetails: serializer.fromJson<String?>(
        json['interventionDetails'],
      ),
      injuryOccurred: serializer.fromJson<bool>(json['injuryOccurred']),
      injuryDetails: serializer.fromJson<String?>(json['injuryDetails']),
      notes: serializer.fromJson<String?>(json['notes']),
      recordedById: serializer.fromJson<String>(json['recordedById']),
      recordedByName: serializer.fromJson<String>(json['recordedByName']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      updatedById: serializer.fromJson<String?>(json['updatedById']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'homeId': serializer.toJson<String>(homeId),
      'childId': serializer.toJson<String>(childId),
      'shift': serializer.toJson<String>(shift),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
      'severity': serializer.toJson<String>(severity),
      'antecedent': serializer.toJson<String>(antecedent),
      'behaviour': serializer.toJson<String>(behaviour),
      'consequence': serializer.toJson<String>(consequence),
      'durationMinutes': serializer.toJson<int?>(durationMinutes),
      'location': serializer.toJson<String?>(location),
      'physicalIntervention': serializer.toJson<bool>(physicalIntervention),
      'interventionDetails': serializer.toJson<String?>(interventionDetails),
      'injuryOccurred': serializer.toJson<bool>(injuryOccurred),
      'injuryDetails': serializer.toJson<String?>(injuryDetails),
      'notes': serializer.toJson<String?>(notes),
      'recordedById': serializer.toJson<String>(recordedById),
      'recordedByName': serializer.toJson<String>(recordedByName),
      'createdById': serializer.toJson<String?>(createdById),
      'updatedById': serializer.toJson<String?>(updatedById),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  BehaviourIncidentRow copyWith({
    String? id,
    String? homeId,
    String? childId,
    String? shift,
    DateTime? occurredAt,
    String? severity,
    String? antecedent,
    String? behaviour,
    String? consequence,
    Value<int?> durationMinutes = const Value.absent(),
    Value<String?> location = const Value.absent(),
    bool? physicalIntervention,
    Value<String?> interventionDetails = const Value.absent(),
    bool? injuryOccurred,
    Value<String?> injuryDetails = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    String? recordedById,
    String? recordedByName,
    Value<String?> createdById = const Value.absent(),
    Value<String?> updatedById = const Value.absent(),
    Value<DateTime?> deletedAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
  }) => BehaviourIncidentRow(
    id: id ?? this.id,
    homeId: homeId ?? this.homeId,
    childId: childId ?? this.childId,
    shift: shift ?? this.shift,
    occurredAt: occurredAt ?? this.occurredAt,
    severity: severity ?? this.severity,
    antecedent: antecedent ?? this.antecedent,
    behaviour: behaviour ?? this.behaviour,
    consequence: consequence ?? this.consequence,
    durationMinutes: durationMinutes.present
        ? durationMinutes.value
        : this.durationMinutes,
    location: location.present ? location.value : this.location,
    physicalIntervention: physicalIntervention ?? this.physicalIntervention,
    interventionDetails: interventionDetails.present
        ? interventionDetails.value
        : this.interventionDetails,
    injuryOccurred: injuryOccurred ?? this.injuryOccurred,
    injuryDetails: injuryDetails.present
        ? injuryDetails.value
        : this.injuryDetails,
    notes: notes.present ? notes.value : this.notes,
    recordedById: recordedById ?? this.recordedById,
    recordedByName: recordedByName ?? this.recordedByName,
    createdById: createdById.present ? createdById.value : this.createdById,
    updatedById: updatedById.present ? updatedById.value : this.updatedById,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  BehaviourIncidentRow copyWithCompanion(
    BehaviourIncidentsTableCompanion data,
  ) {
    return BehaviourIncidentRow(
      id: data.id.present ? data.id.value : this.id,
      homeId: data.homeId.present ? data.homeId.value : this.homeId,
      childId: data.childId.present ? data.childId.value : this.childId,
      shift: data.shift.present ? data.shift.value : this.shift,
      occurredAt: data.occurredAt.present
          ? data.occurredAt.value
          : this.occurredAt,
      severity: data.severity.present ? data.severity.value : this.severity,
      antecedent: data.antecedent.present
          ? data.antecedent.value
          : this.antecedent,
      behaviour: data.behaviour.present ? data.behaviour.value : this.behaviour,
      consequence: data.consequence.present
          ? data.consequence.value
          : this.consequence,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      location: data.location.present ? data.location.value : this.location,
      physicalIntervention: data.physicalIntervention.present
          ? data.physicalIntervention.value
          : this.physicalIntervention,
      interventionDetails: data.interventionDetails.present
          ? data.interventionDetails.value
          : this.interventionDetails,
      injuryOccurred: data.injuryOccurred.present
          ? data.injuryOccurred.value
          : this.injuryOccurred,
      injuryDetails: data.injuryDetails.present
          ? data.injuryDetails.value
          : this.injuryDetails,
      notes: data.notes.present ? data.notes.value : this.notes,
      recordedById: data.recordedById.present
          ? data.recordedById.value
          : this.recordedById,
      recordedByName: data.recordedByName.present
          ? data.recordedByName.value
          : this.recordedByName,
      createdById: data.createdById.present
          ? data.createdById.value
          : this.createdById,
      updatedById: data.updatedById.present
          ? data.updatedById.value
          : this.updatedById,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BehaviourIncidentRow(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('shift: $shift, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('severity: $severity, ')
          ..write('antecedent: $antecedent, ')
          ..write('behaviour: $behaviour, ')
          ..write('consequence: $consequence, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('location: $location, ')
          ..write('physicalIntervention: $physicalIntervention, ')
          ..write('interventionDetails: $interventionDetails, ')
          ..write('injuryOccurred: $injuryOccurred, ')
          ..write('injuryDetails: $injuryDetails, ')
          ..write('notes: $notes, ')
          ..write('recordedById: $recordedById, ')
          ..write('recordedByName: $recordedByName, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    homeId,
    childId,
    shift,
    occurredAt,
    severity,
    antecedent,
    behaviour,
    consequence,
    durationMinutes,
    location,
    physicalIntervention,
    interventionDetails,
    injuryOccurred,
    injuryDetails,
    notes,
    recordedById,
    recordedByName,
    createdById,
    updatedById,
    deletedAt,
    createdAt,
    updatedAt,
    isSynced,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BehaviourIncidentRow &&
          other.id == this.id &&
          other.homeId == this.homeId &&
          other.childId == this.childId &&
          other.shift == this.shift &&
          other.occurredAt == this.occurredAt &&
          other.severity == this.severity &&
          other.antecedent == this.antecedent &&
          other.behaviour == this.behaviour &&
          other.consequence == this.consequence &&
          other.durationMinutes == this.durationMinutes &&
          other.location == this.location &&
          other.physicalIntervention == this.physicalIntervention &&
          other.interventionDetails == this.interventionDetails &&
          other.injuryOccurred == this.injuryOccurred &&
          other.injuryDetails == this.injuryDetails &&
          other.notes == this.notes &&
          other.recordedById == this.recordedById &&
          other.recordedByName == this.recordedByName &&
          other.createdById == this.createdById &&
          other.updatedById == this.updatedById &&
          other.deletedAt == this.deletedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class BehaviourIncidentsTableCompanion
    extends UpdateCompanion<BehaviourIncidentRow> {
  final Value<String> id;
  final Value<String> homeId;
  final Value<String> childId;
  final Value<String> shift;
  final Value<DateTime> occurredAt;
  final Value<String> severity;
  final Value<String> antecedent;
  final Value<String> behaviour;
  final Value<String> consequence;
  final Value<int?> durationMinutes;
  final Value<String?> location;
  final Value<bool> physicalIntervention;
  final Value<String?> interventionDetails;
  final Value<bool> injuryOccurred;
  final Value<String?> injuryDetails;
  final Value<String?> notes;
  final Value<String> recordedById;
  final Value<String> recordedByName;
  final Value<String?> createdById;
  final Value<String?> updatedById;
  final Value<DateTime?> deletedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const BehaviourIncidentsTableCompanion({
    this.id = const Value.absent(),
    this.homeId = const Value.absent(),
    this.childId = const Value.absent(),
    this.shift = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.severity = const Value.absent(),
    this.antecedent = const Value.absent(),
    this.behaviour = const Value.absent(),
    this.consequence = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.location = const Value.absent(),
    this.physicalIntervention = const Value.absent(),
    this.interventionDetails = const Value.absent(),
    this.injuryOccurred = const Value.absent(),
    this.injuryDetails = const Value.absent(),
    this.notes = const Value.absent(),
    this.recordedById = const Value.absent(),
    this.recordedByName = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BehaviourIncidentsTableCompanion.insert({
    required String id,
    required String homeId,
    required String childId,
    required String shift,
    required DateTime occurredAt,
    required String severity,
    required String antecedent,
    required String behaviour,
    required String consequence,
    this.durationMinutes = const Value.absent(),
    this.location = const Value.absent(),
    this.physicalIntervention = const Value.absent(),
    this.interventionDetails = const Value.absent(),
    this.injuryOccurred = const Value.absent(),
    this.injuryDetails = const Value.absent(),
    this.notes = const Value.absent(),
    required String recordedById,
    required String recordedByName,
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       homeId = Value(homeId),
       childId = Value(childId),
       shift = Value(shift),
       occurredAt = Value(occurredAt),
       severity = Value(severity),
       antecedent = Value(antecedent),
       behaviour = Value(behaviour),
       consequence = Value(consequence),
       recordedById = Value(recordedById),
       recordedByName = Value(recordedByName),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<BehaviourIncidentRow> custom({
    Expression<String>? id,
    Expression<String>? homeId,
    Expression<String>? childId,
    Expression<String>? shift,
    Expression<DateTime>? occurredAt,
    Expression<String>? severity,
    Expression<String>? antecedent,
    Expression<String>? behaviour,
    Expression<String>? consequence,
    Expression<int>? durationMinutes,
    Expression<String>? location,
    Expression<bool>? physicalIntervention,
    Expression<String>? interventionDetails,
    Expression<bool>? injuryOccurred,
    Expression<String>? injuryDetails,
    Expression<String>? notes,
    Expression<String>? recordedById,
    Expression<String>? recordedByName,
    Expression<String>? createdById,
    Expression<String>? updatedById,
    Expression<DateTime>? deletedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (homeId != null) 'home_id': homeId,
      if (childId != null) 'child_id': childId,
      if (shift != null) 'shift': shift,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (severity != null) 'severity': severity,
      if (antecedent != null) 'antecedent': antecedent,
      if (behaviour != null) 'behaviour': behaviour,
      if (consequence != null) 'consequence': consequence,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (location != null) 'location': location,
      if (physicalIntervention != null)
        'physical_intervention': physicalIntervention,
      if (interventionDetails != null)
        'intervention_details': interventionDetails,
      if (injuryOccurred != null) 'injury_occurred': injuryOccurred,
      if (injuryDetails != null) 'injury_details': injuryDetails,
      if (notes != null) 'notes': notes,
      if (recordedById != null) 'recorded_by_id': recordedById,
      if (recordedByName != null) 'recorded_by_name': recordedByName,
      if (createdById != null) 'created_by_id': createdById,
      if (updatedById != null) 'updated_by_id': updatedById,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BehaviourIncidentsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? homeId,
    Value<String>? childId,
    Value<String>? shift,
    Value<DateTime>? occurredAt,
    Value<String>? severity,
    Value<String>? antecedent,
    Value<String>? behaviour,
    Value<String>? consequence,
    Value<int?>? durationMinutes,
    Value<String?>? location,
    Value<bool>? physicalIntervention,
    Value<String?>? interventionDetails,
    Value<bool>? injuryOccurred,
    Value<String?>? injuryDetails,
    Value<String?>? notes,
    Value<String>? recordedById,
    Value<String>? recordedByName,
    Value<String?>? createdById,
    Value<String?>? updatedById,
    Value<DateTime?>? deletedAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return BehaviourIncidentsTableCompanion(
      id: id ?? this.id,
      homeId: homeId ?? this.homeId,
      childId: childId ?? this.childId,
      shift: shift ?? this.shift,
      occurredAt: occurredAt ?? this.occurredAt,
      severity: severity ?? this.severity,
      antecedent: antecedent ?? this.antecedent,
      behaviour: behaviour ?? this.behaviour,
      consequence: consequence ?? this.consequence,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      location: location ?? this.location,
      physicalIntervention: physicalIntervention ?? this.physicalIntervention,
      interventionDetails: interventionDetails ?? this.interventionDetails,
      injuryOccurred: injuryOccurred ?? this.injuryOccurred,
      injuryDetails: injuryDetails ?? this.injuryDetails,
      notes: notes ?? this.notes,
      recordedById: recordedById ?? this.recordedById,
      recordedByName: recordedByName ?? this.recordedByName,
      createdById: createdById ?? this.createdById,
      updatedById: updatedById ?? this.updatedById,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (homeId.present) {
      map['home_id'] = Variable<String>(homeId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<String>(childId.value);
    }
    if (shift.present) {
      map['shift'] = Variable<String>(shift.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (severity.present) {
      map['severity'] = Variable<String>(severity.value);
    }
    if (antecedent.present) {
      map['antecedent'] = Variable<String>(antecedent.value);
    }
    if (behaviour.present) {
      map['behaviour'] = Variable<String>(behaviour.value);
    }
    if (consequence.present) {
      map['consequence'] = Variable<String>(consequence.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (physicalIntervention.present) {
      map['physical_intervention'] = Variable<bool>(physicalIntervention.value);
    }
    if (interventionDetails.present) {
      map['intervention_details'] = Variable<String>(interventionDetails.value);
    }
    if (injuryOccurred.present) {
      map['injury_occurred'] = Variable<bool>(injuryOccurred.value);
    }
    if (injuryDetails.present) {
      map['injury_details'] = Variable<String>(injuryDetails.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (recordedById.present) {
      map['recorded_by_id'] = Variable<String>(recordedById.value);
    }
    if (recordedByName.present) {
      map['recorded_by_name'] = Variable<String>(recordedByName.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (updatedById.present) {
      map['updated_by_id'] = Variable<String>(updatedById.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BehaviourIncidentsTableCompanion(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('shift: $shift, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('severity: $severity, ')
          ..write('antecedent: $antecedent, ')
          ..write('behaviour: $behaviour, ')
          ..write('consequence: $consequence, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('location: $location, ')
          ..write('physicalIntervention: $physicalIntervention, ')
          ..write('interventionDetails: $interventionDetails, ')
          ..write('injuryOccurred: $injuryOccurred, ')
          ..write('injuryDetails: $injuryDetails, ')
          ..write('notes: $notes, ')
          ..write('recordedById: $recordedById, ')
          ..write('recordedByName: $recordedByName, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SleepEntriesTableTable extends SleepEntriesTable
    with TableInfo<$SleepEntriesTableTable, SleepEntryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SleepEntriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _homeIdMeta = const VerificationMeta('homeId');
  @override
  late final GeneratedColumn<String> homeId = GeneratedColumn<String>(
    'home_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _childIdMeta = const VerificationMeta(
    'childId',
  );
  @override
  late final GeneratedColumn<String> childId = GeneratedColumn<String>(
    'child_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shiftMeta = const VerificationMeta('shift');
  @override
  late final GeneratedColumn<String> shift = GeneratedColumn<String>(
    'shift',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bedTimeMeta = const VerificationMeta(
    'bedTime',
  );
  @override
  late final GeneratedColumn<String> bedTime = GeneratedColumn<String>(
    'bed_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _settledTimeMeta = const VerificationMeta(
    'settledTime',
  );
  @override
  late final GeneratedColumn<String> settledTime = GeneratedColumn<String>(
    'settled_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _wakeTimeMeta = const VerificationMeta(
    'wakeTime',
  );
  @override
  late final GeneratedColumn<String> wakeTime = GeneratedColumn<String>(
    'wake_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _numberOfWakingsMeta = const VerificationMeta(
    'numberOfWakings',
  );
  @override
  late final GeneratedColumn<int> numberOfWakings = GeneratedColumn<int>(
    'number_of_wakings',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _qualityMeta = const VerificationMeta(
    'quality',
  );
  @override
  late final GeneratedColumn<String> quality = GeneratedColumn<String>(
    'quality',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recordedByIdMeta = const VerificationMeta(
    'recordedById',
  );
  @override
  late final GeneratedColumn<String> recordedById = GeneratedColumn<String>(
    'recorded_by_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordedByNameMeta = const VerificationMeta(
    'recordedByName',
  );
  @override
  late final GeneratedColumn<String> recordedByName = GeneratedColumn<String>(
    'recorded_by_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdByIdMeta = const VerificationMeta(
    'createdById',
  );
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
    'created_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByIdMeta = const VerificationMeta(
    'updatedById',
  );
  @override
  late final GeneratedColumn<String> updatedById = GeneratedColumn<String>(
    'updated_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    homeId,
    childId,
    date,
    shift,
    bedTime,
    settledTime,
    wakeTime,
    numberOfWakings,
    quality,
    notes,
    recordedById,
    recordedByName,
    createdById,
    updatedById,
    deletedAt,
    createdAt,
    updatedAt,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sleep_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<SleepEntryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('home_id')) {
      context.handle(
        _homeIdMeta,
        homeId.isAcceptableOrUnknown(data['home_id']!, _homeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_homeIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(
        _childIdMeta,
        childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta),
      );
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('shift')) {
      context.handle(
        _shiftMeta,
        shift.isAcceptableOrUnknown(data['shift']!, _shiftMeta),
      );
    } else if (isInserting) {
      context.missing(_shiftMeta);
    }
    if (data.containsKey('bed_time')) {
      context.handle(
        _bedTimeMeta,
        bedTime.isAcceptableOrUnknown(data['bed_time']!, _bedTimeMeta),
      );
    }
    if (data.containsKey('settled_time')) {
      context.handle(
        _settledTimeMeta,
        settledTime.isAcceptableOrUnknown(
          data['settled_time']!,
          _settledTimeMeta,
        ),
      );
    }
    if (data.containsKey('wake_time')) {
      context.handle(
        _wakeTimeMeta,
        wakeTime.isAcceptableOrUnknown(data['wake_time']!, _wakeTimeMeta),
      );
    }
    if (data.containsKey('number_of_wakings')) {
      context.handle(
        _numberOfWakingsMeta,
        numberOfWakings.isAcceptableOrUnknown(
          data['number_of_wakings']!,
          _numberOfWakingsMeta,
        ),
      );
    }
    if (data.containsKey('quality')) {
      context.handle(
        _qualityMeta,
        quality.isAcceptableOrUnknown(data['quality']!, _qualityMeta),
      );
    } else if (isInserting) {
      context.missing(_qualityMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('recorded_by_id')) {
      context.handle(
        _recordedByIdMeta,
        recordedById.isAcceptableOrUnknown(
          data['recorded_by_id']!,
          _recordedByIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recordedByIdMeta);
    }
    if (data.containsKey('recorded_by_name')) {
      context.handle(
        _recordedByNameMeta,
        recordedByName.isAcceptableOrUnknown(
          data['recorded_by_name']!,
          _recordedByNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recordedByNameMeta);
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
        _createdByIdMeta,
        createdById.isAcceptableOrUnknown(
          data['created_by_id']!,
          _createdByIdMeta,
        ),
      );
    }
    if (data.containsKey('updated_by_id')) {
      context.handle(
        _updatedByIdMeta,
        updatedById.isAcceptableOrUnknown(
          data['updated_by_id']!,
          _updatedByIdMeta,
        ),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SleepEntryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SleepEntryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      homeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_id'],
      )!,
      childId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}child_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      shift: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shift'],
      )!,
      bedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bed_time'],
      ),
      settledTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}settled_time'],
      ),
      wakeTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}wake_time'],
      ),
      numberOfWakings: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number_of_wakings'],
      )!,
      quality: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quality'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      recordedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorded_by_id'],
      )!,
      recordedByName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorded_by_name'],
      )!,
      createdById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_id'],
      ),
      updatedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by_id'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $SleepEntriesTableTable createAlias(String alias) {
    return $SleepEntriesTableTable(attachedDatabase, alias);
  }
}

class SleepEntryRow extends DataClass implements Insertable<SleepEntryRow> {
  final String id;
  final String homeId;
  final String childId;
  final String date;
  final String shift;
  final String? bedTime;
  final String? settledTime;
  final String? wakeTime;
  final int numberOfWakings;
  final String quality;
  final String? notes;
  final String recordedById;
  final String recordedByName;
  final String? createdById;
  final String? updatedById;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSynced;
  const SleepEntryRow({
    required this.id,
    required this.homeId,
    required this.childId,
    required this.date,
    required this.shift,
    this.bedTime,
    this.settledTime,
    this.wakeTime,
    required this.numberOfWakings,
    required this.quality,
    this.notes,
    required this.recordedById,
    required this.recordedByName,
    this.createdById,
    this.updatedById,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['home_id'] = Variable<String>(homeId);
    map['child_id'] = Variable<String>(childId);
    map['date'] = Variable<String>(date);
    map['shift'] = Variable<String>(shift);
    if (!nullToAbsent || bedTime != null) {
      map['bed_time'] = Variable<String>(bedTime);
    }
    if (!nullToAbsent || settledTime != null) {
      map['settled_time'] = Variable<String>(settledTime);
    }
    if (!nullToAbsent || wakeTime != null) {
      map['wake_time'] = Variable<String>(wakeTime);
    }
    map['number_of_wakings'] = Variable<int>(numberOfWakings);
    map['quality'] = Variable<String>(quality);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['recorded_by_id'] = Variable<String>(recordedById);
    map['recorded_by_name'] = Variable<String>(recordedByName);
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || updatedById != null) {
      map['updated_by_id'] = Variable<String>(updatedById);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  SleepEntriesTableCompanion toCompanion(bool nullToAbsent) {
    return SleepEntriesTableCompanion(
      id: Value(id),
      homeId: Value(homeId),
      childId: Value(childId),
      date: Value(date),
      shift: Value(shift),
      bedTime: bedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(bedTime),
      settledTime: settledTime == null && nullToAbsent
          ? const Value.absent()
          : Value(settledTime),
      wakeTime: wakeTime == null && nullToAbsent
          ? const Value.absent()
          : Value(wakeTime),
      numberOfWakings: Value(numberOfWakings),
      quality: Value(quality),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      recordedById: Value(recordedById),
      recordedByName: Value(recordedByName),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      updatedById: updatedById == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedById),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory SleepEntryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SleepEntryRow(
      id: serializer.fromJson<String>(json['id']),
      homeId: serializer.fromJson<String>(json['homeId']),
      childId: serializer.fromJson<String>(json['childId']),
      date: serializer.fromJson<String>(json['date']),
      shift: serializer.fromJson<String>(json['shift']),
      bedTime: serializer.fromJson<String?>(json['bedTime']),
      settledTime: serializer.fromJson<String?>(json['settledTime']),
      wakeTime: serializer.fromJson<String?>(json['wakeTime']),
      numberOfWakings: serializer.fromJson<int>(json['numberOfWakings']),
      quality: serializer.fromJson<String>(json['quality']),
      notes: serializer.fromJson<String?>(json['notes']),
      recordedById: serializer.fromJson<String>(json['recordedById']),
      recordedByName: serializer.fromJson<String>(json['recordedByName']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      updatedById: serializer.fromJson<String?>(json['updatedById']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'homeId': serializer.toJson<String>(homeId),
      'childId': serializer.toJson<String>(childId),
      'date': serializer.toJson<String>(date),
      'shift': serializer.toJson<String>(shift),
      'bedTime': serializer.toJson<String?>(bedTime),
      'settledTime': serializer.toJson<String?>(settledTime),
      'wakeTime': serializer.toJson<String?>(wakeTime),
      'numberOfWakings': serializer.toJson<int>(numberOfWakings),
      'quality': serializer.toJson<String>(quality),
      'notes': serializer.toJson<String?>(notes),
      'recordedById': serializer.toJson<String>(recordedById),
      'recordedByName': serializer.toJson<String>(recordedByName),
      'createdById': serializer.toJson<String?>(createdById),
      'updatedById': serializer.toJson<String?>(updatedById),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  SleepEntryRow copyWith({
    String? id,
    String? homeId,
    String? childId,
    String? date,
    String? shift,
    Value<String?> bedTime = const Value.absent(),
    Value<String?> settledTime = const Value.absent(),
    Value<String?> wakeTime = const Value.absent(),
    int? numberOfWakings,
    String? quality,
    Value<String?> notes = const Value.absent(),
    String? recordedById,
    String? recordedByName,
    Value<String?> createdById = const Value.absent(),
    Value<String?> updatedById = const Value.absent(),
    Value<DateTime?> deletedAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
  }) => SleepEntryRow(
    id: id ?? this.id,
    homeId: homeId ?? this.homeId,
    childId: childId ?? this.childId,
    date: date ?? this.date,
    shift: shift ?? this.shift,
    bedTime: bedTime.present ? bedTime.value : this.bedTime,
    settledTime: settledTime.present ? settledTime.value : this.settledTime,
    wakeTime: wakeTime.present ? wakeTime.value : this.wakeTime,
    numberOfWakings: numberOfWakings ?? this.numberOfWakings,
    quality: quality ?? this.quality,
    notes: notes.present ? notes.value : this.notes,
    recordedById: recordedById ?? this.recordedById,
    recordedByName: recordedByName ?? this.recordedByName,
    createdById: createdById.present ? createdById.value : this.createdById,
    updatedById: updatedById.present ? updatedById.value : this.updatedById,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  SleepEntryRow copyWithCompanion(SleepEntriesTableCompanion data) {
    return SleepEntryRow(
      id: data.id.present ? data.id.value : this.id,
      homeId: data.homeId.present ? data.homeId.value : this.homeId,
      childId: data.childId.present ? data.childId.value : this.childId,
      date: data.date.present ? data.date.value : this.date,
      shift: data.shift.present ? data.shift.value : this.shift,
      bedTime: data.bedTime.present ? data.bedTime.value : this.bedTime,
      settledTime: data.settledTime.present
          ? data.settledTime.value
          : this.settledTime,
      wakeTime: data.wakeTime.present ? data.wakeTime.value : this.wakeTime,
      numberOfWakings: data.numberOfWakings.present
          ? data.numberOfWakings.value
          : this.numberOfWakings,
      quality: data.quality.present ? data.quality.value : this.quality,
      notes: data.notes.present ? data.notes.value : this.notes,
      recordedById: data.recordedById.present
          ? data.recordedById.value
          : this.recordedById,
      recordedByName: data.recordedByName.present
          ? data.recordedByName.value
          : this.recordedByName,
      createdById: data.createdById.present
          ? data.createdById.value
          : this.createdById,
      updatedById: data.updatedById.present
          ? data.updatedById.value
          : this.updatedById,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SleepEntryRow(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('date: $date, ')
          ..write('shift: $shift, ')
          ..write('bedTime: $bedTime, ')
          ..write('settledTime: $settledTime, ')
          ..write('wakeTime: $wakeTime, ')
          ..write('numberOfWakings: $numberOfWakings, ')
          ..write('quality: $quality, ')
          ..write('notes: $notes, ')
          ..write('recordedById: $recordedById, ')
          ..write('recordedByName: $recordedByName, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    homeId,
    childId,
    date,
    shift,
    bedTime,
    settledTime,
    wakeTime,
    numberOfWakings,
    quality,
    notes,
    recordedById,
    recordedByName,
    createdById,
    updatedById,
    deletedAt,
    createdAt,
    updatedAt,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SleepEntryRow &&
          other.id == this.id &&
          other.homeId == this.homeId &&
          other.childId == this.childId &&
          other.date == this.date &&
          other.shift == this.shift &&
          other.bedTime == this.bedTime &&
          other.settledTime == this.settledTime &&
          other.wakeTime == this.wakeTime &&
          other.numberOfWakings == this.numberOfWakings &&
          other.quality == this.quality &&
          other.notes == this.notes &&
          other.recordedById == this.recordedById &&
          other.recordedByName == this.recordedByName &&
          other.createdById == this.createdById &&
          other.updatedById == this.updatedById &&
          other.deletedAt == this.deletedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class SleepEntriesTableCompanion extends UpdateCompanion<SleepEntryRow> {
  final Value<String> id;
  final Value<String> homeId;
  final Value<String> childId;
  final Value<String> date;
  final Value<String> shift;
  final Value<String?> bedTime;
  final Value<String?> settledTime;
  final Value<String?> wakeTime;
  final Value<int> numberOfWakings;
  final Value<String> quality;
  final Value<String?> notes;
  final Value<String> recordedById;
  final Value<String> recordedByName;
  final Value<String?> createdById;
  final Value<String?> updatedById;
  final Value<DateTime?> deletedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const SleepEntriesTableCompanion({
    this.id = const Value.absent(),
    this.homeId = const Value.absent(),
    this.childId = const Value.absent(),
    this.date = const Value.absent(),
    this.shift = const Value.absent(),
    this.bedTime = const Value.absent(),
    this.settledTime = const Value.absent(),
    this.wakeTime = const Value.absent(),
    this.numberOfWakings = const Value.absent(),
    this.quality = const Value.absent(),
    this.notes = const Value.absent(),
    this.recordedById = const Value.absent(),
    this.recordedByName = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SleepEntriesTableCompanion.insert({
    required String id,
    required String homeId,
    required String childId,
    required String date,
    required String shift,
    this.bedTime = const Value.absent(),
    this.settledTime = const Value.absent(),
    this.wakeTime = const Value.absent(),
    this.numberOfWakings = const Value.absent(),
    required String quality,
    this.notes = const Value.absent(),
    required String recordedById,
    required String recordedByName,
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       homeId = Value(homeId),
       childId = Value(childId),
       date = Value(date),
       shift = Value(shift),
       quality = Value(quality),
       recordedById = Value(recordedById),
       recordedByName = Value(recordedByName),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SleepEntryRow> custom({
    Expression<String>? id,
    Expression<String>? homeId,
    Expression<String>? childId,
    Expression<String>? date,
    Expression<String>? shift,
    Expression<String>? bedTime,
    Expression<String>? settledTime,
    Expression<String>? wakeTime,
    Expression<int>? numberOfWakings,
    Expression<String>? quality,
    Expression<String>? notes,
    Expression<String>? recordedById,
    Expression<String>? recordedByName,
    Expression<String>? createdById,
    Expression<String>? updatedById,
    Expression<DateTime>? deletedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (homeId != null) 'home_id': homeId,
      if (childId != null) 'child_id': childId,
      if (date != null) 'date': date,
      if (shift != null) 'shift': shift,
      if (bedTime != null) 'bed_time': bedTime,
      if (settledTime != null) 'settled_time': settledTime,
      if (wakeTime != null) 'wake_time': wakeTime,
      if (numberOfWakings != null) 'number_of_wakings': numberOfWakings,
      if (quality != null) 'quality': quality,
      if (notes != null) 'notes': notes,
      if (recordedById != null) 'recorded_by_id': recordedById,
      if (recordedByName != null) 'recorded_by_name': recordedByName,
      if (createdById != null) 'created_by_id': createdById,
      if (updatedById != null) 'updated_by_id': updatedById,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SleepEntriesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? homeId,
    Value<String>? childId,
    Value<String>? date,
    Value<String>? shift,
    Value<String?>? bedTime,
    Value<String?>? settledTime,
    Value<String?>? wakeTime,
    Value<int>? numberOfWakings,
    Value<String>? quality,
    Value<String?>? notes,
    Value<String>? recordedById,
    Value<String>? recordedByName,
    Value<String?>? createdById,
    Value<String?>? updatedById,
    Value<DateTime?>? deletedAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return SleepEntriesTableCompanion(
      id: id ?? this.id,
      homeId: homeId ?? this.homeId,
      childId: childId ?? this.childId,
      date: date ?? this.date,
      shift: shift ?? this.shift,
      bedTime: bedTime ?? this.bedTime,
      settledTime: settledTime ?? this.settledTime,
      wakeTime: wakeTime ?? this.wakeTime,
      numberOfWakings: numberOfWakings ?? this.numberOfWakings,
      quality: quality ?? this.quality,
      notes: notes ?? this.notes,
      recordedById: recordedById ?? this.recordedById,
      recordedByName: recordedByName ?? this.recordedByName,
      createdById: createdById ?? this.createdById,
      updatedById: updatedById ?? this.updatedById,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (homeId.present) {
      map['home_id'] = Variable<String>(homeId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<String>(childId.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (shift.present) {
      map['shift'] = Variable<String>(shift.value);
    }
    if (bedTime.present) {
      map['bed_time'] = Variable<String>(bedTime.value);
    }
    if (settledTime.present) {
      map['settled_time'] = Variable<String>(settledTime.value);
    }
    if (wakeTime.present) {
      map['wake_time'] = Variable<String>(wakeTime.value);
    }
    if (numberOfWakings.present) {
      map['number_of_wakings'] = Variable<int>(numberOfWakings.value);
    }
    if (quality.present) {
      map['quality'] = Variable<String>(quality.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (recordedById.present) {
      map['recorded_by_id'] = Variable<String>(recordedById.value);
    }
    if (recordedByName.present) {
      map['recorded_by_name'] = Variable<String>(recordedByName.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (updatedById.present) {
      map['updated_by_id'] = Variable<String>(updatedById.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SleepEntriesTableCompanion(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('date: $date, ')
          ..write('shift: $shift, ')
          ..write('bedTime: $bedTime, ')
          ..write('settledTime: $settledTime, ')
          ..write('wakeTime: $wakeTime, ')
          ..write('numberOfWakings: $numberOfWakings, ')
          ..write('quality: $quality, ')
          ..write('notes: $notes, ')
          ..write('recordedById: $recordedById, ')
          ..write('recordedByName: $recordedByName, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FoodEntriesTableTable extends FoodEntriesTable
    with TableInfo<$FoodEntriesTableTable, FoodEntryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoodEntriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _homeIdMeta = const VerificationMeta('homeId');
  @override
  late final GeneratedColumn<String> homeId = GeneratedColumn<String>(
    'home_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _childIdMeta = const VerificationMeta(
    'childId',
  );
  @override
  late final GeneratedColumn<String> childId = GeneratedColumn<String>(
    'child_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shiftMeta = const VerificationMeta('shift');
  @override
  late final GeneratedColumn<String> shift = GeneratedColumn<String>(
    'shift',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mealTypeMeta = const VerificationMeta(
    'mealType',
  );
  @override
  late final GeneratedColumn<String> mealType = GeneratedColumn<String>(
    'meal_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _appetiteMeta = const VerificationMeta(
    'appetite',
  );
  @override
  late final GeneratedColumn<String> appetite = GeneratedColumn<String>(
    'appetite',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _concernsMeta = const VerificationMeta(
    'concerns',
  );
  @override
  late final GeneratedColumn<String> concerns = GeneratedColumn<String>(
    'concerns',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recordedByIdMeta = const VerificationMeta(
    'recordedById',
  );
  @override
  late final GeneratedColumn<String> recordedById = GeneratedColumn<String>(
    'recorded_by_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordedByNameMeta = const VerificationMeta(
    'recordedByName',
  );
  @override
  late final GeneratedColumn<String> recordedByName = GeneratedColumn<String>(
    'recorded_by_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdByIdMeta = const VerificationMeta(
    'createdById',
  );
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
    'created_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByIdMeta = const VerificationMeta(
    'updatedById',
  );
  @override
  late final GeneratedColumn<String> updatedById = GeneratedColumn<String>(
    'updated_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    homeId,
    childId,
    date,
    shift,
    mealType,
    description,
    appetite,
    concerns,
    notes,
    recordedById,
    recordedByName,
    createdById,
    updatedById,
    deletedAt,
    createdAt,
    updatedAt,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'food_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<FoodEntryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('home_id')) {
      context.handle(
        _homeIdMeta,
        homeId.isAcceptableOrUnknown(data['home_id']!, _homeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_homeIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(
        _childIdMeta,
        childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta),
      );
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('shift')) {
      context.handle(
        _shiftMeta,
        shift.isAcceptableOrUnknown(data['shift']!, _shiftMeta),
      );
    } else if (isInserting) {
      context.missing(_shiftMeta);
    }
    if (data.containsKey('meal_type')) {
      context.handle(
        _mealTypeMeta,
        mealType.isAcceptableOrUnknown(data['meal_type']!, _mealTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_mealTypeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('appetite')) {
      context.handle(
        _appetiteMeta,
        appetite.isAcceptableOrUnknown(data['appetite']!, _appetiteMeta),
      );
    } else if (isInserting) {
      context.missing(_appetiteMeta);
    }
    if (data.containsKey('concerns')) {
      context.handle(
        _concernsMeta,
        concerns.isAcceptableOrUnknown(data['concerns']!, _concernsMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('recorded_by_id')) {
      context.handle(
        _recordedByIdMeta,
        recordedById.isAcceptableOrUnknown(
          data['recorded_by_id']!,
          _recordedByIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recordedByIdMeta);
    }
    if (data.containsKey('recorded_by_name')) {
      context.handle(
        _recordedByNameMeta,
        recordedByName.isAcceptableOrUnknown(
          data['recorded_by_name']!,
          _recordedByNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recordedByNameMeta);
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
        _createdByIdMeta,
        createdById.isAcceptableOrUnknown(
          data['created_by_id']!,
          _createdByIdMeta,
        ),
      );
    }
    if (data.containsKey('updated_by_id')) {
      context.handle(
        _updatedByIdMeta,
        updatedById.isAcceptableOrUnknown(
          data['updated_by_id']!,
          _updatedByIdMeta,
        ),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FoodEntryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FoodEntryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      homeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_id'],
      )!,
      childId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}child_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      shift: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shift'],
      )!,
      mealType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meal_type'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      appetite: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}appetite'],
      )!,
      concerns: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}concerns'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      recordedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorded_by_id'],
      )!,
      recordedByName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorded_by_name'],
      )!,
      createdById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_id'],
      ),
      updatedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by_id'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $FoodEntriesTableTable createAlias(String alias) {
    return $FoodEntriesTableTable(attachedDatabase, alias);
  }
}

class FoodEntryRow extends DataClass implements Insertable<FoodEntryRow> {
  final String id;
  final String homeId;
  final String childId;
  final String date;
  final String shift;
  final String mealType;
  final String description;
  final String appetite;
  final String? concerns;
  final String? notes;
  final String recordedById;
  final String recordedByName;
  final String? createdById;
  final String? updatedById;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSynced;
  const FoodEntryRow({
    required this.id,
    required this.homeId,
    required this.childId,
    required this.date,
    required this.shift,
    required this.mealType,
    required this.description,
    required this.appetite,
    this.concerns,
    this.notes,
    required this.recordedById,
    required this.recordedByName,
    this.createdById,
    this.updatedById,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['home_id'] = Variable<String>(homeId);
    map['child_id'] = Variable<String>(childId);
    map['date'] = Variable<String>(date);
    map['shift'] = Variable<String>(shift);
    map['meal_type'] = Variable<String>(mealType);
    map['description'] = Variable<String>(description);
    map['appetite'] = Variable<String>(appetite);
    if (!nullToAbsent || concerns != null) {
      map['concerns'] = Variable<String>(concerns);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['recorded_by_id'] = Variable<String>(recordedById);
    map['recorded_by_name'] = Variable<String>(recordedByName);
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || updatedById != null) {
      map['updated_by_id'] = Variable<String>(updatedById);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  FoodEntriesTableCompanion toCompanion(bool nullToAbsent) {
    return FoodEntriesTableCompanion(
      id: Value(id),
      homeId: Value(homeId),
      childId: Value(childId),
      date: Value(date),
      shift: Value(shift),
      mealType: Value(mealType),
      description: Value(description),
      appetite: Value(appetite),
      concerns: concerns == null && nullToAbsent
          ? const Value.absent()
          : Value(concerns),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      recordedById: Value(recordedById),
      recordedByName: Value(recordedByName),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      updatedById: updatedById == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedById),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory FoodEntryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FoodEntryRow(
      id: serializer.fromJson<String>(json['id']),
      homeId: serializer.fromJson<String>(json['homeId']),
      childId: serializer.fromJson<String>(json['childId']),
      date: serializer.fromJson<String>(json['date']),
      shift: serializer.fromJson<String>(json['shift']),
      mealType: serializer.fromJson<String>(json['mealType']),
      description: serializer.fromJson<String>(json['description']),
      appetite: serializer.fromJson<String>(json['appetite']),
      concerns: serializer.fromJson<String?>(json['concerns']),
      notes: serializer.fromJson<String?>(json['notes']),
      recordedById: serializer.fromJson<String>(json['recordedById']),
      recordedByName: serializer.fromJson<String>(json['recordedByName']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      updatedById: serializer.fromJson<String?>(json['updatedById']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'homeId': serializer.toJson<String>(homeId),
      'childId': serializer.toJson<String>(childId),
      'date': serializer.toJson<String>(date),
      'shift': serializer.toJson<String>(shift),
      'mealType': serializer.toJson<String>(mealType),
      'description': serializer.toJson<String>(description),
      'appetite': serializer.toJson<String>(appetite),
      'concerns': serializer.toJson<String?>(concerns),
      'notes': serializer.toJson<String?>(notes),
      'recordedById': serializer.toJson<String>(recordedById),
      'recordedByName': serializer.toJson<String>(recordedByName),
      'createdById': serializer.toJson<String?>(createdById),
      'updatedById': serializer.toJson<String?>(updatedById),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  FoodEntryRow copyWith({
    String? id,
    String? homeId,
    String? childId,
    String? date,
    String? shift,
    String? mealType,
    String? description,
    String? appetite,
    Value<String?> concerns = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    String? recordedById,
    String? recordedByName,
    Value<String?> createdById = const Value.absent(),
    Value<String?> updatedById = const Value.absent(),
    Value<DateTime?> deletedAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
  }) => FoodEntryRow(
    id: id ?? this.id,
    homeId: homeId ?? this.homeId,
    childId: childId ?? this.childId,
    date: date ?? this.date,
    shift: shift ?? this.shift,
    mealType: mealType ?? this.mealType,
    description: description ?? this.description,
    appetite: appetite ?? this.appetite,
    concerns: concerns.present ? concerns.value : this.concerns,
    notes: notes.present ? notes.value : this.notes,
    recordedById: recordedById ?? this.recordedById,
    recordedByName: recordedByName ?? this.recordedByName,
    createdById: createdById.present ? createdById.value : this.createdById,
    updatedById: updatedById.present ? updatedById.value : this.updatedById,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  FoodEntryRow copyWithCompanion(FoodEntriesTableCompanion data) {
    return FoodEntryRow(
      id: data.id.present ? data.id.value : this.id,
      homeId: data.homeId.present ? data.homeId.value : this.homeId,
      childId: data.childId.present ? data.childId.value : this.childId,
      date: data.date.present ? data.date.value : this.date,
      shift: data.shift.present ? data.shift.value : this.shift,
      mealType: data.mealType.present ? data.mealType.value : this.mealType,
      description: data.description.present
          ? data.description.value
          : this.description,
      appetite: data.appetite.present ? data.appetite.value : this.appetite,
      concerns: data.concerns.present ? data.concerns.value : this.concerns,
      notes: data.notes.present ? data.notes.value : this.notes,
      recordedById: data.recordedById.present
          ? data.recordedById.value
          : this.recordedById,
      recordedByName: data.recordedByName.present
          ? data.recordedByName.value
          : this.recordedByName,
      createdById: data.createdById.present
          ? data.createdById.value
          : this.createdById,
      updatedById: data.updatedById.present
          ? data.updatedById.value
          : this.updatedById,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FoodEntryRow(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('date: $date, ')
          ..write('shift: $shift, ')
          ..write('mealType: $mealType, ')
          ..write('description: $description, ')
          ..write('appetite: $appetite, ')
          ..write('concerns: $concerns, ')
          ..write('notes: $notes, ')
          ..write('recordedById: $recordedById, ')
          ..write('recordedByName: $recordedByName, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    homeId,
    childId,
    date,
    shift,
    mealType,
    description,
    appetite,
    concerns,
    notes,
    recordedById,
    recordedByName,
    createdById,
    updatedById,
    deletedAt,
    createdAt,
    updatedAt,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FoodEntryRow &&
          other.id == this.id &&
          other.homeId == this.homeId &&
          other.childId == this.childId &&
          other.date == this.date &&
          other.shift == this.shift &&
          other.mealType == this.mealType &&
          other.description == this.description &&
          other.appetite == this.appetite &&
          other.concerns == this.concerns &&
          other.notes == this.notes &&
          other.recordedById == this.recordedById &&
          other.recordedByName == this.recordedByName &&
          other.createdById == this.createdById &&
          other.updatedById == this.updatedById &&
          other.deletedAt == this.deletedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class FoodEntriesTableCompanion extends UpdateCompanion<FoodEntryRow> {
  final Value<String> id;
  final Value<String> homeId;
  final Value<String> childId;
  final Value<String> date;
  final Value<String> shift;
  final Value<String> mealType;
  final Value<String> description;
  final Value<String> appetite;
  final Value<String?> concerns;
  final Value<String?> notes;
  final Value<String> recordedById;
  final Value<String> recordedByName;
  final Value<String?> createdById;
  final Value<String?> updatedById;
  final Value<DateTime?> deletedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const FoodEntriesTableCompanion({
    this.id = const Value.absent(),
    this.homeId = const Value.absent(),
    this.childId = const Value.absent(),
    this.date = const Value.absent(),
    this.shift = const Value.absent(),
    this.mealType = const Value.absent(),
    this.description = const Value.absent(),
    this.appetite = const Value.absent(),
    this.concerns = const Value.absent(),
    this.notes = const Value.absent(),
    this.recordedById = const Value.absent(),
    this.recordedByName = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FoodEntriesTableCompanion.insert({
    required String id,
    required String homeId,
    required String childId,
    required String date,
    required String shift,
    required String mealType,
    required String description,
    required String appetite,
    this.concerns = const Value.absent(),
    this.notes = const Value.absent(),
    required String recordedById,
    required String recordedByName,
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       homeId = Value(homeId),
       childId = Value(childId),
       date = Value(date),
       shift = Value(shift),
       mealType = Value(mealType),
       description = Value(description),
       appetite = Value(appetite),
       recordedById = Value(recordedById),
       recordedByName = Value(recordedByName),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<FoodEntryRow> custom({
    Expression<String>? id,
    Expression<String>? homeId,
    Expression<String>? childId,
    Expression<String>? date,
    Expression<String>? shift,
    Expression<String>? mealType,
    Expression<String>? description,
    Expression<String>? appetite,
    Expression<String>? concerns,
    Expression<String>? notes,
    Expression<String>? recordedById,
    Expression<String>? recordedByName,
    Expression<String>? createdById,
    Expression<String>? updatedById,
    Expression<DateTime>? deletedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (homeId != null) 'home_id': homeId,
      if (childId != null) 'child_id': childId,
      if (date != null) 'date': date,
      if (shift != null) 'shift': shift,
      if (mealType != null) 'meal_type': mealType,
      if (description != null) 'description': description,
      if (appetite != null) 'appetite': appetite,
      if (concerns != null) 'concerns': concerns,
      if (notes != null) 'notes': notes,
      if (recordedById != null) 'recorded_by_id': recordedById,
      if (recordedByName != null) 'recorded_by_name': recordedByName,
      if (createdById != null) 'created_by_id': createdById,
      if (updatedById != null) 'updated_by_id': updatedById,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FoodEntriesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? homeId,
    Value<String>? childId,
    Value<String>? date,
    Value<String>? shift,
    Value<String>? mealType,
    Value<String>? description,
    Value<String>? appetite,
    Value<String?>? concerns,
    Value<String?>? notes,
    Value<String>? recordedById,
    Value<String>? recordedByName,
    Value<String?>? createdById,
    Value<String?>? updatedById,
    Value<DateTime?>? deletedAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return FoodEntriesTableCompanion(
      id: id ?? this.id,
      homeId: homeId ?? this.homeId,
      childId: childId ?? this.childId,
      date: date ?? this.date,
      shift: shift ?? this.shift,
      mealType: mealType ?? this.mealType,
      description: description ?? this.description,
      appetite: appetite ?? this.appetite,
      concerns: concerns ?? this.concerns,
      notes: notes ?? this.notes,
      recordedById: recordedById ?? this.recordedById,
      recordedByName: recordedByName ?? this.recordedByName,
      createdById: createdById ?? this.createdById,
      updatedById: updatedById ?? this.updatedById,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (homeId.present) {
      map['home_id'] = Variable<String>(homeId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<String>(childId.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (shift.present) {
      map['shift'] = Variable<String>(shift.value);
    }
    if (mealType.present) {
      map['meal_type'] = Variable<String>(mealType.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (appetite.present) {
      map['appetite'] = Variable<String>(appetite.value);
    }
    if (concerns.present) {
      map['concerns'] = Variable<String>(concerns.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (recordedById.present) {
      map['recorded_by_id'] = Variable<String>(recordedById.value);
    }
    if (recordedByName.present) {
      map['recorded_by_name'] = Variable<String>(recordedByName.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (updatedById.present) {
      map['updated_by_id'] = Variable<String>(updatedById.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodEntriesTableCompanion(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('date: $date, ')
          ..write('shift: $shift, ')
          ..write('mealType: $mealType, ')
          ..write('description: $description, ')
          ..write('appetite: $appetite, ')
          ..write('concerns: $concerns, ')
          ..write('notes: $notes, ')
          ..write('recordedById: $recordedById, ')
          ..write('recordedByName: $recordedByName, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ActivityEntriesTableTable extends ActivityEntriesTable
    with TableInfo<$ActivityEntriesTableTable, ActivityEntryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivityEntriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _homeIdMeta = const VerificationMeta('homeId');
  @override
  late final GeneratedColumn<String> homeId = GeneratedColumn<String>(
    'home_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _childIdMeta = const VerificationMeta(
    'childId',
  );
  @override
  late final GeneratedColumn<String> childId = GeneratedColumn<String>(
    'child_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shiftMeta = const VerificationMeta('shift');
  @override
  late final GeneratedColumn<String> shift = GeneratedColumn<String>(
    'shift',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationMinutesMeta = const VerificationMeta(
    'durationMinutes',
  );
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
    'duration_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rewardEarnedMeta = const VerificationMeta(
    'rewardEarned',
  );
  @override
  late final GeneratedColumn<bool> rewardEarned = GeneratedColumn<bool>(
    'reward_earned',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("reward_earned" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _achievementMeta = const VerificationMeta(
    'achievement',
  );
  @override
  late final GeneratedColumn<String> achievement = GeneratedColumn<String>(
    'achievement',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recordedByIdMeta = const VerificationMeta(
    'recordedById',
  );
  @override
  late final GeneratedColumn<String> recordedById = GeneratedColumn<String>(
    'recorded_by_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordedByNameMeta = const VerificationMeta(
    'recordedByName',
  );
  @override
  late final GeneratedColumn<String> recordedByName = GeneratedColumn<String>(
    'recorded_by_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdByIdMeta = const VerificationMeta(
    'createdById',
  );
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
    'created_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByIdMeta = const VerificationMeta(
    'updatedById',
  );
  @override
  late final GeneratedColumn<String> updatedById = GeneratedColumn<String>(
    'updated_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
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
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activity_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActivityEntryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('home_id')) {
      context.handle(
        _homeIdMeta,
        homeId.isAcceptableOrUnknown(data['home_id']!, _homeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_homeIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(
        _childIdMeta,
        childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta),
      );
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('shift')) {
      context.handle(
        _shiftMeta,
        shift.isAcceptableOrUnknown(data['shift']!, _shiftMeta),
      );
    } else if (isInserting) {
      context.missing(_shiftMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
        _durationMinutesMeta,
        durationMinutes.isAcceptableOrUnknown(
          data['duration_minutes']!,
          _durationMinutesMeta,
        ),
      );
    }
    if (data.containsKey('reward_earned')) {
      context.handle(
        _rewardEarnedMeta,
        rewardEarned.isAcceptableOrUnknown(
          data['reward_earned']!,
          _rewardEarnedMeta,
        ),
      );
    }
    if (data.containsKey('achievement')) {
      context.handle(
        _achievementMeta,
        achievement.isAcceptableOrUnknown(
          data['achievement']!,
          _achievementMeta,
        ),
      );
    }
    if (data.containsKey('recorded_by_id')) {
      context.handle(
        _recordedByIdMeta,
        recordedById.isAcceptableOrUnknown(
          data['recorded_by_id']!,
          _recordedByIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recordedByIdMeta);
    }
    if (data.containsKey('recorded_by_name')) {
      context.handle(
        _recordedByNameMeta,
        recordedByName.isAcceptableOrUnknown(
          data['recorded_by_name']!,
          _recordedByNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recordedByNameMeta);
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
        _createdByIdMeta,
        createdById.isAcceptableOrUnknown(
          data['created_by_id']!,
          _createdByIdMeta,
        ),
      );
    }
    if (data.containsKey('updated_by_id')) {
      context.handle(
        _updatedByIdMeta,
        updatedById.isAcceptableOrUnknown(
          data['updated_by_id']!,
          _updatedByIdMeta,
        ),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivityEntryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActivityEntryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      homeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_id'],
      )!,
      childId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}child_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      shift: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shift'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      durationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_minutes'],
      ),
      rewardEarned: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}reward_earned'],
      )!,
      achievement: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}achievement'],
      ),
      recordedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorded_by_id'],
      )!,
      recordedByName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorded_by_name'],
      )!,
      createdById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_id'],
      ),
      updatedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by_id'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $ActivityEntriesTableTable createAlias(String alias) {
    return $ActivityEntriesTableTable(attachedDatabase, alias);
  }
}

class ActivityEntryRow extends DataClass
    implements Insertable<ActivityEntryRow> {
  final String id;
  final String homeId;
  final String childId;
  final String date;
  final String shift;
  final String category;
  final String title;
  final String? description;
  final int? durationMinutes;
  final bool rewardEarned;
  final String? achievement;
  final String recordedById;
  final String recordedByName;
  final String? createdById;
  final String? updatedById;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSynced;
  const ActivityEntryRow({
    required this.id,
    required this.homeId,
    required this.childId,
    required this.date,
    required this.shift,
    required this.category,
    required this.title,
    this.description,
    this.durationMinutes,
    required this.rewardEarned,
    this.achievement,
    required this.recordedById,
    required this.recordedByName,
    this.createdById,
    this.updatedById,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['home_id'] = Variable<String>(homeId);
    map['child_id'] = Variable<String>(childId);
    map['date'] = Variable<String>(date);
    map['shift'] = Variable<String>(shift);
    map['category'] = Variable<String>(category);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || durationMinutes != null) {
      map['duration_minutes'] = Variable<int>(durationMinutes);
    }
    map['reward_earned'] = Variable<bool>(rewardEarned);
    if (!nullToAbsent || achievement != null) {
      map['achievement'] = Variable<String>(achievement);
    }
    map['recorded_by_id'] = Variable<String>(recordedById);
    map['recorded_by_name'] = Variable<String>(recordedByName);
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || updatedById != null) {
      map['updated_by_id'] = Variable<String>(updatedById);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  ActivityEntriesTableCompanion toCompanion(bool nullToAbsent) {
    return ActivityEntriesTableCompanion(
      id: Value(id),
      homeId: Value(homeId),
      childId: Value(childId),
      date: Value(date),
      shift: Value(shift),
      category: Value(category),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      durationMinutes: durationMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(durationMinutes),
      rewardEarned: Value(rewardEarned),
      achievement: achievement == null && nullToAbsent
          ? const Value.absent()
          : Value(achievement),
      recordedById: Value(recordedById),
      recordedByName: Value(recordedByName),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      updatedById: updatedById == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedById),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory ActivityEntryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivityEntryRow(
      id: serializer.fromJson<String>(json['id']),
      homeId: serializer.fromJson<String>(json['homeId']),
      childId: serializer.fromJson<String>(json['childId']),
      date: serializer.fromJson<String>(json['date']),
      shift: serializer.fromJson<String>(json['shift']),
      category: serializer.fromJson<String>(json['category']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      durationMinutes: serializer.fromJson<int?>(json['durationMinutes']),
      rewardEarned: serializer.fromJson<bool>(json['rewardEarned']),
      achievement: serializer.fromJson<String?>(json['achievement']),
      recordedById: serializer.fromJson<String>(json['recordedById']),
      recordedByName: serializer.fromJson<String>(json['recordedByName']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      updatedById: serializer.fromJson<String?>(json['updatedById']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'homeId': serializer.toJson<String>(homeId),
      'childId': serializer.toJson<String>(childId),
      'date': serializer.toJson<String>(date),
      'shift': serializer.toJson<String>(shift),
      'category': serializer.toJson<String>(category),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'durationMinutes': serializer.toJson<int?>(durationMinutes),
      'rewardEarned': serializer.toJson<bool>(rewardEarned),
      'achievement': serializer.toJson<String?>(achievement),
      'recordedById': serializer.toJson<String>(recordedById),
      'recordedByName': serializer.toJson<String>(recordedByName),
      'createdById': serializer.toJson<String?>(createdById),
      'updatedById': serializer.toJson<String?>(updatedById),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  ActivityEntryRow copyWith({
    String? id,
    String? homeId,
    String? childId,
    String? date,
    String? shift,
    String? category,
    String? title,
    Value<String?> description = const Value.absent(),
    Value<int?> durationMinutes = const Value.absent(),
    bool? rewardEarned,
    Value<String?> achievement = const Value.absent(),
    String? recordedById,
    String? recordedByName,
    Value<String?> createdById = const Value.absent(),
    Value<String?> updatedById = const Value.absent(),
    Value<DateTime?> deletedAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
  }) => ActivityEntryRow(
    id: id ?? this.id,
    homeId: homeId ?? this.homeId,
    childId: childId ?? this.childId,
    date: date ?? this.date,
    shift: shift ?? this.shift,
    category: category ?? this.category,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    durationMinutes: durationMinutes.present
        ? durationMinutes.value
        : this.durationMinutes,
    rewardEarned: rewardEarned ?? this.rewardEarned,
    achievement: achievement.present ? achievement.value : this.achievement,
    recordedById: recordedById ?? this.recordedById,
    recordedByName: recordedByName ?? this.recordedByName,
    createdById: createdById.present ? createdById.value : this.createdById,
    updatedById: updatedById.present ? updatedById.value : this.updatedById,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  ActivityEntryRow copyWithCompanion(ActivityEntriesTableCompanion data) {
    return ActivityEntryRow(
      id: data.id.present ? data.id.value : this.id,
      homeId: data.homeId.present ? data.homeId.value : this.homeId,
      childId: data.childId.present ? data.childId.value : this.childId,
      date: data.date.present ? data.date.value : this.date,
      shift: data.shift.present ? data.shift.value : this.shift,
      category: data.category.present ? data.category.value : this.category,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      rewardEarned: data.rewardEarned.present
          ? data.rewardEarned.value
          : this.rewardEarned,
      achievement: data.achievement.present
          ? data.achievement.value
          : this.achievement,
      recordedById: data.recordedById.present
          ? data.recordedById.value
          : this.recordedById,
      recordedByName: data.recordedByName.present
          ? data.recordedByName.value
          : this.recordedByName,
      createdById: data.createdById.present
          ? data.createdById.value
          : this.createdById,
      updatedById: data.updatedById.present
          ? data.updatedById.value
          : this.updatedById,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActivityEntryRow(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('date: $date, ')
          ..write('shift: $shift, ')
          ..write('category: $category, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('rewardEarned: $rewardEarned, ')
          ..write('achievement: $achievement, ')
          ..write('recordedById: $recordedById, ')
          ..write('recordedByName: $recordedByName, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityEntryRow &&
          other.id == this.id &&
          other.homeId == this.homeId &&
          other.childId == this.childId &&
          other.date == this.date &&
          other.shift == this.shift &&
          other.category == this.category &&
          other.title == this.title &&
          other.description == this.description &&
          other.durationMinutes == this.durationMinutes &&
          other.rewardEarned == this.rewardEarned &&
          other.achievement == this.achievement &&
          other.recordedById == this.recordedById &&
          other.recordedByName == this.recordedByName &&
          other.createdById == this.createdById &&
          other.updatedById == this.updatedById &&
          other.deletedAt == this.deletedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class ActivityEntriesTableCompanion extends UpdateCompanion<ActivityEntryRow> {
  final Value<String> id;
  final Value<String> homeId;
  final Value<String> childId;
  final Value<String> date;
  final Value<String> shift;
  final Value<String> category;
  final Value<String> title;
  final Value<String?> description;
  final Value<int?> durationMinutes;
  final Value<bool> rewardEarned;
  final Value<String?> achievement;
  final Value<String> recordedById;
  final Value<String> recordedByName;
  final Value<String?> createdById;
  final Value<String?> updatedById;
  final Value<DateTime?> deletedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const ActivityEntriesTableCompanion({
    this.id = const Value.absent(),
    this.homeId = const Value.absent(),
    this.childId = const Value.absent(),
    this.date = const Value.absent(),
    this.shift = const Value.absent(),
    this.category = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.rewardEarned = const Value.absent(),
    this.achievement = const Value.absent(),
    this.recordedById = const Value.absent(),
    this.recordedByName = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ActivityEntriesTableCompanion.insert({
    required String id,
    required String homeId,
    required String childId,
    required String date,
    required String shift,
    required String category,
    required String title,
    this.description = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.rewardEarned = const Value.absent(),
    this.achievement = const Value.absent(),
    required String recordedById,
    required String recordedByName,
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       homeId = Value(homeId),
       childId = Value(childId),
       date = Value(date),
       shift = Value(shift),
       category = Value(category),
       title = Value(title),
       recordedById = Value(recordedById),
       recordedByName = Value(recordedByName),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ActivityEntryRow> custom({
    Expression<String>? id,
    Expression<String>? homeId,
    Expression<String>? childId,
    Expression<String>? date,
    Expression<String>? shift,
    Expression<String>? category,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? durationMinutes,
    Expression<bool>? rewardEarned,
    Expression<String>? achievement,
    Expression<String>? recordedById,
    Expression<String>? recordedByName,
    Expression<String>? createdById,
    Expression<String>? updatedById,
    Expression<DateTime>? deletedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (homeId != null) 'home_id': homeId,
      if (childId != null) 'child_id': childId,
      if (date != null) 'date': date,
      if (shift != null) 'shift': shift,
      if (category != null) 'category': category,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (rewardEarned != null) 'reward_earned': rewardEarned,
      if (achievement != null) 'achievement': achievement,
      if (recordedById != null) 'recorded_by_id': recordedById,
      if (recordedByName != null) 'recorded_by_name': recordedByName,
      if (createdById != null) 'created_by_id': createdById,
      if (updatedById != null) 'updated_by_id': updatedById,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ActivityEntriesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? homeId,
    Value<String>? childId,
    Value<String>? date,
    Value<String>? shift,
    Value<String>? category,
    Value<String>? title,
    Value<String?>? description,
    Value<int?>? durationMinutes,
    Value<bool>? rewardEarned,
    Value<String?>? achievement,
    Value<String>? recordedById,
    Value<String>? recordedByName,
    Value<String?>? createdById,
    Value<String?>? updatedById,
    Value<DateTime?>? deletedAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return ActivityEntriesTableCompanion(
      id: id ?? this.id,
      homeId: homeId ?? this.homeId,
      childId: childId ?? this.childId,
      date: date ?? this.date,
      shift: shift ?? this.shift,
      category: category ?? this.category,
      title: title ?? this.title,
      description: description ?? this.description,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      rewardEarned: rewardEarned ?? this.rewardEarned,
      achievement: achievement ?? this.achievement,
      recordedById: recordedById ?? this.recordedById,
      recordedByName: recordedByName ?? this.recordedByName,
      createdById: createdById ?? this.createdById,
      updatedById: updatedById ?? this.updatedById,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (homeId.present) {
      map['home_id'] = Variable<String>(homeId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<String>(childId.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (shift.present) {
      map['shift'] = Variable<String>(shift.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (rewardEarned.present) {
      map['reward_earned'] = Variable<bool>(rewardEarned.value);
    }
    if (achievement.present) {
      map['achievement'] = Variable<String>(achievement.value);
    }
    if (recordedById.present) {
      map['recorded_by_id'] = Variable<String>(recordedById.value);
    }
    if (recordedByName.present) {
      map['recorded_by_name'] = Variable<String>(recordedByName.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (updatedById.present) {
      map['updated_by_id'] = Variable<String>(updatedById.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivityEntriesTableCompanion(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('date: $date, ')
          ..write('shift: $shift, ')
          ..write('category: $category, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('rewardEarned: $rewardEarned, ')
          ..write('achievement: $achievement, ')
          ..write('recordedById: $recordedById, ')
          ..write('recordedByName: $recordedByName, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SmartStepsTableTable extends SmartStepsTable
    with TableInfo<$SmartStepsTableTable, SmartStepRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SmartStepsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _homeIdMeta = const VerificationMeta('homeId');
  @override
  late final GeneratedColumn<String> homeId = GeneratedColumn<String>(
    'home_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _childIdMeta = const VerificationMeta(
    'childId',
  );
  @override
  late final GeneratedColumn<String> childId = GeneratedColumn<String>(
    'child_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetDateMeta = const VerificationMeta(
    'targetDate',
  );
  @override
  late final GeneratedColumn<String> targetDate = GeneratedColumn<String>(
    'target_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _achievedDateMeta = const VerificationMeta(
    'achievedDate',
  );
  @override
  late final GeneratedColumn<String> achievedDate = GeneratedColumn<String>(
    'achieved_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdByIdMeta = const VerificationMeta(
    'createdById',
  );
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
    'created_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByIdMeta = const VerificationMeta(
    'updatedById',
  );
  @override
  late final GeneratedColumn<String> updatedById = GeneratedColumn<String>(
    'updated_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    homeId,
    childId,
    category,
    title,
    description,
    targetDate,
    status,
    achievedDate,
    createdById,
    updatedById,
    deletedAt,
    createdAt,
    updatedAt,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'smart_steps';
  @override
  VerificationContext validateIntegrity(
    Insertable<SmartStepRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('home_id')) {
      context.handle(
        _homeIdMeta,
        homeId.isAcceptableOrUnknown(data['home_id']!, _homeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_homeIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(
        _childIdMeta,
        childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta),
      );
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('target_date')) {
      context.handle(
        _targetDateMeta,
        targetDate.isAcceptableOrUnknown(data['target_date']!, _targetDateMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('achieved_date')) {
      context.handle(
        _achievedDateMeta,
        achievedDate.isAcceptableOrUnknown(
          data['achieved_date']!,
          _achievedDateMeta,
        ),
      );
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
        _createdByIdMeta,
        createdById.isAcceptableOrUnknown(
          data['created_by_id']!,
          _createdByIdMeta,
        ),
      );
    }
    if (data.containsKey('updated_by_id')) {
      context.handle(
        _updatedByIdMeta,
        updatedById.isAcceptableOrUnknown(
          data['updated_by_id']!,
          _updatedByIdMeta,
        ),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SmartStepRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SmartStepRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      homeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_id'],
      )!,
      childId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}child_id'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      targetDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_date'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      achievedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}achieved_date'],
      ),
      createdById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_id'],
      ),
      updatedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by_id'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $SmartStepsTableTable createAlias(String alias) {
    return $SmartStepsTableTable(attachedDatabase, alias);
  }
}

class SmartStepRow extends DataClass implements Insertable<SmartStepRow> {
  final String id;
  final String homeId;
  final String childId;
  final String category;
  final String title;
  final String? description;
  final String? targetDate;
  final String status;
  final String? achievedDate;
  final String? createdById;
  final String? updatedById;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSynced;
  const SmartStepRow({
    required this.id,
    required this.homeId,
    required this.childId,
    required this.category,
    required this.title,
    this.description,
    this.targetDate,
    required this.status,
    this.achievedDate,
    this.createdById,
    this.updatedById,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['home_id'] = Variable<String>(homeId);
    map['child_id'] = Variable<String>(childId);
    map['category'] = Variable<String>(category);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || targetDate != null) {
      map['target_date'] = Variable<String>(targetDate);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || achievedDate != null) {
      map['achieved_date'] = Variable<String>(achievedDate);
    }
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || updatedById != null) {
      map['updated_by_id'] = Variable<String>(updatedById);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  SmartStepsTableCompanion toCompanion(bool nullToAbsent) {
    return SmartStepsTableCompanion(
      id: Value(id),
      homeId: Value(homeId),
      childId: Value(childId),
      category: Value(category),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      targetDate: targetDate == null && nullToAbsent
          ? const Value.absent()
          : Value(targetDate),
      status: Value(status),
      achievedDate: achievedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(achievedDate),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      updatedById: updatedById == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedById),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory SmartStepRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SmartStepRow(
      id: serializer.fromJson<String>(json['id']),
      homeId: serializer.fromJson<String>(json['homeId']),
      childId: serializer.fromJson<String>(json['childId']),
      category: serializer.fromJson<String>(json['category']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      targetDate: serializer.fromJson<String?>(json['targetDate']),
      status: serializer.fromJson<String>(json['status']),
      achievedDate: serializer.fromJson<String?>(json['achievedDate']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      updatedById: serializer.fromJson<String?>(json['updatedById']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'homeId': serializer.toJson<String>(homeId),
      'childId': serializer.toJson<String>(childId),
      'category': serializer.toJson<String>(category),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'targetDate': serializer.toJson<String?>(targetDate),
      'status': serializer.toJson<String>(status),
      'achievedDate': serializer.toJson<String?>(achievedDate),
      'createdById': serializer.toJson<String?>(createdById),
      'updatedById': serializer.toJson<String?>(updatedById),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  SmartStepRow copyWith({
    String? id,
    String? homeId,
    String? childId,
    String? category,
    String? title,
    Value<String?> description = const Value.absent(),
    Value<String?> targetDate = const Value.absent(),
    String? status,
    Value<String?> achievedDate = const Value.absent(),
    Value<String?> createdById = const Value.absent(),
    Value<String?> updatedById = const Value.absent(),
    Value<DateTime?> deletedAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
  }) => SmartStepRow(
    id: id ?? this.id,
    homeId: homeId ?? this.homeId,
    childId: childId ?? this.childId,
    category: category ?? this.category,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    targetDate: targetDate.present ? targetDate.value : this.targetDate,
    status: status ?? this.status,
    achievedDate: achievedDate.present ? achievedDate.value : this.achievedDate,
    createdById: createdById.present ? createdById.value : this.createdById,
    updatedById: updatedById.present ? updatedById.value : this.updatedById,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  SmartStepRow copyWithCompanion(SmartStepsTableCompanion data) {
    return SmartStepRow(
      id: data.id.present ? data.id.value : this.id,
      homeId: data.homeId.present ? data.homeId.value : this.homeId,
      childId: data.childId.present ? data.childId.value : this.childId,
      category: data.category.present ? data.category.value : this.category,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      targetDate: data.targetDate.present
          ? data.targetDate.value
          : this.targetDate,
      status: data.status.present ? data.status.value : this.status,
      achievedDate: data.achievedDate.present
          ? data.achievedDate.value
          : this.achievedDate,
      createdById: data.createdById.present
          ? data.createdById.value
          : this.createdById,
      updatedById: data.updatedById.present
          ? data.updatedById.value
          : this.updatedById,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SmartStepRow(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('category: $category, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('targetDate: $targetDate, ')
          ..write('status: $status, ')
          ..write('achievedDate: $achievedDate, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    homeId,
    childId,
    category,
    title,
    description,
    targetDate,
    status,
    achievedDate,
    createdById,
    updatedById,
    deletedAt,
    createdAt,
    updatedAt,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SmartStepRow &&
          other.id == this.id &&
          other.homeId == this.homeId &&
          other.childId == this.childId &&
          other.category == this.category &&
          other.title == this.title &&
          other.description == this.description &&
          other.targetDate == this.targetDate &&
          other.status == this.status &&
          other.achievedDate == this.achievedDate &&
          other.createdById == this.createdById &&
          other.updatedById == this.updatedById &&
          other.deletedAt == this.deletedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class SmartStepsTableCompanion extends UpdateCompanion<SmartStepRow> {
  final Value<String> id;
  final Value<String> homeId;
  final Value<String> childId;
  final Value<String> category;
  final Value<String> title;
  final Value<String?> description;
  final Value<String?> targetDate;
  final Value<String> status;
  final Value<String?> achievedDate;
  final Value<String?> createdById;
  final Value<String?> updatedById;
  final Value<DateTime?> deletedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const SmartStepsTableCompanion({
    this.id = const Value.absent(),
    this.homeId = const Value.absent(),
    this.childId = const Value.absent(),
    this.category = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.targetDate = const Value.absent(),
    this.status = const Value.absent(),
    this.achievedDate = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SmartStepsTableCompanion.insert({
    required String id,
    required String homeId,
    required String childId,
    required String category,
    required String title,
    this.description = const Value.absent(),
    this.targetDate = const Value.absent(),
    required String status,
    this.achievedDate = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       homeId = Value(homeId),
       childId = Value(childId),
       category = Value(category),
       title = Value(title),
       status = Value(status),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SmartStepRow> custom({
    Expression<String>? id,
    Expression<String>? homeId,
    Expression<String>? childId,
    Expression<String>? category,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? targetDate,
    Expression<String>? status,
    Expression<String>? achievedDate,
    Expression<String>? createdById,
    Expression<String>? updatedById,
    Expression<DateTime>? deletedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (homeId != null) 'home_id': homeId,
      if (childId != null) 'child_id': childId,
      if (category != null) 'category': category,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (targetDate != null) 'target_date': targetDate,
      if (status != null) 'status': status,
      if (achievedDate != null) 'achieved_date': achievedDate,
      if (createdById != null) 'created_by_id': createdById,
      if (updatedById != null) 'updated_by_id': updatedById,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SmartStepsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? homeId,
    Value<String>? childId,
    Value<String>? category,
    Value<String>? title,
    Value<String?>? description,
    Value<String?>? targetDate,
    Value<String>? status,
    Value<String?>? achievedDate,
    Value<String?>? createdById,
    Value<String?>? updatedById,
    Value<DateTime?>? deletedAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return SmartStepsTableCompanion(
      id: id ?? this.id,
      homeId: homeId ?? this.homeId,
      childId: childId ?? this.childId,
      category: category ?? this.category,
      title: title ?? this.title,
      description: description ?? this.description,
      targetDate: targetDate ?? this.targetDate,
      status: status ?? this.status,
      achievedDate: achievedDate ?? this.achievedDate,
      createdById: createdById ?? this.createdById,
      updatedById: updatedById ?? this.updatedById,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (homeId.present) {
      map['home_id'] = Variable<String>(homeId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<String>(childId.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (targetDate.present) {
      map['target_date'] = Variable<String>(targetDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (achievedDate.present) {
      map['achieved_date'] = Variable<String>(achievedDate.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (updatedById.present) {
      map['updated_by_id'] = Variable<String>(updatedById.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SmartStepsTableCompanion(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('category: $category, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('targetDate: $targetDate, ')
          ..write('status: $status, ')
          ..write('achievedDate: $achievedDate, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StepProgressTableTable extends StepProgressTable
    with TableInfo<$StepProgressTableTable, StepProgressRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StepProgressTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _homeIdMeta = const VerificationMeta('homeId');
  @override
  late final GeneratedColumn<String> homeId = GeneratedColumn<String>(
    'home_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _childIdMeta = const VerificationMeta(
    'childId',
  );
  @override
  late final GeneratedColumn<String> childId = GeneratedColumn<String>(
    'child_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stepIdMeta = const VerificationMeta('stepId');
  @override
  late final GeneratedColumn<String> stepId = GeneratedColumn<String>(
    'step_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shiftMeta = const VerificationMeta('shift');
  @override
  late final GeneratedColumn<String> shift = GeneratedColumn<String>(
    'shift',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _outcomeMeta = const VerificationMeta(
    'outcome',
  );
  @override
  late final GeneratedColumn<String> outcome = GeneratedColumn<String>(
    'outcome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordedByIdMeta = const VerificationMeta(
    'recordedById',
  );
  @override
  late final GeneratedColumn<String> recordedById = GeneratedColumn<String>(
    'recorded_by_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordedByNameMeta = const VerificationMeta(
    'recordedByName',
  );
  @override
  late final GeneratedColumn<String> recordedByName = GeneratedColumn<String>(
    'recorded_by_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdByIdMeta = const VerificationMeta(
    'createdById',
  );
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
    'created_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByIdMeta = const VerificationMeta(
    'updatedById',
  );
  @override
  late final GeneratedColumn<String> updatedById = GeneratedColumn<String>(
    'updated_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    homeId,
    childId,
    stepId,
    date,
    shift,
    outcome,
    note,
    recordedById,
    recordedByName,
    createdById,
    updatedById,
    createdAt,
    updatedAt,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'step_progress';
  @override
  VerificationContext validateIntegrity(
    Insertable<StepProgressRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('home_id')) {
      context.handle(
        _homeIdMeta,
        homeId.isAcceptableOrUnknown(data['home_id']!, _homeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_homeIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(
        _childIdMeta,
        childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta),
      );
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('step_id')) {
      context.handle(
        _stepIdMeta,
        stepId.isAcceptableOrUnknown(data['step_id']!, _stepIdMeta),
      );
    } else if (isInserting) {
      context.missing(_stepIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('shift')) {
      context.handle(
        _shiftMeta,
        shift.isAcceptableOrUnknown(data['shift']!, _shiftMeta),
      );
    } else if (isInserting) {
      context.missing(_shiftMeta);
    }
    if (data.containsKey('outcome')) {
      context.handle(
        _outcomeMeta,
        outcome.isAcceptableOrUnknown(data['outcome']!, _outcomeMeta),
      );
    } else if (isInserting) {
      context.missing(_outcomeMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('recorded_by_id')) {
      context.handle(
        _recordedByIdMeta,
        recordedById.isAcceptableOrUnknown(
          data['recorded_by_id']!,
          _recordedByIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recordedByIdMeta);
    }
    if (data.containsKey('recorded_by_name')) {
      context.handle(
        _recordedByNameMeta,
        recordedByName.isAcceptableOrUnknown(
          data['recorded_by_name']!,
          _recordedByNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recordedByNameMeta);
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
        _createdByIdMeta,
        createdById.isAcceptableOrUnknown(
          data['created_by_id']!,
          _createdByIdMeta,
        ),
      );
    }
    if (data.containsKey('updated_by_id')) {
      context.handle(
        _updatedByIdMeta,
        updatedById.isAcceptableOrUnknown(
          data['updated_by_id']!,
          _updatedByIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StepProgressRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StepProgressRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      homeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_id'],
      )!,
      childId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}child_id'],
      )!,
      stepId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}step_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      shift: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shift'],
      )!,
      outcome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}outcome'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      )!,
      recordedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorded_by_id'],
      )!,
      recordedByName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorded_by_name'],
      )!,
      createdById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_id'],
      ),
      updatedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $StepProgressTableTable createAlias(String alias) {
    return $StepProgressTableTable(attachedDatabase, alias);
  }
}

class StepProgressRow extends DataClass implements Insertable<StepProgressRow> {
  final String id;
  final String homeId;
  final String childId;
  final String stepId;
  final String date;
  final String shift;
  final String outcome;
  final String note;
  final String recordedById;
  final String recordedByName;
  final String? createdById;
  final String? updatedById;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSynced;
  const StepProgressRow({
    required this.id,
    required this.homeId,
    required this.childId,
    required this.stepId,
    required this.date,
    required this.shift,
    required this.outcome,
    required this.note,
    required this.recordedById,
    required this.recordedByName,
    this.createdById,
    this.updatedById,
    required this.createdAt,
    required this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['home_id'] = Variable<String>(homeId);
    map['child_id'] = Variable<String>(childId);
    map['step_id'] = Variable<String>(stepId);
    map['date'] = Variable<String>(date);
    map['shift'] = Variable<String>(shift);
    map['outcome'] = Variable<String>(outcome);
    map['note'] = Variable<String>(note);
    map['recorded_by_id'] = Variable<String>(recordedById);
    map['recorded_by_name'] = Variable<String>(recordedByName);
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || updatedById != null) {
      map['updated_by_id'] = Variable<String>(updatedById);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  StepProgressTableCompanion toCompanion(bool nullToAbsent) {
    return StepProgressTableCompanion(
      id: Value(id),
      homeId: Value(homeId),
      childId: Value(childId),
      stepId: Value(stepId),
      date: Value(date),
      shift: Value(shift),
      outcome: Value(outcome),
      note: Value(note),
      recordedById: Value(recordedById),
      recordedByName: Value(recordedByName),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      updatedById: updatedById == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedById),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory StepProgressRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StepProgressRow(
      id: serializer.fromJson<String>(json['id']),
      homeId: serializer.fromJson<String>(json['homeId']),
      childId: serializer.fromJson<String>(json['childId']),
      stepId: serializer.fromJson<String>(json['stepId']),
      date: serializer.fromJson<String>(json['date']),
      shift: serializer.fromJson<String>(json['shift']),
      outcome: serializer.fromJson<String>(json['outcome']),
      note: serializer.fromJson<String>(json['note']),
      recordedById: serializer.fromJson<String>(json['recordedById']),
      recordedByName: serializer.fromJson<String>(json['recordedByName']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      updatedById: serializer.fromJson<String?>(json['updatedById']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'homeId': serializer.toJson<String>(homeId),
      'childId': serializer.toJson<String>(childId),
      'stepId': serializer.toJson<String>(stepId),
      'date': serializer.toJson<String>(date),
      'shift': serializer.toJson<String>(shift),
      'outcome': serializer.toJson<String>(outcome),
      'note': serializer.toJson<String>(note),
      'recordedById': serializer.toJson<String>(recordedById),
      'recordedByName': serializer.toJson<String>(recordedByName),
      'createdById': serializer.toJson<String?>(createdById),
      'updatedById': serializer.toJson<String?>(updatedById),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  StepProgressRow copyWith({
    String? id,
    String? homeId,
    String? childId,
    String? stepId,
    String? date,
    String? shift,
    String? outcome,
    String? note,
    String? recordedById,
    String? recordedByName,
    Value<String?> createdById = const Value.absent(),
    Value<String?> updatedById = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
  }) => StepProgressRow(
    id: id ?? this.id,
    homeId: homeId ?? this.homeId,
    childId: childId ?? this.childId,
    stepId: stepId ?? this.stepId,
    date: date ?? this.date,
    shift: shift ?? this.shift,
    outcome: outcome ?? this.outcome,
    note: note ?? this.note,
    recordedById: recordedById ?? this.recordedById,
    recordedByName: recordedByName ?? this.recordedByName,
    createdById: createdById.present ? createdById.value : this.createdById,
    updatedById: updatedById.present ? updatedById.value : this.updatedById,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  StepProgressRow copyWithCompanion(StepProgressTableCompanion data) {
    return StepProgressRow(
      id: data.id.present ? data.id.value : this.id,
      homeId: data.homeId.present ? data.homeId.value : this.homeId,
      childId: data.childId.present ? data.childId.value : this.childId,
      stepId: data.stepId.present ? data.stepId.value : this.stepId,
      date: data.date.present ? data.date.value : this.date,
      shift: data.shift.present ? data.shift.value : this.shift,
      outcome: data.outcome.present ? data.outcome.value : this.outcome,
      note: data.note.present ? data.note.value : this.note,
      recordedById: data.recordedById.present
          ? data.recordedById.value
          : this.recordedById,
      recordedByName: data.recordedByName.present
          ? data.recordedByName.value
          : this.recordedByName,
      createdById: data.createdById.present
          ? data.createdById.value
          : this.createdById,
      updatedById: data.updatedById.present
          ? data.updatedById.value
          : this.updatedById,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StepProgressRow(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('stepId: $stepId, ')
          ..write('date: $date, ')
          ..write('shift: $shift, ')
          ..write('outcome: $outcome, ')
          ..write('note: $note, ')
          ..write('recordedById: $recordedById, ')
          ..write('recordedByName: $recordedByName, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    homeId,
    childId,
    stepId,
    date,
    shift,
    outcome,
    note,
    recordedById,
    recordedByName,
    createdById,
    updatedById,
    createdAt,
    updatedAt,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StepProgressRow &&
          other.id == this.id &&
          other.homeId == this.homeId &&
          other.childId == this.childId &&
          other.stepId == this.stepId &&
          other.date == this.date &&
          other.shift == this.shift &&
          other.outcome == this.outcome &&
          other.note == this.note &&
          other.recordedById == this.recordedById &&
          other.recordedByName == this.recordedByName &&
          other.createdById == this.createdById &&
          other.updatedById == this.updatedById &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class StepProgressTableCompanion extends UpdateCompanion<StepProgressRow> {
  final Value<String> id;
  final Value<String> homeId;
  final Value<String> childId;
  final Value<String> stepId;
  final Value<String> date;
  final Value<String> shift;
  final Value<String> outcome;
  final Value<String> note;
  final Value<String> recordedById;
  final Value<String> recordedByName;
  final Value<String?> createdById;
  final Value<String?> updatedById;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const StepProgressTableCompanion({
    this.id = const Value.absent(),
    this.homeId = const Value.absent(),
    this.childId = const Value.absent(),
    this.stepId = const Value.absent(),
    this.date = const Value.absent(),
    this.shift = const Value.absent(),
    this.outcome = const Value.absent(),
    this.note = const Value.absent(),
    this.recordedById = const Value.absent(),
    this.recordedByName = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StepProgressTableCompanion.insert({
    required String id,
    required String homeId,
    required String childId,
    required String stepId,
    required String date,
    required String shift,
    required String outcome,
    required String note,
    required String recordedById,
    required String recordedByName,
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       homeId = Value(homeId),
       childId = Value(childId),
       stepId = Value(stepId),
       date = Value(date),
       shift = Value(shift),
       outcome = Value(outcome),
       note = Value(note),
       recordedById = Value(recordedById),
       recordedByName = Value(recordedByName),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<StepProgressRow> custom({
    Expression<String>? id,
    Expression<String>? homeId,
    Expression<String>? childId,
    Expression<String>? stepId,
    Expression<String>? date,
    Expression<String>? shift,
    Expression<String>? outcome,
    Expression<String>? note,
    Expression<String>? recordedById,
    Expression<String>? recordedByName,
    Expression<String>? createdById,
    Expression<String>? updatedById,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (homeId != null) 'home_id': homeId,
      if (childId != null) 'child_id': childId,
      if (stepId != null) 'step_id': stepId,
      if (date != null) 'date': date,
      if (shift != null) 'shift': shift,
      if (outcome != null) 'outcome': outcome,
      if (note != null) 'note': note,
      if (recordedById != null) 'recorded_by_id': recordedById,
      if (recordedByName != null) 'recorded_by_name': recordedByName,
      if (createdById != null) 'created_by_id': createdById,
      if (updatedById != null) 'updated_by_id': updatedById,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StepProgressTableCompanion copyWith({
    Value<String>? id,
    Value<String>? homeId,
    Value<String>? childId,
    Value<String>? stepId,
    Value<String>? date,
    Value<String>? shift,
    Value<String>? outcome,
    Value<String>? note,
    Value<String>? recordedById,
    Value<String>? recordedByName,
    Value<String?>? createdById,
    Value<String?>? updatedById,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return StepProgressTableCompanion(
      id: id ?? this.id,
      homeId: homeId ?? this.homeId,
      childId: childId ?? this.childId,
      stepId: stepId ?? this.stepId,
      date: date ?? this.date,
      shift: shift ?? this.shift,
      outcome: outcome ?? this.outcome,
      note: note ?? this.note,
      recordedById: recordedById ?? this.recordedById,
      recordedByName: recordedByName ?? this.recordedByName,
      createdById: createdById ?? this.createdById,
      updatedById: updatedById ?? this.updatedById,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (homeId.present) {
      map['home_id'] = Variable<String>(homeId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<String>(childId.value);
    }
    if (stepId.present) {
      map['step_id'] = Variable<String>(stepId.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (shift.present) {
      map['shift'] = Variable<String>(shift.value);
    }
    if (outcome.present) {
      map['outcome'] = Variable<String>(outcome.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (recordedById.present) {
      map['recorded_by_id'] = Variable<String>(recordedById.value);
    }
    if (recordedByName.present) {
      map['recorded_by_name'] = Variable<String>(recordedByName.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (updatedById.present) {
      map['updated_by_id'] = Variable<String>(updatedById.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StepProgressTableCompanion(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('stepId: $stepId, ')
          ..write('date: $date, ')
          ..write('shift: $shift, ')
          ..write('outcome: $outcome, ')
          ..write('note: $note, ')
          ..write('recordedById: $recordedById, ')
          ..write('recordedByName: $recordedByName, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $IncidentReportsTableTable extends IncidentReportsTable
    with TableInfo<$IncidentReportsTableTable, IncidentReportRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IncidentReportsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _homeIdMeta = const VerificationMeta('homeId');
  @override
  late final GeneratedColumn<String> homeId = GeneratedColumn<String>(
    'home_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _childIdMeta = const VerificationMeta(
    'childId',
  );
  @override
  late final GeneratedColumn<String> childId = GeneratedColumn<String>(
    'child_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _incidentTypeMeta = const VerificationMeta(
    'incidentType',
  );
  @override
  late final GeneratedColumn<String> incidentType = GeneratedColumn<String>(
    'incident_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _severityMeta = const VerificationMeta(
    'severity',
  );
  @override
  late final GeneratedColumn<String> severity = GeneratedColumn<String>(
    'severity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _occurredAtMeta = const VerificationMeta(
    'occurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _immediateActionMeta = const VerificationMeta(
    'immediateAction',
  );
  @override
  late final GeneratedColumn<String> immediateAction = GeneratedColumn<String>(
    'immediate_action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _injuryDetailsMeta = const VerificationMeta(
    'injuryDetails',
  );
  @override
  late final GeneratedColumn<String> injuryDetails = GeneratedColumn<String>(
    'injury_details',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _policeNotifiedMeta = const VerificationMeta(
    'policeNotified',
  );
  @override
  late final GeneratedColumn<bool> policeNotified = GeneratedColumn<bool>(
    'police_notified',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("police_notified" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _parentNotifiedMeta = const VerificationMeta(
    'parentNotified',
  );
  @override
  late final GeneratedColumn<bool> parentNotified = GeneratedColumn<bool>(
    'parent_notified',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("parent_notified" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _managerNotifiedMeta = const VerificationMeta(
    'managerNotified',
  );
  @override
  late final GeneratedColumn<bool> managerNotified = GeneratedColumn<bool>(
    'manager_notified',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("manager_notified" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _followUpRequiredMeta = const VerificationMeta(
    'followUpRequired',
  );
  @override
  late final GeneratedColumn<bool> followUpRequired = GeneratedColumn<bool>(
    'follow_up_required',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("follow_up_required" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _followUpDetailsMeta = const VerificationMeta(
    'followUpDetails',
  );
  @override
  late final GeneratedColumn<String> followUpDetails = GeneratedColumn<String>(
    'follow_up_details',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _reportedByIdMeta = const VerificationMeta(
    'reportedById',
  );
  @override
  late final GeneratedColumn<String> reportedById = GeneratedColumn<String>(
    'reported_by_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reportedByNameMeta = const VerificationMeta(
    'reportedByName',
  );
  @override
  late final GeneratedColumn<String> reportedByName = GeneratedColumn<String>(
    'reported_by_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdByIdMeta = const VerificationMeta(
    'createdById',
  );
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
    'created_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByIdMeta = const VerificationMeta(
    'updatedById',
  );
  @override
  late final GeneratedColumn<String> updatedById = GeneratedColumn<String>(
    'updated_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
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
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'incident_reports';
  @override
  VerificationContext validateIntegrity(
    Insertable<IncidentReportRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('home_id')) {
      context.handle(
        _homeIdMeta,
        homeId.isAcceptableOrUnknown(data['home_id']!, _homeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_homeIdMeta);
    }
    if (data.containsKey('child_id')) {
      context.handle(
        _childIdMeta,
        childId.isAcceptableOrUnknown(data['child_id']!, _childIdMeta),
      );
    } else if (isInserting) {
      context.missing(_childIdMeta);
    }
    if (data.containsKey('incident_type')) {
      context.handle(
        _incidentTypeMeta,
        incidentType.isAcceptableOrUnknown(
          data['incident_type']!,
          _incidentTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_incidentTypeMeta);
    }
    if (data.containsKey('severity')) {
      context.handle(
        _severityMeta,
        severity.isAcceptableOrUnknown(data['severity']!, _severityMeta),
      );
    } else if (isInserting) {
      context.missing(_severityMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
        _occurredAtMeta,
        occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('immediate_action')) {
      context.handle(
        _immediateActionMeta,
        immediateAction.isAcceptableOrUnknown(
          data['immediate_action']!,
          _immediateActionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_immediateActionMeta);
    }
    if (data.containsKey('injury_details')) {
      context.handle(
        _injuryDetailsMeta,
        injuryDetails.isAcceptableOrUnknown(
          data['injury_details']!,
          _injuryDetailsMeta,
        ),
      );
    }
    if (data.containsKey('police_notified')) {
      context.handle(
        _policeNotifiedMeta,
        policeNotified.isAcceptableOrUnknown(
          data['police_notified']!,
          _policeNotifiedMeta,
        ),
      );
    }
    if (data.containsKey('parent_notified')) {
      context.handle(
        _parentNotifiedMeta,
        parentNotified.isAcceptableOrUnknown(
          data['parent_notified']!,
          _parentNotifiedMeta,
        ),
      );
    }
    if (data.containsKey('manager_notified')) {
      context.handle(
        _managerNotifiedMeta,
        managerNotified.isAcceptableOrUnknown(
          data['manager_notified']!,
          _managerNotifiedMeta,
        ),
      );
    }
    if (data.containsKey('follow_up_required')) {
      context.handle(
        _followUpRequiredMeta,
        followUpRequired.isAcceptableOrUnknown(
          data['follow_up_required']!,
          _followUpRequiredMeta,
        ),
      );
    }
    if (data.containsKey('follow_up_details')) {
      context.handle(
        _followUpDetailsMeta,
        followUpDetails.isAcceptableOrUnknown(
          data['follow_up_details']!,
          _followUpDetailsMeta,
        ),
      );
    }
    if (data.containsKey('reported_by_id')) {
      context.handle(
        _reportedByIdMeta,
        reportedById.isAcceptableOrUnknown(
          data['reported_by_id']!,
          _reportedByIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_reportedByIdMeta);
    }
    if (data.containsKey('reported_by_name')) {
      context.handle(
        _reportedByNameMeta,
        reportedByName.isAcceptableOrUnknown(
          data['reported_by_name']!,
          _reportedByNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_reportedByNameMeta);
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
        _createdByIdMeta,
        createdById.isAcceptableOrUnknown(
          data['created_by_id']!,
          _createdByIdMeta,
        ),
      );
    }
    if (data.containsKey('updated_by_id')) {
      context.handle(
        _updatedByIdMeta,
        updatedById.isAcceptableOrUnknown(
          data['updated_by_id']!,
          _updatedByIdMeta,
        ),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IncidentReportRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IncidentReportRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      homeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_id'],
      )!,
      childId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}child_id'],
      )!,
      incidentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}incident_type'],
      )!,
      severity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}severity'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      occurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}occurred_at'],
      )!,
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      immediateAction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}immediate_action'],
      )!,
      injuryDetails: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}injury_details'],
      ),
      policeNotified: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}police_notified'],
      )!,
      parentNotified: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}parent_notified'],
      )!,
      managerNotified: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}manager_notified'],
      )!,
      followUpRequired: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}follow_up_required'],
      )!,
      followUpDetails: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}follow_up_details'],
      ),
      reportedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reported_by_id'],
      )!,
      reportedByName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reported_by_name'],
      )!,
      createdById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_id'],
      ),
      updatedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by_id'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $IncidentReportsTableTable createAlias(String alias) {
    return $IncidentReportsTableTable(attachedDatabase, alias);
  }
}

class IncidentReportRow extends DataClass
    implements Insertable<IncidentReportRow> {
  final String id;
  final String homeId;
  final String childId;
  final String incidentType;
  final String severity;
  final String title;
  final DateTime occurredAt;
  final String? location;
  final String description;
  final String immediateAction;
  final String? injuryDetails;
  final bool policeNotified;
  final bool parentNotified;
  final bool managerNotified;
  final bool followUpRequired;
  final String? followUpDetails;
  final String reportedById;
  final String reportedByName;
  final String? createdById;
  final String? updatedById;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSynced;
  const IncidentReportRow({
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
    required this.policeNotified,
    required this.parentNotified,
    required this.managerNotified,
    required this.followUpRequired,
    this.followUpDetails,
    required this.reportedById,
    required this.reportedByName,
    this.createdById,
    this.updatedById,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['home_id'] = Variable<String>(homeId);
    map['child_id'] = Variable<String>(childId);
    map['incident_type'] = Variable<String>(incidentType);
    map['severity'] = Variable<String>(severity);
    map['title'] = Variable<String>(title);
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    map['description'] = Variable<String>(description);
    map['immediate_action'] = Variable<String>(immediateAction);
    if (!nullToAbsent || injuryDetails != null) {
      map['injury_details'] = Variable<String>(injuryDetails);
    }
    map['police_notified'] = Variable<bool>(policeNotified);
    map['parent_notified'] = Variable<bool>(parentNotified);
    map['manager_notified'] = Variable<bool>(managerNotified);
    map['follow_up_required'] = Variable<bool>(followUpRequired);
    if (!nullToAbsent || followUpDetails != null) {
      map['follow_up_details'] = Variable<String>(followUpDetails);
    }
    map['reported_by_id'] = Variable<String>(reportedById);
    map['reported_by_name'] = Variable<String>(reportedByName);
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || updatedById != null) {
      map['updated_by_id'] = Variable<String>(updatedById);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  IncidentReportsTableCompanion toCompanion(bool nullToAbsent) {
    return IncidentReportsTableCompanion(
      id: Value(id),
      homeId: Value(homeId),
      childId: Value(childId),
      incidentType: Value(incidentType),
      severity: Value(severity),
      title: Value(title),
      occurredAt: Value(occurredAt),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      description: Value(description),
      immediateAction: Value(immediateAction),
      injuryDetails: injuryDetails == null && nullToAbsent
          ? const Value.absent()
          : Value(injuryDetails),
      policeNotified: Value(policeNotified),
      parentNotified: Value(parentNotified),
      managerNotified: Value(managerNotified),
      followUpRequired: Value(followUpRequired),
      followUpDetails: followUpDetails == null && nullToAbsent
          ? const Value.absent()
          : Value(followUpDetails),
      reportedById: Value(reportedById),
      reportedByName: Value(reportedByName),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      updatedById: updatedById == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedById),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory IncidentReportRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IncidentReportRow(
      id: serializer.fromJson<String>(json['id']),
      homeId: serializer.fromJson<String>(json['homeId']),
      childId: serializer.fromJson<String>(json['childId']),
      incidentType: serializer.fromJson<String>(json['incidentType']),
      severity: serializer.fromJson<String>(json['severity']),
      title: serializer.fromJson<String>(json['title']),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
      location: serializer.fromJson<String?>(json['location']),
      description: serializer.fromJson<String>(json['description']),
      immediateAction: serializer.fromJson<String>(json['immediateAction']),
      injuryDetails: serializer.fromJson<String?>(json['injuryDetails']),
      policeNotified: serializer.fromJson<bool>(json['policeNotified']),
      parentNotified: serializer.fromJson<bool>(json['parentNotified']),
      managerNotified: serializer.fromJson<bool>(json['managerNotified']),
      followUpRequired: serializer.fromJson<bool>(json['followUpRequired']),
      followUpDetails: serializer.fromJson<String?>(json['followUpDetails']),
      reportedById: serializer.fromJson<String>(json['reportedById']),
      reportedByName: serializer.fromJson<String>(json['reportedByName']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      updatedById: serializer.fromJson<String?>(json['updatedById']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'homeId': serializer.toJson<String>(homeId),
      'childId': serializer.toJson<String>(childId),
      'incidentType': serializer.toJson<String>(incidentType),
      'severity': serializer.toJson<String>(severity),
      'title': serializer.toJson<String>(title),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
      'location': serializer.toJson<String?>(location),
      'description': serializer.toJson<String>(description),
      'immediateAction': serializer.toJson<String>(immediateAction),
      'injuryDetails': serializer.toJson<String?>(injuryDetails),
      'policeNotified': serializer.toJson<bool>(policeNotified),
      'parentNotified': serializer.toJson<bool>(parentNotified),
      'managerNotified': serializer.toJson<bool>(managerNotified),
      'followUpRequired': serializer.toJson<bool>(followUpRequired),
      'followUpDetails': serializer.toJson<String?>(followUpDetails),
      'reportedById': serializer.toJson<String>(reportedById),
      'reportedByName': serializer.toJson<String>(reportedByName),
      'createdById': serializer.toJson<String?>(createdById),
      'updatedById': serializer.toJson<String?>(updatedById),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  IncidentReportRow copyWith({
    String? id,
    String? homeId,
    String? childId,
    String? incidentType,
    String? severity,
    String? title,
    DateTime? occurredAt,
    Value<String?> location = const Value.absent(),
    String? description,
    String? immediateAction,
    Value<String?> injuryDetails = const Value.absent(),
    bool? policeNotified,
    bool? parentNotified,
    bool? managerNotified,
    bool? followUpRequired,
    Value<String?> followUpDetails = const Value.absent(),
    String? reportedById,
    String? reportedByName,
    Value<String?> createdById = const Value.absent(),
    Value<String?> updatedById = const Value.absent(),
    Value<DateTime?> deletedAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
  }) => IncidentReportRow(
    id: id ?? this.id,
    homeId: homeId ?? this.homeId,
    childId: childId ?? this.childId,
    incidentType: incidentType ?? this.incidentType,
    severity: severity ?? this.severity,
    title: title ?? this.title,
    occurredAt: occurredAt ?? this.occurredAt,
    location: location.present ? location.value : this.location,
    description: description ?? this.description,
    immediateAction: immediateAction ?? this.immediateAction,
    injuryDetails: injuryDetails.present
        ? injuryDetails.value
        : this.injuryDetails,
    policeNotified: policeNotified ?? this.policeNotified,
    parentNotified: parentNotified ?? this.parentNotified,
    managerNotified: managerNotified ?? this.managerNotified,
    followUpRequired: followUpRequired ?? this.followUpRequired,
    followUpDetails: followUpDetails.present
        ? followUpDetails.value
        : this.followUpDetails,
    reportedById: reportedById ?? this.reportedById,
    reportedByName: reportedByName ?? this.reportedByName,
    createdById: createdById.present ? createdById.value : this.createdById,
    updatedById: updatedById.present ? updatedById.value : this.updatedById,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  IncidentReportRow copyWithCompanion(IncidentReportsTableCompanion data) {
    return IncidentReportRow(
      id: data.id.present ? data.id.value : this.id,
      homeId: data.homeId.present ? data.homeId.value : this.homeId,
      childId: data.childId.present ? data.childId.value : this.childId,
      incidentType: data.incidentType.present
          ? data.incidentType.value
          : this.incidentType,
      severity: data.severity.present ? data.severity.value : this.severity,
      title: data.title.present ? data.title.value : this.title,
      occurredAt: data.occurredAt.present
          ? data.occurredAt.value
          : this.occurredAt,
      location: data.location.present ? data.location.value : this.location,
      description: data.description.present
          ? data.description.value
          : this.description,
      immediateAction: data.immediateAction.present
          ? data.immediateAction.value
          : this.immediateAction,
      injuryDetails: data.injuryDetails.present
          ? data.injuryDetails.value
          : this.injuryDetails,
      policeNotified: data.policeNotified.present
          ? data.policeNotified.value
          : this.policeNotified,
      parentNotified: data.parentNotified.present
          ? data.parentNotified.value
          : this.parentNotified,
      managerNotified: data.managerNotified.present
          ? data.managerNotified.value
          : this.managerNotified,
      followUpRequired: data.followUpRequired.present
          ? data.followUpRequired.value
          : this.followUpRequired,
      followUpDetails: data.followUpDetails.present
          ? data.followUpDetails.value
          : this.followUpDetails,
      reportedById: data.reportedById.present
          ? data.reportedById.value
          : this.reportedById,
      reportedByName: data.reportedByName.present
          ? data.reportedByName.value
          : this.reportedByName,
      createdById: data.createdById.present
          ? data.createdById.value
          : this.createdById,
      updatedById: data.updatedById.present
          ? data.updatedById.value
          : this.updatedById,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IncidentReportRow(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('incidentType: $incidentType, ')
          ..write('severity: $severity, ')
          ..write('title: $title, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('location: $location, ')
          ..write('description: $description, ')
          ..write('immediateAction: $immediateAction, ')
          ..write('injuryDetails: $injuryDetails, ')
          ..write('policeNotified: $policeNotified, ')
          ..write('parentNotified: $parentNotified, ')
          ..write('managerNotified: $managerNotified, ')
          ..write('followUpRequired: $followUpRequired, ')
          ..write('followUpDetails: $followUpDetails, ')
          ..write('reportedById: $reportedById, ')
          ..write('reportedByName: $reportedByName, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IncidentReportRow &&
          other.id == this.id &&
          other.homeId == this.homeId &&
          other.childId == this.childId &&
          other.incidentType == this.incidentType &&
          other.severity == this.severity &&
          other.title == this.title &&
          other.occurredAt == this.occurredAt &&
          other.location == this.location &&
          other.description == this.description &&
          other.immediateAction == this.immediateAction &&
          other.injuryDetails == this.injuryDetails &&
          other.policeNotified == this.policeNotified &&
          other.parentNotified == this.parentNotified &&
          other.managerNotified == this.managerNotified &&
          other.followUpRequired == this.followUpRequired &&
          other.followUpDetails == this.followUpDetails &&
          other.reportedById == this.reportedById &&
          other.reportedByName == this.reportedByName &&
          other.createdById == this.createdById &&
          other.updatedById == this.updatedById &&
          other.deletedAt == this.deletedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class IncidentReportsTableCompanion extends UpdateCompanion<IncidentReportRow> {
  final Value<String> id;
  final Value<String> homeId;
  final Value<String> childId;
  final Value<String> incidentType;
  final Value<String> severity;
  final Value<String> title;
  final Value<DateTime> occurredAt;
  final Value<String?> location;
  final Value<String> description;
  final Value<String> immediateAction;
  final Value<String?> injuryDetails;
  final Value<bool> policeNotified;
  final Value<bool> parentNotified;
  final Value<bool> managerNotified;
  final Value<bool> followUpRequired;
  final Value<String?> followUpDetails;
  final Value<String> reportedById;
  final Value<String> reportedByName;
  final Value<String?> createdById;
  final Value<String?> updatedById;
  final Value<DateTime?> deletedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const IncidentReportsTableCompanion({
    this.id = const Value.absent(),
    this.homeId = const Value.absent(),
    this.childId = const Value.absent(),
    this.incidentType = const Value.absent(),
    this.severity = const Value.absent(),
    this.title = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.location = const Value.absent(),
    this.description = const Value.absent(),
    this.immediateAction = const Value.absent(),
    this.injuryDetails = const Value.absent(),
    this.policeNotified = const Value.absent(),
    this.parentNotified = const Value.absent(),
    this.managerNotified = const Value.absent(),
    this.followUpRequired = const Value.absent(),
    this.followUpDetails = const Value.absent(),
    this.reportedById = const Value.absent(),
    this.reportedByName = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IncidentReportsTableCompanion.insert({
    required String id,
    required String homeId,
    required String childId,
    required String incidentType,
    required String severity,
    required String title,
    required DateTime occurredAt,
    this.location = const Value.absent(),
    required String description,
    required String immediateAction,
    this.injuryDetails = const Value.absent(),
    this.policeNotified = const Value.absent(),
    this.parentNotified = const Value.absent(),
    this.managerNotified = const Value.absent(),
    this.followUpRequired = const Value.absent(),
    this.followUpDetails = const Value.absent(),
    required String reportedById,
    required String reportedByName,
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       homeId = Value(homeId),
       childId = Value(childId),
       incidentType = Value(incidentType),
       severity = Value(severity),
       title = Value(title),
       occurredAt = Value(occurredAt),
       description = Value(description),
       immediateAction = Value(immediateAction),
       reportedById = Value(reportedById),
       reportedByName = Value(reportedByName),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<IncidentReportRow> custom({
    Expression<String>? id,
    Expression<String>? homeId,
    Expression<String>? childId,
    Expression<String>? incidentType,
    Expression<String>? severity,
    Expression<String>? title,
    Expression<DateTime>? occurredAt,
    Expression<String>? location,
    Expression<String>? description,
    Expression<String>? immediateAction,
    Expression<String>? injuryDetails,
    Expression<bool>? policeNotified,
    Expression<bool>? parentNotified,
    Expression<bool>? managerNotified,
    Expression<bool>? followUpRequired,
    Expression<String>? followUpDetails,
    Expression<String>? reportedById,
    Expression<String>? reportedByName,
    Expression<String>? createdById,
    Expression<String>? updatedById,
    Expression<DateTime>? deletedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (homeId != null) 'home_id': homeId,
      if (childId != null) 'child_id': childId,
      if (incidentType != null) 'incident_type': incidentType,
      if (severity != null) 'severity': severity,
      if (title != null) 'title': title,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (location != null) 'location': location,
      if (description != null) 'description': description,
      if (immediateAction != null) 'immediate_action': immediateAction,
      if (injuryDetails != null) 'injury_details': injuryDetails,
      if (policeNotified != null) 'police_notified': policeNotified,
      if (parentNotified != null) 'parent_notified': parentNotified,
      if (managerNotified != null) 'manager_notified': managerNotified,
      if (followUpRequired != null) 'follow_up_required': followUpRequired,
      if (followUpDetails != null) 'follow_up_details': followUpDetails,
      if (reportedById != null) 'reported_by_id': reportedById,
      if (reportedByName != null) 'reported_by_name': reportedByName,
      if (createdById != null) 'created_by_id': createdById,
      if (updatedById != null) 'updated_by_id': updatedById,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IncidentReportsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? homeId,
    Value<String>? childId,
    Value<String>? incidentType,
    Value<String>? severity,
    Value<String>? title,
    Value<DateTime>? occurredAt,
    Value<String?>? location,
    Value<String>? description,
    Value<String>? immediateAction,
    Value<String?>? injuryDetails,
    Value<bool>? policeNotified,
    Value<bool>? parentNotified,
    Value<bool>? managerNotified,
    Value<bool>? followUpRequired,
    Value<String?>? followUpDetails,
    Value<String>? reportedById,
    Value<String>? reportedByName,
    Value<String?>? createdById,
    Value<String?>? updatedById,
    Value<DateTime?>? deletedAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return IncidentReportsTableCompanion(
      id: id ?? this.id,
      homeId: homeId ?? this.homeId,
      childId: childId ?? this.childId,
      incidentType: incidentType ?? this.incidentType,
      severity: severity ?? this.severity,
      title: title ?? this.title,
      occurredAt: occurredAt ?? this.occurredAt,
      location: location ?? this.location,
      description: description ?? this.description,
      immediateAction: immediateAction ?? this.immediateAction,
      injuryDetails: injuryDetails ?? this.injuryDetails,
      policeNotified: policeNotified ?? this.policeNotified,
      parentNotified: parentNotified ?? this.parentNotified,
      managerNotified: managerNotified ?? this.managerNotified,
      followUpRequired: followUpRequired ?? this.followUpRequired,
      followUpDetails: followUpDetails ?? this.followUpDetails,
      reportedById: reportedById ?? this.reportedById,
      reportedByName: reportedByName ?? this.reportedByName,
      createdById: createdById ?? this.createdById,
      updatedById: updatedById ?? this.updatedById,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (homeId.present) {
      map['home_id'] = Variable<String>(homeId.value);
    }
    if (childId.present) {
      map['child_id'] = Variable<String>(childId.value);
    }
    if (incidentType.present) {
      map['incident_type'] = Variable<String>(incidentType.value);
    }
    if (severity.present) {
      map['severity'] = Variable<String>(severity.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (immediateAction.present) {
      map['immediate_action'] = Variable<String>(immediateAction.value);
    }
    if (injuryDetails.present) {
      map['injury_details'] = Variable<String>(injuryDetails.value);
    }
    if (policeNotified.present) {
      map['police_notified'] = Variable<bool>(policeNotified.value);
    }
    if (parentNotified.present) {
      map['parent_notified'] = Variable<bool>(parentNotified.value);
    }
    if (managerNotified.present) {
      map['manager_notified'] = Variable<bool>(managerNotified.value);
    }
    if (followUpRequired.present) {
      map['follow_up_required'] = Variable<bool>(followUpRequired.value);
    }
    if (followUpDetails.present) {
      map['follow_up_details'] = Variable<String>(followUpDetails.value);
    }
    if (reportedById.present) {
      map['reported_by_id'] = Variable<String>(reportedById.value);
    }
    if (reportedByName.present) {
      map['reported_by_name'] = Variable<String>(reportedByName.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (updatedById.present) {
      map['updated_by_id'] = Variable<String>(updatedById.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IncidentReportsTableCompanion(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('childId: $childId, ')
          ..write('incidentType: $incidentType, ')
          ..write('severity: $severity, ')
          ..write('title: $title, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('location: $location, ')
          ..write('description: $description, ')
          ..write('immediateAction: $immediateAction, ')
          ..write('injuryDetails: $injuryDetails, ')
          ..write('policeNotified: $policeNotified, ')
          ..write('parentNotified: $parentNotified, ')
          ..write('managerNotified: $managerNotified, ')
          ..write('followUpRequired: $followUpRequired, ')
          ..write('followUpDetails: $followUpDetails, ')
          ..write('reportedById: $reportedById, ')
          ..write('reportedByName: $reportedByName, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChildrenTableTable extends ChildrenTable
    with TableInfo<$ChildrenTableTable, ChildRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChildrenTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _homeIdMeta = const VerificationMeta('homeId');
  @override
  late final GeneratedColumn<String> homeId = GeneratedColumn<String>(
    'home_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateOfBirthMeta = const VerificationMeta(
    'dateOfBirth',
  );
  @override
  late final GeneratedColumn<String> dateOfBirth = GeneratedColumn<String>(
    'date_of_birth',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roomMeta = const VerificationMeta('room');
  @override
  late final GeneratedColumn<String> room = GeneratedColumn<String>(
    'room',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _photoUrlMeta = const VerificationMeta(
    'photoUrl',
  );
  @override
  late final GeneratedColumn<String> photoUrl = GeneratedColumn<String>(
    'photo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdByIdMeta = const VerificationMeta(
    'createdById',
  );
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
    'created_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedByIdMeta = const VerificationMeta(
    'updatedById',
  );
  @override
  late final GeneratedColumn<String> updatedById = GeneratedColumn<String>(
    'updated_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    homeId,
    name,
    dateOfBirth,
    room,
    photoUrl,
    notes,
    createdAt,
    updatedAt,
    deletedAt,
    createdById,
    updatedById,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'children';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChildRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('home_id')) {
      context.handle(
        _homeIdMeta,
        homeId.isAcceptableOrUnknown(data['home_id']!, _homeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_homeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
        _dateOfBirthMeta,
        dateOfBirth.isAcceptableOrUnknown(
          data['date_of_birth']!,
          _dateOfBirthMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dateOfBirthMeta);
    }
    if (data.containsKey('room')) {
      context.handle(
        _roomMeta,
        room.isAcceptableOrUnknown(data['room']!, _roomMeta),
      );
    } else if (isInserting) {
      context.missing(_roomMeta);
    }
    if (data.containsKey('photo_url')) {
      context.handle(
        _photoUrlMeta,
        photoUrl.isAcceptableOrUnknown(data['photo_url']!, _photoUrlMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
        _createdByIdMeta,
        createdById.isAcceptableOrUnknown(
          data['created_by_id']!,
          _createdByIdMeta,
        ),
      );
    }
    if (data.containsKey('updated_by_id')) {
      context.handle(
        _updatedByIdMeta,
        updatedById.isAcceptableOrUnknown(
          data['updated_by_id']!,
          _updatedByIdMeta,
        ),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChildRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChildRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      homeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      dateOfBirth: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date_of_birth'],
      )!,
      room: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}room'],
      )!,
      photoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_url'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      createdById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_id'],
      ),
      updatedById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_by_id'],
      ),
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $ChildrenTableTable createAlias(String alias) {
    return $ChildrenTableTable(attachedDatabase, alias);
  }
}

class ChildRow extends DataClass implements Insertable<ChildRow> {
  final String id;
  final String homeId;
  final String name;
  final String dateOfBirth;
  final String room;
  final String? photoUrl;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String? createdById;
  final String? updatedById;
  final bool isSynced;
  const ChildRow({
    required this.id,
    required this.homeId,
    required this.name,
    required this.dateOfBirth,
    required this.room,
    this.photoUrl,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.createdById,
    this.updatedById,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['home_id'] = Variable<String>(homeId);
    map['name'] = Variable<String>(name);
    map['date_of_birth'] = Variable<String>(dateOfBirth);
    map['room'] = Variable<String>(room);
    if (!nullToAbsent || photoUrl != null) {
      map['photo_url'] = Variable<String>(photoUrl);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || updatedById != null) {
      map['updated_by_id'] = Variable<String>(updatedById);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  ChildrenTableCompanion toCompanion(bool nullToAbsent) {
    return ChildrenTableCompanion(
      id: Value(id),
      homeId: Value(homeId),
      name: Value(name),
      dateOfBirth: Value(dateOfBirth),
      room: Value(room),
      photoUrl: photoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(photoUrl),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      updatedById: updatedById == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedById),
      isSynced: Value(isSynced),
    );
  }

  factory ChildRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChildRow(
      id: serializer.fromJson<String>(json['id']),
      homeId: serializer.fromJson<String>(json['homeId']),
      name: serializer.fromJson<String>(json['name']),
      dateOfBirth: serializer.fromJson<String>(json['dateOfBirth']),
      room: serializer.fromJson<String>(json['room']),
      photoUrl: serializer.fromJson<String?>(json['photoUrl']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      updatedById: serializer.fromJson<String?>(json['updatedById']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'homeId': serializer.toJson<String>(homeId),
      'name': serializer.toJson<String>(name),
      'dateOfBirth': serializer.toJson<String>(dateOfBirth),
      'room': serializer.toJson<String>(room),
      'photoUrl': serializer.toJson<String?>(photoUrl),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'createdById': serializer.toJson<String?>(createdById),
      'updatedById': serializer.toJson<String?>(updatedById),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  ChildRow copyWith({
    String? id,
    String? homeId,
    String? name,
    String? dateOfBirth,
    String? room,
    Value<String?> photoUrl = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> createdById = const Value.absent(),
    Value<String?> updatedById = const Value.absent(),
    bool? isSynced,
  }) => ChildRow(
    id: id ?? this.id,
    homeId: homeId ?? this.homeId,
    name: name ?? this.name,
    dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    room: room ?? this.room,
    photoUrl: photoUrl.present ? photoUrl.value : this.photoUrl,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    createdById: createdById.present ? createdById.value : this.createdById,
    updatedById: updatedById.present ? updatedById.value : this.updatedById,
    isSynced: isSynced ?? this.isSynced,
  );
  ChildRow copyWithCompanion(ChildrenTableCompanion data) {
    return ChildRow(
      id: data.id.present ? data.id.value : this.id,
      homeId: data.homeId.present ? data.homeId.value : this.homeId,
      name: data.name.present ? data.name.value : this.name,
      dateOfBirth: data.dateOfBirth.present
          ? data.dateOfBirth.value
          : this.dateOfBirth,
      room: data.room.present ? data.room.value : this.room,
      photoUrl: data.photoUrl.present ? data.photoUrl.value : this.photoUrl,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      createdById: data.createdById.present
          ? data.createdById.value
          : this.createdById,
      updatedById: data.updatedById.present
          ? data.updatedById.value
          : this.updatedById,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChildRow(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('name: $name, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('room: $room, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    homeId,
    name,
    dateOfBirth,
    room,
    photoUrl,
    notes,
    createdAt,
    updatedAt,
    deletedAt,
    createdById,
    updatedById,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChildRow &&
          other.id == this.id &&
          other.homeId == this.homeId &&
          other.name == this.name &&
          other.dateOfBirth == this.dateOfBirth &&
          other.room == this.room &&
          other.photoUrl == this.photoUrl &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.createdById == this.createdById &&
          other.updatedById == this.updatedById &&
          other.isSynced == this.isSynced);
}

class ChildrenTableCompanion extends UpdateCompanion<ChildRow> {
  final Value<String> id;
  final Value<String> homeId;
  final Value<String> name;
  final Value<String> dateOfBirth;
  final Value<String> room;
  final Value<String?> photoUrl;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String?> createdById;
  final Value<String?> updatedById;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const ChildrenTableCompanion({
    this.id = const Value.absent(),
    this.homeId = const Value.absent(),
    this.name = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.room = const Value.absent(),
    this.photoUrl = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChildrenTableCompanion.insert({
    required String id,
    required String homeId,
    required String name,
    required String dateOfBirth,
    required String room,
    this.photoUrl = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updatedById = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       homeId = Value(homeId),
       name = Value(name),
       dateOfBirth = Value(dateOfBirth),
       room = Value(room),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ChildRow> custom({
    Expression<String>? id,
    Expression<String>? homeId,
    Expression<String>? name,
    Expression<String>? dateOfBirth,
    Expression<String>? room,
    Expression<String>? photoUrl,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? createdById,
    Expression<String>? updatedById,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (homeId != null) 'home_id': homeId,
      if (name != null) 'name': name,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (room != null) 'room': room,
      if (photoUrl != null) 'photo_url': photoUrl,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (createdById != null) 'created_by_id': createdById,
      if (updatedById != null) 'updated_by_id': updatedById,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChildrenTableCompanion copyWith({
    Value<String>? id,
    Value<String>? homeId,
    Value<String>? name,
    Value<String>? dateOfBirth,
    Value<String>? room,
    Value<String?>? photoUrl,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String?>? createdById,
    Value<String?>? updatedById,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return ChildrenTableCompanion(
      id: id ?? this.id,
      homeId: homeId ?? this.homeId,
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      room: room ?? this.room,
      photoUrl: photoUrl ?? this.photoUrl,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      createdById: createdById ?? this.createdById,
      updatedById: updatedById ?? this.updatedById,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (homeId.present) {
      map['home_id'] = Variable<String>(homeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<String>(dateOfBirth.value);
    }
    if (room.present) {
      map['room'] = Variable<String>(room.value);
    }
    if (photoUrl.present) {
      map['photo_url'] = Variable<String>(photoUrl.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (updatedById.present) {
      map['updated_by_id'] = Variable<String>(updatedById.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChildrenTableCompanion(')
          ..write('id: $id, ')
          ..write('homeId: $homeId, ')
          ..write('name: $name, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('room: $room, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdById: $createdById, ')
          ..write('updatedById: $updatedById, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DailyNotesTableTable dailyNotesTable = $DailyNotesTableTable(
    this,
  );
  late final $ChecklistItemsTableTable checklistItemsTable =
      $ChecklistItemsTableTable(this);
  late final $AuditLogTableTable auditLogTable = $AuditLogTableTable(this);
  late final $BathTempRecordsTableTable bathTempRecordsTable =
      $BathTempRecordsTableTable(this);
  late final $VisitorLogTableTable visitorLogTable = $VisitorLogTableTable(
    this,
  );
  late final $CarePlansTableTable carePlansTable = $CarePlansTableTable(this);
  late final $CarePlanGoalsTableTable carePlanGoalsTable =
      $CarePlanGoalsTableTable(this);
  late final $PrescribedMedsTableTable prescribedMedsTable =
      $PrescribedMedsTableTable(this);
  late final $MedAdministrationsTableTable medAdministrationsTable =
      $MedAdministrationsTableTable(this);
  late final $MedicalProfileTableTable medicalProfileTable =
      $MedicalProfileTableTable(this);
  late final $HealthcareContactsTableTable healthcareContactsTable =
      $HealthcareContactsTableTable(this);
  late final $BehaviourIncidentsTableTable behaviourIncidentsTable =
      $BehaviourIncidentsTableTable(this);
  late final $SleepEntriesTableTable sleepEntriesTable =
      $SleepEntriesTableTable(this);
  late final $FoodEntriesTableTable foodEntriesTable = $FoodEntriesTableTable(
    this,
  );
  late final $ActivityEntriesTableTable activityEntriesTable =
      $ActivityEntriesTableTable(this);
  late final $SmartStepsTableTable smartStepsTable = $SmartStepsTableTable(
    this,
  );
  late final $StepProgressTableTable stepProgressTable =
      $StepProgressTableTable(this);
  late final $IncidentReportsTableTable incidentReportsTable =
      $IncidentReportsTableTable(this);
  late final $ChildrenTableTable childrenTable = $ChildrenTableTable(this);
  late final DailyNotesDao dailyNotesDao = DailyNotesDao(this as AppDatabase);
  late final ChecklistItemsDao checklistItemsDao = ChecklistItemsDao(
    this as AppDatabase,
  );
  late final AuditLogDao auditLogDao = AuditLogDao(this as AppDatabase);
  late final BathTempRecordsDao bathTempRecordsDao = BathTempRecordsDao(
    this as AppDatabase,
  );
  late final VisitorLogDao visitorLogDao = VisitorLogDao(this as AppDatabase);
  late final CarePlansDao carePlansDao = CarePlansDao(this as AppDatabase);
  late final MedicationDao medicationDao = MedicationDao(this as AppDatabase);
  late final MedicalHistoryDao medicalHistoryDao = MedicalHistoryDao(
    this as AppDatabase,
  );
  late final BehaviourIncidentsDao behaviourIncidentsDao =
      BehaviourIncidentsDao(this as AppDatabase);
  late final SleepEntriesDao sleepEntriesDao = SleepEntriesDao(
    this as AppDatabase,
  );
  late final FoodEntriesDao foodEntriesDao = FoodEntriesDao(
    this as AppDatabase,
  );
  late final ActivityEntriesDao activityEntriesDao = ActivityEntriesDao(
    this as AppDatabase,
  );
  late final SmartStepsDao smartStepsDao = SmartStepsDao(this as AppDatabase);
  late final IncidentReportsDao incidentReportsDao = IncidentReportsDao(
    this as AppDatabase,
  );
  late final ChildrenDao childrenDao = ChildrenDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    dailyNotesTable,
    checklistItemsTable,
    auditLogTable,
    bathTempRecordsTable,
    visitorLogTable,
    carePlansTable,
    carePlanGoalsTable,
    prescribedMedsTable,
    medAdministrationsTable,
    medicalProfileTable,
    healthcareContactsTable,
    behaviourIncidentsTable,
    sleepEntriesTable,
    foodEntriesTable,
    activityEntriesTable,
    smartStepsTable,
    stepProgressTable,
    incidentReportsTable,
    childrenTable,
  ];
}

typedef $$DailyNotesTableTableCreateCompanionBuilder =
    DailyNotesTableCompanion Function({
      required String id,
      required String homeId,
      required String childId,
      required String authorId,
      required String authorName,
      required String shift,
      required String content,
      required DateTime occurredAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> updatedById,
      Value<String?> updatedByName,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$DailyNotesTableTableUpdateCompanionBuilder =
    DailyNotesTableCompanion Function({
      Value<String> id,
      Value<String> homeId,
      Value<String> childId,
      Value<String> authorId,
      Value<String> authorName,
      Value<String> shift,
      Value<String> content,
      Value<DateTime> occurredAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> updatedById,
      Value<String?> updatedByName,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$DailyNotesTableTableFilterComposer
    extends Composer<_$AppDatabase, $DailyNotesTableTable> {
  $$DailyNotesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get authorId => $composableBuilder(
    column: $table.authorId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get authorName => $composableBuilder(
    column: $table.authorName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shift => $composableBuilder(
    column: $table.shift,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedByName => $composableBuilder(
    column: $table.updatedByName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DailyNotesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyNotesTableTable> {
  $$DailyNotesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get authorId => $composableBuilder(
    column: $table.authorId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get authorName => $composableBuilder(
    column: $table.authorName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shift => $composableBuilder(
    column: $table.shift,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedByName => $composableBuilder(
    column: $table.updatedByName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DailyNotesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyNotesTableTable> {
  $$DailyNotesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get homeId =>
      $composableBuilder(column: $table.homeId, builder: (column) => column);

  GeneratedColumn<String> get childId =>
      $composableBuilder(column: $table.childId, builder: (column) => column);

  GeneratedColumn<String> get authorId =>
      $composableBuilder(column: $table.authorId, builder: (column) => column);

  GeneratedColumn<String> get authorName => $composableBuilder(
    column: $table.authorName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get shift =>
      $composableBuilder(column: $table.shift, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedByName => $composableBuilder(
    column: $table.updatedByName,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$DailyNotesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DailyNotesTableTable,
          DailyNoteRow,
          $$DailyNotesTableTableFilterComposer,
          $$DailyNotesTableTableOrderingComposer,
          $$DailyNotesTableTableAnnotationComposer,
          $$DailyNotesTableTableCreateCompanionBuilder,
          $$DailyNotesTableTableUpdateCompanionBuilder,
          (
            DailyNoteRow,
            BaseReferences<_$AppDatabase, $DailyNotesTableTable, DailyNoteRow>,
          ),
          DailyNoteRow,
          PrefetchHooks Function()
        > {
  $$DailyNotesTableTableTableManager(
    _$AppDatabase db,
    $DailyNotesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyNotesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyNotesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyNotesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> homeId = const Value.absent(),
                Value<String> childId = const Value.absent(),
                Value<String> authorId = const Value.absent(),
                Value<String> authorName = const Value.absent(),
                Value<String> shift = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> occurredAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<String?> updatedByName = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DailyNotesTableCompanion(
                id: id,
                homeId: homeId,
                childId: childId,
                authorId: authorId,
                authorName: authorName,
                shift: shift,
                content: content,
                occurredAt: occurredAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                updatedById: updatedById,
                updatedByName: updatedByName,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String homeId,
                required String childId,
                required String authorId,
                required String authorName,
                required String shift,
                required String content,
                required DateTime occurredAt,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<String?> updatedByName = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DailyNotesTableCompanion.insert(
                id: id,
                homeId: homeId,
                childId: childId,
                authorId: authorId,
                authorName: authorName,
                shift: shift,
                content: content,
                occurredAt: occurredAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                updatedById: updatedById,
                updatedByName: updatedByName,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DailyNotesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DailyNotesTableTable,
      DailyNoteRow,
      $$DailyNotesTableTableFilterComposer,
      $$DailyNotesTableTableOrderingComposer,
      $$DailyNotesTableTableAnnotationComposer,
      $$DailyNotesTableTableCreateCompanionBuilder,
      $$DailyNotesTableTableUpdateCompanionBuilder,
      (
        DailyNoteRow,
        BaseReferences<_$AppDatabase, $DailyNotesTableTable, DailyNoteRow>,
      ),
      DailyNoteRow,
      PrefetchHooks Function()
    >;
typedef $$ChecklistItemsTableTableCreateCompanionBuilder =
    ChecklistItemsTableCompanion Function({
      required String id,
      required String homeId,
      Value<String?> childId,
      required String areaKey,
      required String areaLabel,
      required String taskKey,
      required String taskLabel,
      required String shift,
      required String date,
      Value<bool> isComplete,
      Value<DateTime?> completedAt,
      Value<String?> completedByName,
      Value<String?> createdById,
      Value<String?> updatedById,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$ChecklistItemsTableTableUpdateCompanionBuilder =
    ChecklistItemsTableCompanion Function({
      Value<String> id,
      Value<String> homeId,
      Value<String?> childId,
      Value<String> areaKey,
      Value<String> areaLabel,
      Value<String> taskKey,
      Value<String> taskLabel,
      Value<String> shift,
      Value<String> date,
      Value<bool> isComplete,
      Value<DateTime?> completedAt,
      Value<String?> completedByName,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$ChecklistItemsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ChecklistItemsTableTable> {
  $$ChecklistItemsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get areaKey => $composableBuilder(
    column: $table.areaKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get areaLabel => $composableBuilder(
    column: $table.areaLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get taskKey => $composableBuilder(
    column: $table.taskKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get taskLabel => $composableBuilder(
    column: $table.taskLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shift => $composableBuilder(
    column: $table.shift,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isComplete => $composableBuilder(
    column: $table.isComplete,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get completedByName => $composableBuilder(
    column: $table.completedByName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ChecklistItemsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ChecklistItemsTableTable> {
  $$ChecklistItemsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get areaKey => $composableBuilder(
    column: $table.areaKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get areaLabel => $composableBuilder(
    column: $table.areaLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get taskKey => $composableBuilder(
    column: $table.taskKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get taskLabel => $composableBuilder(
    column: $table.taskLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shift => $composableBuilder(
    column: $table.shift,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isComplete => $composableBuilder(
    column: $table.isComplete,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get completedByName => $composableBuilder(
    column: $table.completedByName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChecklistItemsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChecklistItemsTableTable> {
  $$ChecklistItemsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get homeId =>
      $composableBuilder(column: $table.homeId, builder: (column) => column);

  GeneratedColumn<String> get childId =>
      $composableBuilder(column: $table.childId, builder: (column) => column);

  GeneratedColumn<String> get areaKey =>
      $composableBuilder(column: $table.areaKey, builder: (column) => column);

  GeneratedColumn<String> get areaLabel =>
      $composableBuilder(column: $table.areaLabel, builder: (column) => column);

  GeneratedColumn<String> get taskKey =>
      $composableBuilder(column: $table.taskKey, builder: (column) => column);

  GeneratedColumn<String> get taskLabel =>
      $composableBuilder(column: $table.taskLabel, builder: (column) => column);

  GeneratedColumn<String> get shift =>
      $composableBuilder(column: $table.shift, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<bool> get isComplete => $composableBuilder(
    column: $table.isComplete,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get completedByName => $composableBuilder(
    column: $table.completedByName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$ChecklistItemsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChecklistItemsTableTable,
          ChecklistItemRow,
          $$ChecklistItemsTableTableFilterComposer,
          $$ChecklistItemsTableTableOrderingComposer,
          $$ChecklistItemsTableTableAnnotationComposer,
          $$ChecklistItemsTableTableCreateCompanionBuilder,
          $$ChecklistItemsTableTableUpdateCompanionBuilder,
          (
            ChecklistItemRow,
            BaseReferences<
              _$AppDatabase,
              $ChecklistItemsTableTable,
              ChecklistItemRow
            >,
          ),
          ChecklistItemRow,
          PrefetchHooks Function()
        > {
  $$ChecklistItemsTableTableTableManager(
    _$AppDatabase db,
    $ChecklistItemsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChecklistItemsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChecklistItemsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ChecklistItemsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> homeId = const Value.absent(),
                Value<String?> childId = const Value.absent(),
                Value<String> areaKey = const Value.absent(),
                Value<String> areaLabel = const Value.absent(),
                Value<String> taskKey = const Value.absent(),
                Value<String> taskLabel = const Value.absent(),
                Value<String> shift = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<bool> isComplete = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<String?> completedByName = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChecklistItemsTableCompanion(
                id: id,
                homeId: homeId,
                childId: childId,
                areaKey: areaKey,
                areaLabel: areaLabel,
                taskKey: taskKey,
                taskLabel: taskLabel,
                shift: shift,
                date: date,
                isComplete: isComplete,
                completedAt: completedAt,
                completedByName: completedByName,
                createdById: createdById,
                updatedById: updatedById,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String homeId,
                Value<String?> childId = const Value.absent(),
                required String areaKey,
                required String areaLabel,
                required String taskKey,
                required String taskLabel,
                required String shift,
                required String date,
                Value<bool> isComplete = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<String?> completedByName = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChecklistItemsTableCompanion.insert(
                id: id,
                homeId: homeId,
                childId: childId,
                areaKey: areaKey,
                areaLabel: areaLabel,
                taskKey: taskKey,
                taskLabel: taskLabel,
                shift: shift,
                date: date,
                isComplete: isComplete,
                completedAt: completedAt,
                completedByName: completedByName,
                createdById: createdById,
                updatedById: updatedById,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ChecklistItemsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChecklistItemsTableTable,
      ChecklistItemRow,
      $$ChecklistItemsTableTableFilterComposer,
      $$ChecklistItemsTableTableOrderingComposer,
      $$ChecklistItemsTableTableAnnotationComposer,
      $$ChecklistItemsTableTableCreateCompanionBuilder,
      $$ChecklistItemsTableTableUpdateCompanionBuilder,
      (
        ChecklistItemRow,
        BaseReferences<
          _$AppDatabase,
          $ChecklistItemsTableTable,
          ChecklistItemRow
        >,
      ),
      ChecklistItemRow,
      PrefetchHooks Function()
    >;
typedef $$AuditLogTableTableCreateCompanionBuilder =
    AuditLogTableCompanion Function({
      required String id,
      required String userId,
      required String userDisplayName,
      required String homeId,
      required String action,
      required String entityTable,
      required String recordId,
      Value<String?> before,
      Value<String?> after,
      required DateTime timestamp,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$AuditLogTableTableUpdateCompanionBuilder =
    AuditLogTableCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> userDisplayName,
      Value<String> homeId,
      Value<String> action,
      Value<String> entityTable,
      Value<String> recordId,
      Value<String?> before,
      Value<String?> after,
      Value<DateTime> timestamp,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$AuditLogTableTableFilterComposer
    extends Composer<_$AppDatabase, $AuditLogTableTable> {
  $$AuditLogTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userDisplayName => $composableBuilder(
    column: $table.userDisplayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityTable => $composableBuilder(
    column: $table.entityTable,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordId => $composableBuilder(
    column: $table.recordId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get before => $composableBuilder(
    column: $table.before,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get after => $composableBuilder(
    column: $table.after,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AuditLogTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AuditLogTableTable> {
  $$AuditLogTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userDisplayName => $composableBuilder(
    column: $table.userDisplayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityTable => $composableBuilder(
    column: $table.entityTable,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordId => $composableBuilder(
    column: $table.recordId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get before => $composableBuilder(
    column: $table.before,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get after => $composableBuilder(
    column: $table.after,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AuditLogTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuditLogTableTable> {
  $$AuditLogTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get userDisplayName => $composableBuilder(
    column: $table.userDisplayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get homeId =>
      $composableBuilder(column: $table.homeId, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get entityTable => $composableBuilder(
    column: $table.entityTable,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recordId =>
      $composableBuilder(column: $table.recordId, builder: (column) => column);

  GeneratedColumn<String> get before =>
      $composableBuilder(column: $table.before, builder: (column) => column);

  GeneratedColumn<String> get after =>
      $composableBuilder(column: $table.after, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$AuditLogTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuditLogTableTable,
          AuditLogRow,
          $$AuditLogTableTableFilterComposer,
          $$AuditLogTableTableOrderingComposer,
          $$AuditLogTableTableAnnotationComposer,
          $$AuditLogTableTableCreateCompanionBuilder,
          $$AuditLogTableTableUpdateCompanionBuilder,
          (
            AuditLogRow,
            BaseReferences<_$AppDatabase, $AuditLogTableTable, AuditLogRow>,
          ),
          AuditLogRow,
          PrefetchHooks Function()
        > {
  $$AuditLogTableTableTableManager(_$AppDatabase db, $AuditLogTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditLogTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditLogTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditLogTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> userDisplayName = const Value.absent(),
                Value<String> homeId = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<String> entityTable = const Value.absent(),
                Value<String> recordId = const Value.absent(),
                Value<String?> before = const Value.absent(),
                Value<String?> after = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AuditLogTableCompanion(
                id: id,
                userId: userId,
                userDisplayName: userDisplayName,
                homeId: homeId,
                action: action,
                entityTable: entityTable,
                recordId: recordId,
                before: before,
                after: after,
                timestamp: timestamp,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String userDisplayName,
                required String homeId,
                required String action,
                required String entityTable,
                required String recordId,
                Value<String?> before = const Value.absent(),
                Value<String?> after = const Value.absent(),
                required DateTime timestamp,
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AuditLogTableCompanion.insert(
                id: id,
                userId: userId,
                userDisplayName: userDisplayName,
                homeId: homeId,
                action: action,
                entityTable: entityTable,
                recordId: recordId,
                before: before,
                after: after,
                timestamp: timestamp,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AuditLogTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuditLogTableTable,
      AuditLogRow,
      $$AuditLogTableTableFilterComposer,
      $$AuditLogTableTableOrderingComposer,
      $$AuditLogTableTableAnnotationComposer,
      $$AuditLogTableTableCreateCompanionBuilder,
      $$AuditLogTableTableUpdateCompanionBuilder,
      (
        AuditLogRow,
        BaseReferences<_$AppDatabase, $AuditLogTableTable, AuditLogRow>,
      ),
      AuditLogRow,
      PrefetchHooks Function()
    >;
typedef $$BathTempRecordsTableTableCreateCompanionBuilder =
    BathTempRecordsTableCompanion Function({
      required String id,
      required String homeId,
      required String childId,
      required double temperatureCelsius,
      required String shift,
      required DateTime recordedAt,
      required String recordedById,
      required String recordedByName,
      Value<String?> notes,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$BathTempRecordsTableTableUpdateCompanionBuilder =
    BathTempRecordsTableCompanion Function({
      Value<String> id,
      Value<String> homeId,
      Value<String> childId,
      Value<double> temperatureCelsius,
      Value<String> shift,
      Value<DateTime> recordedAt,
      Value<String> recordedById,
      Value<String> recordedByName,
      Value<String?> notes,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$BathTempRecordsTableTableFilterComposer
    extends Composer<_$AppDatabase, $BathTempRecordsTableTable> {
  $$BathTempRecordsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get temperatureCelsius => $composableBuilder(
    column: $table.temperatureCelsius,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shift => $composableBuilder(
    column: $table.shift,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordedById => $composableBuilder(
    column: $table.recordedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordedByName => $composableBuilder(
    column: $table.recordedByName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BathTempRecordsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BathTempRecordsTableTable> {
  $$BathTempRecordsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get temperatureCelsius => $composableBuilder(
    column: $table.temperatureCelsius,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shift => $composableBuilder(
    column: $table.shift,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordedById => $composableBuilder(
    column: $table.recordedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordedByName => $composableBuilder(
    column: $table.recordedByName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BathTempRecordsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BathTempRecordsTableTable> {
  $$BathTempRecordsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get homeId =>
      $composableBuilder(column: $table.homeId, builder: (column) => column);

  GeneratedColumn<String> get childId =>
      $composableBuilder(column: $table.childId, builder: (column) => column);

  GeneratedColumn<double> get temperatureCelsius => $composableBuilder(
    column: $table.temperatureCelsius,
    builder: (column) => column,
  );

  GeneratedColumn<String> get shift =>
      $composableBuilder(column: $table.shift, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recordedById => $composableBuilder(
    column: $table.recordedById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recordedByName => $composableBuilder(
    column: $table.recordedByName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$BathTempRecordsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BathTempRecordsTableTable,
          BathTempRow,
          $$BathTempRecordsTableTableFilterComposer,
          $$BathTempRecordsTableTableOrderingComposer,
          $$BathTempRecordsTableTableAnnotationComposer,
          $$BathTempRecordsTableTableCreateCompanionBuilder,
          $$BathTempRecordsTableTableUpdateCompanionBuilder,
          (
            BathTempRow,
            BaseReferences<
              _$AppDatabase,
              $BathTempRecordsTableTable,
              BathTempRow
            >,
          ),
          BathTempRow,
          PrefetchHooks Function()
        > {
  $$BathTempRecordsTableTableTableManager(
    _$AppDatabase db,
    $BathTempRecordsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BathTempRecordsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BathTempRecordsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$BathTempRecordsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> homeId = const Value.absent(),
                Value<String> childId = const Value.absent(),
                Value<double> temperatureCelsius = const Value.absent(),
                Value<String> shift = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
                Value<String> recordedById = const Value.absent(),
                Value<String> recordedByName = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BathTempRecordsTableCompanion(
                id: id,
                homeId: homeId,
                childId: childId,
                temperatureCelsius: temperatureCelsius,
                shift: shift,
                recordedAt: recordedAt,
                recordedById: recordedById,
                recordedByName: recordedByName,
                notes: notes,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String homeId,
                required String childId,
                required double temperatureCelsius,
                required String shift,
                required DateTime recordedAt,
                required String recordedById,
                required String recordedByName,
                Value<String?> notes = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BathTempRecordsTableCompanion.insert(
                id: id,
                homeId: homeId,
                childId: childId,
                temperatureCelsius: temperatureCelsius,
                shift: shift,
                recordedAt: recordedAt,
                recordedById: recordedById,
                recordedByName: recordedByName,
                notes: notes,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BathTempRecordsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BathTempRecordsTableTable,
      BathTempRow,
      $$BathTempRecordsTableTableFilterComposer,
      $$BathTempRecordsTableTableOrderingComposer,
      $$BathTempRecordsTableTableAnnotationComposer,
      $$BathTempRecordsTableTableCreateCompanionBuilder,
      $$BathTempRecordsTableTableUpdateCompanionBuilder,
      (
        BathTempRow,
        BaseReferences<_$AppDatabase, $BathTempRecordsTableTable, BathTempRow>,
      ),
      BathTempRow,
      PrefetchHooks Function()
    >;
typedef $$VisitorLogTableTableCreateCompanionBuilder =
    VisitorLogTableCompanion Function({
      required String id,
      required String homeId,
      required String visitorName,
      Value<String?> relation,
      required String purpose,
      required String authorisedBy,
      required DateTime arrivedAt,
      Value<DateTime?> departedAt,
      Value<String?> notes,
      required String recordedById,
      required String recordedByName,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$VisitorLogTableTableUpdateCompanionBuilder =
    VisitorLogTableCompanion Function({
      Value<String> id,
      Value<String> homeId,
      Value<String> visitorName,
      Value<String?> relation,
      Value<String> purpose,
      Value<String> authorisedBy,
      Value<DateTime> arrivedAt,
      Value<DateTime?> departedAt,
      Value<String?> notes,
      Value<String> recordedById,
      Value<String> recordedByName,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$VisitorLogTableTableFilterComposer
    extends Composer<_$AppDatabase, $VisitorLogTableTable> {
  $$VisitorLogTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get visitorName => $composableBuilder(
    column: $table.visitorName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relation => $composableBuilder(
    column: $table.relation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get purpose => $composableBuilder(
    column: $table.purpose,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get authorisedBy => $composableBuilder(
    column: $table.authorisedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get arrivedAt => $composableBuilder(
    column: $table.arrivedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get departedAt => $composableBuilder(
    column: $table.departedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordedById => $composableBuilder(
    column: $table.recordedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordedByName => $composableBuilder(
    column: $table.recordedByName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$VisitorLogTableTableOrderingComposer
    extends Composer<_$AppDatabase, $VisitorLogTableTable> {
  $$VisitorLogTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get visitorName => $composableBuilder(
    column: $table.visitorName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relation => $composableBuilder(
    column: $table.relation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get purpose => $composableBuilder(
    column: $table.purpose,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get authorisedBy => $composableBuilder(
    column: $table.authorisedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get arrivedAt => $composableBuilder(
    column: $table.arrivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get departedAt => $composableBuilder(
    column: $table.departedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordedById => $composableBuilder(
    column: $table.recordedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordedByName => $composableBuilder(
    column: $table.recordedByName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VisitorLogTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $VisitorLogTableTable> {
  $$VisitorLogTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get homeId =>
      $composableBuilder(column: $table.homeId, builder: (column) => column);

  GeneratedColumn<String> get visitorName => $composableBuilder(
    column: $table.visitorName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get relation =>
      $composableBuilder(column: $table.relation, builder: (column) => column);

  GeneratedColumn<String> get purpose =>
      $composableBuilder(column: $table.purpose, builder: (column) => column);

  GeneratedColumn<String> get authorisedBy => $composableBuilder(
    column: $table.authorisedBy,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get arrivedAt =>
      $composableBuilder(column: $table.arrivedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get departedAt => $composableBuilder(
    column: $table.departedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get recordedById => $composableBuilder(
    column: $table.recordedById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recordedByName => $composableBuilder(
    column: $table.recordedByName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$VisitorLogTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VisitorLogTableTable,
          VisitorLogRow,
          $$VisitorLogTableTableFilterComposer,
          $$VisitorLogTableTableOrderingComposer,
          $$VisitorLogTableTableAnnotationComposer,
          $$VisitorLogTableTableCreateCompanionBuilder,
          $$VisitorLogTableTableUpdateCompanionBuilder,
          (
            VisitorLogRow,
            BaseReferences<_$AppDatabase, $VisitorLogTableTable, VisitorLogRow>,
          ),
          VisitorLogRow,
          PrefetchHooks Function()
        > {
  $$VisitorLogTableTableTableManager(
    _$AppDatabase db,
    $VisitorLogTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VisitorLogTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VisitorLogTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VisitorLogTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> homeId = const Value.absent(),
                Value<String> visitorName = const Value.absent(),
                Value<String?> relation = const Value.absent(),
                Value<String> purpose = const Value.absent(),
                Value<String> authorisedBy = const Value.absent(),
                Value<DateTime> arrivedAt = const Value.absent(),
                Value<DateTime?> departedAt = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> recordedById = const Value.absent(),
                Value<String> recordedByName = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VisitorLogTableCompanion(
                id: id,
                homeId: homeId,
                visitorName: visitorName,
                relation: relation,
                purpose: purpose,
                authorisedBy: authorisedBy,
                arrivedAt: arrivedAt,
                departedAt: departedAt,
                notes: notes,
                recordedById: recordedById,
                recordedByName: recordedByName,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String homeId,
                required String visitorName,
                Value<String?> relation = const Value.absent(),
                required String purpose,
                required String authorisedBy,
                required DateTime arrivedAt,
                Value<DateTime?> departedAt = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required String recordedById,
                required String recordedByName,
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VisitorLogTableCompanion.insert(
                id: id,
                homeId: homeId,
                visitorName: visitorName,
                relation: relation,
                purpose: purpose,
                authorisedBy: authorisedBy,
                arrivedAt: arrivedAt,
                departedAt: departedAt,
                notes: notes,
                recordedById: recordedById,
                recordedByName: recordedByName,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$VisitorLogTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VisitorLogTableTable,
      VisitorLogRow,
      $$VisitorLogTableTableFilterComposer,
      $$VisitorLogTableTableOrderingComposer,
      $$VisitorLogTableTableAnnotationComposer,
      $$VisitorLogTableTableCreateCompanionBuilder,
      $$VisitorLogTableTableUpdateCompanionBuilder,
      (
        VisitorLogRow,
        BaseReferences<_$AppDatabase, $VisitorLogTableTable, VisitorLogRow>,
      ),
      VisitorLogRow,
      PrefetchHooks Function()
    >;
typedef $$CarePlansTableTableCreateCompanionBuilder =
    CarePlansTableCompanion Function({
      required String id,
      required String homeId,
      required String childId,
      required String title,
      required String status,
      Value<String?> reviewDate,
      Value<String?> notes,
      required String authorId,
      required String authorName,
      Value<String?> approvedById,
      Value<String?> approvedByName,
      Value<DateTime?> approvedAt,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$CarePlansTableTableUpdateCompanionBuilder =
    CarePlansTableCompanion Function({
      Value<String> id,
      Value<String> homeId,
      Value<String> childId,
      Value<String> title,
      Value<String> status,
      Value<String?> reviewDate,
      Value<String?> notes,
      Value<String> authorId,
      Value<String> authorName,
      Value<String?> approvedById,
      Value<String?> approvedByName,
      Value<DateTime?> approvedAt,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$CarePlansTableTableFilterComposer
    extends Composer<_$AppDatabase, $CarePlansTableTable> {
  $$CarePlansTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reviewDate => $composableBuilder(
    column: $table.reviewDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get authorId => $composableBuilder(
    column: $table.authorId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get authorName => $composableBuilder(
    column: $table.authorName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get approvedById => $composableBuilder(
    column: $table.approvedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get approvedByName => $composableBuilder(
    column: $table.approvedByName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get approvedAt => $composableBuilder(
    column: $table.approvedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CarePlansTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CarePlansTableTable> {
  $$CarePlansTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reviewDate => $composableBuilder(
    column: $table.reviewDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get authorId => $composableBuilder(
    column: $table.authorId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get authorName => $composableBuilder(
    column: $table.authorName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get approvedById => $composableBuilder(
    column: $table.approvedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get approvedByName => $composableBuilder(
    column: $table.approvedByName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get approvedAt => $composableBuilder(
    column: $table.approvedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CarePlansTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CarePlansTableTable> {
  $$CarePlansTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get homeId =>
      $composableBuilder(column: $table.homeId, builder: (column) => column);

  GeneratedColumn<String> get childId =>
      $composableBuilder(column: $table.childId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get reviewDate => $composableBuilder(
    column: $table.reviewDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get authorId =>
      $composableBuilder(column: $table.authorId, builder: (column) => column);

  GeneratedColumn<String> get authorName => $composableBuilder(
    column: $table.authorName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get approvedById => $composableBuilder(
    column: $table.approvedById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get approvedByName => $composableBuilder(
    column: $table.approvedByName,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get approvedAt => $composableBuilder(
    column: $table.approvedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$CarePlansTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CarePlansTableTable,
          CarePlanRow,
          $$CarePlansTableTableFilterComposer,
          $$CarePlansTableTableOrderingComposer,
          $$CarePlansTableTableAnnotationComposer,
          $$CarePlansTableTableCreateCompanionBuilder,
          $$CarePlansTableTableUpdateCompanionBuilder,
          (
            CarePlanRow,
            BaseReferences<_$AppDatabase, $CarePlansTableTable, CarePlanRow>,
          ),
          CarePlanRow,
          PrefetchHooks Function()
        > {
  $$CarePlansTableTableTableManager(
    _$AppDatabase db,
    $CarePlansTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CarePlansTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CarePlansTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CarePlansTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> homeId = const Value.absent(),
                Value<String> childId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> reviewDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> authorId = const Value.absent(),
                Value<String> authorName = const Value.absent(),
                Value<String?> approvedById = const Value.absent(),
                Value<String?> approvedByName = const Value.absent(),
                Value<DateTime?> approvedAt = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CarePlansTableCompanion(
                id: id,
                homeId: homeId,
                childId: childId,
                title: title,
                status: status,
                reviewDate: reviewDate,
                notes: notes,
                authorId: authorId,
                authorName: authorName,
                approvedById: approvedById,
                approvedByName: approvedByName,
                approvedAt: approvedAt,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String homeId,
                required String childId,
                required String title,
                required String status,
                Value<String?> reviewDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required String authorId,
                required String authorName,
                Value<String?> approvedById = const Value.absent(),
                Value<String?> approvedByName = const Value.absent(),
                Value<DateTime?> approvedAt = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CarePlansTableCompanion.insert(
                id: id,
                homeId: homeId,
                childId: childId,
                title: title,
                status: status,
                reviewDate: reviewDate,
                notes: notes,
                authorId: authorId,
                authorName: authorName,
                approvedById: approvedById,
                approvedByName: approvedByName,
                approvedAt: approvedAt,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CarePlansTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CarePlansTableTable,
      CarePlanRow,
      $$CarePlansTableTableFilterComposer,
      $$CarePlansTableTableOrderingComposer,
      $$CarePlansTableTableAnnotationComposer,
      $$CarePlansTableTableCreateCompanionBuilder,
      $$CarePlansTableTableUpdateCompanionBuilder,
      (
        CarePlanRow,
        BaseReferences<_$AppDatabase, $CarePlansTableTable, CarePlanRow>,
      ),
      CarePlanRow,
      PrefetchHooks Function()
    >;
typedef $$CarePlanGoalsTableTableCreateCompanionBuilder =
    CarePlanGoalsTableCompanion Function({
      required String id,
      required String carePlanId,
      required String homeId,
      required String childId,
      required String category,
      required String title,
      Value<String?> description,
      Value<String?> strategy,
      Value<String?> targetDate,
      required String status,
      Value<String?> progressNotes,
      Value<int> sortOrder,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$CarePlanGoalsTableTableUpdateCompanionBuilder =
    CarePlanGoalsTableCompanion Function({
      Value<String> id,
      Value<String> carePlanId,
      Value<String> homeId,
      Value<String> childId,
      Value<String> category,
      Value<String> title,
      Value<String?> description,
      Value<String?> strategy,
      Value<String?> targetDate,
      Value<String> status,
      Value<String?> progressNotes,
      Value<int> sortOrder,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$CarePlanGoalsTableTableFilterComposer
    extends Composer<_$AppDatabase, $CarePlanGoalsTableTable> {
  $$CarePlanGoalsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get carePlanId => $composableBuilder(
    column: $table.carePlanId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strategy => $composableBuilder(
    column: $table.strategy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get progressNotes => $composableBuilder(
    column: $table.progressNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CarePlanGoalsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CarePlanGoalsTableTable> {
  $$CarePlanGoalsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get carePlanId => $composableBuilder(
    column: $table.carePlanId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strategy => $composableBuilder(
    column: $table.strategy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get progressNotes => $composableBuilder(
    column: $table.progressNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CarePlanGoalsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CarePlanGoalsTableTable> {
  $$CarePlanGoalsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get carePlanId => $composableBuilder(
    column: $table.carePlanId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get homeId =>
      $composableBuilder(column: $table.homeId, builder: (column) => column);

  GeneratedColumn<String> get childId =>
      $composableBuilder(column: $table.childId, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get strategy =>
      $composableBuilder(column: $table.strategy, builder: (column) => column);

  GeneratedColumn<String> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get progressNotes => $composableBuilder(
    column: $table.progressNotes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$CarePlanGoalsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CarePlanGoalsTableTable,
          CarePlanGoalRow,
          $$CarePlanGoalsTableTableFilterComposer,
          $$CarePlanGoalsTableTableOrderingComposer,
          $$CarePlanGoalsTableTableAnnotationComposer,
          $$CarePlanGoalsTableTableCreateCompanionBuilder,
          $$CarePlanGoalsTableTableUpdateCompanionBuilder,
          (
            CarePlanGoalRow,
            BaseReferences<
              _$AppDatabase,
              $CarePlanGoalsTableTable,
              CarePlanGoalRow
            >,
          ),
          CarePlanGoalRow,
          PrefetchHooks Function()
        > {
  $$CarePlanGoalsTableTableTableManager(
    _$AppDatabase db,
    $CarePlanGoalsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CarePlanGoalsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CarePlanGoalsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CarePlanGoalsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> carePlanId = const Value.absent(),
                Value<String> homeId = const Value.absent(),
                Value<String> childId = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> strategy = const Value.absent(),
                Value<String?> targetDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> progressNotes = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CarePlanGoalsTableCompanion(
                id: id,
                carePlanId: carePlanId,
                homeId: homeId,
                childId: childId,
                category: category,
                title: title,
                description: description,
                strategy: strategy,
                targetDate: targetDate,
                status: status,
                progressNotes: progressNotes,
                sortOrder: sortOrder,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String carePlanId,
                required String homeId,
                required String childId,
                required String category,
                required String title,
                Value<String?> description = const Value.absent(),
                Value<String?> strategy = const Value.absent(),
                Value<String?> targetDate = const Value.absent(),
                required String status,
                Value<String?> progressNotes = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CarePlanGoalsTableCompanion.insert(
                id: id,
                carePlanId: carePlanId,
                homeId: homeId,
                childId: childId,
                category: category,
                title: title,
                description: description,
                strategy: strategy,
                targetDate: targetDate,
                status: status,
                progressNotes: progressNotes,
                sortOrder: sortOrder,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CarePlanGoalsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CarePlanGoalsTableTable,
      CarePlanGoalRow,
      $$CarePlanGoalsTableTableFilterComposer,
      $$CarePlanGoalsTableTableOrderingComposer,
      $$CarePlanGoalsTableTableAnnotationComposer,
      $$CarePlanGoalsTableTableCreateCompanionBuilder,
      $$CarePlanGoalsTableTableUpdateCompanionBuilder,
      (
        CarePlanGoalRow,
        BaseReferences<
          _$AppDatabase,
          $CarePlanGoalsTableTable,
          CarePlanGoalRow
        >,
      ),
      CarePlanGoalRow,
      PrefetchHooks Function()
    >;
typedef $$PrescribedMedsTableTableCreateCompanionBuilder =
    PrescribedMedsTableCompanion Function({
      required String id,
      required String homeId,
      required String childId,
      required String medicationName,
      required String dose,
      required String route,
      required String frequency,
      Value<String?> instructions,
      Value<String?> prescribedBy,
      required String startDate,
      Value<String?> endDate,
      Value<bool> isActive,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$PrescribedMedsTableTableUpdateCompanionBuilder =
    PrescribedMedsTableCompanion Function({
      Value<String> id,
      Value<String> homeId,
      Value<String> childId,
      Value<String> medicationName,
      Value<String> dose,
      Value<String> route,
      Value<String> frequency,
      Value<String?> instructions,
      Value<String?> prescribedBy,
      Value<String> startDate,
      Value<String?> endDate,
      Value<bool> isActive,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$PrescribedMedsTableTableFilterComposer
    extends Composer<_$AppDatabase, $PrescribedMedsTableTable> {
  $$PrescribedMedsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get medicationName => $composableBuilder(
    column: $table.medicationName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dose => $composableBuilder(
    column: $table.dose,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get route => $composableBuilder(
    column: $table.route,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prescribedBy => $composableBuilder(
    column: $table.prescribedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PrescribedMedsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PrescribedMedsTableTable> {
  $$PrescribedMedsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get medicationName => $composableBuilder(
    column: $table.medicationName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dose => $composableBuilder(
    column: $table.dose,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get route => $composableBuilder(
    column: $table.route,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prescribedBy => $composableBuilder(
    column: $table.prescribedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PrescribedMedsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PrescribedMedsTableTable> {
  $$PrescribedMedsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get homeId =>
      $composableBuilder(column: $table.homeId, builder: (column) => column);

  GeneratedColumn<String> get childId =>
      $composableBuilder(column: $table.childId, builder: (column) => column);

  GeneratedColumn<String> get medicationName => $composableBuilder(
    column: $table.medicationName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dose =>
      $composableBuilder(column: $table.dose, builder: (column) => column);

  GeneratedColumn<String> get route =>
      $composableBuilder(column: $table.route, builder: (column) => column);

  GeneratedColumn<String> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  GeneratedColumn<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get prescribedBy => $composableBuilder(
    column: $table.prescribedBy,
    builder: (column) => column,
  );

  GeneratedColumn<String> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<String> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$PrescribedMedsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PrescribedMedsTableTable,
          PrescribedMedRow,
          $$PrescribedMedsTableTableFilterComposer,
          $$PrescribedMedsTableTableOrderingComposer,
          $$PrescribedMedsTableTableAnnotationComposer,
          $$PrescribedMedsTableTableCreateCompanionBuilder,
          $$PrescribedMedsTableTableUpdateCompanionBuilder,
          (
            PrescribedMedRow,
            BaseReferences<
              _$AppDatabase,
              $PrescribedMedsTableTable,
              PrescribedMedRow
            >,
          ),
          PrescribedMedRow,
          PrefetchHooks Function()
        > {
  $$PrescribedMedsTableTableTableManager(
    _$AppDatabase db,
    $PrescribedMedsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrescribedMedsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrescribedMedsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PrescribedMedsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> homeId = const Value.absent(),
                Value<String> childId = const Value.absent(),
                Value<String> medicationName = const Value.absent(),
                Value<String> dose = const Value.absent(),
                Value<String> route = const Value.absent(),
                Value<String> frequency = const Value.absent(),
                Value<String?> instructions = const Value.absent(),
                Value<String?> prescribedBy = const Value.absent(),
                Value<String> startDate = const Value.absent(),
                Value<String?> endDate = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PrescribedMedsTableCompanion(
                id: id,
                homeId: homeId,
                childId: childId,
                medicationName: medicationName,
                dose: dose,
                route: route,
                frequency: frequency,
                instructions: instructions,
                prescribedBy: prescribedBy,
                startDate: startDate,
                endDate: endDate,
                isActive: isActive,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String homeId,
                required String childId,
                required String medicationName,
                required String dose,
                required String route,
                required String frequency,
                Value<String?> instructions = const Value.absent(),
                Value<String?> prescribedBy = const Value.absent(),
                required String startDate,
                Value<String?> endDate = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PrescribedMedsTableCompanion.insert(
                id: id,
                homeId: homeId,
                childId: childId,
                medicationName: medicationName,
                dose: dose,
                route: route,
                frequency: frequency,
                instructions: instructions,
                prescribedBy: prescribedBy,
                startDate: startDate,
                endDate: endDate,
                isActive: isActive,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PrescribedMedsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PrescribedMedsTableTable,
      PrescribedMedRow,
      $$PrescribedMedsTableTableFilterComposer,
      $$PrescribedMedsTableTableOrderingComposer,
      $$PrescribedMedsTableTableAnnotationComposer,
      $$PrescribedMedsTableTableCreateCompanionBuilder,
      $$PrescribedMedsTableTableUpdateCompanionBuilder,
      (
        PrescribedMedRow,
        BaseReferences<
          _$AppDatabase,
          $PrescribedMedsTableTable,
          PrescribedMedRow
        >,
      ),
      PrescribedMedRow,
      PrefetchHooks Function()
    >;
typedef $$MedAdministrationsTableTableCreateCompanionBuilder =
    MedAdministrationsTableCompanion Function({
      required String id,
      required String homeId,
      required String childId,
      required String prescribedMedId,
      required String medicationName,
      required String dose,
      required String outcome,
      required String shift,
      required DateTime administeredAt,
      required String administeredById,
      required String administeredByName,
      Value<String?> reason,
      Value<String?> notes,
      Value<String?> createdById,
      Value<String?> updatedById,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$MedAdministrationsTableTableUpdateCompanionBuilder =
    MedAdministrationsTableCompanion Function({
      Value<String> id,
      Value<String> homeId,
      Value<String> childId,
      Value<String> prescribedMedId,
      Value<String> medicationName,
      Value<String> dose,
      Value<String> outcome,
      Value<String> shift,
      Value<DateTime> administeredAt,
      Value<String> administeredById,
      Value<String> administeredByName,
      Value<String?> reason,
      Value<String?> notes,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$MedAdministrationsTableTableFilterComposer
    extends Composer<_$AppDatabase, $MedAdministrationsTableTable> {
  $$MedAdministrationsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prescribedMedId => $composableBuilder(
    column: $table.prescribedMedId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get medicationName => $composableBuilder(
    column: $table.medicationName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dose => $composableBuilder(
    column: $table.dose,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get outcome => $composableBuilder(
    column: $table.outcome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shift => $composableBuilder(
    column: $table.shift,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get administeredAt => $composableBuilder(
    column: $table.administeredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get administeredById => $composableBuilder(
    column: $table.administeredById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get administeredByName => $composableBuilder(
    column: $table.administeredByName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MedAdministrationsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MedAdministrationsTableTable> {
  $$MedAdministrationsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prescribedMedId => $composableBuilder(
    column: $table.prescribedMedId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get medicationName => $composableBuilder(
    column: $table.medicationName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dose => $composableBuilder(
    column: $table.dose,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get outcome => $composableBuilder(
    column: $table.outcome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shift => $composableBuilder(
    column: $table.shift,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get administeredAt => $composableBuilder(
    column: $table.administeredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get administeredById => $composableBuilder(
    column: $table.administeredById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get administeredByName => $composableBuilder(
    column: $table.administeredByName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MedAdministrationsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedAdministrationsTableTable> {
  $$MedAdministrationsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get homeId =>
      $composableBuilder(column: $table.homeId, builder: (column) => column);

  GeneratedColumn<String> get childId =>
      $composableBuilder(column: $table.childId, builder: (column) => column);

  GeneratedColumn<String> get prescribedMedId => $composableBuilder(
    column: $table.prescribedMedId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get medicationName => $composableBuilder(
    column: $table.medicationName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dose =>
      $composableBuilder(column: $table.dose, builder: (column) => column);

  GeneratedColumn<String> get outcome =>
      $composableBuilder(column: $table.outcome, builder: (column) => column);

  GeneratedColumn<String> get shift =>
      $composableBuilder(column: $table.shift, builder: (column) => column);

  GeneratedColumn<DateTime> get administeredAt => $composableBuilder(
    column: $table.administeredAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get administeredById => $composableBuilder(
    column: $table.administeredById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get administeredByName => $composableBuilder(
    column: $table.administeredByName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$MedAdministrationsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MedAdministrationsTableTable,
          MedAdministrationRow,
          $$MedAdministrationsTableTableFilterComposer,
          $$MedAdministrationsTableTableOrderingComposer,
          $$MedAdministrationsTableTableAnnotationComposer,
          $$MedAdministrationsTableTableCreateCompanionBuilder,
          $$MedAdministrationsTableTableUpdateCompanionBuilder,
          (
            MedAdministrationRow,
            BaseReferences<
              _$AppDatabase,
              $MedAdministrationsTableTable,
              MedAdministrationRow
            >,
          ),
          MedAdministrationRow,
          PrefetchHooks Function()
        > {
  $$MedAdministrationsTableTableTableManager(
    _$AppDatabase db,
    $MedAdministrationsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedAdministrationsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$MedAdministrationsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$MedAdministrationsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> homeId = const Value.absent(),
                Value<String> childId = const Value.absent(),
                Value<String> prescribedMedId = const Value.absent(),
                Value<String> medicationName = const Value.absent(),
                Value<String> dose = const Value.absent(),
                Value<String> outcome = const Value.absent(),
                Value<String> shift = const Value.absent(),
                Value<DateTime> administeredAt = const Value.absent(),
                Value<String> administeredById = const Value.absent(),
                Value<String> administeredByName = const Value.absent(),
                Value<String?> reason = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedAdministrationsTableCompanion(
                id: id,
                homeId: homeId,
                childId: childId,
                prescribedMedId: prescribedMedId,
                medicationName: medicationName,
                dose: dose,
                outcome: outcome,
                shift: shift,
                administeredAt: administeredAt,
                administeredById: administeredById,
                administeredByName: administeredByName,
                reason: reason,
                notes: notes,
                createdById: createdById,
                updatedById: updatedById,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String homeId,
                required String childId,
                required String prescribedMedId,
                required String medicationName,
                required String dose,
                required String outcome,
                required String shift,
                required DateTime administeredAt,
                required String administeredById,
                required String administeredByName,
                Value<String?> reason = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedAdministrationsTableCompanion.insert(
                id: id,
                homeId: homeId,
                childId: childId,
                prescribedMedId: prescribedMedId,
                medicationName: medicationName,
                dose: dose,
                outcome: outcome,
                shift: shift,
                administeredAt: administeredAt,
                administeredById: administeredById,
                administeredByName: administeredByName,
                reason: reason,
                notes: notes,
                createdById: createdById,
                updatedById: updatedById,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MedAdministrationsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MedAdministrationsTableTable,
      MedAdministrationRow,
      $$MedAdministrationsTableTableFilterComposer,
      $$MedAdministrationsTableTableOrderingComposer,
      $$MedAdministrationsTableTableAnnotationComposer,
      $$MedAdministrationsTableTableCreateCompanionBuilder,
      $$MedAdministrationsTableTableUpdateCompanionBuilder,
      (
        MedAdministrationRow,
        BaseReferences<
          _$AppDatabase,
          $MedAdministrationsTableTable,
          MedAdministrationRow
        >,
      ),
      MedAdministrationRow,
      PrefetchHooks Function()
    >;
typedef $$MedicalProfileTableTableCreateCompanionBuilder =
    MedicalProfileTableCompanion Function({
      required String id,
      required String homeId,
      required String childId,
      Value<String?> nhsNumber,
      Value<String?> bloodType,
      Value<String?> conditions,
      Value<String?> allergies,
      Value<String?> immunisationNotes,
      Value<String?> notes,
      Value<String?> createdById,
      Value<String?> updatedById,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$MedicalProfileTableTableUpdateCompanionBuilder =
    MedicalProfileTableCompanion Function({
      Value<String> id,
      Value<String> homeId,
      Value<String> childId,
      Value<String?> nhsNumber,
      Value<String?> bloodType,
      Value<String?> conditions,
      Value<String?> allergies,
      Value<String?> immunisationNotes,
      Value<String?> notes,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$MedicalProfileTableTableFilterComposer
    extends Composer<_$AppDatabase, $MedicalProfileTableTable> {
  $$MedicalProfileTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nhsNumber => $composableBuilder(
    column: $table.nhsNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bloodType => $composableBuilder(
    column: $table.bloodType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conditions => $composableBuilder(
    column: $table.conditions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get allergies => $composableBuilder(
    column: $table.allergies,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get immunisationNotes => $composableBuilder(
    column: $table.immunisationNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MedicalProfileTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicalProfileTableTable> {
  $$MedicalProfileTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nhsNumber => $composableBuilder(
    column: $table.nhsNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bloodType => $composableBuilder(
    column: $table.bloodType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conditions => $composableBuilder(
    column: $table.conditions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get allergies => $composableBuilder(
    column: $table.allergies,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get immunisationNotes => $composableBuilder(
    column: $table.immunisationNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MedicalProfileTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicalProfileTableTable> {
  $$MedicalProfileTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get homeId =>
      $composableBuilder(column: $table.homeId, builder: (column) => column);

  GeneratedColumn<String> get childId =>
      $composableBuilder(column: $table.childId, builder: (column) => column);

  GeneratedColumn<String> get nhsNumber =>
      $composableBuilder(column: $table.nhsNumber, builder: (column) => column);

  GeneratedColumn<String> get bloodType =>
      $composableBuilder(column: $table.bloodType, builder: (column) => column);

  GeneratedColumn<String> get conditions => $composableBuilder(
    column: $table.conditions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get allergies =>
      $composableBuilder(column: $table.allergies, builder: (column) => column);

  GeneratedColumn<String> get immunisationNotes => $composableBuilder(
    column: $table.immunisationNotes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$MedicalProfileTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MedicalProfileTableTable,
          MedicalProfileRow,
          $$MedicalProfileTableTableFilterComposer,
          $$MedicalProfileTableTableOrderingComposer,
          $$MedicalProfileTableTableAnnotationComposer,
          $$MedicalProfileTableTableCreateCompanionBuilder,
          $$MedicalProfileTableTableUpdateCompanionBuilder,
          (
            MedicalProfileRow,
            BaseReferences<
              _$AppDatabase,
              $MedicalProfileTableTable,
              MedicalProfileRow
            >,
          ),
          MedicalProfileRow,
          PrefetchHooks Function()
        > {
  $$MedicalProfileTableTableTableManager(
    _$AppDatabase db,
    $MedicalProfileTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicalProfileTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicalProfileTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$MedicalProfileTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> homeId = const Value.absent(),
                Value<String> childId = const Value.absent(),
                Value<String?> nhsNumber = const Value.absent(),
                Value<String?> bloodType = const Value.absent(),
                Value<String?> conditions = const Value.absent(),
                Value<String?> allergies = const Value.absent(),
                Value<String?> immunisationNotes = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicalProfileTableCompanion(
                id: id,
                homeId: homeId,
                childId: childId,
                nhsNumber: nhsNumber,
                bloodType: bloodType,
                conditions: conditions,
                allergies: allergies,
                immunisationNotes: immunisationNotes,
                notes: notes,
                createdById: createdById,
                updatedById: updatedById,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String homeId,
                required String childId,
                Value<String?> nhsNumber = const Value.absent(),
                Value<String?> bloodType = const Value.absent(),
                Value<String?> conditions = const Value.absent(),
                Value<String?> allergies = const Value.absent(),
                Value<String?> immunisationNotes = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicalProfileTableCompanion.insert(
                id: id,
                homeId: homeId,
                childId: childId,
                nhsNumber: nhsNumber,
                bloodType: bloodType,
                conditions: conditions,
                allergies: allergies,
                immunisationNotes: immunisationNotes,
                notes: notes,
                createdById: createdById,
                updatedById: updatedById,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MedicalProfileTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MedicalProfileTableTable,
      MedicalProfileRow,
      $$MedicalProfileTableTableFilterComposer,
      $$MedicalProfileTableTableOrderingComposer,
      $$MedicalProfileTableTableAnnotationComposer,
      $$MedicalProfileTableTableCreateCompanionBuilder,
      $$MedicalProfileTableTableUpdateCompanionBuilder,
      (
        MedicalProfileRow,
        BaseReferences<
          _$AppDatabase,
          $MedicalProfileTableTable,
          MedicalProfileRow
        >,
      ),
      MedicalProfileRow,
      PrefetchHooks Function()
    >;
typedef $$HealthcareContactsTableTableCreateCompanionBuilder =
    HealthcareContactsTableCompanion Function({
      required String id,
      required String homeId,
      required String childId,
      required String contactType,
      required String name,
      Value<String?> role,
      Value<String?> phone,
      Value<String?> email,
      Value<String?> address,
      Value<String?> notes,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$HealthcareContactsTableTableUpdateCompanionBuilder =
    HealthcareContactsTableCompanion Function({
      Value<String> id,
      Value<String> homeId,
      Value<String> childId,
      Value<String> contactType,
      Value<String> name,
      Value<String?> role,
      Value<String?> phone,
      Value<String?> email,
      Value<String?> address,
      Value<String?> notes,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$HealthcareContactsTableTableFilterComposer
    extends Composer<_$AppDatabase, $HealthcareContactsTableTable> {
  $$HealthcareContactsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contactType => $composableBuilder(
    column: $table.contactType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HealthcareContactsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $HealthcareContactsTableTable> {
  $$HealthcareContactsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contactType => $composableBuilder(
    column: $table.contactType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HealthcareContactsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $HealthcareContactsTableTable> {
  $$HealthcareContactsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get homeId =>
      $composableBuilder(column: $table.homeId, builder: (column) => column);

  GeneratedColumn<String> get childId =>
      $composableBuilder(column: $table.childId, builder: (column) => column);

  GeneratedColumn<String> get contactType => $composableBuilder(
    column: $table.contactType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$HealthcareContactsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HealthcareContactsTableTable,
          HealthcareContactRow,
          $$HealthcareContactsTableTableFilterComposer,
          $$HealthcareContactsTableTableOrderingComposer,
          $$HealthcareContactsTableTableAnnotationComposer,
          $$HealthcareContactsTableTableCreateCompanionBuilder,
          $$HealthcareContactsTableTableUpdateCompanionBuilder,
          (
            HealthcareContactRow,
            BaseReferences<
              _$AppDatabase,
              $HealthcareContactsTableTable,
              HealthcareContactRow
            >,
          ),
          HealthcareContactRow,
          PrefetchHooks Function()
        > {
  $$HealthcareContactsTableTableTableManager(
    _$AppDatabase db,
    $HealthcareContactsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HealthcareContactsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$HealthcareContactsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$HealthcareContactsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> homeId = const Value.absent(),
                Value<String> childId = const Value.absent(),
                Value<String> contactType = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> role = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HealthcareContactsTableCompanion(
                id: id,
                homeId: homeId,
                childId: childId,
                contactType: contactType,
                name: name,
                role: role,
                phone: phone,
                email: email,
                address: address,
                notes: notes,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String homeId,
                required String childId,
                required String contactType,
                required String name,
                Value<String?> role = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HealthcareContactsTableCompanion.insert(
                id: id,
                homeId: homeId,
                childId: childId,
                contactType: contactType,
                name: name,
                role: role,
                phone: phone,
                email: email,
                address: address,
                notes: notes,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HealthcareContactsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HealthcareContactsTableTable,
      HealthcareContactRow,
      $$HealthcareContactsTableTableFilterComposer,
      $$HealthcareContactsTableTableOrderingComposer,
      $$HealthcareContactsTableTableAnnotationComposer,
      $$HealthcareContactsTableTableCreateCompanionBuilder,
      $$HealthcareContactsTableTableUpdateCompanionBuilder,
      (
        HealthcareContactRow,
        BaseReferences<
          _$AppDatabase,
          $HealthcareContactsTableTable,
          HealthcareContactRow
        >,
      ),
      HealthcareContactRow,
      PrefetchHooks Function()
    >;
typedef $$BehaviourIncidentsTableTableCreateCompanionBuilder =
    BehaviourIncidentsTableCompanion Function({
      required String id,
      required String homeId,
      required String childId,
      required String shift,
      required DateTime occurredAt,
      required String severity,
      required String antecedent,
      required String behaviour,
      required String consequence,
      Value<int?> durationMinutes,
      Value<String?> location,
      Value<bool> physicalIntervention,
      Value<String?> interventionDetails,
      Value<bool> injuryOccurred,
      Value<String?> injuryDetails,
      Value<String?> notes,
      required String recordedById,
      required String recordedByName,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$BehaviourIncidentsTableTableUpdateCompanionBuilder =
    BehaviourIncidentsTableCompanion Function({
      Value<String> id,
      Value<String> homeId,
      Value<String> childId,
      Value<String> shift,
      Value<DateTime> occurredAt,
      Value<String> severity,
      Value<String> antecedent,
      Value<String> behaviour,
      Value<String> consequence,
      Value<int?> durationMinutes,
      Value<String?> location,
      Value<bool> physicalIntervention,
      Value<String?> interventionDetails,
      Value<bool> injuryOccurred,
      Value<String?> injuryDetails,
      Value<String?> notes,
      Value<String> recordedById,
      Value<String> recordedByName,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$BehaviourIncidentsTableTableFilterComposer
    extends Composer<_$AppDatabase, $BehaviourIncidentsTableTable> {
  $$BehaviourIncidentsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shift => $composableBuilder(
    column: $table.shift,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get severity => $composableBuilder(
    column: $table.severity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get antecedent => $composableBuilder(
    column: $table.antecedent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get behaviour => $composableBuilder(
    column: $table.behaviour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get consequence => $composableBuilder(
    column: $table.consequence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get physicalIntervention => $composableBuilder(
    column: $table.physicalIntervention,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get interventionDetails => $composableBuilder(
    column: $table.interventionDetails,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get injuryOccurred => $composableBuilder(
    column: $table.injuryOccurred,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get injuryDetails => $composableBuilder(
    column: $table.injuryDetails,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordedById => $composableBuilder(
    column: $table.recordedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordedByName => $composableBuilder(
    column: $table.recordedByName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BehaviourIncidentsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BehaviourIncidentsTableTable> {
  $$BehaviourIncidentsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shift => $composableBuilder(
    column: $table.shift,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get severity => $composableBuilder(
    column: $table.severity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get antecedent => $composableBuilder(
    column: $table.antecedent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get behaviour => $composableBuilder(
    column: $table.behaviour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get consequence => $composableBuilder(
    column: $table.consequence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get physicalIntervention => $composableBuilder(
    column: $table.physicalIntervention,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get interventionDetails => $composableBuilder(
    column: $table.interventionDetails,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get injuryOccurred => $composableBuilder(
    column: $table.injuryOccurred,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get injuryDetails => $composableBuilder(
    column: $table.injuryDetails,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordedById => $composableBuilder(
    column: $table.recordedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordedByName => $composableBuilder(
    column: $table.recordedByName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BehaviourIncidentsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BehaviourIncidentsTableTable> {
  $$BehaviourIncidentsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get homeId =>
      $composableBuilder(column: $table.homeId, builder: (column) => column);

  GeneratedColumn<String> get childId =>
      $composableBuilder(column: $table.childId, builder: (column) => column);

  GeneratedColumn<String> get shift =>
      $composableBuilder(column: $table.shift, builder: (column) => column);

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get severity =>
      $composableBuilder(column: $table.severity, builder: (column) => column);

  GeneratedColumn<String> get antecedent => $composableBuilder(
    column: $table.antecedent,
    builder: (column) => column,
  );

  GeneratedColumn<String> get behaviour =>
      $composableBuilder(column: $table.behaviour, builder: (column) => column);

  GeneratedColumn<String> get consequence => $composableBuilder(
    column: $table.consequence,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<bool> get physicalIntervention => $composableBuilder(
    column: $table.physicalIntervention,
    builder: (column) => column,
  );

  GeneratedColumn<String> get interventionDetails => $composableBuilder(
    column: $table.interventionDetails,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get injuryOccurred => $composableBuilder(
    column: $table.injuryOccurred,
    builder: (column) => column,
  );

  GeneratedColumn<String> get injuryDetails => $composableBuilder(
    column: $table.injuryDetails,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get recordedById => $composableBuilder(
    column: $table.recordedById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recordedByName => $composableBuilder(
    column: $table.recordedByName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$BehaviourIncidentsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BehaviourIncidentsTableTable,
          BehaviourIncidentRow,
          $$BehaviourIncidentsTableTableFilterComposer,
          $$BehaviourIncidentsTableTableOrderingComposer,
          $$BehaviourIncidentsTableTableAnnotationComposer,
          $$BehaviourIncidentsTableTableCreateCompanionBuilder,
          $$BehaviourIncidentsTableTableUpdateCompanionBuilder,
          (
            BehaviourIncidentRow,
            BaseReferences<
              _$AppDatabase,
              $BehaviourIncidentsTableTable,
              BehaviourIncidentRow
            >,
          ),
          BehaviourIncidentRow,
          PrefetchHooks Function()
        > {
  $$BehaviourIncidentsTableTableTableManager(
    _$AppDatabase db,
    $BehaviourIncidentsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BehaviourIncidentsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$BehaviourIncidentsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$BehaviourIncidentsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> homeId = const Value.absent(),
                Value<String> childId = const Value.absent(),
                Value<String> shift = const Value.absent(),
                Value<DateTime> occurredAt = const Value.absent(),
                Value<String> severity = const Value.absent(),
                Value<String> antecedent = const Value.absent(),
                Value<String> behaviour = const Value.absent(),
                Value<String> consequence = const Value.absent(),
                Value<int?> durationMinutes = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<bool> physicalIntervention = const Value.absent(),
                Value<String?> interventionDetails = const Value.absent(),
                Value<bool> injuryOccurred = const Value.absent(),
                Value<String?> injuryDetails = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> recordedById = const Value.absent(),
                Value<String> recordedByName = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BehaviourIncidentsTableCompanion(
                id: id,
                homeId: homeId,
                childId: childId,
                shift: shift,
                occurredAt: occurredAt,
                severity: severity,
                antecedent: antecedent,
                behaviour: behaviour,
                consequence: consequence,
                durationMinutes: durationMinutes,
                location: location,
                physicalIntervention: physicalIntervention,
                interventionDetails: interventionDetails,
                injuryOccurred: injuryOccurred,
                injuryDetails: injuryDetails,
                notes: notes,
                recordedById: recordedById,
                recordedByName: recordedByName,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String homeId,
                required String childId,
                required String shift,
                required DateTime occurredAt,
                required String severity,
                required String antecedent,
                required String behaviour,
                required String consequence,
                Value<int?> durationMinutes = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<bool> physicalIntervention = const Value.absent(),
                Value<String?> interventionDetails = const Value.absent(),
                Value<bool> injuryOccurred = const Value.absent(),
                Value<String?> injuryDetails = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required String recordedById,
                required String recordedByName,
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BehaviourIncidentsTableCompanion.insert(
                id: id,
                homeId: homeId,
                childId: childId,
                shift: shift,
                occurredAt: occurredAt,
                severity: severity,
                antecedent: antecedent,
                behaviour: behaviour,
                consequence: consequence,
                durationMinutes: durationMinutes,
                location: location,
                physicalIntervention: physicalIntervention,
                interventionDetails: interventionDetails,
                injuryOccurred: injuryOccurred,
                injuryDetails: injuryDetails,
                notes: notes,
                recordedById: recordedById,
                recordedByName: recordedByName,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BehaviourIncidentsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BehaviourIncidentsTableTable,
      BehaviourIncidentRow,
      $$BehaviourIncidentsTableTableFilterComposer,
      $$BehaviourIncidentsTableTableOrderingComposer,
      $$BehaviourIncidentsTableTableAnnotationComposer,
      $$BehaviourIncidentsTableTableCreateCompanionBuilder,
      $$BehaviourIncidentsTableTableUpdateCompanionBuilder,
      (
        BehaviourIncidentRow,
        BaseReferences<
          _$AppDatabase,
          $BehaviourIncidentsTableTable,
          BehaviourIncidentRow
        >,
      ),
      BehaviourIncidentRow,
      PrefetchHooks Function()
    >;
typedef $$SleepEntriesTableTableCreateCompanionBuilder =
    SleepEntriesTableCompanion Function({
      required String id,
      required String homeId,
      required String childId,
      required String date,
      required String shift,
      Value<String?> bedTime,
      Value<String?> settledTime,
      Value<String?> wakeTime,
      Value<int> numberOfWakings,
      required String quality,
      Value<String?> notes,
      required String recordedById,
      required String recordedByName,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$SleepEntriesTableTableUpdateCompanionBuilder =
    SleepEntriesTableCompanion Function({
      Value<String> id,
      Value<String> homeId,
      Value<String> childId,
      Value<String> date,
      Value<String> shift,
      Value<String?> bedTime,
      Value<String?> settledTime,
      Value<String?> wakeTime,
      Value<int> numberOfWakings,
      Value<String> quality,
      Value<String?> notes,
      Value<String> recordedById,
      Value<String> recordedByName,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$SleepEntriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $SleepEntriesTableTable> {
  $$SleepEntriesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shift => $composableBuilder(
    column: $table.shift,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bedTime => $composableBuilder(
    column: $table.bedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get settledTime => $composableBuilder(
    column: $table.settledTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wakeTime => $composableBuilder(
    column: $table.wakeTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numberOfWakings => $composableBuilder(
    column: $table.numberOfWakings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quality => $composableBuilder(
    column: $table.quality,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordedById => $composableBuilder(
    column: $table.recordedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordedByName => $composableBuilder(
    column: $table.recordedByName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SleepEntriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SleepEntriesTableTable> {
  $$SleepEntriesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shift => $composableBuilder(
    column: $table.shift,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bedTime => $composableBuilder(
    column: $table.bedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get settledTime => $composableBuilder(
    column: $table.settledTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wakeTime => $composableBuilder(
    column: $table.wakeTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numberOfWakings => $composableBuilder(
    column: $table.numberOfWakings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quality => $composableBuilder(
    column: $table.quality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordedById => $composableBuilder(
    column: $table.recordedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordedByName => $composableBuilder(
    column: $table.recordedByName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SleepEntriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SleepEntriesTableTable> {
  $$SleepEntriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get homeId =>
      $composableBuilder(column: $table.homeId, builder: (column) => column);

  GeneratedColumn<String> get childId =>
      $composableBuilder(column: $table.childId, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get shift =>
      $composableBuilder(column: $table.shift, builder: (column) => column);

  GeneratedColumn<String> get bedTime =>
      $composableBuilder(column: $table.bedTime, builder: (column) => column);

  GeneratedColumn<String> get settledTime => $composableBuilder(
    column: $table.settledTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get wakeTime =>
      $composableBuilder(column: $table.wakeTime, builder: (column) => column);

  GeneratedColumn<int> get numberOfWakings => $composableBuilder(
    column: $table.numberOfWakings,
    builder: (column) => column,
  );

  GeneratedColumn<String> get quality =>
      $composableBuilder(column: $table.quality, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get recordedById => $composableBuilder(
    column: $table.recordedById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recordedByName => $composableBuilder(
    column: $table.recordedByName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$SleepEntriesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SleepEntriesTableTable,
          SleepEntryRow,
          $$SleepEntriesTableTableFilterComposer,
          $$SleepEntriesTableTableOrderingComposer,
          $$SleepEntriesTableTableAnnotationComposer,
          $$SleepEntriesTableTableCreateCompanionBuilder,
          $$SleepEntriesTableTableUpdateCompanionBuilder,
          (
            SleepEntryRow,
            BaseReferences<
              _$AppDatabase,
              $SleepEntriesTableTable,
              SleepEntryRow
            >,
          ),
          SleepEntryRow,
          PrefetchHooks Function()
        > {
  $$SleepEntriesTableTableTableManager(
    _$AppDatabase db,
    $SleepEntriesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SleepEntriesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SleepEntriesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SleepEntriesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> homeId = const Value.absent(),
                Value<String> childId = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String> shift = const Value.absent(),
                Value<String?> bedTime = const Value.absent(),
                Value<String?> settledTime = const Value.absent(),
                Value<String?> wakeTime = const Value.absent(),
                Value<int> numberOfWakings = const Value.absent(),
                Value<String> quality = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> recordedById = const Value.absent(),
                Value<String> recordedByName = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SleepEntriesTableCompanion(
                id: id,
                homeId: homeId,
                childId: childId,
                date: date,
                shift: shift,
                bedTime: bedTime,
                settledTime: settledTime,
                wakeTime: wakeTime,
                numberOfWakings: numberOfWakings,
                quality: quality,
                notes: notes,
                recordedById: recordedById,
                recordedByName: recordedByName,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String homeId,
                required String childId,
                required String date,
                required String shift,
                Value<String?> bedTime = const Value.absent(),
                Value<String?> settledTime = const Value.absent(),
                Value<String?> wakeTime = const Value.absent(),
                Value<int> numberOfWakings = const Value.absent(),
                required String quality,
                Value<String?> notes = const Value.absent(),
                required String recordedById,
                required String recordedByName,
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SleepEntriesTableCompanion.insert(
                id: id,
                homeId: homeId,
                childId: childId,
                date: date,
                shift: shift,
                bedTime: bedTime,
                settledTime: settledTime,
                wakeTime: wakeTime,
                numberOfWakings: numberOfWakings,
                quality: quality,
                notes: notes,
                recordedById: recordedById,
                recordedByName: recordedByName,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SleepEntriesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SleepEntriesTableTable,
      SleepEntryRow,
      $$SleepEntriesTableTableFilterComposer,
      $$SleepEntriesTableTableOrderingComposer,
      $$SleepEntriesTableTableAnnotationComposer,
      $$SleepEntriesTableTableCreateCompanionBuilder,
      $$SleepEntriesTableTableUpdateCompanionBuilder,
      (
        SleepEntryRow,
        BaseReferences<_$AppDatabase, $SleepEntriesTableTable, SleepEntryRow>,
      ),
      SleepEntryRow,
      PrefetchHooks Function()
    >;
typedef $$FoodEntriesTableTableCreateCompanionBuilder =
    FoodEntriesTableCompanion Function({
      required String id,
      required String homeId,
      required String childId,
      required String date,
      required String shift,
      required String mealType,
      required String description,
      required String appetite,
      Value<String?> concerns,
      Value<String?> notes,
      required String recordedById,
      required String recordedByName,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$FoodEntriesTableTableUpdateCompanionBuilder =
    FoodEntriesTableCompanion Function({
      Value<String> id,
      Value<String> homeId,
      Value<String> childId,
      Value<String> date,
      Value<String> shift,
      Value<String> mealType,
      Value<String> description,
      Value<String> appetite,
      Value<String?> concerns,
      Value<String?> notes,
      Value<String> recordedById,
      Value<String> recordedByName,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$FoodEntriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $FoodEntriesTableTable> {
  $$FoodEntriesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shift => $composableBuilder(
    column: $table.shift,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mealType => $composableBuilder(
    column: $table.mealType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get appetite => $composableBuilder(
    column: $table.appetite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get concerns => $composableBuilder(
    column: $table.concerns,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordedById => $composableBuilder(
    column: $table.recordedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordedByName => $composableBuilder(
    column: $table.recordedByName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FoodEntriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FoodEntriesTableTable> {
  $$FoodEntriesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shift => $composableBuilder(
    column: $table.shift,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mealType => $composableBuilder(
    column: $table.mealType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get appetite => $composableBuilder(
    column: $table.appetite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get concerns => $composableBuilder(
    column: $table.concerns,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordedById => $composableBuilder(
    column: $table.recordedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordedByName => $composableBuilder(
    column: $table.recordedByName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FoodEntriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FoodEntriesTableTable> {
  $$FoodEntriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get homeId =>
      $composableBuilder(column: $table.homeId, builder: (column) => column);

  GeneratedColumn<String> get childId =>
      $composableBuilder(column: $table.childId, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get shift =>
      $composableBuilder(column: $table.shift, builder: (column) => column);

  GeneratedColumn<String> get mealType =>
      $composableBuilder(column: $table.mealType, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get appetite =>
      $composableBuilder(column: $table.appetite, builder: (column) => column);

  GeneratedColumn<String> get concerns =>
      $composableBuilder(column: $table.concerns, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get recordedById => $composableBuilder(
    column: $table.recordedById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recordedByName => $composableBuilder(
    column: $table.recordedByName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$FoodEntriesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FoodEntriesTableTable,
          FoodEntryRow,
          $$FoodEntriesTableTableFilterComposer,
          $$FoodEntriesTableTableOrderingComposer,
          $$FoodEntriesTableTableAnnotationComposer,
          $$FoodEntriesTableTableCreateCompanionBuilder,
          $$FoodEntriesTableTableUpdateCompanionBuilder,
          (
            FoodEntryRow,
            BaseReferences<_$AppDatabase, $FoodEntriesTableTable, FoodEntryRow>,
          ),
          FoodEntryRow,
          PrefetchHooks Function()
        > {
  $$FoodEntriesTableTableTableManager(
    _$AppDatabase db,
    $FoodEntriesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FoodEntriesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FoodEntriesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FoodEntriesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> homeId = const Value.absent(),
                Value<String> childId = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String> shift = const Value.absent(),
                Value<String> mealType = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> appetite = const Value.absent(),
                Value<String?> concerns = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> recordedById = const Value.absent(),
                Value<String> recordedByName = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FoodEntriesTableCompanion(
                id: id,
                homeId: homeId,
                childId: childId,
                date: date,
                shift: shift,
                mealType: mealType,
                description: description,
                appetite: appetite,
                concerns: concerns,
                notes: notes,
                recordedById: recordedById,
                recordedByName: recordedByName,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String homeId,
                required String childId,
                required String date,
                required String shift,
                required String mealType,
                required String description,
                required String appetite,
                Value<String?> concerns = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required String recordedById,
                required String recordedByName,
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FoodEntriesTableCompanion.insert(
                id: id,
                homeId: homeId,
                childId: childId,
                date: date,
                shift: shift,
                mealType: mealType,
                description: description,
                appetite: appetite,
                concerns: concerns,
                notes: notes,
                recordedById: recordedById,
                recordedByName: recordedByName,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FoodEntriesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FoodEntriesTableTable,
      FoodEntryRow,
      $$FoodEntriesTableTableFilterComposer,
      $$FoodEntriesTableTableOrderingComposer,
      $$FoodEntriesTableTableAnnotationComposer,
      $$FoodEntriesTableTableCreateCompanionBuilder,
      $$FoodEntriesTableTableUpdateCompanionBuilder,
      (
        FoodEntryRow,
        BaseReferences<_$AppDatabase, $FoodEntriesTableTable, FoodEntryRow>,
      ),
      FoodEntryRow,
      PrefetchHooks Function()
    >;
typedef $$ActivityEntriesTableTableCreateCompanionBuilder =
    ActivityEntriesTableCompanion Function({
      required String id,
      required String homeId,
      required String childId,
      required String date,
      required String shift,
      required String category,
      required String title,
      Value<String?> description,
      Value<int?> durationMinutes,
      Value<bool> rewardEarned,
      Value<String?> achievement,
      required String recordedById,
      required String recordedByName,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$ActivityEntriesTableTableUpdateCompanionBuilder =
    ActivityEntriesTableCompanion Function({
      Value<String> id,
      Value<String> homeId,
      Value<String> childId,
      Value<String> date,
      Value<String> shift,
      Value<String> category,
      Value<String> title,
      Value<String?> description,
      Value<int?> durationMinutes,
      Value<bool> rewardEarned,
      Value<String?> achievement,
      Value<String> recordedById,
      Value<String> recordedByName,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$ActivityEntriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $ActivityEntriesTableTable> {
  $$ActivityEntriesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shift => $composableBuilder(
    column: $table.shift,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rewardEarned => $composableBuilder(
    column: $table.rewardEarned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get achievement => $composableBuilder(
    column: $table.achievement,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordedById => $composableBuilder(
    column: $table.recordedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordedByName => $composableBuilder(
    column: $table.recordedByName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ActivityEntriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ActivityEntriesTableTable> {
  $$ActivityEntriesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shift => $composableBuilder(
    column: $table.shift,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rewardEarned => $composableBuilder(
    column: $table.rewardEarned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get achievement => $composableBuilder(
    column: $table.achievement,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordedById => $composableBuilder(
    column: $table.recordedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordedByName => $composableBuilder(
    column: $table.recordedByName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ActivityEntriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActivityEntriesTableTable> {
  $$ActivityEntriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get homeId =>
      $composableBuilder(column: $table.homeId, builder: (column) => column);

  GeneratedColumn<String> get childId =>
      $composableBuilder(column: $table.childId, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get shift =>
      $composableBuilder(column: $table.shift, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get rewardEarned => $composableBuilder(
    column: $table.rewardEarned,
    builder: (column) => column,
  );

  GeneratedColumn<String> get achievement => $composableBuilder(
    column: $table.achievement,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recordedById => $composableBuilder(
    column: $table.recordedById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recordedByName => $composableBuilder(
    column: $table.recordedByName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$ActivityEntriesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActivityEntriesTableTable,
          ActivityEntryRow,
          $$ActivityEntriesTableTableFilterComposer,
          $$ActivityEntriesTableTableOrderingComposer,
          $$ActivityEntriesTableTableAnnotationComposer,
          $$ActivityEntriesTableTableCreateCompanionBuilder,
          $$ActivityEntriesTableTableUpdateCompanionBuilder,
          (
            ActivityEntryRow,
            BaseReferences<
              _$AppDatabase,
              $ActivityEntriesTableTable,
              ActivityEntryRow
            >,
          ),
          ActivityEntryRow,
          PrefetchHooks Function()
        > {
  $$ActivityEntriesTableTableTableManager(
    _$AppDatabase db,
    $ActivityEntriesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActivityEntriesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActivityEntriesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ActivityEntriesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> homeId = const Value.absent(),
                Value<String> childId = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String> shift = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int?> durationMinutes = const Value.absent(),
                Value<bool> rewardEarned = const Value.absent(),
                Value<String?> achievement = const Value.absent(),
                Value<String> recordedById = const Value.absent(),
                Value<String> recordedByName = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ActivityEntriesTableCompanion(
                id: id,
                homeId: homeId,
                childId: childId,
                date: date,
                shift: shift,
                category: category,
                title: title,
                description: description,
                durationMinutes: durationMinutes,
                rewardEarned: rewardEarned,
                achievement: achievement,
                recordedById: recordedById,
                recordedByName: recordedByName,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String homeId,
                required String childId,
                required String date,
                required String shift,
                required String category,
                required String title,
                Value<String?> description = const Value.absent(),
                Value<int?> durationMinutes = const Value.absent(),
                Value<bool> rewardEarned = const Value.absent(),
                Value<String?> achievement = const Value.absent(),
                required String recordedById,
                required String recordedByName,
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ActivityEntriesTableCompanion.insert(
                id: id,
                homeId: homeId,
                childId: childId,
                date: date,
                shift: shift,
                category: category,
                title: title,
                description: description,
                durationMinutes: durationMinutes,
                rewardEarned: rewardEarned,
                achievement: achievement,
                recordedById: recordedById,
                recordedByName: recordedByName,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ActivityEntriesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActivityEntriesTableTable,
      ActivityEntryRow,
      $$ActivityEntriesTableTableFilterComposer,
      $$ActivityEntriesTableTableOrderingComposer,
      $$ActivityEntriesTableTableAnnotationComposer,
      $$ActivityEntriesTableTableCreateCompanionBuilder,
      $$ActivityEntriesTableTableUpdateCompanionBuilder,
      (
        ActivityEntryRow,
        BaseReferences<
          _$AppDatabase,
          $ActivityEntriesTableTable,
          ActivityEntryRow
        >,
      ),
      ActivityEntryRow,
      PrefetchHooks Function()
    >;
typedef $$SmartStepsTableTableCreateCompanionBuilder =
    SmartStepsTableCompanion Function({
      required String id,
      required String homeId,
      required String childId,
      required String category,
      required String title,
      Value<String?> description,
      Value<String?> targetDate,
      required String status,
      Value<String?> achievedDate,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$SmartStepsTableTableUpdateCompanionBuilder =
    SmartStepsTableCompanion Function({
      Value<String> id,
      Value<String> homeId,
      Value<String> childId,
      Value<String> category,
      Value<String> title,
      Value<String?> description,
      Value<String?> targetDate,
      Value<String> status,
      Value<String?> achievedDate,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$SmartStepsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SmartStepsTableTable> {
  $$SmartStepsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get achievedDate => $composableBuilder(
    column: $table.achievedDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SmartStepsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SmartStepsTableTable> {
  $$SmartStepsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get achievedDate => $composableBuilder(
    column: $table.achievedDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SmartStepsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SmartStepsTableTable> {
  $$SmartStepsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get homeId =>
      $composableBuilder(column: $table.homeId, builder: (column) => column);

  GeneratedColumn<String> get childId =>
      $composableBuilder(column: $table.childId, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get achievedDate => $composableBuilder(
    column: $table.achievedDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$SmartStepsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SmartStepsTableTable,
          SmartStepRow,
          $$SmartStepsTableTableFilterComposer,
          $$SmartStepsTableTableOrderingComposer,
          $$SmartStepsTableTableAnnotationComposer,
          $$SmartStepsTableTableCreateCompanionBuilder,
          $$SmartStepsTableTableUpdateCompanionBuilder,
          (
            SmartStepRow,
            BaseReferences<_$AppDatabase, $SmartStepsTableTable, SmartStepRow>,
          ),
          SmartStepRow,
          PrefetchHooks Function()
        > {
  $$SmartStepsTableTableTableManager(
    _$AppDatabase db,
    $SmartStepsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SmartStepsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SmartStepsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SmartStepsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> homeId = const Value.absent(),
                Value<String> childId = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> targetDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> achievedDate = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SmartStepsTableCompanion(
                id: id,
                homeId: homeId,
                childId: childId,
                category: category,
                title: title,
                description: description,
                targetDate: targetDate,
                status: status,
                achievedDate: achievedDate,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String homeId,
                required String childId,
                required String category,
                required String title,
                Value<String?> description = const Value.absent(),
                Value<String?> targetDate = const Value.absent(),
                required String status,
                Value<String?> achievedDate = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SmartStepsTableCompanion.insert(
                id: id,
                homeId: homeId,
                childId: childId,
                category: category,
                title: title,
                description: description,
                targetDate: targetDate,
                status: status,
                achievedDate: achievedDate,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SmartStepsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SmartStepsTableTable,
      SmartStepRow,
      $$SmartStepsTableTableFilterComposer,
      $$SmartStepsTableTableOrderingComposer,
      $$SmartStepsTableTableAnnotationComposer,
      $$SmartStepsTableTableCreateCompanionBuilder,
      $$SmartStepsTableTableUpdateCompanionBuilder,
      (
        SmartStepRow,
        BaseReferences<_$AppDatabase, $SmartStepsTableTable, SmartStepRow>,
      ),
      SmartStepRow,
      PrefetchHooks Function()
    >;
typedef $$StepProgressTableTableCreateCompanionBuilder =
    StepProgressTableCompanion Function({
      required String id,
      required String homeId,
      required String childId,
      required String stepId,
      required String date,
      required String shift,
      required String outcome,
      required String note,
      required String recordedById,
      required String recordedByName,
      Value<String?> createdById,
      Value<String?> updatedById,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$StepProgressTableTableUpdateCompanionBuilder =
    StepProgressTableCompanion Function({
      Value<String> id,
      Value<String> homeId,
      Value<String> childId,
      Value<String> stepId,
      Value<String> date,
      Value<String> shift,
      Value<String> outcome,
      Value<String> note,
      Value<String> recordedById,
      Value<String> recordedByName,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$StepProgressTableTableFilterComposer
    extends Composer<_$AppDatabase, $StepProgressTableTable> {
  $$StepProgressTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stepId => $composableBuilder(
    column: $table.stepId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shift => $composableBuilder(
    column: $table.shift,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get outcome => $composableBuilder(
    column: $table.outcome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordedById => $composableBuilder(
    column: $table.recordedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordedByName => $composableBuilder(
    column: $table.recordedByName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StepProgressTableTableOrderingComposer
    extends Composer<_$AppDatabase, $StepProgressTableTable> {
  $$StepProgressTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stepId => $composableBuilder(
    column: $table.stepId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shift => $composableBuilder(
    column: $table.shift,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get outcome => $composableBuilder(
    column: $table.outcome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordedById => $composableBuilder(
    column: $table.recordedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordedByName => $composableBuilder(
    column: $table.recordedByName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StepProgressTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $StepProgressTableTable> {
  $$StepProgressTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get homeId =>
      $composableBuilder(column: $table.homeId, builder: (column) => column);

  GeneratedColumn<String> get childId =>
      $composableBuilder(column: $table.childId, builder: (column) => column);

  GeneratedColumn<String> get stepId =>
      $composableBuilder(column: $table.stepId, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get shift =>
      $composableBuilder(column: $table.shift, builder: (column) => column);

  GeneratedColumn<String> get outcome =>
      $composableBuilder(column: $table.outcome, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<String> get recordedById => $composableBuilder(
    column: $table.recordedById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recordedByName => $composableBuilder(
    column: $table.recordedByName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$StepProgressTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StepProgressTableTable,
          StepProgressRow,
          $$StepProgressTableTableFilterComposer,
          $$StepProgressTableTableOrderingComposer,
          $$StepProgressTableTableAnnotationComposer,
          $$StepProgressTableTableCreateCompanionBuilder,
          $$StepProgressTableTableUpdateCompanionBuilder,
          (
            StepProgressRow,
            BaseReferences<
              _$AppDatabase,
              $StepProgressTableTable,
              StepProgressRow
            >,
          ),
          StepProgressRow,
          PrefetchHooks Function()
        > {
  $$StepProgressTableTableTableManager(
    _$AppDatabase db,
    $StepProgressTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StepProgressTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StepProgressTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StepProgressTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> homeId = const Value.absent(),
                Value<String> childId = const Value.absent(),
                Value<String> stepId = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String> shift = const Value.absent(),
                Value<String> outcome = const Value.absent(),
                Value<String> note = const Value.absent(),
                Value<String> recordedById = const Value.absent(),
                Value<String> recordedByName = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StepProgressTableCompanion(
                id: id,
                homeId: homeId,
                childId: childId,
                stepId: stepId,
                date: date,
                shift: shift,
                outcome: outcome,
                note: note,
                recordedById: recordedById,
                recordedByName: recordedByName,
                createdById: createdById,
                updatedById: updatedById,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String homeId,
                required String childId,
                required String stepId,
                required String date,
                required String shift,
                required String outcome,
                required String note,
                required String recordedById,
                required String recordedByName,
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StepProgressTableCompanion.insert(
                id: id,
                homeId: homeId,
                childId: childId,
                stepId: stepId,
                date: date,
                shift: shift,
                outcome: outcome,
                note: note,
                recordedById: recordedById,
                recordedByName: recordedByName,
                createdById: createdById,
                updatedById: updatedById,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StepProgressTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StepProgressTableTable,
      StepProgressRow,
      $$StepProgressTableTableFilterComposer,
      $$StepProgressTableTableOrderingComposer,
      $$StepProgressTableTableAnnotationComposer,
      $$StepProgressTableTableCreateCompanionBuilder,
      $$StepProgressTableTableUpdateCompanionBuilder,
      (
        StepProgressRow,
        BaseReferences<_$AppDatabase, $StepProgressTableTable, StepProgressRow>,
      ),
      StepProgressRow,
      PrefetchHooks Function()
    >;
typedef $$IncidentReportsTableTableCreateCompanionBuilder =
    IncidentReportsTableCompanion Function({
      required String id,
      required String homeId,
      required String childId,
      required String incidentType,
      required String severity,
      required String title,
      required DateTime occurredAt,
      Value<String?> location,
      required String description,
      required String immediateAction,
      Value<String?> injuryDetails,
      Value<bool> policeNotified,
      Value<bool> parentNotified,
      Value<bool> managerNotified,
      Value<bool> followUpRequired,
      Value<String?> followUpDetails,
      required String reportedById,
      required String reportedByName,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$IncidentReportsTableTableUpdateCompanionBuilder =
    IncidentReportsTableCompanion Function({
      Value<String> id,
      Value<String> homeId,
      Value<String> childId,
      Value<String> incidentType,
      Value<String> severity,
      Value<String> title,
      Value<DateTime> occurredAt,
      Value<String?> location,
      Value<String> description,
      Value<String> immediateAction,
      Value<String?> injuryDetails,
      Value<bool> policeNotified,
      Value<bool> parentNotified,
      Value<bool> managerNotified,
      Value<bool> followUpRequired,
      Value<String?> followUpDetails,
      Value<String> reportedById,
      Value<String> reportedByName,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<DateTime?> deletedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$IncidentReportsTableTableFilterComposer
    extends Composer<_$AppDatabase, $IncidentReportsTableTable> {
  $$IncidentReportsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get incidentType => $composableBuilder(
    column: $table.incidentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get severity => $composableBuilder(
    column: $table.severity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get immediateAction => $composableBuilder(
    column: $table.immediateAction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get injuryDetails => $composableBuilder(
    column: $table.injuryDetails,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get policeNotified => $composableBuilder(
    column: $table.policeNotified,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get parentNotified => $composableBuilder(
    column: $table.parentNotified,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get managerNotified => $composableBuilder(
    column: $table.managerNotified,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get followUpRequired => $composableBuilder(
    column: $table.followUpRequired,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get followUpDetails => $composableBuilder(
    column: $table.followUpDetails,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reportedById => $composableBuilder(
    column: $table.reportedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reportedByName => $composableBuilder(
    column: $table.reportedByName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$IncidentReportsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $IncidentReportsTableTable> {
  $$IncidentReportsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get childId => $composableBuilder(
    column: $table.childId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get incidentType => $composableBuilder(
    column: $table.incidentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get severity => $composableBuilder(
    column: $table.severity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get immediateAction => $composableBuilder(
    column: $table.immediateAction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get injuryDetails => $composableBuilder(
    column: $table.injuryDetails,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get policeNotified => $composableBuilder(
    column: $table.policeNotified,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get parentNotified => $composableBuilder(
    column: $table.parentNotified,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get managerNotified => $composableBuilder(
    column: $table.managerNotified,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get followUpRequired => $composableBuilder(
    column: $table.followUpRequired,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get followUpDetails => $composableBuilder(
    column: $table.followUpDetails,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reportedById => $composableBuilder(
    column: $table.reportedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reportedByName => $composableBuilder(
    column: $table.reportedByName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$IncidentReportsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $IncidentReportsTableTable> {
  $$IncidentReportsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get homeId =>
      $composableBuilder(column: $table.homeId, builder: (column) => column);

  GeneratedColumn<String> get childId =>
      $composableBuilder(column: $table.childId, builder: (column) => column);

  GeneratedColumn<String> get incidentType => $composableBuilder(
    column: $table.incidentType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get severity =>
      $composableBuilder(column: $table.severity, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get immediateAction => $composableBuilder(
    column: $table.immediateAction,
    builder: (column) => column,
  );

  GeneratedColumn<String> get injuryDetails => $composableBuilder(
    column: $table.injuryDetails,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get policeNotified => $composableBuilder(
    column: $table.policeNotified,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get parentNotified => $composableBuilder(
    column: $table.parentNotified,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get managerNotified => $composableBuilder(
    column: $table.managerNotified,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get followUpRequired => $composableBuilder(
    column: $table.followUpRequired,
    builder: (column) => column,
  );

  GeneratedColumn<String> get followUpDetails => $composableBuilder(
    column: $table.followUpDetails,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reportedById => $composableBuilder(
    column: $table.reportedById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reportedByName => $composableBuilder(
    column: $table.reportedByName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$IncidentReportsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IncidentReportsTableTable,
          IncidentReportRow,
          $$IncidentReportsTableTableFilterComposer,
          $$IncidentReportsTableTableOrderingComposer,
          $$IncidentReportsTableTableAnnotationComposer,
          $$IncidentReportsTableTableCreateCompanionBuilder,
          $$IncidentReportsTableTableUpdateCompanionBuilder,
          (
            IncidentReportRow,
            BaseReferences<
              _$AppDatabase,
              $IncidentReportsTableTable,
              IncidentReportRow
            >,
          ),
          IncidentReportRow,
          PrefetchHooks Function()
        > {
  $$IncidentReportsTableTableTableManager(
    _$AppDatabase db,
    $IncidentReportsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IncidentReportsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IncidentReportsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$IncidentReportsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> homeId = const Value.absent(),
                Value<String> childId = const Value.absent(),
                Value<String> incidentType = const Value.absent(),
                Value<String> severity = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<DateTime> occurredAt = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> immediateAction = const Value.absent(),
                Value<String?> injuryDetails = const Value.absent(),
                Value<bool> policeNotified = const Value.absent(),
                Value<bool> parentNotified = const Value.absent(),
                Value<bool> managerNotified = const Value.absent(),
                Value<bool> followUpRequired = const Value.absent(),
                Value<String?> followUpDetails = const Value.absent(),
                Value<String> reportedById = const Value.absent(),
                Value<String> reportedByName = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => IncidentReportsTableCompanion(
                id: id,
                homeId: homeId,
                childId: childId,
                incidentType: incidentType,
                severity: severity,
                title: title,
                occurredAt: occurredAt,
                location: location,
                description: description,
                immediateAction: immediateAction,
                injuryDetails: injuryDetails,
                policeNotified: policeNotified,
                parentNotified: parentNotified,
                managerNotified: managerNotified,
                followUpRequired: followUpRequired,
                followUpDetails: followUpDetails,
                reportedById: reportedById,
                reportedByName: reportedByName,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String homeId,
                required String childId,
                required String incidentType,
                required String severity,
                required String title,
                required DateTime occurredAt,
                Value<String?> location = const Value.absent(),
                required String description,
                required String immediateAction,
                Value<String?> injuryDetails = const Value.absent(),
                Value<bool> policeNotified = const Value.absent(),
                Value<bool> parentNotified = const Value.absent(),
                Value<bool> managerNotified = const Value.absent(),
                Value<bool> followUpRequired = const Value.absent(),
                Value<String?> followUpDetails = const Value.absent(),
                required String reportedById,
                required String reportedByName,
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => IncidentReportsTableCompanion.insert(
                id: id,
                homeId: homeId,
                childId: childId,
                incidentType: incidentType,
                severity: severity,
                title: title,
                occurredAt: occurredAt,
                location: location,
                description: description,
                immediateAction: immediateAction,
                injuryDetails: injuryDetails,
                policeNotified: policeNotified,
                parentNotified: parentNotified,
                managerNotified: managerNotified,
                followUpRequired: followUpRequired,
                followUpDetails: followUpDetails,
                reportedById: reportedById,
                reportedByName: reportedByName,
                createdById: createdById,
                updatedById: updatedById,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$IncidentReportsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IncidentReportsTableTable,
      IncidentReportRow,
      $$IncidentReportsTableTableFilterComposer,
      $$IncidentReportsTableTableOrderingComposer,
      $$IncidentReportsTableTableAnnotationComposer,
      $$IncidentReportsTableTableCreateCompanionBuilder,
      $$IncidentReportsTableTableUpdateCompanionBuilder,
      (
        IncidentReportRow,
        BaseReferences<
          _$AppDatabase,
          $IncidentReportsTableTable,
          IncidentReportRow
        >,
      ),
      IncidentReportRow,
      PrefetchHooks Function()
    >;
typedef $$ChildrenTableTableCreateCompanionBuilder =
    ChildrenTableCompanion Function({
      required String id,
      required String homeId,
      required String name,
      required String dateOfBirth,
      required String room,
      Value<String?> photoUrl,
      Value<String?> notes,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$ChildrenTableTableUpdateCompanionBuilder =
    ChildrenTableCompanion Function({
      Value<String> id,
      Value<String> homeId,
      Value<String> name,
      Value<String> dateOfBirth,
      Value<String> room,
      Value<String?> photoUrl,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String?> createdById,
      Value<String?> updatedById,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$ChildrenTableTableFilterComposer
    extends Composer<_$AppDatabase, $ChildrenTableTable> {
  $$ChildrenTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get room => $composableBuilder(
    column: $table.room,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoUrl => $composableBuilder(
    column: $table.photoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ChildrenTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ChildrenTableTable> {
  $$ChildrenTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeId => $composableBuilder(
    column: $table.homeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get room => $composableBuilder(
    column: $table.room,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoUrl => $composableBuilder(
    column: $table.photoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChildrenTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChildrenTableTable> {
  $$ChildrenTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get homeId =>
      $composableBuilder(column: $table.homeId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => column,
  );

  GeneratedColumn<String> get room =>
      $composableBuilder(column: $table.room, builder: (column) => column);

  GeneratedColumn<String> get photoUrl =>
      $composableBuilder(column: $table.photoUrl, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedById => $composableBuilder(
    column: $table.updatedById,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$ChildrenTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChildrenTableTable,
          ChildRow,
          $$ChildrenTableTableFilterComposer,
          $$ChildrenTableTableOrderingComposer,
          $$ChildrenTableTableAnnotationComposer,
          $$ChildrenTableTableCreateCompanionBuilder,
          $$ChildrenTableTableUpdateCompanionBuilder,
          (
            ChildRow,
            BaseReferences<_$AppDatabase, $ChildrenTableTable, ChildRow>,
          ),
          ChildRow,
          PrefetchHooks Function()
        > {
  $$ChildrenTableTableTableManager(_$AppDatabase db, $ChildrenTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChildrenTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChildrenTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChildrenTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> homeId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> dateOfBirth = const Value.absent(),
                Value<String> room = const Value.absent(),
                Value<String?> photoUrl = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChildrenTableCompanion(
                id: id,
                homeId: homeId,
                name: name,
                dateOfBirth: dateOfBirth,
                room: room,
                photoUrl: photoUrl,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                createdById: createdById,
                updatedById: updatedById,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String homeId,
                required String name,
                required String dateOfBirth,
                required String room,
                Value<String?> photoUrl = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<String?> updatedById = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChildrenTableCompanion.insert(
                id: id,
                homeId: homeId,
                name: name,
                dateOfBirth: dateOfBirth,
                room: room,
                photoUrl: photoUrl,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                createdById: createdById,
                updatedById: updatedById,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ChildrenTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChildrenTableTable,
      ChildRow,
      $$ChildrenTableTableFilterComposer,
      $$ChildrenTableTableOrderingComposer,
      $$ChildrenTableTableAnnotationComposer,
      $$ChildrenTableTableCreateCompanionBuilder,
      $$ChildrenTableTableUpdateCompanionBuilder,
      (ChildRow, BaseReferences<_$AppDatabase, $ChildrenTableTable, ChildRow>),
      ChildRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DailyNotesTableTableTableManager get dailyNotesTable =>
      $$DailyNotesTableTableTableManager(_db, _db.dailyNotesTable);
  $$ChecklistItemsTableTableTableManager get checklistItemsTable =>
      $$ChecklistItemsTableTableTableManager(_db, _db.checklistItemsTable);
  $$AuditLogTableTableTableManager get auditLogTable =>
      $$AuditLogTableTableTableManager(_db, _db.auditLogTable);
  $$BathTempRecordsTableTableTableManager get bathTempRecordsTable =>
      $$BathTempRecordsTableTableTableManager(_db, _db.bathTempRecordsTable);
  $$VisitorLogTableTableTableManager get visitorLogTable =>
      $$VisitorLogTableTableTableManager(_db, _db.visitorLogTable);
  $$CarePlansTableTableTableManager get carePlansTable =>
      $$CarePlansTableTableTableManager(_db, _db.carePlansTable);
  $$CarePlanGoalsTableTableTableManager get carePlanGoalsTable =>
      $$CarePlanGoalsTableTableTableManager(_db, _db.carePlanGoalsTable);
  $$PrescribedMedsTableTableTableManager get prescribedMedsTable =>
      $$PrescribedMedsTableTableTableManager(_db, _db.prescribedMedsTable);
  $$MedAdministrationsTableTableTableManager get medAdministrationsTable =>
      $$MedAdministrationsTableTableTableManager(
        _db,
        _db.medAdministrationsTable,
      );
  $$MedicalProfileTableTableTableManager get medicalProfileTable =>
      $$MedicalProfileTableTableTableManager(_db, _db.medicalProfileTable);
  $$HealthcareContactsTableTableTableManager get healthcareContactsTable =>
      $$HealthcareContactsTableTableTableManager(
        _db,
        _db.healthcareContactsTable,
      );
  $$BehaviourIncidentsTableTableTableManager get behaviourIncidentsTable =>
      $$BehaviourIncidentsTableTableTableManager(
        _db,
        _db.behaviourIncidentsTable,
      );
  $$SleepEntriesTableTableTableManager get sleepEntriesTable =>
      $$SleepEntriesTableTableTableManager(_db, _db.sleepEntriesTable);
  $$FoodEntriesTableTableTableManager get foodEntriesTable =>
      $$FoodEntriesTableTableTableManager(_db, _db.foodEntriesTable);
  $$ActivityEntriesTableTableTableManager get activityEntriesTable =>
      $$ActivityEntriesTableTableTableManager(_db, _db.activityEntriesTable);
  $$SmartStepsTableTableTableManager get smartStepsTable =>
      $$SmartStepsTableTableTableManager(_db, _db.smartStepsTable);
  $$StepProgressTableTableTableManager get stepProgressTable =>
      $$StepProgressTableTableTableManager(_db, _db.stepProgressTable);
  $$IncidentReportsTableTableTableManager get incidentReportsTable =>
      $$IncidentReportsTableTableTableManager(_db, _db.incidentReportsTable);
  $$ChildrenTableTableTableManager get childrenTable =>
      $$ChildrenTableTableTableManager(_db, _db.childrenTable);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'59cce38d45eeaba199eddd097d8e149d66f9f3e1';

/// See also [appDatabase].
@ProviderFor(appDatabase)
final appDatabaseProvider = Provider<AppDatabase>.internal(
  appDatabase,
  name: r'appDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppDatabaseRef = ProviderRef<AppDatabase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
