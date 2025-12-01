import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KimchiDetail extends StatelessWidget {
  const KimchiDetail({super.key});

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
                "김치 얼룩 제거",
                style: TextStyle(
                  fontSize: 80.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 80.h),

              Text(
                "① 바로 닦아야 해요!",
                style: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 30.h),
              Text(
                "• 키친타월로 가능한 한 빨리 닦아 물기 제거해 주세요\n"
                "• 비비면 안돼요! (섬유 깊숙이 들어갈 수 있어요)",
                style: TextStyle(fontSize: 38.sp, height: 1.7),
              ),

              SizedBox(height: 30.h),

              Text(
                "② 미온수 주방세제 이용하기",
                style: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 30.h),
              Text(
                "• 미지근한 물에 주방세제 1~2방울 넣어주세요.\n"
                "• 10~15분 담근 뒤 손톱으로 살살 문질러주세요.",
                style: TextStyle(fontSize: 38.sp, height: 1.7),
              ),

              SizedBox(height: 30.h),
              Text(
                "③ 미산소계 표백제 사용하기 (흰 옷만 가능!)",
                style: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 30.h),
              Text(
                "• 옥시크린 같은 산소계 표백제는 흰 옷에 사용 가능해요.\n"
                "• 30분~1시간 담가두면 김치 기름이 분해돼요.",
                style: TextStyle(fontSize: 38.sp, height: 1.7),
              ),

              SizedBox(height: 100.h),

              ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: Image.asset(
                  "assets/images/kimchi.png",
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
