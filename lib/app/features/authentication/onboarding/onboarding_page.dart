import 'package:flutter_financy_app/app/common/constants/app_colors.dart';
import 'package:flutter_financy_app/app/common/constants/app_text_styles.dart';
import 'package:flutter_financy_app/app/features/authentication/onboarding/onboarding_store.dart';
import 'package:flutter_financy_app/app/common/widgets/multi_text_button.dart';
import 'package:flutter_financy_app/app/common/widgets/primary_button.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({super.key});
  final OnboardingStore store = Modular.get<OnboardingStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          _imageOnboarding(context: context),
          _infosOnboarding(context: context),
        ],
      ),
    );
  }
}

Container _imageOnboarding({required BuildContext context}) {
  return Container(
    height: MediaQuery.of(context).size.height * .6,
    width: double.infinity,
    color: AppColors.iceWhite,
    padding: const EdgeInsets.all(6),
    child: Image.asset('assets/images/onboarding_img.png'),
  );
}

Container _infosOnboarding({required BuildContext context}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
    height: MediaQuery.of(context).size.height * .4,
    color: AppColors.white,
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _textTitle(),
        PrimaryButton(
          text: 'Get Started',
          onPressed: () => log('Button'),
        ),
        MultiTextButton(
          onPressed: () => log('button'),
          children: [
            Text(
              'Already Have Account? ',
              style: AppTextStyles.smallText.apply(
                color: AppColors.lightGrey,
              ),
            ),
            Text(
              'Sign In',
              style: AppTextStyles.smallText.apply(
                color: AppColors.greelightTwo,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Text _textTitle() {
  return Text(
    textAlign: TextAlign.center,
    'Spend Smater \n Save More',
    style: AppTextStyles.mediumText.apply(
      color: AppColors.greelightTwo,
    ),
  );
}
