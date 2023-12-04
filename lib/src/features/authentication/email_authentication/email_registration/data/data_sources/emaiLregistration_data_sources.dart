import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled14/src/common/utils/failures/authentication_failure.dart';

import '../../../../user_session_listener/model/user_model.dart';

abstract interface class IEmailRegistrationDataSources {
  Future<UserModel?> registerWithEmail(
      final String email, final String password,
      [String? name]);

  Future<void> _updateName(User user, String? name);
}

final class EmailRegistrationDataSources
    implements IEmailRegistrationDataSources {
  @override
  Future<UserModel?> registerWithEmail(String email, String password,
      [String? name]) async {
    try {
      return await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((credential) async {
        await _updateName(credential.user, name);
        return UserModel.fromUserModel(credential.user!);
      });
    } on FirebaseAuthException catch (e, stackTrace) {
      Error.throwWithStackTrace(
          RegistrationFailure(message: e.code), stackTrace);
    }
  }

  @override
  Future<void> _updateName(User? user, String? name) async {
    if (name != null) {
      await user!.updateDisplayName(name);
    } else {
      await user!.updateDisplayName('User');
    }
  }
}
