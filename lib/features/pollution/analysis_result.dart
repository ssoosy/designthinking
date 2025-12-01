import 'package:design_thinking/features/pollution/analysis_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:design_thinking/features/level/level_page.dart';

class AnalysisResult extends StatelessWidget {
  const AnalysisResult({super.key});

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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AnalysisPage()),
                );
              },
              child: Icon(Icons.arrow_back_ios_new, size: 46.w, color: Colors.black),
            ),
            SizedBox(width: 10.w),
          ],
        ),
        title: Text(
          "오염 분석",
          style: TextStyle(
            fontSize: 42.w,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
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
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),

              /// 제목
              Text(
                "오염 분석 결과",
                style: TextStyle(fontSize: 40.w, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 25.h),

              /// 분석 이미지 + 결과 텍스트
              Container(
                padding: EdgeInsets.all(30.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F7F7),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  children: [
                    /// 오염 이미지 (김치)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.asset(
                        "assets/images/kimchi.png",
                        width: 420.w,
                        height: 300.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 30.w),

                    /// 분석 텍스트 영역
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "오염 분석:  김치 국물",
                          style: TextStyle(
                            fontSize: 36.w,
                            fontWeight: FontWeight.w700,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          "오염도:  높음",
                          style: TextStyle(
                            fontSize: 32.w,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          "세척 방법: 얼룩 제거제",
                          style: TextStyle(
                            fontSize: 30.w,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40.h),

              /// 버튼 2개
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [_actionButton("재분석"), _actionButton("선택")],
              ),

              SizedBox(height: 50.h),

              /// 유사 오염 이미지
              Text(
                "유사 오염 이미지",
                style: TextStyle(fontSize: 40.w, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 20.h),

              Wrap(
                spacing: 20.w,
                children: [
                  _similarImageBox("assets/images/ex1.png"),
                  _similarImageBox("assets/images/ex2.png"),
                  _similarImageBox("assets/images/ex3.png"),
                ],
              ),

              SizedBox(height: 18.h),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 28.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    "이미지 더보기",
                    style: TextStyle(fontSize: 28.w, color: Color(0xFF939393)),
                  ),
                ),
              ),

              SizedBox(height: 40.h),

              /// 추천 세탁법
              Text(
                "추천 세탁법",
                style: TextStyle(fontSize: 40.w, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 20.h),

              /// 설명 박스
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(40.w),
                decoration: BoxDecoration(
                  color: Color(0xFFF7F7F7),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "양파 이용 방법",
                          style: TextStyle(
                            fontSize: 38.w,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Icon(Icons.circle, size: 16.w, color: Colors.grey),
                      ],
                    ),
                    SizedBox(height: 22.h),
                    Text(
                      "1. 양파를 강판에 1/4정도 갈아준다",
                      style: TextStyle(fontSize: 34.w),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "2. 갈은 양파를 김치국물 얼룩 위에 올려준다",
                      style: TextStyle(fontSize: 34.w),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "3. 그 상태로 24시간 방치해준 뒤 씻어낸다",
                      style: TextStyle(fontSize: 34.w),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "4. 다른 빨래와 함께 세탁해주면 끝",
                      style: TextStyle(fontSize: 34.w),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _pageNumberBox("1", isSelected: true),
                  SizedBox(width: 20.w),
                  _pageNumberBox("2"),
                ],
              ),

              SizedBox(height: 120.h),
            ],
          ),
        ),
      ),

      /// 네비게이션바
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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

  /// 버튼 UI
  Widget _actionButton(String text) {
    return Container(
      width: 280.w,
      height: 120.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 30.w,
          fontWeight: FontWeight.w400,
          color: Color(0xFF939393),
        ),
      ),
    );
  }

  /// 유사 이미지 박스
  Widget _similarImageBox(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Image.asset(path, width: 200.w, height: 160.h, fit: BoxFit.cover),
    );
  }

  Widget _pageNumberBox(String number, {bool isSelected = false}) {
    return Container(
      width: 60.w,
      height: 60.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isSelected ? Color(0xFF0088FF) : Color(0xFF939393),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Text(
        number,
        style: TextStyle(
          fontSize: 32.w,
          fontWeight: FontWeight.w400,
          color: isSelected ? Color(0xFF0088FF) : Color(0xFF939393),
        ),
      ),
    );
  }
}
