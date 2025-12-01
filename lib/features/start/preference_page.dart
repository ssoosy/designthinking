import 'package:design_thinking/features/main/home_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreferencePage extends StatefulWidget {
  const PreferencePage({super.key});

  @override
  State<PreferencePage> createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  String selectedPeople = "";
  String selectedPattern = "";

  String selectedPlan = "";

  Map<String, bool> cleanChecks = {
    "바닥 청소": false,
    "물걸레질": false,
    "욕실 청소": false,
    "분리수거": false,
    "침구류 (이불/커버)": false,
    "베개 커버": false,
    "기타 (러그, 커튼 등)": false,
  };

  Map<String, String> cleaningFrequency = {
    "바닥 청소": "주 3회",
    "물걸레질": "주 1회",
    "욕실 청소": "주 1회",
    "분리수거": "주 1회",
    "침구류 (이불/커버)": "월 1회",
    "베개 커버": "월 2회",
    "기타 (러그, 커튼 등)": "연 4회",
  };

// 3. [NEW] 드롭다운에 들어갈 선택지 목록
  final List<String> frequencyOptions = [
    "매일",
    "주 3회",
    "주 2회",
    "주 1회",
    "월 2회",
    "월 1회",
    "연 4회",
    "연 2회",
    "연 1회",
  ];

  Widget _buildCleaningRow(String title, String selected) {
    bool isChecked = cleanChecks[title] ?? false;

    Color borderColor = isChecked ? const Color(0xFF0088FF) : const Color(0xFFD9D9D9);
    Color boxColor = isChecked ? Colors.white : const Color(0xFFF5F5F5);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => setState(() => cleanChecks[title] = !isChecked),
          child: Row(
            children: [
              Container(
                width: 50.w, height: 80.h,
                decoration: ShapeDecoration(
                  color: isChecked ? const Color(0xFF0088FF) : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 3, color: isChecked ? const Color(0xFF0088FF) : const Color(0xFFBBBBBB)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(width: 32.w),
              Text(title, style: TextStyle(color: Colors.black, fontSize: 39.w)),
            ],
          ),
        ),

        Container(
          width: 350.w, height: 80.h,
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          decoration: ShapeDecoration(
            color: boxColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 3, color: borderColor),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: cleaningFrequency[title],
              icon: Icon(Icons.keyboard_arrow_down_rounded, size: 45.w, color: isChecked ? const Color(0xFF0088FF) : const Color(0xFFB3B3B3)),
              isExpanded: true,

              items: frequencyOptions.map<DropdownMenuItem<String>>((String option) {

                bool isRecommended = (option == selected);

                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(
                    isRecommended ? "$option (추천)" : option,
                    style: TextStyle(
                      color: isChecked
                          ? (isRecommended ? const Color(0xFF0088FF) : Colors.black)
                          : const Color(0xFFB3B3B3),
                      fontWeight: isRecommended ? FontWeight.bold : FontWeight.w400,
                      fontSize: 36.w,
                    ),
                  ),
                );
              }).toList(),

              onChanged: isChecked
                  ? (val) => setState(() => cleaningFrequency[title] = val!)
                  : null,

              disabledHint: Text(
                cleaningFrequency[title] == selected
                    ? "${cleaningFrequency[title]} (추천)"
                    : cleaningFrequency[title]!,
                style: TextStyle(color: const Color(0xFFB3B3B3), fontSize: 36.w),
              ),
            ),
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
                    _optionRow(
                        "daily",
                        '매일 조금씩: “매일 15분씩 구역을 나눠서 할래요”'
                    ),

                    SizedBox(height: 20.h), // 간격

                    _optionRow(
                        "weekend",
                        '주말에 몰아서: “평일엔 바쁘니 주말에 한 번에 할래요”'
                    ),
                  ],
                )
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
                    _buildCleaningRow("바닥 청소", "주 3회"),
                    SizedBox(height: 50.h),
                    _buildCleaningRow("물걸레질", "주 1회"),
                    SizedBox(height: 50.h),
                    _buildCleaningRow("욕실 청소", "주 1회"),
                    SizedBox(height: 50.h),
                    _buildCleaningRow("분리수거", "주 1회"),
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
                    _buildCleaningRow("침구류 (이불/커버)", "월 1회"),
                    SizedBox(height: 50.h),
                    _buildCleaningRow("베개 커버", "월 2회"),
                    SizedBox(height: 50.h),
                    _buildCleaningRow("기타 (러그, 커튼 등)", "연 4회"),
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
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomeMainPage()),
                            );
                          },
                          child: Text(
                            "완료",
                            style: TextStyle(
                              color: const Color(0xFF0088FF),
                              fontSize: 20,
                              fontFamily: 'Segoe UI',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
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

  Widget _optionRow(String key, String text) {
    bool isSelected = selectedPlan == key;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPlan = key;
        });
      },
      child: Row(
        children: [
          Container(
            width: 50.w,
            height: 80.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isSelected ? const Color(0xFF0088FF) : Colors.transparent,
              border: Border.all(
                width: 3,
                color: isSelected ? const Color(0xFF0088FF) : const Color(0xFFBBBBBB),
              ),
            ),
          ),
          SizedBox(width: 32.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 36.w,
                color: isSelected ? Colors.black : const Color(0xFF939393),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
