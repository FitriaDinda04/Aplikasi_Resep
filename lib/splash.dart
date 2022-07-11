import 'dart:async';
import 'package:flutter/material.dart';
import 'start.dart';

class splashScreen extends StatefulWidget {
  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  startTimer() async {
    var durasi = Duration(seconds: 3);
    return Timer(
      durasi,
      () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => startScreen()),
        );
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Image.asset("images/logoo.png", height: 300, width: 200),
      )),
    );
  }
}
