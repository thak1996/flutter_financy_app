import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_financy_app/app/common/constants/app_colors.dart';
import 'package:flutter_financy_app/app/common/constants/app_text_styles.dart';
import 'package:flutter_financy_app/app/common/constants/routes.dart';
import 'package:flutter_financy_app/app/common/extensions/sizes.dart';
import 'package:flutter_financy_app/app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter_financy_app/app/locator.dart';
import 'package:flutter_financy_app/app/view/authentication/splash/splash_controle.dart';
import 'package:flutter_financy_app/app/view/authentication/splash/splash_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _splashController = locator.get<SplashController>();

  @override
  void dispose() {
    _splashController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => Sizes.init(context));
    
    _splashController.isUserLogged();
    _splashController.addListener(
      () {
        if (_splashController.state is SplashStateSuccess) {
          Navigator.pushReplacementNamed(context, NamedRoute.home);
          log('Navegar para home');
        } else {
          Navigator.pushReplacementNamed(context, NamedRoute.initial);
          log('Navegar para onboarding');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.greenGradiente,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Financy',
              style: AppTextStyles.bigText.apply(color: AppColors.white),
            ),
            const SizedBox(height: 20),
            const CustomCircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
