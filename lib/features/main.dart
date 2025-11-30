import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'level/level_page.dart'; // 경로 주의

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 2400), // 너가 사용하던 기준 사이즈
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "CleanMate",
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            fontFamily: "Segoe UI",
            useMaterial3: false,
          ),
          home: const LevelPage(), // 첫 화면 지정
        );
      },
    );
  }
}
