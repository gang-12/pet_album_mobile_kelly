import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petAblumMobile/core/theme/app_colors.dart';
import 'package:petAblumMobile/core/theme/app_fonts_style_suit.dart';
import 'package:petAblumMobile/features/presentation/pages/album_crud/album_view.dart';

/// 앨범 아이템 위젯
class AlbumGridItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isBookmarked;
  final VoidCallback? onTap; // kebab 메뉴 → 바텀시트 호출

  const AlbumGridItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.isBookmarked,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double itemWidth = constraints.maxWidth;
        final double imageHeight = itemWidth * 4 / 3; // 3:4 비율

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // 이미지 박스 (3:4 비율)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AlbumViewPage(),
                  ),
                );
              },
              child: Container(
                width: itemWidth,
                height: imageHeight,
                decoration: BoxDecoration(
                  color: AppColors.gray02,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x14000000), // rgba(0,0,0,0.08)
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: imageUrl.isNotEmpty
                      ? Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )
                      : const SizedBox.shrink(),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // 타이틀 + kebab 메뉴
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.body16M120.copyWith(
                      color: AppColors.f05,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: SvgPicture.asset(
                    'assets/system/icons/icon_kebab_menu.svg',
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      AppColors.f05,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}