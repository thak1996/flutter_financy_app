import 'package:flutter_financy_app/app/view/authentication/onboarding/onboarding_page.dart';
import 'package:flutter_financy_app/app/view/authentication/sign_in/sign_in_page.dart';
import 'package:flutter_financy_app/app/view/authentication/sign_up/sign_up_page.dart';
import 'package:flutter_financy_app/app/view/authentication/splash/splash_page.dart';
import 'package:flutter_financy_app/app/view/home/home_page_view.dart';
import 'package:flutter_financy_app/app/common/constants/routes.dart';
import 'package:flutter_financy_app/app/view/home/profile_page/profile_page.dart';
import 'package:flutter_financy_app/app/view/home/stats_page/stats_page.dart';
import 'package:flutter_financy_app/app/view/home/wallet_page/wallet_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Financy App',
      initialRoute: NamedRoute.splash,
      routes: {
        NamedRoute.initial: (context) => const OnBoardingPage(),
        NamedRoute.splash: (context) => const SplashPage(),
        NamedRoute.signUp: (context) => const SignUpPage(),
        NamedRoute.signIn: (context) => const SignInPage(),
        NamedRoute.home: (context) => const HomePageView(),
        NamedRoute.stats: (context) => const StatsPage(),
        NamedRoute.wallet: (context) => const WalletPage(),
        NamedRoute.profile: (context) => const ProfilePage(),
      },
    );
  }
}
