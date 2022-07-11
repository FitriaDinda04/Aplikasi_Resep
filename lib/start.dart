import 'package:flutter/material.dart';
import 'Halaman_User.dart';
import 'login.dart';

class startScreen extends StatefulWidget {
  const startScreen({Key? key}) : super(key: key);
  _startScreenState createState() => _startScreenState();
}

class _startScreenState extends State<startScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 400,
              ),
              SizedBox(
                height: 40,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => navUser()));
                  },
                  child: Text(
                    'START',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              TextButton(
                  style: TextButton.styleFrom(primary: Colors.blue),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
              Text(
                "Untuk admin !",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
