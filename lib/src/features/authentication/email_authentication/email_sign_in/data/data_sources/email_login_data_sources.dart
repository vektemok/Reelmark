import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled14/src/common/utils/failures/authentication_failure.dart';

import '../../../../user_session_listener/model/user_model.dart';

abstract interface class IEmailSignInDataSources {
  Future<UserModel?> signInWithEmail(final String email, final String password);
}

final class EmailSignInDataSources implements IEmailSignInDataSources {
  @override
  Future<UserModel?> signInWithEmail(String email, String password) async {
    try {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((userCredential) =>
              UserModel.fromUserModel(userCredential.user!));
    } on FirebaseAuthException catch (e, stackTrace) {
      Error.throwWithStackTrace(SignInFailure.fromCode(e.message!), stackTrace);
    }
  }
}
