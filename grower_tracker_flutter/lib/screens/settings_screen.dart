import 'package:flutter/material.dart';
import 'package:grower_tracker_flutter/main.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
