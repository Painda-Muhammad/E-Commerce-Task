import 'package:e_commerce_task/feature/user/data/remot_data_source/user_remote_data_source.dart';
import 'package:e_commerce_task/feature/user/data/repository/user_repository_impl.dart';
import 'package:e_commerce_task/feature/user/domain/repository/user_repository.dart';
import 'package:e_commerce_task/feature/user/domain/use_case/all_user_usecase.dart';
import 'package:e_commerce_task/feature/user/domain/use_case/create_user_usecase.dart';
import 'package:e_commerce_task/feature/user/domain/use_case/current_user_id_usecase.dart';
import 'package:e_commerce_task/feature/user/domain/use_case/forgot_password_usecase.dart';
import 'package:e_commerce_task/feature/user/domain/use_case/google_auth_usecase.dart';
import 'package:e_commerce_task/feature/user/domain/use_case/login_usecase.dart';
import 'package:e_commerce_task/feature/user/domain/use_case/signup_usecase.dart';
import 'package:e_commerce_task/feature/user/domain/use_case/update_user_usecase.dart';
import 'package:e_commerce_task/feature/user/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:e_commerce_task/feature/user/presentation/cubit/credentials/cubit/credentials_cubit.dart';

import '../injection_container.dart';
import './data/remot_data_source/user_remote_data_source_impl.dart';
import 'domain/use_case/is_login_usecase.dart';
import 'domain/use_case/signout_usecase.dart';
import 'domain/use_case/single_user_usecase.dart';

Future<void> userInjectionContaier() async {
  // bloc/cubit
  sl.registerFactory<AuthCubit>(
      () => AuthCubit(sl.call(), sl.call(), sl.call()));
  sl.registerFactory<CredentialsCubit>(() => CredentialsCubit(
      logInUsecase: sl.call(),
      signUpUsecase: sl.call(),
      forgotPasswordUsecase: sl.call(),
      googleAuthUsecase: sl.call()));

  // usercase
  sl.registerLazySingleton<AllUserUsecase>(() => AllUserUsecase(sl.call()));
  sl.registerLazySingleton<CreateUserUsecase>(
      () => CreateUserUsecase(sl.call()));
  sl.registerLazySingleton<CurrentUserIdUsecase>(
      () => CurrentUserIdUsecase(sl.call()));
  sl.registerLazySingleton<ForgotPasswordUsecase>(
      () => ForgotPasswordUsecase(sl.call()));
  sl.registerLazySingleton<GoogleAuthUsecase>(
      () => GoogleAuthUsecase(sl.call()));
  sl.registerLazySingleton<IsLogInUsecase>(() => IsLogInUsecase(sl.call()));
  sl.registerLazySingleton<LogInUsecase>(() => LogInUsecase(sl.call()));
  sl.registerLazySingleton<SignOutUsecase>(() => SignOutUsecase(sl.call()));
  sl.registerLazySingleton<SignUpUsecase>(() => SignUpUsecase(sl.call()));
  sl.registerLazySingleton<SingleUserUsecase>(
      () => SingleUserUsecase(sl.call()));
  sl.registerLazySingleton<UpdateUserUsecase>(
      () => UpdateUserUsecase(sl.call()));

  // repository
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remotDataSource: sl.call()));

  // remote data source
  sl.registerLazySingleton<UserRemotDataSource>(
      () => UserRemotDataSourceImpl(auth: sl.call(), firstore: sl.call()));
}
