import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key});

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
          ),
        ),
        title: Text(
          "내 자취 레벨",
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 프로필 정보 + 수정 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/expert.png",
                        width: 110.w,
                        height: 110.w,
                      ),
                      SizedBox(width: 20.w),
                      Text(
                        "자취 고수",
                        style: TextStyle(
                          fontSize: 50.w,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.w,
                      vertical: 18.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    child: Text(
                      "내 정보 수정하기",
                      style: TextStyle(fontSize: 32.w, color: Colors.black),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40.h),

              /// 점수 영역
              Text(
                "115점",
                style: TextStyle(fontSize: 80.w, fontWeight: FontWeight.w800),
              ),
              Text(
                "자취의 신 승급까지 : 35",
                style: TextStyle(fontSize: 30.w, color: Colors.grey),
              ),

              SizedBox(height: 20.h),

              /// Progress Bar
              Container(
                width: double.infinity,
                height: 30.h,
                decoration: BoxDecoration(
                  color: Color(0xFFE7F0FF),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 115 / 150,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF5CA9FF),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 50.h),

              /// 캘린더 박스
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(40.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(color: Color(0xFFD4D4D4), width: 3),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        7,
                        (i) => Text(
                          "${11 + i}/5",
                          style: TextStyle(fontSize: 34.w, color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        7,
                        (i) => Icon(
                          Icons.circle,
                          size: 26.w,
                          color: i % 2 == 0 ? Colors.orange : Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50.h),

              /// 자취 레벨 등급 제목
              Text(
                "자취 레벨 등급",
                style: TextStyle(fontSize: 40.w, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 30.h),

              /// 그래프 4개
              _levelBar("자취 초보", 0.4, Colors.lightBlue),
              _levelBar("자취 하수", 0.55, Colors.blue),
              _levelBar("자취 고수", 0.8, Colors.blueAccent),
              _levelBar("자취의 신", 1.0, Colors.cyanAccent),

              SizedBox(height: 80.h),
            ],
          ),
        ),
      ),
    );
  }

  /// 커스텀 레벨 바
  Widget _levelBar(String title, double value, Color color) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Row(
        children: [
          SizedBox(
            width: 200.w,
            child: Text(title, style: TextStyle(fontSize: 34.w)),
          ),
          Expanded(
            child: Container(
              height: 26.h,
              decoration: BoxDecoration(
                color: Color(0xFFEDEDED),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: value,
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
