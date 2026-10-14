import 'package:grower_tracker_server/server.dart';
import 'package:grower_tracker_server/src/generated/endpoints.dart';
import 'package:grower_tracker_server/src/generated/garden/models/plant_model.dart';
import 'package:grower_tracker_server/src/generated/telegram/telegram_profile.dart';
import 'package:serverpod/serverpod.dart';

class SchedulesEndpoint extends Endpoint {
  /// Requests permission from the selected Telegram user to link their account
  /// to the mobile app user.
  Future<void> askConfirmationFromTelegramUser(
    Session session,
    int chatId,
  ) async {
    final from = session.authenticated?.userIdentifier;
    if (from == null) throw Exception("Invalid data session or userIdentifier");
    await botService.askConfirmation(chatId, from);
  }

  Future<bool> setSchedule(Session session, String message) async {
    final from = session.authenticated?.userIdentifier;
    if (from == null) throw Exception("Invalid data session or userIdentifier");
    var profile = await findChatId(session, from);
    if (profile == null) {
      return false;
    }
    await pod.futureCalls
        .callWithDelay(Duration(seconds: 3))
        .telegram
        .sendMessage(message, profile.chatId);
    return true;
  }

  // TODO: Add telegram id to the user in Serverpod
  // Currently, the Telegram profile is not linked to the user profile in Serverpod.
  // Therefore, after connecting a Telegram account in the mobile app,
  // only the telegramId of all plants belonging to the mobile app user is updated.
  Future<TelegramProfile?> findChatId(Session session, String from) async {
    var plant = await PlantModel.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(UuidValue.fromString(from)),
    );
    if (plant == null || plant.telegramId == null) {
      return null;
    }
    return await TelegramProfile.db.findById(session, plant.telegramId!);
  }
}
