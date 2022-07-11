import 'package:flutter/material.dart';
import 'Halaman_User.dart';
import 'Halaman_Admin.dart';

class startScreen extends StatefulWidget {
  const startScreen({Key? key}) : super(key: key);
  _startScreenState createState() => _startScreenState();
}

class _startScreenState extends State<startScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => navUser()));
                },
                child: const Text('User'),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => navAdmin()));
                },
                child: const Text('Admin'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
