import 'package:flutter/material.dart';
import 'package:grower_tracker_flutter/config/snakbar_custom.dart';
import 'package:grower_tracker_flutter/features/garden/action_button.dart';
import 'package:grower_tracker_flutter/main.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 30,
      children: [
        ActionButton(
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
          label: "Log out",
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        ActionButton(
          onPressed: () async {
            context.showSnackBar(
              message: 'Loading....',
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            );

            try {
              var result = await client.schedules.setSchedule(
                "Don't forget to water your plants!",
              );
              if (!context.mounted) return;
              if (result) {
                context.showSnackBar(
                  message: 'Scheduled task has been set!',
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
          label: "Schedule task",
        ),
      ],
    );
  }
}
