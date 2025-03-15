import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:skinalyze/features/authentication/domain/entity/login_input.dart';
import 'package:skinalyze/features/authentication/domain/usecase/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  final LoginUsecase loginUsecase;
  LoginCubit({required this.loginUsecase}) : super(LoginCubitInitial());

  void login({required LoginInput loginEntity}) async {
    emit(LoadingLoginState());
    try {
      await loginUsecase.call(loginEntity);
      emit(SucsessLoginState());
    } catch (e) {
      emit(ErrorLoginState(message: e.toString()));
    }
  }
}
