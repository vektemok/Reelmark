import '../../../../user_session_listener/model/user_model.dart';

abstract interface class EmailRegistrationRepository {
  Future<UserModel?> registerWithEmail(
      final String email, final String password,
      [String? name]);
}
