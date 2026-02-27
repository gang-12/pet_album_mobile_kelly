import 'package:flutter/material.dart';
import 'package:petAblumMobile/core/theme/app_colors.dart';
import 'package:petAblumMobile/core/theme/app_fonts_style_suit.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final FocusNode? focusNode; // 추가

  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.focusNode, // 추가
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity, // 350 고정 → 부모 너비에 맞게
      child: TextField(
        controller: controller,
        focusNode: focusNode, // 추가
        obscureText: obscureText,
        style: AppTextStyle.body16R120.copyWith(
          color: AppColors.f03,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyle.body16R120.copyWith(
            color: AppColors.f03,
          ),
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: AppColors.gray01,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}