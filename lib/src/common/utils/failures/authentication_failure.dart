final class RegistrationFailure implements Exception {
  RegistrationFailure({required this.message});

  final String message;

  factory RegistrationFailure.fromCode(String message) {
    switch (message) {
      case 'wrong-password':
        return RegistrationFailure(message: 'wrong password');
      default:
        return RegistrationFailure(message: 'default error');
    }
  }


}


final class SignInFailure implements Exception{
  SignInFailure({required this.message});

  final String message;

  factory SignInFailure.fromCode(String message) {
    switch (message) {
      case 'wrong-password':
        return SignInFailure(message: 'wrong password');
      default:
        return SignInFailure(message: 'default error');
    }
  }
}
