import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BathroomClean extends StatefulWidget {
  const BathroomClean({super.key});

  @override
  State<BathroomClean> createState() => _ScheduleDetailPageState();
}

class _ScheduleDetailPageState extends State<BathroomClean> {
  bool isSuccess = false;
  bool isFail = false;

  String startTime = "오후 10:00";
  String endTime = "오후 11:00";
  String alarmTime = "없음";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// APPBAR
      appBar: AppBar(
        toolbarHeight: 200.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 40.w),
          child: Icon(Icons.close, size: 70.w, color: Colors.black),
        ),
        title: Text(
          "Text",
          style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 40.w),
            child: Text(
              "편집",
              style: TextStyle(fontSize: 48.sp, color: Colors.black),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),

            /// TITLE
            Text(
              "욕실 청소",
              style: TextStyle(fontSize: 80.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10.h),

            /// DATE TEXT
            Text(
              "2025년 11월 24일 화요일\n오후 10시 ~ 오후 11시",
              style: TextStyle(fontSize: 38.sp),
            ),
            SizedBox(height: 20.h),
            Text(
              "반복: 월 1회",
              style: TextStyle(fontSize: 40.sp, color: Colors.red),
            ),

            SizedBox(height: 40.h),

            /// CHECKBOXES
            /// CHECKBOXES
            Row(
              children: [
                Checkbox(
                  value: isSuccess,
                  onChanged: (v) {
                    setState(() {
                      isSuccess = v!;
                      if (v) isFail = false; // 성공 선택 시 실패 해제
                    });
                  },
                ),
                Text(
                  "성공",
                  style: TextStyle(
                    fontSize: 42.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            if (isSuccess)
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(40.w),
                margin: EdgeInsets.only(bottom: 30.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 15.r,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "수고하셨습니다!\nLv +5point!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 52.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "다음 욕실 청소 예정일:\n2025년 12월 1일",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 42.sp),
                    ),
                  ],
                ),
              ),

            Row(
              children: [
                Checkbox(
                  value: isFail,
                  onChanged: (v) {
                    setState(() {
                      isFail = v!;
                      if (v) isSuccess = false; // 실패 선택 시 성공 해제
                    });
                  },
                ),
                Text(
                  "실패",
                  style: TextStyle(
                    fontSize: 42.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            /// SUCCESS BOX
            SizedBox(height: 30.h),

            /// DROPDOWN CARD
            Container(
              padding: EdgeInsets.all(40.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 15.r,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _dropDownRow("시작", startTime, (v) {
                    setState(() => startTime = v!);
                  }),
                  SizedBox(height: 40.h),
                  _dropDownRow("종료", endTime, (v) {
                    setState(() => endTime = v!);
                  }),
                  SizedBox(height: 40.h),
                  _dropDownRow("알림", alarmTime, (v) {
                    setState(() => alarmTime = v!);
                  }),
                ],
              ),
            ),

            SizedBox(height: 50.h),

            /// MEMO BOX
            Text(
              "메모",
              style: TextStyle(fontSize: 46.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20.h),
            Container(
              height: 350.h,
              padding: EdgeInsets.all(40.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 15.r,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "내용을 입력하세요",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),

            SizedBox(height: 180.h),
          ],
        ),
      ),

      /// BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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

  Widget _dropDownRow(String label, String value, Function(String?) onChanged) {
    return Row(
      children: [
        SizedBox(
          width: 200.w,
          child: Text(label, style: TextStyle(fontSize: 44.sp)),
        ),
        Expanded(
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            icon: Icon(Icons.keyboard_arrow_down),
            underline: SizedBox.shrink(),
            items:
                ["오후 10:00", "오후 11:00", "없음"]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
