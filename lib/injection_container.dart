import 'package:get_it/get_it.dart';
import 'package:skinalyze/features/authentication/data/repository_imp/authentication_repository_imp.dart';
import 'package:skinalyze/features/authentication/domain/repository/authentication_repository.dart';
import 'package:skinalyze/features/authentication/domain/usecase/login_usecase.dart';
import 'package:skinalyze/features/authentication/domain/usecase/sign_up_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Usecases
  sl.registerLazySingleton<LoginUsecase>(() => LoginUsecase(repository: sl()));
  sl.registerLazySingleton<SignUpUsecase>(
      () => SignUpUsecase(repository: sl()));

  // Repository

  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImp());
}
