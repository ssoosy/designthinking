import 'package:design_thinking/features/start/preference_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  String selectedPeople = "";
  String selectedPattern = "";

  Map<String, bool> roomChecks = {
    "침실": false,
    "화장실": false,
    "주방": false,
    "거실": false,
    "방 개수": false,
    "기타 공간": false,
    "베란다": false,
    "드레스룸": false,
    "현관": false,
    "서재": false,
    "창고": false,
    "마루": false,
    "장판": false,
    "카펫/러그": false,
  };

  Map<String, String> dropdownValues = {
    "화장실수": "1개",
    "화장실타입": "건식",
    "주방타입": "건식",
    "방개수": "1개",

    "세탁기 타입": "드럼",
    "세탁기 용량": "10L",
    "건조기 용량": "10L",
  };

  List<String> tools = [
    "유/무선 청소기",
    "로봇 청소기",
    "물걸레 밀대",
    "화장실 청소 솔",
    "세탁기",
    "건조기",
  ];

  List<String> selectedTools = [];

  String washerType = "드럼";
  String washerSize = "10L";
  String dryerSize = "10L";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "어서오세요!",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "사용자에 맞는 서비스를 위해 정보를 입력해주세요!",
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            SizedBox(height: 30.h),

            _sectionTitle("거주 인원"),
            SizedBox(height: 14.h),
            Row(
              children: [
                Expanded(child: _toggleButton("1명")),
                SizedBox(width: 10.w),
                Expanded(child: _toggleButton("2명")),
                SizedBox(width: 10.w),
                Expanded(child: _toggleButton("3명 이상")),
              ],
            ),
            SizedBox(height: 30.h),

            _sectionTitle("주요 생활 패턴"),
            SizedBox(height: 14.h),
            _patternItem("대부분 집에서 생활해요 (재택근무/주부 등)", "집"),
            SizedBox(height: 12.h),
            _patternItem("주로 밖에서 활동해요 (직장인/학생 등)", "외부"),

            SizedBox(height: 30.h),

            _sectionTitle("관리할 공간"),
            SizedBox(height: 14.h),
            _roomContainer(),

            SizedBox(height: 30.h),

            _sectionTitle("구비 도구"),
            SizedBox(height: 16.h),
            _toolsContainer(),

            SizedBox(height: 30.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 100.w,
                    height: 40.h,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD4D4D4),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.w,
                          color: const Color(0xFF939393),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const PreferencePage()),
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

            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) =>
      Text(text, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700));

  Widget _toggleButton(String text) {
    bool selected = selectedPeople == text;
    return GestureDetector(
      onTap: () => setState(() => selectedPeople = text),
      child: Container(
        height: 50.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: selected ? const Color(0xFF0088FF) : const Color(0xFFCCCCCC),
            width: 2,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: selected ? const Color(0xFF0088FF) : const Color(0xFF666666),
          ),
        ),
      ),
    );
  }

  Widget _patternItem(String text, String value) {
    return GestureDetector(
      onTap: () => setState(() => selectedPattern = value),
      child: Row(
        children: [
          Container(
            width: 26.w,
            height: 26.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(
                color:
                    selectedPattern == value
                        ? const Color(0xFF0088FF)
                        : const Color(0xFFBBBBBB),
                width: 2,
              ),
              color:
                  selectedPattern == value
                      ? const Color(0xFF0088FF)
                      : Colors.white,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(child: Text(text, style: TextStyle(fontSize: 18))),
        ],
      ),
    );
  }

  Widget _roomContainer() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 18.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFD4D4D4), width: 2),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: _checkBox("침실")),
              SizedBox(width: 12.w),
              Expanded(child: _checkBox("거실")),
            ],
          ),

          SizedBox(height: 12.h),

          Row(
            children: [
              Expanded(flex: 2, child: _checkBox("화장실")),
              SizedBox(width: 8.w),
              Expanded(
                flex: 2,
                child: _dropdownOnly("화장실수", ["1개", "2개", "3개 이상"]),
              ),
              SizedBox(width: 8.w),
              Expanded(flex: 2, child: _dropdownOnly("화장실타입", ["건식", "습식"])),
            ],
          ),

          SizedBox(height: 20.h),

          Row(
            children: [
              Expanded(child: _checkBox("주방")),
              SizedBox(width: 10.w),
              _dropdownOnly("주방타입", ["건식", "습식"]),
            ],
          ),

          SizedBox(height: 20.h),

          Row(
            children: [
              Expanded(child: _checkBox("방 개수")),
              SizedBox(width: 8.w),
              _dropdownOnly("방개수", ["1개", "2개", "3개 이상"]),
            ],
          ),

          SizedBox(height: 16.h),
          Divider(height: 32.h, color: const Color(0xFFE5E5E5)),

          _multiRow(["기타 공간"]),
          SizedBox(height: 10.h),
          _multiRow(["베란다", "드레스룸", "현관"]),
          SizedBox(height: 10.h),
          _multiRow(["서재", "창고"]),

          SizedBox(height: 20.h),
          Text(
            "바닥 (선택)",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12.h),
          _multiRow(["마루", "장판", "카펫/러그"]),
        ],
      ),
    );
  }

  Widget _toolsContainer() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFD4D4D4), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 12.w,
            runSpacing: 12.w,
            children:
                tools.map((tool) {
                  bool active = selectedTools.contains(tool);
                  return GestureDetector(
                    onTap:
                        () => setState(() {
                          active
                              ? selectedTools.remove(tool)
                              : selectedTools.add(tool);
                        }),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.r),
                        border: Border.all(
                          color:
                              active
                                  ? const Color(0xFF0088FF)
                                  : const Color(0xFFD4D4D4),
                          width: 2,
                        ),
                        color: active ? const Color(0xFF0088FF) : Colors.white,
                      ),
                      child: Text(
                        tool,
                        style: TextStyle(
                          fontSize: 16,
                          color:
                              active ? Colors.white : const Color(0xFF666666),
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),

          if (selectedTools.contains("세탁기")) ...[
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(child: _dropdownOnly("세탁기 타입", ["드럼", "통돌이"])),
                SizedBox(width: 12.w),
                Expanded(child: _dropdownOnly("세탁기 용량", ["10L", "12L", "14L"])),
              ],
            ),
          ],

          if (selectedTools.contains("건조기")) ...[
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(child: _dropdownOnly("건조기 용량", ["10L", "12L", "14L"])),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _checkBox(String title) {
    return GestureDetector(
      onTap: () => setState(() => roomChecks[title] = !roomChecks[title]!),
      child: Row(
        children: [
          Container(
            width: 26.w,
            height: 26.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(
                color:
                    roomChecks[title]!
                        ? const Color(0xFF0088FF)
                        : const Color(0xFFBBBBBB),
                width: 2,
              ),
              color:
                  roomChecks[title]! ? const Color(0xFF0088FF) : Colors.white,
            ),
          ),
          SizedBox(width: 8.w),
          Text(title, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  Widget _dropdownOnly(String key, List<String> items) {
    return Container(
      width: 90.w,
      height: 38.h,
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFD4D4D4), width: 2),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValues[key],
          isExpanded: true,
          items:
              items.map((e) {
                return DropdownMenuItem<String>(
                  value: e,
                  child: Text(e, style: TextStyle(fontSize: 14)),
                );
              }).toList(),
          onChanged: (value) {
            setState(() {
              dropdownValues[key] = value!;
            });
          },
        ),
      ),
    );
  }

  Widget _multiRow(List<String> items) {
    return Wrap(
      spacing: 22.w,
      runSpacing: 12.h,
      children:
          items.map((e) {
            return GestureDetector(
              onTap: () => setState(() => roomChecks[e] = !roomChecks[e]!),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 26.w,
                    height: 26.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(
                        color:
                            roomChecks[e]!
                                ? const Color(0xFF0088FF)
                                : const Color(0xFFBBBBBB),
                        width: 2,
                      ),
                      color:
                          roomChecks[e]!
                              ? const Color(0xFF0088FF)
                              : Colors.white,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Text(e, style: TextStyle(fontSize: 18)),
                ],
              ),
            );
          }).toList(),
    );
  }
}
