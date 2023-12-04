import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled14/src/features/authentication/user_session_listener/model/user_model.dart';

import '../../domain/repositories/email_sign_in_repository.dart';

part 'email_sign_in_bloc.freezed.dart';

class EmailSignInBloc extends Bloc<EmailSignInEvent, EmailSignInState> {
  final EmailSignInRepository emailSignInRepository;

  EmailSignInBloc(this.emailSignInRepository)
      : super(const EmailSignInState.initial()) {
    on<SignInWithEmail>(_signInWithEmail);
  }

  Future<void> _signInWithEmail(
      SignInWithEmail event, Emitter<EmailSignInState> emit) async {
    return await emailSignInRepository
        .signInWithEmail(event.email, event.password)
        .then((user) => emit(EmailSignInState.completed(user!)))
        .catchError((e, stackTrace) {
      emit(const EmailSignInState.failure());
      debugPrint(stackTrace);
    });
  }
}

@freezed
class EmailSignInState with _$EmailSignInState {
  const factory EmailSignInState.initial() = _Initial;

  const factory EmailSignInState.completed(final UserModel userModel) =
      _Completed;

  const factory EmailSignInState.fetching() = _Fetching;

  const factory EmailSignInState.failure() = _Failure;
}

abstract class EmailSignInEvent extends Equatable {}

final class SignInWithEmail extends EmailSignInEvent {
  SignInWithEmail({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}
