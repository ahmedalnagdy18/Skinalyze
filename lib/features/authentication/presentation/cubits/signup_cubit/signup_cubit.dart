import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:skinalyze/features/authentication/domain/entity/sign_up_input.dart';
import 'package:skinalyze/features/authentication/domain/usecase/sign_up_usecase.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignUpUsecase signUpUsecase;
  SignupCubit({required this.signUpUsecase}) : super(SignupCubitInitial());

  void registerFuc({
    required SignUpInput input,
  }) async {
    try {
      emit(LoadingSignupState());

      await signUpUsecase.call(input);
      emit(SucsessSignupState());
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorSignupState(message: e.message));
      } else {
        emit(const ErrorSignupState(message: "Error"));
      }
    }
  }
}
