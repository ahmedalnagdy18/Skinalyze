import 'package:firebase_auth/firebase_auth.dart';
import 'package:skinalyze/features/authentication/domain/entity/login_input.dart';
import 'package:skinalyze/features/authentication/domain/repository/authentication_repository.dart';

class LoginUsecase {
  AuthenticationRepository repository;
  LoginUsecase({required this.repository});
  Future<UserCredential> call(LoginInput input) async {
    return repository.loginAuth(input);
  }
}
