import 'package:flutter_financy_app/app/services/auth_service.dart';
import 'package:flutter_financy_app/app/services/firebase_auth_service.dart';
import 'package:flutter_financy_app/app/services/secure_storage.dart';
import 'package:flutter_financy_app/app/view/authentication/sign_in/sign_in_controller.dart';
import 'package:flutter_financy_app/app/view/authentication/sign_up/sign_up_controller.dart';
import 'package:flutter_financy_app/app/view/authentication/splash/splash_controle.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<AuthService>(() => FirebaseAuthService());
  locator.registerFactory<SignInController>(
      () => SignInController(locator.get<AuthService>()));
  locator.registerFactory<SignUpController>(
      () => SignUpController(locator.get<AuthService>()));
  locator.registerFactory<SplashController>(
      () => SplashController(const SecureStorage()));
}
