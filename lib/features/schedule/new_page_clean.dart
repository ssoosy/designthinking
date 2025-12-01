import 'package:design_thinking/features/schedule/calender_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './new_page_laundry.dart';

class NewPageClean extends StatefulWidget {
  const NewPageClean({super.key});

  @override
  State<NewPageClean> createState() => _NewPageCleanState();
}

class _NewPageCleanState extends State<NewPageClean> {
  String selectedMainTab = "청소";

  bool c1 = false;
  bool c2 = false;
  bool c3 = false;
  bool c4 = false;
  bool etc = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  MaterialPageRoute(builder: (context) => const CalenderPage()),
                );
              },
              child: Icon(Icons.close, size: 60.w, color: Colors.black87)
          ),
        ),
        title: Text(
          "신규",
          style: TextStyle(
            fontSize: 60.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 40.w),
            child: Center(
              child: Text(
                "추가",
                style: TextStyle(
                  fontSize: 50.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ),
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

              Container(
                height: 120.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  border: Border.all(color: Colors.grey.shade300, width: 3.w),
                ),
                child: Row(children: [_mainTab("청소"), _mainTab("빨래")]),
              ),

              SizedBox(height: 40.h),

              Container(
                padding: EdgeInsets.all(35.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(color: Colors.grey.shade300, width: 3.w),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _rowCheck(
                            "바닥 청소",
                            c1,
                            (v) => setState(() => c1 = v!),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: _rowCheck(
                            "욕실 청소",
                            c2,
                            (v) => setState(() => c2 = v!),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 35.h),
                    Row(
                      children: [
                        Expanded(
                          child: _rowCheck(
                            "물걸레질",
                            c3,
                            (v) => setState(() => c3 = v!),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: _rowCheck(
                            "분리수거",
                            c4,
                            (v) => setState(() => c4 = v!),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 35.h),

                    Row(
                      children: [
                        Checkbox(
                          value: etc,
                          onChanged: (v) => setState(() => etc = v!),
                          side: BorderSide(width: 3.w, color: Colors.grey),
                        ),
                        Expanded(
                          child: Container(
                            height: 100.h,
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.r),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 3.w,
                              ),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "기타 입력",
                                hintStyle: TextStyle(
                                  fontSize: 38.sp,
                                  color: Colors.grey,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40.h),

              Container(
                padding: EdgeInsets.all(35.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(color: Colors.grey.shade300, width: 3.w),
                ),
                child: Column(
                  children: [
                    _timeSettingRow("시작", "2025. 11. 24", "오후 10:00"),
                    SizedBox(height: 30.h),
                    _timeSettingRow("종료", "2025. 11. 24", "오후 11:00"),
                    SizedBox(height: 30.h),
                    _timeSettingRow("알림", "없음", ""),
                    SizedBox(height: 30.h),
                    _timeSettingRow("반복", "월 1회", ""),
                  ],
                ),
              ),

              SizedBox(height: 40.h),

              Container(
                height: 423.h,
                padding: EdgeInsets.all(30.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: Color(0xFFF4F4F4),
                ),
                child: TextField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: "메모",
                    border: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(height: 200.h),
            ],
          ),
        ),
      ),

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

  Widget _mainTab(String txt) {
    bool isSelected = selectedMainTab == txt;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (txt == "빨래") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const NewPageLaundry()),
            );
          } else {
            setState(() => selectedMainTab = txt);
          }
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: Text(
            txt,
            style: TextStyle(
              fontSize: 43.sp,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _rowCheck(String title, bool v, Function(bool?) onChange) {
    return Row(
      children: [
        Checkbox(
          value: v,
          onChanged: onChange,
          side: BorderSide(width: 3.w, color: Colors.grey),
        ),
        Text(title, style: TextStyle(fontSize: 42.sp)),
      ],
    );
  }

  Widget _timeSettingRow(String label, String val1, String val2) {
    return Row(
      children: [
        SizedBox(
          width: 100.w,
          child: Text(
            label,
            style: TextStyle(fontSize: 42.sp, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(width: 20.w),

        Expanded(
          child: Container(
            height: 100.h,
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(color: Colors.grey.shade300, width: 3.w),
            ),
            child: Row(
              children: [
                Expanded(child: Text(val1, style: TextStyle(fontSize: 40.sp))),
                Icon(Icons.arrow_drop_down, size: 55.w),
              ],
            ),
          ),
        ),

        if (val2.isNotEmpty) ...[
          SizedBox(width: 20.w),

          Expanded(
            child: Container(
              height: 100.h,
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(color: Colors.grey.shade300, width: 3.w),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(val2, style: TextStyle(fontSize: 40.sp)),
                  ),
                  Icon(Icons.arrow_drop_down, size: 55.w),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
