import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_financy_app/app/common/constants/app_colors.dart';
import 'package:flutter_financy_app/app/common/constants/app_text_styles.dart';
import 'package:flutter_financy_app/app/common/constants/routes.dart';
import 'package:flutter_financy_app/app/common/utils/validator.dart';
import 'package:flutter_financy_app/app/common/widgets/custom_bottom_sheet.dart';
import 'package:flutter_financy_app/app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter_financy_app/app/common/widgets/custom_text_form_field.dart';
import 'package:flutter_financy_app/app/common/widgets/multi_text_button.dart';
import 'package:flutter_financy_app/app/common/widgets/password_form_field.dart';
import 'package:flutter_financy_app/app/common/widgets/primary_button.dart';
import 'package:flutter_financy_app/app/locator.dart';
import 'package:flutter_financy_app/app/view/authentication/sign_in/sign_in_controller.dart';
import 'package:flutter_financy_app/app/view/authentication/sign_in/sign_in_state.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _controller = locator.get<SignInController>();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () {
        if (_controller.state is SignInStateLoading) {
          showDialog(
            context: context,
            builder: (context) => const CustomCircularProgressIndicator(),
          );
        }
        if (_controller.state is SignInStateSuccess) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, NamedRoute.home);
        }
        if (_controller.state is SignInStateError) {
          final error = _controller.state as SignInStateError;
          Navigator.pop(context);
          customModalBottomSheet(
            context,
            content: error.message,
            buttonText: "Tentar novamente",
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            _headerSingUp(),
            _bodySingUp(
              formKey: _formKey,
              emailController: _emailController,
              passwordController: _passwordController,
              controller: _controller,
            ),
            _footerSingUp(context),
          ],
        ),
      ),
    );
  }
}

Padding _headerSingUp() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          'Welcome Back',
          style: AppTextStyles.mediumText.apply(
            color: AppColors.greenTwo,
          ),
        ),
        const SizedBox(height: 10),
        Image.asset('assets/images/signIn.png'),
      ],
    ),
  );
}

Form _bodySingUp({
  required GlobalKey<FormState> formKey,
  required TextEditingController passwordController,
  required TextEditingController emailController,
  required SignInController controller,
}) {
  return Form(
    key: formKey,
    child: Column(
      children: [
        CustomTextFormField(
          labelText: 'your email',
          keyboardType: TextInputType.emailAddress,
          enableSuggestions: true,
          hintText: 'email@email.com',
          validator: Validator.validateEmail,
          textInputAction: TextInputAction.next,
          controller: emailController,
        ),
        PasswordFormField(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          controller: passwordController,
          labelText: 'your password',
          keyboardType: TextInputType.visiblePassword,
          hintText: '***********',
          validator: Validator.validatePassword,
          textInputAction: TextInputAction.next,
          helperText:
              'Must have at least 8 characters, 1 capital letter and 1 number.',
        ),
        PrimaryButton(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          text: 'Sign Up',
          onPressed: () {
            final valid = formKey.currentState != null &&
                formKey.currentState!.validate();
            if (valid) {
              controller.doSignIn(
                email: emailController.text,
                password: passwordController.text,
              );
              log('Sign in = Logando');
            } else {
              log('erro ao logar');
            }
          },
        ),
      ],
    ),
  );
}

MultTextButton _footerSingUp(context) {
  return MultTextButton(
    onPressed: () => Navigator.pushReplacementNamed(context, NamedRoute.signUp),
    children: [
      Text(
        'Dont\'t Have Account? ',
        style: AppTextStyles.smallText.apply(
          color: AppColors.lightGrey,
        ),
      ),
      Text(
        'Sign Up',
        style: AppTextStyles.smallText.apply(
          color: AppColors.greenTwo,
        ),
      ),
    ],
  );
}
