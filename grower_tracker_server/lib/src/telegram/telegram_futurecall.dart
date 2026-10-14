import 'package:grower_tracker_server/server.dart';
import 'package:serverpod/serverpod.dart';
import 'package:televerse/televerse.dart';

class TelegramFutureCall extends FutureCall {
  Future<void> sendMessage(Session session, String message, int chatId) async {
    await botService.bot.api.sendMessage(
      ChatID(chatId),
      message,
    );

    session.log("Message was added");
  }
}
