import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  int selectedDate = 21;

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
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 60.w,
            color: Colors.black,
          ),
        ),
        title: Text(
          "스케줄 관리",
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

      body: Column(
        children: [
          _calendarHeader(),
          _calendarGrid(),
          SizedBox(height: 40.h),
          _scheduleCard(
            "욕실 청소",
            "11:00 AM",
            "1:00 PM",
            const Color(0xFF5CA9FF),
          ),
          SizedBox(height: 30.h),
          _scheduleCard(
            "침구류 빨래",
            "11:00 AM",
            "1:00 PM",
            const Color(0xFFFF8B2D),
          ),
          SizedBox(height: 40.h),
          _addButton(),
        ],
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

  Widget _calendarHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chevron_left, size: 70.w),
            SizedBox(width: 10.w),
            Text(
              "November 2025",
              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 10.w),
            Icon(Icons.chevron_right, size: 70.w),
          ],
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
                ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
                    .map(
                      (d) => Text(
                        d,
                        style: TextStyle(fontSize: 32.sp, color: Colors.grey),
                      ),
                    )
                    .toList(),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget _calendarGrid() {
    List<int?> days = [
      26,
      27,
      28,
      29,
      30,
      31,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23,
      24,
      25,
      26,
      27,
      28,
      29,
      30,
      1,
      2,
      3,
      4,
      5,
      6,
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: days.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisSpacing: 12.h,
        ),
        itemBuilder: (context, index) {
          final day = days[index];
          if (day == null) return SizedBox.shrink();

          bool isHalf = day == 20;
          bool is21 = day == 21;
          bool is22 = day == 22;

          return Stack(
            alignment: Alignment.center,
            children: [
              if (is21 || is22)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff0088FF),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(is21 ? 100.r : 0),
                        right: Radius.circular(is22 ? 100.r : 0),
                      ),
                    ),
                  ),
                ),

              if (isHalf)
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF0088FF),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(100.r),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFF7700),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(100.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              Text(
                "$day",
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w700,
                  color: (is21 || is22 || isHalf) ? Colors.white : Colors.black,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _scheduleCard(String title, String start, String end, Color color) {
    return Container(
      width: 1000.w,
      padding: EdgeInsets.all(35.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 15.r,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.circle, color: color, size: 32.w),
          SizedBox(width: 20.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 44.sp, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            "$start\n$end",
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 34.sp),
          ),
        ],
      ),
    );
  }
  Widget _addButton() {
    return Container(
      width: 1000.w,
      height: 150.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Text(
        "+",
        style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w500),
      ),
    );
  }
}
