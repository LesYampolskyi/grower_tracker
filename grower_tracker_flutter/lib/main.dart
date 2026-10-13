import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:grower_tracker_client/grower_tracker_client.dart';
import 'package:flutter/material.dart';
import 'package:grower_tracker_flutter/features/garden/add_plant_screen.dart';
import 'package:grower_tracker_flutter/screens/sign_in_screen.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import 'screens/home_screen.dart';

/// Sets up a global client object that can be used to talk to the server from
/// anywhere in our app. The client is generated from your server code
/// and is set up to connect to a Serverpod running on a local server on
/// the default port. You will need to modify this to connect to staging or
/// production servers.
/// In a larger app, you may want to use the dependency injection of your choice
/// instead of using a global client object. This is just a simple example.
late final Client client;

late String serverUrl;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // When you are running the app on a physical device, you need to set the
  // server URL to the IP address of your computer. You can find the IP
  // address by running `ipconfig` on Windows or `ifconfig` on Mac/Linux.
  //
  // You can set the variable when running or building your app like this:
  // E.g. `flutter run --dart-define=SERVER_URL=https://api.example.com/`.
  //
  // Otherwise, the server URL is fetched from the assets/config.json file or
  // defaults to http://$localhost:8080/ if not found.
  // final serverUrl = await getServerUrl();

  const String _prodUrl = String.fromEnvironment(
    'SERVER_URL',
    defaultValue: '',
  );
  String? ip = "192.168.1.101"; // = "192.168.1.101";
  var serverUlr = _serverUrl(_prodUrl, ip);
  client = Client(serverUlr)
    ..connectivityMonitor = FlutterConnectivityMonitor()
    ..authSessionManager = FlutterAuthSessionManager();

  client.auth.initialize();

  runApp(const MyApp());
}

/// Builds a theme for the given [brightness].
ThemeData _buildTheme(Brightness brightness) {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: brightness,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Serverpod Demo',
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      themeMode: ThemeMode.system,
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => const SignInScreen(),
        '/app': (context) => const HomeScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == 'app/garden/detail') {
          return MaterialPageRoute(builder: (_) => AddPlantScreen());
        }

        return null;
      },
    );
  }
}

String _serverUrl(String prodUrl, String? yourIp) {
  // If this is a production build (prodUrl passed via --dart-define)
  if (prodUrl.isNotEmpty) {
    return prodUrl;
  }

  if (yourIp == null || yourIp == '') {
    throw "Error! You do not specify you ip address for android";
  }

  // If this is debug mode (kDebugMode):
  if (kDebugMode) {
    try {
      if (Platform.isAndroid) {
        return 'http://${yourIp}:8080/'; // Special IP for the Android emulator
      }
    } catch (_) {
      // Ignore error if running on Web where Platform is not available
    }

    // For iOS simulator, macOS, Windows, Linux, or a real PC
    return 'http://localhost:8080/';
  }

  // Safe fallback if none of the above matched
  return 'http://localhost:8080/';
}
