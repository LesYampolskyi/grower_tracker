import 'package:flutter/material.dart';
import 'package:grower_tracker_flutter/screens/garden_screen.dart';
import 'package:grower_tracker_flutter/screens/settings_screen.dart';
import 'package:grower_tracker_flutter/screens/telegram_users_screen.dart';

class HomeScreen extends StatelessWidget {
  final Future<void> Function()? onSignOut;

  const HomeScreen({super.key, this.onSignOut});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(child: Text('Telegram users')),
              Tab(child: Text('Garden')),
              Tab(child: Text('Settings')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TelegramUsersScreen(),
            GardenScreen(),
            SettingsScreen(),
          ],
        ),
      ),
    );
  }
}
