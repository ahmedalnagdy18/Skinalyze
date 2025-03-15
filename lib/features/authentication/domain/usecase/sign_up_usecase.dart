import 'package:firebase_auth/firebase_auth.dart';
import 'package:skinalyze/features/authentication/domain/entity/sign_up_input.dart';
import 'package:skinalyze/features/authentication/domain/repository/authentication_repository.dart';

class SignUpUsecase {
  AuthenticationRepository repository;
  SignUpUsecase({required this.repository});
  Future<UserCredential> call(SignUpInput input) async {
    return repository.register(input);
  }
}
