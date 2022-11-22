import 'package:flutter_financy_app/common/constants/app_colors.dart';
import 'package:flutter_financy_app/common/constants/app_text_styles.dart';
import 'package:flutter_financy_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _imageOnboarding(context),
          _infosOnboarding(context),
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
    child: Image.asset('assets/images/BrazucaBrowsing.png'),
  );
}

Container _infosOnboarding(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * .4,
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
    color: AppColors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _textTitle(),
        PrimaryButton(
          text: 'Get Started',
          onPressed: () {},
        ),
        _textNewAccount(),
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

_textNewAccount() {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: 'Already Have Account? ',
          style: AppTextStyles.smallText.apply(
            color: AppColors.grey,
          ),
        ),
        TextSpan(
          text: 'Sign In',
          style: AppTextStyles.smallText.apply(
            color: AppColors.greelightTwo,
          ),
        ),
      ],
    ),
  );
}
