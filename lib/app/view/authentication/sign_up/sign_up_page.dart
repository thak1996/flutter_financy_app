import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_financy_app/app/common/constants/app_colors.dart';
import 'package:flutter_financy_app/app/common/constants/app_text_styles.dart';
import 'package:flutter_financy_app/app/common/utils/uppercase_text_formatter.dart';
import 'package:flutter_financy_app/app/common/utils/validator.dart';
import 'package:flutter_financy_app/app/common/widgets/custom_text_form_field.dart';
import 'package:flutter_financy_app/app/common/widgets/multi_text_button.dart';
import 'package:flutter_financy_app/app/common/widgets/password_form_field.dart';
import 'package:flutter_financy_app/app/common/widgets/primary_button.dart';
import 'package:flutter_financy_app/app/view/authentication/sign_up/sign_up_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpStore store = Modular.get<SignUpStore>();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: ListView(
        children: [
          _headerSingUp(),
          _bodySingUp(key: _key),
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
            color: AppColors.greenTwo,
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
          inputFormatters: [UpperCaseTextInputFormatter()],
          hintText: 'JOHN DOE',
          validator: Validator.validateName,
        ),
        const CustomTextFormField(
          labelText: 'your email',
          keyboardType: TextInputType.emailAddress,
          enableSuggestions: true,
          hintText: 'email@email.com',
          validator: Validator.validateEmail,
        ),
        const PasswordFormField(
          labelText: 'choose your password',
          keyboardType: TextInputType.visiblePassword,
          hintText: '***********',
          helperText:
              'Must have at least 8 characters, 1 capital letter and 1 number.',
          validator: Validator.validatePassword,
        ),
        const PasswordFormField(
          labelText: 'confirm your password',
          keyboardType: TextInputType.visiblePassword,
          hintText: '***********',
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
