import 'package:firebase_auth/firebase_auth.dart';
import 'package:skinalyze/features/authentication/domain/entity/login_input.dart';
import 'package:skinalyze/features/authentication/domain/entity/sign_up_input.dart';

abstract class AuthenticationRepository {
  Future<UserCredential> loginAuth(LoginInput input);
  Future<UserCredential> register(SignUpInput input);
}
