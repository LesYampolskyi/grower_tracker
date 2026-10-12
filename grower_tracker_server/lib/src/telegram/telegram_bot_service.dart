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
        throw "Invalid request. No chait id or telegram_id";
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
        throw "Can't register Telegram user";
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
        'Yout username: $username',
      );
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
        await ctx.answerCallbackQuery(text: "Товар #$item куплен!");
        // Optionally edit the message
        await ctx.editMessageText('You clicked the button of $item!');
      }
    });

    /// Handle all text
    bot.onText((ctx) async {
      final text = ctx.text;
      await ctx.reply('Эхо: $text');
    });
  }
}
