import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppServices {
  AppServices._();

  static AppServices get instance => AppServices._();

  Stream<User?> userAuthStateChangesStream() async* {
    yield* FirebaseAuth.instance.authStateChanges();
  }

  Stream<String?> listenAppCheckToken() async* {
    yield* FirebaseAppCheck.instance.onTokenChange;
  }
}
