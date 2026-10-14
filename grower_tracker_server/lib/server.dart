import 'dart:async';
import 'dart:io';

import 'package:grower_tracker_server/src/telegram/telegram_bot_service.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';
import 'package:serverpod_auth_idp_server/providers/anonymous.dart';

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';
import 'src/web/routes/app_config_route.dart';
import 'src/web/routes/root.dart';

late TelegramBotService botService;

/// The starting point of the Serverpod server.
Future<void> run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(args, Protocol(), Endpoints());

  // Initialize authentication services for the server.
  // Token managers will be used to validate and issue authentication keys,
  // and the identity providers will be the authentication options available for users.
  pod.initializeAuthServices(
    tokenManagerBuilders: [
      // Use JWT for authentication keys towards the server.
      JwtConfigFromPasswords(),
    ],
    identityProviderBuilders: [
      // Configure the email identity provider for email/password authentication.
      EmailIdpConfigFromPasswords(
        // sendRegistrationVerificationCode: _sendRegistrationCode,
        sendRegistrationVerificationCode:
            (
              session, {
              required accountRequestId,
              required email,
              required transaction,
              required verificationCode,
            }) => _sendRegistrationCode(
              session,
              email: email,
              accountRequestId: accountRequestId,
              transaction: transaction,
              verificationCode: verificationCode,
              // bot: bot,
            ),
        sendPasswordResetVerificationCode: _sendPasswordResetCode,
      ),
      AnonymousIdpConfig(),
    ],
  );

  // Setup a default page at the web root.
  // These are used by the default page.
  pod.webServer.addRoute(RootRoute(), '/');
  pod.webServer.addRoute(RootRoute(), '/index.html');

  // Serve all files in the web/static relative directory under /.
  // These are used by the default web page.
  final root = Directory(Uri(path: 'web/static').toFilePath());
  pod.webServer.addRoute(StaticRoute.directory(root));

  // Setup the app config route.
  // We build this configuration based on the servers api url and serve it to
  // the flutter app.
  pod.webServer.addRoute(
    AppConfigRoute(apiConfig: pod.config.apiServer),
    '/app/assets/assets/config.json',
  );

  // Checks if the flutter web app has been built and serves it if it has.
  final appDir = Directory(Uri(path: 'web/app').toFilePath());
  if (appDir.existsSync()) {
    // Serve the flutter web app under the /app path.
    pod.webServer.addRoute(
      FlutterRoute(
        Directory(
          Uri(path: 'web/app').toFilePath(),
        ),
      ),
      '/app',
    );
  } else {
    // If the flutter web app has not been built, serve the build app page.
    pod.webServer.addRoute(
      StaticRoute.file(
        File(
          Uri(path: 'web/pages/build_flutter_app.html').toFilePath(),
        ),
      ),
      '/app/**',
    );
  }
  // Set up Telegram Bot
  setUpTelegramBot(pod);
  // Start the server.
  await pod.start();
}

void _sendRegistrationCode(
  Session session, {
  required String email,
  required UuidValue accountRequestId,
  required String verificationCode,
  required Transaction? transaction,
  // required TelegramBotService bot,
}) {
  // NOTE: Here you call your mail service to send the verification code to
  // the user. For testing, we will just log the verification code.

  // bot.sendMessageToUser(11, "Registration code ($email): $verificationCode");
  session.log('[EmailIdp] Registration code ($email): $verificationCode');
}
// void _sendRegistrationCode(
//   Session session, {
//   required String email,
//   required UuidValue accountRequestId,
//   required String verificationCode,
//   required Transaction? transaction,
// }) {
//   // NOTE: Here you call your mail service to send the verification code to
//   // the user. For testing, we will just log the verification code.
//   session.log('[EmailIdp] Registration code ($email): $verificationCode');
// }

void _sendPasswordResetCode(
  Session session, {
  required String email,
  required UuidValue passwordResetRequestId,
  required String verificationCode,
  required Transaction? transaction,
}) {
  // NOTE: Here you call your mail service to send the verification code to
  // the user. For testing, we will just log the verification code.
  session.log('[EmailIdp] Password reset code ($email): $verificationCode');
}

void setUpTelegramBot(Serverpod pod) async {
  /// Initialize Telegram bot.
  final botToken = pod.getPassword("telegramToken");
  if (botToken == null) {
    throw "Telegram token not found";
  }
  botService = TelegramBotService(botToken, pod);
  final isProduction = pod.runMode == ServerpodRunMode.production;

  try {
    final webhookUrl = pod.getPassword("webhookUrl");
    if (webhookUrl == null) throw "webhookUrl is not assign!";

    if (!isProduction) {
      // It is important not to await the keyboard. If used, processing will
      // halt and subsequent code will not execute
      unawaited(
        botService.bot.startWebhookDev(
          webhookUrl,
          port: 8092,
          webhookPath: "/telegram/webhook",
        ),
      );
    } else {
      // Prod Webhook
      print("=====else it is production!!!!");
      throw "Prod webhook is Not implemented";
      botService.bot.startWebhook(
        webhookUrl: webhookUrl,
        port: 8082,
        webhookPath: "/telegram/webhook",
      );
    }
  } catch (e) {
    throw "Problems with webhook in telegram bot";
  }
}
