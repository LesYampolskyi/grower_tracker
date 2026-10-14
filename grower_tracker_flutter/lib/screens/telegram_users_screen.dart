import 'package:flutter/material.dart';
import 'package:grower_tracker_client/grower_tracker_client.dart';
import 'package:grower_tracker_flutter/config/snakbar_custom.dart';
import 'package:grower_tracker_flutter/features/garden/action_button.dart';
import 'package:grower_tracker_flutter/main.dart';

class TelegramUsersScreen extends StatefulWidget {
  const TelegramUsersScreen({super.key});

  @override
  State<TelegramUsersScreen> createState() => _TelegramUsersScreenState();
}

class _TelegramUsersScreenState extends State<TelegramUsersScreen> {
  List<TelegramProfile> items = [];

  Future<void> onAction(ColorScheme colors) async {
    context.showSnackBar(
      message: 'Loading....',
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
    );
    try {
      var result = await client.greeting.telegramUsers();
      if (!context.mounted) return;
      setState(() {
        items = result;
      });
      if (!context.mounted) return;

      context.showSnackBar(
        message: 'Users are loaded',
        backgroundColor: colors.primaryContainer,
        foregroundColor: colors.onPrimaryContainer,
      );
    } catch (e) {
      if (!context.mounted) return;
      context.showSnackBar(
        message: 'Error to fetch data',
        backgroundColor: colors.errorContainer,
        foregroundColor: colors.onErrorContainer,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ActionButton(
                  onPressed: () async {
                    await onAction(colors);
                  },
                  label: "Load telegram users",
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: (items.isEmpty)
                ? Text("No data")
                : ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: const Color(
                          0xFFEFF6FF,
                        ), // Цвет фона карточки (например, светлый синий)
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          textColor: Colors.black87,
                          iconColor: Colors.black87,
                          leading: Text((index + 1).toString()),
                          title: Text(
                            items[index].firstName ??
                                items[index].username ??
                                items[index].chatId.toString(),
                          ),

                          onTap: () async {
                            context.showSnackBar(
                              message: 'Loading....',
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            );
                            try {
                              await client.schedules
                                  .askConfirmationFromTelegramUser(
                                    items[index].chatId,
                                  );
                              if (!context.mounted) return;

                              context.showSnackBar(
                                message: 'The request has been sent',
                                backgroundColor: colors.primaryContainer,
                                foregroundColor: colors.onPrimaryContainer,
                              );
                            } catch (e) {
                              context.showSnackBar(
                                message: 'Error',
                                backgroundColor: colors.primaryContainer,
                                foregroundColor: colors.onPrimaryContainer,
                              );
                            }
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
