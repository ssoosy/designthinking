import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'search/clean_category.dart'; // clean_category 파일 import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 2400), // iPhone 12 기준 (원하는 해상도 변경 가능)
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Cleaning Info',
          home: const CleanCategory(), // 실행 시 clean_category 보여줌
        );
      },
    );
  }
}
