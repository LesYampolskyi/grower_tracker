import 'package:flutter/material.dart';
import 'package:grower_tracker_flutter/config/snakbar_custom.dart';
import 'package:grower_tracker_flutter/main.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return Container(
      color: Colors.amberAccent,
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              var localContext = context;
              await client.modules.serverpod_auth_core.status.signOutDevice();
              if (!localContext.mounted) return;
              Navigator.pushNamedAndRemoveUntil(
                localContext,
                '/auth',
                (Route<dynamic> route) => false,
              );
            },
            child: Text("Log out"),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                var result = await client.schedules.setSchedule(
                  "Don't forget to water your plants!",
                );
                if (!context.mounted) return;
                if (result) {
                  context.showSnackBar(
                    message: 'Scheduled task has been set!!',
                    backgroundColor: colors.primaryContainer,
                    foregroundColor: colors.onPrimaryContainer,
                  );
                } else {
                  context.showSnackBar(
                    message: 'Please connect your Telegram account',
                    backgroundColor: colors.errorContainer,
                    foregroundColor: colors.onErrorContainer,
                  );
                }
              } catch (e) {
                context.showSnackBar(
                  message: 'Failed to schedule task',
                  backgroundColor: colors.errorContainer,
                  foregroundColor: colors.onErrorContainer,
                );
              }
            },
            child: Text("Schedule task"),
          ),
        ],
      ),
    );
  }
}
