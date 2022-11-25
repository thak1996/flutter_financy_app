// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_financy_app/app/common/components/custom_text_form_field.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    Key? key,
    this.controller,
    this.padding,
    this.hintText,
    this.labelText,
  }) : super(key: key);
  final TextEditingController? controller;
  final EdgeInsets? padding;
  final String? hintText;
  final String? labelText;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      padding: widget.padding,
      hintText: widget.hintText,
      labelText: widget.labelText,
      suffixIcon: InkWell(
        onTap: () => log('pressed'),
        child: const Icon(Icons.visibility),
      ),
    );
  }
}
