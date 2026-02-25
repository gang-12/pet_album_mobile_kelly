import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petAblumMobile/core/theme/app_colors.dart';
import 'package:petAblumMobile/core/theme/app_fonts_style_suit.dart';

class CommonMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leadingContent;
  final EdgeInsetsGeometry? leadingPadding;

  const CommonMainAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leadingContent,
    this.leadingPadding,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.gray00,
      elevation: 0,
      surfaceTintColor: Colors.transparent, //스크롤하면 색 달라지는 것 수정

      automaticallyImplyLeading: false,

      titleSpacing: 20, //좌측 패딩 20
      actionsPadding: const EdgeInsets.only(right: 20), //우측 패딩 20

      title: Text(
        title,
        style: AppTextStyle.subtitle20M120.copyWith(
          color: AppColors.f05
        ),
      ),
      actions: actions,

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
