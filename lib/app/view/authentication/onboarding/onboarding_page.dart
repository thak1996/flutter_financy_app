import 'package:flutter_financy_app/app/common/constants/app_colors.dart';
import 'package:flutter_financy_app/app/common/constants/app_text_styles.dart';
import 'package:flutter_financy_app/app/common/widgets/multi_text_button.dart';
import 'package:flutter_financy_app/app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          _imageOnboarding( context),
          _infosOnboarding( context),
        ],
      ),
    );
  }
}

Container _imageOnboarding(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * .6,
    width: double.infinity,
    color: AppColors.iceWhite,
    padding: const EdgeInsets.all(6),
    child: Image.asset('assets/images/onboarding_img.png'),
  );
}

Container _infosOnboarding(BuildContext context) {
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
                color: AppColors.greenTwo,
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
      color: AppColors.greenTwo,
    ),
  );
}
