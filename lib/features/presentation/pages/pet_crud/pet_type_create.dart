import 'package:flutter/material.dart';
import 'package:petAblumMobile/core/theme/app_fonts_style_suit.dart';
import 'package:petAblumMobile/core/widgets/common_app_back_bar_scaffold.dart';
import 'package:petAblumMobile/core/theme/app_colors.dart';
import 'package:petAblumMobile/features/presentation/pages/pet_crud/pet_info_form.dart';

class PetTypCreatePage extends StatelessWidget {
  const PetTypCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonBackAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 16),
            _TitleText(),
            SizedBox(height: 120), // 👈 여기 120 줌
            _PetTypeRow(),
          ],
        ),
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText();

  @override
  Widget build(BuildContext context) {
    return Text(
      '어떤 반려동물을\n키우고 계신가요?',
      style: AppTextStyle.titlePage28Sb130.copyWith(
        color: AppColors.f05,
      ),
    );
  }
}

/// 반려동물 선택 Row
class _PetTypeRow extends StatelessWidget {
  const _PetTypeRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _PetTypeCard(
            label: '강아지',
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _PetTypeCard(
            label: '고양이',
          ),
        ),
      ],
    );
  }
}

/// 반려동물 선택 카드
class _PetTypeCard extends StatelessWidget {
  final String label;

  const _PetTypeCard({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const PetInfoEditor(),
          ),
        );
      },
      child: Container(
        height: 207,
        padding: const EdgeInsets.fromLTRB(57, 12, 57, 12),
        decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.gray01,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Text(
              label,
              style: AppTextStyle.body16M120.copyWith(
                color: AppColors.f05,
              ),
            ),
          ],
        ),
      ),
    );
  }
}