import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnalysisResult extends StatefulWidget {
  const AnalysisResult({super.key});

  @override
  State<AnalysisResult> createState() => _AnalysisResultState();
}

class _AnalysisResultState extends State<AnalysisResult> {
  int _selectedIndex = 2;

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
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Icon(Icons.arrow_back_ios_new, size: 46.w, color: Colors.black),
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
              SizedBox(height: 20.h),

              Text(
                "오염 분석 결과",
                style: TextStyle(fontSize: 38.w, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 25.h),

              /// 결과 이미지 + 텍스트
              Container(
                width: double.infinity,
                height: 360.h,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(color: Color(0xFFD4D4D4), width: 3),
                ),
                child: Row(
                  children: [
                    /// 분석된 이미지
                    Container(
                      width: 420.w,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/dirt_sample.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(width: 30.w),

                    /// 텍스트 결과
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("오염 분석: 김치 국물",
                            style: TextStyle(
                              fontSize: 34.w,
                              fontWeight: FontWeight.w700,
                              color: Colors.red,
                            )),
                        SizedBox(height: 10.h),
                        Text("오염도: 높음",
                            style: TextStyle(fontSize: 32.w)),
                        SizedBox(height: 10.h),
                        Text("세척 방법: 얼룩 제거제",
                            style: TextStyle(fontSize: 32.w)),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30.h),

              /// 버튼 2개
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _actionButton("재분석"),
                  _actionButton("선택"),
                ],
              ),

              SizedBox(height: 40.h),

              /// 유사 이미지
              Text(
                "유사 오염 이미지",
                style: TextStyle(fontSize: 38.w, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 20.h),

              Row(
                children: [
                  _smallImage("assets/images/d1.png"),
                  SizedBox(width: 14.w),
                  _smallImage("assets/images/d2.png"),
                  SizedBox(width: 14.w),
                  _smallImage("assets/images/d3.png"),
                  SizedBox(width: 14.w),
                  Container(
                    width: 120.w,
                    height: 120.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      border: Border.all(color: Color(0xFFD4D4D4), width: 3),
                    ),
                    child: Center(
                      child: Text(
                        "이미지\n업로드",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 28.w, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40.h),

              Text(
                "추천 세탁법",
                style: TextStyle(fontSize: 40.w, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 20.h),

              /// 세탁방법 박스
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(35.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(color: Color(0xFFD4D4D4), width: 3),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("양파 이용 방법",
                        style: TextStyle(
                            fontSize: 36.w, fontWeight: FontWeight.w600)),
                    SizedBox(height: 20.h),
                    _washingStep("1. 양파를 강판에 1/4 정도 갈아준다."),
                    _washingStep("2. 갈은 양파를 얼룩 위에 올려준다."),
                    _washingStep("3. 24시간 방치 후 씻어낸다."),
                    _washingStep("4. 다른 빨래와 함께 세탁하면 끝."),
                  ],
                ),
              ),

              SizedBox(height: 120.h),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: 60.w,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "검색"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "스케줄"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_rounded), label: "분석"),
        ],
      ),
    );
  }

  /// 🔹 버튼 위젯
  Widget _actionButton(String text) {
    return Container(
      width: 300.w,
      height: 120.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: Color(0xFFD4D4D4), width: 3),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 34.w, color: Colors.black87),
      ),
    );
  }

  /// 🔹 작은 이미지 위젯
  Widget _smallImage(String path) {
    return Container(
      width: 120.w,
      height: 120.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
      ),
    );
  }

  /// 🔹 세탁 텍스트 행
  Widget _washingStep(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(text, style: TextStyle(fontSize: 32.w)),
    );
  }
}