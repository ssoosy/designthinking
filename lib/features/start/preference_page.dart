import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreferencePage extends StatelessWidget {
  const PreferencePage({super.key});

  Widget _buildCleaningRow(String title, String selected) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 50.w,
              height: 80.h,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 3, color: const Color(0xFFBBBBBB)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(width: 32.w),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 39.w,
                fontFamily: 'Segoe UI',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Container(
          width: 350.w,
          height: 80.h,
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 3, color: const Color(0xFFD9D9D9)),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selected,
                style: TextStyle(
                  color: const Color(0xFFB3B3B3),
                  fontSize: 36.w,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 45.w,
                color: const Color(0xFFB3B3B3),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 80.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "청소 스타일",
                style: TextStyle(fontSize: 42.w, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 40.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 40.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(width: 3, color: const Color(0xFFD4D4D4)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50.w,
                          height: 80.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 3,
                              color: Color(0xFFBBBBBB),
                            ),
                          ),
                        ),
                        SizedBox(width: 32.w),
                        Expanded(
                          child: Text(
                            '매일 조금씩: “매일 15분씩 구역을 나눠서 할래요”',
                            style: TextStyle(
                              fontSize: 36.w,
                              color: Color(0xFF939393),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    Row(
                      children: [
                        Container(
                          width: 50.w,
                          height: 80.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 3,
                              color: Color(0xFFBBBBBB),
                            ),
                          ),
                        ),
                        SizedBox(width: 32.w),
                        Expanded(
                          child: Text(
                            '주말에 한 번에: “주말에 날 잡아서 대청소 할래요”',
                            style: TextStyle(
                              fontSize: 36.w,
                              color: Color(0xFF939393),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 80.h),

              Text(
                "청소 선호도",
                style: TextStyle(fontSize: 42.w, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 40.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 40.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(width: 3, color: Color(0xFFD4D4D4)),
                ),
                child: Column(
                  children: [
                    _buildCleaningRow("바닥 청소", "주 3회 (추천)"),
                    SizedBox(height: 50.h),
                    _buildCleaningRow("물걸레질", "주 1회 (추천)"),
                    SizedBox(height: 50.h),
                    _buildCleaningRow("욕실 청소", "주 1회 (추천)"),
                    SizedBox(height: 50.h),
                    _buildCleaningRow("분리수거", "주 1회 (추천)"),
                  ],
                ),
              ),

              SizedBox(height: 80.h),

              Text(
                "빨래 선호도",
                style: TextStyle(fontSize: 42.w, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 40.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 40.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(width: 3, color: Color(0xFFD4D4D4)),
                ),
                child: Column(
                  children: [
                    _buildCleaningRow("침구류(이불/커버)", "월 1회 (추천)"),
                    SizedBox(height: 50.h),
                    _buildCleaningRow("베개 커버", "월 2회 (추천)"),
                    SizedBox(height: 50.h),
                    _buildCleaningRow("기타 (러그, 커튼 등)", "연 4회 (추천)"),
                  ],
                ),
              ),

              SizedBox(height: 120.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 336.w,
                      height: 120.h,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFFFF),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 2.10.w,
                            color: const Color(0xFF0088FF),
                          ),
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "완료",
                          style: TextStyle(
                            color: const Color(0xFF0088FF),
                            fontSize: 20,
                            fontFamily: 'Segoe UI',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
