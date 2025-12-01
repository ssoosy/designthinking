import 'package:design_thinking/features/level/level_page.dart';
import 'package:design_thinking/features/main/home_main.dart';
import 'package:design_thinking/features/pollution/analysis_page.dart';
import 'package:design_thinking/features/pollution/analysis_result.dart';
import 'package:design_thinking/features/search/clean_category.dart';
import 'package:design_thinking/features/search/floor_category.dart';
import 'package:design_thinking/features/search/kitchen_category.dart';
import 'package:design_thinking/features/start/preference_page.dart';
import 'package:design_thinking/features/start/userinfopage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'search/pot_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 2400),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Cleaning Info',
          home: const LevelPage(),
        );
      },
    );
  }
}
