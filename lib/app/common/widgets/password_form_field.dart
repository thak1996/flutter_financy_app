// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_financy_app/app/common/constants/app_colors.dart';

import 'package:flutter_financy_app/app/common/widgets/custom_text_form_field.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    Key? key,
    this.controller,
    this.padding,
    this.hintText,
    this.labelText,
    this.textInputType,
    this.textInputAction,
    this.validator,
    this.helperText,
    this.keyboardType,
  }) : super(key: key);
  final TextEditingController? controller;
  final EdgeInsets? padding;
  final String? hintText;
  final String? labelText;
  final TextInputType? textInputType;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final String? helperText;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: isHidden,
      validator: widget.validator,
      controller: widget.controller,
      padding: widget.padding,
      hintText: widget.hintText,
      labelText: widget.labelText,
      helperText: widget.helperText,
      keyboardType: widget.keyboardType,
      suffixIcon: InkWell(
        onTap: () => setState(() => isHidden = !isHidden),
        borderRadius: BorderRadius.circular(23),
        child: Icon(
          isHidden ? Icons.visibility : Icons.visibility_off,
          color: AppColors.greenTwo,
        ),
      ),
    );
  }
}
