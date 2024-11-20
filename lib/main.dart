import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalapp/Homepage.dart';
void main() {
  runApp(MyApp()); // تمرير MyApp إلى runApp
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MedicalApp',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: Homepage(), // تحديد الشاشة الرئيسية هنا
        );
      },
    );
  }
}
