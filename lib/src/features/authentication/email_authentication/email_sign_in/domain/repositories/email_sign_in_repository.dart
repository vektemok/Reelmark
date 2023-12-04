import '../../../../user_session_listener/model/user_model.dart';

abstract interface class EmailSignInRepository{
  Future<UserModel?> signInWithEmail(final String email, final String password);
}