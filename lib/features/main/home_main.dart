import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeMainPage extends StatelessWidget {
  const HomeMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 120.h,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Image.asset(
            "assets/images/icon2.png",
            width: 60.w,
            height: 60.w,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          "메인 화면",
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

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(40.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.r),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("화요일   11월 30일 월요일", style: TextStyle(fontSize: 32.w)),
                    SizedBox(height: 20.h),
                    Text(
                      "• 침구류 빨래",
                      style: TextStyle(fontSize: 36.w, color: Colors.orange),
                    ),
                    Text(
                      "• 분리수거",
                      style: TextStyle(fontSize: 36.w, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 60.h),

            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 786.w,
                  height: 1179.h,
                  child: Image.asset(
                    "assets/images/mainscreen.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 80.h,
                  left: 50.w,
                  child: _menuButton(
                    title: "공간 검색",
                    color: Color(0xFFB6DDFF),
                    icon: Icons.search,
                    iconColor: Color(0xFF939393),
                  ),
                ),
                Positioned(
                  top: 80.h,
                  right: 50.w,
                  child: _menuButton(
                    title: "분석",
                    color: Color(0xFFFFB36E),
                    icon: Icons.bar_chart_rounded,
                    iconColor: Color(0xFF939393),
                  ),
                ),
                Positioned(
                  bottom: 10.h,
                  left: 50.w,
                  child: _menuButton(
                    title: "스케줄",
                    color: Color(0xFFFA9EFA),
                    icon: Icons.calendar_month_rounded,
                    iconColor: Color(0xFF939393),
                  ),
                ),
              ],
            ),

            SizedBox(height: 80.h),
          ],
        ),
      ),
    );
  }

  Widget _menuButton({
    required String title,
    required Color color,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      width: 330.w,
      height: 400.h,
      decoration: BoxDecoration(
        color: color.withOpacity(0.35),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 90.w, color: iconColor),
          SizedBox(height: 20.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 36.w,
              fontWeight: FontWeight.w600,
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }
}
