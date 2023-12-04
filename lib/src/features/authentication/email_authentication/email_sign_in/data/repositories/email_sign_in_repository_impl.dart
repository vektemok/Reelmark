import 'package:untitled14/src/features/authentication/email_authentication/email_sign_in/data/data_sources/email_login_data_sources.dart';
import 'package:untitled14/src/features/authentication/email_authentication/email_sign_in/domain/repositories/email_sign_in_repository.dart';
import 'package:untitled14/src/features/authentication/user_session_listener/model/user_model.dart';

final class EmailSignInRepositoryImpl implements EmailSignInRepository {
  final EmailSignInDataSources emailSignInDataSources;

  EmailSignInRepositoryImpl({required this.emailSignInDataSources});

  @override
  Future<UserModel?> signInWithEmail(String email, String password) async {
    return await emailSignInDataSources.signInWithEmail(email, password);
  }
}
