import 'package:flutter_modular/flutter_modular.dart';
import 'onboarding/onboarding_page.dart';
import 'onboarding/onboarding_store.dart';
import 'sign_up/sign_up_page.dart';
import 'sign_up/sign_up_store.dart';
import 'splash/splash_page.dart';

class AuthenticationModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => OnboardingStore()),
    Bind.lazySingleton((i) => SignUpStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SplashPage()),
    ChildRoute('/signUpPage/', child: (_, args) => const SignUpPage()),
    ChildRoute('/onBoardingPage/', child: (_, args) => OnBoardingPage()),
  ];
}
