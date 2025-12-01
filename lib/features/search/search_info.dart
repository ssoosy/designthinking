import 'package:design_thinking/features/main/home_main.dart';
import 'package:design_thinking/features/search/clean_category.dart';
import 'package:design_thinking/features/search/laundry_category.dart';
import 'package:design_thinking/features/level/level_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInfo extends StatelessWidget {
  const SearchInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,

      appBar: AppBar(
        toolbarHeight: 200.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 40.w),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeMainPage()),
              );
            },child: Icon(
              Icons.arrow_back_ios_new,
              size: 60.w,
              color: Colors.black,
            ),
          )
        ),
        title: Text(
          "정보 검색",
          style: TextStyle(
            fontSize: 60.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 40.w),
            child: GestureDetector(
                onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LevelPage()),
              );
            },
            child: Icon(Icons.person, size: 80.w, color: Colors.black87)
            ),
          ),
        ],
      ),

      body: Stack(
        children: [
          /// ⭐ 배경 이미지
          Positioned.fill(
            top: 700.h,
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/images/mainscreen.png",
                height: 1400.h,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),

          /// UI 영역
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 300.h),

                /// 검색바
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey, width: 1.5),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "키워드를 검색해보세요.",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Icon(Icons.search, size: 40, color: Colors.blue),
                    ],
                  ),
                ),

                SizedBox(height: 60),

                Text(
                  "찾고 싶은 정보\n카테고리를 선택해주세요.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),

                SizedBox(height: 90),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _menuButton(
                      "청소",
                      Color(0xFF76C0FF),
                      "assets/images/sweep.png",
                      context,
                      const CleanCategory(),
                    ),
                    SizedBox(width: 20),
                    _menuButton(
                      "빨래",
                      Color(0xFFFFB36F),
                      "assets/images/laundry.png",
                      context,
                      const LaundryCategory(),
                    ),
                  ],
                ),

                SizedBox(height: 280),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        iconSize: 60.w,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "검색"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "스케줄",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: "분석",
          ),
        ],
      ),
    );
  }

  Widget _menuButton(String title, Color color, String imagePath, BuildContext context, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: 330.w,
        height: 330.h,
        decoration: BoxDecoration(
          color: color.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 200.w,
              height: 300.h,
              fit: BoxFit.contain,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 60.w,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
