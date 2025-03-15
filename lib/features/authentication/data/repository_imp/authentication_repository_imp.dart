import 'package:firebase_auth/firebase_auth.dart';
import 'package:skinalyze/features/authentication/data/model/api_login_input.dart';
import 'package:skinalyze/features/authentication/data/model/api_sign_up_input.dart';
import 'package:skinalyze/features/authentication/domain/entity/login_input.dart';
import 'package:skinalyze/features/authentication/domain/entity/sign_up_input.dart';
import 'package:skinalyze/features/authentication/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<UserCredential> loginAuth(LoginInput input) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: ApiLoginInput.fromInput(input).email ?? '',
          password: ApiLoginInput.fromInput(input).passWord ?? '');
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {}
      rethrow;
    }
  }

  @override
  Future<UserCredential> register(SignUpInput input) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: ApiSignUpInput.fromInput(input).email,
          password: ApiSignUpInput.fromInput(input).password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {}
      rethrow;
    }
  }
}
