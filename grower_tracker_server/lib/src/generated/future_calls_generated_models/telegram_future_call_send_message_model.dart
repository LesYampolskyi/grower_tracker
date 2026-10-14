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

abstract class TelegramFutureCallSendMessageModel
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TelegramFutureCallSendMessageModel._({
    required this.message,
    required this.chatId,
  });

  factory TelegramFutureCallSendMessageModel({
    required String message,
    required int chatId,
  }) = _TelegramFutureCallSendMessageModelImpl;

  factory TelegramFutureCallSendMessageModel.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return TelegramFutureCallSendMessageModel(
      message: jsonSerialization['message'] as String,
      chatId: jsonSerialization['chatId'] as int,
    );
  }

  String message;

  int chatId;

  /// Returns a shallow copy of this [TelegramFutureCallSendMessageModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TelegramFutureCallSendMessageModel copyWith({
    String? message,
    int? chatId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TelegramFutureCallSendMessageModel',
      'message': message,
      'chatId': chatId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TelegramFutureCallSendMessageModelImpl
    extends TelegramFutureCallSendMessageModel {
  _TelegramFutureCallSendMessageModelImpl({
    required String message,
    required int chatId,
  }) : super._(
         message: message,
         chatId: chatId,
       );

  /// Returns a shallow copy of this [TelegramFutureCallSendMessageModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TelegramFutureCallSendMessageModel copyWith({
    String? message,
    int? chatId,
  }) {
    return TelegramFutureCallSendMessageModel(
      message: message ?? this.message,
      chatId: chatId ?? this.chatId,
    );
  }
}
