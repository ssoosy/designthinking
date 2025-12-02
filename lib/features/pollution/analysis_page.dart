import 'package:design_thinking/features/main/home_main.dart';
import 'package:design_thinking/features/pollution/analysis_loading.dart';
import 'package:design_thinking/features/pollution/analysis_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:design_thinking/features/level/level_page.dart';
import 'dart:io';

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({super.key});

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
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
        leading: Row(
          children: [
            SizedBox(width: 10.w),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeMainPage()),
                );
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 46.w,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 10.w),
          ],
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
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LevelPage()),
                );
              },
              child: Icon(Icons.person, size: 80.w, color: Colors.black87),
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
              SizedBox(height: 30),

              Text(
                "오염분석",
                style: TextStyle(fontSize: 40.w, fontWeight: FontWeight.w700),
              ),

              SizedBox(height: 20),

              Text(
                "• 사진을 업로드하면 오염을 자동으로 분석해드릴게요.\n"
                "• 오염이 심한 부분을 촬영해서 올려주세요.",
                style: TextStyle(fontSize: 28.w, color: Colors.grey),
              ),

              SizedBox(height: 50.h),

              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: double.infinity,
                  height: 450.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(
                      color: const Color(0xFFD4D4D4),
                      width: 3,
                    ),
                  ),
                  child:
                      _selectedImage == null
                          ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.upload,
                                size: 80.w,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 20.h),
                              Text(
                                "사진을 업로드해주세요",
                                style: TextStyle(
                                  fontSize: 32.w,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                          : ClipRRect(
                            borderRadius: BorderRadius.circular(30.r),
                            child: Image.file(
                              _selectedImage!,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                ),
              ),

              SizedBox(height: 40.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoadingPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 300.w,
                      height: 150.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF939393), width: 1),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Text(
                        "분석",
                        style: TextStyle(
                          fontSize: 36.w,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF939393),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 120.h),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        iconSize: 60.w,
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
}
