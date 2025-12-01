import 'package:design_thinking/features/search/smell_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:design_thinking/features/level/level_page.dart';

class SweatDetail extends StatelessWidget {
  const SweatDetail({super.key});

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
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SmellCategory()),
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

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80.h),

              Text(
                "땀 냄새 제거",
                style: TextStyle(
                  fontSize: 80.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 80.h),

              Text(
                "① 식초를 물로 희석해요. (1:4)",
                style: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 30.h),
              Text(
                "• 식초의 산성 성분이 땀 냄새를 중화해요.\n"
                "• 분무기로 뿌려주고 10분 방치해요. (냄새는 남지 않아요)",
                style: TextStyle(fontSize: 38.sp, height: 1.7),
              ),

              SizedBox(height: 30.h),

              Text(
                "② 베이킹 소다로 세탁해요.",
                style: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 30.h),
              Text(
                "• 세탁기를 돌릴 때 베이킹 소다를 두 스푼 넣어요.\n"
                "• 냄새, 세탁조 찌든 때가 같이 제거돼요.",
                style: TextStyle(fontSize: 38.sp, height: 1.7),
              ),

              SizedBox(height: 100.h),

              ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: Image.asset(
                  "assets/images/sweat.png",
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
