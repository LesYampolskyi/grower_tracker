import 'package:flutter/material.dart';
import 'package:grower_tracker_flutter/config/snakbar_custom.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart'
    as auth;

import '../main.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    super.initState();
    client.auth.authInfoListenable.addListener(_updateSignedInState);
  }

  @override
  void dispose() {
    client.auth.authInfoListenable.removeListener(_updateSignedInState);
    super.dispose();
  }

  void _updateSignedInState() {
    setState(() {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/app',
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: auth.SignInWidget(
          disableAnonymousSignInWidget: false,
          client: client,
          onAuthenticated: () {
            context.showSnackBar(
              message: 'User authenticated.',
              backgroundColor: colors.primaryContainer,
              foregroundColor: colors.onPrimaryContainer,
            );
          },
          onError: (error) {
            context.showSnackBar(
              message: 'Authentication failed: $error',
              backgroundColor: colors.errorContainer,
              foregroundColor: colors.onErrorContainer,
            );
          },
        ),
      ),
    );
  }
}
