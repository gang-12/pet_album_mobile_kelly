# pet_album_mobile_new

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


#
common_app_back_bar_scaffold
common_app_bar_main_scaffold

titleSpacing: 20, //좌측 패딩 20
actionsPadding: const EdgeInsets.only(right: 20), //우측 패딩 20
--
surfaceTintColor: Colors.transparent, //스크롤하면 색 달라지는 것 수정
--
leadingWidth: 120,
leading: leadingContent == null
? null
: Padding(
padding: leadingPadding ?? EdgeInsets.zero,
child: leadingContent,
), //삭제

#
album_page
actions: [
  IconButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AlbumSearch()),
      );
    },
    icon: SvgPicture.asset(
      'assets/system/icons/search.svg',
      width: 24,
      height: 24,
    ),
  ),
  TextButton(
    onPressed: () {},
    style: TextButton.styleFrom(
      minimumSize: const Size(44, 44),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    child: Text(
      '선택',
      style: AppTextStyle.body16R120.copyWith(
        color: AppColors.f05,
      ),
    ),
  ),
]

# 
body: Padding(
padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),) //상하, 좌우 패딩 20
--
const SizedBox(height: 20),

Expanded(
child: GridView.builder(
itemCount: filteredAlbums.length,
gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2,
crossAxisSpacing: 12, // 실제 가로 여백의 최소값
mainAxisSpacing: 20,  // 세로 간격 20
childAspectRatio: 167 / (218 + 40),
// 이미지 218 + 타이틀 영역 대략 40
),

#
home_page
IconButton(icon: const Icon(Icons.apps), onPressed: () {}), 삭제

#

color: AppColors.gray00, //색 수정
borderRadius: BorderRadius.only(
topLeft: Radius.circular(16),
topRight: Radius.circular(16), //16으로 수정

