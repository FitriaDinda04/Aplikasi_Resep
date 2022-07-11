import 'package:app/Halaman_Admin.dart';
import 'package:flutter/material.dart';

import 'Halaman_Admin.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: navAdmin(),
    );
  }
}
