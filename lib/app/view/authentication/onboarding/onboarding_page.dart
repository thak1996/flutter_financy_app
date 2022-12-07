import 'package:flutter_financy_app/app/common/constants/app_colors.dart';
import 'package:flutter_financy_app/app/common/constants/app_text_styles.dart';
import 'package:flutter_financy_app/app/common/constants/routes.dart';
import 'package:flutter_financy_app/app/common/widgets/multi_text_button.dart';
import 'package:flutter_financy_app/app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          _imageOnboarding(),
          _infosOnboarding(context),
        ],
      ),
    );
  }
}

Container _imageOnboarding() {
  return Container(
    color: AppColors.iceWhite,
    padding: const EdgeInsets.all(6),
    child: Image.asset('assets/images/onboarding_img.png'),
  );
}

Container _infosOnboarding(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 30),
    height: MediaQuery.of(context).size.height * .4,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _textTitle(),
        _buttonOnboarding(context),
        _textButton(context),
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

PrimaryButton _buttonOnboarding(context) {
  return PrimaryButton(
    text: 'Get Started',
    onPressed: () => Navigator.pushNamed(context, NamedRoute.signUp),
  );
}

MultTextButton _textButton(context) {
  return MultTextButton(
    onPressed: () => Navigator.pushNamed(context, NamedRoute.signIn),
    children: [
      Text(
        'Already Have Account? ',
        style: AppTextStyles.smallText.apply(color: AppColors.lightGrey),
      ),
      Text(
        'Sign In',
        style: AppTextStyles.smallText.apply(color: AppColors.greenTwo),
      ),
    ],
  );
}
