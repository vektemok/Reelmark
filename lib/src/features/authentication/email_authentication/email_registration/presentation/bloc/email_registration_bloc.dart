import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../user_session_listener/model/user_model.dart';

import '../../data/repositories/email_registration_repository.dart';

part 'email_registration_bloc.freezed.dart';

class EmailRegistrationBloc
    extends Bloc<EmailRegistrationEvent, EmailRegistrationState> {
  final EmailRegistrationRepositoryImpl emailRegistrationRepositoryImpl;

  EmailRegistrationBloc(this.emailRegistrationRepositoryImpl)
      : super(const EmailRegistrationState.initial()) {
    on<RegisterWithEmail>(_registerWithEmail);
  }

  Future<void> _registerWithEmail(
      RegisterWithEmail event, Emitter<EmailRegistrationState> emit) async {
    return emailRegistrationRepositoryImpl
        .registerWithEmail(event.email, event.password, event.name)
        .then((user) => emit(EmailRegistrationState.completed(user!)))
        .catchError((e, stackTrace) {
      emit(const EmailRegistrationState.failure());
      debugPrint(stackTrace);
    });
  }
}

@freezed
class EmailRegistrationState with _$EmailRegistrationState {
  const factory EmailRegistrationState.initial() = _Initial;

  const factory EmailRegistrationState.completed(final UserModel userModel) =
      _Completed;

  const factory EmailRegistrationState.fetching() = _Fetching;

  const factory EmailRegistrationState.failure() = _Failure;
}

abstract class EmailRegistrationEvent extends Equatable {}

final class RegisterWithEmail extends EmailRegistrationEvent {
  RegisterWithEmail(
      {required this.name, required this.password, required this.email});

  final String name;
  final String password;
  final String email;

  @override
  List<Object> get props => [name, password, email];
}
