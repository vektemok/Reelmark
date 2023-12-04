import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled14/src/common/utils/failures/logger.dart';
import 'package:untitled14/src/features/authentication/user_session_listener/app_service.dart';

class SessionListener extends StatefulWidget {
  const SessionListener({super.key});

  @override
  State<SessionListener> createState() => _SessionListenerState();
}

class _SessionListenerState extends State<SessionListener> {
  @override
  void initState() {
    AppServices.instance.listenAppCheckToken().listen(_seeAppCheckToken);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: AppServices.instance.userAuthStateChangesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {}
          if (snapshot.hasError) {}
          if (snapshot.connectionState == ConnectionState.waiting) {}

          return AuthScreen();
        });
  }

  void _seeAppCheckToken(String? event) {
    debugPrint(event);
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
