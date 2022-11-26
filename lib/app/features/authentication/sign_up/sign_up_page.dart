import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_financy_app/app/common/constants/app_colors.dart';
import 'package:flutter_financy_app/app/common/constants/app_text_styles.dart';
import 'package:flutter_financy_app/app/common/widgets/custom_text_form_field.dart';
import 'package:flutter_financy_app/app/common/widgets/multi_text_button.dart';
import 'package:flutter_financy_app/app/common/widgets/password_form_field.dart';
import 'package:flutter_financy_app/app/common/widgets/primary_button.dart';
import 'package:flutter_financy_app/app/features/authentication/sign_up/sign_up_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpStore store = Modular.get<SignUpStore>();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: ListView(
        children: [
          _headerSingUp(),
          _bodySingUp(key: key),
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

Form _bodySingUp({required GlobalKey<FormState> key}) {
  return Form(
    key: key,
    child: Column(
      children: [
        CustomTextFormField(
          labelText: 'your name',
          keyboardType: TextInputType.name,
          enableSuggestions: true,
        ),
        CustomTextFormField(
          labelText: 'your email',
          keyboardType: TextInputType.emailAddress,
          enableSuggestions: true,
        ),
        PasswordFormField(
          labelText: 'choose your password',
          keyboardType: TextInputType.visiblePassword,
        ),
        PasswordFormField(
          labelText: 'confirm your password',
          keyboardType: TextInputType.visiblePassword,
        ),
        PrimaryButton(
          padding: const EdgeInsets.only(top: 30, bottom: 10),
          text: 'Sign Up',
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
                color: AppColors.lightGrey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
