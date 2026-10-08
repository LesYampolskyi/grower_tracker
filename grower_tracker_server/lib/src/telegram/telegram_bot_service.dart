import 'package:televerse/televerse.dart';

class TelegramBotService {
  late final Bot _bot;

  TelegramBotService(String token) {
    // Initialize the bot with the provided token
    _bot = Bot(token);

    // Register command and message handlers
    _setupHandlers();
  }

  /// Configure bot logic
  void _setupHandlers() {
    // Handle the /start command
    _bot.command('start', (ctx) async {
      await ctx.reply('Привет! Бот запущен из библиотеки.');
    });

    // Handle the /help command
    _bot.command('help', (ctx) async {
      await ctx.reply('Список доступных команд: /start, /help');
    });

    // Handle any text message
    _bot.onText((ctx) async {
      final text = ctx.message?.text ?? '';
      await ctx.reply('Вы написали: $text');
    });
  }

  /// Sends a message to the specified user by their ID.
  Future<void> sendMessageToUser(int chatId, String text) async {
    await _bot.api.sendMessage(ChatID(chatId), text);
  }

  /// Start the bot
  Future<void> start() async {
    await _bot.start();
  }

  /// Stop the bot (if needed)
  Future<void> stop() async {
    await _bot.stop();
  }
}
