import 'package:flutter/material.dart';
import 'package:flutter_financy_app/app/common/constants/app_colors.dart';
import 'package:flutter_financy_app/app/common/constants/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);
  final BorderRadius _borderRadius = BorderRadius.circular(48);
  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shadowColor: Colors.black,
      borderRadius: _borderRadius,
      child: Ink(
        height: 48,
        width: MediaQuery.of(context).size.width * .75,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: onPressed != null
                ? AppColors.greenGradiente
                : AppColors.greyGradiente,
          ),
        ),
        child: InkWell(
          borderRadius: _borderRadius,
          onTap: onPressed,
          child: Align(
            child: Text(
              text,
              style: AppTextStyles.mediumText18.apply(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
