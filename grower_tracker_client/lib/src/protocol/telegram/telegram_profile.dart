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

abstract class TelegramProfile implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  int telegramId;

  int chatId;

  String? firstName;

  String? lastName;

  String? username;

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
