// album_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petAblumMobile/core/theme/app_colors.dart';
import 'package:petAblumMobile/core/theme/app_text_semantic.dart';
import 'package:petAblumMobile/core/theme/app_fonts_style_suit.dart';
import 'package:petAblumMobile/core/widgets/common_app_bar_main_scaffold.dart';
import 'package:petAblumMobile/features/presentation/pages/album/album_grid_item.dart';
import 'package:petAblumMobile/features/presentation/pages/album/album_common_actions.dart';
import 'package:petAblumMobile/features/presentation/pages/album/album_search_page.dart';
import 'package:petAblumMobile/features/presentation/pages/album_crud/album_view.dart';
class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  late final List<Map<String, String>> albums;
  bool showOnlyBookmarked = false;

  @override
  void initState() {
    super.initState();
    albums = List.from(mockAlbums); // 복사본 생성
  }

  List<Map<String, String>> get filteredAlbums {
    if (!showOnlyBookmarked) return albums;

    return albums
        .where((album) => album['isBookmarked'] == 'true')
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray00,
      appBar: CommonMainAppBar(
        title: '',
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AlbumSearch()),
              );
            },
              icon: SvgPicture.asset(
                'assets/system/icons/icon_search.svg',
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  AppColors.f05, // 아이콘 색
                  BlendMode.srcIn,
                ),
              ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: AppColors.f05,
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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: filteredAlbums.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final album = filteredAlbums[index];

                  return AlbumGridItem(
                    title: album['title']!,
                    imageUrl: album['imageUrl']!,
                    isBookmarked: album['isBookmarked'] == 'true',
                    onTap: () {
                      _handleMenuTap(
                        album['title']!,
                        album['id']!,
                        album['isBookmarked'] == 'true',
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text('나의 앨범', style: AppTextStyle.titlePage28Sb130.
        copyWith(color: AppColors.f05)
        ),
        const Spacer(),
        IconButton(
          icon: SvgPicture.asset(
            showOnlyBookmarked
                ? 'assets/system/icons/icon_bookmark_add.svg'
                : 'assets/system/icons/icon_bookmark.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              AppColors.f05, // 아이콘 색
              BlendMode.srcIn,
            ),
          ),
          onPressed: () {
            setState(() {
              showOnlyBookmarked = !showOnlyBookmarked;
            });
          },
        ),
        _buildAddButton(),
      ],
    );
  }

  Widget _buildAddButton() {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: const Icon(Icons.add, color: Colors.white),
        onPressed: () {

        },
      ),
    );
  }

  void _handleMenuTap(String petName, String petId, bool isBookmarked) {
    showAlbumMenu(
      context: context,
      petName: petName,
      petId: petId,
      isBookmarked: isBookmarked,
      onBookmarkToggle: () => _toggleBookmark(petId),
      onDelete: () => _handleDelete(petId, petName),
    );
  }

  void _handleDelete(String petId, String petName) {
    showDeleteAlbumDialog(
      context: context,
      petName: petName,
      onConfirm: () {
        setState(() {
          albums.removeWhere((album) => album['id'] == petId);
        });
      },
    );
  }

  void _toggleBookmark(String petId) {
    setState(() {
      final index = albums.indexWhere((a) => a['id'] == petId);
      if (index != -1) {
        albums[index]['isBookmarked'] =
        albums[index]['isBookmarked'] == 'true' ? 'false' : 'true';
      }
    });
  }
}