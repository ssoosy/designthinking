import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({super.key});

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        toolbarHeight: 120.h,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Row(
          children: [
            SizedBox(width: 10.w),
            Icon(Icons.arrow_back_ios_new, size: 46.w, color: Colors.black),
            SizedBox(width: 10.w),
          ],
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
              /// 프로필 + 수정 버튼
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

              /// 점수 + 승급 텍스트(오른쪽)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "115점",
                    style: TextStyle(
                      fontSize: 80.w,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "자취의 신 승급까지 35",
                    style: TextStyle(fontSize: 32.w, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              /// Progress Bar
              Container(
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFE7F0FF),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 115 / 150,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF5CA9FF),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 50.h),

              /// 캘린더 박스
              _calendarBox(),

              SizedBox(height: 50.h),

              /// 자취 레벨 등급 박스
              /// 자취 레벨 등급 박스
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(40.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(color: const Color(0xFFD4D4D4), width: 3),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "자취 레벨 등급",
                      style: TextStyle(
                        fontSize: 40.w,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 15.h),

                    /// 자취 새내기 타이틀
                    _levelBar(
                      "자취 새내기",
                      0.1, // 새내기 시작 비율
                      Color(0xFF939393), // 연한 회색
                      "assets/images/baby.png",
                    ),

                    SizedBox(height: 25.h),

                    _levelBar(
                      "자취 초보",
                      0.4,
                      Color(0xA81F428E),
                      "assets/images/beginner.png",
                    ),
                    _levelBar(
                      "자취 중수",
                      0.55,
                      Color(0xFF0088FF),
                      "assets/images/pro.png",
                    ),
                    _levelBar(
                      "자취 고수",
                      0.8,
                      Color(0xFF83C6FF),
                      "assets/images/expert.png",
                    ),
                    _levelBar(
                      "자취의 신",
                      0.9,
                      Color(0xFF2CE9FF),
                      "assets/images/god.png",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 120.h),
            ],
          ),
        ),
      ),

      /// 하단 네비게이션
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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

  /// ✅ 캘린더 박스 (2주 + 파란/주황 동그라미)
  Widget _calendarBox() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(30.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: const Color(0xFFD4D4D4), width: 3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 범례
          Row(
            children: [
              Icon(Icons.circle, color: Colors.blue, size: 26.w),
              SizedBox(width: 10.w),
              Text("청소 성공", style: TextStyle(fontSize: 30.w)),
              SizedBox(width: 30.w),
              Icon(Icons.circle, color: Colors.orange, size: 26.w),
              SizedBox(width: 10.w),
              Text("빨래 성공", style: TextStyle(fontSize: 30.w)),
              SizedBox(width: 30.w),
              Icon(Icons.close, color: Colors.grey, size: 30.w),
              SizedBox(width: 10.w),
              Text("실패", style: TextStyle(fontSize: 30.w)),
            ],
          ),

          SizedBox(height: 30.h),

          /// 1주차 날짜
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              7,
              (i) => SizedBox(
                width: 80.w,
                child: Text(
                  "11/${(i * 2) + 5}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28.w),
                ),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          /// 1주차 기록
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _calendarCellCircle(Colors.blue),
              _calendarCellCircle(Colors.orange),
              _calendarCellCircle(Colors.blue),
              _calendarCellCross(),
              _calendarCellCircle(Colors.orange),
              _calendarCellCircle(Colors.blue),
              _calendarCellCross(),
            ],
          ),

          SizedBox(height: 24.h),

          /// 2주차 날짜
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              7,
              (i) => SizedBox(
                width: 80.w,
                child: Text(
                  "11/${(i * 2) + 19}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28.w),
                ),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          /// 2주차 기록
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _calendarCellCircle(Colors.orange),
              _calendarCellCircle(Colors.blue),
              _calendarCellCross(),
              _calendarCellCircle(Colors.orange),
              _calendarCellCircle(Colors.blue),
              _calendarCellCircle(Colors.orange),
              _calendarCellCross(),
            ],
          ),

          SizedBox(height: 28.h),

          Text(
            "• 실패가 연속될수록 점수는 큰 폭으로 감소됩니다.\n"
            "• 연속으로 청소와 빨래를 성공하여 레벨을 올려보세요.",
            style: TextStyle(fontSize: 26.w, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  /// 성공(파란/주황 동그라미)
  Widget _calendarCellCircle(Color color) {
    return Container(
      width: 80.w,
      height: 80.h,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD4D4D4), width: 2),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(child: Icon(Icons.circle, size: 34.w, color: color)),
    );
  }

  /// 실패(X)
  Widget _calendarCellCross() {
    return Container(
      width: 80.w,
      height: 80.h,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD4D4D4), width: 2),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(child: Icon(Icons.close, size: 32.w, color: Colors.grey)),
    );
  }

  /// 레벨 바 (폭 넓게 + 오른쪽 아이콘)
  Widget _levelBar(String title, double value, Color color, String imgPath) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 레벨 이름 + 캐릭터 이미지
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 36.w,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Image.asset(imgPath, width: 100.w, height: 100.w),
            ],
          ),

          SizedBox(height: 12.h),

          /// Progress bar
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 40.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFEDEDED),
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              FractionallySizedBox(
                widthFactor: value,
                child: Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
