import 'package:flutter/material.dart';
import 'package:grower_tracker_client/grower_tracker_client.dart';
import 'package:grower_tracker_flutter/main.dart';

class TelegramUsersScreen extends StatefulWidget {
  const TelegramUsersScreen({super.key});

  @override
  State<TelegramUsersScreen> createState() => _TelegramUsersScreenState();
}

class _TelegramUsersScreenState extends State<TelegramUsersScreen> {
  List<TelegramProfile> items = [];

  Future<void> onAction() async {
    var result = await client.greeting.telegramUsers();
    setState(() {
      items = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () async {
                  await onAction();
                },
                child: Text("Action space"),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(index.toString()),
                title: Text(
                  items[index].username ?? "No user name",
                ),
                subtitle: Text(items[index].telegramId.toString()),
                trailing: const Icon(
                  Icons.chevron_right,
                ),
                onTap: () async {
                  await client.schedules.askConfirmationFromTelegramUser(
                    items[index].chatId,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
