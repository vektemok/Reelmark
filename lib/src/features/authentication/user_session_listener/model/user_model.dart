import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends Equatable {
  const UserModel(
      {required this.email,
        required this.photoUrl,
        required this.displayName,
        required this.uid});

  final String email;
  final String photoUrl;
  final String displayName;
  final String uid;

  @override
  List<Object> get props => [email, photoUrl, displayName, uid];

  factory UserModel.fromUserModel(User user) {
    return UserModel(
        email: user.email!,
        photoUrl: user.photoURL!,
        displayName: user.displayName!,
        uid: user.uid);
  }
}
