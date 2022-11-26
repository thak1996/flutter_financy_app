// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_financy_app/app/common/constants/app_colors.dart';
import 'package:flutter_financy_app/app/common/constants/app_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    this.padding,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.floatingLabelBehavior,
    this.enableSuggestions,
    this.textCapitalization,
    this.controller,
    this.maxLength,
    this.maxLines,
    this.textInputAction,
    this.keyboardAppearance,
    this.style,
    this.helperText,
    this.validator,
    this.helperStyle,
    this.suffixIcon,
    this.obscureText,
  }) : super(key: key);
  final EdgeInsets? padding;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool? enableSuggestions;
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  final int? maxLength;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final Brightness? keyboardAppearance;
  final TextStyle? style;
  final String? helperText;
  final FormFieldValidator<String>? validator;
  final TextStyle? helperStyle;
  final Widget? suffixIcon;
  final bool? obscureText;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final defaultBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.greelightTwo,
      width: 1.4,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
      child: TextFormField(
        obscureText: widget.obscureText ?? false,
        validator: widget.validator,
        keyboardAppearance: widget.keyboardAppearance ?? Brightness.light,
        style: widget.style ??
            AppTextStyles.smallText.apply(color: AppColors.greelightTwo),
        textInputAction: widget.textInputAction ?? TextInputAction.none,
        maxLines: widget.maxLines ?? 1,
        maxLength: widget.maxLength,
        controller: widget.controller,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        enableSuggestions: widget.enableSuggestions ?? true,
        keyboardType: widget.keyboardType ?? TextInputType.none,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          helperText: widget.helperText,
          helperStyle: widget.helperStyle ??
              AppTextStyles.inputLabelText.apply(
                color: AppColors.greelightOne,
              ),
          labelText: widget.labelText?.toUpperCase(),
          floatingLabelStyle: AppTextStyles.inputLabelText.apply(
            color: AppColors.darkGrey,
          ),
          labelStyle: AppTextStyles.inputLabelText.apply(
            color: AppColors.darkGrey,
          ),
          floatingLabelBehavior:
              widget.floatingLabelBehavior ?? FloatingLabelBehavior.always,
          hintText: widget.hintText,
          focusedBorder: defaultBorder,
          errorStyle: AppTextStyles.errorText.apply(color: Colors.red),
          errorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(color: Colors.red),
          ),
          enabledBorder: defaultBorder,
          disabledBorder: defaultBorder,
        ),
      ),
    );
  }
}
