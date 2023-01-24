import 'package:flutter/material.dart';
import 'package:waiter_app/src/shared/app_colors.dart';
import 'package:waiter_app/src/shared/app_text_styles.dart';

class Button extends StatelessWidget {
  final String text;
  final Function callback;
  final bool disabled;
  const Button(
      {super.key,
      required this.text,
      required this.callback,
      this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(),
      child: Container(
        padding:
            const EdgeInsets.only(top: 14, bottom: 14, left: 24, right: 24),
        decoration: BoxDecoration(
          color: disabled ? AppColors.bg_3 : AppColors.red,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.body3,
          ),
        ),
      ),
    );
  }
}
