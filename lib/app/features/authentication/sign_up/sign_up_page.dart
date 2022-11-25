import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_financy_app/app/common/constants/app_colors.dart';
import 'package:flutter_financy_app/app/common/constants/app_text_styles.dart';
import 'package:flutter_financy_app/app/common/components/custom_text_form_field.dart';
import 'package:flutter_financy_app/app/common/components/multi_text_button.dart';
import 'package:flutter_financy_app/app/common/components/password_form_field.dart';
import 'package:flutter_financy_app/app/common/components/primary_button.dart';
import 'package:flutter_financy_app/app/features/authentication/sign_up/sign_up_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final SignUpStore store = Modular.get<SignUpStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: ListView(
        children: [
          _headerSingUp(),
          _bodySingUp(),
          _footerSingUp(),
        ],
      ),
    );
  }
}

Padding _headerSingUp() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 50),
    child: Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          'Start Saving\nYour Money!',
          style: AppTextStyles.mediumText.apply(
            color: AppColors.greelightTwo,
          ),
        ),
        const SizedBox(height: 20),
        Image.asset(
          'assets/images/signUp.png',
        ),
      ],
    ),
  );
}

Form _bodySingUp() {
  return Form(
    child: Column(
      children: const [
        CustomTextFormField(
          labelText: 'your name',
        ),
        CustomTextFormField(
          labelText: 'your email',
        ),
        PasswordFormField(
          labelText: 'choose your password',
        ),
        PasswordFormField(
          labelText: 'confirm your password',
        ),
      ],
    ),
  );
}

_footerSingUp() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 50),
    child: Column(
      children: [
        PrimaryButton(
          text: 'Sign Up',
          onPressed: () => log('Button'),
        ),
        const SizedBox(height: 20),
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
                color: AppColors.lightGrey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
