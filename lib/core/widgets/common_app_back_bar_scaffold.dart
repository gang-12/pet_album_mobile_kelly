import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petAblumMobile/core/theme/app_colors.dart';
import 'package:petAblumMobile/core/theme/app_fonts_style_suit.dart';

class CommonBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;

  const CommonBackAppBar({
    super.key,
    this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.gray00,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      titleSpacing: 0, // title 좌측 간격 0으로 (leading과 바로 붙게)
      actionsPadding: const EdgeInsets.only(right: 20),

      // leading을 없애고 title 안에 뒤로가기 + 텍스트를 함께 배치
      leading: null,
      title: Padding(
        padding: const EdgeInsets.only(left: 20), // 앱바 좌측 패딩 20
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                'assets/system/icons/icon_back.svg',
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  AppColors.f05,
                  BlendMode.srcIn,
                ),
              ),
            ),
            if (title != null) ...[
              const SizedBox(width: 4), // 아이콘-텍스트 간격
              Text(
                title!,
                style: AppTextStyle.subtitle20M120.copyWith(
                  color: AppColors.f05,
                ),
              ),
            ],
          ],
        ),
      ),
      centerTitle: false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}