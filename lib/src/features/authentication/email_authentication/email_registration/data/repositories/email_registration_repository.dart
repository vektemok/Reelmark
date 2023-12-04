import '../../../../user_session_listener/model/user_model.dart';

import '../../domain/repositories/email_registration_repository.dart';
import '../data_sources/emaiLregistration_data_sources.dart';

class EmailRegistrationRepositoryImpl implements EmailRegistrationRepository {
  EmailRegistrationRepositoryImpl({required this.emailRegistrationDataSources});

  final IEmailRegistrationDataSources emailRegistrationDataSources;

  @override
  Future<UserModel?> registerWithEmail(String email, String password,
      [String? name]) async {
    return await emailRegistrationDataSources.registerWithEmail(email, password, name);
  }
}
