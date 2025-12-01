import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CleanCategory extends StatelessWidget {
  const CleanCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // 배경 위까지 확장
      backgroundColor: Colors.white,

      appBar: AppBar(
        toolbarHeight: 200.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 40.w),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 60.w,
            color: Colors.black,
          ),
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
            child: Icon(Icons.person, size: 80.w, color: Colors.black87),
          ),
        ],
      ),

      body: Stack(
        children: [
          /// ⭐ 배경 이미지
          Positioned.fill(
            top: 700.h, // 원하는 만큼 이미지 아래로 이동
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/images/mainscreen.png",
                height: 1400.h, // 기기 가로 너비에 맞춤
                fit: BoxFit.fitWidth, // 가로 기준으로 축소 (세로는 자동)
              ),
            ),
          ),

          /// UI CONTENT
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 300.h),

                  /// 검색창
                  Row(
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

                  SizedBox(height: 80.h),

                  /// 제목
                  Text(
                    "청소",
                    style: TextStyle(
                      fontSize: 90.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 167.h),

                  _categoryButton("주방"),
                  SizedBox(height: 130.h),
                  _categoryButton("바닥/바닥청소"),
                  SizedBox(height: 130.h),
                  _categoryButton("욕실"),
                  SizedBox(height: 130.h),
                  _categoryButton("벽/벽지"),
                  SizedBox(height: 130.h),
                  _categoryButton("기타 청소 영역"),

                  SizedBox(height: 200.h),
                ],
              ),
            ),
          ),
        ],
      ),

      /// bottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        iconSize: 70.w,
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

  /// 버튼 UI
  Widget _categoryButton(String title) {
    return Container(
      width: double.infinity,
      height: 120.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: Colors.grey, width: 3.w),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF939393),
            blurRadius: 10.r,
            offset: Offset(2.w, 4.h),
          ),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 42.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xFF939393),
        ),
      ),
    );
  }
}
