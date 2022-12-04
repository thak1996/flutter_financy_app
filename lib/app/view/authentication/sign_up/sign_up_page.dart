import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_financy_app/app/common/constants/app_colors.dart';
import 'package:flutter_financy_app/app/common/constants/app_text_styles.dart';
import 'package:flutter_financy_app/app/common/utils/uppercase_text_formatter.dart';
import 'package:flutter_financy_app/app/common/utils/validator.dart';
import 'package:flutter_financy_app/app/common/widgets/custom_bottom_sheet.dart';
import 'package:flutter_financy_app/app/common/widgets/custom_text_form_field.dart';
import 'package:flutter_financy_app/app/common/widgets/multi_text_button.dart';
import 'package:flutter_financy_app/app/common/widgets/password_form_field.dart';
import 'package:flutter_financy_app/app/common/widgets/primary_button.dart';
import 'package:flutter_financy_app/app/services/mock_auth_service.dart';
import 'package:flutter_financy_app/app/view/authentication/sign_up/sing_up_controller.dart';
import 'package:flutter_financy_app/app/view/authentication/sign_up/sing_up_state.dart';

import '../../../common/widgets/custom_circular_progress_indicator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _controller = SingUpController(MockAuthService());

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.state is SingUpLoadingState) {
        showDialog(
          context: context,
          builder: (context) => const CustomCircularProgressIndicator(),
        );
      }
      if (_controller.state is SingUpSucessState) {
        Navigator.pop(context);

        /// TODO Colocar Novo local de seguimento da página
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(
                child: Text('Nova tela'),
              ),
            ),
          ),
        );
      }
      if (_controller.state is SingUpErrorState) {
        final error = _controller.state as SingUpErrorState;
        Navigator.pop(context);
        customModalBottomSheet(
          context,
          content: error.message,
          buttonText: "Tentar novamente",
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: ListView(
        children: [
          _headerSingUp(),
          _bodySingUp(
            formKey: _formKey,
            nameController: _nameController,
            emailController: _emailController,
            passwordController: _passwordController,
            controller: _controller,
          ),
          _footerSingUp(),
        ],
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

Form _bodySingUp({
  required GlobalKey<FormState> formKey,
  required TextEditingController passwordController,
  required TextEditingController nameController,
  required TextEditingController emailController,
  required SingUpController controller,
}) {
  return Form(
    key: formKey,
    child: Column(
      children: [
        CustomTextFormField(
          labelText: 'your name',
          keyboardType: TextInputType.name,
          enableSuggestions: true,
          inputFormatters: [UpperCaseTextInputFormatter()],
          hintText: 'JOHN DOE',
          validator: Validator.validateName,
          textInputAction: TextInputAction.next,
          controller: nameController,
        ),
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
          controller: passwordController,
          labelText: 'choose your password',
          keyboardType: TextInputType.visiblePassword,
          hintText: '***********',
          helperText:
              'Must have at least 8 characters, 1 capital letter and 1 number.',
          validator: Validator.validatePassword,
          textInputAction: TextInputAction.next,
        ),
        PasswordFormField(
          labelText: 'confirm your password',
          keyboardType: TextInputType.visiblePassword,
          hintText: '***********',
          textInputAction: TextInputAction.done,
          validator: (value) => Validator.validateConfirmPassword(
            value,
            passwordController.text,
          ),
        ),
        PrimaryButton(
          padding: const EdgeInsets.only(top: 30, bottom: 10),
          text: 'Sign Up',
          onPressed: () {
            final valid = formKey.currentState != null &&
                formKey.currentState!.validate();
            if (valid) {
              controller.doSignUp(
                name: nameController.text,
                email: emailController.text,
                password: passwordController.text,
              );
            } else {
              log('erro ao logar');
            }
          },
        ),
      ],
    ),
  );
}

MultiTextButton _footerSingUp() {
  return MultiTextButton(
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
  );
}
