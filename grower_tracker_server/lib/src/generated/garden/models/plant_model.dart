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

abstract class PlantModel
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  PlantModel._({
    this.id,
    required this.cultivationDays,
    this.name,
    required this.cropType,
    required this.icon,
    required this.plantedAt,
    DateTime? createdAt,
    this.authUserId,
    this.telegramId,
  }) : createdAt = createdAt ?? DateTime.now();

  factory PlantModel({
    _i1.UuidValue? id,
    required int cultivationDays,
    String? name,
    required String cropType,
    required String icon,
    required DateTime plantedAt,
    DateTime? createdAt,
    _i1.UuidValue? authUserId,
    _i1.UuidValue? telegramId,
  }) = _PlantModelImpl;

  factory PlantModel.fromJson(Map<String, dynamic> jsonSerialization) {
    return PlantModel(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      cultivationDays: jsonSerialization['cultivationDays'] as int,
      name: jsonSerialization['name'] as String?,
      cropType: jsonSerialization['cropType'] as String,
      icon: jsonSerialization['icon'] as String,
      plantedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['plantedAt'],
      ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      authUserId: jsonSerialization['authUserId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['authUserId'],
            ),
      telegramId: jsonSerialization['telegramId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['telegramId'],
            ),
    );
  }

  static final t = PlantModelTable();

  static const db = PlantModelRepository._();

  @override
  _i1.UuidValue? id;

  int cultivationDays;

  String? name;

  String cropType;

  String icon;

  DateTime plantedAt;

  DateTime createdAt;

  _i1.UuidValue? authUserId;

  _i1.UuidValue? telegramId;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [PlantModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlantModel copyWith({
    _i1.UuidValue? id,
    int? cultivationDays,
    String? name,
    String? cropType,
    String? icon,
    DateTime? plantedAt,
    DateTime? createdAt,
    _i1.UuidValue? authUserId,
    _i1.UuidValue? telegramId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlantModel',
      if (id != null) 'id': id?.toJson(),
      'cultivationDays': cultivationDays,
      if (name != null) 'name': name,
      'cropType': cropType,
      'icon': icon,
      'plantedAt': plantedAt.toJson(),
      'createdAt': createdAt.toJson(),
      if (authUserId != null) 'authUserId': authUserId?.toJson(),
      if (telegramId != null) 'telegramId': telegramId?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PlantModel',
      if (id != null) 'id': id?.toJson(),
      'cultivationDays': cultivationDays,
      if (name != null) 'name': name,
      'cropType': cropType,
      'icon': icon,
      'plantedAt': plantedAt.toJson(),
      'createdAt': createdAt.toJson(),
      if (authUserId != null) 'authUserId': authUserId?.toJson(),
      if (telegramId != null) 'telegramId': telegramId?.toJson(),
    };
  }

  static PlantModelInclude include() {
    return PlantModelInclude._();
  }

  static PlantModelIncludeList includeList({
    _i1.WhereExpressionBuilder<PlantModelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlantModelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlantModelTable>? orderByList,
    PlantModelInclude? include,
  }) {
    return PlantModelIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlantModel.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PlantModel.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlantModelImpl extends PlantModel {
  _PlantModelImpl({
    _i1.UuidValue? id,
    required int cultivationDays,
    String? name,
    required String cropType,
    required String icon,
    required DateTime plantedAt,
    DateTime? createdAt,
    _i1.UuidValue? authUserId,
    _i1.UuidValue? telegramId,
  }) : super._(
         id: id,
         cultivationDays: cultivationDays,
         name: name,
         cropType: cropType,
         icon: icon,
         plantedAt: plantedAt,
         createdAt: createdAt,
         authUserId: authUserId,
         telegramId: telegramId,
       );

  /// Returns a shallow copy of this [PlantModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlantModel copyWith({
    Object? id = _Undefined,
    int? cultivationDays,
    Object? name = _Undefined,
    String? cropType,
    String? icon,
    DateTime? plantedAt,
    DateTime? createdAt,
    Object? authUserId = _Undefined,
    Object? telegramId = _Undefined,
  }) {
    return PlantModel(
      id: id is _i1.UuidValue? ? id : this.id,
      cultivationDays: cultivationDays ?? this.cultivationDays,
      name: name is String? ? name : this.name,
      cropType: cropType ?? this.cropType,
      icon: icon ?? this.icon,
      plantedAt: plantedAt ?? this.plantedAt,
      createdAt: createdAt ?? this.createdAt,
      authUserId: authUserId is _i1.UuidValue? ? authUserId : this.authUserId,
      telegramId: telegramId is _i1.UuidValue? ? telegramId : this.telegramId,
    );
  }
}

class PlantModelUpdateTable extends _i1.UpdateTable<PlantModelTable> {
  PlantModelUpdateTable(super.table);

  _i1.ColumnValue<int, int> cultivationDays(int value) => _i1.ColumnValue(
    table.cultivationDays,
    value,
  );

  _i1.ColumnValue<String, String> name(String? value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> cropType(String value) => _i1.ColumnValue(
    table.cropType,
    value,
  );

  _i1.ColumnValue<String, String> icon(String value) => _i1.ColumnValue(
    table.icon,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> plantedAt(DateTime value) =>
      _i1.ColumnValue(
        table.plantedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> authUserId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.authUserId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> telegramId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.telegramId,
    value,
  );
}

class PlantModelTable extends _i1.Table<_i1.UuidValue?> {
  PlantModelTable({super.tableRelation}) : super(tableName: 'plant_storage') {
    updateTable = PlantModelUpdateTable(this);
    cultivationDays = _i1.ColumnInt(
      'cultivationDays',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    cropType = _i1.ColumnString(
      'cropType',
      this,
    );
    icon = _i1.ColumnString(
      'icon',
      this,
    );
    plantedAt = _i1.ColumnDateTime(
      'plantedAt',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    authUserId = _i1.ColumnUuid(
      'authUserId',
      this,
    );
    telegramId = _i1.ColumnUuid(
      'telegramId',
      this,
    );
  }

  late final PlantModelUpdateTable updateTable;

  late final _i1.ColumnInt cultivationDays;

  late final _i1.ColumnString name;

  late final _i1.ColumnString cropType;

  late final _i1.ColumnString icon;

  late final _i1.ColumnDateTime plantedAt;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnUuid authUserId;

  late final _i1.ColumnUuid telegramId;

  @override
  List<_i1.Column> get columns => [
    id,
    cultivationDays,
    name,
    cropType,
    icon,
    plantedAt,
    createdAt,
    authUserId,
    telegramId,
  ];
}

class PlantModelInclude extends _i1.IncludeObject {
  PlantModelInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue?> get table => PlantModel.t;
}

class PlantModelIncludeList extends _i1.IncludeList {
  PlantModelIncludeList._({
    _i1.WhereExpressionBuilder<PlantModelTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PlantModel.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => PlantModel.t;
}

class PlantModelRepository {
  const PlantModelRepository._();

  /// Returns a list of [PlantModel]s matching the given query parameters.
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
  Future<List<PlantModel>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PlantModelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlantModelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlantModelTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<PlantModel>(
      where: where?.call(PlantModel.t),
      orderBy: orderBy?.call(PlantModel.t),
      orderByList: orderByList?.call(PlantModel.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [PlantModel] matching the given query parameters.
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
  Future<PlantModel?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PlantModelTable>? where,
    int? offset,
    _i1.OrderByBuilder<PlantModelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlantModelTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<PlantModel>(
      where: where?.call(PlantModel.t),
      orderBy: orderBy?.call(PlantModel.t),
      orderByList: orderByList?.call(PlantModel.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [PlantModel] by its [id] or null if no such row exists.
  Future<PlantModel?> findById(
    _i1.DatabaseSession session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<PlantModel>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [PlantModel]s in the list and returns the inserted rows.
  ///
  /// The returned [PlantModel]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<PlantModel>> insert(
    _i1.DatabaseSession session,
    List<PlantModel> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<PlantModel>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [PlantModel] and returns the inserted row.
  ///
  /// The returned [PlantModel] will have its `id` field set.
  Future<PlantModel> insertRow(
    _i1.DatabaseSession session,
    PlantModel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PlantModel>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PlantModel]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PlantModel>> update(
    _i1.DatabaseSession session,
    List<PlantModel> rows, {
    _i1.ColumnSelections<PlantModelTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PlantModel>(
      rows,
      columns: columns?.call(PlantModel.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PlantModel]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PlantModel> updateRow(
    _i1.DatabaseSession session,
    PlantModel row, {
    _i1.ColumnSelections<PlantModelTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PlantModel>(
      row,
      columns: columns?.call(PlantModel.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PlantModel] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PlantModel?> updateById(
    _i1.DatabaseSession session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<PlantModelUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PlantModel>(
      id,
      columnValues: columnValues(PlantModel.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PlantModel]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PlantModel>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<PlantModelUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<PlantModelTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlantModelTable>? orderBy,
    _i1.OrderByListBuilder<PlantModelTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PlantModel>(
      columnValues: columnValues(PlantModel.t.updateTable),
      where: where(PlantModel.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlantModel.t),
      orderByList: orderByList?.call(PlantModel.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PlantModel]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PlantModel>> delete(
    _i1.DatabaseSession session,
    List<PlantModel> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PlantModel>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PlantModel].
  Future<PlantModel> deleteRow(
    _i1.DatabaseSession session,
    PlantModel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PlantModel>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PlantModel>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<PlantModelTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PlantModel>(
      where: where(PlantModel.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PlantModelTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PlantModel>(
      where: where?.call(PlantModel.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [PlantModel] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<PlantModelTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<PlantModel>(
      where: where(PlantModel.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
