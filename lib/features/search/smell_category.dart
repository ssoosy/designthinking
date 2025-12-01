import 'package:design_thinking/features/search/laundry_category.dart';
import 'package:design_thinking/features/search/sweat_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:design_thinking/features/level/level_page.dart';

class SmellCategory extends StatelessWidget {
  const SmellCategory({super.key});

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
                MaterialPageRoute(builder: (context) => const LaundryCategory()),
              );
            },
            child: Icon(Icons.arrow_back_ios_new, size: 46.w, color: Colors.black),
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

          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 300.h),

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

                  Text(
                    "냄새 제거",
                    style: TextStyle(
                      fontSize: 90.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 167.h),

                  _categoryButton("땀 냄새 제거", context, SweatDetail()),
                  SizedBox(height: 130.h),
                  _categoryButton("음식 냄새 제거", context, SmellCategory()),
                  SizedBox(height: 130.h),
                  _categoryButton("세탁 냄새(곰팡이 냄새) 제거", context, SmellCategory()),
                  SizedBox(height: 130.h),
                  _categoryButton("운동복 냄새 제거", context, SmellCategory()),
                  SizedBox(height: 130.h),
                  _categoryButton("수건 냄새 제거", context, SmellCategory()),

                  SizedBox(height: 200.h),
                ],
              ),
            ),
          ),
        ],
      ),

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

  Widget _categoryButton(String title, BuildContext context, Widget page) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },child: Container(
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
    )
    );
  }
}
