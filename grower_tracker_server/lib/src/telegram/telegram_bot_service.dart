import 'package:grower_tracker_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:televerse/televerse.dart';
import 'package:collection/collection.dart';

class TelegramBotService {
  late Serverpod pod;

  late final Bot bot;

  TelegramBotService(String token, this.pod) {
    // Initialize the bot with the provided token
    bot = Bot(token);

    // Register command and message handlers
    _setupHandlers();
  }

  void _setupHandlers() {
    /// Register the user in the TelegramProfile table. If the user is already
    /// registered, reply "You are already registered!"
    bot.command('start', (ctx) async {
      final session = await pod.createSession();

      var chatId = ctx.chat?.id;
      var lastName = ctx.chat?.lastName;
      var firstName = ctx.chat?.firstName;
      var username = ctx.chat?.username;
      var telegramId = ctx.from?.id;
      if (chatId == null && telegramId == null) {
        throw Exception("Invalid request. No chat_id or telegram_id");
      }
      try {
        TelegramProfile? user = await TelegramProfile.db.findFirstRow(
          session,
          where: (t) => t.telegramId.equals(telegramId),
        );

        if (user == null) {
          await TelegramProfile.db.insertRow(
            session,
            TelegramProfile(
              telegramId: telegramId!,
              chatId: chatId!,
              firstName: firstName,
              username: username,
              lastName: lastName,
            ),
          );
          var greeting = username != '' ? "Hello, $username!" : "Hello!";
          var message =
              "$greeting. You have been registered with the bot!\n"
              "You can now receive notifications and messages from the app!";
          await ctx.reply(message);
        } else {
          await ctx.reply("You are already registered!");
        }
      } catch (e) {
        throw "Failed to register Telegram user";
      }
    });

    bot.command("list", (ctx) async {
      final session = await pod.createSession();

      final count = await TelegramProfile.db.count(session);
      await ctx.reply("Count of users: $count");
    });

    /// DEMO
    bot.command('pick', (ctx) async {
      var text = [
        "🍅 Tomato",
        "🥕 Carrot",
        "🥒 Cucumber",
        "🧄 Garlic",
        "🧅 Onion",
      ];
      final buttons = text
          .map(
            (e) => InlineKeyboard.buttonText(e, "buy:$e"),
          )
          .slices(2)
          .toList();

      final keyboard = InlineKeyboard.fromButtons(buttons);

      await ctx.reply(
        'Pick A Plant ',
        replyMarkup: keyboard,
      );
    });

    /// Get telegram_id and telegram username
    bot.command('my_info', (ctx) async {
      var username = ctx.chat?.username;
      var telegramId = ctx.from?.id;
      await ctx.reply(
        'Your id is: $telegramId\n'
        'Your username: $username',
      );
    });

    // DEMO
    bot.command('confirm', (ctx) async {
      var yesButton = InlineKeyboard.buttonText('Yes', 'demo_confirm_yes');
      var noButton = InlineKeyboard.buttonText('No', 'confirm_no');
      var buttons = [
        [yesButton, noButton],
      ];
      var keyboard = InlineKeyboard.fromButtons(buttons);
      var chatId = ctx.chat?.id;
      if (chatId == null) {
        throw Exception("Invalid context in Telegram. No chat_id");
      }
      await bot.api.sendMessage(
        ChatID(chatId),
        'Test. No actions. Link to user <User>?',
        replyMarkup: keyboard,
      );
    });

    // DEMO
    bot.callbackQuery("demo_confirm_yes", (ctx) async {
      await ctx.answerCallbackQuery(text: 'Accepted!');

      await ctx.editMessageText(
        '✅ Action successfully confirmed.',
      );
    });

    bot.callbackQuery("confirm_yes", (ctx) async {
      var chatId = ctx.id.id;
      var message = ctx.text;
      if (message == null) throw "Invalid confirmation data in Telegram!";
      var from = message.split("->")[1].trim();
      from = from.substring(0, from.length - 1);
      final session = await pod.createSession();
      var profile = await TelegramProfile.db.findFirstRow(
        session,
        where: (t) => t.telegramId.equals(chatId),
      );

      if (profile == null) throw Exception("Telegram profile not found");
      var profileId = profile.id;
      if (profileId == null) throw Exception("Telegram ID not found");

      var items = await PlantModel.db.updateWhere(
        session,
        columnValues: (t) => [
          t.telegramId(profileId),
        ],
        where: (t) => t.authUserId.equals(UuidValue.fromString(from)),
      );

      // Always answer the callback query to remove the loading spinner from
      // the button.
      await ctx.answerCallbackQuery(text: 'Accepted!');

      // Edit the message by removing the inline keyboard and updating the text.
      await ctx.editMessageText(
        '✅ Action successfully confirmed.. ${items.length} Rows updated successfully',
      );
    });

    bot.callbackQuery("confirm_no", (ctx) async {
      await ctx.answerCallbackQuery(text: 'Cancel');

      // Edit the message.
      await ctx.editMessageText('❌ Action was canceled.');
    });

    // Or use bot.on(CallbackQuery) for general handling
    bot.onCallbackQuery((ctx) async {
      final data = ctx.callbackQuery?.data;
      if (data == null) return;

      // Handlers for /pick command
      if (data.startsWith("buy:")) {
        final parts = data.split(':');
        if (parts.length < 2) return;

        var item = parts[1];
        await ctx.answerCallbackQuery(text: "#$item is picked!!");
        // Optionally edit the message
        await ctx.editMessageText('You clicked the button of $item!');
      }
    });

    /// Handle all text
    bot.onText((ctx) async {
      final text = ctx.text;
      await ctx.reply('Echo: $text');
    });
  }

  /// Add to the the mobile user
  Future<void> askConfirmation(int chatId, String messageFrom) async {
    var yesButton = InlineKeyboard.buttonText('Yes', 'confirm_yes');
    var noButton = InlineKeyboard.buttonText('No', 'confirm_no');
    var buttons = [
      [yesButton, noButton],
    ];
    final keyboard = InlineKeyboard.fromButtons(buttons);

    await bot.api.sendMessage(
      ChatID(chatId),
      'Add to the user -> $messageFrom?',
      replyMarkup: keyboard,
    );
  }
}
