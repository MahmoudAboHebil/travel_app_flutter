import 'package:flutter/material.dart';
import 'package:travel_app_flutter/pages/detail_page.dart';
import 'package:travel_app_flutter/pages/navpages/main_page.dart';
import 'package:travel_app_flutter/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: DetailPage(),
    );
  }
}
