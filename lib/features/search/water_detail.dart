import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaterDetail extends StatelessWidget {
  const WaterDetail({super.key});

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
                "바닥 물 자국 제거",
                style: TextStyle(
                  fontSize: 80.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 80.h),

              Text(
                "① 물자국은 ‘건조’가 핵심입니다",
                style: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 30.h),
              Text(
                "• 걸레가 너무 젖어 있으면 발자국 처럼 보입니다.\n"
                "• 완전하게 짜낸 걸레로 다시 한 번 건조 후 닦아주세요.",
                style: TextStyle(fontSize: 38.sp, height: 1.7),
              ),

              SizedBox(height: 30.h),

              Text(
                "② 식초를 물로 희석합니다 (1:30)",
                style: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 30.h),
              Text(
                "• 식초는 중화 작용으로 물때 제거가 가능합니다.\n"
                "• 분사 후에 마른 걸레로 광을 내줍니다.",
                style: TextStyle(fontSize: 38.sp, height: 1.7),
              ),

              SizedBox(height: 100.h),

              ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: Image.asset(
                  "assets/images/water.png",
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
