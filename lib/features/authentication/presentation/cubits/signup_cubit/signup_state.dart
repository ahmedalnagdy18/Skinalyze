part of 'signup_cubit.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignupCubitInitial extends SignupState {}

class LoadingSignupState extends SignupState {}

class SucsessSignupState extends SignupState {}

class ErrorSignupState extends SignupState {
  final String message;

  const ErrorSignupState({required this.message});

  @override
  List<Object> get props => [message];
}
