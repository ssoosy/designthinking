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
        toolbarHeight: 150.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 46.w,
            color: Colors.black,
          ),
        ),
        title: Text(
          "정보 검색",
          style: TextStyle(
            fontSize: 42.w,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Icon(Icons.person, size: 60.w, color: Colors.black87),
          ),
        ],
      ),

      body: Stack(
        children: [
          /// 배경 이미지
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Center(
              child: Transform.scale(
                scale: 0.70,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.asset("assets/images/mainscreen.png"),
                ),
              ),
            ),
          ),

          /// UI 내용
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60),

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
                    ),
                    SizedBox(width: 20),
                    _menuButton(
                      "빨래",
                      Color(0xFFFFB36F),
                      "assets/images/laundry.png",
                    ),
                  ],
                ),

                SizedBox(height: 280),
              ],
            ),
          ),
        ],
      ),

      /// 🟦 Bottom Navigation Bar 추가
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

  /// 메뉴 버튼 위젯
  Widget _menuButton(String title, Color color, String imagePath) {
    return Container(
      width: 280.w,
      height: 400.h,
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
    );
  }
}
