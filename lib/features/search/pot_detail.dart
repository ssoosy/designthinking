import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PotDetail extends StatelessWidget {
  const PotDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
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

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80.h),

              Text(
                "냄비 탄 자국",
                style: TextStyle(
                  fontSize: 80.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 80.h),

              Text(
                "① 베이킹소다 + 물 살짝",
                style: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 30.h),
              Text(
                "• 약불로 3~5분 끓이면 탄 자국이 부드러워집니다.\n"
                "• 나무주걱으로 긁어내고 세제로 세척합니다.",
                style: TextStyle(fontSize: 38.sp, height: 1.7),
              ),

              SizedBox(height: 30.h),

              Text(
                "② 콜라 부어 끓이기 (스테인리스 전용)",
                style: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 30.h),
              Text(
                "• 탄 당 성분이 탄 자국을 녹입니다.\n"
                "• 나무주걱으로 긁어내고 세제로 세척합니다.",
                style: TextStyle(fontSize: 38.sp, height: 1.7),
              ),

              SizedBox(height: 100.h),

              ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: Image.asset(
                  "assets/images/pot.png",
                  width: double.infinity,
                  height: 700.h,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 200.h),
            ],
          ),
        ),
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
}
