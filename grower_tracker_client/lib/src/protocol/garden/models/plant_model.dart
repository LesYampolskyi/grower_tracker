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

import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class PlantModel implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  int cultivationDays;

  String? name;

  String cropType;

  String icon;

  DateTime plantedAt;

  DateTime createdAt;

  _i1.UuidValue? authUserId;

  _i1.UuidValue? telegramId;

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
