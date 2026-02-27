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



# 1. 공통 AppBar 구조 정리 
(common_app_bar_main_scaffold, common_app_back_bar_scaffold)

✅ 수정 내용

- 좌·우 패딩 기준을 명확히 통일
- 스크롤 시 AppBar 색상 변형 현상 제거
- 불필요한 leading 커스터마이징 제거

🔧 상세 변경

- titleSpacing: 20  
  → 타이틀 좌측 여백 20px 고정

- actionsPadding: EdgeInsets.only(right: 20)
  → 액션 버튼 우측 여백 20px 고정

- surfaceTintColor: Colors.transparent
  → 스크롤 시 AppBar 색이 변하는 현상 제거

- ❌ 아래 코드 삭제
leadingWidth: 120,
leading: leadingContent == null
? null
: Padding(
padding: leadingPadding ?? EdgeInsets.zero,
child: leadingContent,
),
 
  → AppBar 기본 레이아웃 깨짐 원인이어서 제거


# 앨범 페이지 AppBar 수정
(album_page.dart)

✅ 수정 내용

- 우측 액션을 “검색 + 선택”으로 명확히 구성
- 아이콘 + 텍스트 버튼 정상 노출



# 앨범 페이지 레이아웃 수정 
(album_page.dart)

✅ 수정 내용

- 전체 페이지 패딩을 디자인 기준에 맞게 통일
- Grid 간격을 Figma 기준에 맞게 재조정

🔧 변경 사항

- 페이지 패딩
- 헤더와 Grid 사이 여백
- GridView 설정
  → 이미지(218) + 타이틀 영역(~40) 기준 비율 계산

# 홈 화면 AppBar 정리
(home_page)

✅ 수정 내용

- 불필요한 앱 아이콘 버튼 제거

❌ 삭제
IconButton(
icon: const Icon(Icons.apps),
onPressed: () {},
),


# BottomSheet 스타일 수정
✅ 수정 내용

- 배경색 및 라운드 값 디자인 기준 반영
- 아이콘 svg 변경

# 앨범 생성 버튼 동작 및 아이콘 수정

✅ 수정 내용

- 홈 화면에서 “앨범 생성” 역할로 명확히 변경
- SVG 아이콘 색상 문제 해결
- 클릭 시 앨범 편집 페이지로 이동

# 앨범 페이지 레이아웃 수정

album_page.dart

✅ 수정 목적

- Figma 디자인 기준과 실제 구현 화면 간의 레이아웃 차이 해소
- 앨범 카드 정렬 및 간격을 통일해 시각적 일관성 확보

🔧 주요 변경 사항

1. 페이지 기본 레이아웃
- 전체 페이지 패딩을 디자인 기준에 맞게 통일
- 헤더 영역과 Grid 영역 사이 여백 재조정

2. GridView 설정
- 세로 카드 간격 조정
  → mainAxisSpacing: 20

- 가로 간격은 별도 spacing 없이 좌우 padding으로 제어
  → crossAxisSpacing: 0

- 카드 비율 재계산 및 적용
  → 이미지 영역(218px) + 타이틀 영역(약 40px)을 기준으로
  → childAspectRatio 설정