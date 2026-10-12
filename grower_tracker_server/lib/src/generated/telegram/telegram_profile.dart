/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;

abstract class TelegramProfile
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  TelegramProfile._({
    this.id,
    required this.telegramId,
    required this.chatId,
    this.firstName,
    this.lastName,
    this.username,
  });

  factory TelegramProfile({
    _i1.UuidValue? id,
    required int telegramId,
    required int chatId,
    String? firstName,
    String? lastName,
    String? username,
  }) = _TelegramProfileImpl;

  factory TelegramProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return TelegramProfile(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      telegramId: jsonSerialization['telegramId'] as int,
      chatId: jsonSerialization['chatId'] as int,
      firstName: jsonSerialization['firstName'] as String?,
      lastName: jsonSerialization['lastName'] as String?,
      username: jsonSerialization['username'] as String?,
    );
  }

  static final t = TelegramProfileTable();

  static const db = TelegramProfileRepository._();

  @override
  _i1.UuidValue? id;

  int telegramId;

  int chatId;

  String? firstName;

  String? lastName;

  String? username;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [TelegramProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TelegramProfile copyWith({
    _i1.UuidValue? id,
    int? telegramId,
    int? chatId,
    String? firstName,
    String? lastName,
    String? username,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TelegramProfile',
      if (id != null) 'id': id?.toJson(),
      'telegramId': telegramId,
      'chatId': chatId,
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (username != null) 'username': username,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TelegramProfile',
      if (id != null) 'id': id?.toJson(),
      'telegramId': telegramId,
      'chatId': chatId,
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (username != null) 'username': username,
    };
  }

  static TelegramProfileInclude include() {
    return TelegramProfileInclude._();
  }

  static TelegramProfileIncludeList includeList({
    _i1.WhereExpressionBuilder<TelegramProfileTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TelegramProfileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TelegramProfileTable>? orderByList,
    TelegramProfileInclude? include,
  }) {
    return TelegramProfileIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TelegramProfile.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TelegramProfile.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TelegramProfileImpl extends TelegramProfile {
  _TelegramProfileImpl({
    _i1.UuidValue? id,
    required int telegramId,
    required int chatId,
    String? firstName,
    String? lastName,
    String? username,
  }) : super._(
         id: id,
         telegramId: telegramId,
         chatId: chatId,
         firstName: firstName,
         lastName: lastName,
         username: username,
       );

  /// Returns a shallow copy of this [TelegramProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TelegramProfile copyWith({
    Object? id = _Undefined,
    int? telegramId,
    int? chatId,
    Object? firstName = _Undefined,
    Object? lastName = _Undefined,
    Object? username = _Undefined,
  }) {
    return TelegramProfile(
      id: id is _i1.UuidValue? ? id : this.id,
      telegramId: telegramId ?? this.telegramId,
      chatId: chatId ?? this.chatId,
      firstName: firstName is String? ? firstName : this.firstName,
      lastName: lastName is String? ? lastName : this.lastName,
      username: username is String? ? username : this.username,
    );
  }
}

class TelegramProfileUpdateTable extends _i1.UpdateTable<TelegramProfileTable> {
  TelegramProfileUpdateTable(super.table);

  _i1.ColumnValue<int, int> telegramId(int value) => _i1.ColumnValue(
    table.telegramId,
    value,
  );

  _i1.ColumnValue<int, int> chatId(int value) => _i1.ColumnValue(
    table.chatId,
    value,
  );

  _i1.ColumnValue<String, String> firstName(String? value) => _i1.ColumnValue(
    table.firstName,
    value,
  );

  _i1.ColumnValue<String, String> lastName(String? value) => _i1.ColumnValue(
    table.lastName,
    value,
  );

  _i1.ColumnValue<String, String> username(String? value) => _i1.ColumnValue(
    table.username,
    value,
  );
}

class TelegramProfileTable extends _i1.Table<_i1.UuidValue?> {
  TelegramProfileTable({super.tableRelation})
    : super(tableName: 'telegram_profile') {
    updateTable = TelegramProfileUpdateTable(this);
    telegramId = _i1.ColumnInt(
      'telegramId',
      this,
    );
    chatId = _i1.ColumnInt(
      'chatId',
      this,
    );
    firstName = _i1.ColumnString(
      'firstName',
      this,
    );
    lastName = _i1.ColumnString(
      'lastName',
      this,
    );
    username = _i1.ColumnString(
      'username',
      this,
    );
  }

  late final TelegramProfileUpdateTable updateTable;

  late final _i1.ColumnInt telegramId;

  late final _i1.ColumnInt chatId;

  late final _i1.ColumnString firstName;

  late final _i1.ColumnString lastName;

  late final _i1.ColumnString username;

  @override
  List<_i1.Column> get columns => [
    id,
    telegramId,
    chatId,
    firstName,
    lastName,
    username,
  ];
}

class TelegramProfileInclude extends _i1.IncludeObject {
  TelegramProfileInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue?> get table => TelegramProfile.t;
}

class TelegramProfileIncludeList extends _i1.IncludeList {
  TelegramProfileIncludeList._({
    _i1.WhereExpressionBuilder<TelegramProfileTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TelegramProfile.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => TelegramProfile.t;
}

class TelegramProfileRepository {
  const TelegramProfileRepository._();

  /// Returns a list of [TelegramProfile]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<TelegramProfile>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<TelegramProfileTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TelegramProfileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TelegramProfileTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<TelegramProfile>(
      where: where?.call(TelegramProfile.t),
      orderBy: orderBy?.call(TelegramProfile.t),
      orderByList: orderByList?.call(TelegramProfile.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [TelegramProfile] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<TelegramProfile?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<TelegramProfileTable>? where,
    int? offset,
    _i1.OrderByBuilder<TelegramProfileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TelegramProfileTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<TelegramProfile>(
      where: where?.call(TelegramProfile.t),
      orderBy: orderBy?.call(TelegramProfile.t),
      orderByList: orderByList?.call(TelegramProfile.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [TelegramProfile] by its [id] or null if no such row exists.
  Future<TelegramProfile?> findById(
    _i1.DatabaseSession session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<TelegramProfile>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [TelegramProfile]s in the list and returns the inserted rows.
  ///
  /// The returned [TelegramProfile]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<TelegramProfile>> insert(
    _i1.DatabaseSession session,
    List<TelegramProfile> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<TelegramProfile>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [TelegramProfile] and returns the inserted row.
  ///
  /// The returned [TelegramProfile] will have its `id` field set.
  Future<TelegramProfile> insertRow(
    _i1.DatabaseSession session,
    TelegramProfile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TelegramProfile>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [TelegramProfile]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<TelegramProfile>> update(
    _i1.DatabaseSession session,
    List<TelegramProfile> rows, {
    _i1.ColumnSelections<TelegramProfileTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TelegramProfile>(
      rows,
      columns: columns?.call(TelegramProfile.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TelegramProfile]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TelegramProfile> updateRow(
    _i1.DatabaseSession session,
    TelegramProfile row, {
    _i1.ColumnSelections<TelegramProfileTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TelegramProfile>(
      row,
      columns: columns?.call(TelegramProfile.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TelegramProfile] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<TelegramProfile?> updateById(
    _i1.DatabaseSession session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<TelegramProfileUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<TelegramProfile>(
      id,
      columnValues: columnValues(TelegramProfile.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [TelegramProfile]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<TelegramProfile>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<TelegramProfileUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<TelegramProfileTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TelegramProfileTable>? orderBy,
    _i1.OrderByListBuilder<TelegramProfileTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<TelegramProfile>(
      columnValues: columnValues(TelegramProfile.t.updateTable),
      where: where(TelegramProfile.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TelegramProfile.t),
      orderByList: orderByList?.call(TelegramProfile.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [TelegramProfile]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<TelegramProfile>> delete(
    _i1.DatabaseSession session,
    List<TelegramProfile> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TelegramProfile>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [TelegramProfile].
  Future<TelegramProfile> deleteRow(
    _i1.DatabaseSession session,
    TelegramProfile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TelegramProfile>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<TelegramProfile>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<TelegramProfileTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TelegramProfile>(
      where: where(TelegramProfile.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<TelegramProfileTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TelegramProfile>(
      where: where?.call(TelegramProfile.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [TelegramProfile] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<TelegramProfileTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<TelegramProfile>(
      where: where(TelegramProfile.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
